﻿using Pharos.Logic.OMS.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Pharos.Logic.OMS.Entity.View;
using System.Data;
using System.Data.SqlClient;
using Pharos.Logic.OMS.IDAL;
using System.Linq.Expressions;

namespace Pharos.Logic.OMS.DAL
{
    /// <summary>
    /// DAL商家支付许可档案
    /// </summary>
    public class PayLicenseRepository : BaseRepository<PayLicense>, IPayLicenseRepository
    {
        /// <summary>
        /// 获取CID
        /// </summary>
        /// <param name="keyword"></param>
        /// <returns></returns>
        public  List<Traders> getListCID(string keyword)
        {
            using (EFDbContext db = new EFDbContext())
            {
                var sql = "select top 30 * from Traders t where t.Status=1 and (select COUNT(*) from CompanyAuthorize where Status=1 and CID=t.CID)>0 and t.CID like " + keyword;
                List<Traders> list = db.Database.SqlQuery<Traders>(sql).ToList();
                return list;
            }
        }

        /// <summary>
        /// 分页获取
        /// </summary>
        /// <param name="CurrentPage">当前页,从1开始,不是0</param>
        /// <param name="PageSize">每页显示多少条数据</param>
        /// <param name="strw">where条件</param>
        /// <param name="Count">总数</param>
        /// <returns></returns>
        public List<ViewPayLicense> getPageList(int CurrentPage, int PageSize, string strw, out int Count)
        {
            string Table = "";
            Table = Table + "PayLicense p ";
            Table = Table + "left join SysUser u on u.UserId=p.DesigneeId ";
            Table = Table + "left join Traders t on t.CID=p.CID ";
            Table = Table + "left join Area a on a.AreaID=p.CityId ";
            Table = Table + "left join SysUser u2 on u2.UserId=p.CreateUID ";
            Table = Table + "left join BankAccount b on b.LicenseId=p.LicenseId ";
            Table = Table + "left join TradersPaySecretKey k on k.CID=p.CID ";

            string Fields = "";
            Fields = Fields + "p.Id,u.FullName as DesigneeFullName,p.State,b.State as BankState,k.State as PayState,p.AgentsId,p.CID,t.FullTitle,(select top 1 ContractNo from CompanyAuthorize where Status=1 and CID=p.CID order by Id desc) as ContractNo,a.Title as city,p.SourceType,p.RegisterAddress,p.RegisterNumber,p.BusinessScope, ";
            Fields = Fields + "p.Linkman,p.Phone,p.Email,p.Remark,p.CreateDT,u2.FullName as CreateFullName ";

            string Where = "1=1 ";
            if (strw != "")
            {
                Where = Where + strw;
            }

            string OrderBy = "p.Id desc ";

            return CommonDal.getPageList<ViewPayLicense>(Table, Fields, Where, OrderBy, CurrentPage, PageSize, 0, out Count);
        }

        /// <summary>
        /// 获取一条记录
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public PayLicense GetEntityByWhere(int Id)
        {
            using (EFDbContext db = new EFDbContext())
            {
                var sql = "select * from PayLicense where Id=" + Id;
                return db.Database.SqlQuery<PayLicense>(sql).ToList().FirstOrDefault();
            }
        }


    }
}