﻿using Pharos.POS.Retailing.Models.ApiParams;
using Pharos.POS.Retailing.Models.ApiReturnResults;
using Pharos.Wpf.ViewModelHelpers;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Pharos.POS.Retailing.Models.ViewModels
{
    public class TakeOutOrDepositMoney : BaseViewModel
    {
        public TakeOutOrDepositMoney()
        {
            Task.Factory.StartNew(() =>
            {
                Time = DateTime.Now;
                Thread.Sleep(1000);
            });
        }
        public string MachineSN
        {
            get
            {
                return Global.MachineSettings.MachineInformations.MachineSn;
            }
        }

        public string UserName
        {
            get
            {
                return Global.CurrentSaleMen.FullName;
            }
        }
        DateTime time;
        public DateTime Time
        {
            get
            {
                return time;
            }
            set
            {
                time = value;
                this.OnPropertyChanged(o => o.Time);
            }
        }

        decimal amount;
        public decimal Amount
        {
            get
            {
                return amount;
            }
            set
            {
                amount = value;
                this.OnPropertyChanged(o => o.Amount);
            }
        }
        string password;
        public string Password
        {
            get
            {
                return password;
            }
            set
            {
                password = value;
                this.OnPropertyChanged(o => o.Password);
            }
        }

        public GeneralCommand<object> OparetCommand
        {
            get
            {
                return new GeneralCommand<object>((type, handler) =>
                {
                    if (string.IsNullOrEmpty(Password))
                    {
                        Toast.ShowMessage("密码不能为空！", CurrentWindow);
                        return;
                    }
                    if (Amount <= 0)
                    {
                        Toast.ShowMessage("出入款金额必须大于0！", CurrentWindow);
                        return;
                    }
                    Task.Factory.StartNew(() =>
                    {
                        //调出入款数据
                        var _machinesInfo = Global.MachineSettings.MachineInformations;
                        var _currentUserCode = Global.CurrentSaleMen.UserCode;
                        GetPosIncomePayoutParams _params = new GetPosIncomePayoutParams() { UserCode = _currentUserCode, Password = Password, Money = Amount, Type = Convert.ToInt32(type), StoreId = _machinesInfo.StoreId, MachineSn = _machinesInfo.MachineSn, CID = _machinesInfo.CompanyId };
                        var result = ApiManager.Post<GetPosIncomePayoutParams, ApiRetrunResult<object>>(@"api/PosIncomePayout", _params);
                        if (result.Code == "200")
                        {
                            CurrentWindow.Dispatcher.Invoke(new Action(() =>
                            {
                                Toast.ShowMessage("操作成功!", CurrentWindow);
                            }));
                        }
                        else
                        {
                            CurrentWindow.Dispatcher.Invoke(new Action(() =>
                            {
                                Toast.ShowMessage(result.Message, CurrentWindow);
                            }));
                        }
                    });
                });
            }
        }
    }
}
