﻿using Pharos.Logic.OMS;
using Pharos.Logic.OMS.Entity;
using Pharos.Logic.OMS.Entity.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pharos.Utility.Helpers;
using Pharos.Utility;
using Pharos.Logic.OMS.BLL;
using System.Data;
using QCT.Pay.Common;

namespace Pharos.OMS.Retailing.Controllers
{
    public class PayLicenseController : BaseController
    {
        [Ninject.Inject]
        //商户资料
        TradersService tradersService { get; set; }

        [Ninject.Inject]
        //BLL商家支付许可档案
        PayLicenseService payLicenseService { get; set; }

        [Ninject.Inject]
        AreaService areaService { get; set; }

        [Ninject.Inject]
        BusinessService businessService { get; set; }

        [Ninject.Inject]
        //BLL商家结算账户
        BankAccountService bankAccountService { get; set; }

        [Ninject.Inject]
        //BLL审批日志
        ApproveLogService approveLogService { get; set; }

        [SysPermissionValidate]
        public ActionResult Index()
        {
            //指派人
            ViewBag.user = ListToSelect(tradersService.getUserList().Select(o => new SelectListItem() { Value = o.UserId, Text = o.FullName }), emptyTitle: "全部");
            return View();
        }

        [SysPermissionValidate(111)]
        public ActionResult Save(int? id, int BankState=0)
        {
            //省市名称
            string ProCitName = "";
            //一二级类目名称
            string BusName = "";
            //商户资料
            Traders traders = new Traders();
           //商家结算账户
            BankAccount bankAccount = new BankAccount();
            //审核日志
            List<ViewApproveLog> logList = new List<ViewApproveLog>();
            //资质或证件
            string url1 = "";
            //企业证件
            string url2 = "";
            //身份证正面
            string url3 = "";
            //身份证反面
            string url4 = "";
            var obj = new PayLicense
            {
                
            };
            if (id.HasValue)
            {
                obj = payLicenseService.GetEntityById(id.Value);
                ProCitName = areaService.GetOne(obj.ProvinceId).Title+ "/" + areaService.GetOne(obj.CityId).Title;
                Business business1 = businessService.GetOneByWhere(o => o.ById == obj.BusinessId1);
                Business business2 = businessService.GetOneByWhere(o => o.ById == obj.BusinessId2);
                if (business1 != null)
                {
                    BusName = business1.Title;
                    if (business2 != null)
                    {
                        BusName = BusName + "/" + business2.Title;
                    }
                }
                traders = tradersService.GetEntityByWhere(o=>o.CID==obj.CID);
                bankAccount = bankAccountService.GetEntityByWhere(o=>o.LicenseId==obj.LicenseId);
                bankAccount.BankCityName = payLicenseService.getCityTitle(bankAccount.BankCityId);
                short moduleNum=Convert.ToInt16(ApproveLogNum.支付许可);
                logList = approveLogService.getList(obj.LicenseId);
                url1 = Tool.getPLicensePicPath(obj.LicenseId,1) + obj.ECertificateUrl1;
                url2 = Tool.getPLicensePicPath(obj.LicenseId, 2) + obj.ECertificateUrl2;
                url3 = Tool.getPLicensePicPath(obj.LicenseId, 3) + obj.IDCardUrl1;
                url4 = Tool.getPLicensePicPath(obj.LicenseId, 4) + obj.IDCardUrl2;
            }
            //指派人
            ViewBag.user = ListToSelect(tradersService.getUserList().Select(o => new SelectListItem() { Value = o.UserId, Text = o.FullName }), emptyTitle: "请选择");
            //经营类目
            ViewBag.BusinessScopeId = tradersService.getBusinessList();
            //所属体系
            ViewBag.SourceT = EnumToSelect(typeof(PaySourceType), emptyTitle: "请选择");
            //省市名称
            ViewBag.ProvinceCityName = ProCitName;
            //企业性质
            ViewBag.Nature = ListToSelect(tradersService.getDataList(500).Select(o => new SelectListItem() { Value = o.DicSN.ToString(), Text = o.Title }), emptyTitle: "请选择");
            //一二级类目名称
            ViewBag.Bus1Bus2Name = BusName;
            //商户资料
            ViewBag.Tra = traders;
            //商家结算账户
            ViewBag.bank = bankAccount;
            //审核日志
            ViewBag.logList = logList;
            //资质或证件
            ViewBag.url1 = url1;
            //企业证件
            ViewBag.url2 = url2;
            //身份证正面
            ViewBag.url3 = url3;
            //身份证反面
            ViewBag.url4 = url4;
            //结算账户状态
            ViewBag.BankState = BankState;
            return View(obj.IsNullThrow());
        }

        [HttpPost]
        public ActionResult Save(int Id)
        {
            PayLicense payLicense = new PayLicense();
            DateTime dt = DateTime.Now;
            if (Id == 0)
            {
                payLicense.LicenseId = CommonService.GUID.ToUpper();
                payLicense.State = 1;
                payLicense.CreateUID = CurrentUser.UID;
                payLicense.CreateDT = dt;
            }
            else
            {
                payLicense = payLicenseService.GetEntityById(Id);
                if (payLicense.State == (short)TraderPayLicenseState.Reject)
                {
                    payLicense.State = (short)TraderPayLicenseState.NotAuditing;
                }
            }
            payLicense.ModifyUID = CurrentUser.UID;
            payLicense.ModifyDT = dt;
            TryUpdateModel<PayLicense>(payLicense);
            var op = payLicenseService.Save(payLicense, Id, dt, Request.Params, Request.Files);
            return new OpActionResult(op);
        }

        public ActionResult FindPageList()
        {
            var count = 0;
            var list = payLicenseService.GetPageList(Request.Params, out count);
            return ToDataGrid(list, count);
        }

        /// <summary>
        /// 获取CID
        /// </summary>
        /// <param name="keyword"></param>
        /// <returns></returns>
        public ActionResult GetCidWhere(string keyword)
        {
            var list = payLicenseService.GetCIDWhere(Request.Params);
            return ToDataGrid(list, 0);
        }

        /// <summary>
        /// 获取代理商编号
        /// </summary>
        /// <returns></returns>
        public ActionResult GetAgentsIdWhere()
        {
            var list = payLicenseService.GetAgentsIdWhere(Request.Params);
            return ToDataGrid(list, 0);
        }

        /// <summary>
        /// 获取商户资料
        /// </summary>
        /// <param name="CID"></param>
        /// <returns></returns>
        public string GetEntityTraders(int CID=0)
        {
            Traders traders = tradersService.GetTraderByCID(CID);
            if (traders == null)
            {
                traders = new Traders();
            }
            return traders.ToJson();
        }

        public ActionResult GetCityWhere(string keyword)
        {
            var list = payLicenseService.GetCityWhere(Request.Params);
            return ToDataGrid(list, 0);
        }

        /// <summary>
        /// 设为通过、列入黑名单
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        public ActionResult UpStatus(string ids,short state)
        {
            return new JsonNetResult(payLicenseService.UpStatus(ids,state));
        }

        /// <summary>
        /// 驳回商户信息申请
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [SysPermissionValidate(112)]
        public ActionResult Overrule(string ids)
        {
            //驳回原因
            ViewBag.rea = ListToSelect(tradersService.getDataList(550).Select(o => new SelectListItem() { Value = o.DicSN.ToString(), Text = o.Title }), emptyTitle: "请选择");
            //ids
            ViewBag.idss = ids;
            return View();
        }
        
        /// <summary>
        /// 驳回商户信息申请
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="reason"></param>
        /// <param name="specific"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Overrule(string ids, int reason, string specific)
        {
            return new JsonNetResult(payLicenseService.Overrule(ids, reason, specific));
        }

        /// <summary>
        /// 是否存在已经驳回
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public ActionResult ExistOverrule(string ids)
        {
            return new JsonNetResult(payLicenseService.ExistOverrule(ids));
        }

        /// <summary>
        /// 是否已经设置所选商户支付状态
        /// </summary>
        /// <returns></returns>
        public ActionResult ExistStatusSel(string ids, short state)
        {
            return new JsonNetResult(payLicenseService.ExistStatusSel(ids,state));
        }

        /// <summary>
        /// 设置所选商户支付状态（cshtml）
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="state">4是暂停，5是注销，6是无效</param>
        /// <returns></returns>
        public ActionResult SetStatus(string ids, short state)
        {
            string msg = "";
            if (state == (short)TraderPayLicenseState.Pause)
            {
                msg = "暂停商户后，该商户将不能进行支付，并且相关登录帐号将无法登录支付后台系统！";
            }
            else if (state == (short)TraderPayLicenseState.Cancel)
            {
                msg = "注销商户后，该商户将停止所有业务操作，如需使用须在3个月后重新申请！";
            }
            else if (state == (short)TraderPayLicenseState.Invalid)
            {
                msg = "设置商户无效后，将<span style='color:#ff0000;'>无法修改</span>其状态，并且该商户的结算账户、商家支付通道也会无效，<span style='color:#ff0000;'>请谨慎操作</span>！";
            }
            ViewBag.msg = msg;
            //ids
            ViewBag.idss = ids;
            ViewBag.sta = state;
            return View();
        }

        /// <summary>
        /// 设置所选商户支付状态（cshtml）
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="state">7是暂停支付许可，8是注销支付许可，6是设为可用支付</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SetStatus(string ids, short state, string specific)
        {
            return new JsonNetResult(payLicenseService.SetStatus(ids, state, specific));
        }

        public ActionResult Deletes(string ids)
        {
            return new JsonNetResult(payLicenseService.Deletes(ids));
        }

        /// <summary>
        /// 获取一级类目
        /// </summary>
        /// <returns></returns>
        public ActionResult GetBusiness1(string defaultTitle = "请选择")
        {
            var business1 = payLicenseService.getBusiness1(defaultTitle);
            return new JsonNetResult(business1);
        }

        /// <summary>
        /// 获取二级类目
        /// </summary>
        /// <returns></returns>
        public ActionResult GetBusiness2(string ParentId, string defaultTitle = "请选择")
        {
            var business2 = payLicenseService.getBusiness2(ParentId, defaultTitle);
            return new JsonNetResult(business2);
        }

        public ActionResult Img(string src)
        {
            ViewBag.src = src;
            return View();
        }
    }
}