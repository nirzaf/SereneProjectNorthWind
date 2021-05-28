﻿using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json.Linq;
using SereneTemplate.Administration.Entities;
using Serenity;
using Serenity.Abstractions;
using Serenity.ComponentModel;
using Serenity.Localization;
using Serenity.Navigation;
using Serenity.Services;
using Serenity.Web;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;

namespace SereneTemplate.Administration.Repositories
{
    public class TranslationRepository : BaseRepository
    {
        protected IWebHostEnvironment HostEnvironment { get; }
        protected ILocalTextRegistry LocalTextRegistry { get; }
        protected ITypeSource TypeSource { get; }

        public TranslationRepository(IRequestContext context, IWebHostEnvironment hostEnvironment,
            ILocalTextRegistry localTextRegistry, ITypeSource typeSource)
             : base(context)
        {
            HostEnvironment = hostEnvironment;
            LocalTextRegistry = localTextRegistry;
            TypeSource = typeSource;
        }

        public static string GetUserTextsFilePath(IWebHostEnvironment hostEnvironment, string languageID)
        {
            return Path.Combine(hostEnvironment.ContentRootPath, "App_Data", "texts",
                "user.texts." + (languageID.TrimToNull() ?? "invariant") + ".json");
        }

        public ListResponse<TranslationItem> List(TranslationListRequest request)
        {
            var result = new ListResponse<TranslationItem>();

            var availableKeys = GetAllAvailableLocalTextKeys();
            var targetLanguageID = request.TargetLanguageID.TrimToNull();

            var customTranslations = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

            var textsFilePath = GetUserTextsFilePath(HostEnvironment, targetLanguageID);
            if (File.Exists(textsFilePath))
            {
                var json = JSON.Parse<Dictionary<string, JToken>>(File.ReadAllText(textsFilePath));
                JsonLocalTextRegistration.ProcessNestedDictionary(json, "", customTranslations);
                foreach (var key in customTranslations.Keys)
                    availableKeys.Add(key);
            }

            var sorted = new string[availableKeys.Count];
            availableKeys.CopyTo(sorted);
            Array.Sort(sorted);

            targetLanguageID = targetLanguageID ?? "";
            var sourceLanguageID = request.SourceLanguageID.TrimToEmpty();

            result.Entities = new List<TranslationItem>();

            Func<string, string> effective = delegate (string key)
            {
                if (key.StartsWith("Navigation."))
                {
                    key = key.Substring("Navigation.".Length);
                    return key.Split(new char[] { '/' }).Last();
                }
                else if (key.StartsWith("Forms.") && key.Contains(".Categories."))
                {
                    return key.Split(new char[] { '.' }).Last().TrimToNull();
                }

                return key;
            };

            foreach (var key in sorted)
            {
                string customText;
                if (!customTranslations.TryGetValue(key, out customText))
                    customText = null;

                result.Entities.Add(new TranslationItem
                {
                    Key = key,
                    SourceText = LocalTextRegistry.TryGet(sourceLanguageID, key, false) ?? effective(key),
                    TargetText = LocalTextRegistry.TryGet(targetLanguageID, key, false) ?? effective(key),
                    CustomText = customText
                });
            }

            return result;
        }

        public HashSet<string> GetAllAvailableLocalTextKeys()
        {
            var result = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

            foreach (NavigationItemAttribute attr in TypeSource.GetAssemblyAttributes<NavigationItemAttribute>())
                result.Add("Navigation." + (attr.Category.IsEmptyOrNull() ? "" : attr.Category + "/") + attr.Title);

            foreach (var type in TypeSource.GetTypesWithAttribute(typeof(FormScriptAttribute)))
            {
                var attr = type.GetAttribute<FormScriptAttribute>();
                foreach (var member in type.GetMembers(BindingFlags.Instance | BindingFlags.Public))
                {
                    var category = member.GetCustomAttribute<CategoryAttribute>();
                    if (category != null && !category.Category.IsEmptyOrNull())
                        result.Add("Forms." + attr.Key + ".Categories." + category.Category);
                }
            }

            var repository = LocalTextRegistry as LocalTextRegistry;
            if (repository != null)
                result.AddRange(repository.GetAllTextKeys(false));

            return result;
        }

        public SaveResponse Update(TranslationUpdateRequest request, IServiceProvider services)
        {
            if (request.Translations == null)
                throw new ArgumentNullException("translations");

            var translations = List(new TranslationListRequest
            {
                SourceLanguageID = request.TargetLanguageID,
            }).Entities.ToDictionary(x => x.Key, x => x.CustomText);

            foreach (var item in request.Translations)
                translations[item.Key] = item.Value;

            var result = new SortedDictionary<string, string>(StringComparer.OrdinalIgnoreCase);
            foreach (var pair in translations)
                if (!pair.Value.IsEmptyOrNull())
                    result.Add(pair.Key, pair.Value);

            string json = JSON.StringifyIndented(result, indentation: 2);

            var textsFilePath = GetUserTextsFilePath(HostEnvironment, request.TargetLanguageID);
            Directory.CreateDirectory(Path.GetDirectoryName(textsFilePath));
            File.WriteAllText(textsFilePath, json);

            (LocalTextRegistry as IRemoveAll)?.RemoveAll();
            Startup.InitializeLocalTexts(services);

            Cache.ExpireGroupItems(UserRow.Fields.GenerationKey);
            services.GetService<IDynamicScriptManager>()?.Reset();

            return new SaveResponse();
        }
    }
}
