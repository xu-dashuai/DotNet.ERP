﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.POS.Retailing.Models.ApiReturnResults
{
    public class AreaInfo
    {
        public int AreaID { get; set; }
        public int AreaPID { get; set; }
        public string Title { get; set; }
        public byte Type { get; set; }
        public string JianPin { get; set; }
        public string QuanPin { get; set; }
        public string AreaSN { get; set; }
        public string PostCode { get; set; }
        public int OrderNum { get; set; }
    }
}