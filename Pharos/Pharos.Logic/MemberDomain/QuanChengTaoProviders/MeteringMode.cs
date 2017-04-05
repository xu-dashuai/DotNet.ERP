﻿using Pharos.Logic.MemberDomain.QuanChengTaoProviders.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.Logic.MemberDomain.QuanChengTaoProviders
{
    public enum MeteringMode
    {
        /// <summary>
        /// 用于金额计量
        /// </summary>
        [MeteringModeDescription(IntegralProviderType.BarcodeIntegralProvider | IntegralProviderType.OrderAmountIntegralProvider| IntegralProviderType.RechargeAmountIntegralProvider, "按金额")]
        AmountCounter = 229,
        /// <summary>
        /// 用于次数计量（次、件）
        /// </summary>
        [MeteringModeDescription(IntegralProviderType.BarcodeIntegralProvider, "按件数")]
        CountCounter = 230,
    }
}