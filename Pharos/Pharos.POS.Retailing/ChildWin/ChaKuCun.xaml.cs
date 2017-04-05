﻿using Pharos.POS.Retailing.Extensions;
using Pharos.POS.Retailing.Models.PosModels;
using Pharos.POS.Retailing.Models.ViewModels;
using Pharos.Wpf.Controls;
using Pharos.Wpf.Extensions;
using System;
using System.Threading.Tasks;
using System.Windows.Interop;

namespace Pharos.POS.Retailing.ChildWin
{
    /// <summary>
    /// MachineSettings.xaml 的交互逻辑
    /// </summary>
    public partial class ChaKuCun : DialogWindow02, IBarcodeControl
    {
        public ChaKuCun()
        {
            InitializeComponent();
            this.InitDefualtSettings();
            var model = new CheckInventory();
            this.ApplyBindings(this, model);
            CurrentIInputElement = txtbarcode;
            this.Loaded += ChaKuCun_Loaded;
        }

        void ChaKuCun_Loaded(object sender, System.Windows.RoutedEventArgs e)
        {
            // this.ThreadFilterMessage();            

        }

        //protected override void OnSourceInitialized(EventArgs e)
        //{
        //    //   HwndSource source = PresentationSource.FromVisual(this) as HwndSource;
        //    HwndSource source = HwndSource.FromHwnd(new WindowInteropHelper(this).Handle);

        //    if (source != null)
        //    {
        //        source.AddHook(this.WndProc);
        //    }

        //    base.OnSourceInitialized(e);
        //}

        public System.Windows.IInputElement CurrentIInputElement { get; set; }


      

    }
}