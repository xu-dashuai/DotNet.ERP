﻿using Pharos.POS.Retailing.Models.ApiParams;
using Pharos.POS.Retailing.Models.ApiReturnResults;
using Pharos.Wpf.ViewModelHelpers;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Pharos.POS.Retailing.Models.ViewModels
{
    public class LockScreenViewModel : BaseViewModel, IDisposable
    {
        private bool isRuning = true;

        public LockScreenViewModel()
        {
            MachineSn = Global.MachineSettings.MachineInformations.MachineSn;
            StoreName = Global.MachineSettings.MachineInformations.StoreName;
            WinTitle = string.Format("{0} | {1}", Global.MachineSettings.MachineInformations.Company, Global.MachineSettings.MachineInformations.StoreName);
            AppName = PosViewModel.Current.AppName;
            WinIcon = PosViewModel.Current.WinIcon;
            UserCode = Global.CurrentSaleMen.UserCode;
            OperatorName = Global.CurrentSaleMen.FullName;
            Task.Factory.StartNew(() =>
            {
                while (isRuning)
                {
                    Date = DateTime.Now;
                    Thread.Sleep(1000);
                }
            });
        }
        string winTitle;
        public string WinTitle
        {
            get
            {
                return winTitle;
            }
            set
            {
                winTitle = value;
                this.OnPropertyChanged(o => o.WinTitle);
            }
        }

        public string storeName;
        public string StoreName
        {
            get
            {
                return storeName;
            }
            set
            {
                storeName = value;
                this.OnPropertyChanged(o => o.StoreName);
            }
        }
        public string machineSn;
        public string MachineSn
        {
            get { return machineSn; }
            set
            {
                machineSn = value;
                this.OnPropertyChanged(o => o.MachineSn);
            }
        }

        string winIcon;
        public string WinIcon
        {
            get
            {
                return winIcon;
            }
            set
            {
                winIcon = value;
                this.OnPropertyChanged(o => o.WinIcon);
            }
        }

        private DateTime date;

        public DateTime Date
        {
            get { return date; }
            set
            {
                date = value;
                this.OnPropertyChanged(o => o.Date);
            }
        }
        private DateTime lockDate;

        public DateTime LockDate
        {
            get { return DateTime.Now; }
        }

        public string userCode;
        public string UserCode
        {
            get { return userCode; }
            set
            {
                userCode = value;
                this.OnPropertyChanged(o => o.UserCode);
            }
        }

        private string operatorName;
        public string OperatorName
        {
            get { return operatorName; }
            set
            {
                operatorName = value;
                this.OnPropertyChanged(o => o.OperatorName);
            }
        }
        string appName;
        public string AppName
        {
            get
            {
                return appName;
            }
            set
            {
                appName = value;
                this.OnPropertyChanged(o => o.AppName);
            }
        }

        public string Password { get; set; }

        public GeneralCommand<object> UnLock
        {
            get
            {
                return new GeneralCommand<object>((o1, o2) =>
                {
                    var machineInfo = Global.MachineSettings.MachineInformations;
                    //if login
                    //登录接口，判断返回是否成功
                    LoginInfo _loginInfo = new LoginInfo() { IsLock = true, StoreId = machineInfo.StoreId, MachineSn = machineInfo.MachineSn, Account = UserCode, Password = Password, DeviceSN = machineInfo.DeviceId, DeviceType = 1, EntryPoint = 0, CID = machineInfo.CompanyId };
                    var result = ApiManager.Post<object, ApiRetrunResult<LoginUserInfo>>(@"api/Login", _loginInfo);
                    if (result.Code == "200")
                    {
                        PosViewModel.Current.CurrentWindow.Show();
                        Dispose();
                        CurrentWindow.Close();
                    }
                    else
                    {
                        Toast.ShowMessage(result.Message, CurrentWindow);
                    }
                });
            }
        }

        public void Dispose()
        {
            isRuning = false;
        }
    }
}