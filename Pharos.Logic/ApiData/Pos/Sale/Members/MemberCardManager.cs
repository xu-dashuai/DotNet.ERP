﻿using Pharos.Logic.ApiData.Pos.DataAdapter;
using Pharos.Logic.ApiData.Pos.Sale;
using Pharos.Logic.ApiData.Pos.ValueObject;
using Pharos.Logic.ApiData.Pos.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.Logic.ApiData.Pos.Sale.Members
{
    public class MemberCardManager
    {
        /// <summary>
        /// 获取会员ID
        /// </summary>
        /// <param name="storeId">门店编号</param>
        /// <param name="machineSn">设备编号</param>
        /// <param name="phone">手机号</param>
        /// <param name="mode">会员来源模式</param>
        /// <param name="uid">操作人</param>
        /// <returns>会员ID</returns>
        public MemberInfo GetMemberInfo(string storeId, string machineSn, int companyId, string phone, string cardNo, MembersSourseMode mode, string uid)
        {
            var result = default(MemberInfo);
            switch (mode)
            {
                case MembersSourseMode.Internal:
                    var dataAdapter = DataAdapterFactory.Factory(MachinesSettings.Mode, storeId, machineSn, companyId, DataAdapterFactory.DEFUALT);

                    result = dataAdapter.GetMemberInfo(phone, cardNo, uid);
                    break;
                case MembersSourseMode.External:
                    throw new PosException("500", "未实现的会员来源！");
                default:
                    throw new PosException("500", "未实现的会员来源！");
            }
            return result;
        }
    }
}
