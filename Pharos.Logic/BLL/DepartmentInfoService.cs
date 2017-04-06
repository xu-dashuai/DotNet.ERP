﻿using Pharos.Logic.Entity;
using Pharos.Sys.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.Logic.BLL
{
    public class DepartmentInfoService : BaseService<SysDepartments>
    {
        public static IList<SysDepartments> GetOrganizations()
        {
            return DepartmentInfoService.FindList(o => o.Type==1);
        }

        public static IList<SysDepartments> GetChildDepartments(int pid) 
        {
            return DepartmentInfoService.FindList(o => o.PDepId == pid);
        }

        public static SysDepartments GetDepartment(int id) 
        {
            return DepartmentInfoService.Find(o => o.Id == id);
        }

    }
}