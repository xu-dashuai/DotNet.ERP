﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.SyncService.SyncEntities
{
    [Serializable]
    public class SalesRecord : SyncDataObject
    {
        /// <summary>
        /// 促销Id
        /// </summary>
        public string MarketingId { get; set; }
        /// <summary>
        /// 商店Id
        /// </summary>
        public string StoreId { get; set; }
        /// <summary>
        /// 剩余销售数
        /// </summary>
        public decimal Number { get; set; }
        /// <summary>
        /// 日期 （每日限购不能为空）
        /// </summary>
        public DateTime CreateDT { get; set; }

        public int CompanyId { get; set; }
    }
}