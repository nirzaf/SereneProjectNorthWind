﻿using Microsoft.AspNetCore.Mvc;
using OfficeOpenXml;
using SereneTemplate.Northwind.Entities;
using SereneTemplate.Northwind.Repositories;
using Serenity;
using Serenity.Data;
using Serenity.Services;
using Serenity.Web;
using System;
using System.Collections.Generic;
using System.Data;
using MyRow = SereneTemplate.Northwind.Entities.ProductRow;

namespace SereneTemplate.BasicSamples.Endpoints
{
    [Route("Services/BasicSamples/ProductExcelImport/[action]")]
    [ConnectionKey(typeof(MyRow)), ServiceAuthorize]
    public class ProductExcelImportController : ServiceEndpoint
    {
        [HttpPost]
        public ExcelImportResponse ExcelImport(IUnitOfWork uow, ExcelImportRequest request,
            [FromServices] IUploadStorage uploadStorage)
        {
            if (request is null)
                throw new ArgumentNullException(nameof(request));
            if (string.IsNullOrWhiteSpace(request.FileName))
                throw new ArgumentNullException(nameof(request.FileName));

            if (uploadStorage is null)
                throw new ArgumentNullException(nameof(uploadStorage));

            UploadPathHelper.CheckFileNameSecurity(request.FileName);

            if (!request.FileName.StartsWith("temporary/"))
                throw new ArgumentOutOfRangeException(nameof(request.FileName));

            ExcelPackage ep = new ExcelPackage();
            using (var fs = uploadStorage.OpenFile(request.FileName))

                ep.Load(fs);

            var p = ProductRow.Fields;
            var s = SupplierRow.Fields;
            var c = CategoryRow.Fields;

            var response = new ExcelImportResponse();
            response.ErrorList = new List<string>();

            var worksheet = ep.Workbook.Worksheets[0];
            for (var row = 2; row <= worksheet.Dimension.End.Row; row++)
            {
                try
                {
                    var productName = Convert.ToString(worksheet.Cells[row, 1].Value ?? "");
                    if (productName.IsTrimmedEmpty())
                        continue;

                    var product = uow.Connection.TryFirst<ProductRow>(q => q
                        .Select(p.ProductID)
                        .Where(p.ProductName == productName));

                    if (product == null)
                        product = new ProductRow
                        {
                            ProductName = productName
                        };
                    else
                    {
                        // avoid assignment errors
                        product.TrackWithChecks = false;
                    }

                    var supplierName = Convert.ToString(worksheet.Cells[row, 2].Value ?? "");
                    if (!string.IsNullOrWhiteSpace(supplierName))
                    {
                        var supplier = uow.Connection.TryFirst<SupplierRow>(q => q
                            .Select(s.SupplierID)
                            .Where(s.CompanyName == supplierName));

                        if (supplier == null)
                        {
                            response.ErrorList.Add("Error On Row " + row + ": Supplier with name '" +
                                supplierName + "' is not found!");
                            continue;
                        }

                        product.SupplierID = supplier.SupplierID.Value;
                    }
                    else
                        product.SupplierID = null;

                    var categoryName = Convert.ToString(worksheet.Cells[row, 3].Value ?? "");
                    if (!string.IsNullOrWhiteSpace(categoryName))
                    {
                        var category = uow.Connection.TryFirst<CategoryRow>(q => q
                            .Select(c.CategoryID)
                            .Where(c.CategoryName == categoryName));

                        if (category == null)
                        {
                            response.ErrorList.Add("Error On Row " + row + ": Category with name '" +
                                categoryName + "' is not found!");
                            continue;
                        }

                        product.CategoryID = category.CategoryID.Value;
                    }
                    else
                        product.CategoryID = null;

                    product.QuantityPerUnit = Convert.ToString(worksheet.Cells[row, 4].Value ?? "");
                    product.UnitPrice = Convert.ToDecimal(worksheet.Cells[row, 5].Value ?? 0);
                    product.UnitsInStock = Convert.ToInt16(worksheet.Cells[row, 6].Value ?? 0);
                    product.UnitsOnOrder = Convert.ToInt16(worksheet.Cells[row, 7].Value ?? 0);
                    product.ReorderLevel = Convert.ToInt16(worksheet.Cells[row, 8].Value ?? 0);

                    if (product.ProductID == null)
                    {
                        new ProductRepository(Context).Create(uow, new SaveRequest<MyRow>
                        {
                            Entity = product
                        });

                        response.Inserted = response.Inserted + 1;
                    }
                    else
                    {
                        new ProductRepository(Context).Update(uow, new SaveRequest<MyRow>
                        {
                            Entity = product,
                            EntityId = product.ProductID.Value
                        });

                        response.Updated = response.Updated + 1;
                    }
                }
                catch (Exception ex)
                {
                    response.ErrorList.Add("Exception on Row " + row + ": " + ex.Message);
                }
            }

            return response;
        }
    }
}
