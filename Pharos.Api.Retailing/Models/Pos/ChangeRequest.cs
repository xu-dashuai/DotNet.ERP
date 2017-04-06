﻿using Pharos.Logic.ApiData.Pos.ValueObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pharos.Api.Retailing.Models.Pos
{
    public class ChangeRequest
    {
      //  public List<ChangeRefundItem> ChangeList { get; set; }
        public int Reason { get; set; }
        public decimal Amount { get; set; }

        public string PaySn { get; set; }
    }
}