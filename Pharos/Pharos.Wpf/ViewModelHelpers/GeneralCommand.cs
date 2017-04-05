﻿using System;
using System.Windows.Input;

namespace Pharos.Wpf.ViewModelHelpers
{
    /// <summary>
    /// 通用命令
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class GeneralCommand<T> : ICommand
    {
        /// <summary>
        /// 处理句柄
        /// </summary>
        Action<T, GeneralCommand<T>> Handler { get; set; }

        /// <summary>
        /// 命令的描述(此次为了方便对通用命令的扩展)
        /// </summary>
        public IGeneralCommandDescriptions Descriptions { get; private set; }

        /// <summary>
        /// 初始化通用命令
        /// </summary>
        /// <param name="handler">命令的处理</param>
        public GeneralCommand(Action<T, GeneralCommand<T>> handler)
            : this(handler, null)
        {
        }
        /// <summary>
        /// 初始化通用命令
        /// </summary>
        /// <param name="handler">命令的处理</param>
        /// <param name="descriptions">对命令的描述</param>
        public GeneralCommand(Action<T, GeneralCommand<T>> handler, IGeneralCommandDescriptions descriptions)
        {
            Handler = handler;
            Descriptions = descriptions;
        }

        /// <summary>
        /// 是否可以执行
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public bool CanExecute(object parameter)
        {
            if (Handler != null)
                return true;
            return false;
        }
        /// <summary>
        /// 执行Handler,传入参数T
        /// </summary>
        /// <param name="parameter"></param>
        public void Execute(object parameter)
        {
            if (CanExecute(parameter))
                Handler((T)parameter, this);
        }
        /// <summary>
        /// 是否可执行变化事件，详细参考ICommand结果
        /// </summary>
        public event EventHandler CanExecuteChanged;
    }
}