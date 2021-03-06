﻿using Pharos.Logic.OMS.BLL;
using Pharos.Logic.OMS.Entity;
using Pharos.Utility.Helpers;
using QCT.Pay.Common;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Pharos.OMS.Retailing.Controllers
{
    /// <summary>
    /// 交易管理
    /// </summary>
    public class TradeController : BaseController
    {
        #region Ninject Properties
        [Ninject.Inject]
        DictionaryService DicSvc { get; set; }
        [Ninject.Inject]
        TradeService TradeSvc { get; set; }
        [Ninject.Inject]
        PayChannelService PayChannelSvc { get; set; }
        #endregion

        //
        // GET: /Trade/
        #region 交易流水数据

        #region 交易流水数据表格
        /// <summary>
        /// 交易流水数据-表格页面加载
        /// </summary>
        /// <returns></returns>
        public ActionResult TradeData()
        {
            ViewBag.FeeTypeList = JsonHelper.ToJson(EnumHelper.GetCacheList<PayFeeType>(true));
            //ViewBag.PayChannelList = JsonHelper.ToJson(EnumHelper.GetCacheList<PayChannel>(true));
            ViewBag.ChannelJson = JsonHelper.ToJson(PayChannelSvc.GetPayChannelsForTrades());
            ViewBag.SourceTypeList = JsonHelper.ToJson(EnumHelper.GetCacheList<PaySourceType>(true));
            ViewBag.TradeTypeList = JsonHelper.ToJson(EnumHelper.GetCacheList<QctTradeType>(true));
            ViewBag.StatusList = JsonHelper.ToJson(EnumHelper.GetCacheList<PayState>(true));
            ViewBag.RefundStatusList = JsonHelper.ToJson(EnumHelper.GetCacheList<RefundState>(true));
            return View();
        }
        /// <summary>
        /// 交易流水数据-表格页面获取分页数据
        /// </summary>
        /// <returns></returns>
        public ActionResult GetTradeDataPaging()
        {
            var count = 0;
            var list = TradeSvc.GetTradeDataPaging(Request.Params, out count);
            return ToDataGrid(list, count);
        }

        #endregion

        #endregion
    }
}
