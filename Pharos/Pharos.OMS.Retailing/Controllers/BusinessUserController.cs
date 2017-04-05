﻿using Pharos.Logic.OMS;
using Pharos.Logic.OMS.Entity;
using Pharos.Logic.OMS.EntityExtend;
using Pharos.Logic.OMS.Entity.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Pharos.Utility.Helpers;
using Pharos.Utility;
using Pharos.Logic.OMS.BLL;

namespace Pharos.OMS.Retailing.Controllers
{
    public class BusinessUserController : BaseController
    {
        //结算账户信息BLL
        [Ninject.Inject]
        BankCardInfoService bankCardInfoService { get; set; }

        [Ninject.Inject]
        TradersService tradersService { get; set; }

        //BLL商家登录账号
        [Ninject.Inject]
        TradersUserService tradersUserService { get; set; }

        [SysPermissionValidate]
        public ActionResult Index()
        {
            //指派人
            ViewBag.user = ListToSelect(tradersService.getUserList().Select(o => new SelectListItem() { Value = o.UserId, Text = o.FullName }), emptyTitle: "全部");
            return View();
        }

        [SysPermissionValidate(136)]
        public ActionResult Save(int? id)
        {
            var obj = new TradersUser
            {

            };
            if (id.HasValue)
            {
                obj = tradersUserService.GetEntityById(id.Value);
                obj.LoginPwd = "";
            }
            return View(obj.IsNullThrow());
        }

        [HttpPost]
        public ActionResult Save(int Id, string LoginPwd)
        {
            TradersUser tradersUser = new TradersUser();
            if (Id == 0)
            {
                tradersUser.TUserId = CommonService.GUID.ToUpper();
                tradersUser.AccountType = 2;
                tradersUser.State = 1;
                tradersUser.SysCreateUID = CurrentUser.UID;
                tradersUser.CreateDT = DateTime.Now;
                TryUpdateModel<TradersUser>(tradersUser);
                tradersUser.LoginPwd = Security.MD5_Encrypt(tradersUser.LoginPwd);
            }
            else
            {
                tradersUser = tradersUserService.GetEntityById(Id);
                if (LoginPwd.IsNullOrEmpty())
                {
                    string[] s = new string[] { "CID", "TStoreInfoId", "FullName", "LoginName", "Phone", "Memo" };
                    TryUpdateModel<TradersUser>(tradersUser, s);
                }
                else
                {
                    TryUpdateModel<TradersUser>(tradersUser);
                    tradersUser.LoginPwd = Security.MD5_Encrypt(tradersUser.LoginPwd);
                }
            }
            var op = tradersUserService.Save(tradersUser, Id, Request.Params);
            return new OpActionResult(op);
        }

        /// <summary>
        /// 获取CID
        /// </summary>
        /// <param name="keyword"></param>
        /// <returns></returns>
        public ActionResult GetCIDStore(string keyword)
        {
            var list = tradersUserService.GetCIDStore(Request.Params);
            return ToDataGrid(list, 0);
        }

        /// <summary>
        /// 获取商户资料
        /// </summary>
        /// <param name="CID"></param>
        /// <returns></returns>
        public string GetTradersFullTitle(int CID = 0)
        {
            return tradersUserService.getTradersFullTitle(CID);
        }

        /// <summary>
        /// 获取门店编号
        /// </summary>
        /// <param name="CID"></param>
        /// <returns></returns>
        public ActionResult getStoreNum(int CID)
        {
            var list = tradersUserService.getStoreNum(CID);
            return new JsonNetResult(list);
        }

        /// <summary>
        /// 获取门店全称
        /// </summary>
        /// <param name="TStoreInfoId"></param>
        /// <returns></returns>
        public string getStoreFullTitle(string TStoreInfoId)
        {
            TradersStore tradersStore = tradersUserService.getStoreFullTitle(TStoreInfoId);
            return tradersStore.ToJson();
        }

        public ActionResult FindPageList()
        {
            var count = 0;
            var list = tradersUserService.GetPageList(Request.Params, out count);
            return ToDataGrid(list, count);
        }

        /// <summary>
        /// 更新状态
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UpState(string ids, int state)
        {
            return new JsonNetResult(tradersUserService.UpState(ids, state));
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(139)]
        public ActionResult Delete(string ids)
        {
            return new JsonNetResult(tradersUserService.Delete(ids));
        }

    }
}