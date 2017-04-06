﻿using Pharos.POS.Retailing.ChildWin;
using Pharos.Wpf.HotKeyHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;

namespace Pharos.POS.Retailing.Models.HotKeyCommands
{
    public class AddMemberCommand : IHotKeyCommand
    {
        public Action<Window> Handler
        {
            get
            {
                return new Action<Window>((win) =>
                {
                    Member page = new Member(0);
                    page.Owner = win;
                    page.ShowDialog();
                });
            }
        }
    }
}