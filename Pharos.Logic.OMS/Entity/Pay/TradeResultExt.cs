﻿using Pharos.Logic.OMS.Models;
using QCT.Pay.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.Logic.OMS.Entity
{
    public class TradeResultExt
    {
    }
    /// <summary>
    /// 
    /// </summary>
    public partial class TradeResult { 
        public TradeResult(SxfScanPayResponse sxfRsp) {
            CreateDT = DateTime.Now;
            MchId3 = sxfRsp.MerchantId;
            OutTradeNo = sxfRsp.PayOrderNo;
            PayChannel = PayTradeHelper.Convert2EnumValue<PayChannel>(sxfRsp.PayChannel);
            ReceiptAmount = sxfRsp.TxAmt * PayConst.CENT_2_YUAN_RATE;
            TradeState = PayTradeHelper.Convert2EnumValue<SxfPayState>(sxfRsp.PayResult);
            SignType = sxfRsp.SignType;
            TradeDate = DateTime.Now.ToString("yyyyMMdd");
            TradeTime = DateTime.Now.ToString("HHmmss");
            TradeType = (short)QctTradeType.Income;
            Signature = sxfRsp.Signature;
            Version = sxfRsp.Version;
        }
        /// <summary>
        /// 支付结果通知转为交易结果对象
        /// </summary>
        /// <param name="sxfPayNotify"></param>
        /// <returns></returns>
        public TradeResult(SxfPayNotifyRequest sxfPayNotify)
        {
                CreateDT = DateTime.Now;
                MchId3 = sxfPayNotify.MerchantId;
                StoreId3 = sxfPayNotify.ShopId;
                OutTradeNo = sxfPayNotify.PayOrderNo;
                PayChannel = PayTradeHelper.Convert2EnumValue<PayChannel>(sxfPayNotify.PayChannel);
                ReceiptAmount = sxfPayNotify.PayAmt * PayConst.CENT_2_YUAN_RATE;
                TradeState = PayTradeHelper.Convert2EnumValue<SxfPayState>(sxfPayNotify.PayResult);
                SignType = sxfPayNotify.SignType;
                TradeDate = sxfPayNotify.PayDate;
                TradeTime = sxfPayNotify.PayTime;
                TradeType = (short)QctTradeType.Income;
                Signature = sxfPayNotify.Signature;
                Version = sxfPayNotify.Version;
        }
        /// <summary>
        /// 退款通知对象转换为退款结果对象
        /// </summary>
        /// <param name="sxfRfdNotify"></param>
        /// <returns></returns>
        public TradeResult(SxfRefundNotifyRequest sxfRfdNotify)
        {
                CreateDT = DateTime.Now;
                MchId3 = sxfRfdNotify.MerchantId;
                StoreId3 = sxfRfdNotify.ShopId;
                OutTradeNo = sxfRfdNotify.RfdOrderNo;
                PayChannel = PayTradeHelper.Convert2EnumValue<PayChannel>(sxfRfdNotify.PayChannel);
                ReceiptAmount = sxfRfdNotify.RfdAmt * PayConst.CENT_2_YUAN_RATE;
                TradeState = PayTradeHelper.Convert2EnumValue<SxfRefundState>(sxfRfdNotify.RfdResult);
                SignType = sxfRfdNotify.SignType;
                TradeDate = sxfRfdNotify.RfdDate;
                TradeTime = sxfRfdNotify.RfdTime;
                TradeType = (short)QctTradeType.Expense;
                Signature = sxfRfdNotify.Signature;
                Version = sxfRfdNotify.Version;
        }
    }
}