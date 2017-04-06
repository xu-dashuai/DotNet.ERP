﻿using Pharos.Logic.OMS.Entity;
using Pharos.Logic.OMS.IDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pharos.Utility.Helpers;
using Pharos.Utility;
namespace Pharos.Logic.OMS.BLL
{
    public class SysUserService
    {
        [Ninject.Inject]
        public IBaseRepository<SysUser> UserRepository { get; set; }
        [Ninject.Inject]
        public IBaseRepository<SysPositions> PositionRepository { get; set; }
        [Ninject.Inject]
        public IBaseRepository<SysDepartments> DepartRepository { get; set; }
        [Ninject.Inject]
        public IBaseRepository<SysRoles> RoleRepository { get; set; }
        public List<SysUser> GetList(bool normal=true)
        {
            var query= UserRepository.GetQuery();
            if (normal) query = query.Where(o => o.Status == 1);
            return query.ToList();
        }
        public IEnumerable<dynamic> GetPageList(System.Collections.Specialized.NameValueCollection nvl,out int count)
        {
            var treeId = nvl["treeId"].ToType<int?>();
            var ids = nvl["ids"].ToIntArray();
            var role = nvl["role"];
            var status = nvl["status"].ToIntArray();
            var searchField = nvl["searchField"];
            var searchText = nvl["searchText"];
            int userCode = 0;
            int.TryParse(searchText,out userCode);
            var where = DynamicallyLinqHelper.Empty<SysUser>().And(o =>status.Contains(o.Status), status == null || !status.Any())
                .And(o => o.DeptId == treeId, treeId == 0 || !treeId.HasValue)
                .And(o => ids.Contains(o.Id), ids==null || !ids.Any())
                .And(o =>(","+ o.RoleIds+",").Contains(","+role+","), role.IsNullOrEmpty())
                .And(o => o.FullName != null && o.FullName.Contains(searchText), searchField != "1" || searchText.IsNullOrEmpty())
                .And(o => o.UserCode >= userCode, searchField != "2" || userCode<=0)
                .And(o => o.LoginName != null && o.LoginName.Contains(searchText), searchField != "3" || searchText.IsNullOrEmpty());

            var queryUser = UserRepository.GetQuery(where);
            var queryPosition = PositionRepository.GetQuery();
            var queryDept = DepartRepository.GetQuery();
            var query = from x in queryUser
                        select new { 
                            x.Id,
                            x.UserCode,
                            x.FullName,
                            x.LoginName,
                            x.DeptId,
                            x.PositId,
                            DeptTitle = queryDept.Where(o => o.DeptId == x.DeptId).Select(o => o.Title).FirstOrDefault(),
                            PositionTitle = queryPosition.Where(o => o.PositId == x.PositId).Select(o => o.Title).FirstOrDefault(),
                            x.CreateDT,
                            x.LoginDT,
                            x.Status,
                            x.IsSuper,
                            x.RoleIds
                        };
            
            count = query.Count();
            var list= query.ToPageList();
            var roleIds= list.Where(o=>!o.RoleIds.IsNullOrEmpty()).SelectMany(o=>o.RoleIds.Split(',')).Where(o=>!o.IsNullOrEmpty()).Select(o=>int.Parse(o)).Distinct();
            var rolels= RoleRepository.GetQuery(o => roleIds.Contains(o.RoleId)).ToList();
            return list.Select(x => new
            {
                x.Id,
                x.UserCode,
                FullName=x.FullName+(x.IsSuper?" (超管)":""),
                x.LoginName,
                x.DeptId,
                x.PositId,
                x.CreateDT,
                x.LoginDT,
                x.Status,
                x.IsSuper,
                x.RoleIds,
                x.DeptTitle,
                x.PositionTitle,
                RoleTitles = GetRoleTitles(x.RoleIds,rolels)
            });
        }
        public OpResult SaveOrUpdate(SysUser obj)
        {
            if (!obj.LoginName.IsNullOrEmpty() && UserRepository.IsExists(o => o.LoginName == obj.LoginName && o.Id != obj.Id))
                return OpResult.Fail("登陆帐号已存在！");
           
            if (obj.Id == 0)
            {
				if (!obj.LoginPwd.IsNullOrEmpty())
				{
					obj.LoginPwd = Security.MD5_Encrypt(obj.LoginPwd);
				}
                obj.Status = 1;
                obj.UserId = CommonService.GUID;
                obj.QuanPin = obj.FullName.ToPinYin();
                obj.UserCode = UserRepository.GetMaxInt(o => o.UserCode, min: 1000, max: 99999);
                obj.CreateDT =obj.LoginDT= DateTime.Now;
                obj.CreateUID = CurrentUser.UID;
                UserRepository.Add(obj, false);
            }
            else
            {
                var user = Get(obj.Id);
                obj.ToCopyProperty(user, new List<string>() { "Status", "CreateDT", "CreateUID", "LoginDT", "UserId", "QuanPin","LoginPwd" });
                if (!obj.LoginPwd.IsNullOrEmpty())
				{
					user.LoginPwd = Security.MD5_Encrypt(obj.LoginPwd);
				}
            }
            
            UserRepository.SaveChanges();
            return OpResult.Success();
        }
        public OpResult UpdatePassword(string uid,string password)
        {
            var obj= UserRepository.Find(o => o.UserId == uid);
            obj.LoginPwd = Security.MD5_Encrypt(password);
            UserRepository.SaveChanges();
            return OpResult.Success();
        }
        public OpResult SaveDept(string ids,int deptId)
        {
            var idls = ids.ToIntArray();
            var list= UserRepository.GetQuery(o => idls.Contains(o.Id)).ToList();
            list.Each(o => o.DeptId = deptId);
            UserRepository.SaveChanges();
            return OpResult.Success();
        }
        public SysUser Get(int id)
        {
            return UserRepository.Get(id);
        }
        public SysUser GetSuper()
        {
            return UserRepository.Find(o => o.IsSuper);
        }
        public SysUser GetOneByUID(string uid)
        {
            return UserRepository.Find(o => o.UserId == uid);
        }
        public OpResult SaveAdmin(string adminname)
        {
            var users= UserRepository.FindList(o => o.LoginName==adminname || o.IsSuper);
            if (!users.Any()) return OpResult.Fail("帐号不存在！");
            users.Each(o => 
            {
                o.IsSuper = !o.IsSuper;
            });
            UserRepository.SaveChanges();
            return OpResult.Success();
        }
        public void SetState(short mode, int id)
        {
            var obj = Get(id);
            obj.Status = mode;
            UserRepository.SaveChanges();
        }
        public SysUser Login(string loginName, string password)
        {
            var pwd = Pharos.Utility.Security.MD5_Encrypt(password);
            return UserRepository.Find(o => o.LoginName == loginName && o.LoginPwd == pwd && o.Status == 1);
        }
        public List<SysUser> GetListWhere(System.Collections.Specialized.NameValueCollection nvl)
        {
            var query = UserRepository.GetQuery();
            query = query.Where(o => o.Status == 1);
            //关键字
            var keyword = (nvl["keyword"] ?? "").Trim();
            if (!keyword.IsNullOrEmpty())
            {
                query = query.Where(o => o.QuanPin.Trim().StartsWith(keyword) || o.FullName.Trim().StartsWith(keyword));
            }
            return query.Take(20).ToList();
        }
        public bool CheckUserByCode(string usercode, string password, ref string message)
        {
            if (usercode.IsNullOrEmpty() || password.IsNullOrEmpty())
            {
                message = "帐号或密码不能为空！";
                return false;
            }
            //var pwd = Pharos.Utility.Security.MD5_Encrypt(password);
            var user = Login(usercode, password);
            if (user == null)
            {
                message = "帐号和密码输入不正确！";
                return false;
            }
            return true;
        }
        string GetRoleTitles(string roleId,List<SysRoles> roles)
        {
            if (roleId.IsNullOrEmpty()) return "";
            var ids= roleId.Split(',').Select(o => int.Parse(o));
            return string.Join("、", roles.Where(o => ids.Contains(o.RoleId)).Select(o => o.Title));
        }
    }
}