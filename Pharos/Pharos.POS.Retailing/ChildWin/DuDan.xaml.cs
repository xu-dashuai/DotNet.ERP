﻿using Pharos.POS.Retailing.Extensions;
using Pharos.POS.Retailing.Models.ViewModels;
using Pharos.Wpf.Controls;
using Pharos.Wpf.Extensions;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Pharos.POS.Retailing.ChildWin
{
    /// <summary>
    /// DuDan.xaml 的交互逻辑
    /// </summary>
    public partial class DuDan : DialogWindow02
    {
        HandBillList model;
        public DuDan()
        {
            InitializeComponent();
            this.InitDefualtSettings();
            model = new HandBillList();
            this.ApplyBindings(this, model);
            this.Closed += DuDan_Closed;
            this.PreviewKeyDown += DuDan_PreviewKeyDown;
        }

        void DuDan_PreviewKeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            switch (e.Key)
            {
                case System.Windows.Input.Key.D1:
                case System.Windows.Input.Key.NumPad1:
                    CallForKey(0);
                    break;
                case System.Windows.Input.Key.D2:
                case System.Windows.Input.Key.NumPad2:
                    CallForKey(1);
                    break;
                case System.Windows.Input.Key.D3:
                case System.Windows.Input.Key.NumPad3:
                    CallForKey(2);
                    break;
                case System.Windows.Input.Key.D4:
                case System.Windows.Input.Key.NumPad4:
                    CallForKey(3);
                    break;

                case System.Windows.Input.Key.D5:
                case System.Windows.Input.Key.NumPad5:
                    CallForKey(4);
                    break;
                case System.Windows.Input.Key.D6:
                case System.Windows.Input.Key.NumPad6:
                    CallForKey(5);
                    break;
                case System.Windows.Input.Key.D7:
                case System.Windows.Input.Key.NumPad7:
                    CallForKey(6);
                    break;
                case System.Windows.Input.Key.D8:
                case System.Windows.Input.Key.NumPad8:
                    CallForKey(7);
                    break;
                case System.Windows.Input.Key.D9:
                case System.Windows.Input.Key.NumPad9:
                    CallForKey(8);
                    break;
                case System.Windows.Input.Key.D0:
                case System.Windows.Input.Key.NumPad0:
                    CallForKey(9);
                    break;

            }
        }
        private void CallForKey(int index)
        {
            if (model != null && model.OrderItems != null && model.OrderItems.Count() > index)
            {
                var order = model.OrderItems.ElementAt(index);
                order.ReadHandBill.Execute(this);
            }
        }
        /// <summary>
        /// 窗口关闭的时候更新界面的挂单数量
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void DuDan_Closed(object sender, EventArgs e)
        {
            PosViewModel.Current.ReadHandBillNumber.Execute(null);
        }
    }
}