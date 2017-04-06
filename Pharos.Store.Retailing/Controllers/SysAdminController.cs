﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Newtonsoft.Json;
using Pharos.Utility;
using Pharos.Utility.Helpers;
using System.Reflection;
using Pharos.Sys.BLL;
using Pharos.Sys.EntityExtend;
using Pharos.Sys.Entity;
using Pharos.Sys.Models;
using Pharos.Sys;
using Pharos.Logic.ApiData.Mobile.EaseMob;
using Pharos.Logic.ApiData.Mobile.Services;
using Pharos.Logic;
using System.IO;
using System.Net;
using System.Data;
using System.Text.RegularExpressions;
using Pharos.Store.Retailing.Models;

namespace Pharos.Store.Retailing.Controllers
{
    public class SysAdminController : BaseController
    {
        private readonly SysDepartmentBLL _depBLL = new SysDepartmentBLL();
        private readonly SysRoleBLL _roleBLL = new SysRoleBLL();
        private readonly SysMenuBLL _menuBLL = new SysMenuBLL();
        private readonly SysLimitsBLL _limitBLL = new SysLimitsBLL();
        private readonly SysDataDictionaryBLL _dicBLL = new SysDataDictionaryBLL();
        private readonly SysLogBLL _logBLL = new SysLogBLL();
        private readonly SysUserInfoBLL _userBLL = new SysUserInfoBLL();
        private readonly SysCustomMenusBLL _sysCustomMenusBLL = new SysCustomMenusBLL();
        private readonly SysWebSettingBLL _sysWebSettingBLL = new SysWebSettingBLL();
        private readonly SysPaymentSettingBLL _sysPaymentSettingBLL = new SysPaymentSettingBLL();
        string store = Sys.SysCommonRules.CurrentStore;
        #region 组织机构
        /// <summary>
        /// 组织机构-页面加载
        /// </summary>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.组织机构_查看机构或部门)]
        public ActionResult Org()
        {
            return View();
        }

        /// <summary>
        /// 组织机构-页面数据加载
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.组织机构_查看机构或部门)]
        public ActionResult GetOrg()
        {
            var datas = _depBLL.GetExtList();
            //构造树数据
            List<Sys.EntityExtend.SysDepartmentsExt> models = new List<Sys.EntityExtend.SysDepartmentsExt>();
            if (datas != null)
            {
                datas.Where(t => t.PDepId == 0).Each(t =>
                {
                    models.Add(GetOrgChildsEasyuiGridData(t, datas));
                });
            }
            return ToDataGrid(models, 2);
        }
        /// <summary>
        /// 组织机构-新增或编辑组织机构表单-页面加载
        /// </summary>
        /// <param name="id"></param>
        /// <param name="pid"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.组织机构_查看机构或部门)]
        public ActionResult OrgSave(int id = 0, int pdepid = 0)
        {
            var model = _depBLL.GetModel(id, pdepid);
            return View(model);
        }
        /// <summary>
        /// 组织机构-新增或编辑组织机构表单-保存方法
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.组织机构_创建机构或部门)]
        public ActionResult OrgSave(Sys.Entity.SysDepartments model)
        {
            var result = _depBLL.SaveDep(model);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 组织机构-修改组织机构状态
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.组织机构_关闭或显示机构部门)]
        public ActionResult ChangeOrgStatusById(int id)
        {
            var result = _depBLL.ChangeStatus(id);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 组织机构-移除组织机构
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.组织机构_删除机构或部门)]
        public ActionResult RemoveOrg(int id)
        {
            var re = _depBLL.Delete(id);
            return Content(re.ToJson());
        }
        /// <summary>
        /// 组织机构-新建组织机构表单-构造组织机构下拉树数据对象
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        //[HttpPost]
        [HttpGet]
        //[SysPermissionValidate(Code = Sys.SysConstLimits.组织机构_查看机构或部门)]
        public ActionResult GetOrgTreeList(string id)
        {
            var datas = _depBLL.GetExtList();
            //构造树数据
            List<EasyuiTree> models = new List<EasyuiTree>();
            datas.Where(t => t.PDepId == 0).Each(t =>
            {
                models.Add(GetOrgChildsEasyuiTreeData(t, datas));
            });
            return new JsonNetResult(models);
        }
        #region private
        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <param name="source"></param>
        /// <returns></returns>
        private Sys.EntityExtend.SysDepartmentsExt GetOrgChildsEasyuiGridData(Sys.EntityExtend.SysDepartmentsExt model, List<Sys.EntityExtend.SysDepartmentsExt> source)
        {
            var childs = source.Where(s => s.PDepId == model.DepId);
            if (childs.Count() > 0)
            {
                model.Childs = new List<Sys.EntityExtend.SysDepartmentsExt>();
                childs.Each(t =>
                {
                    model.Childs.Add(GetOrgChildsEasyuiGridData(t, source));
                });
            }
            return model;
        }
        /// <summary>
        /// 构造菜单下拉树子集数据
        /// </summary>
        /// <param name="menu"></param>
        /// <param name="source"></param>
        /// <returns></returns>
        private EasyuiTree GetOrgChildsEasyuiTreeData(Sys.EntityExtend.SysDepartmentsExt data, List<Sys.EntityExtend.SysDepartmentsExt> source)
        {
            var model = new EasyuiTree { id = data.DepId.ToString(), text = data.Title };
            var childs = source.Where(s => s.PDepId == data.DepId);
            if (childs.Count() > 0)
            {
                model.children = new List<EasyuiTree>();
                childs.Each(t =>
                {
                    model.children.Add(GetOrgChildsEasyuiTreeData(t, source));
                });
            }
            return model;
        }
        #endregion
        #endregion 组织机构

        #region 用户管理
        /// <summary>
        /// 用户管理-页面加载
        /// </summary>
        /// <returns></returns>
        //[SysPermissionValidate(Code = Sys.SysConstLimits.用户管理_查看用户)]
        public ActionResult Users()
        {
            return View();
        }
        /// <summary>
        /// 用户管理-页面数据加载
        /// </summary>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetUsers(string keyword, int Status = 0, int page = 1, int rows = 30)
        {
            var entities = _userBLL.GetStoreUser(store, keyword, Status);
            foreach (var item in entities)
            {
                var temp = item.OperateAuth;
                item.OperateAuth = GetStoreRole(temp).Trim(',');
                item.Stroes = GetStores(temp).Trim(',');
            }

            return ToDataGrid(entities, entities.Count);
        }
        /// <summary>
        /// 根据角色获取门店角色
        /// </summary>
        /// <param name="operateAuth"></param>
        /// <returns></returns>
        private string GetStoreRole(string operateAuth)
        {
            var result = string.Empty;
            if (!string.IsNullOrEmpty(operateAuth))
            {
                if (operateAuth.Contains('|'))
                {
                    var arr = operateAuth.Split('|');
                    foreach (var item in arr)
                    {
                        if (item.StartsWith(store + ","))
                        {
                            if (item.EndsWith(",1"))
                            {
                                result += "店长,";
                            }
                            else if (item.EndsWith(",2"))
                            {
                                result += "营业员,";
                            }
                            else if (item.EndsWith(",3"))
                            {
                                result += "收银员,";
                            }
                            else if (item.EndsWith(",4"))
                            {
                                result += "数据维护,";
                            }
                        }
                    }
                }
                else
                {
                    if (operateAuth.EndsWith(",1"))
                    {
                        result += "店长,";
                    }
                    else if (operateAuth.EndsWith(",2"))
                    {
                        result += "营业员,";
                    }
                    else if (operateAuth.EndsWith(",3"))
                    {
                        result += "收银员,";
                    }
                    else if (operateAuth.EndsWith(",4"))
                    {
                        result += "数据维护,";
                    }
                }
            }
            return result;
        }
        /// <summary>
        /// 根据员工姓名 或 登录帐号查找用户
        /// </summary>
        /// <param name="fullName"></param>
        /// <param name="account"></param>
        /// <returns></returns>
        public ActionResult GetUserData(string fullName, string loginName)
        {
            if (string.IsNullOrEmpty(fullName) && string.IsNullOrEmpty(loginName))
            {
                return Content("");
            }
            var result = _userBLL.GetUserData(fullName, loginName);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 获取所在门店
        /// </summary>
        /// <param name="operateAuth"></param>
        /// <returns></returns>
        private string GetStores(string operateAuth)
        {
            var result = string.Empty;
            var stores = Pharos.Logic.BLL.WarehouseService.FindList(o => o.CompanyId == Pharos.Logic.BLL.CommonService.CompanyId && ("|" + operateAuth).Contains("|" + o.StoreId + ",")).ToList();
            foreach (var item in stores)
            {
                result += item.Title + ",";
            }
            return result;
        }
        /// <summary>
        /// 用户管理-新增或编辑用户表单-页面加载
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        //[SysPermissionValidate(Code = Sys.SysConstLimits.用户管理_查看用户)]
        public ActionResult UserSave(int id = 0)
        {
            var model = _userBLL.GetStoreUserInfoById(id);
            ViewBag.sysUserState = EnumToSelect(typeof(Pharos.Sys.SysUserState), emptyTitle: "请选择");
            bool isDz = false;
            bool isYyy = false;
            bool isSyy = false;
            bool isSjwh = false;
            if (model != null)
            {
                if (("|" + model.OperateAuth + "|").Contains("|" + store + ",1|"))
                {
                    isDz = true;
                }
                if (("|" + model.OperateAuth + "|").Contains("|" + store + ",2|"))
                {
                    isYyy = true;
                }
                if (("|" + model.OperateAuth + "|").Contains("|" + store + ",3|"))
                {
                    isSyy = true;
                }
                if (("|" + model.OperateAuth + "|").Contains("|" + store + ",4|"))
                {
                    isSjwh = true;
                }
            }
            ViewBag.isDz = isDz;
            ViewBag.isYyy = isYyy;
            ViewBag.isSyy = isSyy;
            ViewBag.isSjwh = isSjwh;
            ViewBag.roles = ListToSelect(new List<SelectListItem>() { new SelectListItem() { Value = store + "_1", Text = "店长" }, new SelectListItem() { Value = store + "_2", Text = "营业员" }, new SelectListItem() { Value = store + "_3", Text = "收银员" }, new SelectListItem() { Value = store + "_4", Text = "数据维护" } });
            var house = Pharos.Logic.BLL.WarehouseService.Find(o => o.StoreId == store && o.CompanyId == SysCommonRules.CompanyId);
            if (house != null)
            {
                ViewBag.storeTitle = house.Title;
            }
            return View(model);
        }
        /// <summary>
        /// 用户管理-新增或编辑用户表单-保存用户方法
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        //[SysPermissionValidate(Code = Sys.SysConstLimits.用户管理_创建用户)]
        public ActionResult UserSave(SysStoreUserInfo model)
        {
            model.OperateAuth = Request["OperateAuth"];
            if (!string.IsNullOrEmpty(model.OperateAuth))
            {
                var arr = model.OperateAuth.Split(',');
                for (int i = 0; i < arr.Count(); i++)
                {
                    arr[i] = arr[i].Replace("_", ",");
                }
                model.OperateAuth = string.Join("|", arr);
            }
            else
            {
                return Content(OpResult.Fail("请选择角色！").ToJson());
            }
            if (model.Id > 0)
            {
                var user = _userBLL.GetStoreUserInfoById(model.Id);
                if (!string.IsNullOrEmpty(user.OperateAuth))
                {
                    if (user.OperateAuth.Contains("|" + store + ",") || user.OperateAuth.StartsWith(store + ","))
                    {
                        Regex rg = new Regex(@"\|+(" + store + @",.\|)+");
                        var startChar = string.Empty;
                        if (!user.OperateAuth.StartsWith("|"))
                        {
                            startChar = "|";
                        }
                        var re = rg.Replace(startChar + user.OperateAuth + startChar, "|" + model.OperateAuth + "|", 1);
                        model.OperateAuth = re;
                    }
                    else
                    {
                        if (!user.OperateAuth.EndsWith("|"))
                        {
                            user.OperateAuth = user.OperateAuth + "|";
                        }
                        model.OperateAuth = user.OperateAuth + model.OperateAuth;
                    }
                }
            }
            if (model.LoginPwd != null && model.LoginPwd.Length != 32)
            {
                model.LoginPwd = Pharos.Utility.Security.MD5_Encrypt(model.LoginPwd);
            }
            var result = _userBLL.SaveUser(model);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 用户管理-根据用户Id移除用户
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.用户管理_物理删除用户)]
        public ActionResult DeleteUser(int id, string uid)
        {
            var re = _userBLL.Delete(id, uid);

            #region 删除成功，则删除相应的环信IM用户
            ChatService.AccountDel(uid);
            #endregion

            return Content(re.ToJson());
        }
        /// <summary>
        /// 输入自动完成用户
        /// </summary>
        /// <param name="searchName"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetUserInput(string term, int? maxRows, string empty, string UID)
        {
            //if (term.IsNullOrEmpty()) return new EmptyResult();
            var paging = new Paging() { PageIndex = 1, PageSize = maxRows ?? 20 };
            var list = _userBLL.GetUsers(0, term, UID) ?? new List<SysUserInfo>();
            list = list.Where(o => o.LoginName != "superadmin").ToList();
            list.Insert(0, new SysUserInfo() { UID = "", LoginName = "", FullName = empty });
            return ToDataGrid(list, 0);
        }

        #region 门店角色设置
        /// <summary>
        /// 用户管理-门店角色设置
        /// </summary>
        /// <returns></returns>
        //[SysPermissionValidate(Code = Sys.SysConstLimits.用户管理_门店角色设置)]
        public ActionResult UserSettingStoreRole(string uid)
        {
            ViewBag.store = store;

            var obj = _userBLL.GetUserStoreRole(uid);
            if (obj == null)
            {
                obj = new SysStoreUserInfo() { UID = uid };
            }
            return View(obj);
        }
        /// <summary>
        /// 用户管理-门店角色设置数据加载
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        //[SysPermissionValidate(Code = Sys.SysConstLimits.用户管理_门店角色设置)]
        public ActionResult GetUserSettingStoreRole()
        {
            var objs = _userBLL.GetUserStoreRoles();
            return ToDataGrid(objs, objs.Rows.Count);
        }
        /// <summary>
        /// 用户管理-门店角色设置数据保存
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        //[SysPermissionValidate(Code = Sys.SysConstLimits.用户管理_门店角色设置)]
        public ActionResult UserSettingStoreRole(SysStoreUserInfo model)
        {
            if (string.IsNullOrEmpty(model.OperateAuth))
            {
                return Content(OpResult.Fail("至少选择1个角色！").ToJson());
            }
            var result = _userBLL.SaveStoreUserInfo(model);
            return Content(result.ToJson());
        }
        #endregion 门店角色设置

        #endregion 用户管理

        #region 用户选择框
        public ActionResult SelectUser(string code)
        {
            var userCodes = "";
            if (!code.IsNullOrEmpty())
            {
                var codes = code.Split(';');
                codes.Each(o =>
                {
                    if (!string.IsNullOrWhiteSpace(o))
                    {
                        userCodes += o.Substring(o.LastIndexOf("(") + 1).TrimEnd(')') + ",";
                    }
                });
            }
            ViewBag.codes = userCodes;
            return View();
        }
        #endregion

        #region 角色管理

        #region 角色管理页
        /// <summary>
        /// 角色管理-页面加载
        /// </summary>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_查看角色)]
        public ActionResult Roles()
        {
            return View();
        }
        /// <summary>
        /// 角色管理-页面数据加载
        /// </summary>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_查看角色)]
        public ActionResult GetRoles()
        {
            var entities = _roleBLL.GetList();

            return ToDataGrid(entities, entities.Rows.Count);
        }

        /// <summary>
        /// 角色管理-新增或编辑角色表单-页面加载
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_查看角色)]
        public ActionResult RoleSave(int id = 0)
        {
            var model = _roleBLL.GetModel(id);
            return View(model);
        }
        /// <summary>
        /// 角色管理-新增或编辑角色表单-角色保存
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_创建角色)]
        public ActionResult RoleSave(SysRoles model)
        {
            var result = _roleBLL.SaveRole(model);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 角色管理-更改角色状态
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_状态设定)]
        public ActionResult CloseRole(int id)
        {
            var result = _roleBLL.ChangeStatus(id);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 角色管理-移除角色
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_物理删除角色)]
        public ActionResult RemoveRole(int id)
        {
            var re = _roleBLL.Delete(id);
            return Content(re.ToJson());
        }
        #endregion 角色管理

        #region 角色菜单设置
        /// <summary>
        /// 角色管理-角色菜单设置-页面数据加载
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_菜单设置)]
        public ActionResult RoleSettingMenus(string roleId)
        {
            var model = _sysCustomMenusBLL.GetSysCustomMenusByObjId(int.Parse(roleId));
            return View(model);
        }
        /// <summary>
        /// 角色管理-角色菜单设置-页面加载
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_菜单设置)]
        public ActionResult GetRoleSettingMenus(string roleId)
        {
            return View();
        }
        /// <summary>
        /// 角色管理-角色菜单设置-角色菜单保存
        /// </summary>
        /// <param name="syscustomMenus"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_菜单设置)]
        public ActionResult SaveRoleSettingMenus(SysCustomMenus syscustomMenus)
        {
            syscustomMenus.Type = 2;
            var re = _sysCustomMenusBLL.SaveModel(syscustomMenus);
            return Content(re.ToJson());
        }
        /// <summary>
        /// 角色管理-角色菜单设置-菜单下拉树数据源
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_菜单设置)]
        public ActionResult GetMenusTreeLists(string roleId, short type = 0)
        {
            var datas = _menuBLL.GetMenusTreeList(2, CurrentStoreUser.RoleIds);
            var roleids = CurrentStoreUser.RoleIds.Split(',');
            if (!(roleids.Contains(SysCommonRules.AdminRoleId) || roleids.Contains(SysCommonRules.SuperRoleId)))
            {
                var seldatas = _menuBLL.GetMenusTreeList(2, roleId);
                datas = seldatas.Where(o => datas.Select(i => i.MenuId).Contains(o.MenuId)).ToList();
            }
            datas = datas.Where(o => o.Type == type).ToList();
            //构造树数据
            List<EasyuiTree> models = new List<EasyuiTree>();
            datas.Where(t => t.PMenuId == 0).Each(t =>
            {
                models.Add(GetMenusChildsEasyuiTreeData(t, datas));
            });
            return new JsonNetResult(models);
        }
        #endregion 角色菜单设置

        #region 角色权限设置
        /// <summary>
        /// 角色管理-角色权限设置-权限页面加载
        /// </summary>
        /// <param name="id"></param>
        /// <param name="roleid"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_权限设置)]
        public ActionResult RoleSettingLimits(int id = 0, string roleid = "0")
        {
            var model = _roleBLL.GetModel(id);
            return View(model);
        }
        /// <summary>
        /// 角色管理-角色权限设置-权限页面数据加载
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_权限设置)]
        public ActionResult GetRoleSettingLimits()
        {
            var datas = _roleBLL.GetAllLimitList();
            //构造树数据
            List<SysLimitsExt> models = new List<SysLimitsExt>();
            datas.Where(t => t.PLimitId == 0).Each(t =>
            {
                models.Add(GetChildsRoleAllLimits(t, datas));
            });
            return ToDataGrid(models, 2);
        }
        /// <summary>
        /// 角色管理-角色权限设置-保存角色权限数据
        /// </summary>
        /// <param name="roleid"></param>
        /// <param name="limitIds"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_权限设置)]
        public ActionResult SaveRoleSettingLimits(string roleid, string limitIds)
        {
            var re = _roleBLL.SaveModel(roleid, limitIds);
            return new JsonNetResult(re);
        }
        /// <summary>
        /// 角色管理-角色权限设置-获取权限数据
        /// </summary>
        /// <param name="model"></param>
        /// <param name="source"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.角色管理_权限设置)]
        private SysLimitsExt GetChildsRoleAllLimits(SysLimitsExt model, List<SysLimitsExt> source)
        {
            var childs = source.Where(s => s.PLimitId == model.LimitId);
            if (childs.Count() > 0)
            {
                model.Childs = new List<SysLimitsExt>();
                childs.Each(t =>
                {
                    model.Childs.Add(GetChildsRoleAllLimits(t, source));
                });
            }
            return model;
        }
        #endregion 角色权限设置

        #endregion 角色管理

        #region 菜单管理
        /// <summary>
        /// 菜单管理-页面加载
        /// </summary>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.菜单管理_查看菜单信息)]
        public ActionResult Menus()
        {
            return View();
        }
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.菜单管理_新增菜单信息)]
        public ActionResult MoveMenuItem(int mode, int menuId)
        {
            var result = _menuBLL.MoveMenuItem(mode, menuId);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 菜单管理-页面数据加载
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.菜单管理_查看菜单信息)]
        public ActionResult GetMenus()
        {
            var datas = _menuBLL.GetList();
            //构造树数据
            List<SysMenusExt> models = new List<SysMenusExt>();
            if (datas != null && datas.Count > 0)
            {
                datas.Where(t => t.PMenuId == 0).Each(t =>
                {
                    models.Add(GetMenuChildsEasyuiGridData(t, datas));
                });
            }

            return ToDataGrid(models, 2);
        }
        /// <summary>
        /// 菜单管理-新增或编辑表单-页面加载
        /// </summary>
        /// <param name="id"></param>
        /// <param name="pobjid"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.菜单管理_查看菜单信息)]
        public ActionResult MenusSave(int id = 0, int pobjid = -1)
        {
            var model = _menuBLL.GetModel(id, pobjid);
            return View(model);
        }
        /// <summary>
        /// 菜单管理-新增或编辑表单-数据保存
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        [SysPermissionValidate(Code = Sys.SysConstLimits.菜单管理_新增菜单信息)]
        public ActionResult MenusSave(SysMenus model)
        {
            var result = _menuBLL.SaveMenu(model);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 菜单管理-更改菜单状态
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.菜单管理_设为显示或隐藏)]
        public ActionResult ChangeMenuStatusById(int id)
        {
            var result = _menuBLL.ChangeStatus(id);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 菜单管理-根据id移除菜单信息
        /// </summary>
        /// <param name="id">菜单ID</param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.菜单管理_删除菜单信息)]
        public ActionResult RemoveMenuById(int id)
        {
            var re = _menuBLL.Delete(id);
            return Content(re.ToJson());
        }
        /// <summary>
        /// 菜单管理-菜单下拉树数据源
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        //[HttpPost]
        [HttpGet]
        [SysPermissionValidate(Code = Sys.SysConstLimits.菜单管理_查看菜单信息)]
        public ActionResult GetMenusTreeList(int id)
        {
            var datas = _menuBLL.GetList();
            //构造树数据
            List<EasyuiTree> models = new List<EasyuiTree>();
            datas.Where(t => t.PMenuId == 0).Each(t =>
            {
                models.Add(GetMenusChildsEasyuiTreeData(t, datas));
            });
            return new JsonNetResult(models);
        }
        #region private
        /// <summary>
        /// 
        /// </summary>
        /// <param name="data"></param>
        /// <param name="source"></param>
        /// <returns></returns>
        private SysMenusExt GetMenuChildsEasyuiGridData(SysMenusExt model, List<SysMenusExt> source)
        {
            var childs = source.Where(s => s.PMenuId == model.MenuId);
            if (childs.Count() > 0)
            {
                model.Childs = new List<SysMenusExt>();
                childs.Each(t =>
                {
                    model.Childs.Add(GetMenuChildsEasyuiGridData(t, source));
                });
            }
            return model;
        }
        /// <summary>
        /// 构造菜单下拉树子集数据
        /// </summary>
        /// <param name="menu"></param>
        /// <param name="source"></param>
        /// <returns></returns>
        private EasyuiTree GetMenusChildsEasyuiTreeData(SysMenusExt menu, List<SysMenusExt> source)
        {
            var model = new EasyuiTree { id = menu.MenuId.ToString(), text = menu.Title };
            var childs = source.Where(s => s.PMenuId == menu.MenuId && s.Status == true);
            if (childs.Count() > 0)
            {
                model.children = new List<EasyuiTree>();
                childs.Each(t =>
                {
                    model.children.Add(GetMenusChildsEasyuiTreeData(t, source));
                });
            }
            return model;
        }
        #endregion
        #endregion 菜单管理

        #region 权限管理
        /// <summary>
        /// 权限管理-页面加载
        /// </summary>
        /// <returns></returns>
        public ActionResult Limits()
        {
            return View();
        }
        /// <summary>
        /// 权限管理-页面数据加载
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetLimits(int id = -1, int depth = -1)
        {

            var datas = _limitBLL.GetList();
            //构造树数据
            List<SysLimitsExt> models = new List<SysLimitsExt>();
            if (datas != null && datas.Count > 0)
            {
                if (id == -1)
                {
                    datas.Where(t => t.PLimitId == 0).Each(t =>
                    {
                        models.Add(GetChildsEasyuiGridData(t, datas, true));
                    });
                }
                else
                {
                    datas.Where(t => t.Id == id && (depth == -1 || t.Depth <= depth)).Each(t =>
                    {
                        models.Add(GetChildsEasyuiGridData(t, datas, false, depth));
                    });
                }
            }

            return ToDataGrid(models, 2);
        }
        public ActionResult EditChildren(string id, int depth)
        {
            ViewBag.Id = id;
            ViewBag.Depth = depth;
            return View();
        }



        /// <summary>
        /// 权限管理-根据ID更改权限状态
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ChangeLimitStatusById(int id)
        {
            var result = _limitBLL.ChangeStatus(id);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 权限管理-根据ID移除权限信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult RemoveLimitById(int id)
        {
            var re = _limitBLL.Delete(id);
            return Content(re.ToJson());
        }
        /// <summary>
        /// 权限管理-新增或编辑权限表单
        /// </summary>
        /// <param name="id"></param>
        /// <param name="pobjid"></param>
        /// <returns></returns>
        public ActionResult LimitsSave(int id = 0, int pobjid = 0)
        {
            var model = _limitBLL.GetModel(id, pobjid);
            return View(model);
        }
        /// <summary>
        /// 权限管理-新增或编辑权限表单-保存
        /// </summary>
        /// <param name="limit"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LimitsSave(SysLimits model)
        {
            var result = _limitBLL.SaveLimit(model);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 权限管理-新增或编辑权限表单-权限下拉树数据源
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetLimitsTreeList(int id)
        {
            var datas = _limitBLL.GetList();
            //构造树数据
            List<EasyuiTree> models = new List<EasyuiTree>();
            datas.Where(t => t.PLimitId == 0).Each(t =>
            {
                models.Add(GetChildsEasyuiTreeData(t, datas));
            });
            return new JsonNetResult(models);
        }

        #region private
        /// <summary>
        /// 递归遍历网格树数据
        /// </summary>
        /// <param name="limit"></param>
        /// <param name="source"></param>
        /// <param name="loadLastChild">分开加载最后的子节点</param>
        /// <returns></returns>
        private SysLimitsExt GetChildsEasyuiGridData(SysLimitsExt model, List<SysLimitsExt> source, bool loadLastChild = false, int depth = -1)
        {
            var childs = source.Where(s => s.PLimitId == model.LimitId).ToList();
            if (childs.Count() > 0 && childs.Exists(o => (o.Depth <= depth || depth == -1)))
            {
                model.Childs = new List<SysLimitsExt>();
                childs.Each(t =>
                {
                    var treeItem = GetChildsEasyuiGridData(t, source, loadLastChild, depth);

                    if (treeItem.Childs == null && loadLastChild)
                    {
                        if (model.LastChilds == null)
                            model.LastChilds = new List<SysLimitsExt>();
                        model.LastChilds.Add(treeItem);
                    }
                    else
                    {
                        model.Childs.Add(treeItem);
                    }
                });
            }
            if (childs.Count > 0)
            {
                model.HasChild = true;
            }
            return model;
        }
        /// <summary>
        /// 递归遍历下拉树
        /// </summary>
        /// <param name="limit"></param>
        /// <param name="source"></param>
        /// <returns></returns>
        private EasyuiTree GetChildsEasyuiTreeData(SysLimitsExt obj, List<SysLimitsExt> source)
        {
            var model = new EasyuiTree { id = obj.LimitId.ToString(), text = obj.Title };
            var childs = source.Where(s => s.PLimitId == obj.LimitId);
            if (childs.Count() > 0)
            {
                model.children = new List<EasyuiTree>();
                childs.Each(t =>
                {
                    model.children.Add(GetChildsEasyuiTreeData(t, source));
                });
            }
            return model;
        }
        #endregion

        #endregion 权限管理

        #region 数据字典
        /// <summary>
        /// 数据字典-页面加载
        /// </summary>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.数据字典_查看字典)]
        public ActionResult Dic()
        {
            return View();
        }
        /// <summary>
        /// 数据字典-页面数据加载
        /// </summary>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.数据字典_查看字典)]
        public ActionResult GetDict(int page = 1, int rows = 20, string key = "")
        {
            var result = _dicBLL.GetList(page, rows, key);
            return ToDataGrid(result, result.Count());
        }
        /// <summary>
        /// 数据字典-添加子级数据字典
        /// </summary>
        /// <param name="id"></param>
        /// <param name="psn"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.数据字典_查看字典)]
        public ActionResult ShowChildDict(int id, int psn)
        {
            ViewData["psn"] = psn;
            return View();

        }
        /// <summary>
        /// 数据字典-根据父级字典SN获得子级数据字典集合
        /// </summary>
        /// <param name="psn"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.数据字典_查看字典)]
        public ActionResult GetDictItems(int psn)
        {
            var entity = _dicBLL.GetItemList(psn);
            return ToDataGrid(entity, entity.Count());
        }
        /// <summary>
        /// 数据字典-增加或编辑数据字典
        /// </summary>
        /// <param name="id"></param>
        /// <param name="psn"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.数据字典_查看字典)]
        public ActionResult AddDict(int id = -1, int psn = 0)
        {
            var model = _dicBLL.GetExtModel(id, psn);
            return View(model);
        }
        /// <summary>
        /// 数据字典-更改数据字典状态
        /// </summary>
        /// <param name="sn"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.数据字典_状态设定)]
        public ActionResult SwitchStatus(int id)
        {
            var result = _dicBLL.ChangeStatus(id);
            return Content(result.ToJson());
        }
        /// <summary>
        /// 数据字典-数据字典表单-保存
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [SysPermissionValidate(Code = Sys.SysConstLimits.数据字典_创建字典)]
        public ActionResult AddDict(SysDataDictionary model)
        {
            var re = new OpResult() { Successed = true };
            var result = _dicBLL.SaveModel(model);
            return Content(result.ToJson());
        }
        [HttpPost]
        public ActionResult AddDictTitle(string title, int psn)
        {
            var re = new OpResult() { Successed = true };
            var obj = new SysDataDictionary() { CompanyId = SysCommonRules.CompanyId };
            var source = Pharos.Logic.BLL.SysDataDictService.Find(o => o.CompanyId == obj.CompanyId && o.Title == title);
            if (source != null)
                re.Message = source.DicSN.ToString();
            else
            {
                obj.Title = title;
                obj.Status = true;
                obj.DicSN = Pharos.Logic.BLL.SysDataDictService.GetMaxSN;
                obj.DicPSN = psn;
                re = Pharos.Logic.BLL.SysDataDictService.Add(obj);
                if (re.Successed) re.Message = obj.DicSN.ToString();
            }
            return Content(re.ToJson());
        }
        [HttpPost]
        public ActionResult MoveDataItem(int mode, int sn)
        {
            var op = Pharos.Logic.BLL.SysDataDictService.MoveItem(mode, sn);
            return new JsonNetResult(op);
        }
        #endregion 数据字典

        #region 日志管理
        /// <summary>
        /// 日志管理-页面加载
        /// </summary>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.日志管理_查看日志)]
        public ActionResult Log()
        {
            return View();
        }
        /// <summary>
        /// 日志管理-页面数据加载
        /// </summary>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <returns></returns>
        [SysPermissionValidate(Code = Sys.SysConstLimits.日志管理_查看日志)]
        public ActionResult GetLogs(int page = 1, int rows = 30)
        {
            string keyword = string.Empty;
            int type = 0;
            if (Request["keyword"] != null)
            {
                keyword = Request["keyword"].ToString().Trim();
            }
            if (Request["type"] != null)
            {
                type = Convert.ToInt32(Request["type"]);
            }
            var paging = new Paging() { PageIndex = page, PageSize = rows };
            var result = _logBLL.GetList(paging, keyword, type, Request["date"], Request["date2"]);
            if (result.Rows.Count > 0)
            {
                for (int i = 0; i < result.Rows.Count; i++)
                {
                    var colSummary = result.Rows[i]["Summary"];
                    var summary = colSummary == null ? "" : System.Web.HttpUtility.HtmlEncode(colSummary.ToString());
                    if (summary.Length > 180)
                        result.Rows[i]["Summary"] = "<div title='" + summary + "'>" + summary.Substring(0, 180) + "...</div>";
                }
            }
            return ToDataGrid(result, paging.RecordTotal);
        }
        /// <summary>
        /// 日志管理-弹窗查看日志详情
        /// </summary>
        /// <param name="id">日志ID</param>
        /// <returns></returns>
        public ActionResult LogView(int id)
        {
            var model = _logBLL.GetLogById(id);
            var user = _userBLL.GetModelByUID(model.UId);
            ViewBag.UserLoginName = user == null ? model.UId : user.LoginName;
            return View(model);
        }
        /// <summary>
        /// 日志管理-删除所选日志
        /// </summary>
        /// <param name="Ids">日志ID数组</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DeleteLogs(int[] Ids)
        {
            var re = _logBLL.DeleteRange(Ids);
            return Json(new { successed = re });
        }
        /// <summary>
        /// 日志管理-删除全部日志
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DeleteAll()
        {
            var re = _logBLL.DeleteAll();
            return Json(new { successed = re });
        }
        #endregion

        #region 基本配置
        //[SysPermissionValidate(Code = Sys.SysConstLimits.系统管理_基本配置)]
        public ActionResult WebSetting()
        {
            var model = _sysWebSettingBLL.GetWebSetting();
            return View(model ?? new SysWebSetting());
        }

        /// <summary>
        /// 系统管理-更新基本配置信息
        /// </summary>
        /// <param name="role"></param>
        /// <returns></returns>
        [HttpPost]
        //[SysPermissionValidate(Code = Sys.SysConstLimits.系统管理_基本配置)] 
        public ActionResult WebSetting(SysWebSetting model)
        {
            var relativePath = "";
            var path = Sys.SysConstPool.SaveLogoPath(ref relativePath, SysCommonRules.CompanyId.ToString());

            if (Request.Files["LoginLogo"] != null && Request.Files["LoginLogo"].ContentLength != 0)
            {
                var topLogo = Request.Files["LoginLogo"];
                var topLogoName = "logo_login.png";
                string fullname = path + topLogoName;
                topLogo.SaveAs(fullname);
                model.LoginLogo = topLogoName;
            }
            if (Request.Files["TopLogo"] != null && Request.Files["TopLogo"].ContentLength != 0)
            {
                var topLogo = Request.Files["TopLogo"];
                var topLogoName = "logo_top.png";
                //var topLogoName = "TopLogo" + Path.GetExtension(topLogo.FileName);
                string fullname = path + topLogoName;
                topLogo.SaveAs(fullname);
                model.TopLogo = topLogoName;
                //var filename = Server.MapPath("~/SysImg/") + "logo.png";
                //System.IO.File.Copy(fullname, filename, true);
            }
            if (Request.Files["hidBottomLogo"] != null && Request.Files["hidBottomLogo"].ContentLength != 0)
            {
                var bottomLogo = Request.Files["hidBottomLogo"];
                var bottomLogoName = "logo_bottom.png";
                string fullname = path + bottomLogoName;
                bottomLogo.SaveAs(fullname);
                model.BottomLogo = bottomLogoName;
                //var filename = Server.MapPath("~/SysImg/") + "pharoslogo.png";
                //System.IO.File.Copy(fullname, filename, true);
            }
            var result = new OpResult();
            if (Request.Files["hidAppIcon640"] != null && Request.Files["hidAppIcon640"].ContentLength != 0)
            {
                var appIcon = Request.Files["hidAppIcon640"];
                var appIconName = "logo_app_icon_640.png";
                string fullname = path + appIconName;
                appIcon.SaveAs(fullname);
                model.AppIcon640 = appIconName;
                //result = UploadToAPI(appIcon, "640", "login_sysLogo.png");
            }
            if (Request.Files["hidAppIcon960"] != null && Request.Files["hidAppIcon960"].ContentLength != 0)
            {
                var appIcon = Request.Files["hidAppIcon960"];
                var appIconName = "logo_app_icon_960.png";
                string fullname = path + appIconName;
                appIcon.SaveAs(fullname);
                model.AppIcon960 = appIconName;
                //result = UploadToAPI(appIcon, "960", "login_sysLogo.png");
            }
            if (Request.Files["hidAppIndexIcon640"] != null && Request.Files["hidAppIndexIcon640"].ContentLength != 0)
            {
                var appIcon = Request.Files["hidAppIndexIcon640"];
                var appIconName = "logo_app_index_640.png";
                string fullname = path + appIconName;
                appIcon.SaveAs(fullname);
                model.AppIndexIcon640 = appIconName;
                //result = UploadToAPI(appIcon, "640", "index_sysLogo.png");
            }
            if (Request.Files["hidAppIndexIcon960"] != null && Request.Files["hidAppIndexIcon960"].ContentLength != 0)
            {
                var appIcon = Request.Files["hidAppIndexIcon960"];
                var appIconName = "logo_app_index_960.png";
                string fullname = path + appIconName;
                appIcon.SaveAs(fullname);
                model.AppIndexIcon960 = appIconName;
                //result = UploadToAPI(appIcon, "960", "index_sysLogo.png");
            }
            if (Request.Files["hidAppCustomer640"] != null && Request.Files["hidAppCustomer640"].ContentLength != 0)
            {
                var appCustomer = Request.Files["hidAppCustomer640"];
                var appCustomerName = "app_index_customer_640.png";
                string fullname = path + appCustomerName;
                appCustomer.SaveAs(fullname);
                model.AppCustomer640 = appCustomerName;
                //result = UploadToAPI(appCustomer, "640", "db_logo.png");
            }
            if (Request.Files["hidAppCustomer960"] != null && Request.Files["hidAppCustomer960"].ContentLength != 0)
            {
                var appCustomer = Request.Files["hidAppCustomer960"];
                var appCustomerName = "app_index_customer_960.png";
                string fullname = path + appCustomerName;
                appCustomer.SaveAs(fullname);
                model.AppCustomer960 = appCustomerName;
                //result = UploadToAPI(appCustomer, "960", "db_logo.png");
            }
            if (Request.Files["hidAppIndexbg640"] != null && Request.Files["hidAppIndexbg640"].ContentLength != 0)
            {
                var appCustomer = Request.Files["hidAppIndexbg640"];
                var appCustomerName = "app_index_bg_640.png";
                string fullname = path + appCustomerName;
                appCustomer.SaveAs(fullname);
                model.AppIndexbg640 = appCustomerName;
                //result = UploadToAPI(appCustomer, "640", "index_bg.png");
            }
            if (Request.Files["hidAppIndexbg960"] != null && Request.Files["hidAppIndexbg960"].ContentLength != 0)
            {
                var appCustomer = Request.Files["hidAppIndexbg960"];
                var appCustomerName = "app_index_bg_960.png";
                string fullname = path + appCustomerName;
                appCustomer.SaveAs(fullname);
                model.AppIndexbg960 = appCustomerName;
                //result = UploadToAPI(appCustomer, "960", "index_bg.png");
            }
            if (Request.Files["hidSysIcon"] != null && Request.Files["hidSysIcon"].ContentLength != 0)
            {
                var rootPath = SysConstPool.GetRoot;
                var sysIconPath = System.IO.Path.Combine(rootPath);

                var sysIcon = Request.Files["hidSysIcon"];
                var sysIconName = "favicon.ico";
                string fullname = sysIconPath + sysIconName;
                sysIcon.SaveAs(fullname);
                model.SysIcon = sysIconName;
            }
            if (result.Message.IsNullOrEmpty())
                result = _sysWebSettingBLL.SaveWebSetting(model);
            return Content(result.ToJson());
        }

        private static OpResult UploadToAPI(System.Web.HttpPostedFileBase appIcon, string type, string filename)
        {
            var op = new OpResult();
            try
            {
                var url = System.Configuration.ConfigurationManager.AppSettings["AppUrl"] + "UploadAppImage";
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url + "?type=" + type + "&filename=" + filename);
                request.Method = "POST";
                //request.ContentType = "text/xml";
                byte[] data = new byte[appIcon.InputStream.Length];
                appIcon.InputStream.Read(data, 0, data.Length);
                appIcon.InputStream.Seek(0, SeekOrigin.Begin);

                request.ContentLength = data.Length;
                var reqStream = request.GetRequestStream();
                reqStream.Write(data, 0, data.Length);
                reqStream.Close();

                var response = (HttpWebResponse)request.GetResponse();
                StreamReader sr = new StreamReader(response.GetResponseStream(), System.Text.Encoding.UTF8);
                var rt = sr.ReadToEnd().Trim();
                sr.Close();
                op = rt.ToObject<OpResult>();
                op.Successed = op.Code == "200";
            }
            catch (Exception ex)
            {
                op.Message = ex.Message;
            }
            return op;
        }

        #endregion

        #region 支付宝配置

        #region 列表页
        //[SysPermissionValidate(Code = Sys.SysConstLimits.系统管理_基本配置)]
        public ActionResult AliPaySetting()
        {
            ViewBag.stores = ListToSelect(Pharos.Logic.BLL.WarehouseService.GetList().Select(o => new SelectListItem() { Value = o.StoreId, Text = o.Title }), emptyTitle: "全部");
            ViewBag.states = EnumToSelect(typeof(Pharos.Logic.PaymentState), emptyValue: "-1", emptyTitle: "全部");
            return View();
        }

        [HttpPost]
        public ActionResult AliPayList(int page = 1, int rows = 20)
        {
            string storeId = "-1";
            short payType = 1;
            short state = -1;

            if (Request["StoreId"] != "")
            {
                storeId = Request["StoreId"].ToString().Trim();
            }
            if (Request["State"] != "-1")
            {
                state = Convert.ToInt16(Request["State"].ToString().Trim());
            }

            var paging = new Paging() { PageIndex = page, PageSize = rows };
            var result = _sysPaymentSettingBLL.GetList(paging, payType, storeId, state);
            return ToDataGrid(result, paging.RecordTotal);
        }

        /// <summary>
        /// 修改状态
        /// </summary>
        /// <param name="ids"></param>
        /// <param name="state"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SetState(string Ids, short state)
        {
            var result = _sysPaymentSettingBLL.SetState(Ids, state);
            return new JsonNetResult(result);
        }
        #endregion

        #region 新增或修改
        public ActionResult AliPaySettingSave(int id = 0)
        {
            ViewBag.stores = ListToSelect(Pharos.Logic.BLL.WarehouseService.GetList().Select(o => new SelectListItem() { Value = o.StoreId, Text = o.Title }), emptyTitle: "全部", emptyValue: "-1");
            var model = _sysPaymentSettingBLL.GetModel(id);

            //var storeList = Pharos.Logic.BLL.WarehouseService.GetList().Select(o => o.StoreId).ToList();
            //string allStores = storeList[0].ToString();
            //for (int i = 0; i < storeList.Count(); i++)
            //{
            //    if (i > 0 && i < storeList.Count())
            //    {
            //        allStores = allStores + "," + storeList[i].ToString();
            //    }
            //}
            //if (model.StoreId == "0")
            //{
            //    model.StoreId = "," + allStores;
            //}

            return View(model);
        }

        [HttpPost]
        public ActionResult AliPaySettingSave(SysPaymentSetting model)
        {
            model.StoreId = Request["StoreId"];
            model.CreateDT = DateTime.Now;
            model.CreateUID = CurrentStoreUser.UID;
            model.AlterDT = DateTime.Now;
            model.AlterUID = CurrentStoreUser.UID;
            model.CompanyId = Sys.SysCommonRules.CompanyId;

            //var storeList = Pharos.Logic.BLL.WarehouseService.GetList().Select(o => o.StoreId).ToList();
            //string allStores = storeList[0].ToString();
            //for (int i = 0; i < storeList.Count(); i++)
            //{
            //    if (i > 0 && i < storeList.Count())
            //    {
            //        allStores = allStores + "," + storeList[i].ToString();
            //    }
            //}
            //allStores = "," + allStores;
            //if (model.StoreId == allStores)
            //{
            //    model.StoreId = "0";
            //}

            var result = _sysPaymentSettingBLL.SaveModel(model);
            return Content(result.ToJson());
        }

        [HttpPost]
        public ActionResult IsExitStore(string PayType, string StoreId, bool IsUpdate, int Id)
        {
            var storeList = Pharos.Logic.BLL.WarehouseService.GetList().Select(o => o.StoreId).ToList();
            string allStores = storeList[0].ToString();
            for (int i = 0; i < storeList.Count(); i++)
            {
                if (i > 0 && i < storeList.Count())
                {
                    allStores = allStores + "," + storeList[i].ToString();
                }
            }
            allStores = "," + allStores;
            if (StoreId == allStores)
            {
                StoreId = "0";
            }

            var payType = int.Parse(PayType);
            var isExitStores = _sysPaymentSettingBLL.IsExitStore(payType, StoreId, IsUpdate, Id);
            return Content(isExitStores.ToJson());
        }


        #endregion

        #endregion

        #region 微信支付配置

        #region 列表页
        public ActionResult WeixinPaySetting()
        {
            ViewBag.stores = ListToSelect(Pharos.Logic.BLL.WarehouseService.GetList().Select(o => new SelectListItem() { Value = o.StoreId, Text = o.Title }), emptyTitle: "全部");
            ViewBag.states = EnumToSelect(typeof(Pharos.Logic.PaymentState), emptyValue: "-1", emptyTitle: "全部");
            return View();
        }

        [HttpPost]
        public ActionResult WeixinPayList(int page = 1, int rows = 20)
        {
            string storeId = "-1";
            short payType = 2;
            short state = -1;

            if (Request["StoreId"] != "")
            {
                storeId = Request["StoreId"].ToString().Trim();
            }
            if (Request["State"] != "-1")
            {
                state = Convert.ToInt16(Request["State"].ToString().Trim());
            }

            var paging = new Paging() { PageIndex = page, PageSize = rows };
            var result = _sysPaymentSettingBLL.GetList(paging, payType, storeId, state);
            return ToDataGrid(result, paging.RecordTotal);
        }
        #endregion

        #region 新增或修改
        public ActionResult WeixinPaySettingSave(int id = 0)
        {
            ViewBag.stores = ListToSelect(Pharos.Logic.BLL.WarehouseService.GetList().Select(o => new SelectListItem() { Value = o.StoreId, Text = o.Title }), emptyTitle: "全部", emptyValue: "-1");
            var model = _sysPaymentSettingBLL.GetModel(id);

            //var storeList = Pharos.Logic.BLL.WarehouseService.GetList().Select(o => o.StoreId).ToList();
            //string allStores = storeList[0].ToString();
            //for (int i = 0; i < storeList.Count(); i++)
            //{
            //    if (i > 0 && i < storeList.Count())
            //    {
            //        allStores = allStores + "," + storeList[i].ToString();
            //    }
            //}

            //if (model.StoreId == "0")
            //{
            //    model.StoreId = "," + allStores;
            //}

            return View(model);
        }

        [HttpPost]
        public ActionResult WeixinPaySettingSave(SysPaymentSetting model)
        {
            model.StoreId = Request["StoreId"];
            model.CreateDT = DateTime.Now;
            model.CreateUID = CurrentStoreUser.UID;
            model.AlterDT = DateTime.Now;
            model.AlterUID = CurrentStoreUser.UID;
            model.CompanyId = Sys.SysCommonRules.CompanyId;

            //var storeList = Pharos.Logic.BLL.WarehouseService.GetList().Select(o => o.StoreId).ToList();
            //string allStores = storeList[0].ToString();
            //for (int i = 0; i < storeList.Count(); i++)
            //{
            //    if (i > 0 && i < storeList.Count())
            //    {
            //        allStores = allStores + "," + storeList[i].ToString();
            //    }
            //}
            //allStores = "," + allStores;

            //if (model.StoreId == allStores)
            //{
            //    model.StoreId = "0";
            //}

            var result = _sysPaymentSettingBLL.SaveModel(model);
            return Content(result.ToJson());
        }
        #endregion

        #endregion
        #region 支付API
        public ActionResult ApiLibrarys()
        {
            ViewBag.apiTypes = ListToSelect(_dicBLL.GetDicListByPSN(10).Select(o => new SelectListItem() { Text = o.Title, Value = o.DicSN.ToString() }), emptyTitle: "全部");
            ViewBag.states = EnumToSelect(typeof(Pharos.Logic.EnableState), emptyTitle: "全部");
            return View();
        }
        public ActionResult ApiLibraryPageList(short? apiType, string keyword, short? state)
        {
            int count = 0;
            var list = Pharos.Logic.BLL.ApiLibraryService.ApiLibraryPageList(apiType, keyword, state, out count);
            return ToDataGrid(list, count);
        }
        public ActionResult ApiLibrarySave(int? id)
        {
            ViewBag.apiTypes = ListToSelect(_dicBLL.GetDicListByPSN(10).Select(o => new SelectListItem() { Text = o.Title, Value = o.DicSN.ToString() }), emptyTitle: "请选择");
            var obj = new Pharos.Logic.Entity.ApiLibrary() { ReqMode = 1, State = 1 };
            if (id.HasValue)
            {
                obj = Pharos.Logic.BLL.ApiLibraryService.FindById(id);
            }
            return View(obj);
        }
        [HttpPost]
        public ActionResult ApiLibrarySave(Pharos.Logic.Entity.ApiLibrary obj)
        {
            var relativePath = "";
            var path = Sys.SysConstPool.SaveLogoPath(ref relativePath, "PayIcon");
            if (Request.Files["ApiIcon2"] != null && Request.Files["ApiIcon2"].ContentLength != 0)
            {
                var file = Request.Files["ApiIcon2"];
                var fileName = Path.GetFileName(file.FileName);
                string fullname = path + fileName;
                file.SaveAs(fullname);
                obj.ApiIcon = relativePath + fileName;
            }
            if (Request.Files["ApiCloseIcon2"] != null && Request.Files["ApiCloseIcon2"].ContentLength != 0)
            {
                var file = Request.Files["ApiCloseIcon2"];
                var fileName = Path.GetFileName(file.FileName);
                string fullname = path + fileName;
                file.SaveAs(fullname);
                obj.ApiCloseIcon = relativePath + fileName;
            }
            var result = Pharos.Logic.BLL.ApiLibraryService.SaveOrUpdate(obj);
            return Content(result.ToJson());
        }
        [HttpPost]
        public ActionResult ApiLibraryDelete(int[] ids)
        {
            var list = Pharos.Logic.BLL.ApiLibraryService.FindList(o => ids.Contains(o.Id));
            var op = Pharos.Logic.BLL.ApiLibraryService.Delete(list);
            return new JsonNetResult(op);
        }
        [HttpPost]
        public ActionResult MoveItem(int mode, int id)
        {
            var op = Pharos.Logic.BLL.ApiLibraryService.MoveItem(mode, id);
            return new JsonNetResult(op);
        }
        [HttpPost]
        public ActionResult ApiLibraryState(string ids, short state)
        {
            var idlist = ids.Split(',').Select(o => int.Parse(o)).ToList();
            var list = Pharos.Logic.BLL.ApiLibraryService.FindList(o => idlist.Contains(o.Id));
            var titles = list.Select(o => o.Title).ToList();
            var resours = state == 1 ? Pharos.Logic.BLL.ApiLibraryService.FindList(o => titles.Contains(o.Title) && !idlist.Contains(o.Id) && o.State == 1) : new List<Logic.Entity.ApiLibrary>();
            list.Each(o =>
            {
                o.State = state;
                if (state == 1)
                {
                    var res = resours.FirstOrDefault(i => i.Title == o.Title);
                    if (res != null) res.State = 0;
                }
            });
            var op = Pharos.Logic.BLL.ApiLibraryService.Update(list);
            return new JsonNetResult(op);
        }

        #endregion

        #region 数据迁移
        public ActionResult SaleDataMove()
        {
            return View();
        }
        public ActionResult Import()
        {
            ViewBag.stores = ListToSelect(Pharos.Logic.BLL.WarehouseService.GetList(true).Select(o => new SelectListItem() { Value = o.StoreId, Text = o.Title, Selected = Sys.CurrentStoreUser.StoreId == o.StoreId }), emptyTitle: "请选择");
            var obj = Pharos.Logic.BLL.BaseService<Pharos.Logic.Entity.ImportSet>.Find(o => o.CompanyId == Pharos.Logic.BLL.CommonService.CompanyId && o.TableName == "SaleOrders");
            return View(obj ?? new Pharos.Logic.Entity.ImportSet() { MinRow = 1 });
        }
        [HttpPost]
        public ActionResult Import(Pharos.Logic.Entity.ImportSet imp)
        {
            imp.TableName = "SaleOrders";
            imp.CompanyId = Pharos.Logic.BLL.CommonService.CompanyId;
            var op = Pharos.Logic.BLL.SaleOrdersService.Import(imp, Request.Files, Request["FieldName"], Request["ColumnName"]);
            return Content(op.ToJson());
        }
        public ActionResult SureImport()
        {
            var op = Pharos.Logic.BLL.SaleOrdersService.SureImport();
            return new JsonNetResult(op);
        }
        [HttpPost]
        public ActionResult SaleDataMoveList(string type, string apiTitle, string searchField, string searchText)
        {
            System.Data.DataView dv = null;
            object foots = new List<object>();
            dv = Pharos.Logic.BLL.SaleOrdersService.SaleDataMoveList(type, apiTitle, searchText, searchField, ref foots);
            return ToDataGrid(dv == null ? null : dv.ToTable(), dv == null ? 0 : dv.Count, foots);
        }
        [HttpPost]
        public ActionResult GetDataForSearch(string searchText, string searchField)
        {
            return new JsonNetResult(Pharos.Logic.BLL.SaleOrdersService.GetDataForSearchByCache(searchText, searchField));
        }
        [HttpPost]
        public void ClearImport()
        {
            Pharos.Logic.BLL.SaleOrdersService.ClearImport();
        }
        #endregion
        /// <summary>
        /// 系统管理-页面错误返回页面
        /// </summary>
        /// <returns></returns>
        public ActionResult Error()
        {
            return View();
        }
        #region 导入导出
        public ActionResult FileHandler(string msg)
        {
            ViewBag.stores = Pharos.Logic.BLL.WarehouseService.GetList().Select(o => new SelectListItem() { Value = o.StoreId, Text = o.Title }).ToList();
            return View((object)msg);
        }
        [HttpPost]
        public ActionResult FileHandler(short methodItem, string store, string exportItem, string importItem)
        {
            var msg = Pharos.Logic.BLL.FileHandlerService.Handler(methodItem, store, exportItem, importItem);
            return RedirectToAction("FileHandler", new { msg = msg });
        }
        #endregion
        #region 省市联动选择
        public ActionResult ProvinceSelect(string emptyTitle = "请选择")
        {
            var parenttypes = Pharos.Logic.BLL.BaseService<Pharos.Logic.Entity.Area>.FindList(o => o.Type == 2).OrderBy(o => o.OrderNum).Select(o => new DropdownItem(o.AreaID.ToString(), o.Title)).ToList();
            parenttypes.Insert(0, new DropdownItem("", Server.UrlDecode(emptyTitle), true));
            return new JsonNetResult(parenttypes);
        }
        public ActionResult CitySelect(int? pid, string emptyTitle = "请选择")
        {
            var childtypes = new List<DropdownItem>();
            if (pid.HasValue)
                childtypes = Pharos.Logic.BLL.BaseService<Pharos.Logic.Entity.Area>.FindList(o => o.AreaPID == pid).OrderBy(o => o.OrderNum).Select(o => new DropdownItem(o.AreaID.ToString(), o.Title)).ToList();
            if (!emptyTitle.IsNullOrEmpty())
                childtypes.Insert(0, new DropdownItem("", Server.UrlDecode(emptyTitle), true));
            return new JsonNetResult(childtypes);
        }
        #endregion
    }

    #region Models

    #region Modul Models

    public class Modul
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public IEnumerable<FunctionPermission> FunctionPermissions { get; set; }

        [JsonProperty("children")]
        public IEnumerable<Modul> Children { get; set; }
    }

    public class FunctionPermission
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
    }
    #endregion Modul Models

    #endregion Models

    #region Public Extensions

    #region Cascade（级联）

    public delegate void CascadeAction(string key, string targetValue, ref List<SelectListItem> result);

    public class CascadeController : Controller
    {
        public static event CascadeAction cascade;
        public ActionResult Index(string key, string targetValue)
        {
            List<SelectListItem> result = null;
            if (cascade != null)
                cascade(key, targetValue, ref result);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }

    #endregion Cascade（级联）


    #region For Enum To Json

    public class EnumLocalization
    {
        public object Value { get; set; }
        public string ShowValue { get; set; }
    }

    public static class EnumLocalizationExtensions
    {
        public static string ToLocalizationString(this Enum _this)
        {
            var type = _this.GetType();
            return type.GetField(_this.ToString()).GetCustomAttribute<LocalizationAttribute>().ShowValue;
        }

        public static IDictionary<int, string> GetLocalizations(this Enum _this)
        {
            var type = _this.GetType();
            var arr = type.GetEnumValues();
            Dictionary<int, string> dict = new Dictionary<int, string>();
            foreach (int i in arr)
            {
                var enumValue = Enum.Parse(type, i.ToString()) as Enum;
                dict.Add(i, enumValue.ToLocalizationString());
            }
            return dict;
        }
    }

    [AttributeUsage(AttributeTargets.Field)]
    public class LocalizationAttribute : Attribute
    {
        public LocalizationAttribute(string showValue)
        {
            ShowValue = showValue;
        }

        public string ShowValue { get; set; }
    }

    public class EnumLocalizationConverter : JsonConverter
    {
        public override bool CanConvert(Type objectType)
        {
            return objectType.IsEnum;
        }

        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            try
            {
                var value = serializer.Deserialize<EnumLocalization>(reader);
                return Enum.Parse(objectType, value.Value.ToString());
            }
            catch
            {
            }

            return Enum.Parse(objectType, serializer.Deserialize(reader).ToString());
        }

        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {

            var type = value.GetType();
            var fieldName = type.GetEnumName(value);
            if (fieldName != null)
            {
                var localozation = type.GetField(fieldName).GetCustomAttribute<LocalizationAttribute>();
                serializer.Serialize(writer, new { Value = value, ShowValue = localozation.ShowValue });
            }
            else
            {
                serializer.Serialize(writer, new EnumLocalization() { Value = value, ShowValue = string.Empty });
            }
        }
    }


    #endregion For Enum To Json


    #endregion Public Extensions
}