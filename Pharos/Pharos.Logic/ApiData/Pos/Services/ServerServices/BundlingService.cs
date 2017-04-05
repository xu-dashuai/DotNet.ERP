﻿using Pharos.Logic.ApiData.Pos.Sale;
using Pharos.Logic.BLL;
using Pharos.Logic.DAL;
using Pharos.ObjectModels;
using Pharos.ObjectModels.DTOs;
using System;
using System.Linq;

namespace Pharos.Logic.ApiData.Pos.Services
{
    public class BundlingService : BaseGeneralService<Pharos.Logic.Entity.Bundling, EFDbContext>
    {
        public static ProductInfo GetProductInfoFromBundlingByBarcode(string storeId, string barcode, int companyId)
        {
            try
            {
                var query = (from a in CurrentRepository.Entities
                             from b in CommodityPromotionService.CurrentRepository.Entities
                             where a.NewBarcode == barcode && a.CompanyId == companyId && a.CommodityId == b.Id && b.CompanyId == companyId && b.StartDate <= DateTime.Now
                             select new ProductInfo()
                             {
                                 Brand = "",
                                 Category = "",
                                 EnableEditNum = true,
                                 EnableEditPrice = false,
                                 ProductCode = "",
                                 ProductType = ProductType.Bundling,
                                 Size = "",
                                 SystemPrice = a.BundledPrice,
                                 BuyPrice = a.BuyPrices,
                                 Title = a.Title,
                                 Unit = "件"
                             });
                return query.FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}