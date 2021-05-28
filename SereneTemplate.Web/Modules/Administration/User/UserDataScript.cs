﻿using SereneTemplate.Administration.Entities;
using SereneTemplate.Administration.Repositories;
using Serenity;
using Serenity.Abstractions;
using Serenity.ComponentModel;
using Serenity.Data;
using Serenity.Web;
using System;
using System.Collections.Generic;
using System.Linq;

namespace SereneTemplate.Administration
{
    /// <summary>
    /// This declares a dynamic script with key 'UserData' that will be available from client side.
    /// </summary>
    [DataScript("UserData", CacheDuration = -1, Permission = "*")]
    public class UserDataScript : DataScript<ScriptUserDefinition>
    {
        private ITwoLevelCache Cache { get; }
        private IPermissionService Permissions { get; }
        private ITypeSource TypeSource { get; }
        private IUserAccessor UserAccessor { get; }
        private IUserRetrieveService UserRetriever { get; }

        public UserDataScript(ITwoLevelCache cache, IPermissionService permissions,
            ITypeSource typeSource, IUserAccessor userAccessor, IUserRetrieveService userRetrieveService)
        {
            Cache = cache ?? throw new ArgumentNullException(nameof(cache));
            Permissions = permissions ?? throw new ArgumentNullException(nameof(permissions));
            TypeSource = typeSource ?? throw new ArgumentNullException(nameof(typeSource));
            UserAccessor = userAccessor ?? throw new ArgumentNullException(nameof(userAccessor));
            UserRetriever = userRetrieveService ?? throw new ArgumentNullException(nameof(userRetrieveService));
        }

        protected override ScriptUserDefinition GetData()
        {
            var result = new ScriptUserDefinition();

            if (!(UserAccessor.User?.GetUserDefinition(UserRetriever) is UserDefinition user))
            {
                result.Permissions = new Dictionary<string, bool>();
                return result;
            }

            result.Username = user.Username;
            result.DisplayName = user.DisplayName;
            result.IsAdmin = user.Username == "admin";

            result.Permissions = Cache.GetLocalStoreOnly("ScriptUserPermissions:" + user.Id, TimeSpan.Zero,
                UserPermissionRow.Fields.GenerationKey, () =>
                {
                    var permissions = new Dictionary<string, bool>(StringComparer.OrdinalIgnoreCase);

                    var permissionsUsedFromScript = Cache.GetLocalStoreOnly("PermissionsUsedFromScript",
                        TimeSpan.Zero, RoleRow.Fields.GenerationKey, () =>
                        {
                            return UserPermissionRepository.ListPermissionKeys(Cache.Memory, TypeSource)
                                .Where(permissionKey =>
                                {
                                    // this sends permission information for all permission keys to client side.
                                    // if you don't need all of them to be available from script, filter them here.
                                    // this is recommended for security / performance reasons...
                                    return true;
                                }).ToArray();
                        });

                    foreach (var permissionKey in permissionsUsedFromScript)
                    {
                        if (Permissions.HasPermission(permissionKey))
                            permissions[permissionKey] = true;
                    }

                    return permissions;
                });

            return result;
        }
    }
}
