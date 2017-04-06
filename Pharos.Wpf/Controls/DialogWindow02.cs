﻿using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Shapes;

namespace Pharos.Wpf.Controls
{
    public class DialogWindow02 : Window
    {
        static DialogWindow02()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(DialogWindow02), new FrameworkPropertyMetadata(typeof(DialogWindow02)));
        }
        public static readonly DependencyProperty IsQueryProperty = DependencyProperty.Register("IsQuery", typeof(bool), typeof(DialogWindow02), new PropertyMetadata(false));
        public bool IsQuery
        {
            get { return (bool)GetValue(IsQueryProperty); }

            set { SetValue(IsQueryProperty, value); }
        }
        bool _EnableMove = true;
        public bool EnableMove { get { return _EnableMove; } set { _EnableMove = value; } }
        #region Click events
        protected void MinimizeClick(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        protected void RestoreClick(object sender, RoutedEventArgs e)
        {
            WindowState = (WindowState == WindowState.Normal) ? WindowState.Maximized : WindowState.Normal;
        }

        protected void CloseClick(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void moveRectangle_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            if (Mouse.LeftButton == MouseButtonState.Pressed && EnableMove)
                DragMove();
        }
        #endregion
        public override void OnApplyTemplate()
        {
            Rectangle moveRectangle = GetTemplateChild("moveRectangle") as Rectangle;
            if (moveRectangle != null)
                moveRectangle.PreviewMouseDown += moveRectangle_PreviewMouseDown;

            Border moveRectangleBorder = GetTemplateChild("moveRectangleBorder") as Border;
            if (moveRectangleBorder != null)
                moveRectangleBorder.PreviewMouseDown += moveRectangle_PreviewMouseDown;

            Button minimizeButton = GetTemplateChild("minimizeButton") as Button;
            if (minimizeButton != null)
                minimizeButton.Click += MinimizeClick;


            Button closeButton = GetTemplateChild("closeButton") as Button;
            if (closeButton != null)
                closeButton.Click += CloseClick;

            base.OnApplyTemplate();
        }
    }
}