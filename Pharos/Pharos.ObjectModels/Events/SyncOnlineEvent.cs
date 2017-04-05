﻿using Pharos.MessageTransferAgenClient.DomainEvent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.ObjectModels.Events
{
    public class SyncOnlineEvent : IEvent
    {
        public SyncOnlineEvent()
        {
            ID = Guid.NewGuid();
            TimeStamp = DateTime.Now;
        }

        public System.Guid ID { get; set; }

        public System.DateTime TimeStamp { get; set; }
        /// <summary>
        /// 门店Id
        /// </summary>
        public string StoreId { get; set; }

        /// <summary>
        /// 设备编号
        /// </summary>
        public string MachineSn { get; set; }

        /// <summary>
        /// 门店名称
        /// </summary>
        public string StoreName { get; set; }

        ///// <summary>
        ///// 门店电话
        ///// </summary>
        //public string StorePhone { get; set; }

        /// <summary>
        /// 当前收银员UID
        /// </summary>
        public string CashierUid { get; set; }

        /// <summary>
        /// 当前收银员名称
        /// </summary>
        public string CashierName { get; set; }

        /// <summary>
        /// 当前收银员工号
        /// </summary>
        public string CashierUserCode { get; set; }

        /// <summary>
        /// 当前收银员本店角色（ 1:店长、 2:营业员、 3:仓管员）（多个 ID以,号间隔）
        /// </summary>
        public string CashierOperateAuth { get; set; }

        /// <summary>
        /// 是否进入练习模式
        /// </summary>
        public bool InTestMode { get; set; }
        public int CompanyId { get; set; }

        public string DeviceSn { get; set; }

    }
}