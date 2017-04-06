﻿using Pharos.Logic.OMS.Entity;
using Pharos.Logic.OMS.IDAL;
using Pharos.Utility.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Pharos.Logic.OMS.BLL
{
    public class LogService
    {
        [Ninject.Inject]
        IBaseRepository<SysLog> LogRepository { get; set; }
        [Ninject.Inject]
        IBaseRepository<SysUser> UserRepository { get; set; }
        public IEnumerable<dynamic> GetPageList(System.Collections.Specialized.NameValueCollection nvl, out int recordCount)
        {
            var keyword = (nvl["keyword"]??"").Trim();
            var type = nvl["type"].IsNullOrEmpty()?0:int.Parse(nvl["type"]);
            var queryLog = LogRepository.GetQuery();
            var queryUser = UserRepository.GetQuery();
            var query = from x in queryLog
                        join y in queryUser on x.UId equals y.UserId into tmp
                        from z in tmp.DefaultIfEmpty()
                        select new
                        {
                            x.Id,
                            x.ClientIP,
                            x.CreateDT,
                            x.ModuleName,
                            x.ServerName,
                            x.Summary,
                            x.Type,
                            z.LoginName
                        };
            if (!keyword.IsNullOrEmpty())
                query = query.Where(o => o.LoginName.Contains(keyword) || o.ClientIP.Contains(keyword));
            if (type != 0)
                query = query.Where(o => o.Type == type);
            recordCount = query.Count();
            return query.ToPageList().Select(x=>new{
                x.Id,
                x.ClientIP,
                x.CreateDT,
                x.ModuleName,
                x.ServerName,
                Summary = Summary(x.Summary),
                x.Type,
                x.LoginName
            });
        }

        public Pharos.Utility.OpResult DeleteRange(int[] ids)
        {
            var list= LogRepository.GetQuery(o => ids.Contains(o.Id)).ToList();
            LogRepository.RemoveRange(list);
            return Pharos.Utility.OpResult.Success();
        }
        public Pharos.Utility.OpResult DeleteAll()
        {
            var list = LogRepository.GetQuery().ToList();
            LogRepository.RemoveRange(list);
            return Pharos.Utility.OpResult.Success();
        }
        public SysLog GetOne(int id)
        {
            return LogRepository.Get(id);
        }
        string Summary(string summary)
        {
            summary = summary == null ? "" : System.Web.HttpUtility.HtmlEncode(summary);
            if (summary.Length > 180)
                summary = "<div title='" + summary + "'>" + summary.Substring(0, 180) + "...</div>";
            return summary;
        }
    }
}