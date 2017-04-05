﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.Logic.ApiData.Pos.ValueObject
{
    public  class StoredValueCardPayDetailsItem
    {
        public string OrderSN { get; set; }
        public decimal OrderAmount { get; set; }
        public decimal PayAmount { get; set; }
        public string Store { get; set; }

        public string CardNo { get; set; }
        public DateTime PayDate { get; set; }
    }
}