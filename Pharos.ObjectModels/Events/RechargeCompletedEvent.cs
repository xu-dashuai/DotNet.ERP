﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.ObjectModels.Events
{
    public class RechargeCompletedEvent : IIntegralEvent
    {
        public RechargeCompletedEvent()
        {
            StoreId = "00";
        }
        public Guid ID
        {
            get { return Guid.NewGuid(); }
        }

        public DateTime TimeStamp
        {
            get { return DateTime.UtcNow; }
        }
        public int CompanyId { get; set; }
        public string StoreId { get; set; }
        public string MemberId { get; set; }
        public decimal ReceiveAmount { get; set; }
        public string SourceRecordId { get; set; }
        public string OperatorUid { get; set; }

    }
}