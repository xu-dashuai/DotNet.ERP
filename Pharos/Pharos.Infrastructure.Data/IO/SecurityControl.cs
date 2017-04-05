﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Text;

namespace Pharos.Infrastructure.Data.IO
{
    public static class SecurityControl
    {
        /// <summary>
        /// 为文件添加users，everyone用户组的完全控制权限
        /// </summary>
        /// <param name="filePath"></param>
        public static void AddSecurityControllToFile(string[] identities, string filePath)
        {

            //获取文件信息
            FileInfo fileInfo = new FileInfo(filePath);
            //获得该文件的访问权限
            System.Security.AccessControl.FileSecurity fileSecurity = fileInfo.GetAccessControl();
            foreach (var item in identities)
            {
                fileSecurity.AddAccessRule(new FileSystemAccessRule(item, FileSystemRights.FullControl, AccessControlType.Allow));

            }
            //设置访问权限
            fileInfo.SetAccessControl(fileSecurity);
        }
        /// <summary>
        ///为文件夹添加users，everyone用户组的完全控制权限
        /// </summary>
        /// <param name="dirPath"></param>
        public static void AddSecurityControllToFolder(string[] identities, string dirPath)
        {
            //获取文件夹信息
            DirectoryInfo dir = new DirectoryInfo(dirPath);
            //获得该文件夹的所有访问权限
            System.Security.AccessControl.DirectorySecurity dirSecurity = dir.GetAccessControl(AccessControlSections.Access);
            //设定文件ACL继承
            InheritanceFlags inherits = InheritanceFlags.ContainerInherit | InheritanceFlags.ObjectInherit;
            bool isModified = false;
            foreach (var item in identities)
            {
                FileSystemAccessRule fileSystemAccessRule = new FileSystemAccessRule(item, FileSystemRights.FullControl, inherits, PropagationFlags.None, AccessControlType.Allow);
                dirSecurity.ModifyAccessRule(AccessControlModification.Add, fileSystemAccessRule, out isModified);
            }
            //设置访问权限
            dir.SetAccessControl(dirSecurity);
        }

        public static DirectorySecurity CreateDirectorySecurity(string[] identities)
        {
            System.Security.AccessControl.DirectorySecurity dirSecurity = new DirectorySecurity();
            //设定文件ACL继承
            InheritanceFlags inherits = InheritanceFlags.ContainerInherit | InheritanceFlags.ObjectInherit;
            bool isModified = false;
            foreach (var item in identities)
            {
                FileSystemAccessRule fileSystemAccessRule = new FileSystemAccessRule(item, FileSystemRights.FullControl, inherits, PropagationFlags.None, AccessControlType.Allow);
                dirSecurity.ModifyAccessRule(AccessControlModification.Add, fileSystemAccessRule, out isModified);
            }
            return dirSecurity;
        }

        public static FileSecurity CreateFileSecurity(string[] identities)
        {
            System.Security.AccessControl.FileSecurity fileSecurity = new FileSecurity();
            foreach (var item in identities)
            {
                fileSecurity.AddAccessRule(new FileSystemAccessRule(item, FileSystemRights.FullControl, AccessControlType.Allow));

            }
            return fileSecurity;
        }
    }
}