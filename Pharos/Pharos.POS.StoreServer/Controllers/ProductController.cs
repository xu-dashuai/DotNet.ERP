﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pharos.POS.StoreServer.Controllers;
using Pharos.Logic.BLL;
using Pharos.Logic.Entity;
using Pharos.Utility;
using Pharos.Utility.Helpers;

namespace Pharos.POS.StoreServer.Controllers
{
    public class ProductController : BaseController
    {
        //
        // GET: /ProductWeight/

        //public ActionResult Index()
        //{
        //    return View();
        //}

        private readonly ScaleSettingsBLL settingbll = new ScaleSettingsBLL();
        private readonly ScaleHistoryBLL scaleHistory = new ScaleHistoryBLL();
        public ActionResult ProductWeight()
        {
            //门店下拉数据
            //ViewBag.stores = ListToSelect(WarehouseService.GetList().Select(o => new SelectListItem() { Value = o.StoreId, Text = o.Title }), emptyTitle: "全部");
            //ViewBag.stores = .Title;
            var store = WarehouseService.GetAdminList(CommonService.CompanyId, Sys.SysCommonRules.CurrentStore).FirstOrDefault();
            ViewBag.stores = string.Empty;
            if (store != null)
            {
                ViewBag.stores = store.Title;
            }

            //电子秤下拉数据
            ViewBag.scale = ListToSelect(settingbll.GetAllSettingsByStore().Select(o => new SelectListItem() { Value = o.IpAddress, Text = o.SN + " " + o.Title }), emptyTitle: "请选择");
            //历史批次下拉数据
            ViewBag.history = ListToSelect(scaleHistory.GetAllHistoryByStore().Skip(0).Take(10).Select(o => new SelectListItem() { Value = o, Text = o }), emptyTitle: "重新选择商品");
            //商品分类数据

            return View();
        }
        /// <summary>
        /// 菜单树
        /// </summary>
        /// <returns></returns>
        public ActionResult FindTreeList()
        {
            int count = 0;
            var list = ProductCategoryService.FindPageList(Request.Params, out count, false);
            list.Each(o =>
            {
                o.Childrens.Each(i =>
                {
                    i.OnOff = i.Childrens != null && i.Childrens.Any() ? "closed" : "open";
                });
            });
            var trees = new List<ProductCategory>(){
                new ProductCategory(){
                Id = 0,
                Title = "商品分类",
                OnOff="open",
                Childrens = new List<ProductCategory>()
                }
            };
            trees[0].Childrens.AddRange(list);
            return new JsonNetResult(trees);
        }
        /// <summary>
        /// 根据菜单选择的类别 加载商品
        /// </summary>
        /// <returns></returns>
        public ActionResult FindProductByCategory(int category)
        {
            int count = 0;
            var result = ProductService.GetProductByStore(category, Sys.SysCommonRules.CurrentStore, 2, "", out count);
            return ToDataGrid(result, count);
        }

        /// <summary>
        /// 根据批次查询称重商品数据
        /// </summary>
        /// <param name="batch"></param>
        /// <returns></returns>
        public ActionResult ProductWeigtDataByBatch(string batch)
        {
            int count = 0;
            var result = ProductService.GetProductByBatch(batch, out count);
            return ToDataGrid(result, count);
        }

        /// <summary>
        /// 保存电子秤的配置
        /// </summary>
        /// <param name="setting"></param>
        /// <returns></returns>
        public ActionResult CreateSetting(ScaleSettings setting)
        {
            var result = settingbll.CreateSetting(setting);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 删除配置信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult RemoveSetting(int id)
        {
            var result = settingbll.RemoveSetting(id);
            return Content(result.ToJson());

        }

        public ActionResult ProductWeightSetting()
        {
            //设备类型
            ViewBag.deviceBands = (new List<DropdownItem>() { new DropdownItem() { IsSelected = true, Text = "友声", Value = "友声" } }).ToJson();
            ViewBag.deviceModel = (new List<DropdownItem>() { new DropdownItem() { IsSelected = true, Text = "TM-15A", Value = "TM-15A" } }).ToJson();
            ViewBag.keyCount = (new List<DropdownItem>() { new DropdownItem() { IsSelected = true, Text = "63", Value = "63" } }).ToJson();
            ViewBag.pageModel = (new List<DropdownItem>() { new DropdownItem() { IsSelected = true, Text = "单页", Value = "1" }, new DropdownItem() { IsSelected = false, Text = "双页", Value = "2" } }).ToJson();

            return View();
        }
        /// <summary>
        /// 网格数据
        /// </summary>
        /// <returns></returns>
        public ActionResult ProductWeigtSettingPageList()
        {
            int count = 0;
            var result = settingbll.FindPageList(out count);
            return ToDataGrid(result, count);
        }

        /// <summary>
        /// 商品传秤
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="ips"></param>
        /// <param name="isClear"></param>
        /// <returns></returns>
        public ActionResult SendProduct(string ids, string ips, bool isClear)
        {
            var result = new OpResult();


            List<string> ipArr = new List<string>();
            if (string.IsNullOrEmpty(ips))
            {
                result.Successed = false;
                result.Message = "秤号数据异常，请重试！";
            }
            else
            {
                //if (type == 1)
                //{
                //判断配置信息
                //var setting= settingbll.GetSettingByIp()

                if (ips.Contains(","))
                {
                    var arr = ips.Split(',');
                    foreach (var item in arr)
                    {
                        ipArr.Add(item);
                    }
                }
                else
                {
                    ipArr.Add(ips);
                }
                //}
                result = ProductService.SendProduct(ids, ipArr, isClear);
            }
            return Content(result.ToJson());
        }

        #region 品类和商品弹窗
        public ActionResult SelectProduct()
        {
            ViewBag.brands = ListToSelect(ProductBrandService.GetList().Select(o => new SelectListItem() { Value = o.BrandSN.ToString(), Text = o.Title }), emptyTitle: "全部");
            return View();
        }
        public ActionResult SelectType()
        {
            ViewBag.parenttypes = ListToSelect(ProductCategoryService.GetParentTypes().Select(o => new SelectListItem() { Value = o.CategorySN.ToString(), Text = o.Title }), emptyTitle: "请选择");
            ViewBag.brands = ListToSelect(ProductBrandService.GetList().Select(o => new SelectListItem() { Value = o.BrandSN.ToString(), Text = o.Title }), emptyTitle: "全部");
            return View();
        }
        public ActionResult SelectType2()
        {
            ViewBag.parenttypes = ListToSelect(ProductCategoryService.GetParentTypes().Select(o => new SelectListItem() { Value = o.CategorySN.ToString(), Text = o.Title }), emptyTitle: "请选择");
            return View();
        }
        [HttpPost]
        public ActionResult FindTypePageList()
        {
            int count = 0;
            var list = ProductService.FindTypePageList(Request.Params, out count);
            return ToDataGrid(list, count);
        }
        [HttpPost]
        public ActionResult FindTypePageList2()
        {
            int count = 0;
            var list = ProductService.FindTypePageList2(Request.Params, out count);
            return ToDataGrid(list, count);
        }
        #endregion
        /// <summary>
        /// 输入自动完成商品
        /// </summary>
        /// <param name="searchName"></param>
        /// <param name="supplierID"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetProductInput(string searchName, string supplierID, string zp, string storeId, string order, short? getStockNum)
        {
            if (searchName.IsNullOrEmpty()) return new EmptyResult();
            var express = DynamicallyLinqHelper.Empty<VwProduct>()
                .And(o => (o.Barcode != null && o.Barcode.StartsWith(searchName)) || o.Title.Contains(searchName) || (o.Barcodes != null && o.Barcodes.Contains(searchName)))
                .And(o => o.IsAcceptOrder == 1, order.IsNullOrEmpty()).And(o => o.CompanyId == CommonService.CompanyId);
            if (!supplierID.IsNullOrEmpty())
            {
                var sp = supplierID.Split(',').ToList();
                var bars = BaseService<ProductMultSupplier>.FindList(o => sp.Contains(o.SupplierId)).Select(o => o.Barcode).Distinct().ToList();
                express = express.And(o => (sp.Contains(o.SupplierId) || bars.Contains(o.Barcode)), supplierID.IsNullOrEmpty());
            }
            if (!storeId.IsNullOrEmpty())
            {
                var ware = WarehouseService.Find(o => o.StoreId == storeId && o.CompanyId == CommonService.CompanyId);
                if (ware != null)
                {
                    var categorySNs = ware.CategorySN.Split(',').Select(o => int.Parse(o)).ToList();
                    var childs = ProductCategoryService.GetChildSNs(categorySNs, true);
                    express = express.And(o => childs.Contains(o.CategorySN));
                }
            }
            var list = BaseService<VwProduct>.FindList(express, takeNum: 20);
            list = ProductService.SetAssistBarcode(list);
            ProductService.SetSysPrice<VwProduct>(storeId, list, supplierId: supplierID);
            if (getStockNum == 1) ProductService.SetStockNum(storeId, list);
            return ToDataGrid(list, 20);
        }

        [HttpPost]
        public ActionResult FindPageList()
        {
            int count = 0;
            var list = ProductService.LoadProductList(Request.Params, out count);
            return ToDataGrid(list, count);
        }
    }
}