// --------------------------------------------------
// Copyright (C) 2015 版权所有
// 创 建 人：蔡少发
// 创建时间：2015-05-22
// 描述信息：用于管理本系统的所有会员的消费积分明细信息（主表：SaleOrders） 
// --------------------------------------------------

using System;
using Pharos.Utility;

namespace Pharos.Logic.Entity
{
    /// <summary>
    /// 会员积分明细
    /// </summary>
    [Serializable]
    [Excel("会员积分明细")]
    public class MemberIntegral : SyncEntity
    {
             

        /// <summary>
        /// 流水号
        /// [长度：50]
        /// [不允许为空]
        /// </summary>
        [Excel("流水号", 1)]
        public string PaySN { get; set; }
        

        /// <summary>
        /// 会员卡号
        /// [长度：100]
        /// [不允许为空]
        /// </summary>
        [Excel("会员卡号", 2)]
        public string MemberId { get; set; }
        

        /// <summary>
        /// 消费金额
        /// [长度：19，小数位数：4]
        /// [不允许为空]
        /// [默认值：((0))]
        /// </summary>
        [Excel("消费金额", 3)]
        public decimal ActualPrice { get; set; }
        

        /// <summary>
        /// 兑换积分
        /// [长度：10]
        /// [不允许为空]
        /// [默认值：((0))]
        /// </summary>
        [Excel("兑换积分", 4)]
        public int Integral { get; set; }
        

        /// <summary>
        /// 消费时间
        /// [长度：23，小数位数：3]
        /// [不允许为空]
        /// [默认值：(getdate())]
        /// </summary>
        [Excel("消费时间", 5)]
        public DateTime CreateDT { get; set; }

    }
}