﻿using Pharos.Logic.BLL;
using Pharos.Logic.MemberDomain.Exceptions;
using Pharos.Logic.MemberDomain.Interfaces;
using Pharos.Logic.MemberDomain.QuanChengTaoProviders.Scenes;
using Pharos.Logic.MemberDomain.QuanChengTaoProviders.Extensions;
using Pharos.ObjectModels.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Pharos.Logic.Entity;

namespace Pharos.Logic.MemberDomain.QuanChengTaoProviders.IntegralProviders
{
    /// <summary>
    /// 条码积分规则提供程序
    /// </summary>
    public class BarcodeIntegralProvider : BaseIntegralRuleProvider<BarcodeScene, Members>
    {
        /// <summary>
        /// 获取规则数据
        /// </summary>
        /// <param name="info">输入性参数，这里是companyId</param>
        /// <returns>积分规则</returns>
        public override IEnumerable<IIntegralRule> GetRuleDatas(object info = null)
        {
            return Pharos.Logic.BLL.ReturnRulesService.GetProviderRules((int)info, ProviderId).Select(o => new CommonIntegralRule<BarcodeScene>()
            {
                Id = o.Id.ToString(),
                MeteringMode = o.Mode,
                LimitItems = o.LimitItems,
                IntegralExpression = o.GetIntegralExpression<BarcodeScene>(GetMemberExpression),
                VerifyExpression = o.GetVerifyExpression<BarcodeScene>(ProviderId, GetMemberExpression)
            }).Where(o => o.VerifyExpression != null).ToList();
        }

        /// <summary>
        /// 获取积分表达式
        /// </summary>
        /// <param name="entity">数据源</param>
        /// <returns>积分表达式</returns>
        private MemberExpression GetMemberExpression(int mode, Expression p)//注：此处Pharos.Logic.Entity.ReturnRules引用在下次底层数据访问重构时候，新建Dao进行解耦
        {
            MemberExpression propertyName = null;
            switch (mode)// 计量模式（eg:金额，次数。。）
            {
                case (int)MeteringMode.AmountCounter:
                    propertyName = Expression.Property(p, "Amount");
                    break;
                case (int)MeteringMode.CountCounter:
                    propertyName = Expression.Property(p, "Count");
                    break;
            }
            return propertyName;
        }
        /// <summary>
        /// 获取积分规则提供程序ID
        /// </summary>
        /// <returns>积分规则提供程序ID</returns>
        public override int GetProviderId()
        {
            return (int)IntegralProviderType.BarcodeIntegralProvider;
        }
        /// <summary>
        /// 生成场景数据并过滤
        /// </summary>
        /// <param name="channelMessage"></param>
        /// <param name="meteringModes"></param>
        /// <param name="rule"></param>
        /// <returns></returns>

        public override BarcodeScene GetTScene(object channelMessage, IIntegralRule rule, Members member)
        {
            if (!(channelMessage is OrderCompletedEvent))
                return null;
            var channelDatas = (OrderCompletedEvent)channelMessage;
            IEnumerable<OrderDetail> efficientProducts = null;
            if (!string.IsNullOrEmpty(((CommonIntegralRule<BarcodeScene>)rule).LimitItems))
            {
                var limitItems = "," + ((CommonIntegralRule<BarcodeScene>)rule).LimitItems + ",";
                efficientProducts = channelDatas.OrderDetails.Where(o => limitItems.Contains("," + o.Barcode + ","));
            }
            else
            {
                efficientProducts = channelDatas.OrderDetails;
            }
            return new BarcodeScene()
            {
                Amount = efficientProducts.Sum(o => o.AveragePrice * o.PurchaseNumber),
                Count = efficientProducts.Sum(o => o.PurchaseNumber),
                Member = member
            };
        }
    }
}