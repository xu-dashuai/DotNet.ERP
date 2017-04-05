﻿using Microsoft.Synchronization;
using System;

namespace Pharos.SyncService
{
    public class RemoteProviderProxy : KnowledgeSyncProvider
    {
        private SyncIdFormatGroup idFormats;
        private PosServerDbSyncServiceClient client;
        private SyncSessionContext syncSessionContext;

        private string endpointConfigurationName;
        private int _companyId;
        private string _storeId;
        string syncDataServiceName;
        public RemoteProviderProxy(int companyId, string storeId, string endpointConfigurationName, string syncDataServiceName)
        {
            this.syncDataServiceName = syncDataServiceName;
            this.endpointConfigurationName = endpointConfigurationName;
            _companyId = companyId;
            _storeId = storeId;
            // Create a client
            this.client = new PosServerDbSyncServiceClient(
                endpointConfigurationName);

            this.client.CreateProviderForSyncSession(companyId, storeId, syncDataServiceName);
            this.idFormats = this.client.GetIdFormats();
        }

        public override SyncIdFormatGroup IdFormats
        {
            get
            {
                return this.idFormats;
            }
        }

        public override void BeginSession(
            SyncProviderPosition position,
            SyncSessionContext syncSessionContext)
        {
            if (this.client == null)
            {
                // Allow for the same proxy to be use in several unidirectional session
                this.client = new PosServerDbSyncServiceClient(
                    endpointConfigurationName);

                this.client.CreateProviderForSyncSession(_companyId, _storeId,syncDataServiceName);
            }

            this.syncSessionContext = syncSessionContext;
            this.client.BeginSession();
        }

        public override void EndSession(
            SyncSessionContext syncSessionContext)
        {
            this.syncSessionContext = null;
            this.client.EndSession();
            this.client.Close();
            this.client = null;
        }

        public override ChangeBatch GetChangeBatch(
            uint batchSize,
            SyncKnowledge destinationKnowledge,
            out object changeDataRetriever)
        {
            CachedChangeDataRetriever cachedChangeDataRetriever;

            ChangeBatch changeBatch = this.client.GetChangeBatch(
                batchSize,
                destinationKnowledge,
                out cachedChangeDataRetriever);

            changeDataRetriever = cachedChangeDataRetriever;

            return changeBatch;
        }

        public override FullEnumerationChangeBatch GetFullEnumerationChangeBatch(
            uint batchSize,
            SyncId lowerEnumerationBound,
            SyncKnowledge knowledgeForDataRetrieval,
            out object changeDataRetriever)
        {
            CachedChangeDataRetriever cachedChangeDataRetriever;

            FullEnumerationChangeBatch fullEnumerationChangeBatch = this.client.GetFullEnumerationChangeBatch(
                batchSize,
                lowerEnumerationBound,
                knowledgeForDataRetrieval,
                out cachedChangeDataRetriever);

            changeDataRetriever = cachedChangeDataRetriever;

            return fullEnumerationChangeBatch;
        }

        public override void GetSyncBatchParameters(
            out uint batchSize,
            out SyncKnowledge knowledge)
        {
            this.client.GetSyncBatchParameters(
                out batchSize,
                out knowledge);
        }

        public override void ProcessChangeBatch(
            ConflictResolutionPolicy resolutionPolicy,
            ChangeBatch sourceChanges,
            object changeDataRetriever,
            SyncCallbacks syncCallback,
            SyncSessionStatistics sessionStatistics)
        {
            try
            {
                CachedChangeDataRetriever cachedChangeDataRetriever = new CachedChangeDataRetriever(
                        changeDataRetriever as IChangeDataRetriever,
                        sourceChanges);

                byte[] newChangeApplierInfo = this.client.ProcessChangeBatch(
                    resolutionPolicy,
                    sourceChanges,
                    cachedChangeDataRetriever,
                    this.syncSessionContext.ChangeApplierInfo);

                this.syncSessionContext.ChangeApplierInfo = newChangeApplierInfo;
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }

        public override void ProcessFullEnumerationChangeBatch(
            ConflictResolutionPolicy resolutionPolicy,
            FullEnumerationChangeBatch sourceChanges,
            object changeDataRetriever,
            SyncCallbacks syncCallback,
            SyncSessionStatistics sessionStatistics)
        {
            try
            {
                CachedChangeDataRetriever cachedChangeDataRetriever = new CachedChangeDataRetriever(
                    changeDataRetriever as IChangeDataRetriever,
                    sourceChanges);

                byte[] newChangeApplierInfo = this.client.ProcessFullEnumerationChangeBatch(
                    resolutionPolicy,
                    sourceChanges,
                    cachedChangeDataRetriever,
                    this.syncSessionContext.ChangeApplierInfo);

                this.syncSessionContext.ChangeApplierInfo = newChangeApplierInfo;
            }
            catch (Exception ex) { Console.WriteLine(ex.Message); }
        }

        #region For demo purpose, not required for RCA pattern
        public void CleanupTombstones(TimeSpan timespan)
        {
            this.client.CleanupTombstones(timespan);
        }
        #endregion
    }
}