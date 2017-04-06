﻿using Microsoft.Synchronization;
using System;
using System.Linq;
using System.Collections.Generic;

namespace Pharos.SyncService
{
    [Serializable()]
    public class CachedChangeDataRetriever : IChangeDataRetriever
    {
        private SyncIdFormatGroup idFormats;
        private IDictionary<SyncId, ISyncDataObject> cachedData;
        public CachedChangeDataRetriever(IChangeDataRetriever changeDataRetriever, ChangeBatchBase sourceChanges)
        {
            idFormats = changeDataRetriever.IdFormats;
            cachedData = new Dictionary<SyncId, ISyncDataObject>();
            var changeItems = sourceChanges.Where(o => o.ChangeKind != ChangeKind.Deleted).Select(o => new UserLoadChangeContext(idFormats, o));
            cachedData = (changeDataRetriever as PosDbSyncProvider).LoadChangeDatas(changeItems);
        }
        public SyncIdFormatGroup IdFormats
        {
            get { return idFormats; }
        }

        public object LoadChangeData(LoadChangeContext loadChangeContext)
        {
            if (cachedData.ContainsKey(loadChangeContext.ItemChange.ItemId))
            {
                return cachedData[loadChangeContext.ItemChange.ItemId];
            }
            //else if (_changeDataRetriever != null)
            //{
            //    return _changeDataRetriever.LoadChangeData(loadChangeContext);
            //}
            throw new SyncException("未找到变更项信息！");
        }
    }
}