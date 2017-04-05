﻿using Pharos.Sys.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Pharos.Sys.DAL
{
    /// <summary>
    /// 获取所有门店角色列表数据
    /// </summary>
    internal class SysStoreUserInfoDAL : BaseSysEntityDAL<SysStoreUserInfo>
    {
        internal SysStoreUserInfoDAL() : base("SysStoreUserInfo") { }

        internal List<SysStoreUserInfo> GetUsers(int selectType, string keyWord = "", string selectUID = "")
        {
            string sql = string.Empty;
            if (selectType == 1)
            { //全部
                sql = "SELECT [UID],FullName FROM dbo.SysStoreUserInfo where 1=1 AND CompanyId=" + Sys.SysCommonRules.CompanyId;//16.03.24增加企业过滤
            }
            else
            { //排除注销
                sql = "SELECT [UID],FullName,LoginName FROM dbo.SysStoreUserInfo WHERE [Status]=1 AND CompanyId=" + Sys.SysCommonRules.CompanyId;//16.03.24增加企业过滤
            }
            if (!string.IsNullOrWhiteSpace(keyWord) && !string.IsNullOrWhiteSpace(selectUID))
                sql += string.Format(" and (LoginName like '%{0}%' or fullname like '%{0}%' {1})", keyWord, "or uid='" + selectUID + "'");
            else if (!string.IsNullOrWhiteSpace(selectUID))
                sql += string.Format(" or uid='{0}'", selectUID);
            var objs = DbHelper.DataTableText<SysStoreUserInfo>(sql, null);
            return objs;
        }
        /// <summary>
        /// 获取所有门店角色列表数据
        /// </summary>
        /// <returns></returns>
        internal DataTable GetList(int companyId)
        {
            var objs = DbHelper.DataTable("Sys_AllStoreRoles", new SqlParameter[]{
                new SqlParameter("@companyId",companyId)
            });
            return objs;
        }
        /// <summary>
        /// 新增用户门店角色信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        internal int Insert(SysStoreUserInfo model, bool addSysUserInfo = false)
        {
            SqlParameter[] parms = {
                    new SqlParameter("@UID", model.UID),
                    new SqlParameter("@CompanyId",Sys.SysCommonRules.CompanyId),
                    new SqlParameter("@FullName",model.FullName),
                    new SqlParameter("@UserCode",model.UserCode),
                    new SqlParameter("@LoginPwd",model.LoginPwd),
                    new SqlParameter("@Sex",model.Sex),
                    new SqlParameter("@OperateAuth",model.OperateAuth),
                    new SqlParameter("@Status",model.Status),
                    new SqlParameter("@LoginName",model.LoginName),
                    new SqlParameter("@LoginDT",model.LoginDT)
                                   };

            string sql = @"
                INSERT INTO dbo.SysStoreUserInfo( UID ,FullName ,UserCode ,LoginPwd ,Sex ,OperateAuth ,Status ,LoginDT ,CompanyId,LoginName )VALUES 
( @UID ,@FullName ,@UserCode ,@LoginPwd ,@Sex ,@OperateAuth ,@Status ,@LoginDT ,@CompanyId,@LoginName) ;select @@IDENTITY";
            //sql = string.Format(sql, TableName);

            object obj = DbHelper.ExecuteScalarText(sql, parms);
            if (obj != null)
            {
                if (addSysUserInfo)
                {
                    //包含店长则增加店长角色
                    var roles = string.Empty;
                    if (model.OperateAuth.Contains(",1"))
                    {
                        roles = "10";
                    }

                    SqlParameter[] sysParam ={
                                new SqlParameter("@CompanyId",Sys.SysCommonRules.CompanyId),
                                new SqlParameter("@UID", model.UID),
                                new SqlParameter("@UserCode",model.UserCode),
                                new SqlParameter("@FullName",model.FullName),
                                new SqlParameter("@LoginName",model.LoginName),
                                new SqlParameter("@LoginPwd",model.LoginPwd),
                                new SqlParameter("@Sex",model.Sex),
                                new SqlParameter("@Status",model.Status),
                                new SqlParameter("@CreateUID",Sys.CurrentUser.UID),
                                new SqlParameter("@RoleIds",roles)
                                            };
                    sql = @"INSERT INTO dbo.SysUserInfo (CompanyId ,UID ,UserCode ,FullName ,LoginName ,LoginPwd ,Sex  ,
Status ,LoginDT ,LoginNum ,CreateDT ,CreateUID ,IsShopManager,RoleIds )
VALUES  ( @CompanyId ,@UID ,@UserCode ,@FullName ,@LoginName ,@LoginPwd ,@Sex ,@Status ,GETDATE() ,0 ,GETDATE() ,@CreateUID , 0,@RoleIds );select @@IDENTITY";
                    //sql = string.Format(sql, TableName);
                    obj = DbHelper.ExecuteScalarText(sql, sysParam);
                }
            }
            return (obj == null) ? 0 : Convert.ToInt32(obj);
        }
        /// <summary>
        /// 更新用户门店角色信息
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        internal bool Update(SysStoreUserInfo model)
        {
            //更新门店表
            SqlParameter[] parms = {
                    new SqlParameter("@UID", model.UID),
                    new SqlParameter("@OperateAuth", model.OperateAuth),
                    new SqlParameter("@LoginName",model.LoginName),
                    new SqlParameter("@LoginPwd",model.LoginPwd),
                    new SqlParameter("@Sex",model.Sex),
                    new SqlParameter("@Status",model.Status),
                    new SqlParameter("@CompanyId",model.CompanyId),
                    new SqlParameter("@UserCode",model.UserCode)
                                   };

            string sql = @"
                UPDATE {0} SET LoginPwd=@LoginPwd,LoginName=@LoginName,Status=@Status,Sex=@Sex,OperateAuth=@OperateAuth WHERE UID=@UID and CompanyId=@CompanyId";
            sql = string.Format(sql, "SysStoreUserInfo");
            int rows = DbHelper.ExecuteNonQueryText(sql, parms);
            //更新总部表
            if (rows > 0)
            {
                var storeRole = string.Empty;
                if (model.OperateAuth.Contains(Sys.SysCommonRules.CurrentStore + ",1"))
                {
                    SqlParameter[] para ={
                                        new SqlParameter("@UID", model.UID),
                                        new SqlParameter("@CompanyId",model.CompanyId)
                                        };
                    var userquery = "SELECT * FROM dbo.SysUserInfo WHERE UID=@UID AND CompanyId=@CompanyId";
                    var user = DbHelper.DataTableText<SysUserInfo>(userquery, para).FirstOrDefault();
                    //storeRole = user.RoleIds;
                    if (string.IsNullOrEmpty(user.RoleIds) && ("|" + model.OperateAuth + "|").Contains("|" + Sys.SysCommonRules.CurrentStore + ",1|"))
                        storeRole = "10";
                    else
                    {
                        if (("|" + model.OperateAuth + "|").Contains("|" + Sys.SysCommonRules.CurrentStore + ",1|"))
                        {
                            if (!("," + user.RoleIds + ",").Contains(",10,"))
                            {
                                storeRole = user.RoleIds + ",10";
                            }
                            else
                            {
                                storeRole = user.RoleIds;
                            }
                        }

                    }
                }
                SqlParameter[] sparams ={
                            new SqlParameter("@UID", model.UID),
                            new SqlParameter("@LoginName",model.LoginName),
                            new SqlParameter("@Sex",model.Sex),
                            new SqlParameter("@Status",model.Status),
                            new SqlParameter("@UserCode",model.UserCode),
                            new SqlParameter("@CompanyId",model.CompanyId),
                            new SqlParameter("@RoleIds",storeRole)
                                       };
                sql = @"UPDATE SysUserInfo SET LoginName=@LoginName,Status=@Status,Sex=@Sex,RoleIds=@RoleIds WHERE  UID=@UID and CompanyId=@CompanyId";
                rows = DbHelper.ExecuteNonQueryText(sql, sparams);
            }
            return rows > 0 ? true : false;
        }
        internal bool UpdataOperateAuth(SysStoreUserInfo model)
        {
            SqlParameter[] parms = {
                    new SqlParameter("@UID", model.UID),
                    new SqlParameter("@OperateAuth", model.OperateAuth)
                                   };

            string sql = @"
                UPDATE a SET 
		        a.FullName=b.FullName,a.UserCode=b.UserCode,a.LoginName=b.LoginName,a.LoginPwd=b.LoginPwd,a.Sex=b.Sex,
		        a.[Status]=b.[Status],a.OperateAuth=@OperateAuth
		        FROM {0} a
		        JOIN SysUserInfo b ON a.[UID]=b.[UID]
		        WHERE a.[UID]=@UID";
            sql = string.Format(sql, "SysStoreUserInfo");
            int rows = DbHelper.ExecuteNonQueryText(sql, parms);
            return rows > 0 ? true : false;
        }

        internal bool Update(string uid)
        {
            SqlParameter[] parms = {
                    new SqlParameter("@UID", uid)};
            //a.LoginPwd=b.LoginPwd,
            string sql = @"
                UPDATE a SET 
		        a.FullName=b.FullName,a.UserCode=b.UserCode,a.LoginName=b.LoginName,a.Sex=b.Sex,
		        a.[Status]=b.[Status]
		        FROM SysStoreUserInfo a
		        JOIN SysUserInfo b ON a.[UID]=b.[UID]
		        WHERE a.[UID]=@UID
";
            int rows = DbHelper.ExecuteNonQueryText(sql, parms);

            return rows > 0 ? true : false;
        }
        internal List<SysStoreUserInfo> GetStoreUser(string storeId, string keyword, int state)
        {
            string where = " AND 1=1";
            if (!string.IsNullOrEmpty(keyword))
            {
                keyword = keyword.Trim();
                where += " AND (b.FullName LIKE '" + keyword + "' OR b.LoginName LIKE  '" + keyword + "'  OR b.UserCode LIKE  '" + keyword + "' )";
            }
            if (state != 0)
            {
                where += " AND b.Status=" + state;
            }
            return DbHelper.DataTableText<SysStoreUserInfo>(@"SELECT b.* FROM dbo.SysUserInfo a
                INNER JOIN dbo.SysStoreUserInfo b ON a.UID=b.UID
                WHERE b.Status=1 AND '|'+b.OperateAuth+',' LIKE'%|" + storeId + ",%' AND b.CompanyId=" + SysCommonRules.CompanyId + where, null);
        }
        /// <summary>
        /// 获取数据相同的entity
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        internal List<SysStoreUserInfo> GetStoreUserInfo(SysStoreUserInfo model)
        {
            SqlParameter[] param = { new SqlParameter("@UserCode",model.UserCode),
                                   new SqlParameter("@FullName",model.FullName),
                                   new SqlParameter("@CompanyId",model.CompanyId)
                                   };
            var sql = @"SELECT * FROM dbo.SysStoreUserInfo WHERE UserCode=@UserCode AND FullName=@FullName AND CompanyId=@CompanyId";
            var result = DbHelper.ExecuteReaderText<SysStoreUserInfo>(sql, param);
            return result;
        }

        internal object GetUserData(string fullName, string loginName)
        {
            if (!string.IsNullOrEmpty(fullName))
            {
                SqlParameter[] param ={
                                    new SqlParameter("@CompanyId",SysCommonRules.CompanyId),
                                    new SqlParameter("@FullName",fullName)
                                 };
                var basesql = @"SELECT * FROM {0} WHERE FullName=@FullName AND CompanyId=@CompanyId";
                var sql = string.Format(basesql, "SysStoreUserInfo");
                var result = DbHelper.ExecuteReaderText<SysStoreUserInfo>(sql, param).FirstOrDefault();
                if (result == null)
                {
                    sql = string.Format(basesql, "SysUserInfo");
                    result = DbHelper.ExecuteReaderText<SysStoreUserInfo>(sql, param).FirstOrDefault();
                }
                return result;
            }
            else if (!string.IsNullOrEmpty(loginName))
            {
                SqlParameter[] param ={
                                    new SqlParameter("@CompanyId",SysCommonRules.CompanyId),
                                    new SqlParameter("@LoginName",loginName)
                                 };
                var basesql = @"SELECT * FROM {0} WHERE LoginName=@LoginName AND CompanyId=@CompanyId";
                var sql = string.Format(basesql, "SysStoreUserInfo");
                var result = DbHelper.ExecuteReaderText<SysUserInfo>(sql, param).FirstOrDefault();
                if (result == null)
                {
                    sql = string.Format(basesql, "SysUserInfo");
                    result = DbHelper.ExecuteReaderText<SysUserInfo>(sql, param).FirstOrDefault();
                }
                return result;
            }
            return null;
        }
    }
}