﻿using Pharos.ObjectModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.Logic.ApiData.Pos.Sale.Barcodes
{
    public interface IIdentification
    {

        /// <summary>
        /// 产品类型
        /// </summary>
        ProductType ProductType { get; set; }

        /// <summary>
        /// 主条码
        /// </summary>
        string MainBarcode { get; set; }
        /// <summary>
        /// 多条码
        /// </summary>
        IEnumerable<string> MultiCode { get; set; }
        /// <summary>
        /// 是否已改价
        /// </summary>
        bool HasEditPrice { get; set; }
        /// <summary>
        /// 原记录id
        /// </summary>
        string RecordId { get; set; }


    }
}