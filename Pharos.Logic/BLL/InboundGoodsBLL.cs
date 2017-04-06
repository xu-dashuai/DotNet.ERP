﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pharos.Logic.Entity;
using System.Collections.Specialized;
using Pharos.Utility.Helpers;
using Pharos.Utility;
using Pharos.Sys.Entity;
using System.Data;

namespace Pharos.Logic.BLL
{
    public class InboundGoodsBLL : BaseService<InboundGoods>
    {
        /// <summary>
        /// 获得入库单信息
        /// </summary>
        /// <param name="nvl">传递条件</param>
        /// <param name="recordCount">返回总行数</param>
        /// <returns>list</returns>
        public static object FindInboundGoodsList(NameValueCollection nvl, out int recordCount)
        {
            var queryInboundGoods = BaseService<InboundGoods>.CurrentRepository.QueryEntity.Where(o=>o.CompanyId==CommonService.CompanyId);
            var queryInboundList = BaseService<InboundList>.CurrentRepository.QueryEntity;
            var queryWarehouse = BaseService<Warehouse>.CurrentRepository.QueryEntity.Where(o => o.CompanyId == CommonService.CompanyId);
            var queryProduct = BaseService<VwProduct>.CurrentRepository.QueryEntity.Where(o => o.CompanyId == CommonService.CompanyId);
            var queryUser = UserInfoService.CurrentRepository.QueryEntity.Where(o => o.CompanyId == CommonService.CompanyId);
            var querySupplier = BaseService<Supplier>.CurrentRepository.QueryEntity.Where(o => o.CompanyId == CommonService.CompanyId);

            var groupbyInboundList = from a in queryInboundList
                                     group a by a.InboundGoodsId into g
                                     select new
                                     {
                                         g.Key,
                                         InboundPrice =(decimal?)g.Where(o=>o.IsGift==0).Sum(a => a.BuyPrice * a.InboundNumber),
                                         InboundNumber = g.Sum(a => a.InboundNumber),
                                         GiftNumber = (decimal?)g.Where(o => o.IsGift == 1).Sum(a => a.InboundNumber)
                                     };

            var query = from x in queryInboundGoods
                        join y in groupbyInboundList on x.InboundGoodsId equals y.Key
                        join z in queryWarehouse on x.StoreId equals z.StoreId into temp1
                        from m in temp1.DefaultIfEmpty()
                        join j in queryUser on x.CreateUID equals j.UID into temp2
                        from k in temp2.DefaultIfEmpty()
                        join n in querySupplier on x.SupplierID equals n.Id into temp3
                        from p in temp3.DefaultIfEmpty()
                        join q in queryUser on x.BuyerUID equals q.UID into temp4
                        from r in temp4.DefaultIfEmpty()
                        select new
                        {
                            x.Id,
                            x.InboundGoodsId,
                            StoreTitle = m.Title,
                            x.StoreId,
                            x.IndentOrderId,
                            x.BuyerUID,
                            Buyer = r.FullName,
                            x.ReceivedDT,
                            x.SupplierID,
                            SupplierTitle = p.Title,
                            x.DistributionBatch,
                            InboundPrice=y.InboundPrice??0,
                            y.InboundNumber,
                            GiftNumber=y.GiftNumber??0,
                            x.CreateDT,
                            Creater = k.FullName,
                            x.CreateUID,
                            x.State,
                            x.VerifyTime
                        };
            var CreateUID = nvl["CreateUID"];
            var Store = nvl["Store"];
            var searchField = nvl["searchField"];
            var searchText = nvl["searchText"];
            var StartDate = nvl["StartDate"];
            var EndDate = nvl["EndDate"];
            var InBoundState = nvl["State"];
            var SupplierID = nvl["SupplierID"];

            if (!CreateUID.IsNullOrEmpty())
            {
                query = query.Where(o => o.CreateUID == CreateUID);
            }
            if (!Store.IsNullOrEmpty())
            {
                query = query.Where(o => o.StoreId == Store);
            }
            if (!searchText.IsNullOrEmpty())
            {
                if (searchField == "barcode")
                    query = query.Where(o => queryInboundList.Any(i=>i.InboundGoodsId==o.InboundGoodsId && i.Barcode.Contains(searchText)));
                else if (searchField == "IndentOrderId")
                    query = query.Where(o => o.IndentOrderId.Contains(searchText));
                else if (searchField == "InboundGoodsId")
                    query = query.Where(o => o.InboundGoodsId.Contains(searchText));
            }
            if (!StartDate.IsNullOrEmpty())
            {
                var st1 = DateTime.Parse(StartDate);
                query = query.Where(o => o.CreateDT >= st1);
            }
            if (!EndDate.IsNullOrEmpty())
            {
                var st2 = DateTime.Parse(EndDate).AddDays(1);
                query = query.Where(o => o.CreateDT < st2);
            }
            if (!InBoundState.IsNullOrEmpty())
            {
                var inBoundStateValue = short.Parse(InBoundState);
                query = query.Where(o => o.State == inBoundStateValue);
            }
            if (!SupplierID.IsNullOrEmpty())
            {
                query = query.Where(o => o.SupplierID == SupplierID);
            }

            recordCount = query.Count();
            return query.ToPageList(nvl).Select(o => new
            {
                o.Id,
                o.InboundGoodsId,
                o.StoreTitle,
                o.StoreId,
                o.IndentOrderId,
                o.BuyerUID,
                o.Buyer,
                o.ReceivedDT,
                o.SupplierID,
                SupplierTitle = o.SupplierID == "-1" ? "其它" : o.SupplierTitle,
                o.DistributionBatch,
                o.InboundPrice,
                o.InboundNumber,
                o.GiftNumber,
                o.CreateDT,
                CreateDTStr = o.CreateDT.ToString("yyyy-MM-dd"),
                VerifyDTStr = o.VerifyTime.HasValue?o.VerifyTime.Value.ToString("yyyy-MM-dd"):"",
                o.Creater,
                o.CreateUID,
                o.State,
                StateTitle = Enum.GetName(typeof(InboundState), o.State)
            });
        }

        /// <summary>
        /// 级联删除入库记录
        /// </summary>
        /// <param name="Ids">InboundGood主键ID</param>
        /// <returns>执行结果</returns>
        public static OpResult DeleteInboundById(string[] ids)
        {
            var op = new OpResult();
            try
            {
                var queryInGoods = BaseService<InboundGoods>.CurrentRepository;
                var queryInList = BaseService<InboundList>.CurrentRepository;
                var InGoods = queryInGoods.FindList(o => ids.Contains(o.Id.ToString()) && o.CompanyId==CommonService.CompanyId).ToList();
                if (InGoods.Any(o => o.State == 1))
                {
                    var goods = InGoods.Where(o => o.State == 1).FirstOrDefault();
                    op.Message = string.Format("入库单：{0} 为已验状态，无法删除", goods.InboundGoodsId);
                    return op;
                }
                var InGoodIds = InGoods.Select(o => o.InboundGoodsId).ToList();
                var InGoodLists = new List<InboundList>();
                foreach (var inGoodId in InGoodIds)
                {
                    var inGoodList = queryInList.FindList(o => o.InboundGoodsId == inGoodId);
                    if (inGoodList.Count() > 0)
                        InGoodLists.AddRange(inGoodList);
                }
                queryInList.RemoveRange(InGoodLists, false);
                queryInGoods.RemoveRange(InGoods, true);

                op.Successed = true;
            }
            catch (Exception ex)
            {
                op.Message = ex.Message;
                Log.WriteError("删除失败", ex);
            }
            return op;
        }

        /// <summary>
        /// 保存或修改
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static OpResult SaveOrUpdate(InboundGoods obj)
        {
            var re = new OpResult();
            try
            {
                var details = new List<InboundList>();
                var inboundGoodsId = Logic.CommonRules.InboundSN;
                if (!string.IsNullOrWhiteSpace(obj.Rows))
                {
                    try
                    {
                        var inboundList = obj.Rows.ToObject<List<InboundList>>();
                        if (inboundList.Any())
                            details.AddRange(inboundList.Where(o => !string.IsNullOrWhiteSpace(o.Barcode)));
                    }
                    catch(Exception ex)
                    {
                        Log.WriteError(ex);
                        return OpResult.Fail("入库清单处理失败，请清空后重新添加数据！");
                    }

                }
                if (obj.Id == 0)
                {
                    //新增
                    if (!string.IsNullOrEmpty(obj.IndentOrderId))
                    {
                        var inboundGood = Find(o =>o.CompanyId==CommonService.CompanyId && o.IndentOrderId == obj.IndentOrderId);
                        if (inboundGood != null)
                        {
                            re.Message = "该订货单号已入库!";
                            return re;
                        }
                        if(obj.Source==1)
                        {
                            if(!OrderService.IsExist(o=>o.CompanyId==CommonService.CompanyId && o.IndentOrderId==obj.IndentOrderId))
                            {
                                re.Message = "该订货单号不存在!";
                                return re;
                            }
                        }
                    }
                    if (string.IsNullOrEmpty(obj.SupplierID))
                    {
                        obj.SupplierID = "-1";
                    }
                    obj.CompanyId = CommonService.CompanyId;
                    obj.InboundGoodsId = inboundGoodsId;
                    obj.State = 0;
                    foreach (var d in details)
                    {
                        d.InboundGoodsId = inboundGoodsId;
                        d.State = 0;

                        var oProduct = BaseService<VwProduct>.Find(o => o.CompanyId == CommonService.CompanyId && (o.Barcode == d.Barcode || ("," + o.Barcodes + ",").Contains("," + d.Barcode + ",")));
                        if (oProduct != null)
                        {
                            if (d.Barcode != oProduct.Barcode && !oProduct.Barcodes.IsNullOrEmpty())
                            {
                                d.AssistBarcode = d.Barcode;
                                d.Barcode = oProduct.Barcode;
                            }
                            if (oProduct.SupplierId != obj.SupplierID && obj.SupplierID!="-1" && obj.InboundType==1)
                            {
                                var sups = BaseService<ProductMultSupplier>.FindList(o =>o.CompanyId==CommonService.CompanyId && o.Barcode == oProduct.Barcode).Select(o => o.SupplierId).Distinct().ToList();
                                if(!sups.Contains(obj.SupplierID))
                                    return OpResult.Fail("条码[" + d.Barcode + "]供货单位与产品档案不一致!");
                            }
                            //进价
                            //d.BuyPrice = oProduct.BuyPrice;
                            //生产日期非必填
                            if (!string.IsNullOrEmpty(d.ProducedDate))
                            {
                                //如果保质期>0,截止保质日期=生产日期+保质期
                                if (oProduct.Expiry > 0)
                                {
                                    d.ExpiryDateUnit = oProduct.ExpiryUnit;
                                    d.ExpiryDate = oProduct.Expiry;

                                    if (d.ExpiryDateUnit == 1)
                                    {
                                        d.ExpirationDate = DateTime.Parse(d.ProducedDate).AddDays(d.ExpiryDate).ToString("yyyy-MM-dd");
                                    }
                                    if (d.ExpiryDateUnit == 2)
                                    {
                                        d.ExpirationDate = DateTime.Parse(d.ProducedDate).AddMonths(d.ExpiryDate).ToString("yyyy-MM-dd");
                                    }
                                    if (d.ExpiryDateUnit == 3)
                                    {
                                        d.ExpirationDate = DateTime.Parse(d.ProducedDate).AddYears(d.ExpiryDate).ToString("yyyy-MM-dd");
                                    }
                                }
                                //如果保质期不限，截止保质日期=当前日期+20年
                                else if (oProduct.Expiry == 0)
                                {
                                    d.ExpiryDateUnit = 3;
                                    d.ExpiryDate = 20;
                                    d.ExpirationDate = DateTime.Now.AddYears(d.ExpiryDate).ToString("yyyy-MM-dd");
                                }
                            }
                            else
                            {
                                //生产日期为空
                                //截止保质日期=当前日期+20年
                                d.ExpiryDateUnit = 3;
                                d.ExpiryDate = 20;
                                if (oProduct.Expiry > 0)
                                {//如果保质期>0,截止保质日期=当前时间+保质期
                                    d.ExpiryDateUnit = oProduct.ExpiryUnit;
                                    d.ExpiryDate = oProduct.Expiry;
                                }
                                d.ExpirationDate = DateTime.Now.AddYears(d.ExpiryDate).ToString("yyyy-MM-dd");
                            }
                        }

                    }
                    BaseService<InboundList>.CurrentRepository.AddRange(details, false);
                    re = Add(obj, true);
                }
                else
                {
                    //编辑
                    var inboundGood = FindById(obj.Id);
                    inboundGood.StoreId = obj.StoreId;
                    inboundGood.BuyerUID = obj.BuyerUID;
                    inboundGood.ReceivedDT = obj.ReceivedDT;
                    inboundGood.SupplierID = string.IsNullOrEmpty(obj.SupplierID) ? "-1" : obj.SupplierID;
                    inboundGood.DistributionBatch = obj.DistributionBatch;
                    inboundGood.CreateUID = obj.CreateUID;
                    inboundGood.CreateDT = obj.CreateDT;
                    foreach (var d in details)
                    {
                        d.InboundGoodsId = inboundGood.InboundGoodsId;
                        d.State = 0;

                        var oProduct = BaseService<VwProduct>.Find(o => o.CompanyId == CommonService.CompanyId && (o.Barcode == d.Barcode || ("," + o.Barcodes + ",").Contains("," + d.Barcode + ",")));
                        if (oProduct != null)
                        {
                            if (d.Barcode != oProduct.Barcode && !oProduct.Barcodes.IsNullOrEmpty())
                            {
                                d.AssistBarcode = d.Barcode;
                                d.Barcode = oProduct.Barcode;
                            }
                            //进价
                            //d.BuyPrice = oProduct.BuyPrice;
                            //生产日期非必填
                            if (!string.IsNullOrEmpty(d.ProducedDate))
                            {
                                //如果保质期>0,截止保质日期=生产日期+保质期
                                if (oProduct.Expiry > 0)
                                {
                                    d.ExpiryDateUnit = oProduct.ExpiryUnit;
                                    d.ExpiryDate = oProduct.Expiry;

                                    if (d.ExpiryDateUnit == 1)
                                    {
                                        d.ExpirationDate = DateTime.Parse(d.ProducedDate).AddDays(d.ExpiryDate).ToString("yyyy-MM-dd");
                                    }
                                    if (d.ExpiryDateUnit == 2)
                                    {
                                        d.ExpirationDate = DateTime.Parse(d.ProducedDate).AddMonths(d.ExpiryDate).ToString("yyyy-MM-dd");
                                    }
                                    if (d.ExpiryDateUnit == 3)
                                    {
                                        d.ExpirationDate = DateTime.Parse(d.ProducedDate).AddYears(d.ExpiryDate).ToString("yyyy-MM-dd");
                                    }
                                }
                                //如果保质期不限，截止保质日期=当前日期+20年
                                else if (oProduct.Expiry == 0)
                                {
                                    d.ExpiryDateUnit = 3;
                                    d.ExpiryDate = 20;
                                    d.ExpirationDate = DateTime.Now.AddYears(d.ExpiryDate).ToString("yyyy-MM-dd");
                                }
                            }
                            else
                            {
                                //生产日期为空
                                //截止保质日期=当前日期+20年
                                d.ExpiryDateUnit = 3;
                                d.ExpiryDate = 20;
                                if (oProduct.Expiry > 0)
                                {//如果保质期>0,截止保质日期=当前时间+保质期
                                    d.ExpiryDateUnit = oProduct.ExpiryUnit;
                                    d.ExpiryDate = oProduct.Expiry;
                                }
                                d.ExpirationDate = DateTime.Now.AddYears(d.ExpiryDate).ToString("yyyy-MM-dd");
                            }
                        }
                    }
                    var oldInboundList = BaseService<InboundList>.CurrentRepository.FindList(o => o.InboundGoodsId == inboundGood.InboundGoodsId).ToList();
                    BaseService<InboundList>.CurrentRepository.RemoveRange(oldInboundList, false);
                    BaseService<InboundList>.CurrentRepository.AddRange(details, false);
                    re = Update(inboundGood, true);

                }
            }
            catch (FormatException)
            {
                //re.Message = "有保质期的产品生产日期必须填写！";
                re.Message = "生产日期格式错误！";
            }
            catch (Exception ex)
            {
                re.Message = ex.Message;
                Log.WriteError(ex);
            }
            return re;
        }
        #region 导入
        public static OpResult InboundImport(ImportSet obj, System.Web.HttpFileCollectionBase httpFiles, string fieldName, string columnName)
        {
            var op = new OpResult();
            var errLs = new List<string>();
            int count = 0;
            var list = new List<InboundList>();
            try
            {
                Dictionary<string, char> fieldCols = null;
                DataTable dt = null;
                op = ImportSetService.ImportSet(obj, httpFiles, fieldName, columnName, ref fieldCols, ref dt);
                if (!op.Successed) return op;
                var supplierId = System.Web.HttpContext.Current.Request["SupplierID"];
                var storeId = System.Web.HttpContext.Current.Request["StoreId"];
                var supplierBarcodes = new List<string>();
                var storeBarcodes = new List<string>();
                var products = new List<VwProduct>();
                if (!supplierId.IsNullOrEmpty())
                {
                    var bars = BaseService<ProductMultSupplier>.FindList(o => o.SupplierId == supplierId).Select(o => o.Barcode).Distinct().ToList();
                    var pros = BaseService<VwProduct>.FindList(o => o.SupplierId == supplierId || bars.Contains(o.Barcode));
                    products.AddRange(pros);
                    supplierBarcodes = pros.Select(o=>o.Barcode).ToList();
                    supplierBarcodes.AddRange(pros.Where(o => !o.Barcodes.IsNullOrEmpty()).SelectMany(o => o.Barcodes.Split(',')));
                }
                if (!storeId.IsNullOrEmpty())
                {
                    var ware = WarehouseService.Find(o => o.StoreId == storeId && o.CompanyId == CommonService.CompanyId);
                    if (ware != null)
                    {
                        var categorySNs = ware.CategorySN.Split(',').Select(o => int.Parse(o)).ToList();
                        var childs = ProductCategoryService.GetChildSNs(categorySNs);
                        var pros = BaseService<VwProduct>.FindList(o => o.CompanyId == CommonService.CompanyId && childs.Contains(o.CategorySN));
                        storeBarcodes = pros.Select(o => o.Barcode).ToList();
                        storeBarcodes.AddRange(pros.Where(o => !o.Barcodes.IsNullOrEmpty()).SelectMany(o => o.Barcodes.Split(',')));
                        products.AddRange(pros);
                    }
                }
                var barcodeIdx = fieldCols.GetValue("Barcode").ToType<int>() - 65;
                var buyPriceIdx = fieldCols.GetValue("BuyPrice").ToType<int>() - 65;
                var numberIdx = fieldCols.GetValue("InboundNumber").ToType<int>() - 65;
                var proDateIdx = fieldCols.GetValue("ProducedDate").ToType<int>() - 65;
                var giftIdx = fieldCols.GetValue("IsGift").ToType<int>() - 65;
                var memoIdx = fieldCols.GetValue("Memo").ToType<int>() - 65;
                count = dt.Rows.Count;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    var pos = i + obj.MinRow;
                    var dr = dt.Rows[i];
                    var barcode = dr.GetValue(barcodeIdx).ToString().Trim();
                    if (barcode.IsNullOrEmpty())
                    {
                        errLs.Add("行号[" + pos + "]条码为空!");
                        continue;
                    }
                    if(!supplierBarcodes.Any(o=>o==barcode))
                    {
                        errLs.Add("行号[" + pos + "]该供应单位下无此条码!");
                        continue;
                    }
                    if (!storeBarcodes.Any(o => o == barcode))
                    {
                        errLs.Add("行号[" + pos + "]该门店下无此条码!");
                        continue;
                    }
                    var buyPrice = dr.GetValue(buyPriceIdx).ToType<decimal?>();
                    if(!buyPrice.HasValue)
                    {
                        errLs.Add("行号[" + pos + "]该条码进价为空!");
                        continue;
                    }
                    var number = dr.GetValue(numberIdx).ToType<decimal?>();
                    if (!number.HasValue)
                    {
                        errLs.Add("行号[" + pos + "]该条码入库数量为空!");
                        continue;
                    }
                    var gift= dr.GetValue(giftIdx).ToString();
                    var proDate = dr.GetValue(proDateIdx).ToString().Trim();
                    DateTime t = DateTime.Now;
                    if (!proDate.IsNullOrEmpty() && DateTime.TryParse(proDate, out t))
                        proDate = t.ToString("yyyy-MM-dd");
                    else
                        proDate = string.Empty;
                    var pro = products.FirstOrDefault(o => o.Barcode == barcode || ("," + o.Barcodes + ",").Contains("," + barcode + ","));
                    list.Add(new InboundList() { 
                        Barcode=barcode,
                        ProductTitle=pro.Title,
                        BuyPrice = buyPrice.Value,
                        InboundNumber = number.Value,
                        Unit=pro.SubUnit,
                        ProducedDate = proDate,
                        SysPrice=pro.SysPrice,
                        Memo=dr.GetValue(memoIdx).ToString(),
                        IsGift=(short)(gift=="赠品"?1:0)
                    });
                }
            }
            catch (Exception ex)
            {
                op.Message = ex.Message;
                op.Successed = false;
                Log.WriteError(ex);
                errLs.Add("导入出现异常!");
            }
            return CommonService.GenerateImportHtml(errLs, count,data:list,isSuccess:false);
        }
        #endregion
        /// <summary>
        /// 设置入库单为已验状态
        /// </summary>
        /// <param name="Ids"></param>
        /// <returns></returns>
        public static OpResult SetInboundStateToChecked(string Ids)
        {
            var re = new OpResult() { Successed = false };
            try
            {
                var ids = Ids.Split(',').Select(o =>int.Parse(o));
                var goods = BaseService<InboundGoods>.FindList(o => ids.Contains(o.Id));
                var inboundGoodIds = goods.Select(o => o.InboundGoodsId).ToList();
                var list = BaseService<InboundList>.FindList(o => inboundGoodIds.Contains(o.InboundGoodsId));
                if (goods.Any(o => o.State == 1))
                {
                    var goodChecked = goods.Where(o => o.State == 1).FirstOrDefault();
                    re.Message = string.Format("入库单：{0} 已为已验状态", goodChecked.InboundGoodsId);
                    return re;
                }
                else
                {
                    goods.ForEach(o => { o.State = 1; o.VerifyTime = DateTime.Now; o.Details = list.Where(i => i.InboundGoodsId == o.InboundGoodsId).ToList(); });
                    list.ForEach(o => { o.State = 1; });
                    #region 更新采购单状态
                    var orderIds= goods.Where(o => o.Source == 1).Select(o => o.IndentOrderId).ToList();
                    var orders= BaseService<IndentOrder>.FindList(o=>orderIds.Contains(o.IndentOrderId));
                    var orderlist= BaseService<IndentOrderList>.FindList(o => orderIds.Contains(o.IndentOrderId));
                    foreach(var good in goods.Where(o=>o.Source==1))
                    {
                        good.Details.ForEach(o =>
                        {
                            var obj = orderlist.FirstOrDefault(i => i.IndentOrderId == good.IndentOrderId && i.Barcode == o.Barcode);
                            if (obj != null && o.InboundNumber >= obj.IndentNum)
                                obj.State = 5;
                        });
                        if(!orderlist.Any(i => i.IndentOrderId == good.IndentOrderId && i.State != 5))
                        {
                            var od= orders.FirstOrDefault(o => o.IndentOrderId == good.IndentOrderId);
                            if (od != null) od.State = 5;
                        }
                    }
                    #endregion
                    #region 写入库存变化记录
                    //List<Commodity> commodities = new List<Commodity>();
                    var invents = new List<InventoryRecord>();
                    goods.ForEach(o =>
                    {
                        //var tempCommodities = BaseService<Commodity>.FindList(c => c.StockNumber < 0 && c.StoreId == o.StoreId);
                        //var commodityDict = tempCommodities.GroupBy(c => c.Barcode).ToDictionary(c => c.Key, c => c.Sum(p => p.StockNumber));


                        var records = list.Where(p => p.InboundGoodsId == o.InboundGoodsId);
                        foreach (var item in records)
                        {
                            invents.Add(new InventoryRecord() { Barcode = item.Barcode, StoreId = o.StoreId, Number = item.InboundNumber, Source = 1, OperatId = item.InboundGoodsId });
                        }
                    });
                    re = BaseService<InboundGoods>.Update(goods);
                    if(re.Successed)
                        InventoryRecordService.SaveLog(invents);

                    #endregion
                }
            }
            catch (Exception ex)
            {
                re.Message = ex.Message;
                Log.WriteError(ex);
            }
            return re;
        }
        /// <summary>
        /// 获得入库单明细
        /// </summary>
        /// <param name="inboundGoodsId"></param>
        /// <returns></returns>
        public static object GetInboundListByInboundGoodsId(string inboundGoodsId, out int recordCount)
        {
            var queryInboundList = BaseService<InboundList>.CurrentRepository.QueryEntity;
            var queryRecord = BaseService<ProductRecord>.CurrentRepository.QueryEntity.Where(o=>o.CompanyId==CommonService.CompanyId);
            var queryData = BaseService<SysDataDictionary>.CurrentRepository.QueryEntity.Where(o => o.CompanyId == CommonService.CompanyId);
            var query = from x in queryInboundList
                        join y in queryRecord on x.Barcode equals y.Barcode
                        join z in queryData on y.SubUnitId equals z.DicSN into temp
                        from h in temp.DefaultIfEmpty()
                        where x.InboundGoodsId == inboundGoodsId
                        select new
                        {
                            y.ProductCode,
                            y.Title,
                            Barcode=x.AssistBarcode??x.Barcode,
                            y.SubUnitId,
                            x.SysPrice,
                            x.BuyPrice,
                            BuyPrice2=x.IsGift==1?0:x.BuyPrice,
                            Price = y.SysPrice,
                            x.InboundNumber,
                            Subtotal = x.BuyPrice * x.InboundNumber,
                            x.Memo,
                            x.Id,
                            SubUnit = h.Title,
                            x.ProducedDate,
                            x.IsGift
                        };

            recordCount = query.Count();
            var sql = query.ToString();
            return query.ToPageList();
        }

        /// <summary>
        /// 获得打印入库单
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public static List<InboundGoods> GetPrintInboundGoods(string Ids)
        {
            var ids = Ids.Split(',').Select(o =>int.Parse(o));
            var queryInGoods = BaseService<InboundGoods>.CurrentRepository;
            var queryInList = BaseService<InboundList>.CurrentRepository;
            var queryRecord = BaseService<ProductRecord>.CurrentRepository.QueryEntity;
            var queryData = BaseService<SysDataDictionary>.CurrentRepository.QueryEntity;
            var inGoods = queryInGoods.FindList(o => ids.Contains(o.Id)).ToList();

            foreach (var inGood in inGoods)
            {
                inGood.Details = queryInList.FindList(o => o.InboundGoodsId == inGood.InboundGoodsId).ToList();
                if (inGood.Details != null)
                {
                    foreach (var detail in inGood.Details)
                    {
                        var productRecode = queryRecord.FirstOrDefault(o => o.Barcode == detail.Barcode);
                        if (productRecode != null)
                        {
                            detail.ProductCode = productRecode.ProductCode;
                            detail.ProductTitle = productRecode.Title;
                            var unit = queryData.FirstOrDefault(o => o.DicSN == productRecode.SubUnitId);
                            if (unit != null)
                            {
                                detail.Unit = unit.Title;
                            }
                        }
                    }
                }
            }

            return inGoods;
        }

    }
}