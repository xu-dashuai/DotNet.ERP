﻿using Pharos.Logic.ApiData.Pos.Sale;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pharos.Store.Retailing.Models
{
    public class SaleRequest
    {
        public string Barcode { get; set; }

        public string StoreId { get; set; }

        public string MachineSn { get; set; }

        public decimal Number { get; set; }

        public decimal SalePrice { get; set; }

        public SaleStatus Status { get; set; }

        public string GiftId { get; set; }

        public string GiftPromotionId { get; set; }

    }
}