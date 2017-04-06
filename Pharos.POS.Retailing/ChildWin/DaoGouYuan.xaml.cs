﻿using Pharos.Wpf.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Pharos.Wpf.Extensions;
using System.Threading.Tasks;
using Pharos.POS.Retailing.Extensions;
using Pharos.POS.Retailing.Models.ViewModels;

namespace Pharos.POS.Retailing.ChildWin
{
    /// <summary>
    /// DaoGouYuan.xaml 的交互逻辑
    /// </summary>
    public partial class DaoGouYuan : DialogWindow02
    {
        public DaoGouYuan(int pageSource)
        {
            InitializeComponent();
            this.InitDefualtSettings();
            var model = new SaleManViewModel(pageSource);
            this.ApplyBindings(this, model);
        }
    }
}