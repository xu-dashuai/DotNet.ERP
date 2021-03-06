﻿using Pharos.Logic.MemberDomain.Exceptions;
using Pharos.Logic.MemberDomain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Pharos.Logic.MemberDomain.QuanChengTaoProviders.Extensions
{
    public static class RetrunRulesExtensions
    {
        public static Expression<Func<TScene, bool>> GetVerifyExpression<TScene>(this Pharos.Logic.Entity.ReturnRules entity, int providerId, Func<int, Expression, MemberExpression> memberExpression)
              where TScene : IScene, new()
        //注：此处Pharos.Logic.Entity.ReturnRules引用在下次底层数据访问重构时候，新建Dao进行解耦
        {
            var datetimeNow = DateTime.Now;
            switch (entity.AgingType)//时效匹配
            {
                case 1:
                    var dayOfWeeks = new int[] { 
                        !string.IsNullOrEmpty(entity.StartTime1)? Convert.ToInt32(entity.StartTime1):-1,
                        !string.IsNullOrEmpty(entity.StartTime2)? Convert.ToInt32(entity.StartTime2):-1,
                        !string.IsNullOrEmpty(entity.StartTime3)? Convert.ToInt32(entity.StartTime3):-1,
                        !string.IsNullOrEmpty(entity.EndTime1)? Convert.ToInt32(entity.EndTime1):-1,
                        !string.IsNullOrEmpty(entity.EndTime2)? Convert.ToInt32(entity.EndTime2):-1,
                        !string.IsNullOrEmpty(entity.EndTime3)? Convert.ToInt32(entity.EndTime3):-1,
                    };
                    if (!dayOfWeeks.Where(o => o != -1).Contains((int)datetimeNow.DayOfWeek))
                    {
                        return null;
                    }
                    break;
                case 2:

                    var dayRanges = new KeyValuePair<DateTime, DateTime>[] { 
                        string.IsNullOrEmpty(entity.StartTime1)||string.IsNullOrEmpty(entity.EndTime1)?
                        default(KeyValuePair<DateTime, DateTime>):
                     new KeyValuePair<DateTime, DateTime>(  
                         Convert.ToDateTime(datetimeNow.ToString("yyyy-MM-dd")+" "+entity.StartTime1),
                         Convert.ToDateTime(datetimeNow.ToString("yyyy-MM-dd")+" "+entity.EndTime1)
                         ),
                        string.IsNullOrEmpty(entity.StartTime2)||string.IsNullOrEmpty(entity.EndTime2)?
                        default(KeyValuePair<DateTime, DateTime>):
                     new KeyValuePair<DateTime, DateTime>(  
                         Convert.ToDateTime(datetimeNow.ToString("yyyy-MM-dd")+" "+entity.StartTime2),
                         Convert.ToDateTime(datetimeNow.ToString("yyyy-MM-dd")+" "+entity.EndTime2)
                         ),
                        string.IsNullOrEmpty(entity.StartTime3)||string.IsNullOrEmpty(entity.EndTime3)?
                        default(KeyValuePair<DateTime, DateTime>):
                    new KeyValuePair<DateTime, DateTime>(  
                         Convert.ToDateTime(datetimeNow.ToString("yyyy-MM-dd")+" "+entity.StartTime3),
                         Convert.ToDateTime(datetimeNow.ToString("yyyy-MM-dd")+" "+entity.EndTime3)
                         ),
                    };

                    if (!dayRanges.Any(o => o.Key <= datetimeNow && o.Value >= datetimeNow))
                    {
                        return null;
                    }
                    break;
            }
            var p = Expression.Parameter(typeof(TScene), "p");
            MemberExpression propertyName = memberExpression(entity.Mode, p);
            Expression body = null;

            //计量范围
            Expression expression1 = GetLogicalOperationExpression(entity.LeftSign, entity.Number1, propertyName);
            if (entity.RightSign.HasValue && entity.Number2.HasValue)
            {
                var expression2 = GetLogicalOperationExpression(entity.RightSign.Value, entity.Number2.Value, propertyName);
                body = Expression.AndAlso(expression1, expression2);
            }
            else
            {
                body = expression1;
            }

            //限制规则提供程序
            var limitProvider = Expression.Constant(entity.Adapters);
            var currentProvider = Expression.Constant(providerId);
            var ifEqualProvider = Expression.Equal(limitProvider, currentProvider);
            body = Expression.AndAlso(ifEqualProvider, body);
            //会员限定
            if (!string.IsNullOrEmpty(entity.MemberLevelId) && entity.MemberLevelId != "-1")
            {
                var level = Expression.Property(Expression.Property(p, "Member"), "MemberLevelId");
                body = Expression.AndAlso(body, Expression.Equal(Expression.Constant(entity.MemberLevelId), level));
            }
            return Expression.Lambda<Func<TScene, bool>>(body, p);
        }

        /// <summary>
        /// 获取逻辑运算符表达式
        /// </summary>
        /// <param name="logicalOperatorType">逻辑运算符</param>
        /// <param name="number">逻辑运算范围数值</param>
        /// <param name="property">比对属性</param>
        /// <param name="isPropertyRight">比对属性是否在表达式右边</param>
        /// <returns></returns>
        public static Expression GetLogicalOperationExpression(int logicalOperatorType, decimal number, MemberExpression property)
        {
            Expression leftExpression = property;
            Expression rightExpression = Expression.Constant(number);
            Expression result = null;
            switch (logicalOperatorType)
            {
                case (int)LogicalOperatorType.GreaterThan:
                    result = Expression.GreaterThan(leftExpression, rightExpression);
                    break;
                case (int)LogicalOperatorType.GreatThanOrEqualTo:
                    result = Expression.GreaterThanOrEqual(leftExpression, rightExpression);
                    break;
                case (int)LogicalOperatorType.LessThan:
                    result = Expression.LessThan(leftExpression, rightExpression);
                    break;
                case (int)LogicalOperatorType.LessThanOrEqualTo:
                    result = Expression.LessThanOrEqual(leftExpression, rightExpression);
                    break;
                case (int)LogicalOperatorType.EqualTo:
                    result = Expression.Equal(leftExpression, rightExpression);
                    break;
                default:
                    throw new IntegralRuleProviderLoadException("未知规则逻辑运算符!");
            }
            return result;
        }

        public static Expression<Func<TScene, decimal>> GetIntegralExpression<TScene>(this Pharos.Logic.Entity.ReturnRules entity, Func<int, Expression, MemberExpression> memberExpression)//注：此处Pharos.Logic.Entity.ReturnRules引用在下次底层数据访问重构时候，新建Dao进行解耦
              where TScene : IScene, new()
        {
            var p = Expression.Parameter(typeof(TScene), "p");
            MemberExpression propertyName = memberExpression(entity.Mode, p);
            Expression body = null;
            switch (entity.OperationType) //返赠运算方式(0：按固定值；1：按固定比例；2：动态配置)
            {
                case 235:
                    body = Expression.Constant(Convert.ToDecimal(entity.Expression));
                    break;
                case 236:
                    var rateConstant = Expression.Constant(Convert.ToDecimal(entity.Expression));
                    body = Expression.Multiply(rateConstant, propertyName);
                    break;
                case 237://TODO Call Dynamic Expression
                    break;
            }
            return Expression.Lambda<Func<TScene, decimal>>(body, p);
        }
    }
}
