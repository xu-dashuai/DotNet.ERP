﻿using Pharos.Infrastructure.Data.Normalize;
using Pharos.Logic.ApiData.Pos.Cache;
using Pharos.Logic.ApiData.Pos.Sale;
using Pharos.Logic.ApiData.Pos.Sale.Suspend;
using Pharos.SocketService.Retailing.Protocol;
using Pharos.SocketService.Retailing.Protocol.AppServers;
using Pharos.SocketService.Retailing.Protocol.AppSessions;
using Pharos.SocketService.Retailing.Protocol.CommandProviders;
using Pharos.SocketService.Retailing.Protocol.RequestInfos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pharos.SocketService.Retailing.Commands.V1
{
    public class SyncShoppingCartCommand : CommandBase
    {
        public SyncShoppingCartCommand()
            : base(new byte[4] { 0x00, 0x00, 0x00, 0x03 }, new PosStoreCommandNameProvider())
        {
        }

        public override void Excute(PosStoreServer server, PosStoreSession session, PosStoreRequestInfo requestInfo)
        {
            try
            {
                var jsonSerializerSettings = new Newtonsoft.Json.JsonSerializerSettings();
                jsonSerializerSettings.Converters.Add(new BarcodeConverter());
                var shoppingcart = requestInfo.Read<ShoppingCart>(jsonSerializerSettings);
                if (shoppingcart != null)
                {
                    var shoppingCartCache = new ShoppingCartCache();
                    string key = KeyFactory.MachineKeyFactory(shoppingcart.MachineInformation.CompanyId, shoppingcart.MachineInformation.StoreId, shoppingcart.MachineInformation.MachineSn, shoppingcart.MachineInformation.DeviceSn);
                    shoppingCartCache.Set(key, shoppingcart);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
