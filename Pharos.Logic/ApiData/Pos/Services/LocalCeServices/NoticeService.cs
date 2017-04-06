﻿using Pharos.Logic.ApiData.Pos.DAL;
using Pharos.Logic.ApiData.Pos.Entity.LocalCeEntity;
using Pharos.Logic.ApiData.Pos.ValueObject;
using Pharos.Logic.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.Logic.ApiData.Pos.Services.LocalCeServices
{
    public class NoticeService : BaseGeneralService<Notice, LocalCeDbContext>
    {
        public static IEnumerable<Announcement> Announcements(string storeId, string machineSn, int companyId)
        {
            var date = DateTime.Now.Date;
            return CurrentRepository.Entities.Where(o => o.State == 1 && o.BeginDate <= date && o.ExpirationDate >= date)
                .Select(o => new Announcement()
                {
                    Content = o.NoticeContent,
                    Theme = o.Theme,
                    ImgUrl = o.Url
                }).ToList();
        }

        internal static IEnumerable<Activity> Activities(string storeId, string machineSn, int companyId)
        {
            var date = DateTime.Now.Date;
            return CurrentRepository.Entities.Where(o => o.Type == 2 && o.State == 1 && o.BeginDate <= date && o.ExpirationDate >= date)
                .Select(o => new Activity()
                {
                    Theme = o.Theme,
                    Id = o.Id
                }).ToList();
        }
    }
}