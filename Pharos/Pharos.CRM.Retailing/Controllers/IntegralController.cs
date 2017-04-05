﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pharos.Utility.Helpers;
using Pharos.Logic.BLL;
using Pharos.Logic.Entity;
using Pharos.Utility;

namespace Pharos.CRM.Retailing.Controllers
{
    public class IntegralController : BaseController
    {
        public ActionResult PayIntegral()
        {
            var customers = EnumToSelect(typeof(Pharos.Logic.CustomerType), selectValue: 0);
            customers.Remove(customers.FirstOrDefault(o => o.Selected));
            ViewBag.customers = customers;
            var obj= MemberIntegralSetService.Find(o => o.Nature == 1 && o.CompanyId==CommonService.CompanyId) ?? new MemberIntegralSet() { Scale = 10,Nature=1 };
            return View(obj);
        }
        [HttpPost]
        public ActionResult PayIntegral(MemberIntegralSet obj)
        {
            obj.CustomerObj = Request["CustomerObj"];
            var re = MemberIntegralSetService.SaveOrUpdate(obj);
            return Content(re.ToJson());
        }
        public ActionResult ProductIntegral()
        {
            return View();
        }
        [HttpPost]
        public ActionResult FindPageList()
        {
            int count = 0;
            var list=MemberIntegralSetService.FindPageList(Request.Params,out count);
            return ToDataGrid(list, count);
        }
        public ActionResult SaveProductIntegral(int? id)
        {
            var customers = EnumToSelect(typeof(Pharos.Logic.CustomerType), selectValue: 0);
            customers.Remove(customers.FirstOrDefault(o => o.Selected));
            ViewBag.customers = customers;
            var parents= ProductCategoryService.GetParentTypes().Select(o => new DropdownItem() { Value = o.CategorySN.ToString(), Text = o.Title }).ToList();
            parents.Insert(0, new DropdownItem("", "请选择"));
            ViewBag.parenttypes = parents.ToJson();
            var obj = id.HasValue ? MemberIntegralSetService.FindById(id.Value) : new MemberIntegralSet() { Scale = 10, Nature = 2 };
            return View(obj.IsNullThrow());
        }
        [HttpPost]
        public ActionResult SaveProductIntegral(MemberIntegralSet obj)
        {
            var op = MemberIntegralSetService.SaveOrUpdate(obj);
            return Content(op.ToJson());
        }
        [HttpPost]
        public ActionResult LoadTypeList(int? integralId)
        {
            var list = MemberIntegralSetService.LoadTypeList(integralId);
            return ToDataGrid(list, 0);
        }
        [HttpPost]
        public ActionResult LoadProductList(int? integralId)
        {
            var list = MemberIntegralSetService.LoadProductList(integralId);
            return ToDataGrid(list, 0);
        }
        [HttpPost]
        public ActionResult Delete(int[] ids)
        {
            return new JsonNetResult(MemberIntegralSetService.Delete(ids));
        }
    }
}