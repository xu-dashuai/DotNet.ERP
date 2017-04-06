﻿using Pharos.Logic.MemberDomain.QuanChengTaoProviders.Scenes;
using Pharos.Logic.MemberDomain.QuanChengTaoProviders.Extensions;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Pharos.ObjectModels.Events;
using Pharos.Logic.BLL;
using Pharos.Logic.Entity;

namespace Pharos.Logic.MemberDomain.QuanChengTaoProviders.IntegralProviders
{
    public class OrderAmountIntegralProvider : BaseIntegralRuleProvider<OrderAmountScene, Members>
    {
        public override IEnumerable<Interfaces.IIntegralRule> GetRuleDatas(object info = null)
        {
            return Pharos.Logic.BLL.ReturnRulesService.GetProviderRules((int)info, ProviderId).Select(o => new CommonIntegralRule<OrderAmountScene>()
            {
                Id = o.Id.ToString(),
                MeteringMode = o.Mode,
                LimitItems = o.LimitItems,
                IntegralExpression = o.GetIntegralExpression<OrderAmountScene>(GetMemberExpression),
                VerifyExpression = o.GetVerifyExpression<OrderAmountScene>(ProviderId, GetMemberExpression)
            }).Where(o => o.VerifyExpression != null).ToList();
        }

        private MemberExpression GetMemberExpression(int mode, Expression p)
        {
            MemberExpression propertyName = null;
            switch (mode)// 计量模式（eg:金额，次数。。）
            {
                case (int)MeteringMode.AmountCounter:
                    propertyName = Expression.Property(p, "Amount");
                    break;
            }
            return propertyName;
        }

        public override int GetProviderId()
        {
            return (int)IntegralProviderType.OrderAmountIntegralProvider;
        }

        public override OrderAmountScene GetTScene(object channelMessage, Interfaces.IIntegralRule rule, Members member)
        {
            if (!(channelMessage is OrderCompletedEvent))
                return null;
            var channelDatas = (OrderCompletedEvent)channelMessage;
            return new OrderAmountScene()
            {
                Amount = channelDatas.OrderReceiveAmount,
                Member = member
            };
        }
    }
}