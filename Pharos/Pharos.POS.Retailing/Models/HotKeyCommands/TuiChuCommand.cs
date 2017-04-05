﻿using Pharos.POS.Retailing.Models.ViewModels;
using Pharos.Wpf.HotKeyHelper;
using System;
using System.Windows;

namespace Pharos.POS.Retailing.Models.HotKeyCommands
{
    public class TuiChuCommand : IHotKeyCommand
    {
        public Action<Window> Handler
        {
            get
            {
                return new Action<Window>((win) =>
                {
                    PosViewModel.Current.CloseCommand.Execute(null);
                });
            }
        }
    }
}