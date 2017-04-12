USE [master]
GO
/****** Object:  Database [Pharos_dev]    Script Date: 04/12/2017 14:11:28 ******/
CREATE DATABASE [Pharos_dev] ON  PRIMARY 
( NAME = N'Dongben_Release', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Pharos_dev.mdf' , SIZE = 58560KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Dongben_Release_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Pharos_dev.ldf' , SIZE = 12352KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Pharos_dev] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pharos_dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pharos_dev] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Pharos_dev] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Pharos_dev] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Pharos_dev] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Pharos_dev] SET ARITHABORT OFF
GO
ALTER DATABASE [Pharos_dev] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Pharos_dev] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Pharos_dev] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Pharos_dev] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Pharos_dev] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Pharos_dev] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Pharos_dev] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Pharos_dev] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Pharos_dev] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Pharos_dev] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Pharos_dev] SET  DISABLE_BROKER
GO
ALTER DATABASE [Pharos_dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Pharos_dev] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Pharos_dev] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Pharos_dev] SET ALLOW_SNAPSHOT_ISOLATION ON
GO
ALTER DATABASE [Pharos_dev] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Pharos_dev] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Pharos_dev] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Pharos_dev] SET  READ_WRITE
GO
ALTER DATABASE [Pharos_dev] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Pharos_dev] SET  MULTI_USER
GO
ALTER DATABASE [Pharos_dev] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Pharos_dev] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pharos_dev', N'ON'
GO
USE [Pharos_dev]
GO
/****** Object:  User [PHAROS-PC\yuxiongwen]    Script Date: 04/12/2017 14:11:28 ******/
CREATE USER [PHAROS-PC\yuxiongwen] FOR LOGIN [PHAROS-PC\yuxiongwen] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PHAROS-PC\huangrong]    Script Date: 04/12/2017 14:11:28 ******/
CREATE USER [PHAROS-PC\huangrong] FOR LOGIN [PHAROS-PC\huangrong] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pharos_demo]    Script Date: 04/12/2017 14:11:28 ******/
CREATE USER [pharos_demo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pharos_admin]    Script Date: 04/12/2017 14:11:28 ******/
CREATE USER [pharos_admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[SysWebSetting]    Script Date: 04/12/2017 14:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysWebSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogoDispWay] [smallint] NULL,
	[TopLogo] [nvarchar](200) NULL,
	[BottomLogo] [nvarchar](200) NULL,
	[AppIcon640] [nvarchar](200) NULL,
	[AppIcon960] [nvarchar](200) NULL,
	[AppIndexIcon640] [nvarchar](200) NULL,
	[AppIndexIcon960] [nvarchar](200) NULL,
	[AppCustomer640] [nvarchar](200) NULL,
	[AppCustomer960] [nvarchar](200) NULL,
	[AppIndexbg640] [nvarchar](200) NULL,
	[AppIndexbg960] [nvarchar](200) NULL,
	[SysName] [nvarchar](200) NULL,
	[SysIcon] [nvarchar](200) NULL,
	[WebsiteUrl] [nvarchar](200) NULL,
	[CompanyTitle] [nvarchar](50) NULL,
	[Tel] [varchar](20) NULL,
	[PageTitle] [nvarchar](50) NULL,
	[SMTPServer] [nvarchar](100) NULL,
	[SMTPPort] [int] NULL,
	[SMTPShowName] [nvarchar](200) NULL,
	[SMTPSSLPort] [int] NULL,
	[SMTPAccount] [nvarchar](100) NULL,
	[SMTPPwd] [nvarchar](50) NULL,
	[EMReqUrlBase] [nvarchar](200) NULL,
	[EMAppId] [nvarchar](200) NULL,
	[EMAppSecret] [nvarchar](200) NULL,
	[EMAppOrg] [nvarchar](200) NULL,
	[EMAppName] [nvarchar](200) NULL,
	[CompanyId] [int] NOT NULL,
	[LoginLogo] [varchar](50) NULL,
 CONSTRAINT [PK_SysWebSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'logo展现方式（1-logo+名称，2-logo,3-名称)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'LogoDispWay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顶部Logo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'TopLogo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'底部Logo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'BottomLogo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'App图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'AppIcon640'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'App首页背景图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'AppCustomer640'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统Icon' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'SysIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'官网地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'WebsiteUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'CompanyTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'页面Title' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'PageTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SMTP发件箱服务器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'SMTPServer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SMTP端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'SMTPPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SMTP显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'SMTPShowName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SMTP SSL端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'SMTPSSLPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SMTP账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'SMTPAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SMTP密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'SMTPPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP在环信上注册的对应应用URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'EMReqUrlBase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP在环信上注册的对应应用Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'EMAppId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP在环信上注册的对应应用Secret' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'EMAppSecret'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP在环信上对应的appkey的org_name部分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'EMAppOrg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP在环信上对应的appkey的app_name部分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSetting', @level2type=N'COLUMN',@level2name=N'EMAppName'
GO
/****** Object:  Table [dbo].[SysUsersLimits]    Script Date: 04/12/2017 14:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysUsersLimits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UId] [varchar](40) NOT NULL,
	[LimitsCode] [int] NOT NULL,
 CONSTRAINT [PK_Sys_UsersLimits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUsersLimits', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUsersLimits', @level2type=N'COLUMN',@level2name=N'UId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUsersLimits', @level2type=N'COLUMN',@level2name=N'LimitsCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的用户自定义权限信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUsersLimits'
GO
/****** Object:  Table [dbo].[SysUserInfo]    Script Date: 04/12/2017 14:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysUserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[UID] [varchar](40) NOT NULL,
	[UserCode] [varchar](10) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[LoginName] [nvarchar](100) NOT NULL,
	[LoginPwd] [nvarchar](50) NOT NULL,
	[Sex] [bit] NULL,
	[BranchId] [int] NULL,
	[BumenId] [int] NULL,
	[BossUId] [varchar](40) NULL,
	[PositionId] [int] NULL,
	[PhotoUrl] [nvarchar](200) NULL,
	[Status] [smallint] NOT NULL,
	[RoleIds] [nvarchar](2000) NULL,
	[LoginIP] [varchar](50) NULL,
	[LoginDT] [datetime] NOT NULL,
	[LoginNum] [int] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NULL,
	[StoreRole] [varchar](50) NULL,
	[Signature] [nvarchar](100) NULL,
	[IsShopManager] [smallint] NOT NULL,
	[Handsign] [varchar](20) NULL,
	[Mobile] [varchar](20) NULL,
	[HuanXinUUID] [varchar](50) NULL,
 CONSTRAINT [PK_SysUserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户 UID （GUID 全 局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'UID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号（员 工编 号，全 局唯一  ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'UserCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别（0:女、1:男）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隶属机构ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'BranchId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隶属部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'BumenId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'直属上司ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'BossUId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'担任职位(来自数据字典)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1:正常、2:锁定、3:注销）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隶属角色组ID（多个间用,逗号间隔）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'RoleIds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录次数（0:未登录过）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'信息创建者 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'StoreRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个性签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'Signature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为店长（ 0: 否， 1: 是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'IsShopManager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手势密码(手机端)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'Handsign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环信IM用户uuid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo', @level2type=N'COLUMN',@level2name=N'HuanXinUUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的用户基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserInfo'
GO
/****** Object:  Table [dbo].[SysStoreUserInfo]    Script Date: 04/12/2017 14:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysStoreUserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UID] [varchar](40) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[UserCode] [varchar](10) NOT NULL,
	[LoginName] [nvarchar](100) NULL,
	[LoginPwd] [nvarchar](50) NOT NULL,
	[Sex] [bit] NULL,
	[OperateAuth] [nvarchar](2000) NOT NULL,
	[Status] [smallint] NOT NULL,
	[LoginDT] [datetime] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SysUserInfoes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'UID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'UserCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'LoginPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别（0:女、1:男）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本店角色（1:店长、2:营业员、3:收银员、4:数据维护），格式：门店ID,角色ID|门店ID,角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'OperateAuth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1:正常、2:锁定、3:注销）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'LoginDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本门店的店员基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysStoreUserInfo'
GO
/****** Object:  Table [dbo].[SysRoles]    Script Date: 04/12/2017 14:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[LimitsIds] [nvarchar](4000) NOT NULL,
	[Memo] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[AllowDel] [smallint] NOT NULL,
	[ShowView] [smallint] NOT NULL,
 CONSTRAINT [PK_SysRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色组 ID（全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限 ID （多个间用 ,号间隔， 号间隔， -1:不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles', @level2type=N'COLUMN',@level2name=N'LimitsIds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:关闭、1:可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许物理删除 （0: 否、1:是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles', @level2type=N'COLUMN',@level2name=N'AllowDel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'允许显示到页面 （0: 否、1: 是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles', @level2type=N'COLUMN',@level2name=N'ShowView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的权限组信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysRoles'
GO
/****** Object:  View [dbo].[sysproperties]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[sysproperties]
as SELECT class AS id,Minor_id AS sMallid,* from sys.extended_properties
GO
/****** Object:  Table [dbo].[SysPaymentSetting]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysPaymentSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [varchar](300) NOT NULL,
	[PayType] [smallint] NOT NULL,
	[State] [smallint] NOT NULL,
	[PartnerId] [nvarchar](200) NOT NULL,
	[AppId] [nvarchar](200) NOT NULL,
	[CheckKey] [nvarchar](200) NOT NULL,
	[NotifyUrl] [nvarchar](200) NULL,
	[Memo] [nvarchar](100) NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[AlterDT] [datetime] NULL,
	[AlterUID] [varchar](40) NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_SysPaymentSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用门店（多个以逗号隔开，0表示全部）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式（1:支付宝,2:微信）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:停用、1:可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付宝：合作身份者ID/微信：mchID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'PartnerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付宝：使用当面付编码/微信：appID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'AppId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付宝：交易安全检验码/微信：支付密钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'CheckKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付通知页面' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'NotifyUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'AlterDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPaymentSetting', @level2type=N'COLUMN',@level2name=N'AlterUID'
GO
/****** Object:  Table [dbo].[SysMenus]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysMenus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[PMenuId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](200) NULL,
	[Type] [smallint] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Sys_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SysMenus_MenuId] ON [dbo].[SysMenus] 
(
	[MenuId] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMenus', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单 Id （全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMenus', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级菜单（ 0:顶级）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMenus', @level2type=N'COLUMN',@level2name=N'PMenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMenus', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMenus', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMenus', @level2type=N'COLUMN',@level2name=N'URL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型 0-总部，1-门店' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMenus', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:隐藏、1:显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMenus', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的菜单基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMenus'
GO
/****** Object:  Table [dbo].[SysMailSender]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysMailSender](
	[Id] [varchar](38) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BatchNo] [varchar](20) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Body] [varchar](max) NULL,
	[State] [smallint] NOT NULL,
	[SenderCode] [varchar](30) NOT NULL,
	[SenderName] [varchar](30) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[TimerDate] [datetime] NULL,
	[ReceiverCodes] [varchar](2000) NOT NULL,
	[CopytoCodes] [varchar](1000) NULL,
 CONSTRAINT [PK9] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'BatchNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'Body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0-草稿1-已发送' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'SenderCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'SenderName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'定时时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'TimerDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收者，以分号隔开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'ReceiverCodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抄送者，以分号隔开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender', @level2type=N'COLUMN',@level2name=N'CopytoCodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统发送的邮件信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailSender'
GO
/****** Object:  Table [dbo].[SysMailReceive]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysMailReceive](
	[Id] [varchar](38) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BatchNo] [varchar](20) NOT NULL,
	[ReceiveCode] [varchar](30) NOT NULL,
	[ReceiveName] [varchar](30) NOT NULL,
	[SenderCode] [varchar](30) NOT NULL,
	[SenderName] [varchar](30) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Body] [text] NULL,
	[Type] [smallint] NOT NULL,
	[State] [smallint] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[ReadDate] [datetime] NULL,
	[ReceiverCodes] [varchar](2000) NOT NULL,
	[CopytoCodes] [varchar](1000) NULL,
 CONSTRAINT [PK14] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'BatchNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收者编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'ReceiveCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'ReceiveName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'SenderCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'SenderName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'Body'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型 1-收件人2-抄送人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0-未读1-已读' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已读时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'ReadDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收者，以分号隔开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'ReceiverCodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抄送者，以分号隔开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive', @level2type=N'COLUMN',@level2name=N'CopytoCodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统接收的邮件信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysMailReceive'
GO
/****** Object:  Table [dbo].[SysLog]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Type] [tinyint] NULL,
	[UId] [varchar](40) NOT NULL,
	[Summary] [nvarchar](max) NOT NULL,
	[ClientIP] [varchar](50) NOT NULL,
	[ServerName] [varchar](50) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[ModuleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SysLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（ 1: 登录、 2: 退出、 3:异常 、4: 新增、5: 修改 、6: 删除 、10:其他 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'UId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'ClientIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务器名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog', @level2type=N'COLUMN',@level2name=N'ModuleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有日志信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLog'
GO
/****** Object:  Table [dbo].[SysLimits]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysLimits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[LimitId] [int] NOT NULL,
	[PLimitId] [int] NOT NULL,
	[Depth] [smallint] NULL,
	[SortOrder] [int] NOT NULL,
	[Status] [smallint] NOT NULL,
 CONSTRAINT [PK_SysLimits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLimits', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLimits', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限 ID （全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLimits', @level2type=N'COLUMN',@level2name=N'LimitId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隶属权限 ID（ 0:顶级）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLimits', @level2type=N'COLUMN',@level2name=N'PLimitId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'深度（1-9）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLimits', @level2type=N'COLUMN',@level2name=N'Depth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:关闭/停用、1:显示/默认选中、2:可选）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLimits', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的全局权限Code信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysLimits'
GO
/****** Object:  Table [dbo].[SysDepartments]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SysDepartments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Type] [smallint] NOT NULL,
	[DepId] [int] NOT NULL,
	[PDepId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SN] [nvarchar](50) NULL,
	[ManagerUId] [varchar](40) NULL,
	[DeputyUId] [varchar](40) NULL,
	[IndexPageUrl] [nvarchar](200) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Sys_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机构部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（1:机构、2:部门、3:子部门）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机构部门Id(全局唯一)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'DepId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隶属分机构ID（0:顶级）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'PDepId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序（0:无）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'SN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门领导ID（-1:未知）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'ManagerUId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门副领导ID（-1:未知）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'DeputyUId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录后首页' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'IndexPageUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:关闭、1:显示）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的分机构、部门信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartments'
GO
/****** Object:  Table [dbo].[SysDataDictionary]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysDataDictionary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DicSN] [int] NOT NULL,
	[DicPSN] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Depth] [smallint] NULL,
	[Status] [bit] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_SysDataDictionary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDataDictionary', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号（该编号全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDataDictionary', @level2type=N'COLUMN',@level2name=N'DicSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父编号ID（0：顶级）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDataDictionary', @level2type=N'COLUMN',@level2name=N'DicPSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序（0:无）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDataDictionary', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDataDictionary', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'深度(1:一级、2:二级、3:三级、4:四级、9:具体字典)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDataDictionary', @level2type=N'COLUMN',@level2name=N'Depth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:关闭、1:可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDataDictionary', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有业务数据字典信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDataDictionary'
GO
/****** Object:  Table [dbo].[SysCustomMenus]    Script Date: 04/12/2017 14:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysCustomMenus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[ObjId] [int] NOT NULL,
	[MenuIds] [nvarchar](max) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_SysCustomMenus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCustomMenus', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用类型（-1:全部,1:部门,2:角色,3:用户）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCustomMenus', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用对象ID（-1:全部,部门ID、角色ID、用户ID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCustomMenus', @level2type=N'COLUMN',@level2name=N'ObjId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拥有菜单项（多个间用,号间隔，-1:继承所在部门）（来自SysMenus表Id）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCustomMenus', @level2type=N'COLUMN',@level2name=N'MenuIds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCustomMenus', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的部门或用户自定义菜单配置信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCustomMenus'
GO
/****** Object:  UserDefinedFunction [dbo].[Sys_F_RemoveSign]    Script Date: 04/12/2017 14:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-27
-- Description:	移除左右两边指定符号
-- =============================================
CREATE FUNCTION [dbo].[Sys_F_RemoveSign]
(
	@Items nvarchar(max),
	@sign varchar(2)
)
RETURNS nvarchar(max)
AS
BEGIN

	IF(CHARINDEX(@sign,@Items)=1)
	BEGIN
		SET @Items=SUBSTRING(@Items,LEN(@sign)+1,LEN(@Items)-0);
	END
	
	IF(SUBSTRING(@Items,LEN(@Items),1)=@sign)
	BEGIN
		SET @Items=SUBSTRING(@Items,0,LEN(@Items)-0);
	END
	
	return @items;
END
GO
/****** Object:  UserDefinedFunction [dbo].[Sys_F_StoreRoles]    Script Date: 04/12/2017 14:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-11
-- Description:	获取所有门店角色信息
-- =============================================
CREATE function [dbo].[Sys_F_StoreRoles]()
returns @TABLE table 
( 
	[StoreRoleId] int, 
	[StoreRoleName] nvarchar(2000) 
) 
as 
begin 
	INSERT INTO @TABLE ([StoreRoleId],[StoreRoleName])
	SELECT 1 StoreRoleId,'店长' StoreRoleName
	UNION SELECT 2 StoreRoleId,'营业员' StoreRoleName
	UNION SELECT 3 StoreRoleId,'收银员' StoreRoleName
	UNION SELECT 4 StoreRoleId,'数据维护' StoreRoleName
	return 
end
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 04/12/2017 14:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [varchar](40) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ClassifyId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Jianpin] [nvarchar](20) NULL,
	[FullTitle] [nvarchar](100) NOT NULL,
	[Linkman] [nvarchar](20) NOT NULL,
	[MobilePhone] [varchar](11) NULL,
	[Tel] [varchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Designee] [varchar](40) NOT NULL,
	[MasterAccount] [nvarchar](100) NULL,
	[MasterPwd] [nvarchar](50) NULL,
	[MasterState] [smallint] NOT NULL,
	[CreateDT] [datetime] NULL,
	[BusinessType] [smallint] NOT NULL,
	[Handsign] [varchar](20) NULL,
	[Signature] [varchar](50) NULL,
 CONSTRAINT [PK_SUPPLIER] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供应商ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供应商分类（-1:未知）（来自数据字典表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'ClassifyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商家简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商家简拼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Jianpin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商家全称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'FullTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Linkman'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'MobilePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E-mail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'指派人（UID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Designee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主账号(全局唯一)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'MasterAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码（MD5+）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'MasterPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号状态（0:关闭、1:可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'MasterState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商家类型（1：供应商、2：批发商）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'BusinessType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手势密码(手机端)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier', @level2type=N'COLUMN',@level2name=N'Handsign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的各类供应商基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Supplier'
GO
/****** Object:  Table [dbo].[StorePaymentAuthorization]    Script Date: 04/12/2017 14:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StorePaymentAuthorization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [varchar](50) NOT NULL,
	[MapPaymentStoreId] [varchar](50) NOT NULL,
	[PayType] [int] NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_StorePaymentAuthorization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'映射支付平台门店' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StorePaymentAuthorization', @level2type=N'COLUMN',@level2name=N'MapPaymentStoreId'
GO
/****** Object:  Table [dbo].[StoredValueCardPayRecord]    Script Date: 04/12/2017 14:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoredValueCardPayRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[OrderSn] [varchar](50) NOT NULL,
	[CardNo] [varchar](50) NOT NULL,
	[StoreId] [varchar](4) NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[Balance] [money] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockTakingLog]    Script Date: 04/12/2017 14:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockTakingLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CheckBatch] [varchar](30) NOT NULL,
	[Barcode] [varchar](20) NOT NULL,
	[Number] [money] NOT NULL,
	[State] [smallint] NOT NULL,
	[SysPrice] [money] NULL,
	[ActualDate] [date] NULL,
	[CreateDT] [datetime] NOT NULL,
	[CheckUID] [varchar](40) NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[Source] [smallint] NULL,
 CONSTRAINT [PK_StockTakingLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'盘点批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'CheckBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'盘点数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 （0: 初盘、 1:复盘）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实盘日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'ActualDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'盘点员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'CheckUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源（1-电脑，2-手机，3-导入）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的盘点日志信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTakingLog'
GO
/****** Object:  Table [dbo].[StockTaking]    Script Date: 04/12/2017 14:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockTaking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CheckBatch] [varchar](30) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[LockNumber] [money] NOT NULL,
	[ActualNumber] [money] NULL,
	[Sure] [smallint] NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NULL,
	[CorrectNumber] [money] NULL,
 CONSTRAINT [PK_STOCKTAKING] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTaking', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'盘点批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTaking', @level2type=N'COLUMN',@level2name=N'CheckBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTaking', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'锁库数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTaking', @level2type=N'COLUMN',@level2name=N'LockNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实盘数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTaking', @level2type=N'COLUMN',@level2name=N'ActualNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-未确，1-无差异，2有差异' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTaking', @level2type=N'COLUMN',@level2name=N'Sure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTaking', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存纠正' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTaking', @level2type=N'COLUMN',@level2name=N'CorrectNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有库存货品盘点信息（依赖表：TreasuryLocks）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockTaking'
GO
/****** Object:  StoredProcedure [dbo].[Rpt_BrandSaleDetail]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--2015-10-22
-- =============================================
-- Author:		<linbl>
-- Create date: <2015-08-11>
-- Description:	<商品品牌销售明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_BrandSaleDetail]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @brandSN VARCHAR(100)='',
    @sortField VARCHAR(20)=''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @Sql Nvarchar(Max);
        DECLARE @where NVARCHAR(2000);
        
        SET @Sql='
        WITH x AS(SELECT *,ROUND(SaleTotal/PurchaseNumber, 2) ActualPrice ,ROUND(SysTotal/PurchaseNumber, 2) SysPrice ,
        (tb.SaleTotal- tb.BuyTotal) MLE
        FROM (
        SELECT b.BigCategoryTitle,(b.BigCategoryTitle+''/''+b.MidCategoryTitle+''/''+b.SubCategoryTitle) CategoryTitle,b.Barcode,b.Title,b.SubUnit,b.BrandTitle,
			SUM(a.PurchaseNumber*a.ActualPrice) SaleTotal,
            SUM(a.PurchaseNumber*a.BuyPrice) BuyTotal,
			SUM(a.PurchaseNumber*a.SysPrice) SysTotal,
            SUM(a.PurchaseNumber) PurchaseNumber ,
            ROUND(SUM(a.BuyPrice)/COUNT(1),2) BuyPrice
        FROM    dbo.SaleDetail a
                LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
        WHERE   1=1 AND b.BigCategoryTitle IS NOT null'
        
        SET @where='EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' )'
                                
        IF(LEN(@storeId)>0 and @storeId IS not NULL)
        BEGIN
			SET @where='EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+'''  and EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId))'
        END
        IF(LEN(@brandSN)>0)
        BEGIN
			SET @where=@where+' and b.BrandSN in('+@brandSN+')'
        END
        SET @sql=@sql+' and '+@where+' GROUP BY b.BrandSN,b.BrandTitle,b.BigCategoryTitle,b.MidCategoryTitle,b.SubCategoryTitle,b.Barcode,b.Title,b.SubUnit) tb
        ) select *, CASE WHEN x.SaleTotal = 0 THEN ''0'' ELSE CAST(CAST(( x.SaleTotal - x.BuyTotal )/ x.SaleTotal * 100 AS MONEY) AS VARCHAR(20)) END + ''%'' MLL from x'
        IF(LEN(@sortField)>0)
        BEGIN
			SET @sql=@sql+' order by '+@sortField+' DESC'
        END
        ELSE
        BEGIN
			SET @sql=@sql+' order by Barcode'
        END
        EXEC(@sql);
    END
    
    
    --EXEC sp_executesql N'select * from SaleDetail where id=@id and paysn=@paysn',N'@id int,@paysn varchar(30)',@id=5,@paysn='2015102009233030';
GO
/****** Object:  StoredProcedure [dbo].[Rpt_CommodityPromotionSaleDetail]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<特价商品销售明细月报>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_CommodityPromotionSaleDetail]
	-- Add the parameters for the stored procedure here
	@startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @storeId VARCHAR(20)='',
    @bigCategorySN INT=0,
    @supplierId VARCHAR(40)=''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Sql NVARCHAR(Max);
    DECLARE @where NVARCHAR(2000);
    
    SET @Sql = 'SELECT * FROM '

	
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ProductSaleDetailDay]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2015-10-29>
-- Description:	<商品销售明细日报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_ProductSaleDetailDay]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @bigCategorySN VARCHAR(2000)='',
    @sortField VARCHAR(20)=''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @Sql Nvarchar(Max);
        DECLARE @where NVARCHAR(2000);
        
        SET @Sql='
        WITH x AS(SELECT *,(tb.BigCategoryTitle+''/''+tb.MidCategoryTitle) CategoryTitle,
        ( tb.SaleTotal- tb.BuyTotal) MLE FROM (
        SELECT b.BigCategoryTitle, b.MidCategoryTitle,b.Barcode,b.Title,b.SubUnit,
			SUM(a.PurchaseNumber*a.ActualPrice) SaleTotal,
            SUM(a.PurchaseNumber*a.BuyPrice) BuyTotal,
			ROUND(SUM(a.ActualPrice/a.PurchaseNumber), 2) ActualPrice ,
			ROUND(SUM(a.SysPrice/a.PurchaseNumber), 2) SysPrice ,
            SUM(a.PurchaseNumber) PurchaseNumber ,
            ROUND(SUM(a.BuyPrice)/COUNT(1),2) BuyPrice
        FROM    dbo.SaleDetail a
                LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
        WHERE   1=1 AND b.MidCategoryTitle IS NOT null '
        
        SET @where='EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' )'
                                
        IF(LEN(@storeId)>0 and @storeId IS not NULL)
        BEGIN
			SET @where='EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId))'
        END
        IF(LEN(@bigCategorySN)>0)
        BEGIN
			SET @where=@where+' and b.CategorySN in('+@bigCategorySN+')'
        END
        SET @sql=@sql+' and '+@where+' GROUP BY b.BigCategoryTitle,b.MidCategoryTitle,b.Barcode,b.Title,b.SubUnit) tb
        ) select *, CASE WHEN x.SaleTotal = 0 THEN ''0'' ELSE CAST(CAST(( x.SaleTotal - x.BuyTotal )/ x.SaleTotal * 100 AS MONEY) AS VARCHAR(20)) END + ''%'' MLL from x'
        IF(LEN(@sortField)>0)
        BEGIN
			SET @sql=@sql+' order by '+@sortField+' DESC'
        END
        ELSE
        BEGIN
			SET @sql=@sql+' order by Barcode'
        END
        PRINT @Sql
        EXEC(@sql);
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ProductSaleDetail]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--2015-10-22
-- =============================================
-- Author:		<lbl>
-- Create date: <2015-08-11>
-- Description:	<商品销售明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_ProductSaleDetail]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @bigCategorySN VARCHAR(2000)='',
    @sortField VARCHAR(20)=''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @Sql Nvarchar(Max);
        DECLARE @where NVARCHAR(2000);
        
        SET @Sql='
        WITH x AS(SELECT *,
        ( tb.SaleTotal- tb.BuyTotal) MLE
        FROM (
        SELECT b.BigCategoryTitle, (b.BigCategoryTitle+''/''+b.MidCategoryTitle+''/''+b.SubCategoryTitle) CategoryTitle,b.Barcode,b.Title,b.SubUnit,
			SUM(a.PurchaseNumber*a.ActualPrice) SaleTotal,
            SUM(a.PurchaseNumber*a.BuyPrice) BuyTotal,
			ROUND(SUM(a.ActualPrice/a.PurchaseNumber), 2) ActualPrice ,
			ROUND(SUM(a.SysPrice/a.PurchaseNumber), 2) SysPrice ,
            SUM(a.PurchaseNumber) PurchaseNumber ,
            ROUND(SUM(a.BuyPrice)/COUNT(1),2) BuyPrice
        FROM    dbo.SaleDetail a
                LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
        WHERE   1=1 AND b.BigCategoryTitle IS NOT null '
        
        SET @where='EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' )'
                                
        IF(LEN(@storeId)>0 and @storeId IS not NULL)
        BEGIN
			SET @where='EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId))'
        END
        IF(LEN(@bigCategorySN)>0)
        BEGIN
			SET @where=@where+' and b.CategorySN in('+@bigCategorySN+')'
        END
        SET @sql=@sql+' and '+@where+' GROUP BY b.BigCategoryTitle,b.MidCategoryTitle,b.SubCategoryTitle,b.Barcode,b.Title,b.SubUnit) tb
        ) select *, CASE WHEN x.SaleTotal = 0 THEN ''0'' ELSE CAST(CAST(( x.SaleTotal - x.BuyTotal )/ x.SaleTotal * 100 AS MONEY) AS VARCHAR(20)) END + ''%'' MLL from x'
        IF(LEN(@sortField)>0)
        BEGIN
			SET @sql=@sql+' order by '+@sortField+' DESC'
        END
        ELSE
        BEGIN
			SET @sql=@sql+' order by Barcode'
        END
        
        PRINT @Sql
        EXEC(@sql);
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_BigCategoryStatistics]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<cyh>
-- Create date: <2015-08-13>
-- Description:	<大类销售汇总月报>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_BigCategoryStatistics]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @bigCategorySN VARCHAR(300)='',
    @sortField VARCHAR(20)=''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @Sql NVARCHAR(Max);
    DECLARE @where NVARCHAR(2000);
    
    SET @Sql='
    SELECT * FROM (
    SELECT  b.BigCategoryTitle,
		(b.BigCategoryTitle+''/''+b.MidCategoryTitle) CategoryTitle,
		(SUM(a.ActualPrice*a.PurchaseNumber)) SaleTotal,
		SUM(a.BuyPrice*a.PurchaseNumber) BuyTotal,
		(SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber)) JML,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN ''0'' ELSE CAST(CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) as varchar(20)) END +''%'' JMLL
    FROM    dbo.SaleDetail a
            LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
    WHERE   1=1 '
    
    SET @where='EXISTS ( SELECT 1
                     FROM   dbo.SaleOrders
                     WHERE  PaySN = a.PaySN
                            AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' )'
                            
    IF(LEN(@storeId)>0 and @storeId IS not NULL)
    BEGIN
		SET @where='EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId))'
    END
    IF(LEN(@bigCategorySN)>0)
    BEGIN
		SET @where=@where+' and b.CategorySN in('+@bigCategorySN+')'
    END
    
    SET @Sql=@Sql+' and '+@where+' GROUP BY b.BigCategoryTitle,b.MidCategoryTitle) tb'

    IF(LEN(@sortField)>0)
    BEGIN
		SET @Sql=@Sql+' ORDER BY '+@sortField +' DESC'
    END
    ELSE
    BEGIN
		SET @Sql=@Sql+' ORDER BY SaleTotal DESC'
    END
    
    EXEC(@Sql);
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_ProductCategoryFromTitle]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2017-01-18
-- Description:	获取对应类别分级名称
-- =============================================
CREATE FUNCTION [dbo].[F_ProductCategoryFromTitle]
    (
      @title VARCHAR(50) ,--完整名称 特产/茶叶/武夷岩茶的
	  @find VARCHAR(10)='/', --查找
      @depth INT--深度
    )
RETURNS VARCHAR(50)
AS
    BEGIN
		DECLARE @desc VARCHAR(50)='';
        DECLARE @i INT=1,@j INT=1 ;
        
		SET @i=CHARINDEX(@find,@title);
		IF(@i=0 AND @depth=1)
		BEGIN
			SET @i=LEN(@title)+1
		END
		WHILE(@i>0)
		BEGIN
			SET @desc=SUBSTRING(@title,1,@i-1);		
			IF(@depth=@j)
			BEGIN
				BREAK;
			END
			SET @title=REPLACE(@title,@desc+@find,'');
			SET @i=CHARINDEX(@find,@title);
			SET @j=@j+1;
			SET @desc=@title;
		END
		IF(@depth> @j)
		BEGIN
			SET @desc='';
		end
        RETURN @desc;
    END
GO
/****** Object:  Table [dbo].[OutboundList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OutboundList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OutboundId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[OutboundNumber] [money] NOT NULL,
	[OutPrice] [money] NOT NULL,
	[SysPrice] [money] NOT NULL,
	[Memo] [nvarchar](200) NULL,
	[BuyPrice] [money] NOT NULL,
	[AssistBarcode] [varchar](30) NULL,
 CONSTRAINT [PK_OutboundList_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出库单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList', @level2type=N'COLUMN',@level2name=N'OutboundId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出库数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList', @level2type=N'COLUMN',@level2name=N'OutboundNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList', @level2type=N'COLUMN',@level2name=N'OutPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList', @level2type=N'COLUMN',@level2name=N'SysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList', @level2type=N'COLUMN',@level2name=N'BuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList', @level2type=N'COLUMN',@level2name=N'AssistBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有货品出库明细清单信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundList'
GO
/****** Object:  Table [dbo].[SaleDetailsTotal]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleDetailsTotal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaySN] [varchar](50) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[Total] [money] NOT NULL,
 CONSTRAINT [PK__SaleDeta__3214EC076ABAD62E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetailsTotal', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetailsTotal', @level2type=N'COLUMN',@level2name=N'PaySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetailsTotal', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetailsTotal', @level2type=N'COLUMN',@level2name=N'Total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有商品销售明细信息（主表：SaleOrders）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetailsTotal'
GO
/****** Object:  Table [dbo].[SaleDetail]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ProductCode] [varchar](20) NULL,
	[ScanBarcode] [varchar](30) NOT NULL,
	[PaySN] [varchar](50) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[PurchaseNumber] [money] NOT NULL,
	[AveragePrice] [decimal](18, 8) NULL,
	[BuyPrice] [money] NOT NULL,
	[SysPrice] [money] NOT NULL,
	[ActualPrice] [money] NOT NULL,
	[Total] [money] NULL,
	[SalesClassifyId] [int] NOT NULL,
	[Memo] [nvarchar](200) NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_SALEDETAIL] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扫入条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'ScanBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'PaySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购买数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'PurchaseNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'BuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'SysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'ActualPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售分类ID（来自数据字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'SalesClassifyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有商品销售明细信息（主表：SaleOrders）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleDetail'
GO
/****** Object:  Table [dbo].[SaleCommodityHistory]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleCommodityHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaySn] [nvarchar](50) NOT NULL,
	[StorageBarcode] [nvarchar](50) NOT NULL,
	[Mode] [int] NOT NULL,
	[Number] [money] NOT NULL,
	[CommodityId] [int] NOT NULL,
	[SaleBarcode] [nvarchar](50) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Rpt_SupplierStatistics]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<cyh>
-- Create date: <Create Date,,>
-- Description:	<供应商汇总月报>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_SupplierStatistics]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @supplierName VARCHAR(20)='',
    @topCount INT=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @Sql NVARCHAR(Max);
    DECLARE @where NVARCHAR(2000);
    
    SET @Sql='
     * FROM (
    SELECT  b.SupplierId,b.SupplierTitle,
		(SUM(a.ActualPrice*a.PurchaseNumber)) SaleTotal,
		SUM(a.BuyPrice*a.PurchaseNumber) BuyTotal,
		(SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber)) JML,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN ''0'' ELSE CAST(CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) as VARCHAR(20)) END +''%'' JMLL
    FROM    dbo.SaleDetail a
            LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
    WHERE   1=1 '
    
    SET @where='EXISTS ( SELECT 1
                     FROM   dbo.SaleOrders
                     WHERE  PaySN = a.PaySN
                            AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' )'
                            
	IF(LEN(@storeId)>0 and @storeId IS not NULL)
		BEGIN
			SET @where='EXISTS ( SELECT 1
                     FROM   dbo.SaleOrders
                     WHERE  PaySN = a.PaySN
                            AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId))'
    END
    IF(LEN(@supplierName)>0 and @supplierName IS not NULL)
    BEGIN
		SET @where=@where+' AND b.SupplierTitle LIKE N''%'+@supplierName+'%'''
    END
    SET @Sql=@Sql+' and '+@where+' GROUP BY b.SupplierId,b.SupplierTitle) tb ORDER BY SaleTotal DESC'
    IF(@topCount>0)
    BEGIN
		SET @Sql='SELECT TOP '+CAST(@topCount AS VARCHAR(10))+@Sql
    end
    ELSE
    BEGIN
		SET @Sql='SELECT '+@Sql
    end
    
    EXEC(@Sql);
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_SupplierSaleDetail]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--2015-10-22
-- =============================================
-- Author:		<linbl>
-- Create date: <2015-08-11>
-- Description:	<商品供应商销售明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_SupplierSaleDetail]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @supplierId VARCHAR(500)='',
    @sortField VARCHAR(20)=''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @Sql Nvarchar(Max);
        DECLARE @where NVARCHAR(2000);
        
        SET @Sql='
        WITH x AS(SELECT *,ROUND(SaleTotal/PurchaseNumber, 2) ActualPrice ,ROUND(SysTotal/PurchaseNumber, 2) SysPrice ,
        (tb.SaleTotal- tb.BuyTotal) MLE
        FROM (
        SELECT  b.BigCategoryTitle,(b.BigCategoryTitle+''/''+b.MidCategoryTitle+''/''+b.SubCategoryTitle) CategoryTitle,b.Barcode,b.Title,b.SubUnit,b.SupplierTitle,
			SUM(a.PurchaseNumber*a.ActualPrice) SaleTotal,
            SUM(a.PurchaseNumber*a.BuyPrice) BuyTotal,
			sum(a.SysPrice*a.PurchaseNumber) SysTotal ,
            SUM(a.PurchaseNumber) PurchaseNumber ,
            ROUND(SUM(a.BuyPrice)/COUNT(1),2) BuyPrice
        FROM    dbo.SaleDetail a
                LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
        WHERE   1=1 AND b.SupplierId IS NOT null '
        
        SET @where='EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' )'
                                
        IF(LEN(@storeId)>0 and @storeId IS not NULL)
        BEGIN
			SET @where='EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId))'
        END
        IF(LEN(@supplierId)>0)
        BEGIN
			SET @where=@where+' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@supplierId+''','','',1) WHERE Value=supplierId)'
        END
        SET @sql=@sql+' and '+@where+' GROUP BY b.SupplierId,b.SupplierTitle,b.BigCategoryTitle,b.MidCategoryTitle,b.SubCategoryTitle,b.Barcode,b.Title,b.SubUnit) tb
        ) select *, CASE WHEN x.SaleTotal = 0 THEN ''0'' ELSE CAST(CAST(( x.SaleTotal - x.BuyTotal )/ x.SaleTotal * 100 AS MONEY) AS VARCHAR(20)) END + ''%'' MLL from x'
        IF(LEN(@sortField)>0)
        BEGIN
			SET @sql=@sql+' order by '+@sortField+' DESC'
        END
        ELSE
        BEGIN
			SET @sql=@sql+' order by Barcode'
        END
        PRINT @sql;
        EXEC(@sql);
    END
GO
/****** Object:  Table [dbo].[STHouseMove]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STHouseMove](
	[Id] [varchar](40) NOT NULL,
	[OutStoreId] [varchar](3) NOT NULL,
	[InStoreId] [varchar](3) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[OrderQuantity] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[DeliveryQuantity] [money] NULL,
	[DeliveryUID] [varchar](40) NULL,
	[ActualQuantity] [money] NULL,
	[ActualUID] [varchar](40) NULL,
	[Memo] [nvarchar](200) NULL,
	[State] [smallint] NOT NULL,
	[ReasonId] [int] NULL,
	[StockOut] [smallint] NOT NULL,
 CONSTRAINT [PK_STHOUSEMOVE] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调出分店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'OutStoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调入分店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'InStoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调拨商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'OrderQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'DeliveryQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'DeliveryUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'ActualQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'ActualUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1:调拨中、2:已配送、3:已撤回、4:已收货）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退回请求原因（来自字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'ReasonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否缺货' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove', @level2type=N'COLUMN',@level2name=N'StockOut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有门店的货品调拨信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'STHouseMove'
GO
/****** Object:  StoredProcedure [dbo].[SQLUpdateCompanyId]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SQLUpdateCompanyId]
@val nvarchar(50),
@newVal nvarchar(50)
as
SET nocount on;    
DECLARE @column nvarchar(50);  
SET @column='CompanyId';  
--SET @val='1';  
--SET @newVal='2';    
IF(OBJECT_ID('tempdb.dbo.#tmpFindTable','U') IS NOT NULL)  
BEGIN   DROP TABLE dbo.#tmpFindTable;  END  
CREATE TABLE dbo.#tmpFindTable(item nvarchar(50));    
IF(OBJECT_ID('tempdb.dbo.#tmpTable','U') IS NOT NULL)  
BEGIN   DROP TABLE dbo.#tmpTable;  END  
CREATE TABLE dbo.#tmpTable([表名] nvarchar(50), [字段] nvarchar(50), [值] nvarchar(2000));    
INSERT INTO dbo.#tmpFindTable  SELECT * FROM ( select a.name as item from sysobjects a   inner join syscolumns b on b.id=a.id   where b.name=@column and a.xtype='U'  ) as tab order by item;      
DECLARE @tb NVarchar(50);  
DECLARE @sql Nvarchar(2000);  
DECLARE @counts Int;    
WHILE EXISTS(SELECT item FROM dbo.#tmpFindTable)  
BEGIN   
SET ROWCOUNT 1;   
SELECT @tb=item FROM dbo.#tmpFindTable;    
SET ROWCOUNT 0;   
DELETE FROM dbo.#tmpFindTable WHERE item=@tb;   
  SET @sql='select @tmp_counts=count(*) from ' +@tb+ ' where ([' +@column+'] is null) or ([' +@column+'] = ''' +@val+ ''')';   
  EXECUTE sp_executesql @sql,N'@tmp_counts int out',@counts out;   
  IF(@counts>0)   
  BEGIN   
   --SELECT '表名为：'+@tb+'，字段名为：'+@column+'，值为：'+@val;    
   --INSERT INTO dbo.#tmpTable SELECT @tb, @column, @val;    
   SET @sql='update ' +@tb+ ' set [' +@column+']=''' +@newVal+ ''' where ([' +@column+'] is null) or ([' +@column+'] = ''' +@val+ ''')';   
   EXECUTE sp_executesql @sql;   
  END  
END  
SELECT * FROM dbo.#tmpTable;  
SET nocount off;
GO
/****** Object:  StoredProcedure [dbo].[SQLGenerateScript]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-04-13
-- Description:	生成脚本
-- =============================================
CREATE PROCEDURE [dbo].[SQLGenerateScript]
	@tName sysname,
	@generateModel smallint=0	--0:表结构和数据，1:仅表结构，2:仅数据
AS
BEGIN
	set nocount on;
	declare @column varchar(1000);
	declare @columndata varchar(1000);
	declare @sql varchar(4000);
	declare @xtype tinyint;
	declare @name sysname; 
	declare @objectId int;
	declare @objectname sysname ;
	declare @ident int;
	
	set @objectId=object_id(@tName);
	
	if(@objectId is null)
	begin 
		print @tName+' 对象不存在';
		return; 
	end 
	set @objectname=rtrim(object_name(@objectId)) 
	 
	if(@objectname is null or charindex(@objectname,@tName)=0) 
	begin 
		print @tName+' 对象不存在当前数据库['+@objectname+']';
		return; 
	end 
	 
	if(OBJECTPROPERTY(@objectId,'IsTable') < > 1)
	begin 
		print '该对象不是 Table 类型';
		return; 
	end 
	
	if(@generateModel=0 or @generateModel=1)
	begin
		--生成表结构脚本
set @sql = 'create table ['+@tName+'] 
(
	'
	select @sql = @sql + '['+b.name + '] ['+c.name+']'+
		   (case when c.collation_name is not null then '('+
			 case when b.max_length <>-1 then convert(varchar(100),CASE WHEN c.name='nvarchar' then b.max_length/2 ELSE b.max_length END)
			   else 'MAX'
			 end +') '
			else ''
		   end) +
		   (case when b.is_identity = 1
				then ' identity('+convert(varchar(100),IDENT_SEED(@tName))+','+convert(varchar(100),IDENT_INCR(@tName))+')' else '' end) +
		   (case when d.definition is not null then ' default('+d.definition +')' else '' end) +
		   (case when b.is_nullable = 0 then ' not null' else ' null' end) +
	       
	',
	'
from sys.objects a join sys.columns b
on a.object_id = b.object_id
join sys.types c
on b.system_type_id = c.system_type_id and b.user_type_id = c.user_type_id
left join sys.default_constraints d
on b.default_object_id = d.object_id
where a.name=@tName
order by b.column_id
if exists(select * from sys.indexes where object_id =object_id(@tName) and is_primary_key =1 )
begin
select @sql = @sql + 'CONSTRAINT ['+name+'] PRIMARY KEY '+type_desc+'
(
	' from sys.indexes where object_id =object_id(@tName) and is_primary_key =1
	select @sql = @sql +'['+ b.name+']' + (case when a.is_descending_key =1 then ' DESC' else ' ASC' end) +','
	from sys.index_columns a join sys.columns b
	on a.object_id= b.object_id and a.column_id = b.column_id
	where a.object_id =object_id(@tName)
	select @sql = left(@sql,len(@sql)-1)+'
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
end
set @sql = @sql+'
) ON [PRIMARY];';

		print @sql;
		SELECT @sql;
		if(LEN(@sql)>0)
		begin
			print '	';
		end
	end
	
	if(@generateModel=0 or @generateModel=2)
	begin
		--1:生成数据脚本
		--todo:未完 
		select @ident=status&0x80 from syscolumns where id=@objectid and status&0x80=0x80;
		if(@ident is not null)
		begin 
			print 'SET IDENTITY_INSERT ['+@tName+'] ON;';
		end

		set @column='';
		set @columndata='';
		declare syscolumns_cursor cursor
		local for select c.name,c.xtype from syscolumns c
		where c.id=@objectid order by c.colid;
		open syscolumns_cursor
		fetch next from syscolumns_cursor into @name,@xtype	
			while(@@fetch_status<>-1) 
			begin
				if(@@fetch_status <>-2)
				begin
					if(@xtype not in(189,34,35,99,98)) --timestamp不需处理，image,text,ntext,sql_variant 暂时不处理 
					begin 
						set @column=@column+(case when len(@column)=0 then '' else ',' end)+@name;			 
						set @columndata=@columndata+(case when len(@columndata)=0 then '' else ','','',' end) 
							+(case when @xtype in(167,175) then '''''''''+'+@name+'+''''''''' --varchar,char 
							when @xtype in(231,239) then '''N''''''+'+@name+'+''''''''' --nvarchar,nchar 
							when @xtype=61 then '''''''''+convert(char(23),'+@name+',121)+''''''''' --datetime 
							when @xtype=58 then '''''''''+convert(char(16),'+@name+',120)+''''''''' --smalldatetime 
							when @xtype=36 then '''''''''+convert(char(36),'+@name+')+''''''''' --uniqueidentifier 
							else @name end); 
					end
				end
				fetch next from syscolumns_cursor into @name,@xtype;
			end 
		close syscolumns_cursor;
		deallocate syscolumns_cursor;
		
		--set @sql='set nocount on;';
		set @sql='set nocount on select ''insert ['+@tName+']('+@column+') values(''as ''--'','+@columndata+','')'' from ['+@tName+']'; 
	 
	print '--'+@sql 
	--exec(@sql)
		 
		if(@ident is not null)
		begin
			print 'SET IDENTITY_INSERT ['+@tName+'] OFF;';
		end	
	end
END
GO
/****** Object:  StoredProcedure [dbo].[SQLCompareProcedure]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-12-20
-- Description:	比较两个数据库的存储过程定义是否一致
-- =============================================
CREATE Procedure [dbo].[SQLCompareProcedure]
(
    @DB1 nvarchar(512),
    @DB2 nvarchar(512),
    @Type char(2)='P',
    @ObjectName  nvarchar(512)=null
)
As
Begin
    /*
    参数说明
    
    @DB1            数据库名
    @DB2            数据库名
    @Type           对象类型,参照sys.objects中的type列描述
    @ObjectName     对象名称 
    */
    
    Set Nocount On
 
    If @DB1=@DB2
    Begin
        Raiserror 50001 N'@DB1,@DB2设置不能相同。'
        Return(1)
    End
 
    If db_id(@DB1) Is Null
    Begin
        Raiserror 50001 N'无效的数据库名,@DB1设置错误。'
        Return(1)
    End
 
    /*If db_id(@DB2) Is Null
    Begin
        Raiserror 50001 N'无效的数据库名,@DB2设置错误。'
        Return(1)
    End*/
    
    Set @Type=Isnull(@Type,' P');
    
    Declare @sql nvarchar(4000),
            @sql1 nvarchar(1000),
            @where nvarchar(1000);
 
    If (object_id('tempdb..#ObjectDefinition') Is Not Null)
    Begin
        Drop Table #ObjectDefinition;
    End
    
    Create Table #ObjectDefinition
    (
        dbname sysname,
        name sysname,
        type char(2),
        definition nvarchar(max)
    );
    
    Set @where=''
    If(@Type >'')
    Begin        
        Set @where=' And a.Type='''+@Type+'''';
    End
    
    If(@ObjectName >'')
    Begin
        Set @where=@where+' And a.name='''+@ObjectName+'''';
	End
    DECLARE @fsql NVARCHAR(4000)
    Set @sql=N'a.name,a.type,b.definition
        From dbfullname.sys.objects As a
        Inner Join dbfullname.sys.sql_modules As b On b.object_id=a.object_id
        Where a.is_ms_shipped=0  '+@where+' And
                Not Exists(Select 1 From dbfullname.sys.extended_properties Where major_id=a.object_id And minor_id=0 And class=1 And name = N''microsoft_database_tools_support'')';
    --Set @sql1='Use '+Quotename(@DB1)+'; Select dbname='''+@DB1+''',';
	Set @sql1='Select dbname='''+@DB1+''',';

	SET @fsql=REPLACE(@sql,'dbfullname',@DB1);
	--PRINT @sql1+@fsql;
    Insert Into #ObjectDefinition Exec(@sql1+@fsql);
    
    --Set @sql1='Use '+Quotename(@DB2)+'; Select dbname='''+@DB2+''',';
	Set @sql1='Select dbname='''+@DB2+''',';
	SET @fsql=REPLACE(@sql,'dbfullname',@DB2);
	--PRINT @sql1+@fsql;
    Insert Into #ObjectDefinition Exec(@sql1+@fsql);
	
    Exec(N';With t As
    (
        Select name,Type From (Select name,Type,Definition From #ObjectDefinition Where dbname='''+@DB1+'''    Except Select name,Type,Definition From #ObjectDefinition Where dbname='''+@DB2+''') As a
        Union All
        Select name,Type From (Select name,Type,Definition From #ObjectDefinition Where dbname='''+@DB2+'''    Except Select name,Type,Definition From #ObjectDefinition Where dbname='''+@DB1+''') As b
    )
    Select Distinct a.Name As [对象名称],a.Type as [类型],
            Case When b.Name Is Not Null Then ''√'' Else ''×'' End As ['+@DB1+'],
            Case When c.Name Is Not Null Then ''√'' Else ''×'' End As ['+@DB2+']
        From t As a
            Left Outer Join #ObjectDefinition As b On b.name=a.name And b.DBName='''+@DB1+'''
            Left Outer Join #ObjectDefinition As c On c.name=a.name And c.DBName='''+@DB2+'''
        Order By a.Type,a.Name
    ')

    Drop Table #ObjectDefinition;

End
GO
/****** Object:  StoredProcedure [dbo].[Rpt_PromotionSaleDetail]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--2015-10-22
/****** Object:  StoredProcedure [dbo].[Rpt_PromotionSaleDetail]    Script Date: 10/22/2015 18:05:26 ******/
-- =============================================
-- Author:		<linbl>
-- Create date: <2015-08-11>
-- Description:	<商品特价销售明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_PromotionSaleDetail]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @categorySn VARCHAR(300)='',
    @storeId VARCHAR(100)='',
    @supplierId VARCHAR(500)='',
    @sortField VARCHAR(20)=''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @Sql Nvarchar(Max);
        DECLARE @where NVARCHAR(2000);
        
        SET @Sql='
        with x as(SELECT *
               FROM     ( SELECT    b.SupplierId ,
                                    b.SupplierTitle ,
                                    b.BigCategoryTitle ,
                                    (b.BigCategoryTitle+''/''+b.MidCategoryTitle+''/''+b.SubCategoryTitle) CategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SubUnit ,
                                    SUM(a.PurchaseNumber*a.ActualPrice) SaleTotal,
									SUM(a.PurchaseNumber*a.BuyPrice) BuyTotal,
                                    ROUND(( SUM(a.SysPrice)/COUNT(1)),2) SysPrice ,
                                    ROUND(( SUM(a.ActualPrice)/COUNT(1)),2) DiscountPrice ,
                                    ROUND(( SUM(a.BuyPrice)/COUNT(1)),2) BuyPrice ,
                                    SUM(a.PurchaseNumber) PurchaseNumber ,
                                    s.StoreId ,
                                    dbo.F_StoreNameById(s.StoreId) StoreTitle ,
                                    b.BrandSN ,
                                    b.BrandTitle
			FROM    dbo.SaleDetail a
			LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
			INNER JOIN dbo.SaleOrders s ON s.PaySN=a.PaySN
        WHERE   1=1 AND b.SupplierTitle<>'''' AND a.ActualPrice>0 AND EXISTS(SELECT 1 FROM CommodityPromotion p
                                                              INNER JOIN dbo.CommodityDiscount d ON d.CommodityId = p.Id
                                                              AND p.State > 0 WHERE Barcode = a.Barcode)'
        
        SET @where='s.CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''''
                                
        IF(LEN(@storeId)>0 and @storeId IS not NULL)
        BEGIN
			SET @where=@where+' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=s.StoreId)'
        END
        IF(LEN(@supplierId)>0)
        BEGIN
			SET @where=@where+' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@supplierId+''','','',1) WHERE Value=b.supplierId)'
        END
        IF(LEN(@categorySn)>0)
        BEGIN
			SET @where=@where+' and b.CategorySN in('+@categorySn+')'
        END
        SET @sql=@sql+' and '+@where+' GROUP BY s.StoreId,dbo.F_StoreNameById(s.StoreId),b.SupplierId,b.SupplierTitle,b.BigCategoryTitle,b.MidCategoryTitle,b.SubCategoryTitle,b.BrandSN,b.BrandTitle,b.Barcode,b.Title,b.SubUnit) tb'+
			') SELECT  * ,
			(x.SaleTotal - x.BuyTotal ) MLE ,
                CASE WHEN x.SaleTotal = 0 THEN ''0''
                     ELSE CAST(CAST(( x.SaleTotal - x.BuyTotal )
                          / x.SaleTotal * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
            END + ''%'' MLL,
            CASE WHEN ( SELECT  SUM(x.SaleTotal)
                        FROM    x
                      ) <= 0 THEN ''0''
                 ELSE CAST(CAST(x.SaleTotal / ( SELECT  SUM(x.SaleTotal)
                                                FROM    x
                                              ) * 100 AS NUMERIC(7, 1)) AS VARCHAR(20))
            END + ''%'' ZB FROM    x'
        IF(LEN(@sortField)>0)
        BEGIN
			SET @sql=@sql+' order by '+@sortField
        END
        --PRINT @sql;
        EXEC(@sql);
    END
GO
/****** Object:  Table [dbo].[ReturnStageRules]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReturnStageRules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ReturnRuleId] [int] NOT NULL,
	[Project] [smallint] NOT NULL,
	[ReturnDT] [varchar](10) NULL,
	[State] [smallint] NOT NULL,
	[ReturnType] [smallint] NOT NULL,
	[Average] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_ReturnStageRules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返赠规则ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules', @level2type=N'COLUMN',@level2name=N'ReturnRuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送项目（233：积分；232：返现）来自字典' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules', @level2type=N'COLUMN',@level2name=N'Project'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返还时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules', @level2type=N'COLUMN',@level2name=N'ReturnDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0：生效；1：失效)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返还类型（0：按月返）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules', @level2type=N'COLUMN',@level2name=N'ReturnType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每期返金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules', @level2type=N'COLUMN',@level2name=N'Average'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分规则赠送分期管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnStageRules'
GO
/****** Object:  Table [dbo].[ReturnRules]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReturnRules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[MemberLevelId] [varchar](40) NOT NULL,
	[Adapters] [int] NOT NULL,
	[Number1] [money] NOT NULL,
	[LeftSign] [int] NOT NULL,
	[RightSign] [int] NULL,
	[Number2] [money] NULL,
	[Mode] [int] NOT NULL,
	[LimitItems] [varchar](4000) NULL,
	[OperationType] [smallint] NOT NULL,
	[Expression] [varchar](1000) NOT NULL,
	[GivenType] [smallint] NOT NULL,
	[ExpiryStart] [date] NOT NULL,
	[ExpiryEnd] [date] NULL,
	[State] [int] NOT NULL,
	[AgingType] [smallint] NULL,
	[StartTime1] [varchar](8) NULL,
	[EndTime1] [varchar](8) NULL,
	[StartTime2] [varchar](8) NULL,
	[EndTime2] [varchar](8) NULL,
	[StartTime3] [varchar](8) NULL,
	[EndTime3] [varchar](8) NULL,
	[LimitNum] [int] NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_ReturnRules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定会员等级id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'MemberLevelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适配器(来自字典)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'Adapters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'Number1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<,<=,=(来自字典)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'LeftSign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<=,<,=(来自字典)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'RightSign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数值2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'Number2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计量模式（eg:金额，次数。。）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'Mode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适配限定条件值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'LimitItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返赠运算方式(0：按固定值；1：按固定比例；2：动态配置)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'OperationType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返赠具体值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'Expression'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返赠类型(232:返现；233：返积分)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'GivenType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期-截止(空为永久)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'ExpiryEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动状态（0：为开始；1：活动中；2：已过期）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返赠时效类型（0：每天；1：周；2：时效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'AgingType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间段 1（' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'StartTime1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间段 1 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'EndTime1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间段 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'StartTime2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间段 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'EndTime2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间段 3 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'StartTime3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间段 3 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'EndTime3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返赠方案表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReturnRules'
GO
/****** Object:  Table [dbo].[RechargeGiftsStage]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RechargeGiftsStage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CardId] [varchar](40) NOT NULL,
	[RechargeSN] [varchar](40) NOT NULL,
	[RuleId] [varchar](40) NULL,
	[GiftProject] [smallint] NULL,
	[GiftValue] [money] NOT NULL,
	[GiftDate] [varchar](10) NULL,
	[State] [int] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_RechargeGiftsStage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号 GUID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'CardId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值流水号 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'RechargeSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送规则 GUID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'RuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送项目（1：金
额、2：积分） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'GiftProject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分值 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'GiftValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送日期 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'GiftDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送状态（0：未赠送；1：已赠送；2：已失效） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的充值赠送信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGiftsStage'
GO
/****** Object:  Table [dbo].[RechargeGifts]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RechargeGifts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[RuleId] [varchar](40) NULL,
	[State] [int] NOT NULL,
	[Stage] [int] NOT NULL,
	[GiftProject] [int] NOT NULL,
	[Category] [smallint] NOT NULL,
	[ConditionValue] [money] NULL,
	[GiftsValue] [money] NULL,
	[LimitNumber] [decimal](18, 0) NOT NULL,
	[StageNumber] [int] NULL,
	[StageAvg] [money] NULL,
	[ReturnDT] [varchar](10) NULL,
	[ExpiryStart] [varchar](10) NOT NULL,
	[ExpiryEnd] [varchar](10) NULL,
	[GiftAging] [smallint] NOT NULL,
	[GiftAgingValue] [nvarchar](50) NULL,
	[StartTime1] [varchar](8) NULL,
	[EndTime1] [varchar](8) NULL,
	[StartTime2] [varchar](8) NULL,
	[EndTime2] [varchar](8) NULL,
	[StartTime3] [varchar](8) NULL,
	[EndTime3] [varchar](8) NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_RechargeGifts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'RuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动状态（0：为开始；1：活动中；2：已过期）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分期（0:即时；1:分期） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'Stage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送项目（0：返现；1：返积分） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'GiftProject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送类型（0：充值，1：消费）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送条件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'ConditionValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限量（-1：不限） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'LimitNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总期数 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'StageNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每期返还 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'StageAvg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每期返还时间 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'ReturnDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期-截止(空为永久)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'ExpiryEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动时效（0：每天； 1：按周几； 2；按时间）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'GiftAging'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动时效具体时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'GiftAgingValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间段 1（' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'StartTime1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间段 1 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'EndTime1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间段 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'StartTime2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间段 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'EndTime2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间段 3 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'StartTime3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间段 3 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'EndTime3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的充值赠送信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RechargeGifts'
GO
/****** Object:  Table [dbo].[Receipts]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Receipts](
	[Id] [varchar](40) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [varchar](3) NULL,
	[CategoryId] [int] NOT NULL,
	[Number] [varchar](30) NOT NULL,
	[Amount] [money] NOT NULL,
	[Pages] [smallint] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Memo] [nvarchar](200) NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[State] [smallint] NOT NULL,
	[Source] [smallint] NOT NULL,
 CONSTRAINT [PK_RECEIPTS] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据ID（GUID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仓库/门店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据类别ID（来自数据字典表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'张数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'Pages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抬头' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交单人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交单日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:未提交、1:已审核、2:已结)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据来源（1:采购方、2:供应商）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有相关的财务单据凭证信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Receipts'
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [smallint] NULL,
	[MainId] [int] NULL,
	[ReadCode] [varchar](40) NULL,
 CONSTRAINT [PK_Reader] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型,1-公告,2-订单新审批,3-供应商新订单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reader', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表关联' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reader', @level2type=N'COLUMN',@level2name=N'MainId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已读人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reader', @level2type=N'COLUMN',@level2name=N'ReadCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录已读人员信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reader'
GO
/****** Object:  Table [dbo].[PushWithMember]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PushWithMember](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PushId] [varchar](40) NOT NULL,
	[MemberId] [varchar](40) NOT NULL,
	[State] [smallint] NOT NULL,
	[Channel] [smallint] NOT NULL,
 CONSTRAINT [PK_PushWithMember] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PushWithMember', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推送Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PushWithMember', @level2type=N'COLUMN',@level2name=N'PushId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PushWithMember', @level2type=N'COLUMN',@level2name=N'MemberId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态：0-待推送，1-成功，2-失败' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PushWithMember', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推送方式（字典取值：dicSN-152）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PushWithMember', @level2type=N'COLUMN',@level2name=N'Channel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员推送与会员关联表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PushWithMember'
GO
/****** Object:  Table [dbo].[Push]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Push](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PushId] [varchar](40) NOT NULL,
	[Content] [nvarchar](1000) NULL,
	[State] [smallint] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[Type] [varchar](2000) NULL,
 CONSTRAINT [PK_ActivityPush] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Push', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推送ID（GUID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Push', @level2type=N'COLUMN',@level2name=N'PushId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Push', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1、已推送 2、未推送）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Push', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Push', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Push', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推送方式，多个方式以逗号拼接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Push', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动推送
用于管理本系统的面向会员的促销活动推送信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Push'
GO
/****** Object:  Table [dbo].[PromotionBlendList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PromotionBlendList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommodityId] [varchar](40) NOT NULL,
	[BlendType] [smallint] NOT NULL,
	[BrandSN] [int] NOT NULL,
	[BarcodeOrCategorySN] [varchar](30) NOT NULL,
	[CategoryGrade] [smallint] NULL,
	[Number] [smallint] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_PromotionBlendList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlendList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlendList', @level2type=N'COLUMN',@level2name=N'CommodityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品分类（1:组合单品、2:组合系列、3:赠送单品、4:赠送系列、5:不参与促销单品、6:不参与促销系列）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlendList', @level2type=N'COLUMN',@level2name=N'BlendType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌（0：不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlendList', @level2type=N'COLUMN',@level2name=N'BrandSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码或系列ID（-1:没有 ，0: 不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlendList', @level2type=N'COLUMN',@level2name=N'BarcodeOrCategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别层级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlendList', @level2type=N'COLUMN',@level2name=N'CategoryGrade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠品数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlendList', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的商品随机组合促销活动信息和整单满元促销信息（主表：PromotionBlend）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlendList'
GO
/****** Object:  Table [dbo].[PromotionBlend]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PromotionBlend](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[RuleType] [smallint] NOT NULL,
	[CommodityId] [varchar](40) NOT NULL,
	[PromotionType] [smallint] NOT NULL,
	[FullNumber] [money] NOT NULL,
	[DiscountOrPrice] [money] NOT NULL,
	[PriceRange] [money] NULL,
	[AllowedAccumulate] [smallint] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_PromotionBlend] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlend', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规则类别（1:组合促销、2:满元促销）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlend', @level2type=N'COLUMN',@level2name=N'RuleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlend', @level2type=N'COLUMN',@level2name=N'CommodityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销形式（1:现金返回、2:代金券、3:折扣、4:加购按具体商品赠送、5:加购按单价范围赠送）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlend', @level2type=N'COLUMN',@level2name=N'PromotionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'满件数或满N元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlend', @level2type=N'COLUMN',@level2name=N'FullNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣或多少元' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlend', @level2type=N'COLUMN',@level2name=N'DiscountOrPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价范围（0:不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlend', @level2type=N'COLUMN',@level2name=N'PriceRange'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 允许累加赠送（0:不允许、1:允许）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlend', @level2type=N'COLUMN',@level2name=N'AllowedAccumulate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的商品随机组合促销活动信息和整单满元促销信息（主表：Bundling）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PromotionBlend'
GO
/****** Object:  Table [dbo].[ProductTradePriceList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductTradePriceList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TradePriceId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[BuyPrice] [money] NOT NULL,
	[SysPrice] [money] NOT NULL,
	[TradePrice] [money] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Memo] [varchar](300) NULL,
 CONSTRAINT [PK__ProductT__3214EC07119F9925] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批发价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePriceList', @level2type=N'COLUMN',@level2name=N'TradePrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期，开始' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePriceList', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期，结束' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePriceList', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批发价管理商品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePriceList'
GO
/****** Object:  Table [dbo].[ProductTradePrice]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductTradePrice](
	[Id] [varchar](40) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Wholesaler] [varchar](max) NOT NULL,
	[State] [smallint] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[AuditorUID] [varchar](40) NULL,
	[CreateDT] [datetime] NOT NULL,
	[AuditorDT] [datetime] NULL,
 CONSTRAINT [PK__ProductT__3214EC071758727B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批发价ID（GUID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePrice', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批发商，多个以逗号隔开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePrice', @level2type=N'COLUMN',@level2name=N'Wholesaler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0-未审批1-已审批2-已失效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePrice', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePrice', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePrice', @level2type=N'COLUMN',@level2name=N'AuditorUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePrice', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePrice', @level2type=N'COLUMN',@level2name=N'AuditorDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批发价管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductTradePrice'
GO
/****** Object:  Table [dbo].[ProductRecord]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ProductCode] [varchar](20) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Size] [nvarchar](50) NULL,
	[BoxBoard] [nvarchar](50) NULL,
	[BrandSN] [int] NULL,
	[SupplierId] [varchar](40) NOT NULL,
	[CityId] [int] NULL,
	[CategorySN] [int] NULL,
	[BigUnitId] [int] NULL,
	[SubUnitId] [int] NULL,
	[BuyPrice] [money] NOT NULL,
	[SysPrice] [money] NOT NULL,
	[TradePrice] [money] NULL,
	[JoinPrice] [money] NULL,
	[Nature] [smallint] NOT NULL,
	[OldBarcode] [varchar](30) NULL,
	[SaleNum] [money] NULL,
	[Favorable] [smallint] NOT NULL,
	[Expiry] [smallint] NOT NULL,
	[ExpiryUnit] [smallint] NOT NULL,
	[Factory] [nvarchar](50) NULL,
	[ValuationType] [smallint] NOT NULL,
	[IsReturnSale] [smallint] NOT NULL,
	[IsAcceptOrder] [smallint] NOT NULL,
	[RaterUID] [varchar](40) NULL,
	[InventoryWarning] [smallint] NULL,
	[ValidityWarning] [smallint] NULL,
	[State] [smallint] NOT NULL,
	[Barcodes] [varchar](150) NULL,
	[BarcodeMult] [varchar](1000) NULL,
	[StockRate] [money] NULL,
	[SaleRate] [money] NULL,
	[InventoryWarningMax] [smallint] NULL,
	[CreateDT] [datetime] NOT NULL,
	[IsRelationship] [bit] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_PRODUCTRECORD] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductRecord] UNIQUE CLUSTERED 
(
	[Barcode] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ProductRecord_Category] ON [dbo].[ProductRecord] 
(
	[CategorySN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'货号 （自动 生成， 全局唯一） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'ProductCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条形码（全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'Size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'箱规' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'BoxBoard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'BrandSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主供应商ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'SupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产地ID（来自城市ID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'CityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品类SN（大类）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'CategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计量大单位ID（来自数据字典表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'BigUnitId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计量小单位ID（来自数据字典表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'SubUnitId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'BuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'SysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批发价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'TradePrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加盟价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'JoinPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品性质（0:单品、1:组合、2:拆分）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'Nature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父条码 或子条码 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'OldBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可售数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'SaleNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前台优惠（1:允许调价、0:不允许调价)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'Favorable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保质期（0:不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'Expiry'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保质期单位（1:天、2:月、3:年）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'ExpiryUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产厂家' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'Factory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计价方式（1:计件、2:称重）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'ValuationType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退货标志（1:允许、0:不允许）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'IsReturnSale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订货标志（1:允许、0:不允许）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'IsAcceptOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'物价员（UID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'RaterUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存预警（下限数量）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'InventoryWarning'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保质期预警（天）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'ValidityWarning'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品状态（0:已下架、1:已上架）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一品多码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'Barcodes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多条码串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'BarcodeMult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进项税率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'StockRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售税率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'SaleRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存预警（上限数量）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'InventoryWarningMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建档时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发生业务关系(0:否,1:是)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord', @level2type=N'COLUMN',@level2name=N'IsRelationship'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有产品档案基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductRecord'
GO
/****** Object:  Table [dbo].[ProductMultSupplier]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductMultSupplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Barcode] [varchar](20) NOT NULL,
	[SupplierId] [varchar](40) NOT NULL,
	[BuyPrice] [money] NULL,
	[CompanyId] [int] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK__ProductM__3214EC0776818E95] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultSupplier', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultSupplier', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供应商' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultSupplier', @level2type=N'COLUMN',@level2name=N'SupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultSupplier', @level2type=N'COLUMN',@level2name=N'BuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的一品多商信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultSupplier'
GO
/****** Object:  Table [dbo].[ProductMultPrice]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductMultPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[Price] [money] NOT NULL,
	[SupplierId] [varchar](40) NULL,
	[BuyPrice] [money] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProductMultPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultPrice', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultPrice', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultPrice', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultPrice', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供应商ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultPrice', @level2type=N'COLUMN',@level2name=N'SupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultPrice', @level2type=N'COLUMN',@level2name=N'BuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的一品多价信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductMultPrice'
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[ProductCode] [varchar](30) NULL,
	[ImagePath] [varchar](500) NULL,
	[Status] [bit] NULL,
	[CreateDT] [datetime] NULL,
	[CreateUID] [varchar](40) NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductImage', @level2type=N'COLUMN',@level2name=N'ImagePath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态  1-当前使用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductImage', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品档案图像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductImage'
GO
/****** Object:  Table [dbo].[ProductGroup]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[GroupBarcode] [varchar](30) NOT NULL,
	[Number] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProductGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对应新条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组合条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'GroupBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组合数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的商品组合信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductGroup'
GO
/****** Object:  Table [dbo].[ProductChangePriceList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductChangePriceList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChangePriceId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[OldBuyPrice] [money] NOT NULL,
	[CurBuyPrice] [money] NOT NULL,
	[OldSysPrice] [money] NOT NULL,
	[CurSysPrice] [money] NOT NULL,
	[OldGrossprofitRate] [money] NOT NULL,
	[CurGrossprofitRate] [money] NOT NULL,
	[StartDate] [varchar](10) NOT NULL,
	[EndDate] [varchar](10) NULL,
	[Memo] [varchar](300) NULL,
	[State] [smallint] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProductChangePriceList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品变价ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'ChangePriceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'OldBuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'CurBuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'OldSysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'CurSysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原毛利率（%）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'OldGrossprofitRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现毛利率（%）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'CurGrossprofitRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期（Dates）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0:无效、 1:有效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的产品变价明细信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePriceList'
GO
/****** Object:  Table [dbo].[ProductChangePrice]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductChangePrice](
	[Id] [varchar](40) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[SupplierId] [varchar](40) NOT NULL,
	[StoreId] [varchar](300) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[AuditorDT] [datetime] NULL,
	[AuditorUID] [varchar](40) NULL,
	[State] [smallint] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK__ProductC__3214EC0726BAB19C] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePrice', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供应商' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePrice', @level2type=N'COLUMN',@level2name=N'SupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调价门店，多个以逗号隔开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePrice', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePrice', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePrice', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePrice', @level2type=N'COLUMN',@level2name=N'AuditorDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePrice', @level2type=N'COLUMN',@level2name=N'AuditorUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0-未审批1-已审批2-已过期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePrice', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统产品变价信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductChangePrice'
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CategorySN] [int] NOT NULL,
	[CategoryPSN] [int] NOT NULL,
	[Grade] [smallint] NOT NULL,
	[CategoryCode] [smallint] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[OrderNum] [int] NULL,
	[State] [smallint] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_PRODUCTCATEGORY] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号（全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'CategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级分类SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'CategoryPSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类层级（1:顶级、2：二级、3:三级、4:四级）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'Grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类代码 （最大 99，同一级分类下唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'CategoryCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:禁用、1:可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有相关的附件基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategory'
GO
/****** Object:  Table [dbo].[ProductBrand]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductBrand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ClassifyId] [int] NOT NULL,
	[BrandSN] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[JianPin] [varchar](20) NULL,
	[State] [smallint] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_PRODUCTBRAND] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductBrand', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌分类ID（来自数据字典表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductBrand', @level2type=N'COLUMN',@level2name=N'ClassifyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌编号（全局唯一)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductBrand', @level2type=N'COLUMN',@level2name=N'BrandSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductBrand', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌简拼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductBrand', @level2type=N'COLUMN',@level2name=N'JianPin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:禁用、1:可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductBrand', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的产品档案所附属的品牌信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductBrand'
GO
/****** Object:  UserDefinedFunction [dbo].[SplitString]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-02
-- Description:	根据字符串拆分字符串为表
-- =============================================
CREATE function [dbo].[SplitString] 
( 
@Input nvarchar(max), --input string to be separated 
@Separator nvarchar(max)=',', --a string that delimit the substrings in the input string 
@RemoveEmptyEntries bit=1 --the return value does not include array elements that contain an empty string 
) 
returns @TABLE table 
( 
	[Id] int identity(1,1), 
	[Value] nvarchar(max) 
) 
as 
begin 
	declare @Index int, @Entry nvarchar(max) 
	set @Index = charindex(@Separator,@Input) 
	
	while (@Index>0) 
	begin 
		set @Entry=ltrim(rtrim(substring(@Input, 1, @Index-1))) 
		if (@RemoveEmptyEntries=0) or (@RemoveEmptyEntries=1 and @Entry<>'') 
		begin 
			insert into @TABLE([Value]) Values(@Entry) 
		end 
		set @Input = substring(@Input, @Index+datalength(@Separator)/2, len(@Input)) 
		set @Index = charindex(@Separator, @Input) 
	end
	 
	set @Entry=ltrim(rtrim(@Input)) 
	if (@RemoveEmptyEntries=0) or (@RemoveEmptyEntries=1 and @Entry<>'') 
	begin 
		insert into @TABLE([Value]) Values(@Entry) 
	end 
	return 
end
GO
/****** Object:  Table [dbo].[ScaleSettings]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScaleSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SN] [varchar](10) NULL,
	[CompanyId] [int] NOT NULL,
	[Store] [nchar](10) NULL,
	[Title] [nvarchar](40) NOT NULL,
	[TypeSN] [nvarchar](40) NOT NULL,
	[ModelSN] [nvarchar](40) NOT NULL,
	[KeyCount] [int] NOT NULL,
	[PageModel] [smallint] NULL,
	[IpAddress] [varchar](20) NOT NULL,
	[Port] [varchar](10) NULL,
	[CreateDt] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_ScaleSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'秤名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleSettings', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备类型（来自字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleSettings', @level2type=N'COLUMN',@level2name=N'TypeSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号（来自字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleSettings', @level2type=N'COLUMN',@level2name=N'ModelSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'按键个数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleSettings', @level2type=N'COLUMN',@level2name=N'KeyCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分页模式（单，双页）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleSettings', @level2type=N'COLUMN',@level2name=N'PageModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'局域网ip地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleSettings', @level2type=N'COLUMN',@level2name=N'IpAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleSettings', @level2type=N'COLUMN',@level2name=N'Port'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleSettings', @level2type=N'COLUMN',@level2name=N'CreateDt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleSettings', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
/****** Object:  Table [dbo].[ScaleHistory]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScaleHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Store] [nchar](10) NULL,
	[BatchSN] [varchar](20) NOT NULL,
	[Barcode] [varchar](20) NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SysPrice] [money] NOT NULL,
	[SubUnitId] [int] NULL,
	[CreateDt] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_ScaleHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleHistory', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleHistory', @level2type=N'COLUMN',@level2name=N'SysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计量小单位ID（来自数据字典表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ScaleHistory', @level2type=N'COLUMN',@level2name=N'SubUnitId'
GO
/****** Object:  Table [dbo].[SalesReturnsDetailed]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesReturnsDetailed](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReturnId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[ReceiptsNumber] [varchar](30) NOT NULL,
	[Number] [money] NOT NULL,
	[Price] [money] NOT NULL,
	[TradingPrice] [money] NOT NULL,
 CONSTRAINT [PK_SalesReturnsDetailed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturnsDetailed', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换货ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturnsDetailed', @level2type=N'COLUMN',@level2name=N'ReturnId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturnsDetailed', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'票据单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturnsDetailed', @level2type=N'COLUMN',@level2name=N'ReceiptsNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturnsDetailed', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturnsDetailed', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实销价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturnsDetailed', @level2type=N'COLUMN',@level2name=N'TradingPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有门店的商品售后退换明细信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturnsDetailed'
GO
/****** Object:  Table [dbo].[SalesReturns]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesReturns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ReturnType] [smallint] NOT NULL,
	[ReturnId] [varchar](40) NOT NULL,
	[NewPaySN] [varchar](50) NULL,
	[StoreId] [varchar](3) NOT NULL,
	[ReasonId] [int] NOT NULL,
	[ReturnPrice] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[State] [smallint] NOT NULL,
	[MachineSN] [nvarchar](20) NULL,
	[Source] [int] NOT NULL,
 CONSTRAINT [PK_SALESRETURNS] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换方式（0:退货、1:换货、2、整单退出、3、修改订单）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'ReturnType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换货ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'ReturnId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新单据号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'NewPaySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换理由ID（来自数据字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'ReasonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'差价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'ReturnPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经办人UID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态：1、处理中（网购预留）；2、已完成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POS机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'MachineSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源（0:POS,1:SERVER）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有门店的商品售后退换信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesReturns'
GO
/****** Object:  Table [dbo].[SalesRecord]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[MarketingId] [varchar](40) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[Number] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_SalesRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesRecord', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesRecord', @level2type=N'COLUMN',@level2name=N'MarketingId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesRecord', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'剩余销售数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesRecord', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期（Date）（每日限购不能为空）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesRecord', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的促销活动量信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesRecord'
GO
/****** Object:  Table [dbo].[SaleOrders]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[MachineSN] [varchar](20) NOT NULL,
	[PaySN] [varchar](50) NOT NULL,
	[CustomOrderSn] [varchar](50) NULL,
	[ReFundOrderCustomOrderSn] [varchar](50) NULL,
	[ProductCount] [money] NULL,
	[TotalAmount] [money] NOT NULL,
	[OrderDiscount] [money] NOT NULL,
	[PreferentialPrice] [money] NOT NULL,
	[ApiCode] [nvarchar](100) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[ReturnDT] [datetime] NULL,
	[Salesman] [varchar](40) NULL,
	[Memo] [nvarchar](200) NULL,
	[MemberId] [varchar](40) NULL,
	[Type] [smallint] NOT NULL,
	[State] [int] NULL,
	[ReturnId] [nvarchar](4000) NULL,
	[ReturnOrderUID] [varchar](40) NULL,
	[ActivityId] [int] NOT NULL,
	[Receive] [money] NULL,
	[IsTest] [bit] NOT NULL,
	[InInventory] [smallint] NOT NULL,
	[IsProcess] [bit] NOT NULL,
	[Reason] [int] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_SALEORDERS] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POS机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'MachineSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号（全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'PaySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户自定义流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'CustomOrderSn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退单原单流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'ReFundOrderCustomOrderSn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额合计（优惠后)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'TotalAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手动整单折扣金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'OrderDiscount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠合计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'PreferentialPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式ID（多个ID以,号间隔）没有支付为-1；' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'ApiCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收银员UID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退单日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'ReturnDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导购员UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'Salesman'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'MemberId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账单类型(0：正常销售；1：换货；2：退货,3:退单) 默认值：0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（默认：0，0：正常，1：退整单）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抹零后收款金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'Receive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:正常数据;1:练习模式数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'IsTest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单库存状态（0：未处理，1、已处理销售单（包含销售、退货、换货新生成的订单）、2、已退单处理）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'InInventory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录是否已处理（0:未处理，1：已处理）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders', @level2type=N'COLUMN',@level2name=N'IsProcess'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有商品销售单信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrders'
GO
/****** Object:  Table [dbo].[SaleOrderHistory]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleOrderHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReturnId] [varchar](40) NOT NULL,
	[PaySN] [varchar](30) NOT NULL,
	[PreviousTotalAmount] [money] NOT NULL,
	[PreviousPreferentialPrice] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_SaleOrderHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrderHistory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrderHistory', @level2type=N'COLUMN',@level2name=N'ReturnId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售订单流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrderHistory', @level2type=N'COLUMN',@level2name=N'PaySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原金额合计（优惠后）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrderHistory', @level2type=N'COLUMN',@level2name=N'PreviousTotalAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原优惠合计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrderHistory', @level2type=N'COLUMN',@level2name=N'PreviousPreferentialPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrderHistory', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrderHistory', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售订单(修改)历史
目前只记录Server端的修改订单操作历史' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleOrderHistory'
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupons](
	[Id] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BatchSN] [varchar](40) NOT NULL,
	[CouponSN] [varchar](40) NOT NULL,
	[CouponType] [smallint] NOT NULL,
	[StoreId] [int] NULL,
	[UsedUser] [varchar](40) NULL,
	[UsedDate] [datetime] NULL,
	[State] [smallint] NOT NULL,
	[ExpiryStart] [varchar](10) NOT NULL,
	[ExpiryEnd] [varchar](10) NULL,
	[Distribute] [varchar](40) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制卡批次 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'BatchSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'CouponSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'券类别 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'CouponType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券来源（从哪个门店领取， -1 为其他） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用人,如会员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'UsedUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领用时间 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'UsedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1：未使用；2：已使用；3 已作废）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期-截止(空为永久)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'ExpiryEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'派发员 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons', @level2type=N'COLUMN',@level2name=N'Distribute'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有优惠券信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Coupons'
GO
/****** Object:  Table [dbo].[CouponCardDetail]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CouponCardDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BatchSN] [varchar](40) NOT NULL,
	[TicketNo] [varchar](40) NOT NULL,
	[SecurityCode] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[State] [smallint] NOT NULL,
	[ReceiveDT] [datetime] NULL,
	[Recipients] [varchar](40) NULL,
	[Source] [varchar](3) NULL,
	[UseDT] [datetime] NULL,
	[UsePerson] [varchar](40) NULL,
 CONSTRAINT [PK_GenerateCoupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CouponApplyDetails]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CouponApplyDetails](
	[Id] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[MakingCouponCardId] [int] NOT NULL,
	[ProductType] [smallint] NOT NULL,
	[Product] [varchar](max) NULL,
 CONSTRAINT [PK_CouponApplyDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponApplyDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponApplyDetails', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券制作 id ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponApplyDetails', @level2type=N'COLUMN',@level2name=N'MakingCouponCardId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用商品类型 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponApplyDetails', @level2type=N'COLUMN',@level2name=N'ProductType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有优惠券适用范围信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CouponApplyDetails'
GO
/****** Object:  Table [dbo].[ContractBoth]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContractBoth](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContractId] [varchar](40) NOT NULL,
	[Signatory] [smallint] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Representative] [nvarchar](20) NOT NULL,
	[Tel] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[TaxNumber] [varchar](20) NULL,
	[Url] [nvarchar](200) NULL,
	[Address] [nvarchar](100) NULL,
	[PostCode] [varchar](6) NULL,
	[PayNumber] [varchar](20) NULL,
	[BankName] [nvarchar](50) NULL,
	[BankAccount] [nvarchar](20) NULL,
 CONSTRAINT [PK_ContractBoth] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主合同 ID（来自Contract 表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'ContractId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签约方（ 1:甲方、2:乙方、 3:丙方、4：丁方）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'Signatory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签约代表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'Representative'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'传真' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'税号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'TaxNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'PostCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付行号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'PayNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开户银行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'BankName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'银行账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth', @level2type=N'COLUMN',@level2name=N'BankAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同双方信息
用于管理本系统的各类合同签约双方基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContractBoth'
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contract](
	[Id] [varchar](40) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[SupplierId] [varchar](40) NULL,
	[ClassifyId] [int] NOT NULL,
	[ContractSN] [nvarchar](20) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[PId] [varchar](40) NULL,
	[Version] [smallint] NOT NULL,
	[SigningDate] [varchar](10) NULL,
	[StartDate] [varchar](10) NULL,
	[EndDate] [varchar](10) NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[State] [smallint] NOT NULL,
 CONSTRAINT [PK_CONTRACT] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同 ID （GUID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商家ID( GUID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'SupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同分类（ -1:未知）（来自数据字典表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'ClassifyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'ContractSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父合同编号（为空表示新签，非空表示续签）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'PId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本(自动生成)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'Version'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签订日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'SigningDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生效日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人（ UID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同状态（0：未提交、1：待审批、2：已审批、3：已中止、4：已结束）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同信息表
用于管理本系统的各类合同基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Contract'
GO
/****** Object:  Table [dbo].[ConsumptionPayment]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConsumptionPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PaySN] [varchar](50) NOT NULL,
	[ApiCode] [int] NOT NULL,
	[ApiOrderSN] [varchar](50) NULL,
	[Amount] [money] NOT NULL,
	[Memo] [nvarchar](200) NULL,
	[State] [smallint] NOT NULL,
	[CardNo] [varchar](50) NULL,
	[Change] [money] NOT NULL,
	[Received] [money] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_CONSUMPTIONPAYMENT] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'PaySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'ApiCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易单号（由支付宝或微信或银联返回）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'ApiOrderSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实收金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付状态（0：未支付、1：已支付）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'CardNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'找零' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'Change'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客付金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment', @level2type=N'COLUMN',@level2name=N'Received'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消费支付方式
用于管理本系统的所有商品销售结算方式信息（主表：SaleOrders）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsumptionPayment'
GO
/****** Object:  Table [dbo].[CommodityReturnsDetail]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommodityReturnsDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReturnId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[ReturnNum] [money] NOT NULL,
	[SysPrice] [money] NOT NULL,
	[ReasonId] [int] NULL,
	[Memo] [nvarchar](200) NULL,
	[State] [smallint] NOT NULL,
	[BuyPrice] [money] NULL,
 CONSTRAINT [PK_CommodityReturnsDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退货单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail', @level2type=N'COLUMN',@level2name=N'ReturnId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退货数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail', @level2type=N'COLUMN',@level2name=N'ReturnNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail', @level2type=N'COLUMN',@level2name=N'SysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换理由ID（来自数据字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail', @level2type=N'COLUMN',@level2name=N'ReasonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0:未处理、1:处理中、 2:已处理）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail', @level2type=N'COLUMN',@level2name=N'BuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存退货明细信息
用于管理本系统的库存退货详细信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturnsDetail'
GO
/****** Object:  Table [dbo].[CommodityReturns]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommodityReturns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ReturnId] [varchar](40) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[State] [smallint] NOT NULL,
	[SupplierID] [varchar](40) NULL,
	[VerifyTime] [datetime] NULL,
 CONSTRAINT [PK_CommodityReturns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturns', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退货单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturns', @level2type=N'COLUMN',@level2name=N'ReturnId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出货仓ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturns', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经办人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturns', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登记时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturns', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0:未处理、1:处理中、 2:已处理）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturns', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退货供应商ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturns', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturns', @level2type=N'COLUMN',@level2name=N'VerifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存退货信息
用于管理本系统的库存退货信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityReturns'
GO
/****** Object:  Table [dbo].[CommodityPromotion]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommodityPromotion](
	[Id] [varchar](40) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [nvarchar](2000) NOT NULL,
	[CustomerObj] [smallint] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Timeliness] [smallint] NOT NULL,
	[StartAging1] [varchar](5) NULL,
	[EndAging1] [varchar](5) NULL,
	[StartAging2] [varchar](5) NULL,
	[EndAging2] [varchar](5) NULL,
	[StartAging3] [varchar](5) NULL,
	[EndAging3] [varchar](5) NULL,
	[PromotionType] [smallint] NOT NULL,
	[RestrictionBuyNum] [smallint] NULL,
	[State] [smallint] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_COMMODITYPROMOTION] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销ID(GUID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店 ID（多个 ID 以,号间隔）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用客户群（ 0:不限、 1:内部、2:VIP）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'CustomerObj'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动起始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动时效（ 0:不限、 1:指定时效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'Timeliness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时效 1（开始）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'StartAging1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时效 1（结束）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'EndAging1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时效 2（开始）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'StartAging2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时效 2（结束）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'EndAging2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时效 3（开始）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'StartAging3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时效 3（结束）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'EndAging3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销方式（ 1:单品折扣、 2:捆绑促销、 3:组合促销、4:买赠促销、 5:满元促销）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'PromotionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每天限购次数（ 0:不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'RestrictionBuyNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动状态（ 0:未开始、 1:活动中、 2:已过期）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品促销
用于管理本系统的所有商品促销信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityPromotion'
GO
/****** Object:  Table [dbo].[CommodityDiscount]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommodityDiscount](
	[Id] [int] IDENTITY(18,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CommodityId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NULL,
	[CategorySN] [int] NULL,
	[DiscountRate] [money] NULL,
	[DiscountPrice] [money] NULL,
	[MinPurchaseNum] [money] NOT NULL,
	[Way] [smallint] NULL,
	[CategoryGrade] [smallint] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_CommodityDiscount_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityDiscount', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityDiscount', @level2type=N'COLUMN',@level2name=N'CommodityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityDiscount', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品系列ID（-1:没有 ，0: 不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityDiscount', @level2type=N'COLUMN',@level2name=N'CategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣 （0-10 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityDiscount', @level2type=N'COLUMN',@level2name=N'DiscountRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折后价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityDiscount', @level2type=N'COLUMN',@level2name=N'DiscountPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'起购量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityDiscount', @level2type=N'COLUMN',@level2name=N'MinPurchaseNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣方式（ 1: 按固定量、 2:按起购量） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityDiscount', @level2type=N'COLUMN',@level2name=N'Way'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单品折扣
用于管理本系统的商品折扣信息（主表： CommodityPromotion）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CommodityDiscount'
GO
/****** Object:  Table [dbo].[Commodity]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Commodity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [varchar](3) NULL,
	[Barcode] [varchar](30) NOT NULL,
	[ProducedDate] [varchar](10) NULL,
	[ExpiryDate] [smallint] NULL,
	[ExpiryDateUnit] [smallint] NULL,
	[ExpirationDate] [varchar](10) NULL,
	[ProductionBatch] [varchar](30) NULL,
	[DistributionBatch] [varchar](30) NULL,
	[StockNumber] [money] NOT NULL,
	[Nature] [smallint] NOT NULL,
 CONSTRAINT [PK_COMMODITY] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'ProducedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期（天数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'ExpiryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期单位（ 1:天、2:月、 3:年）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'ExpiryDateUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'截止保质日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'ExpirationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'ProductionBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'DistributionBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在库数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'StockNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-单品1－赠品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity', @level2type=N'COLUMN',@level2name=N'Nature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品库信息
用于管理本系统的所有在库商品信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Commodity'
GO
/****** Object:  StoredProcedure [dbo].[Comm_PageList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-07-31
-- Description:	公共存储过程分页
-- e.g.：
-- EXEC	Comm_PageList 'SELECT (ROW_NUMBER() OVER ( ORDER BY [CreateDT] DESC)) AS RSNO,* FROM dbo.SysLog '
--				  ,1
--				  ,10;
-- =============================================
CREATE PROCEDURE [dbo].[Comm_PageList]
	@SqlStr			Nvarchar(max),	--SQL拼接字符串
	@CurrentPage	Int,			--当前页	@PageSize		Int				--页大小
AS
BEGIN
	SET NOCOUNT ON;
	
	--@SqlStr 规则
	--语法固定：SELECT (ROW_NUMBER() OVER ( ORDER BY [排序列名] DESC)) AS RSNO,
	--语法传参： * FROM dbo.[表名] Where 条件
	--
	
	DECLARE @Sql Nvarchar(Max);
	SET @Sql='	DECLARE @CurrentPage INT; DECLARE @PageSize INT;	SET @CurrentPage='+CAST(@CurrentPage AS Varchar)+';	SET @PageSize='+CAST(@PageSize AS Varchar)+';	DECLARE @RecordStart INT;DECLARE @RecordEnd INT;	IF(@CurrentPage<=1)		
	BEGIN		SET @RecordStart=1;		SET @RecordEnd=@PageSize;	END	ELSE	BEGIN		SET @RecordStart=((@CurrentPage-1)*@PageSize)+1;		SET @RecordEnd=@CurrentPage*@PageSize;	END	
	;WITH RecordList AS 
	(		'+@SqlStr+'
	), RecordPage AS (
		SELECT MAX(RSNO) AS [RecordTotal]
				,(CASE WHEN @CurrentPage>Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN (Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)-1)*@PageSize+1
					   ELSE @RecordStart END
				  ) AS [RecordStart]
				,(CASE WHEN @CurrentPage>(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)*@PageSize
					   ELSE @RecordEnd END
				  ) AS [RecordEnd]
		FROM RecordList
	) SELECT *
	FROM RecordList AS RL, RecordPage AS RP	WHERE (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd);';
	--PRINT @Sql
	EXEC(@Sql);
	
END
GO
/****** Object:  UserDefinedFunction [dbo].[Comm_F_NumIsInGroup]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================================
-- 作者：蔡少发
-- 时间：2015-08-29
-- 描述：判断一个数字是否在一个数字组字符串中，多个数字以','分隔，如'7,12,2'
-- =========================================================================

CREATE FUNCTION [dbo].[Comm_F_NumIsInGroup]
(
	@Num nvarchar(50),		--要判断的数字
	@GroupStr NVARCHAR(max)    --数字组字符串
)
RETURNS CHAR(1)
AS
BEGIN
	SET @Num=RTRIM(LTRIM(@Num));
	
	--去掉首尾逗号
	IF(CHARINDEX(',',@GroupStr)=1)
	BEGIN
		SET @GroupStr=SUBSTRING(@GroupStr,2,LEN(@GroupStr)-0);
	END
	IF(SUBSTRING(@GroupStr,LEN(@GroupStr),1)=',')
	BEGIN
		SET @GroupStr=SUBSTRING(@GroupStr,1,LEN(@GroupStr)-1);
	END
	
	DECLARE @ReturnStr CHAR(1);
	SET @ReturnStr='0';
	
	IF(LEN(@GroupStr)>0)
		BEGIN
			
			DECLARE @i INT;
			SET @i = CHARINDEX(',',@GroupStr);
			
			DECLARE @GroupNum Nvarchar(max) ;
			SET @GroupNum = 0;
			
			WHILE(@i>0)
				BEGIN
					SET @GroupNum = LEFT(@GroupStr,@i-1);
					
					IF(@Num=@GroupNum)
						BEGIN
							SET @ReturnStr = '1';
							
							--将@GroupStr置为'0'，免得最后转换成整数时报错
							SET @GroupStr = '0';
							
							BREAK;
						END	
					ELSE
						BEGIN
							SET @GroupStr = SUBSTRING(@GroupStr,@i+1,LEN(@GroupStr)-@i);
							SET @i = CHARINDEX(',',@GroupStr);
						END
				END	
			
			IF(@Num=RTRIM(@GroupStr))
				BEGIN
					SET @ReturnStr = '1';
				END		
		END

	RETURN @ReturnStr;	
END
GO
/****** Object:  Table [dbo].[ChangePriceLog]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChangePriceLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[OperType] [smallint] NOT NULL,
	[BusinessType] [smallint] NULL,
	[BatchNo] [varchar](30) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[OldPrice] [money] NOT NULL,
	[NewPrice] [money] NOT NULL,
	[StoreId] [varchar](3) NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_ChangePriceLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型(1.增2.删3.改)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'OperType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'业务类型:1.批发价,2-进价,3-加盟,4-售价,5-一品多价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'BusinessType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'BatchNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'旧售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'OldPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'NewPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调价日志
用于管理本系统的调价日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChangePriceLog'
GO
/****** Object:  Table [dbo].[CardInfo]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CardInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CardTypeId] [varchar](40) NOT NULL,
	[CardName] [nvarchar](20) NOT NULL,
	[CardType] [varchar](20) NOT NULL,
	[Category] [smallint] NULL,
	[MinRecharge] [money] NOT NULL,
	[DefaultPrice] [money] NULL,
	[DefaultIntegr] [int] NOT NULL,
	[Memo] [varchar](200) NULL,
	[State] [smallint] NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CardInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡片类型 GUID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'CardTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡类型（1：充值卡、2:折扣卡） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'CardName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡类型（1：储蓄卡，2：卡）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'CardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'种类(1：电子卡；2：磁卡； 3：IC 卡)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最低充值金额 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'MinRecharge'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'初始金额 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'DefaultPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'初始积分 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'DefaultIntegr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0:可用, 1:
注销) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的优惠卡片信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardInfo'
GO
/****** Object:  Table [dbo].[BundlingList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BundlingList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommodityId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[Number] [money] NOT NULL,
	[SysPrice] [money] NULL,
	[BuyPrice] [money] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_BundlingList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BundlingList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BundlingList', @level2type=N'COLUMN',@level2name=N'CommodityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BundlingList', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每捆数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BundlingList', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'捆绑销售清单
用于管理本系统的商品捆绑促销清单信息（主表： Bundling）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BundlingList'
GO
/****** Object:  Table [dbo].[Bundling]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bundling](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CommodityId] [varchar](40) NOT NULL,
	[NewBarcode] [varchar](30) NULL,
	[Title] [varchar](50) NULL,
	[BundledPrice] [money] NOT NULL,
	[TotalBundled] [int] NOT NULL,
	[SysPrices] [money] NOT NULL,
	[BuyPrices] [money] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Bundling] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bundling', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bundling', @level2type=N'COLUMN',@level2name=N'CommodityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新捆绑条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bundling', @level2type=N'COLUMN',@level2name=N'NewBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新品名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bundling', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'捆绑价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bundling', @level2type=N'COLUMN',@level2name=N'BundledPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总捆数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bundling', @level2type=N'COLUMN',@level2name=N'TotalBundled'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'售价合计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bundling', @level2type=N'COLUMN',@level2name=N'SysPrices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进价合计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bundling', @level2type=N'COLUMN',@level2name=N'BuyPrices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'捆绑销售
用于管理本系统的商品捆绑促销活动信息（主表： CommodityPromotion）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bundling'
GO
/****** Object:  Table [dbo].[BreakageList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BreakageList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BreakageGoodsId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[BreakageNumber] [money] NOT NULL,
	[BreakagePrice] [money] NOT NULL,
	[State] [smallint] NOT NULL,
 CONSTRAINT [PK_BreakageList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报损单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageList', @level2type=N'COLUMN',@level2name=N'BreakageGoodsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageList', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报损数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageList', @level2type=N'COLUMN',@level2name=N'BreakageNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报损价（出库价或入库价）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageList', @level2type=N'COLUMN',@level2name=N'BreakagePrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0:未审核、 1:已审核）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageList', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报损明细信息
用于管理本系统的所有货品报损的明细信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageList'
GO
/****** Object:  Table [dbo].[BreakageGoods]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BreakageGoods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BreakageGoodsId] [varchar](40) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[OperatorUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[BreakageType] [smallint] NOT NULL,
	[Receipt] [varchar](40) NULL,
	[Memo] [varchar](200) NULL,
	[State] [smallint] NOT NULL,
	[VerifyTime] [datetime] NULL,
 CONSTRAINT [PK_BreakageGoods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报损单ID(GUID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods', @level2type=N'COLUMN',@level2name=N'BreakageGoodsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报损门店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经办人 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods', @level2type=N'COLUMN',@level2name=N'OperatorUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报损类别（ 0:出库、 1:入库）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods', @level2type=N'COLUMN',@level2name=N'BreakageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原始单据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods', @level2type=N'COLUMN',@level2name=N'Receipt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0:未审核、 1:已审核）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods', @level2type=N'COLUMN',@level2name=N'VerifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报损单信息
用于管理本系统的所有货品报损基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BreakageGoods'
GO
/****** Object:  UserDefinedFunction [dbo].[F_NumberAutoStr]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: <2015-10-06>
-- Description:	<自动截取到小数位>
-- =============================================
CREATE FUNCTION [dbo].[F_NumberAutoStr]
(
	@num money
)
RETURNS VARCHAR(20)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result VARCHAR(20),@digit VARCHAR(20),@idx int
	SET @result=CAST(CAST(@num AS DECIMAL(10,3)) AS VARCHAR(20))
	SET @idx= CHARINDEX('.',@result)
	SET @digit= SUBSTRING(@result,@idx+1,LEN(@result))
	IF(CAST(@digit AS money) >0)
		RETURN @result;
	RETURN SUBSTRING(@result,0,@idx)

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_TrimStrMore]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[F_TrimStrMore]
(
@str nVARCHAR(1000),
@len int=50
)
RETURNS nvarchar(100)
AS
BEGIN
IF(LEN(@str)>@len)
BEGIN
	RETURN SUBSTRING(@str,0,@len)+'...'
END
RETURN @str
END
GO
/****** Object:  Table [dbo].[OMS_CompanyAuthorize]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OMS_CompanyAuthorize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NULL,
	[State] [smallint] NULL,
	[Category] [smallint] NULL,
	[Title] [varchar](50) NULL,
	[FullTitle] [varchar](200) NULL,
	[LinkMan] [varchar](30) NULL,
	[Phone] [varchar](30) NULL,
	[UserNum] [smallint] NULL,
	[StoreNum] [smallint] NULL,
	[StoreProper] [char](1) NULL,
	[AppProper] [char](1) NULL,
	[PosMinorDisp] [char](1) NULL,
	[SupplierProper] [char](1) NULL,
	[WholesalerProper] [char](1) NULL,
	[CreateDT] [datetime] NULL,
	[EffectiveDT] [date] NULL,
	[ValidityYear] [smallint] NULL,
	[Useable] [char](1) NULL,
	[MachineSN] [varchar](50) NULL,
	[SerialNo] [nvarchar](1000) NULL,
	[AreaCode] [nchar](10) NULL,
 CONSTRAINT [PK_OMS_CompanyAuthorize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核状态(0-未审、1-已审、2-注销)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别(1-在线/2-独立)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位简称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位全称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'FullTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'UserNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'StoreNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分店专属后台(Y/N)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'StoreProper'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'APP手机端(Y/N)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'AppProper'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POS次屏显示(Y/N)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'PosMinorDisp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供应商专属后台(Y/N)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'SupplierProper'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批发商专属后台(Y/N)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'WholesalerProper'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开通时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生效日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'EffectiveDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期(年)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'ValidityYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可用状态(Y/N)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'Useable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器码（设备码）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'MachineSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序列号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'SerialNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize', @level2type=N'COLUMN',@level2name=N'AreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位授权' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_CompanyAuthorize'
GO
/****** Object:  Table [dbo].[Notice]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Theme] [nvarchar](100) NULL,
	[NoticeContent] [nvarchar](1000) NULL,
	[Type] [smallint] NOT NULL,
	[State] [smallint] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[StoreId] [nvarchar](4000) NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[BeginDate] [date] NULL,
	[Url] [nvarchar](200) NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Notice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活动ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告主题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Theme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'NoticeContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告类型（1-公告；2-活动）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告状态（ 0:未发布 1:已发布）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告范围（门店ID或供应商ID，多个以逗号间隔）（0:后台系统）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'截止日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'ExpirationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主题图片 Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公告
用于管理本系统的公告信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notice'
GO
/****** Object:  Table [dbo].[MembershipCardSetting]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MembershipCardSetting](
	[Id] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StartChar] [nchar](1) NULL,
	[EndChar] [nchar](1) NULL,
	[BootSector] [smallint] NULL,
	[CheckSecuritycode] [bit] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_MembershipCardSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCardSetting', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'磁卡前缀字符' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCardSetting', @level2type=N'COLUMN',@level2name=N'StartChar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'磁卡后缀字符' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCardSetting', @level2type=N'COLUMN',@level2name=N'EndChar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'射频卡使用扇区（1-15）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCardSetting', @level2type=N'COLUMN',@level2name=N'BootSector'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证防伪码（0：不验证；1：验证）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCardSetting', @level2type=N'COLUMN',@level2name=N'CheckSecuritycode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCardSetting', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCardSetting', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
/****** Object:  Table [dbo].[MembershipCard]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MembershipCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BatchSN] [varchar](40) NULL,
	[CardSN] [varchar](40) NOT NULL,
	[CardTypeId] [varchar](40) NOT NULL,
	[MemberId] [varchar](40) NULL,
	[ReChargeTotal] [money] NOT NULL,
	[GiveTotal] [money] NOT NULL,
	[Balance] [money] NOT NULL,
	[Deposit] [money] NOT NULL,
	[State] [int] NOT NULL,
	[ExpiryStart] [datetime] NOT NULL,
	[ExpiryEnd] [datetime] NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[LeadTime] [datetime] NULL,
	[SecurityCode] [varchar](20) NULL,
	[ExportDT] [datetime] NULL,
	[Password] [varchar](128) NULL,
	[ExportUID] [varchar](40) NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_MembershipCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制卡批次 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'BatchSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'CardSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡片类型 GUID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'CardTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联会员 UID 
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'MemberId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计充值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'ReChargeTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计赠送金额 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'GiveTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可用余额 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'Balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'押金 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'Deposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用状态(0:未激活；1：正常；2 已挂失；3：已作废；4 已退卡) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期-起始 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'ExpiryStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期-截止' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'ExpiryEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'领用时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'LeadTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'ExportDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard', @level2type=N'COLUMN',@level2name=N'ExportUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有会员卡信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MembershipCard'
GO
/****** Object:  Table [dbo].[Members]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [varchar](40) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [varchar](20) NOT NULL,
	[MemberNo] [varchar](40) NOT NULL,
	[RealName] [varchar](50) NULL,
	[MemberLevelId] [varchar](40) NULL,
	[MemberGroupId] [varchar](40) NULL,
	[Sex] [smallint] NULL,
	[IDNumber] [varchar](50) NULL,
	[Weixin] [varchar](50) NULL,
	[Zhifubao] [varchar](50) NULL,
	[MobilePhone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[QQ] [varchar](50) NULL,
	[Birthday] [varchar](10) NULL,
	[CurrentProvinceID] [int] NULL,
	[CurrentCityId] [int] NULL,
	[CurrentCountyId] [int] NULL,
	[Address] [varchar](1000) NULL,
	[DefaultPreferentialId] [int] NULL,
	[DefaultIntegrationId] [int] NULL,
	[UsableIntegral] [money] NULL,
	[UsableBalance] [money] NULL,
	[RechargeTotal] [money] NULL,
	[ConsumeTotal] [money] NULL,
	[Insider] [bit] NOT NULL,
	[Status] [smallint] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[ReferrerUID] [varchar](40) NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'MemberNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'MemberLevelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员分组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'MemberGroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别（ -1: 未知、 0:女、 1: 男）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'证件号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'IDNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'微信号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Weixin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付宝号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Zhifubao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'MobilePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认优惠方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'DefaultPreferentialId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认积分方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'DefaultIntegrationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可用积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'UsableIntegral'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可用余额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'UsableBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计充值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'RechargeTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计消费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'ConsumeTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为内部职员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Insider'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0: 禁用、 1:可用、 2: 无效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members', @level2type=N'COLUMN',@level2name=N'ReferrerUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新会员资料表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Members'
GO
/****** Object:  Table [dbo].[MemberRecharge]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberRecharge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[RechargeSN] [varchar](50) NOT NULL,
	[CardId] [varchar](40) NOT NULL,
	[Type] [smallint] NOT NULL,
	[RechargeAmount] [money] NOT NULL,
	[GivenAmount] [money] NULL,
	[PresentExp] [int] NULL,
	[BeforeAmount] [money] NULL,
	[AfterAmount] [money] NULL,
	[AfterIntegral] [int] NULL,
	[Memo] [nvarchar](200) NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[RechargeGiftId] [varchar](40) NULL,
	[Number] [money] NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[IsTest] [bit] NOT NULL,
	[MachineSN] [varchar](20) NOT NULL,
 CONSTRAINT [PK_MemberRecharge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'RechargeSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号GUID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'CardId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（1：支入；2：支出）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'RechargeAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'GivenAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'PresentExp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值后金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'AfterAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值后积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'AfterIntegral'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返还赠送规则id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'RechargeGiftId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'充值次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有会员的充值记录信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberRecharge'
GO
/****** Object:  Table [dbo].[MemberLevel]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberLevelId] [varchar](40) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[LevelSN] [int] NOT NULL,
	[LevelTitle] [varchar](40) NOT NULL,
	[CouponType] [smallint] NULL,
	[Discount] [money] NULL,
	[IntegerType] [smallint] NULL,
	[AutoUpdate] [bit] NOT NULL,
	[ConverRatio] [money] NULL,
	[UpgradeScore] [int] NOT NULL,
	[Memo] [nvarchar](200) NULL,
	[State] [smallint] NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[IntegralCoefficient] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_MemberLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级编号 4 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'LevelSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级名称 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'LevelTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠方式（0:无1:方案折扣，2:固定折扣） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'CouponType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'固定折扣 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分方式(0:无，1:方案积分)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'IntegerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自动升级(0:否，1:是)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'AutoUpdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转换比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'ConverRatio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'升级分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'UpgradeScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等级状态（0：生
效；1：已无效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的会员等级信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberLevel'
GO
/****** Object:  Table [dbo].[MemberIntegralSetList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberIntegralSetList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IntegralId] [int] NOT NULL,
	[BarcodeOrCategorySN] [varchar](30) NOT NULL,
	[SetType] [smallint] NOT NULL,
	[SaleMoney] [money] NOT NULL,
	[IntegralCount] [money] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_MemberIntegralSetList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSetList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分设定ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSetList', @level2type=N'COLUMN',@level2name=N'IntegralId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码或系列' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSetList', @level2type=N'COLUMN',@level2name=N'BarcodeOrCategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设定 类型（ 1: 商品 、 2:系列 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSetList', @level2type=N'COLUMN',@level2name=N'SetType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消费金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSetList', @level2type=N'COLUMN',@level2name=N'SaleMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSetList', @level2type=N'COLUMN',@level2name=N'IntegralCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分商品设定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSetList'
GO
/****** Object:  Table [dbo].[MemberIntegralSet]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberIntegralSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[CustomerObj] [varchar](10) NULL,
	[Promotion] [bit] NULL,
	[Scale] [smallint] NULL,
	[Nature] [smallint] NULL,
	[OperatorUID] [varchar](40) NULL,
	[OperatorTime] [datetime] NULL,
	[State] [smallint] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用对象(-1:不限,1:内部,2:VIP)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet', @level2type=N'COLUMN',@level2name=N'CustomerObj'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'包含促销' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet', @level2type=N'COLUMN',@level2name=N'Promotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet', @level2type=N'COLUMN',@level2name=N'Scale'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设定类型(1-消费积分,2-商品积分)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet', @level2type=N'COLUMN',@level2name=N'Nature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作 人 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet', @level2type=N'COLUMN',@level2name=N'OperatorUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet', @level2type=N'COLUMN',@level2name=N'OperatorTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 （0: 失效 、1:有效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分设定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegralSet'
GO
/****** Object:  Table [dbo].[MemberIntegral]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberIntegral](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PaySN] [varchar](50) NOT NULL,
	[MemberId] [varchar](40) NOT NULL,
	[IntegralRuleId] [nvarchar](50) NULL,
	[Integral] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_MEMBERINTEGRAL] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegral', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegral', @level2type=N'COLUMN',@level2name=N'PaySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegral', @level2type=N'COLUMN',@level2name=N'MemberId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消费金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegral', @level2type=N'COLUMN',@level2name=N'IntegralRuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegral', @level2type=N'COLUMN',@level2name=N'Integral'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消费时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegral', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员积分明细
用于管理本系统的所有会员的消费积分明细信息（主表：SaleOrders） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberIntegral'
GO
/****** Object:  Table [dbo].[MakingMembershipCard]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MakingMembershipCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BatchSN] [varchar](40) NOT NULL,
	[CardTypeId] [varchar](40) NOT NULL,
	[NumberStart] [int] NOT NULL,
	[NumberEnd] [int] NOT NULL,
	[MakeNumber] [int] NOT NULL,
	[State] [smallint] NOT NULL,
	[ExpiryStart] [datetime] NOT NULL,
	[ExpiryEnd] [datetime] NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_MakingMembershipCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制卡批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'BatchSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡类型GUID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'CardTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号范围-起始 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'NumberStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码范围-截止' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'NumberEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制作数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'MakeNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制卡状态(0:未制卡；1：已制卡；2：可用；3：已作废) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期-截止(空为永久)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'ExpiryEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有制作会员卡信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingMembershipCard'
GO
/****** Object:  Table [dbo].[MakingCouponCard]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MakingCouponCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BatchSN] [varchar](40) NOT NULL,
	[CouponType] [smallint] NOT NULL,
	[CouponFrom] [int] NOT NULL,
	[StoreIds] [varchar](2000) NOT NULL,
	[ProductTypes] [smallint] NOT NULL,
	[ProductCode] [nvarchar](max) NULL,
	[MakeNumber] [int] NOT NULL,
	[State] [smallint] NOT NULL,
	[ExpiryStart] [varchar](10) NOT NULL,
	[ExpiryEnd] [varchar](10) NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[ReceiveStart] [varchar](10) NOT NULL,
	[ReceiveEnd] [varchar](10) NULL,
 CONSTRAINT [PK_MakingCouponCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制卡批次 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'BatchSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'券类别（1：现金券；2：体验券；3：礼品券；4：折扣券；5：特价券；6：换购券）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'CouponType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'形式：（1：电子；2：短信；3：纸质） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'CouponFrom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用门店（-1：所有门店）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'StoreIds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用商品（-1：全部商品，2:指定品类，3:指定具体商品，4:按品牌） ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'ProductTypes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品标识 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'ProductCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制作数量 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'MakeNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0:未生效；1：正常；2：已作废)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期-起始 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'ExpiryStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期-截止' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'ExpiryEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有制作优惠券信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakingCouponCard'
GO
/****** Object:  Table [dbo].[MakeShipCardHistory]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MakeShipCardHistory](
	[Id] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BatchSN] [varchar](40) NOT NULL,
	[CardType] [varchar](40) NOT NULL,
	[CardSN] [varchar](40) NOT NULL,
	[SecurityCode] [varchar](40) NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_MakeShipCardHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakeShipCardHistory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakeShipCardHistory', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制卡批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakeShipCardHistory', @level2type=N'COLUMN',@level2name=N'BatchSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡类型GUID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakeShipCardHistory', @level2type=N'COLUMN',@level2name=N'CardType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakeShipCardHistory', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakeShipCardHistory', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的导出制卡历史信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MakeShipCardHistory'
GO
/****** Object:  Table [dbo].[InventoryValidity]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventoryValidity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[StockNumber] [money] NOT NULL,
	[ProducedDate] [datetime] NULL,
	[ExpiryDate] [smallint] NULL,
	[ExpiryDateUnit] [smallint] NULL,
	[ExpirationDate] [datetime] NULL,
	[ProductionBatch] [varchar](30) NULL,
	[DistributionBatch] [varchar](30) NULL,
 CONSTRAINT [PK_INVENTORYVALIDITY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前库存量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity', @level2type=N'COLUMN',@level2name=N'StockNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity', @level2type=N'COLUMN',@level2name=N'ProducedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity', @level2type=N'COLUMN',@level2name=N'ExpiryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity', @level2type=N'COLUMN',@level2name=N'ExpiryDateUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'截止保质日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity', @level2type=N'COLUMN',@level2name=N'ExpirationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity', @level2type=N'COLUMN',@level2name=N'ProductionBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity', @level2type=N'COLUMN',@level2name=N'DistributionBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期库存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryValidity'
GO
/****** Object:  Table [dbo].[InventoryRecord]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventoryRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [varchar](3) NULL,
	[Barcode] [varchar](30) NOT NULL,
	[Number] [money] NOT NULL,
	[AveragePrice] [decimal](18, 8) NULL,
	[Source] [int] NOT NULL,
	[CreateDT] [datetime] NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[OperatId] [varchar](40) NULL,
	[InValidity] [bit] NOT NULL,
 CONSTRAINT [PK_INVENTORYRECORD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryRecord', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryRecord', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryRecord', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源标识（1、总部入库；2、总部出库；3、调拨入库；4、调拨出库；5、门店售后退换货入库；6、门店售后换货出库；7、拆分子商品入库；8、拆分父商品消减；9、销售商品消减；10、销售组合商品消减;11、门店收货；12、门店预约退换；13、总部批发出库;14、总部退货;15、库存纠正(正、负);16、总部报损）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryRecord', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存结余时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryRecord', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryRecord', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库或配送ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryRecord', @level2type=N'COLUMN',@level2name=N'OperatId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存数量记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryRecord'
GO
/****** Object:  Table [dbo].[InventoryBalance]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventoryBalance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[Number] [money] NOT NULL,
	[BalanceDate] [date] NOT NULL,
	[SaleAveragePrice] [decimal](18, 8) NOT NULL,
	[SaleAmount] [money] NOT NULL,
	[StockAmount] [money] NOT NULL,
	[Period] [bit] NULL,
 CONSTRAINT [PK_INVENTORYBALANCE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_InventoryBalance] ON [dbo].[InventoryBalance] 
(
	[Barcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryBalance', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryBalance', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结余数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryBalance', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存结余时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryBalance', @level2type=N'COLUMN',@level2name=N'BalanceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平均售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryBalance', @level2type=N'COLUMN',@level2name=N'SaleAveragePrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryBalance', @level2type=N'COLUMN',@level2name=N'SaleAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryBalance', @level2type=N'COLUMN',@level2name=N'StockAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'周期（0:实时结余、1:每日结余）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryBalance', @level2type=N'COLUMN',@level2name=N'Period'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存结余' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InventoryBalance'
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [varchar](3) NULL,
	[CompanyId] [int] NOT NULL,
	[Barcode] [varchar](30) NULL,
	[StockNumber] [money] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_INVENTORY] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Inventory] UNIQUE NONCLUSTERED 
(
	[StoreId] ASC,
	[Barcode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存总量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory', @level2type=N'COLUMN',@level2name=N'StockNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory'
GO
/****** Object:  Table [dbo].[IntegralRule]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IntegralRule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[State] [int] NULL,
	[ExpiryStart] [varchar](10) NOT NULL,
	[ExpiryEnd] [varchar](10) NULL,
	[UseUsers] [varchar](40) NOT NULL,
	[IsStack] [bit] NOT NULL,
	[Condition] [money] NOT NULL,
	[ReturnValue] [int] NOT NULL,
	[RuleTypeId] [smallint] NOT NULL,
	[RuleTypeValue] [varchar](max) NULL,
	[Memo] [nvarchar](400) NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_IntegralRule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0：生效；1：已无效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期-截止(空为永久)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'ExpiryEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用客户群ID(-1:全部)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'UseUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'满足条件金额 （默认没有赠送为-1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送多少积分 (默认没有赠送为-1)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'ReturnValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规则方式(1:按消费金额；2：按付款方式（支付宝；微信；即付宝）； 3：按指定品类；4：按具体商品；5：按消费次数) ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'RuleTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规则id 对应的值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'RuleTypeValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的积分规则信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRule'
GO
/****** Object:  Table [dbo].[IntegralRecords]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IntegralRecords](
	[Id] [varchar](40) NOT NULL,
	[Source] [nvarchar](400) NOT NULL,
	[SourceType] [int] NOT NULL,
	[Integral] [money] NOT NULL,
	[IntegralRuleId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[MemberId] [varchar](40) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
	[StoreId] [varchar](10) NOT NULL,
	[OperatorUid] [varchar](40) NOT NULL,
 CONSTRAINT [PK_IntegralRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(1:销售单，2、充值记录)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralRecords', @level2type=N'COLUMN',@level2name=N'SourceType'
GO
/****** Object:  Table [dbo].[IntegralFlows]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IntegralFlows](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[StoreId] [varchar](10) NULL,
	[FlowSN] [varchar](40) NOT NULL,
	[Amount] [money] NOT NULL,
	[Integral] [money] NOT NULL,
	[DiscountAmount] [money] NOT NULL,
	[CardSN] [varchar](20) NULL,
	[Received] [money] NOT NULL,
	[Remark] [nvarchar](200) NULL,
	[State] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[MemberId] [varchar](40) NOT NULL,
	[Alias] [varchar](50) NULL,
 CONSTRAINT [PK__Integral__3214EC27000BC426] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralFlows', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralFlows', @level2type=N'COLUMN',@level2name=N'FlowSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单总额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralFlows', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralFlows', @level2type=N'COLUMN',@level2name=N'Integral'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抵扣金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralFlows', @level2type=N'COLUMN',@level2name=N'DiscountAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员卡号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralFlows', @level2type=N'COLUMN',@level2name=N'CardSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实收' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralFlows', @level2type=N'COLUMN',@level2name=N'Received'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralFlows', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送状态（0：未生效，1：已生效）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IntegralFlows', @level2type=N'COLUMN',@level2name=N'State'
GO
/****** Object:  Table [dbo].[InstalmentRecord]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InstalmentRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Integral] [money] NOT NULL,
	[InstalmentRuleId] [int] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[InstalmentDT] [datetime] NOT NULL,
	[IntegralRecordId] [varchar](40) NOT NULL,
	[MemberId] [varchar](50) NOT NULL,
	[State] [int] NOT NULL,
 CONSTRAINT [PK_InstalmentRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:未生效，1已生效，2失效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstalmentRecord', @level2type=N'COLUMN',@level2name=N'State'
GO
/****** Object:  Table [dbo].[IndentOrderList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IndentOrderList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IndentOrderId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[IndentNum] [money] NOT NULL,
	[Price] [money] NOT NULL,
	[Subtotal] [money] NULL,
	[Memo] [nvarchar](200) NULL,
	[DeliveryNum] [money] NULL,
	[AcceptNum] [money] NULL,
	[ResBarcode] [varchar](30) NULL,
	[Nature] [smallint] NOT NULL,
	[State] [smallint] NOT NULL,
	[SysPrice] [money] NULL,
	[AssistBarcode] [varchar](30) NULL,
 CONSTRAINT [PK_INDENTORDERLIST] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购单ID（订货单 ID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'IndentOrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订货数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'IndentNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价（进价）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'Subtotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'DeliveryNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'AcceptNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隶属赠品条码（返 利赠品使用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'ResBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购性质（ 0:正常 、 1: 赠品 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'Nature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1: 未配送、 2:配送中、 3:已中止、4:已配送、 5:已收货）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'SysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList', @level2type=N'COLUMN',@level2name=N'AssistBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购明细单表
用于管理本系统的所有采购订货单基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrderList'
GO
/****** Object:  Table [dbo].[IndentOrder]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IndentOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[IndentOrderId] [varchar](40) NOT NULL,
	[StoreId] [varchar](3) NULL,
	[RecipientsUID] [varchar](40) NULL,
	[Phone] [varchar](15) NULL,
	[SupplierID] [varchar](40) NOT NULL,
	[OrderTotal] [money] NOT NULL,
	[ShippingAddress] [nvarchar](100) NULL,
	[DeliveryDate] [varchar](10) NOT NULL,
	[PeiSongStartDate] [varchar](10) NULL,
	[PeiSongEndDate] [varchar](10) NULL,
	[CreateDT] [datetime] NOT NULL,
	[ReceivedDT] [datetime] NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[ApproveDT] [datetime] NULL,
	[State] [smallint] NOT NULL,
 CONSTRAINT [PK_INDENTORDER] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购单ID(订货单ID,自动生成)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'IndentOrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订货门店 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'RecipientsUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供货单位 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单总额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'OrderTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'ShippingAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应交货日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'DeliveryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送开始日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'PeiSongStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送完成日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'PeiSongEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已收货日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'ReceivedDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ -1:未提交、0:未审核、 1:已审核（ 未配送）、 2:配送中、 3:已中止、4:已配送、 5:已收货）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购订单信息表
用于管理本系统的所有采购订货单基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IndentOrder'
GO
/****** Object:  Table [dbo].[InboundList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InboundList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InboundGoodsId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[InboundNumber] [money] NOT NULL,
	[BuyPrice] [money] NOT NULL,
	[SysPrice] [money] NOT NULL,
	[Memo] [nvarchar](200) NULL,
	[State] [smallint] NOT NULL,
	[ProducedDate] [varchar](10) NULL,
	[ExpiryDate] [smallint] NULL,
	[ExpiryDateUnit] [smallint] NULL,
	[ExpirationDate] [varchar](10) NULL,
	[IsGift] [smallint] NOT NULL,
	[AssistBarcode] [varchar](30) NULL,
 CONSTRAINT [PK_InboundList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'InboundGoodsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'InboundNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'BuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'SysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0：待验，1：已验）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'ProducedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期（天数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'ExpiryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期单位（1：天、2：月、3、年）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'ExpiryDateUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'截止保质日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'ExpirationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为赠品（0：否，1：是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'IsGift'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList', @level2type=N'COLUMN',@level2name=N'AssistBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库明细信息
用于管理本系统的所有货品入库的明细信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundList'
GO
/****** Object:  Table [dbo].[InboundGoods]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InboundGoods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[InboundGoodsId] [varchar](40) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[IndentOrderId] [varchar](40) NULL,
	[SupplierID] [varchar](40) NULL,
	[ReceivedDT] [varchar](10) NULL,
	[BuyerUID] [varchar](40) NULL,
	[DistributionBatch] [varchar](30) NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[State] [smallint] NOT NULL,
	[ProductionBatch] [varchar](30) NULL,
	[InboundType] [smallint] NOT NULL,
	[VerifyTime] [datetime] NULL,
	[Source] [smallint] NULL,
 CONSTRAINT [PK_InboundGoods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库单ID（自动生成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'InboundGoodsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库门店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购单号（订货单号）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'IndentOrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供货单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到货日期（Date）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'ReceivedDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购员U ID（下单人）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'BuyerUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'DistributionBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库员 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入仓日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0:待验、 1:已验）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库方式(1:正常,2:其它)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'InboundType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'VerifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购来源（1-本系统，2-外部）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入库单信息
用于管理本系统的所有货品入库基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InboundGoods'
GO
/****** Object:  Table [dbo].[ImportSet]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImportSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[TableName] [varchar](30) NULL,
	[FieldJson] [varchar](2000) NULL,
	[MinRow] [smallint] NULL,
	[MaxRow] [smallint] NULL,
	[RefCreate] [bit] NULL,
 CONSTRAINT [PK_ImportSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ImportSet', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导入表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ImportSet', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ImportSet', @level2type=N'COLUMN',@level2name=N'FieldJson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'起始行数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ImportSet', @level2type=N'COLUMN',@level2name=N'MinRow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大行数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ImportSet', @level2type=N'COLUMN',@level2name=N'MaxRow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相关联不存在是否创建新记录，0－不创建，1－创建' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ImportSet', @level2type=N'COLUMN',@level2name=N'RefCreate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'基础表导入配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ImportSet'
GO
/****** Object:  Table [dbo].[HouseMoveList]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HouseMoveList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MoveId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[OrderQuantity] [money] NOT NULL,
	[DeliveryQuantity] [money] NOT NULL,
	[ActualQuantity] [money] NOT NULL,
	[BuyPrice] [money] NULL,
	[SysPrice] [money] NOT NULL,
	[StockOut] [smallint] NOT NULL,
	[Memo] [nvarchar](200) NULL,
	[State] [smallint] NOT NULL,
 CONSTRAINT [PK_HouseMoveList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调拨单号 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'MoveId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调拨商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'OrderQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'DeliveryQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'ActualQuantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单价（进价）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'BuyPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统售价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'SysPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否缺货（ 0:否、1:是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'StockOut'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 1:调拨中、2:已配送、 3:已撤回、 4:已收货）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有店内调拨明细清单，依懒表（ STHouseMove）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMoveList'
GO
/****** Object:  Table [dbo].[HouseMove]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HouseMove](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[MoveId] [varchar](40) NOT NULL,
	[OutStoreId] [varchar](3) NOT NULL,
	[InStoreId] [varchar](3) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[DeliveryUID] [varchar](40) NULL,
	[DeliveryDT] [datetime] NULL,
	[ActualUID] [varchar](40) NULL,
	[ActualDT] [datetime] NULL,
	[Memo] [nvarchar](200) NULL,
	[State] [smallint] NOT NULL,
	[ReasonId] [int] NULL,
 CONSTRAINT [PK_HouseMove] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调拨单号 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'MoveId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调出分店 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'OutStoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调入分店 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'InStoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送人 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'DeliveryUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调出时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'DeliveryDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货人 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'ActualUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'ActualDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 1:调拨中、2:已配送、 3:已撤回、 4:已收货）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退回请求原因（ 来自字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove', @level2type=N'COLUMN',@level2name=N'ReasonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有店内的货品调拨基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HouseMove'
GO
/****** Object:  Table [dbo].[Grouping]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grouping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Channel] [smallint] NOT NULL,
	[GroupId] [varchar](40) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[State] [smallint] NOT NULL,
 CONSTRAINT [PK_MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Grouping', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Grouping', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'通道（1:会员，2:供应商，3:批发商）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Grouping', @level2type=N'COLUMN',@level2name=N'Channel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组GUID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Grouping', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Grouping', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组状态（1:可用，0:停用，默认1）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Grouping', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Grouping'
GO
/****** Object:  Table [dbo].[OutboundGoods]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OutboundGoods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[OutboundId] [varchar](40) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[ApplyOrgId] [varchar](40) NULL,
	[ApplyUID] [varchar](40) NULL,
	[OperatorUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[State] [smallint] NOT NULL,
	[Channel] [smallint] NOT NULL,
	[OutboundType] [smallint] NOT NULL,
	[VerifyTime] [datetime] NULL,
 CONSTRAINT [PK_OUTBOUNDGOODS] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出库单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'OutboundId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出货仓库ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提货单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'ApplyOrgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提货员UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'ApplyUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经办人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'OperatorUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出仓日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0:待审、 1:已审）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出货渠道（0：门店、1：批发）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'Channel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出库方式(1:正常,2:其它)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'OutboundType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods', @level2type=N'COLUMN',@level2name=N'VerifyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有货品出库基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoods'
GO
/****** Object:  Table [dbo].[OrderReturns]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderReturns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[IndentOrderId] [varchar](40) NOT NULL,
	[DistributionId] [varchar](40) NULL,
	[DistributionBatch] [varchar](30) NULL,
	[Barcode] [varchar](30) NOT NULL,
	[ReturnType] [smallint] NOT NULL,
	[ReturnNum] [money] NOT NULL,
	[ReasonId] [int] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[State] [smallint] NOT NULL,
	[Memo] [nvarchar](200) NULL,
 CONSTRAINT [PK_ORDERRETURNS] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订货单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'IndentOrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'DistributionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'DistributionBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换方式（0:退货、1:换货）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'ReturnType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'ReturnNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换理由ID（来自数据字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'ReasonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0：未处理；1：处理中；2：已完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有订货（进货）的退换信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderReturns'
GO
/****** Object:  Table [dbo].[OrderDistributionGift]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDistributionGift](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDistributionId] [int] NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[IndentNum] [money] NOT NULL,
	[ReceivedNum] [money] NULL,
 CONSTRAINT [PK_OrderDistributionGift] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistributionGift', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistributionGift', @level2type=N'COLUMN',@level2name=N'OrderDistributionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistributionGift', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订货数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistributionGift', @level2type=N'COLUMN',@level2name=N'IndentNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实收数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistributionGift', @level2type=N'COLUMN',@level2name=N'ReceivedNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有订货所赠送的赠品明细配送信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistributionGift'
GO
/****** Object:  Table [dbo].[OrderDistribution]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDistribution](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DistributionId] [varchar](40) NOT NULL,
	[IndentOrderId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[ProducedDate] [varchar](10) NULL,
	[ExpiryDate] [smallint] NULL,
	[ExpiryDateUnit] [smallint] NULL,
	[ExpirationDate] [varchar](10) NULL,
	[ProductionBatch] [varchar](30) NULL,
	[DistributionBatch] [varchar](30) NULL,
	[DeliveryNum] [money] NULL,
	[DeliveryDT] [datetime] NULL,
	[ReceivedNum] [money] NULL,
	[ReceivedDT] [datetime] NULL,
	[State] [smallint] NOT NULL,
	[OrderReturnId] [int] NULL,
	[Memo] [nvarchar](200) NULL,
 CONSTRAINT [PK_ORDERDISTRIBUTION] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'DistributionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'采购单ID(订货单ID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'IndentOrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'ProducedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期（天数）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'ExpiryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期单位（ 1:天、 2:月、 3:年）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'ExpiryDateUnit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'截止保质日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'ExpirationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'ProductionBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'DistributionBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'DeliveryNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'DeliveryDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'ReceivedNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'ReceivedDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1: 未配送、 2:配送中、 3:已中止、4:已配送、 5:已收货、6:已预约退换）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'退换ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'OrderReturnId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订货配送信息
用于管理本系统的所有订货明细配送信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDistribution'
GO
/****** Object:  Table [dbo].[OMS_SysUserInfo]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OMS_SysUserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UID] [varchar](40) NOT NULL,
	[UserCode] [varchar](10) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[LoginName] [nvarchar](100) NOT NULL,
	[LoginPwd] [nvarchar](50) NOT NULL,
	[Sex] [bit] NULL,
	[BranchId] [int] NULL,
	[BumenId] [int] NULL,
	[BossUId] [varchar](40) NULL,
	[PositionId] [int] NULL,
	[PhotoUrl] [nvarchar](200) NULL,
	[Status] [smallint] NOT NULL,
	[RoleIds] [nvarchar](2000) NULL,
	[LoginIP] [varchar](50) NULL,
	[LoginDT] [datetime] NOT NULL,
	[LoginNum] [int] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NULL,
	[StoreRole] [varchar](50) NULL,
	[Signature] [nvarchar](100) NULL,
	[IsShopManager] [smallint] NOT NULL,
	[Handsign] [varchar](20) NULL,
	[Mobile] [varchar](20) NULL,
	[HuanXinUUID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户 UID （GUID 全 局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'UID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号（员 工编 号，全 局唯一  ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'UserCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密钥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别（0:女、1:男）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隶属机构ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'BranchId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隶属部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'BumenId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'直属上司ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'BossUId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'担任职位(来自数据字典)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（1:正常、2:锁定、3:注销）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隶属角色组ID（多个间用,逗号间隔）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'RoleIds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录次数（0:未登录过）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'LoginNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'信息创建者 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店角色' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'StoreRole'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个性签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'Signature'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为店长（ 0: 否， 1: 是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'IsShopManager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手势密码(手机端)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'Handsign'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环信IM用户uuid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo', @level2type=N'COLUMN',@level2name=N'HuanXinUUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的用户基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OMS_SysUserInfo'
GO
/****** Object:  Table [dbo].[PrivilegeSolution]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrivilegeSolution](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ModeSN] [int] NULL,
	[SupplierIds] [nvarchar](500) NULL,
	[Memo] [nvarchar](200) NULL,
	[OperatorUID] [varchar](40) NULL,
	[CreateDT] [datetime] NULL,
 CONSTRAINT [PK1] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeSolution', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeSolution', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利模式（来自字典）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeSolution', @level2type=N'COLUMN',@level2name=N'ModeSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利供应商（多个以逗号隔开）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeSolution', @level2type=N'COLUMN',@level2name=N'SupplierIds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeSolution', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作员 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeSolution', @level2type=N'COLUMN',@level2name=N'OperatorUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeSolution', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有返利方案基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeSolution'
GO
/****** Object:  Table [dbo].[PrivilegeRegionVal]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivilegeRegionVal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [money] NULL,
	[PrivilegeProductId] [int] NOT NULL,
	[PrivilegeRegionId] [int] NOT NULL,
 CONSTRAINT [PK4] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegionVal', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设定值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegionVal', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设定商品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegionVal', @level2type=N'COLUMN',@level2name=N'PrivilegeProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设定区间段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegionVal', @level2type=N'COLUMN',@level2name=N'PrivilegeRegionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理返利方案动态区间值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegionVal'
GO
/****** Object:  Table [dbo].[PrivilegeRegion]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivilegeRegion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartVal] [money] NULL,
	[EndVal] [money] NULL,
	[PrivilegeSolutionId] [int] NOT NULL,
 CONSTRAINT [PK2] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegion', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegion', @level2type=N'COLUMN',@level2name=N'StartVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegion', @level2type=N'COLUMN',@level2name=N'EndVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利方案Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegion', @level2type=N'COLUMN',@level2name=N'PrivilegeSolutionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理返利方案动态区间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeRegion'
GO
/****** Object:  Table [dbo].[PrivilegeProductGift]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrivilegeProductGift](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegionValId] [int] NULL,
	[Barcode] [varchar](30) NOT NULL,
	[GiftNumber] [smallint] NOT NULL,
 CONSTRAINT [PK__Privileg__3214EC076B24EA82] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProductGift', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设定值ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProductGift', @level2type=N'COLUMN',@level2name=N'RegionValId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProductGift', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠品数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProductGift', @level2type=N'COLUMN',@level2name=N'GiftNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理返利方案的赠品信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProductGift'
GO
/****** Object:  Table [dbo].[PrivilegeProduct]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrivilegeProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BarcodeOrCategorySN] [varchar](30) NOT NULL,
	[Type] [smallint] NOT NULL,
	[PrivilegeSolutionId] [int] NOT NULL,
 CONSTRAINT [PK3] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProduct', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码或品类SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProduct', @level2type=N'COLUMN',@level2name=N'BarcodeOrCategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（1: 条码 、2:品类 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProduct', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利方案Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProduct', @level2type=N'COLUMN',@level2name=N'PrivilegeSolutionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理设定商品或类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeProduct'
GO
/****** Object:  Table [dbo].[PrivilegeCalcResult]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrivilegeCalcResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartVal] [money] NOT NULL,
	[EndVal] [money] NOT NULL,
	[TotalNum] [money] NOT NULL,
	[Value] [money] NOT NULL,
	[BarcodeOrCategorySN] [varchar](30) NOT NULL,
	[Type] [smallint] NOT NULL,
	[PrivilegeCalcId] [int] NULL,
 CONSTRAINT [PK7] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcResult', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcResult', @level2type=N'COLUMN',@level2name=N'StartVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcResult', @level2type=N'COLUMN',@level2name=N'EndVal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcResult', @level2type=N'COLUMN',@level2name=N'TotalNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设定值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcResult', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码或品类SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcResult', @level2type=N'COLUMN',@level2name=N'BarcodeOrCategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型(1：条码，2：品类)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcResult', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利计算ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcResult', @level2type=N'COLUMN',@level2name=N'PrivilegeCalcId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有返利计算配置信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcResult'
GO
/****** Object:  Table [dbo].[PrivilegeCalcDetail]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrivilegeCalcDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IndentOrderId] [varchar](40) NOT NULL,
	[Barcode] [varchar](30) NOT NULL,
	[PartName] [varchar](50) NULL,
	[CategorySN] [int] NULL,
	[CategoryTitle] [nvarchar](50) NULL,
	[Unit] [varchar](10) NULL,
	[OrderDate] [datetime] NULL,
	[TakeDate] [datetime] NULL,
	[TakeNum] [money] NULL,
	[Price] [money] NULL,
	[SubTotal] [money] NULL,
	[PrivilegeCalcId] [int] NOT NULL,
 CONSTRAINT [PK6] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'IndentOrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'Barcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'PartName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品类SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'CategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'CategoryTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'Unit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订货日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'OrderDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到货日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'TakeDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收货数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'TakeNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'SubTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利计算ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail', @level2type=N'COLUMN',@level2name=N'PrivilegeCalcId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有返利计算明细信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalcDetail'
GO
/****** Object:  Table [dbo].[PrivilegeCalc]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrivilegeCalc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[SupplierId] [varchar](40) NULL,
	[SupplierTitle] [nvarchar](50) NULL,
	[PrivilegeSolutionId] [int] NOT NULL,
	[PrivilegeSolutionTitle] [nvarchar](30) NULL,
	[PrivilegeModeSN] [int] NULL,
	[PrivilegeModeSNTitle] [varchar](50) NULL,
	[TotalMoney] [money] NULL,
	[PrivilegeNum] [money] NULL,
	[State] [smallint] NOT NULL,
	[OperatorUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
 CONSTRAINT [PK5] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利供应商Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'SupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利供应商名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'SupplierTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利方案Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'PrivilegeSolutionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利方案名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'PrivilegeSolutionTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利模式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'PrivilegeModeSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利模式名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'PrivilegeModeSNTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合计金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'TotalMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返利(元/数量)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'PrivilegeNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0-未返利1-已返利)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作员 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'OperatorUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有返利计算基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrivilegeCalc'
GO
/****** Object:  StoredProcedure [dbo].[PrintLong]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2016-8-5
-- Description:	输出过长的字符串
-- =============================================
CREATE PROC [dbo].[PrintLong]
(
	-- Add the parameters for the function here
	@SQL NVARCHAR(max)
)
AS
BEGIN
	--SELECT  @SQL =REPLICATE(CAST('1' AS NVARCHAR(MAX)),8000)+'23'
	DECLARE @StartOffset INT
	DECLARE @Length INT
	SET @StartOffset=0
	SET @Length=4000

	WHILE(@StartOffset<LEN(@SQL))
	BEGIN
		PRINT SUBSTRING(@SQL,@StartOffset,@Length)
		SET @StartOffset=@StartOffset+@Length
	END

END
GO
/****** Object:  Table [dbo].[PrintConponHistory]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrintConponHistory](
	[Id] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BatchSN] [varchar](40) NOT NULL,
	[CouponType] [smallint] NOT NULL,
	[CouponSN] [varchar](40) NOT NULL,
	[SecurityCode] [varchar](40) NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_PrintConponHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录 ID ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrintConponHistory', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrintConponHistory', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制卡批次 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrintConponHistory', @level2type=N'COLUMN',@level2name=N'BatchSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'券类别 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrintConponHistory', @level2type=N'COLUMN',@level2name=N'CouponType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrintConponHistory', @level2type=N'COLUMN',@level2name=N'CouponSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrintConponHistory', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrintConponHistory', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的优惠券历史信息 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrintConponHistory'
GO
/****** Object:  Table [dbo].[PosIncomePayout]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PosIncomePayout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[MachineSN] [varchar](20) NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[Type] [smallint] NOT NULL,
	[Amount] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[IsTest] [bit] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_POSINCOMEPAYOUT] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出入金ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosIncomePayout', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosIncomePayout', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POS机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosIncomePayout', @level2type=N'COLUMN',@level2name=N'MachineSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收银员UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosIncomePayout', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（0:出款、1:入款）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosIncomePayout', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosIncomePayout', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosIncomePayout', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:正常数据1：练习模式数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosIncomePayout', @level2type=N'COLUMN',@level2name=N'IsTest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有门店POS机的出入金信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosIncomePayout'
GO
/****** Object:  Table [dbo].[PosDevice]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PosDevice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MachineSN] [varchar](20) NOT NULL,
	[StoreId] [varchar](20) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[State] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosDevice', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosDevice', @level2type=N'COLUMN',@level2name=N'MachineSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosDevice', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosDevice', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态    0－可用1-禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosDevice', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的POS设备信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PosDevice'
GO
/****** Object:  Table [dbo].[PayWay]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayWay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PayType] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[EnableIcon] [varchar](200) NOT NULL,
	[DisableIcon] [varchar](200) NOT NULL,
	[SortNumber] [int] NOT NULL,
	[PayMode] [int] NOT NULL,
 CONSTRAINT [PK_PayWay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付类型（对应原v3版本的apicode）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayWay', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付名称或者标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayWay', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'可用图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayWay', @level2type=N'COLUMN',@level2name=N'EnableIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不可用图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayWay', @level2type=N'COLUMN',@level2name=N'DisableIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayWay', @level2type=N'COLUMN',@level2name=N'SortNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付模式【1 台账、2 后台对接支付接口、3 收银端对接支付接口】' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayWay', @level2type=N'COLUMN',@level2name=N'PayMode'
GO
/****** Object:  Table [dbo].[PayNotifyResult]    Script Date: 04/12/2017 14:11:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayNotifyResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ApiCode] [int] NOT NULL,
	[PaySN] [varchar](50) NOT NULL,
	[TradeNo] [varchar](50) NOT NULL,
	[CashFee] [money] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[State] [varchar](300) NOT NULL,
 CONSTRAINT [PK__PayNotif__3214EC0765C116E7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayNotifyResult', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式  14-支付宝13-微信' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayNotifyResult', @level2type=N'COLUMN',@level2name=N'ApiCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售单流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayNotifyResult', @level2type=N'COLUMN',@level2name=N'PaySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayNotifyResult', @level2type=N'COLUMN',@level2name=N'TradeNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayNotifyResult', @level2type=N'COLUMN',@level2name=N'CashFee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayNotifyResult', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 Success-成功 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayNotifyResult', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的支付结果信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayNotifyResult'
GO
/****** Object:  Table [dbo].[PayConfiguration]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PayConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[SecurityKey] [varchar](50) NULL,
	[PaymentMerchantNumber] [varchar](50) NULL,
	[PayType] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PayConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attachment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SourceClassify] [int] NOT NULL,
	[ItemId] [varchar](40) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[SaveUrl] [nvarchar](200) NOT NULL,
	[Size] [money] NOT NULL,
 CONSTRAINT [PK_ATTACHMENT] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attachment', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件来源（ 1:合同附件、 2:财务单据、3:邮件）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attachment', @level2type=N'COLUMN',@level2name=N'SourceClassify'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目 ID（GUID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attachment', @level2type=N'COLUMN',@level2name=N'ItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attachment', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attachment', @level2type=N'COLUMN',@level2name=N'SaveUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件大小（ KB）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attachment', @level2type=N'COLUMN',@level2name=N'Size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件信息
用于管理本系统的所有相关的附件基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Attachment'
GO
/****** Object:  Table [dbo].[Area]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Area](
	[AreaID] [int] IDENTITY(1,1) NOT NULL,
	[AreaPID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[JianPin] [varchar](50) NULL,
	[QuanPin] [varchar](50) NULL,
	[AreaSN] [varchar](7) NULL,
	[PostCode] [varchar](6) NULL,
	[OrderNum] [int] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area', @level2type=N'COLUMN',@level2name=N'AreaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级区域ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area', @level2type=N'COLUMN',@level2name=N'AreaPID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'简拼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area', @level2type=N'COLUMN',@level2name=N'JianPin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'全拼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area', @level2type=N'COLUMN',@level2name=N'QuanPin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area', @level2type=N'COLUMN',@level2name=N'AreaSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area', @level2type=N'COLUMN',@level2name=N'PostCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'省市区信息
用于管理本系统中的省市区信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Area'
GO
/****** Object:  Table [dbo].[AppPaymentRecords]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppPaymentRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [varchar](20) NOT NULL,
	[OrderSN] [varchar](40) NOT NULL,
	[TotalAmount] [money] NOT NULL,
	[DiscountAmount] [money] NOT NULL,
	[Received] [money] NULL,
	[ApiCode] [int] NOT NULL,
	[PayChannel] [varchar](20) NULL,
	[State] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [varchar](40) NULL,
	[Remark] [nvarchar](100) NULL,
	[ReturnData] [nvarchar](500) NULL,
	[Alias] [varchar](50) NULL,
	[UserCode] [varchar](40) NULL,
 CONSTRAINT [PK_AppPaymentRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPaymentRecords', @level2type=N'COLUMN',@level2name=N'CompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPaymentRecords', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPaymentRecords', @level2type=N'COLUMN',@level2name=N'OrderSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单总额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPaymentRecords', @level2type=N'COLUMN',@level2name=N'TotalAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPaymentRecords', @level2type=N'COLUMN',@level2name=N'DiscountAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实收' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPaymentRecords', @level2type=N'COLUMN',@level2name=N'Received'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付接口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPaymentRecords', @level2type=N'COLUMN',@level2name=N'ApiCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付渠道' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPaymentRecords', @level2type=N'COLUMN',@level2name=N'PayChannel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:未支付；1支付成功；2：支付失败；3：已撤销；4：支付超时）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppPaymentRecords', @level2type=N'COLUMN',@level2name=N'State'
GO
/****** Object:  Table [dbo].[ApiLibrary]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiLibrary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[ApiType] [smallint] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[ApiCode] [int] NOT NULL,
	[ApiUrl] [nvarchar](500) NULL,
	[ApiIcon] [nvarchar](200) NULL,
	[ApiOrder] [int] NOT NULL,
	[Memo] [nvarchar](200) NULL,
	[State] [smallint] NOT NULL,
	[ReqMode] [smallint] NOT NULL,
	[ApiToken] [nvarchar](100) NULL,
	[ApiAccount] [nvarchar](50) NULL,
	[ApiPwd] [nvarchar](50) NULL,
	[ApiCloseIcon] [nvarchar](200) NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ApiLibrary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口类型（ 1:支付接口）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ApiType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口代码（全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ApiCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ApiUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口ICON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ApiIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接口顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ApiOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（ 0:禁用、 1:可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求方式[1:post、2:get]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ReqMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Token' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ApiToken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ApiAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ApiPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭接口 ICON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary', @level2type=N'COLUMN',@level2name=N'ApiCloseIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'集成接口库
用于管理本系统的所有集成外部接口信息（如：银联支付接口、扫码支付接口）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApiLibrary'
GO
/****** Object:  Table [dbo].[account]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [money] NULL,
	[depositorid] [int] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceRegInfo]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeviceRegInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [smallint] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [varchar](3) NULL,
	[MachineSN] [varchar](20) NOT NULL,
	[DeviceSN] [varchar](50) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[State] [smallint] NOT NULL,
	[AuditorUID] [varchar](40) NULL,
	[Memo] [nvarchar](200) NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DeviceRegInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备 类型（ 1:大 POS 机、2:PAD、 3:Mobile ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店 ID （全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'POS 机号（全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo', @level2type=N'COLUMN',@level2name=N'MachineSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备编码（全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo', @level2type=N'COLUMN',@level2name=N'DeviceSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 （0: 禁用、 1:可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核 人 UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo', @level2type=N'COLUMN',@level2name=N'AuditorUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo', @level2type=N'COLUMN',@level2name=N'Memo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备注册信息
用于管理本系统的所有门店的POS或PAD机器等设备注册基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DeviceRegInfo'
GO
/****** Object:  Table [dbo].[FreeGiftPurchaseList]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FreeGiftPurchaseList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GiftId] [varchar](40) NOT NULL,
	[GiftType] [smallint] NOT NULL,
	[GiftNumber] [smallint] NOT NULL,
	[BarcodeOrCategorySN] [varchar](30) NOT NULL,
	[CategoryGrade] [smallint] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_FreeGiftPurchaseList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchaseList', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'买赠ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchaseList', @level2type=N'COLUMN',@level2name=N'GiftId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠品分类（1:单品、2:系列）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchaseList', @level2type=N'COLUMN',@level2name=N'GiftType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送件数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchaseList', @level2type=N'COLUMN',@level2name=N'GiftNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码或系列 ID（-1:没有 ，0: 不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchaseList', @level2type=N'COLUMN',@level2name=N'BarcodeOrCategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别层级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchaseList', @level2type=N'COLUMN',@level2name=N'CategoryGrade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'买赠赠品清单
用于管理本系统的 商品 买赠促销活动的赠品信息 （主表： FreeGiftPurchase）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchaseList'
GO
/****** Object:  Table [dbo].[FreeGiftPurchase]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FreeGiftPurchase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[CommodityId] [varchar](40) NOT NULL,
	[GiftId] [varchar](40) NOT NULL,
	[MinPurchaseNum] [money] NOT NULL,
	[RestrictionBuyNum] [smallint] NULL,
	[GiftType] [smallint] NOT NULL,
	[BarcodeOrCategorySN] [varchar](30) NOT NULL,
	[BrandSN] [int] NULL,
	[CategoryGrade] [smallint] NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_FreeGiftPurchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'促销 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase', @level2type=N'COLUMN',@level2name=N'CommodityId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'买赠 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase', @level2type=N'COLUMN',@level2name=N'GiftId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'起购量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase', @level2type=N'COLUMN',@level2name=N'MinPurchaseNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'每天限购次数（ 0:' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase', @level2type=N'COLUMN',@level2name=N'RestrictionBuyNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类（ 1: 单品、 2:系列）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase', @level2type=N'COLUMN',@level2name=N'GiftType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'条码或 系列 ID （-1:没有 ，0: 不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase', @level2type=N'COLUMN',@level2name=N'BarcodeOrCategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌 （0:不限）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase', @level2type=N'COLUMN',@level2name=N'BrandSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别层级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase', @level2type=N'COLUMN',@level2name=N'CategoryGrade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'买赠促销
用于管理本系统的商品买赠促销活动信息（主表： Bundling）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FreeGiftPurchase'
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeedbackId] [varchar](40) NOT NULL,
	[MemberId] [varchar](40) NOT NULL,
	[Content] [nvarchar](1000) NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedbacks', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回访Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedbacks', @level2type=N'COLUMN',@level2name=N'FeedbackId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedbacks', @level2type=N'COLUMN',@level2name=N'MemberId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回访信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedbacks', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedbacks', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedbacks', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'售后回访表
用于记录会员回访信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedbacks'
GO
/****** Object:  UserDefinedTableType [dbo].[WipeZero_BulkType]    Script Date: 04/12/2017 14:11:40 ******/
CREATE TYPE [dbo].[WipeZero_BulkType] AS TABLE(
	[Id] [int] NOT NULL,
	[CompanyId] [int] NULL,
	[PaySN] [varchar](20) NULL,
	[Number] [money] NULL,
	[sync_update_peer_timestamp] [bigint] NULL,
	[sync_update_peer_key] [int] NULL,
	[sync_create_peer_timestamp] [bigint] NULL,
	[sync_create_peer_key] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[WipeZero]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WipeZero](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PaySN] [varchar](50) NOT NULL,
	[Number] [money] NOT NULL,
	[SyncItemId] [uniqueidentifier] NOT NULL,
	[SyncItemVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK__WipeZero__3214EC073CA9F2BB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WipeZero', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WipeZero', @level2type=N'COLUMN',@level2name=N'PaySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WipeZero', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'摸零表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WipeZero'
GO
/****** Object:  Table [dbo].[WeighingSet]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WeighingSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Code] [varchar](10) NULL,
	[Title] [varchar](50) NULL,
	[Type] [int] NULL,
	[Serie] [varchar](20) NULL,
	[IP] [varchar](20) NULL,
	[Port] [varchar](10) NULL,
 CONSTRAINT [PK_WeighingSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_WeighingSet_Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_WeighingSet_IP] UNIQUE NONCLUSTERED 
(
	[IP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'秤号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeighingSet', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeighingSet', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeighingSet', @level2type=N'COLUMN',@level2name=N'Serie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeighingSet', @level2type=N'COLUMN',@level2name=N'Port'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子秤配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeighingSet'
GO
/****** Object:  Table [dbo].[WeighingBatch]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WeighingBatch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Communication] [smallint] NOT NULL,
	[BatchNo] [varchar](30) NOT NULL,
	[StoreId] [varchar](5) NULL,
	[Details] [varchar](max) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
 CONSTRAINT [PK_WeighingBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-导出,2-传秤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeighingBatch', @level2type=N'COLUMN',@level2name=N'Communication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'已选清单，以逗号隔开' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeighingBatch', @level2type=N'COLUMN',@level2name=N'Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'传秤日志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WeighingBatch'
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[StoreId] [varchar](5) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[CategorySN] [nvarchar](500) NOT NULL,
	[State] [smallint] NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[CreateUID] [varchar](40) NOT NULL,
	[Type] [smallint] NOT NULL,
	[AdminState] [smallint] NULL,
 CONSTRAINT [PK_WAREHOUSE] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仓库（门店）编号（全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'仓库名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存储品类ID（多个ID以,号间隔）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse', @level2type=N'COLUMN',@level2name=N'CategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0:停用、1:可用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse', @level2type=N'COLUMN',@level2name=N'CreateDT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（ 1:门店、 2: 仓库 ）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有仓库 和门店基本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Warehouse'
GO
/****** Object:  Table [dbo].[TreasuryLocks]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TreasuryLocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[LockStoreID] [varchar](3) NOT NULL,
	[LockCategorySN] [nvarchar](500) NULL,
	[CheckBatch] [varchar](30) NOT NULL,
	[LockDate] [datetime] NOT NULL,
	[LockUID] [varchar](40) NOT NULL,
	[State] [smallint] NOT NULL,
	[VerifierUID] [varchar](40) NULL,
	[CreateUID] [varchar](40) NULL,
 CONSTRAINT [PK_TREASURYLOCKS] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'锁定仓库ID（门店ID）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks', @level2type=N'COLUMN',@level2name=N'LockStoreID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'锁定品类ID（多个ID以,号间隔）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks', @level2type=N'COLUMN',@level2name=N'LockCategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' 盘点批次（ 自动 生 成， 全局唯一）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks', @level2type=N'COLUMN',@level2name=N'CheckBatch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'锁定日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks', @level2type=N'COLUMN',@level2name=N'LockDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'锁定人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks', @level2type=N'COLUMN',@level2name=N'LockUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批状态（0:未审、1:已审）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks', @level2type=N'COLUMN',@level2name=N'VerifierUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人UID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks', @level2type=N'COLUMN',@level2name=N'CreateUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用于管理本系统的所有库存货品盘点信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TreasuryLocks'
GO
/****** Object:  StoredProcedure [dbo].[Sys_guid]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-04-27
-- Description:	输出 GUID
-- Example：declare @guid varchar(32);
--			exec [Sys_guid] @guid output
--			select @guid;
-- =============================================
CREATE PROCEDURE [dbo].[Sys_guid] 
	@guid varchar(32) output
AS
BEGIN
	SET NOCOUNT ON;

    set @guid=replace(NewID(),'-','');
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_GenerateNewProductCodeTest]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-09-24
-- Description:	根据指定产品种类生成新的商品主条码
-- =============================================
CREATE PROCEDURE [dbo].[Sys_GenerateNewProductCodeTest]
	@CompanyId  Int,
	@CategorySN INT,
	@ValuationType SMALLINT=1	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @PSN Int;
	DECLARE @NextSN Int;
	DECLARE @Grade SmallInt;
	DECLARE @NewCode Varchar(10);
	
	DECLARE @_code Varchar(6);
	DECLARE @code Varchar(30);

	IF (@ValuationType=2)
	BEGIN
		--针对散称商品生成内部自编码		
		SELECT TOP 1 @code=ISNULL([Barcode],'0')
		FROM dbo.ProductRecord
		WHERE CompanyId=@CompanyId AND ISNUMERIC(Barcode)=1 AND LEN(Barcode)=5
		ORDER BY [Barcode] DESC;
		
		IF(CAST(@code as int) < 10000)
		BEGIN
			--10000起始
			SET @code='10000';
		END

		SET @NewCode=CAST(@code as int)+1;
		
		SELECT ISNULL(@NewCode,'10001');
	END
	ELSE
	BEGIN
		--针对计件商品生成主条码
		--不存在下级，则新生成条码
		IF NOT EXISTS (SELECT * FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and CategoryPSN=@CategorySN)
		BEGIN
			--当前
			DECLARE @SN Int;
			SELECT @SN=[CategorySN],@PSN=[CategoryPSN],@Grade=[Grade]
					,@NewCode=RIGHT('00'+CAST([CategoryCode] as varchar(2)),2)
			FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and [CategorySN]=@CategorySN;

			--第二级
			IF(@Grade=2 AND (NOT EXISTS (SELECT * FROM dbo.ProductCategory WHERE CategoryPSN=@SN)))
			BEGIN
				SELECT @NewCode=(RIGHT('00'+CAST([CategoryCode] as varchar(2)),2)+@NewCode)
				FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and CategorySN=@PSN;
				SET @NewCode=@NewCode+'00';
			END
			ELSE IF(@Grade=3 AND (NOT EXISTS (SELECT * FROM dbo.ProductCategory WHERE CategoryPSN=@SN)))
			BEGIN 
				--第三级
				SELECT @NewCode=(RIGHT('00'+CAST([CategoryCode] as varchar(2)),2)+@NewCode),@PSN=[CategoryPSN]
				FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and CategorySN=@PSN;
				
				SELECT @NewCode=(RIGHT('00'+CAST([CategoryCode] as varchar(2)),2)+@NewCode)
				FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and CategorySN=@PSN;
			END
			ELSE
			BEGIN
				SET @NewCode=LEFT(@NewCode+'000000',6);
			END
			--同级商品
			SET @_code=@NewCode;
			SET @code='0001';
			--是否在主条码中存在
			IF EXISTS (SELECT * FROM dbo.ProductRecord WHERE CompanyId=@CompanyId and CategorySN=@SN
						AND ISNUMERIC(Barcode)=1 AND LEN(Barcode)=10 AND LEFT(Barcode,6)=@NewCode)
			BEGIN
				SET @code=(SELECT TOP 1 CAST(Barcode as INT)+1 FROM 
							(SELECT RIGHT(Barcode,4) AS [Barcode] FROM dbo.ProductRecord
								WHERE CompanyId=@CompanyId and CategorySN=@SN AND ISNUMERIC(Barcode)=1
								AND LEN(Barcode)=10 AND LEFT(Barcode,6)=@NewCode) AS tmp
							ORDER BY Barcode DESC);
				SET @code=RIGHT('0000'+@code,4);
			END
			SET @NewCode=@NewCode+@code;
			
			--
			IF EXISTS (SELECT * FROM dbo.ProductRecord WHERE CompanyId=@CompanyId and ISNUMERIC(Barcode)=1 AND Barcode=@NewCode)
			BEGIN
				SET @code=(SELECT TOP 1 CAST(Barcode as INT)+1 FROM 
							(SELECT RIGHT(Barcode,4) AS [Barcode] FROM dbo.ProductRecord
								WHERE CompanyId=@CompanyId and ISNUMERIC(Barcode)=1 AND LEN(Barcode)=10
								AND LEFT(Barcode,6)=@_code) AS tmp
							ORDER BY Barcode DESC);
				SET @code=RIGHT('0000'+@code,4);
			END		
			SET @NewCode=@_code+@code;
			
			--是否在多码中存在
			if exists (select * from dbo.ProductRecord where CompanyId=@CompanyId and LEN(barcodes)>1 or LEN(BarcodeMult)>1)
			begin
				declare @_codes nvarchar(max);
				set @_codes='';

				select @_codes=@_codes + ','+Barcodes from ProductRecord where CompanyId=@CompanyId and len(barcodes)>1;

				IF(CHARINDEX(',',@_codes)=1)
				BEGIN
					SET @_codes=SUBSTRING(@_codes,2,LEN(@_codes)-0);
				END
				IF(SUBSTRING(@_codes,LEN(@_codes),1)=',')
				BEGIN
					SET @_codes=SUBSTRING(@_codes,1,LEN(@_codes)-1);
				END
					
				select @_codes=@_codes + ','+BarcodeMult from ProductRecord where CompanyId=@CompanyId and len(BarcodeMult)>1;
				
				declare @exists char(1);
				select @exists = dbo.Comm_F_NumIsInGroup(@NewCode,@_codes);
				
				if(@exists>0)
				begin
					SET @code= CAST(@code as INT)+1;
				end
			end
		END
		--ELSE
		--BEGIN
		--	--存在下级，则不让在本级生成条码
		--	SET @NewCode='0000000000';
		--END
		
		SELECT ISNULL(@NewCode,'0000000000');
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_GenerateNewProductCode]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-09-24
-- Description:	根据指定产品种类生成新的商品主条码
-- =============================================
CREATE PROCEDURE [dbo].[Sys_GenerateNewProductCode]
	@CompanyId  Int,
	@CategorySN INT,
	@ValuationType SMALLINT=1	
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @PSN Int;
	DECLARE @NextSN Int;
	DECLARE @Grade SmallInt;
	DECLARE @NewCode Varchar(10);
	
	DECLARE @_code Varchar(6);
	DECLARE @code Varchar(30);

	IF (@ValuationType=2)
	BEGIN
		--针对散称商品生成内部自编码		
		SELECT TOP 1 @code=ISNULL([Barcode],'0')
		FROM dbo.ProductRecord
		WHERE CompanyId=@CompanyId AND ISNUMERIC(Barcode)=1 AND LEN(Barcode)=5
		ORDER BY [Barcode] DESC;
		
		IF(CAST(@code as int) < 10000)
		BEGIN
			--10000起始
			SET @code='10000';
		END

		SET @NewCode=CAST(@code as int)+1;
		
		SELECT ISNULL(@NewCode,'10001');
	END
	ELSE
	BEGIN
		--针对计件商品生成主条码
		--不存在下级，则新生成条码
		--IF NOT EXISTS (SELECT * FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and CategoryPSN=@CategorySN)
		--BEGIN
			--当前
			DECLARE @SN Int;
			SELECT @SN=[CategorySN],@PSN=[CategoryPSN],@Grade=[Grade]
					,@NewCode=RIGHT('00'+CAST([CategoryCode] as varchar(2)),2)
			FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and [CategorySN]=@CategorySN;

			--第二级
			IF(@Grade=2 AND (NOT EXISTS (SELECT * FROM dbo.ProductCategory WHERE CategoryPSN=@SN)))
			BEGIN
				SELECT @NewCode=(RIGHT('00'+CAST([CategoryCode] as varchar(2)),2)+@NewCode)
				FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and CategorySN=@PSN;
				SET @NewCode=@NewCode+'00';
			END
			ELSE IF(@Grade=3 AND (NOT EXISTS (SELECT * FROM dbo.ProductCategory WHERE CategoryPSN=@SN)))
			BEGIN 
				--第三级
				SELECT @NewCode=(RIGHT('00'+CAST([CategoryCode] as varchar(2)),2)+@NewCode),@PSN=[CategoryPSN]
				FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and CategorySN=@PSN;
				
				SELECT @NewCode=(RIGHT('00'+CAST([CategoryCode] as varchar(2)),2)+@NewCode)
				FROM dbo.ProductCategory WHERE CompanyId=@CompanyId and CategorySN=@PSN;
			END
			ELSE
			BEGIN
				SET @NewCode=LEFT(@NewCode+'000000',6);
			END
			--同级商品
			SET @_code=@NewCode;
			SET @code='0001';
			--是否在主条码中存在
			IF EXISTS (SELECT * FROM dbo.ProductRecord WHERE CompanyId=@CompanyId and CategorySN=@SN
						AND ISNUMERIC(Barcode)=1 AND LEN(Barcode)=10 AND LEFT(Barcode,6)=@NewCode)
			BEGIN
				SET @code=(SELECT TOP 1 CAST(Barcode as INT)+1 FROM 
							(SELECT RIGHT(Barcode,4) AS [Barcode] FROM dbo.ProductRecord
								WHERE CompanyId=@CompanyId and CategorySN=@SN AND ISNUMERIC(Barcode)=1
								AND LEN(Barcode)=10 AND LEFT(Barcode,6)=@NewCode) AS tmp
							ORDER BY Barcode DESC);
				SET @code=RIGHT('0000'+@code,4);
			END
			SET @NewCode=@NewCode+@code;
			
			--
			IF EXISTS (SELECT * FROM dbo.ProductRecord WHERE CompanyId=@CompanyId and ISNUMERIC(Barcode)=1 AND Barcode=@NewCode)
			BEGIN
				SET @code=(SELECT TOP 1 CAST(Barcode as INT)+1 FROM 
							(SELECT RIGHT(Barcode,4) AS [Barcode] FROM dbo.ProductRecord
								WHERE CompanyId=@CompanyId and ISNUMERIC(Barcode)=1 AND LEN(Barcode)=10
								AND LEFT(Barcode,6)=@_code) AS tmp
							ORDER BY Barcode DESC);
				SET @code=RIGHT('0000'+@code,4);
			END		
			SET @NewCode=@_code+@code;
			
			--是否在多码中存在
			if exists (select * from dbo.ProductRecord where CompanyId=@CompanyId and LEN(barcodes)>1 or LEN(BarcodeMult)>1)
			begin
				declare @_codes nvarchar(max);
				set @_codes='';

				select @_codes=@_codes + ','+Barcodes from ProductRecord where CompanyId=@CompanyId and len(barcodes)>1;

				IF(CHARINDEX(',',@_codes)=1)
				BEGIN
					SET @_codes=SUBSTRING(@_codes,2,LEN(@_codes)-0);
				END
				IF(SUBSTRING(@_codes,LEN(@_codes),1)=',')
				BEGIN
					SET @_codes=SUBSTRING(@_codes,1,LEN(@_codes)-1);
				END
					
				select @_codes=@_codes + ','+BarcodeMult from ProductRecord where CompanyId=@CompanyId and len(BarcodeMult)>1;
				
				declare @exists char(1);
				select @exists = dbo.Comm_F_NumIsInGroup(@NewCode,@_codes);
				
				if(@exists>0)
				begin
					SET @code= CAST(@code as INT)+1;
				end
			end
		--END
		--ELSE
		--BEGIN
		--	--存在下级，则不让在本级生成条码
		--	SET @NewCode='0000000000';
		--END
		
		SELECT ISNULL(@NewCode,'0000000000');
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_GenerateNewBundlingCode]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-10-13
-- Description:	生成新的捆绑商品条码
-- =============================================
CREATE PROCEDURE [dbo].[Sys_GenerateNewBundlingCode] 
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Num Varchar(4);
	DECLARE @NewCode Varchar(12);
	SET @NewCode='04'+CONVERT(varchar(6),getdate(),12);
	
	IF EXISTS (select * from Bundling where left(NewBarcode,8)=@NewCode)
	BEGIN
		SET @Num=(select top 1 cast(right(NewBarcode,4) as int)+1
					from Bundling where left(NewBarcode,8)=@NewCode order by NewBarcode desc);
	END
	ELSE
	BEGIN
		SET @Num='0001';
	END
	
	SET @NewCode=@NewCode+RIGHT('0000'+@Num,4);
	
	SELECT ISNULL(@NewCode,'000000000000');
END
GO
/****** Object:  UserDefinedFunction [dbo].[Sys_F_StoreRolesByUID]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-11
-- Description:	根据用户UID获取该用户的门店角色信息
-- =============================================
CREATE FUNCTION [dbo].[Sys_F_StoreRolesByUID]
(
	@UID	VARCHAR(50)
)
RETURNS Nvarchar(50)
AS
BEGIN
	DECLARE @result VARCHAR(max);
	DECLARE @OperateAuth VARCHAR(max);
	DECLARE @companyId INT;

	SET @result='';
	
	SELECT @OperateAuth = OperateAuth,@companyId=CompanyId FROM dbo.SysStoreUserInfo
	WHERE [UID]=@UID;
	
	IF(LEN(@OperateAuth)>0)
	BEGIN
		SELECT @result=@result+','+ b.Title
		FROM (SELECT DISTINCT LEFT(Value,charindex(',',Value,1)-1) Value FROM dbo.SplitString(@OperateAuth,'|',1)) a
		JOIN dbo.Warehouse b ON b.StoreId=Value AND b.CompanyId=@companyId
		WHERE LEN(a.Value)>0
		
		IF(LEN(@result)>0)
		BEGIN
			SET @result = STUFF(@result,1,1,'');
		END
	END
	
	RETURN ISNULL(@result,'');
END
GO
/****** Object:  StoredProcedure [dbo].[test_List]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_List]
	@CurrentPage	Int,			--当前页	@PageSize		Int				--页大小
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Sql Nvarchar(max);
	SET @Sql=N'SELECT (ROW_NUMBER() OVER ( ORDER BY [CreateDT] DESC)) AS RSNO ,*  FROM dbo.SysLog';
	
	--将业务SQL 传入分页处理
	exec Comm_PageList @Sql, @CurrentPage, @PageSize;
	
END
GO
/****** Object:  View [dbo].[Vw_MembershipCardPayDetails]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_MembershipCardPayDetails]
AS
SELECT     dbo.ConsumptionPayment.PaySN, dbo.SaleOrders.StoreId, dbo.SaleOrders.CreateDT, dbo.ConsumptionPayment.Amount AS Price, 
                      dbo.CardInfo.CardName AS CardType, dbo.MembershipCard.CardSN, dbo.Warehouse.Title AS StoreTitle, dbo.ConsumptionPayment.Id, 
                      dbo.SaleOrders.CustomOrderSn AS OrderSN, dbo.ConsumptionPayment.CompanyId, dbo.CardInfo.CardTypeId
FROM         dbo.ConsumptionPayment INNER JOIN
                      dbo.SaleOrders ON dbo.ConsumptionPayment.PaySN = dbo.SaleOrders.PaySN AND dbo.ConsumptionPayment.CompanyId = dbo.SaleOrders.CompanyId INNER JOIN
                      dbo.MembershipCard ON dbo.ConsumptionPayment.CardNo = dbo.MembershipCard.CardSN AND 
                      dbo.ConsumptionPayment.CompanyId = dbo.MembershipCard.CompanyId INNER JOIN
                      dbo.CardInfo ON dbo.MembershipCard.CardTypeId = dbo.CardInfo.CardTypeId AND dbo.MembershipCard.CompanyId = dbo.CardInfo.CompanyId INNER JOIN
                      dbo.Warehouse ON dbo.SaleOrders.StoreId = dbo.Warehouse.StoreId AND dbo.SaleOrders.CompanyId = dbo.Warehouse.CompanyId
WHERE     (dbo.ConsumptionPayment.ApiCode = 16)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[19] 4[12] 2[30] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ConsumptionPayment"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SaleOrders"
            Begin Extent = 
               Top = 13
               Left = 568
               Bottom = 132
               Right = 798
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "MembershipCard"
            Begin Extent = 
               Top = 199
               Left = 483
               Bottom = 318
               Right = 652
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CardInfo"
            Begin Extent = 
               Top = 202
               Left = 237
               Bottom = 321
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Warehouse"
            Begin Extent = 
               Top = 166
               Left = 828
               Bottom = 285
               Right = 975
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2325
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin Cri' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_MembershipCardPayDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'teriaPane = 
      Begin ColumnWidths = 11
         Column = 1695
         Alias = 900
         Table = 2460
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_MembershipCardPayDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_MembershipCardPayDetails'
GO
/****** Object:  View [dbo].[Vw_HouseMove]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*调拨，用于统计*/
CREATE VIEW [dbo].[Vw_HouseMove]
AS
SELECT a.CompanyId,a.OutStoreId,a.InStoreId,ISNULL(a.ActualDT,a.CreateDT) ActualDT,a.CreateUID,b.Barcode,b.ActualQuantity,b.DeliveryQuantity,b.BuyPrice,b.SysPrice,b.State,'门店调拨' Channel FROM dbo.HouseMove a,dbo.HouseMoveList b WHERE a.MoveId=b.MoveId AND b.State IN(2,4)
UNION ALL
SELECT a.CompanyId,a.StoreId,a.ApplyOrgId,a.VerifyTime,a.OperatorUID,b.Barcode,b.OutboundNumber,b.OutboundNumber,b.BuyPrice,b.SysPrice,4,'总部调拨' FROM OutboundGoods a,dbo.OutboundList b WHERE a.OutboundId=b.OutboundId AND a.Channel=0 AND a.State=1 AND a.OutboundType=1
GO
/****** Object:  View [dbo].[Vw_StockTaking_Log]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_StockTaking_Log] AS
				SELECT * FROM(
				SELECT   ROW_NUMBER() OVER ( PARTITION BY l.companyid, l.CheckBatch,l.Barcode ORDER BY l.State DESC,l.CreateDT DESC ) row ,
                            id,CheckBatch ,Barcode ,State ,
                            CASE State
                              WHEN 1 THEN Number
                              ELSE ( SELECT SUM(Number)
                                     FROM   StockTakingLog
                                     WHERE  CheckBatch = l.CheckBatch
                                            AND Barcode = l.Barcode
                                            AND companyid = l.companyid
                                            AND State = 0
                                     GROUP BY companyid,CheckBatch,Barcode
                                   )
                            END number ,
                            CheckUID ,
                            CreateUID ,
                            l.ActualDate,
                            l.CreateDT,
							l.Source,
                            l.SysPrice,
                            (SELECT SUM(Number) FROM StockTakingLog WHERE CompanyId=l.CompanyId AND CheckBatch=l.CheckBatch AND Barcode=l.Barcode AND State=0) AS InitNumber,
                            CompanyId
                   FROM     dbo.StockTakingLog l) t WHERE t.row=1
GO
/****** Object:  UserDefinedFunction [dbo].[F_UserNameById]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-05-28
-- Description:	根据用户UID获取对应的用户姓名
-- =============================================
CREATE FUNCTION [dbo].[F_UserNameById]
(
	@GUID	Varchar(40)
)
RETURNS Nvarchar(50)
AS
BEGIN
	
	DECLARE @Name Nvarchar(50);
	SELECT @Name=[FullName] FROM dbo.SysUserInfo WHERE UId=@GUID;
	RETURN ISNULL(@Name,'');

END
GO
/****** Object:  StoredProcedure [dbo].[DataSyncSaleOrders]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<余雄文>
-- Create date: <20160114>
-- Description:	<数据同步专用SaleOrders>
-- =============================================
CREATE PROCEDURE [dbo].[DataSyncSaleOrders]
	-- Add the parameters for the stored procedure here
@storeId varchar(3),
@expire  int
AS
BEGIN 
   declare @expireDate datetime;
   select @expireDate = DATEADD(MONTH,-@expire,getdate())
   select * from SaleOrders a where  a.StoreId = @storeId and a.CreateDT>=@expireDate
END
GO
/****** Object:  StoredProcedure [dbo].[Auto_NoBusinessDataBalance_Day]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-04-22
-- Description: 每日结余（系统自动调用，仅限当天无业务来往的商品）
-- =============================================
CREATE PROCEDURE [dbo].[Auto_NoBusinessDataBalance_Day]
	@day varchar(10)=''
AS
BEGIN
	SET NOCOUNT ON;

	if(@day='' or @day is null)
	begin
		set @day = CONVERT(varchar(10),getdate(),120);
	END
    
    --新增不存在的结余
	INSERT INTO dbo.InventoryBalance
	        ( CompanyId ,
	          StoreId ,
	          Barcode ,
	          Number ,
	          BalanceDate ,
	          SaleAveragePrice ,
	          SaleAmount ,
	          StockAmount
	        )
	SELECT t.CompanyId,t.StoreId,t.Barcode,t.Number,@day,t.SaleAveragePrice,t.SaleAmount,t.StockAmount from(
				SELECT *,ROW_NUMBER() OVER(PARTITION BY CompanyId,StoreId,Barcode ORDER BY BalanceDate desc) row FROM InventoryBalance i
				WHERE BalanceDate<=@day AND not EXISTS(SELECT 1 FROM dbo.InventoryBalance WHERE CompanyId=i.CompanyId AND StoreId=i.StoreId AND Barcode=i.Barcode AND BalanceDate=@day)
			) t WHERE t.row=1;
			
	--更新当天已存在的结余
	;with ib as(
		SELECT t.CompanyId,t.StoreId,t.Barcode,t.Number,t.SaleAveragePrice,t.SaleAmount,t.StockAmount
		from (SELECT *,ROW_NUMBER() OVER (PARTITION BY CompanyId,StoreId,Barcode ORDER BY BalanceDate desc) row
				FROM InventoryBalance i
				WHERE BalanceDate=@day
				AND EXISTS(SELECT 1 FROM dbo.InventoryBalance
					WHERE CompanyId=i.CompanyId AND StoreId=i.StoreId AND Barcode=i.Barcode AND BalanceDate=@day)
				) t WHERE t.[row]=1
	) update InventoryBalance
	set InventoryBalance.Number=ib.Number
		,InventoryBalance.SaleAveragePrice=ib.SaleAveragePrice
		,InventoryBalance.SaleAmount=ib.SaleAmount
		,InventoryBalance.StockAmount=ib.StockAmount
	from ib
	where InventoryBalance.CompanyId=ib.CompanyId
	and InventoryBalance.StoreId=ib.StoreId
	and InventoryBalance.Barcode=ib.Barcode
	and InventoryBalance.BalanceDate=@day;

END
GO
/****** Object:  StoredProcedure [dbo].[Auto_CouponEndState]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		陈雅宾
-- Create date: 2016-09-12
-- Description:	根据优惠券有效期截止时间，将优惠券设置为已过期状态
-- =============================================
CREATE PROCEDURE [dbo].[Auto_CouponEndState]
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @now VARCHAR(10);
    set @now=convert(varchar(10),getdate(),120);
    update [dbo].[MakingCouponCard] set [State]=4 where [State]!=5 AND ExpiryEnd<@now;
    
END
GO
/****** Object:  StoredProcedure [dbo].[Auto_ContractEndState]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		陈雅宾
-- Create date: 2015-08-12
-- Description:	根据合同结束时间，将合同设置为结束状态
-- =============================================
CREATE PROCEDURE [dbo].[Auto_ContractEndState]
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @now VARCHAR(10);
    set @now=convert(varchar(10),getdate(),120);
    update [dbo].[Contract] set [State]=4 where [State]=2 and EndDate<@now;
    
END
GO
/****** Object:  StoredProcedure [dbo].[Auto_ChangePriceState]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2015-12-30
-- Description:	自动更新变价状态为无效
-- =============================================
CREATE PROCEDURE [dbo].[Auto_ChangePriceState]
AS
BEGIN
SET NOCOUNT ON;

	--更新有效
	UPDATE dbo.ProductChangePriceList SET [State]=1 WHERE State=0 and StartDate<=GETDATE() AND (GETDATE()<DATEADD(DAY,1,EndDate) OR ISNULL(EndDate,'')='')
	AND EXISTS(SELECT 1 FROM dbo.ProductChangePrice WHERE ChangePriceId=ProductChangePriceList.ChangePriceId AND State=1)
	--更新失效
	UPDATE dbo.ProductChangePriceList SET [State]=0 WHERE State=1 and ISNULL(EndDate,'')<>'' AND EndDate<CONVERT(VARCHAR(20),GETDATE(),23)
	AND EXISTS(SELECT 1 FROM dbo.ProductChangePrice WHERE ChangePriceId=ProductChangePriceList.ChangePriceId AND State=1)
END
GO
/****** Object:  StoredProcedure [dbo].[OutInNumDetails]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-06-15>
-- Description:	<时间点内出入库数量集合,,>
-- =============================================
CREATE PROCEDURE [dbo].[OutInNumDetails]
	-- Add the parameters for the stored procedure here
	@barcodes VARCHAR(max),
	@TakingTime VARCHAR(20), --锁库时间
	@storeId VARCHAR(20),
	@companyId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @time DATETIME;
	SET @time=cast(@TakingTime AS DATETIME)
	SET NOCOUNT ON;
	WITH x AS(
		--入库
		SELECT barcode,Number,StoreId,CreateDT,1 Flag,'总部入库' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=1
		UNION ALL
		--调拨入
		SELECT barcode,Number,StoreId,CreateDT,1 Flag,'调拨入' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=3
		UNION ALL
		--销售退换
		SELECT barcode,Number,StoreId,CreateDT,1 Flag,'门店售后退换货入库' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=5
		UNION ALL
		--门店收货
		SELECT barcode,Number,StoreId,CreateDT,1 Flag,'门店收货' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=11
		UNION ALL
		SELECT barcode,Number,StoreId,CreateDT,1 Flag,'销售组合商品入库' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=18
		UNION ALL
		SELECT barcode,Number,StoreId,CreateDT,1 Flag,'拆分子商品入库' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=7
		UNION ALL
		--报损出
		SELECT barcode,Number,StoreId,CreateDT,2 Flag,'报损出库' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=16
		UNION ALL
		--出库
		SELECT barcode,Number,StoreId,CreateDT,2 Flag,'总部出库' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=2
		UNION ALL
		--调拨出
		SELECT barcode,Number,StoreId,CreateDT,2 Flag,'调拨出库' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=4
		UNION ALL
		--门店售后换货出库
		SELECT barcode,Number,StoreId,CreateDT,2 Flag,'门店售后换货出库' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=6
		UNION ALL
		--正常销售
		SELECT barcode,Number,StoreId,CreateDT,2 Flag,'正常销售' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=9
		UNION ALL
        SELECT barcode,Number,StoreId,CreateDT,2 Flag,'销售组合商品消减' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=10
		UNION ALL
        SELECT barcode,Number,StoreId,CreateDT,2 Flag,'总部批发出库' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=13
		UNION ALL
        SELECT barcode,Number,StoreId,CreateDT,2 Flag,'总部退货' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=14
		UNION ALL
        SELECT barcode,Number,StoreId,CreateDT,2 Flag,'拆分父商品消减' Type  FROM dbo.InventoryRecord WHERE CompanyId=@companyId AND Source=8

	)
		SELECT *,CASE WHEN Flag=2 THEN -Number ELSE Number END Num FROM x
		WHERE x.StoreId=@storeId and EXISTS( SELECT 1 FROM dbo.SplitString(@barcodes,',',1) WHERE Value=x.Barcode) AND x.CreateDT>@time 
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_SysPriceByBarcode]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2015-09-23
-- Description:	获取对应售价
-- =============================================
CREATE FUNCTION [dbo].[F_SysPriceByBarcode]
(
	@storeId	Varchar(3),
	@barcode VARCHAR(30),
	@companyId int
)
RETURNS MONEY
AS
BEGIN
	DECLARE @price MONEY;
	IF(isnull(@storeId,'')<>'')
	BEGIN
		declare @curdt varchar(10); set @curdt=convert(varchar(10),GETDATE(),120);

		SELECT @price=b.CurSysPrice FROM dbo.ProductChangePrice a
			INNER join dbo.ProductChangePriceList b ON a.Id=b.ChangePriceId and a.CompanyId = @companyId
		 WHERE (dbo.[Comm_F_NumIsInGroup](@storeId,a.StoreId)=1 OR dbo.[Comm_F_NumIsInGroup]('-1',a.StoreId)=1)
				AND (a.[State]=1) AND (b.[State]=1)
				AND (b.StartDate<=@curdt AND (b.EndDate>=@curdt OR isnull(b.EndDate,'')=''))
				AND b.Barcode=@barcode
				AND EXISTS(SELECT 1 FROM dbo.ProductRecord WHERE Barcode=@barcode);-- AND SupplierId=a.SupplierId);
		 
		IF @price IS NULL
		BEGIN
			SELECT @price=Price FROM dbo.ProductMultPrice
			WHERE StoreId=@storeId AND Barcode=@barcode and CompanyId = @companyId;
		END
	end
	IF @price IS NULL
	BEGIN
		SELECT @price=SysPrice FROM dbo.ProductRecord WHERE Barcode=@barcode and CompanyId = @companyId;
	end
	RETURN @price;
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_SupplierNameById]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-05-28
-- Description:	根据供应商ID获取对应的供应商简称
-- =============================================
CREATE FUNCTION [dbo].[F_SupplierNameById]
(
	@GUID	Varchar(40)
)
RETURNS Nvarchar(50)
AS
BEGIN
	
	DECLARE @Title Nvarchar(50);
	SELECT @Title=[Title] FROM dbo.Supplier WHERE Id=@GUID;
	RETURN ISNULL(@Title,'');

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_StoreNameById]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-05-28
-- Description:	根据门店（仓库）ID获取对应的名称
-- =============================================
CREATE FUNCTION [dbo].[F_StoreNameById]
(
	@GUID	Varchar(40),
	@companyId int
)
RETURNS Nvarchar(50)
AS
BEGIN
	
	DECLARE @Name Nvarchar(50);
	SELECT @Name=[Title] FROM dbo.Warehouse WHERE  CompanyId=@companyId and StoreId=@GUID;
	RETURN ISNULL(@Name,'');

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_StockLockValidMsg]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2015-12-19
-- Description:	验证锁库时提示
-- =============================================
CREATE FUNCTION [dbo].[F_StockLockValidMsg]
(
	-- Add the parameters for the function here
	@storeId VARCHAR(20),
	@companyId int
)
RETURNS VARCHAR(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @count int
	--入库
	SELECT @count=COUNT(*) FROM dbo.InboundGoods WHERE StoreId=@storeId AND companyid=@companyId AND State=0
	IF(@count>0)
		RETURN '该门店下存在待验入库单';
	SELECT @count=COUNT(*) FROM dbo.OutboundGoods WHERE StoreId=@storeId AND companyid=@companyId AND Channel=0 AND State=0
	IF(@count>0)
		RETURN '该门店下存在待审出库单';
	SELECT @count=COUNT(*) FROM dbo.OutboundGoods WHERE StoreId=@storeId AND companyid=@companyId AND Channel=1 AND State=0
	IF(@count>0)
		RETURN '该门店下存在待审批发单';
	SELECT @count=COUNT(*) FROM dbo.BreakageGoods WHERE StoreId=@storeId AND companyid=@companyId AND State=0
	IF(@count>0)
		RETURN '该门店下存在待审批报损单';
	SELECT @count=COUNT(*) FROM dbo.CommodityReturns WHERE StoreId=@storeId AND companyid=@companyId AND State<>2
	IF(@count>0)
		RETURN '该门店下存在未处理退货单';
	RETURN '';
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_SaleAveragePrice]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		余雄文
-- Create date: 2015-12-28
-- Description:	获取销售均价
-- =============================================
CREATE FUNCTION [dbo].[F_SaleAveragePrice]
(
	@companyId int,
	@storeId int,
	@date date,
	@barcode varchar(50),
	@mode int	--1返回均价 2返回实际销售总额 3返回销售总量
)
RETURNS money
AS
BEGIN
  declare @endDate date
  declare @amount money
  declare @num money
  declare @result money
  select @date = ISNULL(@date,DATEadd(day ,-1,getdate()))
  set @endDate = DATEadd(day ,1,getdate())
 
  select @num = sum(a.PurchaseNumber)
		,@amount = sum(a.AveragePrice * a.PurchaseNumber)
  from SaleDetail as a
  inner join SaleOrders as b on b.PaySN=a.PaySN
  and (a.PaySN=b.PaySN)
  where (convert(varchar(10),b.CreateDT,120) between @date and @endDate)
		and (b.CompanyId=@companyId)
		and ((@storeId=0  or @storeId=-1) or b.StoreId=@storeId)
		and (a.Barcode = @barcode);		

  if (@mode = 1 and @num<> 0)
  begin
	  set @result = @amount/@num;
  end
  else if( @mode = 2)
  begin
	  set @result = @amount;
  end
	  else if @mode = 3
  begin
	  set @result = @num;
  end
  else 
  begin
	  set @result = 0;
  end
  
  return isnull(@result,0);
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_PromotionValidMsg]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<林保龙>
-- Create date: <2015-08-24>
-- Description:	<验证促销>
-- =============================================
CREATE FUNCTION [dbo].[F_PromotionValidMsg]
(
	@type CHAR(1),--类型 1-单品2-捆绑3-组合4-买赠5-满元
	@startDate VARCHAR(20),
	@barcodes VARCHAR(200),
	@categorysns VARCHAR(200)=''
)
RETURNS VARCHAR(50)
AS
BEGIN
	IF(@type='2') RETURN '';
	DECLARE @count int
	IF(LEN(@barcodes)>0)
	BEGIN
		IF(@type!='1')
		begin
		--单品验证
		SELECT @count=COUNT(*) FROM dbo.CommodityPromotion a
		INNER JOIN dbo.CommodityDiscount b ON b.CommodityId=a.Id
		INNER JOIN dbo.SplitString(@barcodes,',','') c ON b.Barcode=c.Value
		WHERE a.State!=2 and a.EndDate>=@startDate
		IF(@count>0)
			RETURN '该时间段内所选商品存在单品折扣中';
		END
		IF(@type!='2')
		begin
		--捆绑
		SELECT @count=COUNT(*) FROM dbo.CommodityPromotion a
		INNER JOIN dbo.BundlingList b ON b.CommodityId=a.Id
		INNER JOIN dbo.SplitString(@barcodes,',','') c ON b.Barcode=c.Value
		WHERE a.State!=2 and a.EndDate>=@startDate
		IF(@count>0)
			RETURN '该时间段内所选商品存在捆绑销售中';
		END
		IF(@type!='3')
		begin
		--组合
		SELECT @count=COUNT(*) FROM dbo.CommodityPromotion a
		INNER JOIN dbo.PromotionBlendList b ON b.CommodityId=a.Id
		INNER JOIN dbo.PromotionBlend d ON d.CommodityId=a.Id
		INNER JOIN dbo.SplitString(@barcodes,',','') c ON b.BarcodeOrCategorySN=c.Value
		WHERE a.State!=2 and a.EndDate>=@startDate AND b.BlendType=1 AND d.RuleType=1
		IF(@count>0)
			RETURN '该时间段内所选商品存在组合促销中';
		END
		IF(@type!='4')
		begin
		--买赠
		SELECT @count=COUNT(*) FROM dbo.CommodityPromotion a
		INNER JOIN dbo.FreeGiftPurchase b ON b.CommodityId=a.Id
		INNER JOIN dbo.SplitString(@barcodes,',','') c ON b.BarcodeOrCategorySN=c.Value
		WHERE a.State!=2 and a.EndDate>=@startDate
		IF(@count>0)
			RETURN '该时间段内所选商品存在买赠促销中';
		END
		IF(@type!='5')
		begin
		--满元
		SELECT @count=COUNT(*) FROM dbo.CommodityPromotion a
		INNER JOIN dbo.PromotionBlendList b ON b.CommodityId=a.Id
		INNER JOIN dbo.PromotionBlend d ON d.CommodityId=a.Id
		INNER JOIN dbo.SplitString(@barcodes,',','') c ON b.BarcodeOrCategorySN=c.Value
		WHERE a.State!=2 and a.EndDate>=@startDate AND b.BlendType=1 AND d.RuleType=2
		IF(@count>0)
			RETURN '该时间段内所选商品存在满元促销中';
		end
	END
	IF(LEN(@categorysns)>0)
	BEGIN
		IF(@type!='1')
		begin
		--单品验证
		SELECT @count=COUNT(*) FROM dbo.CommodityPromotion a
		INNER JOIN dbo.CommodityDiscount b ON b.CommodityId=a.Id
		INNER JOIN dbo.SplitString(@categorysns,',','') c ON b.CategorySN=CAST(c.Value AS INT)
		WHERE a.State!=2 and a.EndDate>=@startDate
		IF(@count>0)
			RETURN '该时间段内所选系列存在单品折扣中';
		END
		IF(@type!='3')
		begin
		--组合
		SELECT @count=COUNT(*) FROM dbo.CommodityPromotion a
		INNER JOIN dbo.PromotionBlendList b ON b.CommodityId=a.Id
		INNER JOIN dbo.PromotionBlend d ON d.CommodityId=a.Id
		INNER JOIN dbo.SplitString(@categorysns,',','') c ON b.BarcodeOrCategorySN=c.Value
		WHERE a.State!=2 and a.EndDate>=@startDate AND b.BlendType=2 AND d.RuleType=1
		IF(@count>0)
			RETURN '该时间段内所选系列存在组合促销中';
		end
	end
	RETURN ''
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_ProductNameBybarcode]    Script Date: 04/12/2017 14:11:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		林保龙
-- Create date: 2015-10-06
-- Description:	根据字典SN获取对应的字典名称
-- =============================================
CREATE FUNCTION [dbo].[F_ProductNameBybarcode]
(
	@barcode VARCHAR(30),
	@companyId int
)
RETURNS Nvarchar(50)
AS
BEGIN
	
	DECLARE @Title Nvarchar(50);
	SELECT @Title=[Title] FROM dbo.ProductRecord WHERE CompanyId=@companyId and Barcode=@barcode OR ','+Barcodes+',' LIKE '%,'+@barcode+',%';
	IF(@Title is null)
		BEGIN
			SELECT @Title=[Title] FROM dbo.ProductRecord WHERE  CompanyId=@companyId and ProductCode=@barcode;
		END
	IF(@Title is null)
		BEGIN
			SELECT @Title=ISNULL([Title],'捆绑商品') FROM dbo.Bundling WHERE  CompanyId=@companyId and NewBarcode=@barcode;
		END
	RETURN ISNULL(@Title,'');

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_ProductCategoryFullDescBySN]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2016-08-10
-- Description:	获取对应类别描述
-- =============================================
CREATE FUNCTION [dbo].[F_ProductCategoryFullDescBySN]
    (
      @categorySn INT ,--当前编号
      @companyId INT
    )
RETURNS VARCHAR(100)
AS
    BEGIN
        DECLARE @title VARCHAR(30)='';
		DECLARE @desc VARCHAR(100)='';
		DECLARE @rtn VARCHAR(100)='';
        DECLARE @i INT=1;
        DECLARE @psn int;
        WHILE(1=1)
        BEGIN
			SELECT @title=title,@psn=CategoryPSN FROM dbo.ProductCategory WHERE CompanyId=@companyId and CategorySN=@categorySn
			SET @desc+='/'+@title;
			SET @categorySn=@psn;
			IF(ISNULL(@psn,0)<=0)
			begin
				BREAK;
			end
        END
        
		SET @desc=REVERSE(@desc);
		SET @i=CHARINDEX('/',@desc);
		WHILE(@i>0)
		BEGIN
			SET @title=SUBSTRING(@desc,1,@i-1);
			SET @rtn+='/'+REVERSE(@title);
			SET @desc=STUFF(@desc,1,@i,'');
			SET @i=CHARINDEX('/',@desc);
		END
        RETURN ISNULL(STUFF(@rtn,1,1,''),'');
    END
GO
/****** Object:  UserDefinedFunction [dbo].[F_InventoryNumForDT]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-29
-- Description:	结余库存
-- =============================================
CREATE FUNCTION [dbo].[F_InventoryNumForDT]
(
	@companyId int,
	@storeId varchar(3),
	@barcode VARCHAR(30),
	@BalanceData Date
)
RETURNS money
AS
BEGIN
	DECLARE @storeNum MONEY;
	SET @storeNum=0;
	
	SELECT @storeNum=Number
	FROM dbo.InventoryBalance
	WHERE BalanceDate=@BalanceData AND CompanyId=@companyId
		AND (StoreId=@storeId) AND Barcode=@barcode;

	RETURN isnull(@storeNum,0);
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_InventoryNum]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-25
-- Description:	实时库存
-- =============================================
CREATE FUNCTION [dbo].[F_InventoryNum]
(
	@storeId varchar(3),
	@barcode VARCHAR(30),
	@nature int,
	@companyId int
)
RETURNS money
AS
BEGIN
	DECLARE @storeNum MONEY;
	SET @storeNum=0;
	SET @storeId=ISNULL(@storeId,'');
	
	--单品
	IF(@nature=0 OR @nature=1)--组合作为单品处理
	BEGIN
		IF(@storeId='' or @storeId='-1' or @storeId=0)
		BEGIN
			--按全部门店
			SELECT @storeNum=SUM(StockNumber)
			FROM dbo.Inventory
			WHERE CompanyId=@companyId AND Barcode=@barcode;		
		END
		ELSE
		BEGIN
			--按具体门店
			SELECT @storeNum=StockNumber
			FROM dbo.Inventory
			WHERE CompanyId=@companyId AND (StoreId=@storeId) AND Barcode=@barcode;		
		END
		
		RETURN isnull(@storeNum,0);
	END
	--组合
	IF(@nature=1)
	BEGIN
		IF(@storeId='' or @storeId='-1')
		BEGIN
			--按全部门店
			select @storeNum=i.StockNumber/g.Number
			from ProductGroup as g inner join Inventory as i on i.CompanyId=g.CompanyId
			and i.Barcode=g.GroupBarcode
			where g.Barcode=@barcode;
		END
		ELSE
		BEGIN
			--按具体门店
			select @storeNum=i.StockNumber/g.Number
			from ProductGroup as g inner join Inventory as i on i.CompanyId=g.CompanyId
			and i.Barcode=g.GroupBarcode
			where (i.StoreId=@storeId) and g.Barcode=@barcode;
		END
		
		set @storeNum=floor(isnull(@storeNum,0));
		if(@storeNum>0)
		begin
			RETURN @storeNum;
		end
		return 0;
	END

	--拆分
	IF(@nature=2)
	BEGIN
		DECLARE @pStoreNum MONEY;
		
		IF(@storeId='' or @storeId='-1')
		BEGIN
			--按全部门店
			select @pStoreNum = (isnull(c.StockNumber,0)*isnull(a.SaleNum,0))
			from ProductRecord as a
			inner join Inventory as c on c.CompanyId=a.CompanyId
			and a.OldBarcode= c.Barcode
			where a.Barcode = @barcode;

			 select @storeNum = c.StockNumber
			 from Inventory as c
			 where c.CompanyId = @companyId and c.Barcode = @barcode ;				 
		END
		ELSE
		BEGIN
			--按具体门店
			select @pStoreNum = (isnull(c.StockNumber,0)*isnull(a.SaleNum,0))
			from ProductRecord as a
			inner join Inventory as c on c.CompanyId=a.CompanyId
			and a.OldBarcode= c.Barcode
			where c.StoreId=@storeId and a.Barcode = @barcode;

			 select @storeNum = c.StockNumber
			 from Inventory as c
			 where c.CompanyId = @companyId and StoreId=@storeId and c.Barcode = @barcode ;				 
		END
		
		IF(@pStoreNum>0)
		BEGIN
			set @storeNum =@storeNum+@pStoreNum;
		END
		RETURN floor(isnull(@storeNum,0));
	END

	RETURN 0;
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_InventoryBalance]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2015-12-29
-- Description:	获取结余库存数量
-- =============================================
CREATE FUNCTION [dbo].[F_InventoryBalance]
(	
	-- Add the parameters for the function here
	@storeId VARCHAR(100), 
	@barcode VARCHAR(40),
	@startDate VARCHAR(20),
	@endDate VARCHAR(20)
)
RETURNS MONEY
AS
BEGIN 
	DECLARE @number MONEY
	--累加各最后一笔
	SELECT @number=SUM(t.Number) FROM (
		SELECT ROW_NUMBER() OVER(PARTITION BY storeid ORDER BY BalanceDate desc) row,* FROM dbo.InventoryBalance WHERE Barcode=@barcode
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
		AND (@startDate='' OR @endDate='' OR (BalanceDate BETWEEN @startDate AND @endDate))
	) t WHERE row=1 GROUP BY t.Barcode
	RETURN	ISNULL(@number,0)
end
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetStockRecords]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: <2016-1-20>
-- Description:	<显示库存结余>
-- =============================================
CREATE FUNCTION [dbo].[F_GetStockRecords]
(	
	@startDate VARCHAR(20), 
	@endDate VARCHAR(20),
	@storeId VARCHAR(100),
	@barcode VARCHAR(20),
	@companyId int
)
RETURNS @temp TABLE (
storeId VARCHAR(20),
barcode VARCHAR(40),
number MONEY,
balanceDate DATE,
SaleAveragePrice MONEY,
SaleAmount MONEY,
StockAmount MONEY
)
AS
begin

select top 1 @startDate=BalanceDate
from dbo.InventoryBalance
where CompanyId=@companyId and Barcode=@barcode and BalanceDate<=@startDate order by BalanceDate desc;
if(@endDate<@startDate)
begin
	set @startDate=@endDate;
end


	-- Add the SELECT statement with parameter references here
	IF(ISNULL(@storeId,'')='')
	BEGIN
		INSERT INTO @temp
		SELECT '' StoreId,Barcode
				,SUM(Number) as Number
				,BalanceDate
				,SUM(SaleAveragePrice) as SaleAveragePrice
				,SUM(SaleAmount) as SaleAmount
				,SUM(StockAmount) as StockAmount
		FROM(
		SELECT Barcode,Number,BalanceDate,SaleAveragePrice,SaleAmount,StockAmount FROM dbo.InventoryBalance 
		WHERE (@startDate='' or BalanceDate BETWEEN @startDate AND @endDate) AND CompanyId=@companyId AND Barcode=@barcode
		) t GROUP BY t.Barcode,BalanceDate
	END
	ELSE
	BEGIN
		INSERT INTO @temp
		SELECT StoreId,Barcode,Number,BalanceDate,SaleAveragePrice,SaleAmount,StockAmount FROM(
		SELECT StoreId,Barcode,Number,BalanceDate,SaleAveragePrice,SaleAmount,StockAmount  FROM dbo.InventoryBalance 
		WHERE (@startDate='' or BalanceDate BETWEEN @startDate AND @endDate) AND CompanyId=@companyId AND Barcode=@barcode AND EXISTS( SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId)
		) t --WHERE row=1
	END
	RETURN ;
end
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetStockRecord]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-01-12>
-- Description:	<取前日库存>
-- =============================================
CREATE FUNCTION [dbo].[F_GetStockRecord]
(
	-- Add the parameters for the function here
	@date VARCHAR(20),
	@storeId VARCHAR(20),
	@barcode VARCHAR(20),
	@companyId INT
)
RETURNS MONEY
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result MONEY;
	IF(ISNULL(@date,'')='' OR @date='2015-01-01')
	BEGIN
		SET @date=CONVERT(VARCHAR(20),GETDATE(),23);
	end
	--取各门店本条码最前一条量
	IF (ISNULL(@storeId,'')='')
	BEGIN
		SELECT @result=SUM(t.Number) FROM(
			SELECT  ROW_NUMBER() OVER(PARTITION BY StoreId,Barcode ORDER BY BalanceDate DESC) row,* FROM dbo.InventoryBalance
			WHERE BalanceDate<@date AND CompanyId=@companyId AND Barcode=@barcode
		) t WHERE row=1 GROUP BY t.Barcode  
	END
	else
	BEGIN
		SELECT @result=SUM(t.Number) FROM(
			SELECT  ROW_NUMBER() OVER(PARTITION BY StoreId,Barcode ORDER BY BalanceDate DESC) row,* FROM dbo.InventoryBalance
			WHERE BalanceDate<@date  AND CompanyId=@companyId AND Barcode=@barcode AND EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId)
		) t WHERE row=1
	end
	RETURN ISNULL(@result,0)

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetStockMinByIdGroup]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lbl
-- Create date: 2015-05-28
-- Description:	根据组合商品获取最小的库存量
-- =============================================
CREATE FUNCTION [dbo].[F_GetStockMinByIdGroup]
(
	@barcodegroup	Varchar(max)
)
RETURNS int
AS
BEGIN
	
	DECLARE @num int;
	SELECT TOP 1 @num=num FROM(
		SELECT SUM(b.StockNumber) num FROM dbo.SplitString(@barcodegroup,',',1) a
		INNER JOIN dbo.Commodity b ON a.Value=b.Barcode
		GROUP BY a.Value
	) tb ORDER BY tb.num
	RETURN ISNULL(@num,0);
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetParentCategorys]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-06-17>
-- Description:	<获取所有父级条码>
-- =============================================
CREATE FUNCTION [dbo].[F_GetParentCategorys]
(
	-- Add the parameters for the function here
	@categorySn int,
	@companyId int
)
RETURNS @table TABLE
(
categorysn INT,
categorypsn int
)
AS
BEGIN
	;WITH my
          AS ( SELECT   *
               FROM     ProductCategory
               WHERE    CategorySN IN ( @categorySn )
               UNION ALL
               SELECT   ProductCategory.*
               FROM     my ,
                        ProductCategory
               WHERE    my.CategoryPSN = ProductCategory.CategorySN
             )
    INSERT INTO @table( categorysn ,categorypsn)
    SELECT my.CategorySN,my.CategoryPSN FROM  my WHERE my.CompanyId=@companyId
    return
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetIsRelationship]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		陈雅宾
-- Create date: 2016-01-12
-- Description:	根据条码查询该产品是否存在业务关系
-- =============================================
CREATE FUNCTION [dbo].[F_GetIsRelationship]
(
	@barcode VARCHAR(30),
	@companyId int
)
RETURNS INT
AS
BEGIN	
	DECLARE @count INT=0;
	DECLARE @isRelationship BIT =0;
	
	SELECT @isRelationship=IsRelationship FROM dbo.ProductRecord WHERE Barcode=@barcode AND CompanyId=@companyId
	IF(@isRelationship=1)
	BEGIN
		RETURN 1;
	END	
	
	--下订单
	SELECT @count= COUNT(*) FROM dbo.IndentOrderList a,dbo.IndentOrder b WHERE a.IndentOrderId=b.IndentOrderId AND a.Barcode=@barcode AND CompanyId=@companyId;
	--拆分
	IF(@count=0)
	BEGIN
	  SELECT @count= COUNT(*) FROM dbo.ProductRecord a WHERE a.Barcode IN (SELECT DISTINCT(OldBarcode) FROM dbo.ProductRecord) AND a.Barcode=@barcode AND CompanyId=@companyId;
	END 
	--组合
	IF(@count=0)
	BEGIN
		SELECT @count=COUNT(*) FROM dbo.ProductRecord a WHERE a.Barcode IN (SELECT DISTINCT(GroupBarcode) FROM dbo.ProductGroup ) AND a.Barcode=@barcode AND CompanyId=@companyId;
	END 
	--产品变价
	IF(@count=0)
	BEGIN
	  --SELECT @count= COUNT(*) FROM dbo.ProductChangePriceList a, dbo.ProductChangePrice b WHERE b.Id=a.ChangePriceId AND (b.State=1 a.StartDate<=GETDATE() AND a.EndDate>=GETDATE()-1) AND a.Barcode=@barcode;
	  SELECT @count= COUNT(*) FROM dbo.ProductChangePriceList a, dbo.ProductChangePrice b WHERE b.Id=a.ChangePriceId AND a.Barcode=@barcode AND CompanyId=@companyId;
	END 
	--批发价
	IF(@count=0)
	BEGIN
	  SELECT @count= COUNT(*) FROM dbo.ProductTradePriceList a, dbo.ProductTradePrice b WHERE b.Id=a.TradePriceId AND b.State<2 AND a.StartDate<GETDATE() AND a.EndDate>GETDATE() AND a.Barcode=@barcode AND CompanyId=@companyId;
	END 
	--报损
	IF(@count=0)
	BEGIN
	  SELECT @count= COUNT(*) FROM dbo.BreakageList a, dbo.BreakageGoods b WHERE b.BreakageGoodsId=a.BreakageGoodsId AND b.State<2 AND a.Barcode=@barcode AND CompanyId=@companyId;
	END 
	--正常入库
	IF(@count=0)
	BEGIN
		SELECT @count= COUNT(*) FROM InboundList a,dbo.InboundGoods b WHERE a.InboundGoodsId=b.InboundGoodsId AND a.Barcode=@barcode AND CompanyId=@companyId;
	end	
	--正常出库，批发出库
	IF(@count=0)
	BEGIN
		SELECT @count=COUNT(*) FROM dbo.OutboundList a,dbo.OutboundGoods b WHERE a.OutboundId=b.OutboundId AND a.Barcode=@barcode AND CompanyId=@companyId;
	END
	--调入调出
	IF(@count=0)
	BEGIN
		SELECT @count=COUNT(*) FROM dbo.HouseMoveList a,dbo.HouseMove b WHERE a.MoveId=b.MoveId AND a.Barcode=@barcode AND CompanyId=@companyId;
	END
	--销售
	IF(@count=0)
	BEGIN
		SELECT @count=COUNT(*) FROM dbo.SaleDetail WHERE Barcode=@barcode AND CompanyId=@companyId;
	END

	RETURN @count;
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetDiscountPrice]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: <2016-09-09>
-- Description:	<获取折扣价>
-- =============================================
CREATE FUNCTION [dbo].[F_GetDiscountPrice]
(
	-- Add the parameters for the function here
	@barcode VARCHAR(30),
	@companyId int
)
RETURNS MONEY
AS
BEGIN
	DECLARE @price money;
	SELECT @price=CASE WHEN b.Way=2 THEN ((SELECT SysPrice FROM dbo.ProductRecord WHERE Barcode=@barcode AND CompanyId=a.CompanyId)*b.DiscountRate/10) ELSE b.DiscountPrice end FROM dbo.CommodityPromotion a
	INNER join dbo.CommodityDiscount b ON b.CommodityId=a.Id
	WHERE a.CompanyId=@companyId and a.State=1 AND b.Barcode=@barcode
	IF(ISNULL(@price,0)=0)
	BEGIN
		SELECT @price=b.CurSysPrice FROM dbo.ProductChangePrice a
		INNER join dbo.ProductChangePriceList b ON a.Id=b.ChangePriceId 
		WHERE a.CompanyId = @companyId AND a.State=1 AND b.State=1 AND b.Barcode=@barcode
	END

	RETURN @price
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_GenerateSaleOrderSN]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-05-30
-- Description:	生成门店销售单号
-- =============================================
CREATE FUNCTION [dbo].[F_GenerateSaleOrderSN]
(
	@CompanyId Int,
	@StoreId Int,
	@PosSN Varchar(2)	--POS机号
)
RETURNS NVarchar(20)
AS
BEGIN
	
	SET @PosSN=RIGHT('00'+@PosSN,2);
	
	DECLARE @yyymmdd Varchar(8);
	SET @yyymmdd=CONVERT(varchar(8),getdate(),112);
	
	DECLARE @code Varchar(14);
	SET @code=@PosSN+@yyymmdd;
	DECLARE @sn Varchar(40);
	SET @sn='0';
	
	SET @sn=(SELECT TOP 1 CAST(PaySN as INT)+1 FROM 
					(SELECT RIGHT(PaySN,4) AS PaySN,[Id] FROM dbo.SaleOrders
						WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND ISNUMERIC(PaySN)=1
						AND LEN(PaySN)=14 AND LEFT(PaySN,10)=@code) AS tmp
					ORDER BY [Id] DESC);
					
	SET @sn=RIGHT('0000'+isnull(@sn,1),4);
	SET @code=@code+@sn;
	
	RETURN @code;
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_DicNameForSN]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		林保龙
-- Create date: 2015-05-27
-- Description:	根据字典SN获取对应的字典名称
-- =============================================
CREATE FUNCTION [dbo].[F_DicNameForSN]
(
	@DicSN Int,
	@companyId int
)
RETURNS Nvarchar(50)
AS
BEGIN
	
	DECLARE @Title Nvarchar(50);
	SELECT @Title=[Title] FROM dbo.SysDataDictionary WHERE DicSN=@DicSN and CompanyId=@companyId;
	RETURN ISNULL(@Title,'');

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_DeptNameById]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-05-28
-- Description:	根据用户UID获取对应的用户姓名
-- =============================================
CREATE FUNCTION [dbo].[F_DeptNameById]
(
	@DepId	INT,
	@companyId int
)
RETURNS Nvarchar(50)
AS
BEGIN
	
	DECLARE @Name Nvarchar(50);
	SELECT @Name=[Title] FROM dbo.SysDepartments WHERE CompanyId=@companyId and [DepId]=@DepId;
	RETURN ISNULL(@Name,'');

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_CommodityTitleByBarcode]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		cyh
-- Create date: 2015-10-16
-- Description:	根据商品Barcode得到商品名称
-- =============================================
CREATE FUNCTION [dbo].[F_CommodityTitleByBarcode]
(
	@barcode VARCHAR(30)
)
RETURNS Nvarchar(50)
AS
BEGIN
	
	DECLARE @Title Nvarchar(50);
	SELECT @Title=[Title] FROM dbo.ProductRecord WHERE Barcode=@barcode;
	IF(@Title is null)
		BEGIN
			SELECT @Title=[Title] FROM dbo.ProductRecord WHERE ProductCode=@barcode;
		END
	IF(@Title is null)
		BEGIN
			SELECT @Title=[Title] FROM dbo.Bundling WHERE NewBarcode=@barcode;
		END
	RETURN ISNULL(@Title,'');

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_BuyPriceByBarcode]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2015-12-28
-- Description:	获取对应进价
-- =============================================
CREATE FUNCTION [dbo].[F_BuyPriceByBarcode]
(
	@supplierId	Varchar(300),
	@barcode VARCHAR(30),
	@companyId INT
)
RETURNS MONEY
AS
BEGIN
	
	DECLARE @price MONEY;
	IF(ISNULL(@supplierId,'')!='')
	BEGIN
		declare @curdt varchar(10); set @curdt=convert(varchar(10),GETDATE(),120);

		SELECT @price=b.CurBuyPrice
		FROM dbo.ProductChangePrice a INNER join dbo.ProductChangePriceList b ON a.Id=b.ChangePriceId
		WHERE (b.StartDate<=@curdt AND (b.EndDate>=@curdt OR isnull(b.EndDate,'')=''))
		AND (a.[State]=1) AND (b.[State]=1) AND (b.Barcode=@barcode)
		AND EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',','1') WHERE Value=a.SupplierId)
		AND a.CompanyId=@companyId		
		
		IF @price IS NULL
		BEGIN
			SELECT @price=a.BuyPrice
			FROM dbo.ProductMultSupplier a WHERE a.Barcode=@barcode
			AND EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',','1') WHERE Value=a.SupplierId) ;
		end
	end
	IF @price IS NULL
	BEGIN
		SELECT @price=BuyPrice FROM dbo.ProductRecord WHERE CompanyId=@companyId and Barcode=@barcode;
	end
	RETURN isnull(@price,0);
END
GO
/****** Object:  UserDefinedFunction [dbo].[F_BrandNameForSN]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-05-28
-- Description:	根据品牌SN获取对应的品牌名称
-- =============================================
CREATE FUNCTION [dbo].[F_BrandNameForSN]
(
	@BrandSN Int
)
RETURNS Nvarchar(20)
AS
BEGIN
	
	DECLARE @Title Nvarchar(50);
	SELECT @Title=[Title] FROM dbo.ProductBrand WHERE BrandSN=@BrandSN;
	RETURN ISNULL(@Title,'');

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_BarcodeType]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-08-20
-- Description:	得到条码商品性质（单品、组合、拆分、捆绑）
-- =============================================
CREATE FUNCTION [dbo].[F_BarcodeType]
(
	@companyId int,
	@barcode varchar(50)
)
RETURNS Int
AS
BEGIN
	--识别条码分类，优先级：1.捆绑新条码、2.组合新条码、3.拆分新条码、4.单品条码
	DECLARE @BarcodeType SmallInt; SET @BarcodeType=4;
	
	IF EXISTS (SELECT b.* FROM dbo.Bundling as b
					INNER JOIN dbo.CommodityPromotion as cp on cp.Id=b.CommodityId
					AND cp.[State]=1
					AND cp.CompanyId=b.CompanyId
					AND cp.PromotionType=2
					WHERE b.CompanyId=@CompanyId AND b.NewBarcode=@Barcode
					)
	BEGIN
		--1.捆绑新条码
		SET @BarcodeType=1;
	END
	ELSE IF EXISTS (SELECT * FROM dbo.ProductRecord
					WHERE [Nature]=1 AND CompanyId=@CompanyId AND Barcode=@Barcode)
	BEGIN
		--2.组合新条码
		SET @BarcodeType=2;
	END
	ELSE IF EXISTS (SELECT * FROM dbo.ProductRecord
					WHERE [Nature]=2 AND CompanyId=@CompanyId AND Barcode=@Barcode)
	BEGIN
		--3.拆分新条码
		SET @BarcodeType=3;
	END
	ELSE IF EXISTS (SELECT * FROM dbo.ProductRecord
					WHERE [Nature]=0 AND CompanyId=@CompanyId AND Barcode=@Barcode)
	BEGIN
		--4.单品条码
		SET @BarcodeType=4;
	END
		
	RETURn @BarcodeType;
END
GO
/****** Object:  StoredProcedure [dbo].[Auto_PromotionState]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2015-08-20
-- Description:	自动更新促销状态为活动中或已过期
-- =============================================
CREATE PROCEDURE [dbo].[Auto_PromotionState]
AS
BEGIN
SET NOCOUNT ON;

	--更新活动中
	UPDATE CommodityPromotion SET [State]=1 WHERE  StartDate<=GETDATE() AND GETDATE()<DATEADD(DAY,1,EndDate) AND [State]!=2
	--更新已过期
	UPDATE CommodityPromotion SET [State]=2 WHERE  GETDATE()>DATEADD(DAY,1,EndDate) AND [State]!=2

END
GO
/****** Object:  Table [dbo].[SaleInventoryHistory]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleInventoryHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[PaySn] [nvarchar](50) NOT NULL,
	[StorageBarcode] [nvarchar](50) NOT NULL,
	[Mode] [int] NOT NULL,
	[Number] [money] NOT NULL,
	[InventoryId] [int] NOT NULL,
	[SaleBarcode] [nvarchar](50) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
	[CreateUid] [varchar](40) NOT NULL,
 CONSTRAINT [PK__SaleInve__3214EC070D99FE17] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleInventoryHistory', @level2type=N'COLUMN',@level2name=N'PaySn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存储条码（源商品条码）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleInventoryHistory', @level2type=N'COLUMN',@level2name=N'StorageBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消减模式（1、销售量消减；2、父商品拆分；3、组合商品消减；4、整单退出库存回撤，5、拆分子商品入库,6、退货库存回撤，7、修改订单库存回撤,8、修改订单新增商品消减）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleInventoryHistory', @level2type=N'COLUMN',@level2name=N'Mode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleInventoryHistory', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleInventoryHistory', @level2type=N'COLUMN',@level2name=N'InventoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleInventoryHistory', @level2type=N'COLUMN',@level2name=N'SaleBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleInventoryHistory', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleInventoryHistory', @level2type=N'COLUMN',@level2name=N'CreateDt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SaleInventoryHistory', @level2type=N'COLUMN',@level2name=N'CreateUid'
GO
/****** Object:  StoredProcedure [dbo].[Proc_DataSync_SaleDetailsTotal]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<余雄文>
-- Create date: <20160114>
-- Description:	<数据同步专用SaleDetailsTotal>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_DataSync_SaleDetailsTotal]
	-- Add the parameters for the stored procedure here
@storeId varchar(3),
@expire  int
AS
BEGIN 
   declare @expireDate datetime;
   select @expireDate = DATEADD(MONTH,-@expire,getdate())
   select b.* from SaleOrders a,SaleDetailsTotal b where a.PaySN=b.PaySN and  a.StoreId = @storeId and a.CreateDT>=@expireDate
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_DataSync_SaleDetails]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<余雄文>
-- Create date: <20160114>
-- Description:	<数据同步专用SaleDetails>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_DataSync_SaleDetails]
	-- Add the parameters for the stored procedure here
@storeId varchar(3),
@expire  int
AS
BEGIN 
   declare @expireDate datetime;
   select @expireDate = DATEADD(MONTH,-@expire,getdate())
   select b.* from SaleOrders a,SaleDetail b where a.PaySN=b.PaySN and  a.StoreId = @storeId and a.CreateDT>=@expireDate
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_SalesSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<hs>
-- Create date: <2015-09-23>
-- Description:	<销售同比汇总报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_SalesSummary]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @SameStartDate VARCHAR(20),
    @SameEndDate VARCHAR(20),
    @storeId VARCHAR(100)=''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        
		SELECT SUM(ISNULL(cur.TotalAmount,0)) AS CurrentMonthSaleTotal,COUNT(cur.Id) AS CurrentOrderQuantity,
		SUM(ISNULL(same.TotalAmount,0)) AS  SameMonthSaleTotal ,COUNT(same.Id) AS SameOrderQuantity,cur.StoreId,w.Title
		FROM dbo.SaleOrders AS cur
		LEFT JOIN (SELECT * FROM dbo.SaleOrders WHERE CreateDT BETWEEN @SameStartDate AND @SameEndDate) AS same
		ON cur.StoreId = same.StoreId
		LEFT JOIN dbo.Warehouse AS w
		ON cur.StoreId = w.StoreId
		WHERE cur.CreateDT BETWEEN @startDate AND @endDate
		AND (ISNULL(@storeId,'')='' OR @storeId='-1' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=cur.StoreId))
		GROUP BY cur.StoreId,w.Title;	   

    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_SalerSaleOrderDay]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-12-22>
-- Description:	<导购员日,月结报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_SalerSaleOrderDay]
	@companyId INT,
    @startDate VARCHAR(20),
	@endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @chshier VARCHAR(500)='',
    @saler VARCHAR(500)='',
    @sortField VARCHAR(20)='Salesman',
    @datelen VARCHAR(3)='10',
    @CurrentPage	INT=1,			--当前页
	@PageSize		INT=20,				--页大小,
	@ispage SMALLINT=1  --是否分页
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @Sql varchar(max);
        DECLARE @where VARCHAR(3000);
        DECLARE @apisql VARCHAR(8000)='';
        DECLARE @apisum VARCHAR(8000)='';
		DECLARE @apitot VARCHAR(4000)='';
        DECLARE @apicode INT;
		DECLARE @apititle VARCHAR(50);
		DECLARE contact_cursor CURSOR FOR
		SELECT ApiCode,Title  FROM dbo.ApiLibrary a WHERE EXISTS(SELECT 1 FROM ConsumptionPayment WHERE ApiCode=a.ApiCode AND CompanyId=a.CompanyId and CompanyId=@companyId) ORDER BY ApiOrder
		--SELECT * FROM (VALUES('s'),('w'),('q')) AS V(A)
		SET @where = ' ISNULL(ReturnOrderUID,CreateUID)=tb.CreateUID AND CONVERT(VARCHAR('+@datelen+'),CreateDT,120)=CONVERT(VARCHAR('+@datelen+'),tb.CreateDT,120) AND oo.CompanyId=tb.CompanyId'+
		' AND ('''+@storeId+'''='''' or EXISTS ( SELECT 1 FROM  dbo.SplitString('''+@storeId+''','','',1) WHERE  Value = StoreId ))'

        SET @Sql='
        SELECT CONVERT(VARCHAR('+@datelen+'),CreateDT,120) AS Date,(UserCode+'' ''+FullName) Salesman,MIN(CreateDT) FirstTime,MAX(CreateDT) LastTime,SUM(xj) XJMoney ,
		CASE WHEN SUM(TotalAmount)=0 THEN 0 else SUM(xscount) END XSCount ,SUM(TotalAmount) XSMoney ,SUM(Receive) SSMoney ,ISNULL(SUM(TUIHuanCount), 0) TUIHuanCount ,ISNULL(SUM(TUIHuanMoney), 0) TUIHuanMoney ,
		SUM(CASE WHEN ZSAmount>0 THEN 1 ELSE 0 END) ZSCount,SUM(CASE WHEN ZSHunHeCount>1 THEN 1 ELSE 0 end) ZSHunHeCount,ISNULL(SUM(ZSAmount),0) ZSMoney,
		ISNULL(SUM(TUICount), 0) TUICount,ISNULL(SUM(TUIMoney), 0) TUIMoney,ISNULL(SUM(HUANCount), 0) HUANCount ,
        ISNULL(SUM(HUANMoney), 0) HUANMoney ,ISNULL(SUM(RLCount), 0) RLCount, ISNULL(SUM(RLMoney), 0) RLMoney ,ISNULL(SUM(MLCount), 0) MLCount ,ISNULL(SUM(MLMoney), 0) MLMoney';
		OPEN contact_cursor
		FETCH NEXT FROM contact_cursor INTO @apicode,@apititle
		WHILE @@FETCH_STATUS=0
		BEGIN
			--PRINT 'apicode:'+CAST(@apicode AS VARCHAR(10))+',apititle:'+@apititle
			SET @apisql+=',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type=0) AS ['+@apititle+'_xs]'+
					',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type in(3)) AS ['+@apititle+'_tui]'+
					',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type in(1,2) AND o.Receive <= 0) AS ['+@apititle+'_tuihuang]'+
					',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type in(1) AND o.Receive > 0) AS ['+@apititle+'_huang]';
			SET @apisum+=',ISNULL(SUM(['+@apititle+'_xs]), 0) AS ['+@apititle+'_xs_dy]'+
						',ISNULL(SUM(['+@apititle+'_tui]), 0) AS ['+@apititle+'_tui_dy]'+
						',ISNULL(SUM(['+@apititle+'_tuihuang]), 0) AS ['+@apititle+'_tuihuang_dy]'+
						',ISNULL(SUM(['+@apititle+'_huang]), 0) AS ['+@apititle+'_huang_dy]';
			SET @apitot+=',SUM(['+@apititle+'_xs_dy]) as ['+@apititle+'_xs_dy],SUM(['+@apititle+'_tui_dy]) as ['+@apititle+'_tui_dy],SUM(['+@apititle+'_huang_dy]) as ['+@apititle+'_huang_dy],SUM(['+@apititle+'_tuihuang_dy]) as ['+@apititle+'_tuihuang_dy]';
			--PRINT @apisql		
			FETCH NEXT FROM contact_cursor iNTO @apicode,@apititle
		END
		CLOSE contact_cursor
		DEALLOCATE contact_cursor
		SET @sql+=@apisum;
		SET @apisql+=',(select SUM(Amount) from(SELECT Amount FROM dbo.ConsumptionPayment WHERE PaySN=o.paysn and ApiCode=11
						UNION ALL 
						SELECT CASE WHEN Type=1 THEN Amount ELSE -Amount end FROM dbo.PosIncomePayout WHERE CompanyId=o.CompanyId and StoreId=o.StoreId AND CreateUID=o.CreateUID AND IsTest=0
						AND CONVERT(VARCHAR(10), o.CreateDT, 23) BETWEEN '''+@startDate+''' AND '''+@endDate+''')  t) xj'
		DECLARE @start DATE;
		DECLARE @end DATE;
		SET @sql+=' FROM
			(SELECT o.CompanyId ,
                            o.PaySN ,
                            o.CreateDT ,
                            o.CreateUID ,
                            ZSAmount ,
                            u.UserCode ,
                            u.FullName,
                            ISNULL(o.Salesman, '''') Salesman ,
							o.Receive,
							CASE WHEN [Type] IN(0) THEN o.Receive ELSE 0 END TotalAmount ,
                            CASE WHEN [Type] IN(0) THEN 1 ELSE 0 END XSCount ,
                            CASE WHEN [Type] IN ( 1, 2 ) AND o.Receive<=0 THEN 1 ELSE 0  END AS TUIHuanCount ,
							CASE WHEN [Type] IN ( 1, 2 ) AND o.Receive<=0 THEN o.Receive  ELSE 0 END AS TUIHuanMoney ,
							CASE WHEN [Type] IN ( 3 ) THEN 1 ELSE 0  END AS TUICount ,
							CASE WHEN [Type] IN ( 3 ) THEN o.Receive ELSE 0 END AS TUIMoney ,
							CASE WHEN [Type] = 1 AND o.Receive>0 THEN 1 ELSE 0 END AS HUANCount ,
							CASE WHEN [Type] = 1 AND o.Receive>0 THEN o.Receive ELSE 0 END AS HUANMoney ,
                            CASE WHEN OrderDiscount<>0 THEN 1 ELSE 0 END AS RLCount ,
                            CASE WHEN OrderDiscount<>0 THEN OrderDiscount ELSE 0 END AS RLMoney ,
							(SELECT COUNT(1) FROM dbo.SaleDetail WHERE PaySN IN(SELECT PaySN FROM dbo.SaleDetail WHERE PaySN=o.paysn and SalesClassifyId IN(49,161) AND o.Type=0)) ZSHunHeCount,
                            (SELECT  COUNT(1) FROM WipeZero WHERE  PaySN = o.PaySN) AS MLCount,
                            (SELECT  ISNULL(SUM(Number), 0) FROM WipeZero WHERE  PaySN = o.PaySN) AS MLMoney '+@apisql+' FROM SaleOrders o
		LEFT JOIN
		(SELECT oo.PaySN AS ZSPaySN,SUM(od.PurchaseNumber*od.SysPrice) AS ZSAmount FROM SaleOrders oo INNER JOIN SaleDetail od ON od.PaySN=oo.PaySN
		WHERE oo.Type=0 and od.SalesClassifyId in(49,161) GROUP BY oo.PaySN) ZS ON ZS.ZSPaySN=o.PaySN
		LEFT JOIN SysUserInfo u on u.UID=o.Salesman
		WHERE isnull(o.Salesman,'''')<>'''' AND CONVERT(varchar(10),o.CreateDT,23) BETWEEN '''+@startDate+''' AND '''+@endDate+'''  AND EXISTS(SELECT 1 FROM dbo.SaleDetail WHERE PaySN=o.PaySN) AND o.IsTest=0 AND o.CompanyId='+CAST(@companyId AS VARCHAR(10))
                     
        IF(LEN(@storeId)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId)'
        END
        IF(LEN(@chshier)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@chshier+''','','',1) WHERE Value=o.CreateUID)'
        END
        IF(LEN(@saler)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@saler+''','','',1) WHERE Value=Salesman)'
        END
        
        --筛选出操作人当“天”无销售只有后台退货的记录
  --      SET @Sql+=' UNION SELECT NULL PaySN,rr.CreateDT,rr.CreateUID,NULL Salesman,0 TotalAmount,NULL ZSAmount,u.UserCode,u.FullName FROM SalesReturns rr
		--LEFT JOIN SysUserInfo u ON u.UID=rr.CreateUID
		--WHERE (rr.ReturnType=0 or rr.ReturnType=2) AND (rr.CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''')
		--AND CONVERT(VARCHAR(10),rr.CreateDT,120) NOT IN (SELECT CONVERT(VARCHAR(10),CreateDT,120) FROM SaleOrders
		--WHERE (CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''') and rr.CreateUID=CreateUID)'
		
		--IF(LEN(@storeId)>0)
  --      BEGIN
		--	SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=rr.StoreId)'
  --      END
  --      IF(LEN(@chshier)>0)
  --      BEGIN
		--	SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@chshier+''','','',1) WHERE Value=rr.CreateUID)'
  --      END
        --
		
        SET @sql+=') tb GROUP BY CompanyId,Salesman,UserCode,FullName,CONVERT(VARCHAR('+@datelen+'),CreateDT,120)'
		--select SQL_VARIANT_PROPERTY(@Sql,'BaseType')
        IF(@ispage<>1)
		BEGIN
			--EXECUTE sys.sp_executesql @Sql
			set	@PageSize = 100000;
		END
        
		SET @sql='SELECT *,(XSCount+TUICount+TUIHuanCount+HUANCount-ZSCount+ZSHunHeCount) AS SSCount from(select (ROW_NUMBER() OVER ( ORDER BY '+@sortField+')) AS RSNO,* from ('+@Sql+') td) t';

		EXEC printlong @Sql

		EXEC dbo.Comm_PageList @SqlStr = @Sql, -- nvarchar(max)
			@CurrentPage = @CurrentPage, -- int
			@PageSize = @PageSize -- int
		DECLARE @sql2 NVARCHAR(MAX)
		SET @sql2= N'SELECT ''合计:'' LastTime,  SUM(SSMoney) SSMoney,SUM(SSCount) SSCount,SUM(XSMoney) XSMoney,SUM(XSCount) XSCount,SUM(ZSCount) ZSCount,SUM(ZSMoney) ZSMoney,SUM(TUICount) TUICount,SUM(TUIMoney) TUIMoney,SUM(TUIHuanCount) TUIHuanCount,SUM(TUIHuanMoney) TUIHuanMoney,SUM(HUANCount) HUANCount,SUM(HUANMoney) HUANMoney,SUM(MLCount) MLCount,SUM(MLMoney) MLMoney,SUM(RLCount) RLCount,SUM(RLMoney) RLMoney'+@apitot+' from ('+@sql+') t';
		EXECUTE sys.sp_executesql @sql2
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_OrderSaleDetailDay]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2015-11-06>
-- Description:	<订单销售明细日报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_OrderSaleDetailDay]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @chshier VARCHAR(500)='',
    @saler VARCHAR(500)='',
    @sortField VARCHAR(20)='CreateDT desc',
    @CurrentPage	INT=1,			--当前页	@PageSize		INT=20,				--页大小,
	@ispage SMALLINT=1  --是否分页
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @Sql Nvarchar(Max);
        DECLARE @where NVARCHAR(2000);
        
        SET @Sql='
        SELECT CreateDT,Cashier,Saler,PaySN,TotalAmount,PreferentialPrice,ApiTitle,SUM(Quantity) Quantity,SUM(Weigh) Weigh FROM(	
		SELECT a.*,dbo.F_UserNameById(CreateUID) Cashier,dbo.F_UserNameById(Salesman) Saler,
				(CASE WHEN c.ValuationType = 1 THEN b.PurchaseNumber
						 ELSE 1
					END) AS Quantity ,
				(CASE WHEN c.ValuationType = 2 THEN b.PurchaseNumber
						 ELSE 0
					END) AS Weigh,
				STUFF((SELECT '',''+Title FROM ConsumptionPayment,ApiLibrary WHERE ApiLibrary.ApiCode=dbo.ConsumptionPayment.ApiCode AND PaySN=a.PaySN FOR XML PATH('''')),1,1,'''') ApiTitle
		FROM    dbo.SaleOrders a
				INNER JOIN dbo.SaleDetail b ON a.PaySN = b.PaySN
				LEFT JOIN dbo.ProductRecord c ON b.Barcode = c.Barcode
		WHERE   1 = 1
				AND a.CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''''
		
                     
        IF(LEN(@storeId)>0)
        BEGIN
			SET @sql+=' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId)'
        END
        IF(LEN(@chshier)>0)
        BEGIN
			SET @sql+=' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@chshier+''','','',1) WHERE Value=CreateUID)'
        END
        IF(LEN(@saler)>0)
        BEGIN
			SET @sql+=' and EXISTS(SELECT 1 FROM dbo.SplitString('''+@saler+''','','',1) WHERE Value=Salesman)'
        END
        set @sql+=') tb GROUP BY CreateDT,Cashier,Saler,PaySN,TotalAmount,PreferentialPrice,ApiTitle'
                
        IF(@ispage<>1)
        BEGIN
			EXECUTE sys.sp_executesql @Sql
        END
        ELSE
        BEGIN
			SET @sql='SELECT * from(select (ROW_NUMBER() OVER ( ORDER BY '+@sortField+')) AS RSNO,* from ('+@Sql+') td) t';
			EXEC dbo.Comm_PageList @SqlStr = @Sql, -- nvarchar(max)
				@CurrentPage = @CurrentPage, -- int
				@PageSize = @PageSize -- int
        END
        PRINT @Sql
    END
GO
/****** Object:  StoredProcedure [dbo].[SQLCompareDB]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-12-20
-- Description:	两个数据库的不同比较
-- =============================================
CREATE proc [dbo].[SQLCompareDB]
	@dbname1 varchar(250),
	@dbname2 varchar(250),
	@isGenerateSql bit=0,
	@ruleOut varchar(500)=''	--要排除的表，多个表之间用半角逗号隔开
as
begin
	set nocount on;
	
    create table #tb1(表名1 varchar(2500),字段名 varchar(2500),序号 int,标识 bit,主键 bit,类型 varchar(2500), 
						占用字节数 int,长度 int,小数位数 int,允许空 bit,默认值 varchar(5000),字段说明 varchar(5000));

    create table #tb2(表名2 varchar(2500),字段名 varchar(2500),序号 int,标识 bit,主键 bit,类型 varchar(250), 
						占用字节数 int,长度 int,小数位数 int,允许空 bit,默认值 varchar(5000),字段说明 varchar(5000));
    

    --得到数据库1的结构 
    exec('insert into #tb1 SELECT 表名=d.name,字段名=a.name,序号=a.column_id, 标识=is_identity, 
    主键=case when exists(SELECT 1 FROM '+@dbname1+ '.sys.sysobjects where xtype=''PK'' and name in ( 
	SELECT name FROM '+' sysindexes WHERE indid in( 
    SELECT indid FROM '+ ' sysindexkeys WHERE id=a.object_id AND column_id=a.column_id)))
		then 1 else 0 end, 类型=b.name, 占用字节数=a.max_length,长度=a.precision,小数位数=a.scale,
		允许空=a.is_nullable, 默认值=isnull(e.text, ''''),字段说明=''''
	FROM '+@dbname1+ '.sys.columns a
	left join '+@dbname1+ '.sys.systypes b on a.system_type_id=b.xusertype 
    inner join '+@dbname1+ '.sys.sysobjects d on a.object_id=d.id and d.xtype=''U '' and d.name <> ''dtproperties '' 
    left join '+@dbname1+ '.sys.syscomments e on a.default_object_id=e.id 
    left join '+@dbname1+ '.sys.sysprotects g on a.object_id=g.id and a.column_id=g.ID order by a.object_id,a.column_id ');
     
    --得到数据库2的结构 
     exec('insert into #tb2 SELECT 表名=d.name,字段名=a.name,序号=a.column_id, 标识=is_identity, 
    主键=case when exists(SELECT 1 FROM '+@dbname2+ '.sys.sysobjects where xtype=''PK'' and name in ( 
	SELECT name FROM '+' sysindexes WHERE indid in( 
    SELECT indid FROM '+ ' sysindexkeys WHERE id=a.object_id AND column_id=a.column_id)))
		then 1 else 0 end, 类型=b.name, 占用字节数=a.max_length,长度=a.precision,小数位数=a.scale,
		允许空=a.is_nullable, 默认值=isnull(e.text, ''''),字段说明=''''
	FROM '+@dbname2+ '.sys.columns a
	left join '+@dbname2+ '.sys.systypes b on a.system_type_id=b.xusertype 
    inner join '+@dbname2+ '.sys.sysobjects d on a.object_id=d.id and d.xtype=''U '' and d.name <> ''dtproperties '' 
    left join '+@dbname2+ '.sys.syscomments e on a.default_object_id=e.id 
    left join '+@dbname2+ '.sys.sysprotects g on a.object_id=g.id and a.column_id=g.ID order by a.object_id,a.column_id ');
    
    --
    select  比较结果=(case
    when a.表名1 is null and b.序号=1 then '库['+@dbname1+'] 缺少表：'+b.表名2 
    when b.表名2 is null and a.序号=1 then '库['+@dbname2+'] 缺少表：'+a.表名1 
    when a.字段名 is null and exists(select 1 from #tb1 where 表名1=b.表名2)
									then '库['+@dbname1+'][ '+b.表名2+ '] 表缺少字段：'+b.字段名 
    when b.字段名 is null and exists(select 1 from #tb2 where 表名2=a.表名1)
									then '库['+@dbname2+'][ '+a.表名1+ '] 表缺少字段：'+a.字段名 
    when a.标识 <> b.标识 then '标识不同' 
    --when a.主键 <> b.主键 then '主键设置不同' 
    when a.类型 <> b.类型 then '字段类型不同' 
    when a.占用字节数 <> b.占用字节数 then '占用字节数' 
    when a.长度 <> b.长度 then '长度不同' 
    when a.小数位数 <> b.小数位数 then  '小数位数不同' 
    when a.允许空 <> b.允许空 then '是否允许空不同' 
    when a.默认值 <> b.默认值 then '默认值不同' 
    when a.字段说明 <> b.字段说明 then  '字段说明不同' 
    else ' ' end),
    a.*  into #S from #tb1 a 
    left join #tb2 b on a.表名1=b.表名2 and a.字段名=b.字段名 
    where  b.表名2 is null or b.字段名 is null   
    or a.标识 <> b.标识 or a.主键 <> b.主键 or a.类型 <> b.类型 
    or a.占用字节数 <> b.占用字节数 or a.长度 <> b.长度 or a.小数位数 <> b.小数位数 
    or a.允许空 <> b.允许空 or a.默认值 <> b.默认值 or a.字段说明 <> b.字段说明
    order by a.表名1,a.序号;

	--
	if(@isGenerateSql=1)
	begin
		declare @rsCount int;
		select @rsCount=isnull(COUNT([#S].[比较结果]),0)
		from #S where [#S].[比较结果]<>''
				AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0)
		group by [#S].[比较结果];
		if(@rsCount>0)
		begin
			print 'use ['+@dbname2+'];';
			print ' ';
			--print @rsCount;
			--select [#S].[比较结果]
			--from #S where [#S].[比较结果]<>''
			--	AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0);
		end
		
		--生成新增的表结构
		DECLARE @tName Nvarchar(50);
		if exists (SELECT [#S].[表名1] FROM #S WHERE (len(比较结果)>0) AND #S.比较结果 like '%缺少表%'
					AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0))
		begin
			print '--新增表';
		end
			
		declare tb_cursor cursor
		local for SELECT [#S].[表名1]
		FROM #S WHERE (len(比较结果)>0) AND #S.比较结果 like '%缺少表%'
		AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0);
		
		open tb_cursor
		fetch next from tb_cursor into @tName
		while(@@fetch_status<>-1) 
		begin
			exec SQLGenerateScript @tName,1;		
			fetch next from tb_cursor into @tName;
		end
		close tb_cursor;
		deallocate tb_cursor;
		
		--生成新增的字段
		declare @name sysname; 
		declare @column varchar(1000);
		declare @type varchar(50);
		declare @lenth smallint;
		declare @isnull smallint;
		declare @val varchar(50);
		declare @alter varchar(500);
		
		if exists (SELECT * FROM #S WHERE (len(比较结果)>0) AND #S.[比较结果] like '%表缺少字段%'
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0))
		begin
			print '--新增字段';
		end

		set @alter='';		
		declare tb_cursor cursor
		local for SELECT #S.[表名1],#s.[字段名],#s.[类型],#s.[占用字节数],#s.[允许空],#s.[默认值]
		FROM #S WHERE (len(比较结果)>0) AND #S.比较结果 like '%表缺少字段%'
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0);
		
		open tb_cursor
		fetch next from tb_cursor into @name,@column,@type,@lenth,@isnull,@val
		while(@@fetch_status<>-1) 
		begin
			set @alter='alter table [dbo].['+@name+'] add ['+@column+'] ';
			if(dbo.Comm_F_NumIsInGroup(@type,'binary,char,nchar,nvarchar,varbinary,varchar')=1)
			begin
				set @alter=@alter+'['+@type+']('+cast(@lenth as varchar)+') ';
			end
			else
			begin
				set @alter=@alter+@type+' ';
			end
			if(@isnull=0)
			begin
				set @alter=@alter+' not ';
			end
			set @alter=@alter+'null';
			if(LEN(@val)>0)
			begin
				set @alter=@alter+' default '+@val
			end
			set @alter=@alter+';';
						
			print @alter;			
			fetch next from tb_cursor into @name,@column,@type,@lenth,@isnull,@val;
		end
		close tb_cursor;
		deallocate tb_cursor;
		--修改字段类型
		if(LEN(@alter)>0)
		begin
			print '	';
		end
		if exists (SELECT * FROM #S WHERE (len(比较结果)>0) AND #S.[比较结果]='字段类型不同'
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0))
		begin
			print '--修改字段类型';
		end
		set @alter='';		
		declare tb_cursor cursor
		local for SELECT #S.[表名1],#s.[字段名],#s.[类型],#s.[占用字节数]
		FROM #S WHERE (len(比较结果)>0) AND #S.[比较结果]='字段类型不同'
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0);
		
		open tb_cursor
		fetch next from tb_cursor into @name,@column,@type,@lenth
		while(@@fetch_status<>-1) 
		begin
			set @alter='alter table [dbo].['+@name+'] alter column ['+@column+'] ';
			if(dbo.Comm_F_NumIsInGroup(@type,'binary,char,nchar,nvarchar,varbinary,varchar')=1)
			begin
				set @alter=@alter+'['+@type+']('+cast(@lenth as varchar)+') ';
			end
			else
			begin
				set @alter=@alter+@type;
			end
			set @alter=@alter+';';
						
			print @alter;			
			fetch next from tb_cursor into @name,@column,@type,@lenth;
		end
		close tb_cursor;
		deallocate tb_cursor;
		
		--生成默认值不同
		if(LEN(@alter)>0)
		begin
			print '	';
		end
		if exists (SELECT * FROM #S WHERE (len(比较结果)>0) AND #S.[比较结果] = '默认值不同'
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0))
		begin
			print '--修改默认值';
		end
		
		set @alter='';
		declare tb_cursor cursor
		local for SELECT #S.[表名1],#s.[字段名],#s.[默认值]
		FROM #S WHERE (len(比较结果)>0) AND #S.[比较结果] = '默认值不同 '
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0);
		open tb_cursor
		fetch next from tb_cursor into @name,@column,@val
		while(@@fetch_status<>-1)
		begin
			set @alter='alter table [dbo].['+@name+'] ';
			set @alter=@alter+'add constraint [DF_'+@name+'_'+@column+'] ';
			set @alter=@alter+'default '+@val+' for ['+@column+'];';
			print @alter;			
			fetch next from tb_cursor into @name,@column,@val;
		end
		close tb_cursor;
		deallocate tb_cursor;
		--设置是否允许为空
		if(LEN(@alter)>0)
		begin
			print '	';
		end
		
		if exists (SELECT * FROM #S WHERE (len(比较结果)>0) AND #S.[比较结果] = '是否允许空不同'
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0))
		begin
			print '--修改是否允许空';
		end
		
		set @alter='';
		declare tb_cursor cursor
		local for SELECT #S.[表名1],#s.[字段名],#s.[类型],#s.[允许空],#s.[占用字节数]
		FROM #S WHERE (len(比较结果)>0) AND #S.[比较结果] = '是否允许空不同'
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0);
		open tb_cursor
		fetch next from tb_cursor into @name,@column,@type,@isnull,@lenth
		while(@@fetch_status<>-1)
		begin
			set @alter='alter table [dbo].['+@name+'] ';
			set @alter=@alter+'alter column ['+@column+'] ';
			if(dbo.Comm_F_NumIsInGroup(@type,'binary,nchar,nvarchar,char,varbinary,varchar')=1)
			begin
				set @alter=@alter+'['+@type+']('+cast(@lenth as varchar)+') ';
			end
			else
			begin
				set @alter=@alter+@type+' ';
			end
			if(@isnull=0)
			begin
				set @alter=@alter+'not ';
			end
			set @alter=@alter+'null;';

			print @alter;			
			fetch next from tb_cursor into @name,@column,@type,@isnull,@lenth;
		end		
		close tb_cursor;
		deallocate tb_cursor;
		
		--占用字节数不同
		if(LEN(@alter)>0)
		begin
			print '	';
		end
		
		if exists (SELECT * FROM #S WHERE (len(比较结果)>0) AND #S.[比较结果] = '占用字节数'
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0))
		begin
			print '--修改占用字节数';
		end
		
		set @alter='';
		declare tb_cursor cursor
		local for SELECT #S.[表名1],#s.[字段名],#s.[类型],#s.[占用字节数]
		FROM #S WHERE (len(比较结果)>0) AND #S.[比较结果] = '占用字节数'
			AND (@ruleOut='' OR dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0);
		open tb_cursor
		fetch next from tb_cursor into @name,@column,@type,@lenth
		while(@@fetch_status<>-1)
		begin
			set @alter='alter table [dbo].['+@name+'] ';
			set @alter=@alter+'alter column ['+@column+'] ';
			if(dbo.Comm_F_NumIsInGroup(@type,'binary,char,varbinary,varchar')=1)
			begin
				set @alter=@alter+'['+@type+']('+cast(@lenth as varchar)+') ';
			end
			else if(dbo.Comm_F_NumIsInGroup(@type,'nchar,nvarchar')=1)
			begin
				set @alter=@alter+'['+@type+']('+cast(@lenth/2 as varchar)+') ';
			end
			else
			begin
				set @alter=@alter+@type;
			end

			print @alter+';';			
			fetch next from tb_cursor into @name,@column,@type,@lenth
		end		
		close tb_cursor;
		deallocate tb_cursor;
	end
	else
	begin
		select * from #S where (len(比较结果)>0)
			and (@ruleOut='' or dbo.Comm_F_NumIsInGroup([#S].[表名1],@ruleOut)=0);
    end
    --
	drop table #tb1;
	drop table #tb2;
	drop table #S;
	
	set nocount off;
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_StoreSaleOrderMonth]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<cyh>
-- Create date: <2016-01-08>
-- Description:	<门店月结报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_StoreSaleOrderMonth]
	-- Add the parameters for the stored procedure here
	@startDate VARCHAR(20),
	@endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @sortField VARCHAR(20)='Month desc',
    @CurrentPage	INT=1,			--当前页
	@PageSize		INT=20,				--页大小,
	@ispage SMALLINT=1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @Sql Nvarchar(Max);
    DECLARE @where NVARCHAR(2000);
    
	SET @where = ' (CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' ) AND StoreId=tb.StoreId AND CONVERT(VARCHAR(7),CreateDT,120)=CONVERT(VARCHAR(7),tb.CreateDT,120)'
    
    SET @Sql='
	SELECT CONVERT(VARCHAR(7),CreateDT,120) AS Month,dbo.F_StoreNameById(StoreId) Store,MIN(CreateDT) FirstTime,MAX(CreateDT) LastTime,
	CAST((SUM(TotalAmount)/COUNT(PaySN)) AS DECIMAL(18,2)) SaleOrderAverage,
	COUNT(PaySN) XSCount,SUM(TotalAmount) XSMoney,
	SUM(CASE WHEN ZSAmount is not null THEN 1 ELSE 0 END) ZSCount,ISNULL(SUM(ZSAmount),0) ZSMoney,
	(SELECT COUNT(1) FROM  dbo.SaleOrders sr WHERE '+@where+' AND (State = 1 or Type = 2)) AS TUICount ,
    (SELECT ISNULL(SUM(ABS(sr.TotalAmount)),0) FROM  dbo.SaleOrders sr WHERE '+@where+' AND (State = 1 or Type = 2)) AS TUIMoney ,
    (SELECT COUNT(1) FROM  dbo.SaleOrders sr WHERE '+@where+' AND State = 0 and Type = 1) AS HUANCount ,
    (SELECT ISNULL(SUM(sr.TotalAmount),0) FROM  dbo.SaleOrders sr WHERE '+@where+' AND State = 0 and Type = 1) AS HUANMoney ,
	(SELECT COUNT(1) FROM SaleOrders oo inner join WipeZero wz ON oo.PaySN=wz.PaySN
	WHERE wz.Number>0 and '+@where+') AS MLCount,
	(SELECT ISNULL(SUM(wz.Number),0) FROM SaleOrders oo inner join WipeZero wz ON oo.PaySN=wz.PaySN
	WHERE wz.Number>0 and '+@where+') AS MLMoney
	FROM
	(SELECT o.PaySN,o.CreateDT,o.StoreId,o.TotalAmount,ZSAmount FROM SaleOrders o
	LEFT JOIN
	(SELECT oo.PaySN AS ZSPaySN,SUM(od.PurchaseNumber*od.SysPrice) AS ZSAmount FROM SaleOrders oo INNER JOIN SaleDetail od ON od.PaySN=oo.PaySN
	WHERE oo.Type=0 and od.ActualPrice=0 GROUP BY oo.PaySN) ZS ON ZS.ZSPaySN=o.PaySN
	WHERE 1=1 AND o.CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' AND o.IsTest=0'
                 
    IF(LEN(@storeId)>0)
    BEGIN
		SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId)'
    END
    set @sql+=') tb GROUP BY StoreId,CONVERT(VARCHAR(7),CreateDT,120)'
            
	--EXECUTE sys.sp_executesql @Sql
	
    IF(@ispage<>1)
		BEGIN
			EXECUTE sys.sp_executesql @Sql
		END
    ELSE
		BEGIN
			SET @sql='SELECT * from(select (ROW_NUMBER() OVER ( ORDER BY '+@sortField+')) AS RSNO,* from ('+@Sql+') td) t';
			EXEC dbo.Comm_PageList @SqlStr = @Sql, -- nvarchar(max)
				@CurrentPage = @CurrentPage, -- int
				@PageSize = @PageSize -- int
		END
	
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_StoreSaleOrderDay]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<cyh>
-- Create date: <2015-12-30>
-- Description:	<门店日结报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_StoreSaleOrderDay]
	-- Add the parameters for the stored procedure here
	@companyId INT,
	@startDate VARCHAR(20),
	@endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @sortField VARCHAR(20)='Date desc',
    @datelen VARCHAR(3)='10',
    @CurrentPage	INT=1,			--当前页
	@PageSize		INT=20,				--页大小,
	@ispage SMALLINT=1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
       DECLARE @Sql nvarchar(max);
        DECLARE @where nvarchar(max);
        DECLARE @apisql nvarchar(max)='';
        DECLARE @apisum nvarchar(max)='';
		DECLARE @apitot nvarchar(max)='';
        DECLARE @apicode INT;
		DECLARE @apititle VARCHAR(50);
		DECLARE contact_cursor CURSOR FOR
		SELECT ApiCode,Title  FROM dbo.ApiLibrary a WHERE EXISTS(SELECT 1 FROM ConsumptionPayment WHERE ApiCode=a.ApiCode AND CompanyId=a.CompanyId and CompanyId=@companyId) ORDER BY ApiOrder
		--SELECT * FROM (VALUES('s'),('w'),('q')) AS V(A)
		SET @where = ' ISNULL(ReturnOrderUID,CreateUID)=tb.CreateUID AND CONVERT(VARCHAR('+@datelen+'),CreateDT,120)=CONVERT(VARCHAR('+@datelen+'),tb.CreateDT,120) AND oo.CompanyId=tb.CompanyId'+
		' AND ('''+@storeId+'''='''' or EXISTS ( SELECT 1 FROM  dbo.SplitString('''+@storeId+''','','',1) WHERE  Value = StoreId ))'

        SET @Sql='
        SELECT CONVERT(VARCHAR('+@datelen+'),CreateDT,120) AS Date,dbo.F_StoreNameById(StoreId, CompanyId) Store,MIN(CreateDT) FirstTime,MAX(CreateDT) LastTime,SUM(xj) XJMoney2 ,
		CASE WHEN SUM(TotalAmount)=0 THEN 0 else SUM(xscount) END XSCount ,SUM(TotalAmount) XSMoney ,SUM(Receive)+isnull(min(RechargeAmountin),0)-ISNULL(MIN(RechargeAmountout), 0) SSMoney ,ISNULL(SUM(TUIHuanCount), 0) TUIHuanCount ,ISNULL(SUM(TUIHuanMoney), 0) TUIHuanMoney ,
		SUM(CASE WHEN ZSAmount>0 THEN 1 ELSE 0 END) ZSCount,SUM(CASE WHEN ZSHunHeCount>1 THEN 1 ELSE 0 end) ZSHunHeCount,ISNULL(SUM(ZSAmount),0) ZSMoney,ISNULL(min(RechargeCountin),0) CZCount,ISNULL(min(RechargeAmountin),0) CZMoney,ISNULL(min(RechargeCountout),0) FCZCount,ISNULL(min(RechargeAmountout),0) FCZMoney,
		ISNULL(SUM(TUICount), 0) TUICount,ISNULL(SUM(TUIMoney), 0) TUIMoney,ISNULL(SUM(HUANCount), 0) HUANCount ,
        ISNULL(SUM(HUANMoney), 0) HUANMoney ,ISNULL(SUM(RLCount), 0) RLCount, ISNULL(SUM(RLMoney), 0) RLMoney,ISNULL(SUM(MLCount), 0) MLCount ,ISNULL(SUM(MLMoney), 0) MLMoney';
		OPEN contact_cursor
		FETCH NEXT FROM contact_cursor INTO @apicode,@apititle
		WHILE @@FETCH_STATUS=0
		BEGIN
			--PRINT 'apicode:'+CAST(@apicode AS VARCHAR(10))+',apititle:'+@apititle
			SET @apisql+=',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type=0 ) AS ['+@apititle+'_xs]'+
					',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type in(3)) AS ['+@apititle+'_tui]'+
					',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type in(1,2) AND o.Receive <= 0) AS ['+@apititle+'_tuihuang]'+
					',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type in(1) AND o.Receive > 0) AS ['+@apititle+'_huang]';
			SET @apisum+=',ISNULL(SUM(['+@apititle+'_xs]), 0) AS ['+@apititle+'_xs_dy]'+
						',ISNULL(SUM(['+@apititle+'_tui]), 0) AS ['+@apititle+'_tui_dy]'+
						',ISNULL(SUM(['+@apititle+'_tuihuang]), 0) AS ['+@apititle+'_tuihuang_dy]'+
						',ISNULL(SUM(['+@apititle+'_huang]), 0) AS ['+@apititle+'_huang_dy]';
			SET @apitot+=',SUM(['+@apititle+'_xs_dy]) as ['+@apititle+'_xs_dy],SUM(['+@apititle+'_tui_dy]) as ['+@apititle+'_tui_dy],SUM(['+@apititle+'_huang_dy]) as ['+@apititle+'_huang_dy],SUM(['+@apititle+'_tuihuang_dy]) as ['+@apititle+'_tuihuang_dy]';
			IF(@apicode=11)
			BEGIN
				SET @apisum+=',ISNULL(SUM(['+@apititle+'_xs]), 0)+ISNULL(SUM(['+@apititle+'_tui]), 0)+ISNULL(SUM(['+@apititle+'_tuihuang]),0)+ISNULL(SUM(['+@apititle+'_huang]),0) as [xjhj]';
			end
			--PRINT @apisql		
			FETCH NEXT FROM contact_cursor iNTO @apicode,@apititle
		END
		CLOSE contact_cursor
		DEALLOCATE contact_cursor
		IF(@apisum='')
		BEGIN
			SET @apisum+=',0 as [xjhj]';
		end
		SET @sql+=@apisum;
		SET @apisql+=',(select SUM(Amount) from(SELECT Amount FROM dbo.ConsumptionPayment WHERE PaySN=o.paysn and ApiCode=11
						UNION ALL 
						SELECT CASE WHEN Type=1 THEN Amount ELSE -Amount end FROM dbo.PosIncomePayout WHERE CompanyId=o.CompanyId and StoreId=o.StoreId AND CreateUID=o.CreateUID AND IsTest=0
						AND CONVERT(VARCHAR(20), o.CreateDT,120) BETWEEN '''+@startDate+''' AND '''+@endDate+''') t) xj'
		SET @sql+=' FROM
			(SELECT o.CompanyId ,
                            o.PaySN ,
                            o.CreateDT ,
                            ZSAmount ,
                            o.StoreId,
							o.Receive,
							RechargeAmountin ,
                            RechargeCountin ,
							RechargeAmountout ,
                            RechargeCountout ,
                            CASE WHEN [Type] IN(0) THEN o.Receive ELSE 0 END TotalAmount ,
                            CASE WHEN [Type] IN(0) THEN 1 ELSE 0 END XSCount ,
                            CASE WHEN [Type] IN ( 1, 2 ) AND o.Receive<=0 THEN 1 ELSE 0  END AS TUIHuanCount ,
							CASE WHEN [Type] IN ( 1, 2 ) AND o.Receive<=0 THEN o.Receive  ELSE 0 END AS TUIHuanMoney ,
							CASE WHEN [Type] IN ( 3 ) THEN 1 ELSE 0  END AS TUICount ,
							CASE WHEN [Type] IN ( 3 ) THEN o.Receive ELSE 0 END AS TUIMoney ,
							CASE WHEN [Type] = 1 AND o.Receive>0 THEN 1 ELSE 0 END AS HUANCount ,
							CASE WHEN [Type] = 1 AND o.Receive>0 THEN o.Receive ELSE 0 END AS HUANMoney ,
                            CASE WHEN OrderDiscount<>0 THEN 1 ELSE 0 END AS RLCount ,
                            CASE WHEN OrderDiscount<>0 THEN OrderDiscount ELSE 0 END AS RLMoney ,
							(SELECT COUNT(1) FROM dbo.SaleDetail WHERE PaySN IN(SELECT PaySN FROM dbo.SaleDetail WHERE PaySN=o.paysn and SalesClassifyId IN(49,161) AND o.Type=0)) ZSHunHeCount,
                            (SELECT  COUNT(1) FROM WipeZero WHERE  PaySN = o.PaySN) AS MLCount,
                            (SELECT  ISNULL(SUM(Number), 0) FROM WipeZero WHERE  PaySN = o.PaySN) AS MLMoney '+@apisql+' FROM SaleOrders o
		LEFT JOIN
		(SELECT oo.PaySN AS ZSPaySN,SUM(od.PurchaseNumber*od.SysPrice) AS ZSAmount FROM SaleOrders oo INNER JOIN SaleDetail od ON od.PaySN=oo.PaySN
		WHERE oo.Type=0 and od.SalesClassifyId in(49,161) GROUP BY oo.PaySN) ZS ON ZS.ZSPaySN=o.PaySN
		LEFT JOIN SysUserInfo u on u.UID=o.CreateUID
		LEFT JOIN(
			SELECT rc.StoreId,rc.CreateDT,SUM(rc.RechargeCountin) RechargeCountin,SUM(rc.RechargeAmountin) RechargeAmountin,SUM(rc.RechargeCountout) RechargeCountout,SUM(rc.RechargeAmountout) RechargeAmountout FROM(select StoreId,CONVERT(VARCHAR('+@datelen+'), CreateDT, 23) CreateDT,
				ISNULL(CASE WHEN Type=1 THEN COUNT(1) END,0) RechargeCountin,
				ISNULL(CASE WHEN Type=1 THEN SUM(RechargeAmount) END,0) RechargeAmountin,  
				ISNULL(CASE WHEN Type=2 THEN COUNT(1) END,0) RechargeCountout,
				ISNULL(CASE WHEN Type=2 THEN SUM(RechargeAmount) END,0) RechargeAmountout FROM dbo.MemberRecharge WHERE CompanyId='+CAST(@companyId AS VARCHAR(10))+'
			AND IsTest=0 AND CONVERT(VARCHAR(20), CreateDT, 120) BETWEEN '''+@startDate+''' AND '''+@endDate+''' and Type in(1,2) '
			IF(LEN(@storeId)>0)
			BEGIN
				SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId)'
			END
			ELSE
            BEGIN
				SET @sql+=' AND StoreId<>''00'' ';
            end
			SET @sql+='GROUP BY StoreId,CONVERT(VARCHAR('+@datelen+'), CreateDT, 23),Type
			) rc GROUP BY rc.StoreId,rc.CreateDT
		) r ON r.StoreId = o.StoreId AND r.CreateDT = CONVERT(VARCHAR('+@datelen+'), o.CreateDT, 23)
		WHERE 1=1 AND (CONVERT(varchar(20),o.CreateDT,120) BETWEEN '''+@startDate+''' AND '''+@endDate+''' ) AND EXISTS(SELECT 1 FROM dbo.SaleDetail WHERE PaySN=o.PaySN) AND o.IsTest=0 AND o.CompanyId='+CAST(@companyId AS VARCHAR(10))
                     
        IF(LEN(@storeId)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=o.StoreId)'
        END

        SET @sql+=') tb GROUP BY CompanyId,StoreId,CONVERT(VARCHAR('+@datelen+'),CreateDT,120)'

		EXEC printlong  @Sql

        IF(@ispage<>1)
		BEGIN
			--EXECUTE sys.sp_executesql @Sql
			set	@PageSize = 100000;
		END
        
		SET @sql='SELECT *,case when SSCount=0 then 0 else SSMoney/SSCount end as SaleOrderAverage from(select (ROW_NUMBER() OVER ( ORDER BY '+@sortField+')) AS RSNO,(XSCount+TUICount+TUIHuanCount+HUANCount-ZSCount+ZSHunHeCount+CZCount) AS SSCount,xjhj+czmoney-FCZMoney as XJMoney,* from ('+@Sql+') td) t';
		EXEC dbo.Comm_PageList @SqlStr = @Sql, -- nvarchar(max)
			@CurrentPage = @CurrentPage, -- int
			@PageSize = @PageSize -- int
		DECLARE @sql2 NVARCHAR(MAX)
		SET @sql2= N'SELECT ''合计:'' LastTime, SUM(SSMoney) SSMoney,SUM(SSCount) SSCount,SUM(XSMoney) XSMoney,SUM(XSCount) XSCount,SUM(ZSCount) ZSCount,SUM(ZSMoney) ZSMoney,SUM(TUICount) TUICount,SUM(TUIMoney) TUIMoney,SUM(TUIHuanCount) TUIHuanCount,SUM(TUIHuanMoney) TUIHuanMoney,SUM(HUANCount) HUANCount,SUM(HUANMoney) HUANMoney,SUM(MLCount) MLCount,SUM(MLMoney) MLMoney,SUM(CZCount) CZCount,SUM(CZMoney) CZMoney,SUM(FCZCount) FCZCount,SUM(FCZMoney) FCZMoney,SUM(RLCount) RLCount,SUM(RLMoney) RLMoney'+@apitot+' from ('+@sql+') t';
		EXECUTE sys.sp_executesql @sql2

END
GO
/****** Object:  Table [dbo].[OutboundGoodsHistory]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[OutboundGoodsHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OutboundId] [nvarchar](50) NOT NULL,
	[StorageBarcode] [nvarchar](50) NOT NULL,
	[Mode] [int] NOT NULL,
	[Number] [money] NOT NULL,
	[SaleBarcode] [nvarchar](50) NOT NULL,
	[StoreId] [varchar](3) NOT NULL,
	[CreateDt] [datetime] NOT NULL,
	[CreateUid] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoodsHistory', @level2type=N'COLUMN',@level2name=N'OutboundId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'源商品条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoodsHistory', @level2type=N'COLUMN',@level2name=N'StorageBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消减模式（1、批发量消减；2、组合商品消减；3、父商品拆分；4、拆分子商品入库;5、一品多码；）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoodsHistory', @level2type=N'COLUMN',@level2name=N'Mode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoodsHistory', @level2type=N'COLUMN',@level2name=N'Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批发条码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoodsHistory', @level2type=N'COLUMN',@level2name=N'SaleBarcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'门店Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoodsHistory', @level2type=N'COLUMN',@level2name=N'StoreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoodsHistory', @level2type=N'COLUMN',@level2name=N'CreateDt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人Uid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoodsHistory', @level2type=N'COLUMN',@level2name=N'CreateUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'批发出库库存消减记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OutboundGoodsHistory'
GO
/****** Object:  UserDefinedFunction [dbo].[F_ProductCategoryForSN]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-05-27
-- Description:	根据产品分类SN获取对应的分类名称
-- =============================================
CREATE FUNCTION [dbo].[F_ProductCategoryForSN]
(
	@CategorySN Int
)
RETURNS Nvarchar(50)
AS
BEGIN
	
	DECLARE @Title Nvarchar(50);
	SELECT @Title=[Title] FROM dbo.ProductCategory WHERE CategorySN=@CategorySN;
	RETURN ISNULL(@Title,'');

END
GO
/****** Object:  UserDefinedFunction [dbo].[F_ProductCategoryDescForSN]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2015-09-10
-- Description:	获取对应类别描述
-- =============================================
CREATE FUNCTION [dbo].[F_ProductCategoryDescForSN]
    (
      @categorySn INT ,--当前编号
      @grade INT ,--深度
      @desc INT = 1, --显示名称还是编号
	  @companyId int
    )
RETURNS VARCHAR(30)
AS
    BEGIN
        DECLARE @title VARCHAR(30);
        DECLARE @i INT=1;
        DECLARE @psn int;
        DECLARE @level INT;
        WHILE(@i<=3)
        BEGIN
			SELECT @title=title,@psn=CategoryPSN,@level=Grade FROM dbo.ProductCategory WHERE CompanyId=@companyId and CategorySN=@categorySn
			IF(@grade=@level)
				BREAK;
			IF(@level<@grade)
				BEGIN
					SET @title='';
					SET @categorySn=0;
					BREAK;
				end
			SET @categorySn=@psn;
			SET @i=@i+1;
        end
        IF ( @desc <> 1 )
			SET @title=@categorySn
        RETURN ISNULL(@title,'');
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_MakingCouponCard]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		cyb
-- Create date: 2016-08-25
-- Description: 获取制作优惠券列表信息（含搜索条件、分页）
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_MakingCouponCard]
	@CouponType int, --类别
	@CouponFrom int, --形式
	@State smallint, --状态
	@StoreIds varchar(2000),  --适用门店 
	@ExpiryStart varchar(10),  --有效期起始
	@ExpiryEnd varchar(10), --有效期结束
	@ReceiveStart varchar(10),  --领取期限起始
	@ReceiveEnd varchar(10), --领取期限结束
	@CreateUID varchar(40),  --创建人
	@CurrentPage	Int,	--当前页
	@PageSize		INT,	--页大小
	@CompanyId		INT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @RecordStart INT;
	DECLARE @RecordEnd INT;
	
	IF(@CurrentPage<=1)		
	BEGIN
		SET @RecordStart=1;
		SET @RecordEnd=@PageSize;
	END
	ELSE
	BEGIN
		SET @RecordStart=((@CurrentPage-1)*@PageSize)+1;
		SET @RecordEnd=@CurrentPage*@PageSize;
	END
	
	--
	;WITH RecordList AS 
	(
		SELECT (ROW_NUMBER() OVER ( ORDER BY a.CreateDT DESC)) AS RSNO,
			(CASE WHEN (a.StoreIds LIKE '-1,%') THEN '全部' ELSE (dbo.F_TrimStrMore(STUFF((SELECT '、'+w.Title FROM dbo.Warehouse w INNER join dbo.SplitString(a.StoreIds,',',1) s ON s.Value=w.StoreId FOR XML PATH('')),1,1,''),60)) END) AS StoreTitle,    
			a.Id,a.CompanyId,a.BatchSN,a.CouponType,a.CouponFrom,a.StoreIds,a.ProductTypes,a.ProductCode,a.MakeNumber,a.[State],a.ExpiryStart,a.ExpiryEnd,a.ReceiveStart,a.ReceiveEnd,a.CreateDT,a.CreateUID,
			(CASE WHEN (a.[State]=0 ) THEN '未生成' WHEN (a.[State]=1 ) THEN '未派发' WHEN (a.[State]=2 ) THEN '部分派发' WHEN (a.[State]=3 ) THEN '派发完成' WHEN (a.[State]=4 ) THEN '已过期' WHEN (a.[State]=5 ) THEN '已作废' END) AS StateTitle,               
			b.Title as CouponTypeTitle,
			c.Title as CouponFromTitle,
			(Select CONVERT(varchar(100), a.CreateDT, 23)) AS CreateDate,                  
			d.FullName as CreateUser,
			(case when(a.ProductTypes=-1) Then '全部商品' when (a.ProductTypes=2) Then '指定品类' when (a.ProductTypes=3) Then '具体商品' when (a.ProductTypes=4) Then '指定品牌' end) as ProductTypeTitle,
			(SELECT COUNT(*) FROM CouponCardDetail e WHERE e.CompanyId=a.CompanyId AND e.BatchSN=a.BatchSN AND (e.State=1 OR e.State=2)) AS ReceiveNumber
		FROM dbo.MakingCouponCard a 
		JOIN dbo.SysDataDictionary b on a.CouponType=b.DicSN
		JOIN dbo.SysDataDictionary c on a.CouponFrom=c.DicSN
		LEFT JOIN dbo.SysUserInfo d on a.CreateUID=d.[UID]
		WHERE 1=1 
		AND a.CompanyId=b.CompanyId
			AND a.CompanyId=c.CompanyId
		    AND (@CouponType=-1 OR (@CouponType !=-1 AND a.CouponType=@CouponType))
			AND (@CouponFrom=-1 OR (@CouponFrom !=-1 AND a.CouponFrom=@CouponFrom))
			AND (@State=-1 OR (@State !=-1 AND a.[State]=@State))
			AND (@ExpiryStart='-1' OR (@ExpiryStart !='-1' and a.ExpiryStart>=@ExpiryStart))   
			AND (@ExpiryEnd='-1' OR (@ExpiryEnd !='-1' and (a.ExpiryEnd<=@ExpiryEnd OR a.ExpiryEnd is null )))  
			AND (@ReceiveStart='-1' OR (@ReceiveStart !='-1' and a.ReceiveStart>=@ReceiveStart))   
			AND (@ReceiveEnd='-1' OR (@ReceiveEnd !='-1' and (a.ReceiveEnd<=@ReceiveEnd OR a.ReceiveEnd is null )))    
			--AND (@CreateUID='-1' OR (@CreateUID !='-1' AND a.CreateUID=@CreateUID))
			
			--查询条件包含单个门店
			--AND (
					--(@StoreIds !='-1' 
					--	AND (
					--			(a.StoreIds not like '%,%' and a.StoreIds=@StoreIds) or (a.StoreIds like @StoreIds+',%') or (a.StoreIds like '%,'+@StoreIds) or (a.StoreIds like '%,'+@StoreIds+',%') or a.StoreIds='0'
					--		)
					--) 
					--OR  @StoreIds = '-1'
				--)
			--查询条件包含多个门店
			AND (
					@StoreIds='-1' OR
					(
						EXISTS(
								SELECT * FROM dbo.SplitString(@StoreIds,',',1) 
								WHERE (a.StoreIds not like '%,%' and a.StoreIds=Value) or (a.StoreIds like Value+',%') or (a.StoreIds like '%,'+Value) or (a.StoreIds like '%,'+Value+',%') or a.StoreIds='0'
						      )
					)
					
				 )
			AND a.CompanyId=@CompanyId
	), RecordPage AS (
		SELECT MAX(RSNO) AS [RecordTotal]
				,(CASE WHEN @CurrentPage>Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN (Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)-1)*@PageSize+1
					   ELSE @RecordStart END
				  ) AS [RecordStart]
				,(CASE WHEN @CurrentPage>(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)*@PageSize
					   ELSE @RecordEnd END
				  ) AS [RecordEnd]									
		FROM RecordList
	) SELECT *
	FROM RecordList AS RL, RecordPage AS RP
	WHERE (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd);
	--
	
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_CashierSaleOrderMonth]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<cyh>
-- Create date: <2016-01-08>
-- Description:	<销售员月结报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_CashierSaleOrderMonth] 
@startDate VARCHAR(20),
	@endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @chshier VARCHAR(500)='',
    @saler VARCHAR(500)='',
    @sortField VARCHAR(20)='Cashier, Month desc',
    @CurrentPage	INT=1,			--当前页
	@PageSize		INT=20,				--页大小,
	@ispage SMALLINT=1  --是否分页
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @Sql Nvarchar(Max);
        DECLARE @where NVARCHAR(3000);
        
		SET @where = ' CreateUID=tb.CreateUID AND CONVERT(VARCHAR(7),CreateDT,120)=CONVERT(VARCHAR(7),tb.CreateDT,120)'
        
        SET @Sql='
        SELECT CONVERT(VARCHAR(7),CreateDT,120) AS Month,(UserCode+'' ''+FullName) Cashier,dbo.F_UserNameById(Salesman) Saler,MIN(CreateDT) FirstTime,MAX(CreateDT) LastTime,
		COUNT(PaySN) XSCount,SUM(TotalAmount) XSMoney,
		SUM(CASE WHEN ZSAmount>0 THEN 1 ELSE 0 END) ZSCount,ISNULL(SUM(ZSAmount),0) ZSMoney,
		(SELECT COUNT(1) FROM SalesReturns rr
		WHERE (rr.ReturnType=0 or rr.ReturnType=2) and '+@where+') AS TUICount,
		(SELECT ISNULL(SUM(rd.Number*rd.TradingPrice),0) FROM SalesReturns rr inner join SalesReturnsDetailed rd ON rd.ReturnId=rr.ReturnId
		WHERE (rr.ReturnType=0 or rr.ReturnType=2) and '+@where+') AS TUIMoney,
		(SELECT COUNT(1) FROM SaleOrders oo
		WHERE oo.Type=1 and '+@where+') AS HUANCount,
		(SELECT ISNULL(SUM(oo.TotalAmount),0) FROM SaleOrders oo
		WHERE oo.Type=1 and '+@where+') AS HUANMoney,
		(SELECT COUNT(1) FROM SaleOrders oo inner join WipeZero wz ON oo.PaySN=wz.PaySN
		WHERE wz.Number>0 and '+@where+') AS MLCount,
		(SELECT ISNULL(SUM(wz.Number),0) FROM SaleOrders oo inner join WipeZero wz ON oo.PaySN=wz.PaySN
		WHERE wz.Number>0 and '+@where+') AS MLMoney
		FROM
		(SELECT o.PaySN,o.CreateDT,o.CreateUID,ISNULL(o.Salesman,'''') Salesman,o.TotalAmount,ZSAmount,u.UserCode,u.FullName FROM SaleOrders o
		LEFT JOIN
		(SELECT oo.PaySN AS ZSPaySN,SUM(od.PurchaseNumber*od.SysPrice) AS ZSAmount FROM SaleOrders oo INNER JOIN SaleDetail od ON od.PaySN=oo.PaySN
		WHERE oo.Type=0 and od.ActualPrice=0 GROUP BY oo.PaySN) ZS ON ZS.ZSPaySN=o.PaySN
		LEFT JOIN SysUserInfo u on u.UID=o.CreateUID
		WHERE 1=1 AND (o.CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''' )'
                     
        IF(LEN(@storeId)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId)'
        END
        IF(LEN(@chshier)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@chshier+''','','',1) WHERE Value=o.CreateUID)'
        END
        IF(LEN(@saler)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@saler+''','','',1) WHERE Value=Salesman)'
        END
        
        --筛选出操作人当“月”无销售只有后台退货的记录
        SET @Sql+=' UNION SELECT NULL PaySN,rr.CreateDT,rr.CreateUID,NULL Salesman,0 TotalAmount,NULL ZSAmount,u.UserCode,u.FullName FROM SalesReturns rr
		LEFT JOIN SysUserInfo u ON u.UID=rr.CreateUID
		WHERE (rr.ReturnType=0 or rr.ReturnType=2) AND (rr.CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''')
		AND CONVERT(VARCHAR(7),rr.CreateDT,120) NOT IN (SELECT CONVERT(VARCHAR(7),CreateDT,120) FROM SaleOrders
		WHERE (CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''') and rr.CreateUID=CreateUID)'
		
		IF(LEN(@storeId)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=rr.StoreId)'
        END
        IF(LEN(@chshier)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@chshier+''','','',1) WHERE Value=rr.CreateUID)'
        END
        --
        
        SET @sql+=') tb GROUP BY CreateUID,Salesman,UserCode,FullName,CONVERT(VARCHAR(7),CreateDT,120)'
		
        IF(@ispage<>1)
			BEGIN
				EXECUTE sys.sp_executesql @Sql
			END
        ELSE
			BEGIN
				SET @sql='SELECT * from(select (ROW_NUMBER() OVER ( ORDER BY '+@sortField+')) AS RSNO,* from ('+@Sql+') td) t';
				EXEC dbo.Comm_PageList @SqlStr = @Sql, -- nvarchar(max)
					@CurrentPage = @CurrentPage, -- int
					@PageSize = @PageSize -- int
			END
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_CashierSaleOrderDay]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-12-22>
-- Description:	<导购员日,月结报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_CashierSaleOrderDay]
	@companyId INT,
    @startDate VARCHAR(20),
	@endDate VARCHAR(20),
    @storeId VARCHAR(100)='',
    @chshier VARCHAR(500)='',
    @saler VARCHAR(500)='',
    @sortField VARCHAR(20)='Cashier',
    @datelen VARCHAR(3)='10',
    @CurrentPage	INT=1,			--当前页
	@PageSize		INT=20,				--页大小,
	@ispage SMALLINT=1  --是否分页
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @Sql nvarchar(max);
        DECLARE @where nvarchar(max);
        DECLARE @apisql nvarchar(max)='';
        DECLARE @apisum nvarchar(max)='';
		DECLARE @apitot nvarchar(max)='';
        DECLARE @apicode INT;
		DECLARE @apititle VARCHAR(50);
		DECLARE contact_cursor CURSOR FOR
		SELECT ApiCode,Title  FROM dbo.ApiLibrary a WHERE EXISTS(SELECT 1 FROM ConsumptionPayment WHERE ApiCode=a.ApiCode AND CompanyId=a.CompanyId and CompanyId=@companyId) ORDER BY ApiOrder
		--SELECT * FROM (VALUES('s'),('w'),('q')) AS V(A)
		SET @where = ' ISNULL(ReturnOrderUID,CreateUID)=tb.CreateUID AND CONVERT(VARCHAR('+@datelen+'),CreateDT,120)=CONVERT(VARCHAR('+@datelen+'),tb.CreateDT,120) AND oo.CompanyId=tb.CompanyId'+
		' AND ('''+@storeId+'''='''' or EXISTS ( SELECT 1 FROM  dbo.SplitString('''+@storeId+''','','',1) WHERE  Value = StoreId ))'

        SET @Sql='
        SELECT CONVERT(VARCHAR('+@datelen+'),CreateDT,120) AS Date,(UserCode+'' ''+FullName) Cashier,MIN(CreateDT) FirstTime,MAX(CreateDT) LastTime,SUM(xj) XJMoney2 ,
		CASE WHEN SUM(TotalAmount)=0 THEN 0 else SUM(xscount) END XSCount ,SUM(TotalAmount) XSMoney ,SUM(Receive)+isnull(min(RechargeAmountin),0)-ISNULL(MIN(RechargeAmountout), 0) SSMoney ,ISNULL(SUM(TUIHuanCount), 0) TUIHuanCount ,ISNULL(SUM(TUIHuanMoney), 0) TUIHuanMoney ,
		SUM(CASE WHEN ZSAmount>0 THEN 1 ELSE 0 END) ZSCount,SUM(CASE WHEN ZSHunHeCount>1 THEN 1 ELSE 0 end) ZSHunHeCount,ISNULL(SUM(ZSAmount),0) ZSMoney,
		ISNULL(SUM(TUICount), 0) TUICount,ISNULL(SUM(TUIMoney), 0) TUIMoney,ISNULL(SUM(HUANCount), 0) HUANCount ,ISNULL(min(RechargeCountin),0) CZCount,ISNULL(min(RechargeAmountin),0) CZMoney,ISNULL(min(RechargeCountout),0) FCZCount,ISNULL(min(RechargeAmountout),0) FCZMoney,
        ISNULL(SUM(HUANMoney), 0) HUANMoney ,ISNULL(SUM(RLCount), 0) RLCount, ISNULL(SUM(RLMoney), 0) RLMoney ,ISNULL(SUM(MLCount), 0) MLCount ,ISNULL(SUM(MLMoney), 0) MLMoney';
		OPEN contact_cursor
		FETCH NEXT FROM contact_cursor INTO @apicode,@apititle
		WHILE @@FETCH_STATUS=0
		BEGIN
			--PRINT 'apicode:'+CAST(@apicode AS VARCHAR(10))+',apititle:'+@apititle
			SET @apisql+=',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type=0) AS ['+@apititle+'_xs]'+
					',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type in(3)) AS ['+@apititle+'_tui]'+
					',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type in(1,2) AND o.Receive <= 0) AS ['+@apititle+'_tuihuang]'+
					',(SELECT ISNULL(SUM(a.Received-a.Change),0) FROM ConsumptionPayment a WHERE a.PaySN=o.PaySN AND a.ApiCode='+CAST(@apicode AS VARCHAR(10))+' AND o.type in(1) AND o.Receive > 0) AS ['+@apititle+'_huang]';
			SET @apisum+=',ISNULL(SUM(['+@apititle+'_xs]), 0) AS ['+@apititle+'_xs_dy]'+
						',ISNULL(SUM(['+@apititle+'_tui]), 0) AS ['+@apititle+'_tui_dy]'+
						',ISNULL(SUM(['+@apititle+'_tuihuang]), 0) AS ['+@apititle+'_tuihuang_dy]'+
						',ISNULL(SUM(['+@apititle+'_huang]), 0) AS ['+@apititle+'_huang_dy]';
			SET @apitot+=',SUM(['+@apititle+'_xs_dy]) as ['+@apititle+'_xs_dy],SUM(['+@apititle+'_tui_dy]) as ['+@apititle+'_tui_dy],SUM(['+@apititle+'_huang_dy]) as ['+@apititle+'_huang_dy],SUM(['+@apititle+'_tuihuang_dy]) as ['+@apititle+'_tuihuang_dy]';
			IF(@apicode=11)
			BEGIN
				SET @apisum+=',ISNULL(SUM(['+@apititle+'_xs]), 0)+ISNULL(SUM(['+@apititle+'_tui]), 0)+ISNULL(SUM(['+@apititle+'_tuihuang]),0)+ISNULL(SUM(['+@apititle+'_huang]),0) as [xjhj]';
			end
			--PRINT @apisql		
			FETCH NEXT FROM contact_cursor iNTO @apicode,@apititle
		END
		CLOSE contact_cursor
		DEALLOCATE contact_cursor
		IF(@apisum='')
		BEGIN
			SET @apisum+=',0 as [xjhj]';
		end
		SET @sql+=@apisum;
		SET @apisql+=',(select SUM(Amount) from(SELECT Amount FROM dbo.ConsumptionPayment WHERE PaySN=o.paysn and ApiCode=11
						UNION ALL 
						SELECT CASE WHEN Type=1 THEN Amount ELSE -Amount end FROM dbo.PosIncomePayout WHERE CompanyId=o.CompanyId and StoreId=o.StoreId AND CreateUID=o.CreateUID AND IsTest=0
						AND CONVERT(VARCHAR(10), o.CreateDT, 23) BETWEEN '''+@startDate+''' AND '''+@endDate+''')  t) xj'
		DECLARE @start DATE;
		DECLARE @end DATE;
		SET @sql+=' FROM
			(SELECT o.CompanyId ,
                            o.PaySN ,
                            o.CreateDT ,
                            o.CreateUID ,
                            ZSAmount ,
                            u.UserCode ,
                            u.FullName,
							o.Receive,
							RechargeAmountin ,
                            RechargeCountin ,
							RechargeAmountout ,
                            RechargeCountout ,
							CASE WHEN [Type] IN(0) THEN o.Receive ELSE 0 END TotalAmount ,
                            CASE WHEN [Type] IN(0) THEN 1 ELSE 0 END XSCount ,
                            CASE WHEN [Type] IN ( 1, 2 ) AND o.Receive<=0 THEN 1 ELSE 0  END AS TUIHuanCount ,
							CASE WHEN [Type] IN ( 1, 2 ) AND o.Receive<=0 THEN o.Receive  ELSE 0 END AS TUIHuanMoney ,
							CASE WHEN [Type] IN ( 3 ) THEN 1 ELSE 0  END AS TUICount ,
							CASE WHEN [Type] IN ( 3 ) THEN o.Receive ELSE 0 END AS TUIMoney ,
							CASE WHEN [Type] = 1 AND o.Receive>0 THEN 1 ELSE 0 END AS HUANCount ,
							CASE WHEN [Type] = 1 AND o.Receive>0 THEN o.Receive ELSE 0 END AS HUANMoney ,
                            CASE WHEN OrderDiscount<>0 THEN 1 ELSE 0 END AS RLCount ,
                            CASE WHEN OrderDiscount<>0 THEN OrderDiscount ELSE 0 END AS RLMoney ,
							(SELECT COUNT(1) FROM dbo.SaleDetail WHERE PaySN IN(SELECT PaySN FROM dbo.SaleDetail WHERE PaySN=o.paysn and SalesClassifyId IN(49,161) AND o.Type=0)) ZSHunHeCount,
                            (SELECT  COUNT(1) FROM WipeZero WHERE  PaySN = o.PaySN) AS MLCount,
                            (SELECT  ISNULL(SUM(Number), 0) FROM WipeZero WHERE  PaySN = o.PaySN) AS MLMoney '+@apisql+' FROM SaleOrders o
		LEFT JOIN
		(SELECT oo.PaySN AS ZSPaySN,SUM(od.PurchaseNumber*od.SysPrice) AS ZSAmount FROM SaleOrders oo INNER JOIN SaleDetail od ON od.PaySN=oo.PaySN
		WHERE oo.Type=0 and od.SalesClassifyId in(49,161) GROUP BY oo.PaySN) ZS ON ZS.ZSPaySN=o.PaySN
		LEFT JOIN SysUserInfo u on u.UID=o.CreateUID
		LEFT JOIN(
			SELECT rc.CreateUID,rc.CreateDT,SUM(rc.RechargeCountin) RechargeCountin,SUM(rc.RechargeAmountin) RechargeAmountin,SUM(rc.RechargeCountout) RechargeCountout,SUM(rc.RechargeAmountout) RechargeAmountout FROM(select CreateUID,CONVERT(VARCHAR('+@datelen+'), CreateDT, 23) CreateDT,
				ISNULL(CASE WHEN Type=1 THEN COUNT(1) END,0) RechargeCountin,
				ISNULL(CASE WHEN Type=1 THEN SUM(RechargeAmount) END,0) RechargeAmountin,  
				ISNULL(CASE WHEN Type=2 THEN COUNT(1) END,0) RechargeCountout,
				ISNULL(CASE WHEN Type=2 THEN SUM(RechargeAmount) END,0) RechargeAmountout FROM dbo.MemberRecharge WHERE CompanyId='+CAST(@companyId AS VARCHAR(10))+'
			AND IsTest=0 AND CONVERT(VARCHAR(10), CreateDT, 23) BETWEEN '''+@startDate+''' AND '''+@endDate+''' and Type in(1,2) '
			IF(LEN(@storeId)>0)
			BEGIN
				SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId)'
			END
			ELSE
            BEGIN
				SET @sql+=' AND StoreId<>''00'' ';
            end
			SET @sql+='GROUP BY CreateUID,CONVERT(VARCHAR('+@datelen+'), CreateDT, 23),Type
			) rc GROUP BY rc.CreateUID,rc.CreateDT
		) r ON r.CreateUID = o.CreateUID AND r.CreateDT = CONVERT(VARCHAR('+@datelen+'), o.CreateDT, 23)
		WHERE 1=1 AND CONVERT(varchar(10),o.CreateDT,23) BETWEEN '''+@startDate+''' AND '''+@endDate+'''  AND EXISTS(SELECT 1 FROM dbo.SaleDetail WHERE PaySN=o.PaySN) AND o.IsTest=0 AND o.CompanyId='+CAST(@companyId AS VARCHAR(10))
                     
        IF(LEN(@storeId)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=StoreId)'
        END
        IF(LEN(@chshier)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@chshier+''','','',1) WHERE Value=o.CreateUID)'
        END
        IF(LEN(@saler)>0)
        BEGIN
			SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@saler+''','','',1) WHERE Value=Salesman)'
        END
        
        --筛选出操作人当“天”无销售只有后台退货的记录
  --      SET @Sql+=' UNION SELECT NULL PaySN,rr.CreateDT,rr.CreateUID,NULL Salesman,0 TotalAmount,NULL ZSAmount,u.UserCode,u.FullName FROM SalesReturns rr
		--LEFT JOIN SysUserInfo u ON u.UID=rr.CreateUID
		--WHERE (rr.ReturnType=0 or rr.ReturnType=2) AND (rr.CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''')
		--AND CONVERT(VARCHAR(10),rr.CreateDT,120) NOT IN (SELECT CONVERT(VARCHAR(10),CreateDT,120) FROM SaleOrders
		--WHERE (CreateDT BETWEEN '''+@startDate+''' AND '''+@endDate+''') and rr.CreateUID=CreateUID)'
		
		--IF(LEN(@storeId)>0)
  --      BEGIN
		--	SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@storeId+''','','',1) WHERE Value=rr.StoreId)'
  --      END
  --      IF(LEN(@chshier)>0)
  --      BEGIN
		--	SET @sql+=' AND EXISTS(SELECT 1 FROM dbo.SplitString('''+@chshier+''','','',1) WHERE Value=rr.CreateUID)'
  --      END
        --
		
        SET @sql+=') tb GROUP BY CompanyId,CreateUID,UserCode,FullName,CONVERT(VARCHAR('+@datelen+'),CreateDT,120)'
		--select SQL_VARIANT_PROPERTY(@Sql,'BaseType')
        IF(@ispage<>1)
		BEGIN
			--EXECUTE sys.sp_executesql @Sql
			set	@PageSize = 100000;
		END
        
		SET @sql='SELECT *,(XSCount+TUICount+TUIHuanCount+HUANCount-ZSCount+ZSHunHeCount+CZCount) AS SSCount,xjhj+czmoney-FCZMoney as XJMoney from(select (ROW_NUMBER() OVER ( ORDER BY '+@sortField+')) AS RSNO,* from ('+@Sql+') td) t';

		EXEC printlong @Sql

		EXEC dbo.Comm_PageList @SqlStr = @Sql, -- nvarchar(max)
			@CurrentPage = @CurrentPage, -- int
			@PageSize = @PageSize -- int
		DECLARE @sql2 NVARCHAR(MAX)
		SET @sql2= N'SELECT ''合计:'' LastTime,  SUM(SSMoney) SSMoney,SUM(SSCount) SSCount,SUM(XSMoney) XSMoney,SUM(XSCount) XSCount,SUM(ZSCount) ZSCount,SUM(ZSMoney) ZSMoney,SUM(CZCount) CZCount,SUM(CZMoney) CZMoney,SUM(FCZCount) FCZCount,SUM(FCZMoney) FCZMoney,SUM(TUICount) TUICount,SUM(TUIMoney) TUIMoney,SUM(TUIHuanCount) TUIHuanCount,SUM(TUIHuanMoney) TUIHuanMoney,SUM(HUANCount) HUANCount,SUM(HUANMoney) HUANMoney,SUM(MLCount) MLCount,SUM(MLMoney) MLMoney,SUM(RLCount) RLCount,SUM(RLMoney) RLMoney'+@apitot+' from ('+@sql+') t';
		EXECUTE sys.sp_executesql @sql2
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_GiftAnnualStatistical]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rpt_GiftAnnualStatistical]
 @startDate VARCHAR(20),
 @endDate VARCHAR(20),
 @supplier VARCHAR(500),
 @category VARCHAR(100),
 @store VARCHAR(100)
AS
BEGIN
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#T'))
 drop table #t;
with my1 as(
	select * from ProductCategory where ProductCategory.CategoryPSN =0 and EXISTS(SELECT 1 FROM dbo.SplitString(@category,',',1) WHERE CAST(Value AS int)=CategorySN)
	           union all select ProductCategory.* from my1, ProductCategory where my1.CategorySN = ProductCategory.CategoryPSN)
select CategorySN into #t from my1;
if exists(select name from sysobjects where type='u' and name='#T1') 
drop table #T1;
if exists(select name from sysobjects where type='u' and name='#store') 
drop table #store;
if exists(select name from sysobjects where type='u' and name='#tempRPTResult') 
drop table #tempRPTResult;
select tt.StoreId,tt.theMonth,tt.Id into  #store  from
(select a.StoreId,t.theMonth,a.Id from Warehouse  a
left join 

(
 select 1  as theMonth 
union all 
select 2
union all 
select 3
union all 
select 4
union all 
select 5
union all 
select 6
union all 
select 7
union all 
select 8
union all 
select 9
union all 
select 10
union all 
select 11
union all 
select 12
) as t on a.StoreId!=0) tt
where @store='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@store,',',1) WHERE Value=tt.StoreId)
order by tt.Id


select a.StoreId,MONTH(a.CreateDT) as theMonth,b.ActualPrice,b.SysPrice,b.PurchaseNumber into #T1  from SaleOrders a
left join SaleDetail b on a.PaySN =b.PaySN
where a.CreateDT>@startDate and a.CreateDT<@endDate
and b.Barcode in(select p.Barcode from ProductRecord p where (@supplier = '' or EXISTS(SELECT 1 FROM dbo.SplitString(@supplier,',',1) WHERE Value=p.SupplierId))and(p.CategorySN in (select * from #t) or @category ='') )


declare @sql varchar(8000)
declare @sql1 varchar(Max)
declare @createTable varchar(Max)
declare @execSql varchar(Max)

 set @sql1=''
 set @createTable=''
 SET @execSql=''
 declare @month int
 set @month = 1

  select @createTable =@createTable
+', TSale'+  CONVERT(varchar(20),a.StoreId, 0)+ ' varchar(40) null'
+', Tgift'+ CONVERT(varchar(20),a.StoreId, 0)+ ' varchar(40) null'
+', Ratio'+ CONVERT(varchar(20),a.StoreId, 0)+ ' varchar(40) null'
 from (select Distinct StoreId from  #store) a
  set @createTable=' month varchar(20)'+@createTable
 set @createTable = 'create table #tempRPTResult('+@createTable+')'
 -- exec(@createTable)
SET @execSql = @execSql + @createTable + ' '




 while(@month<=12)
 begin
  set @sql = ''
 select @sql = @sql
            +','''+CONVERT(varchar(20),ISNULL((select SUM(ActualPrice*PurchaseNumber) from #T1 where StoreId=a.StoreId and theMonth = @month and ActualPrice!=0),0),0)+''' TSale'+  CONVERT(varchar(20),a.StoreId, 0)
            +','''+CONVERT(varchar(20),ISNULL((select SUM(PurchaseNumber*SysPrice) from #T1  where  StoreId=a.StoreId and theMonth =@month   and ActualPrice=0),0),0)+''' Tgift'+ CONVERT(varchar(20),a.StoreId, 0)
			+','''+CONVERT(varchar(20),ISNULL((select SUM(PurchaseNumber*SysPrice) from #T1  where  StoreId=a.StoreId and theMonth =@month and ActualPrice=0) /(select SUM(ActualPrice*PurchaseNumber) from #T1  where StoreId=a.StoreId and theMonth = @month  and ActualPrice!=0),0),0)+''' Ratio'+ CONVERT(varchar(20),a.StoreId, 0)		
 from (select Distinct StoreId from  #store) a
 
 set @sql=CONVERT(varchar(20),@month, 0)+' month'+@sql

 set @sql1='Insert into #tempRPTResult select ' + @sql
  print( @sql1)
 --exec( @sql1) 
 SET @execSql = @execSql + @sql1 + ' '
 set @month =@month+1
end


--处理统计
set @sql=''
select @sql = @sql+
    +',CONVERT(varchar(20),Sum(CAST([TSale'+  CONVERT(varchar(20),a.StoreId, 0)+'] as decimal)),0) TSale'+  CONVERT(varchar(20),a.StoreId, 0)
    +',CONVERT(varchar(20),Sum(CAST([Tgift'+  CONVERT(varchar(20),a.StoreId, 0)+'] as decimal)),0) Tgift'+  CONVERT(varchar(20),a.StoreId, 0)
    +',CONVERT(varchar(20),cast(Sum(CAST([Tgift'+  CONVERT(varchar(20),a.StoreId, 0)+'] as decimal))/(CASE WHEN Sum(CAST([TSale'+  CONVERT(varchar(20),a.StoreId, 0)+'] as decimal))=0 THEN 1 else Sum(CAST([TSale'+  CONVERT(varchar(20),a.StoreId, 0)+'] as decimal)) end ) as numeric(10,2)),0) Ratio'+  CONVERT(varchar(20),a.StoreId, 0)
 from (select Distinct StoreId from  #store) a
 set @sql1=''
  set @sql='''合计'' month'+@sql
 set @sql1='Insert into  #tempRPTResult select  ' + @sql+' from #tempRPTResult'
 --print(@sql1)
 --exec( @sql1)
 SET @execSql = @execSql + @sql1 + ' select * from #tempRPTResult '
 EXEC(@execSql)
 
--select * from #tempRPTResult 

if exists(select name from sysobjects where type='u' and name='#tempRPTResult') 
drop table #tempRPTResult;
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_CouponCardDetail]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		cyb
-- Create date: 2016-09-19
-- Description: 获取领用优惠券列表信息（含搜索条件、分页）
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_CouponCardDetail]
	@CouponType int, --类别
	@CouponFrom int, --形式
	@State smallint, --状态
	@StoreIds varchar(2000),  --来源（即优惠券使用门店） 
	@Recipients varchar(40),  --派发员
	@ExpiryStart varchar(10),  --有效期起始
	@ExpiryEnd varchar(10), --有效期结束
	@CurrentPage	int,	--当前页
	@PageSize		int,	--页大小
	@CompanyId		int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @RecordStart INT;
	DECLARE @RecordEnd INT;
	
	IF(@CurrentPage<=1)		
	BEGIN
		SET @RecordStart=1;
		SET @RecordEnd=@PageSize;
	END
	ELSE
	BEGIN
		SET @RecordStart=((@CurrentPage-1)*@PageSize)+1;
		SET @RecordEnd=@CurrentPage*@PageSize;
	END
	
	--
	;WITH RecordList AS 
	(
		SELECT (ROW_NUMBER() OVER ( ORDER BY a.ReceiveDT DESC,a.TicketNo ASC)) AS RSNO,
			--(CASE WHEN (b.StoreIds LIKE '-1,%') THEN '全部' ELSE (dbo.F_TrimStrMore(STUFF((SELECT '、'+w.Title FROM dbo.Warehouse w INNER join dbo.SplitString(b.StoreIds,',',1) s ON s.Value=w.StoreId FOR XML PATH('')),1,1,''),60)) END) AS StoreTitle,    
			a.Id,a.CompanyId,a.BatchSN,a.TicketNo, b.CouponType,b.CouponFrom,
			a.[Source],b.ProductTypes,b.ExpiryStart,b.ExpiryEnd,
			(CASE WHEN (a.[State]=0 ) THEN '未派发' WHEN (a.[State]=1 ) THEN '未使用' WHEN (a.[State]=2 ) THEN '已使用' WHEN (a.[State]=3 ) THEN '已过期' WHEN (a.[State]=4 ) THEN '已作废' END) AS StateTitle,             
			c.Title as CouponTypeTitle,
			d.Title as CouponFromTitle,
			f.FullName as UserTitle,
			(case when(b.ProductTypes=-1) Then '全部商品' when (b.ProductTypes=2) Then '指定品类' when (b.ProductTypes=3) Then '具体商品' when (b.ProductTypes=4) Then '指定品牌' end) as ProductTypeTitle ,
			(Select CONVERT(varchar(100), a.ReceiveDT, 23)) AS ReceiveDate,     
			g.Title as SourceTitle,             
			e.FullName as RecipientTitle
		FROM dbo.CouponCardDetail a 
		JOIN dbo.MakingCouponCard b on a.BatchSN=b.BatchSN and a.CompanyId=b.CompanyId
		JOIN dbo.SysDataDictionary c on b.CouponType=c.DicSN  AND c.CompanyId=a.CompanyId
		JOIN dbo.SysDataDictionary d on b.CouponFrom=d.DicSN AND d.CompanyId=a.CompanyId
		LEFT JOIN dbo.SysUserInfo e on a.Recipients=e.[UID]
		LEFT JOIN dbo.SysUserInfo f on a.UsePerson=f.[UID]
		LEFT JOIN dbo.Warehouse g on a.[Source]=g.StoreId
		WHERE 1=1 
		    AND (@CouponType=-1 OR (@CouponType !=-1 AND b.CouponType=@CouponType))
			AND (@CouponFrom=-1 OR (@CouponFrom !=-1 AND b.CouponFrom=@CouponFrom))
			AND (@State=-1 OR (@State !=-1 AND a.[State]=@State))
			AND (@ExpiryStart='-1' OR (@ExpiryStart !='-1' and b.ExpiryStart>=@ExpiryStart))   
			AND (@ExpiryEnd='-1' OR (@ExpiryEnd !='-1' and (b.ExpiryEnd<=@ExpiryEnd OR b.ExpiryEnd is null )))  
			AND (@Recipients='-1' OR (@Recipients !='-1' AND a.Recipients=@Recipients))
			--查询条件包含多个来源（门店）
			--AND (
			--		@StoreIds='-1' OR
			--		(
			--			EXISTS(
			--					SELECT * FROM dbo.SplitString(@StoreIds,',',1) 
			--					WHERE (a.[Source] not like '%,%' and a.[Source]=Value) or (a.[Source] like Value+',%') or (a.[Source] like '%,'+Value) or (a.[Source] like '%,'+Value+',%') or a.[Source]='0'
			--			      )
			--		)
					
			--	 )
			AND (@StoreIds='-1' OR ( EXISTS(SELECT * FROM dbo.SplitString(@StoreIds,',',1) WHERE Value=a.[Source])))
			AND a.CompanyId=@CompanyId
	), RecordPage AS (
		SELECT MAX(RSNO) AS [RecordTotal]
				,(CASE WHEN @CurrentPage>Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN (Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)-1)*@PageSize+1
					   ELSE @RecordStart END
				  ) AS [RecordStart]
				,(CASE WHEN @CurrentPage>(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)*@PageSize
					   ELSE @RecordEnd END
				  ) AS [RecordEnd]									
		FROM RecordList
	) SELECT *
	FROM RecordList AS RL, RecordPage AS RP
	WHERE (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd);
	--
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_DataDicList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-11
-- Description: 根据数据字典名称分页信息等获取数据字典列表信息（含搜索条件、分页）
-- =============================================
CREATE PROCEDURE [dbo].[Sys_DataDicList]
	
	@Key			Nvarchar(100),	--关键词（分类）
	@CurrentPage	Int,			--当前页
	@PageSize		INT,			--页大小
	@CompanyId      INT             --企业标识
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @RecordStart INT;
	DECLARE @RecordEnd INT;
	
	IF(@CurrentPage<=1)		
	BEGIN
		SET @RecordStart=1;
		SET @RecordEnd=@PageSize;
	END
	ELSE
	BEGIN
		SET @RecordStart=((@CurrentPage-1)*@PageSize)+1;
		SET @RecordEnd=@CurrentPage*@PageSize;
	END
	--
	--DROP TABLE #tmp1
	select Id
		,DicSN
		,DicPSN
		,SortOrder
		,Title
		,Depth
		,[Status]
		into #tmp1 from dbo.SysDataDictionary WHERE DicPSN=0 AND CompanyId=@CompanyId
	;WITH RecordList AS 
	(
	
		SELECT (ROW_NUMBER() OVER ( ORDER BY t1.Title DESC)) AS RSNO 
			,*,stuff(
				(select '、' +Title
				from SysDataDictionary
				WHERE CompanyId=@CompanyId and DicPSN=t1.DicSN and DicSN not in (select DicPSN from #tmp1)
				AND [Status]=1
				order by DicPSN
				for xml path('')
				),1,1,'') as ItemsStr,
				(SELECT COUNT(1) FROM dbo.SysDataDictionary WHERE DicPSN= t1.DicSN) ItemsCount
		from #tmp1 t1
		WHERE (ISNULL(@Key,'')=''
				OR (t1.Title LIKE '%!'+@Key+'%' ESCAPE '!')
			)
		group by t1.Id,t1.DicSN,t1.DicPSN,t1.SortOrder,t1.Title,t1.Depth,t1.[Status]
		
		
	), RecordPage AS (
		SELECT MAX(RSNO) AS [RecordTotal]
				,(CASE WHEN @CurrentPage>Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN (Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)-1)*@PageSize+1
					   ELSE @RecordStart END
				  ) AS [RecordStart]
				,(CASE WHEN @CurrentPage>(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)*@PageSize
					   ELSE @RecordEnd END
				  ) AS [RecordEnd]									
		FROM RecordList
	) SELECT *
	FROM RecordList AS RL, RecordPage AS RP
	WHERE (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd);
	--
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_AllStoreRoles]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-11
-- Description:	获取所有门店角色设置数据
-- =============================================
CREATE PROCEDURE [dbo].[Sys_AllStoreRoles] 
	@companyId int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @storeroles VARCHAR(max);
	SET @storeroles='';
	select @storeroles = @storeroles+'|' + convert(varchar(4),StoreRoleId)+','+convert(varchar(50),StoreRoleName)
	from dbo.[Sys_F_StoreRoles]();
	SET @storeroles = stuff(@storeroles,1,1,'');
	
	SELECT Id,StoreId,Title, @storeroles ItemsStr
	FROM dbo.Warehouse
	WHERE CompanyId=@companyId and [State]=1;
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_AllRoleList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-02
-- Description:	获取所有角色管理列表数据源
-- =============================================
CREATE PROCEDURE [dbo].[Sys_AllRoleList]
	@companyId INT
AS
BEGIN

	SET NOCOUNT ON;

	select a.Id,a.RoleId,a.Title,a.LimitsIds,a.Memo,a.[Status]
	,(CASE WHEN (b.[ObjId] IS NOT null) THEN '已配置' ELSE '未配置' END) HasMenus
	,(CASE WHEN (a.LimitsIds<>'-1' AND LEN(a.LimitsIds)>0) THEN '已配置' ELSE '未配置' END) HasLimits
	,r1.UsersNum
	from SysRoles a
	LEFT JOIN (SELECT DISTINCT [ObjId] from dbo.SysCustomMenus) b ON b.[ObjId]=a.RoleId
	LEFT JOIN (
		SELECT RoleId,SUM(CONVERT(INT,num)) UsersNum 
		FROM (
		SELECT r.RoleId,r.Title,u.[UID],u.FullName,dbo.Comm_F_NumIsInGroup(r.roleId,u.RoleIds) num
		FROM dbo.SysRoles r,dbo.SysUserInfo u WHERE r.CompanyId=u.CompanyId and u.CompanyId=@companyId) a
		GROUP BY a.RoleId
	) r1 ON r1.RoleId=a.RoleId
	WHERE a.companyId=@companyId--16.03。24添加企业过滤
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_AllLimitList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-07-22
-- Description:	获取所有角色权限数据
-- =============================================
CREATE PROCEDURE [dbo].[Sys_AllLimitList] 
@roleIds VARCHAR(20),
@companyId INT
AS
    BEGIN
        SET NOCOUNT ON;
	
        SELECT DISTINCT
                PLimitId
        INTO    #tmp1
        FROM    SysLimits
		WHERE CompanyId=@companyId
        PRINT @roleIds
        --权限过滤,管理员除外
		SELECT DISTINCT t.LimitId INTO #tmp2 FROM(
			--取选择的父ID
			SELECT LimitId FROM dbo.SysLimits WHERE CompanyId=@companyId AND LimitId IN(
			SELECT DISTINCT l.PLimitId FROM  SysLimits l 
			where CompanyId=@companyId AND (
				--dbo.Comm_F_NumIsInGroup('4',@roleIds)=1 OR dbo.Comm_F_NumIsInGroup('9',@roleIds)=1 or
				EXISTS(SELECT 1 FROM dbo.SplitString((SELECT LimitsIds+',' FROM dbo.SysRoles WHERE CompanyId=@companyId AND dbo.Comm_F_NumIsInGroup(RoleId,@roleIds)=1 FOR XML PATH('')),',',1) WHERE Value=CAST(l.LimitId AS VARCHAR(4)))
				)
			)
			UNION ALL
			--取选择本身
			SELECT CAST(Value AS INT) FROM dbo.SplitString((SELECT LimitsIds+',' FROM dbo.SysRoles WHERE CompanyId=@companyId AND dbo.Comm_F_NumIsInGroup(RoleId,@roleIds)=1 FOR XML PATH('')),',',1)
			UNION ALL
			--取管理员
			SELECT LimitId FROM dbo.SysLimits WHERE CompanyId=@companyId AND (dbo.Comm_F_NumIsInGroup('4',@roleIds)=1 OR dbo.Comm_F_NumIsInGroup('9',@roleIds)=1)
		) t 
		
        SELECT  a.Id ,
                a.LimitId ,
                a.PLimitId ,
                a.Title ,
                a.[Status] ,
                pa.ItemsStr
        FROM    SysLimits a
                JOIN ( SELECT   PLimitId ,
                                STUFF(( SELECT  ';'
                                                + CONVERT(VARCHAR(4), LimitId)
                                                + ','
                                                + CONVERT(VARCHAR(4), [Status])
                                                + ',' + Title
                                        FROM    SysLimits
                                        WHERE   CompanyId=@companyId and PLimitId = t1.PLimitId
                                                AND LimitId NOT IN ( SELECT
                                                              PLimitId
                                                              FROM
                                                              #tmp1 )
                                                AND [Status] != 0
                                                AND EXISTS(SELECT 1 FROM #tmp2 WHERE LimitId=SysLimits.LimitId)
                                        ORDER BY PLimitId
                                      FOR
                                        XML PATH('')
                                      ), 1, 1, '') AS ItemsStr
                       FROM     #tmp1 t1
                       GROUP BY PLimitId
                     ) pa ON pa.PLimitId = a.LimitId
                JOIN #tmp2 c ON a.LimitId=c.LimitId
        WHERE   a.CompanyId = @companyId--16.03.24添加企业过滤
    END
GO
/****** Object:  StoredProcedure [dbo].[Sys_AddDic]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2015-05-27
-- Description:	新增数据字典
-- =============================================
CREATE PROCEDURE [dbo].[Sys_AddDic] 
	@DicPSN Int,
	@Title Nvarchar(50),
	@Status BIT,
	@CompanyId int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @SN Int;
	DECLARE @Order Int;
	DECLARE @Depth SmallInt;
	
	SELECT @Order=ISNULL(MAX(SortOrder),0)+1 FROM dbo.SysDataDictionary WHERE CompanyId=@CompanyId and DicPSN=@DicPSN;
	SELECT @SN=ISNULL(MAX(DicSN),0)+1 FROM dbo.SysDataDictionary WHERE CompanyId=@CompanyId
	SET @Depth=ISNULL((SELECT TOP 1 Depth FROM dbo.SysDataDictionary WHERE CompanyId=@CompanyId and DicSN=@DicPSN),0)+1;
	
	INSERT INTO dbo.SysDataDictionary(DicSN,DicPSN,SortOrder,Title,Depth,[Status],CompanyId)
							VALUES (@SN,@DicPSN,@Order,@Title,@Depth,@Status,@CompanyId);
							
	SELECT @@IDENTITY;							
END
GO
/****** Object:  StoredProcedure [dbo].[SyncStoreProductCategoryVersion]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SyncStoreProductCategoryVersion]
	@companyId INT,
	@storeId VARCHAR(10)
AS
BEGIN
--处理门店销售分类
WITH cte AS
(
    SELECT '' EntityType,l.SyncItemId,l.SyncItemVersion,l.CategorySN,0 AS lvl FROM ProductCategory l
    RIGHT JOIN Warehouse r ON  ','+r.CategorySN+',' LIKE '%,'+ CONVERT(VARCHAR(200),l.CategorySN) +',%' AND r.CompanyId= @companyId  AND l.CompanyId= @companyId
	WHERE  r.StoreId=@storeId
    UNION ALL
    SELECT  '' EntityType,d.SyncItemId,d.SyncItemVersion,d.CategorySN,lvl+1 FROM cte c 
	INNER JOIN ProductCategory d ON c.CategorySN = d.CategoryPSN AND d.CompanyId= @companyId
)
SELECT *  FROM cte ;
END
GO
/****** Object:  StoredProcedure [dbo].[SyncStoreProductCategory]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SyncStoreProductCategory]
	@companyId INT,
	@storeId VARCHAR(10),
	@syncId varchar(5000)
AS
BEGIN
--处理门店销售分类
WITH cte AS
(
    SELECT l.*,convert(nvarchar(200),l.CategorySN) CategorySNPath,0 AS lvl FROM ProductCategory l
    RIGHT JOIN Warehouse r ON  ','+r.CategorySN+',' LIKE '%,'+ CONVERT(VARCHAR(200),l.CategorySN) +',%' AND r.CompanyId= @companyId  AND l.CompanyId= @companyId
	WHERE  r.StoreId=@storeId
    UNION ALL
    SELECT  d.*,convert(nvarchar(200),(c.CategorySNPath+'/'+ convert(varchar(200),d.CategorySN))) CategorySNPath,lvl+1 FROM cte c 
	INNER JOIN ProductCategory d ON c.CategorySN = d.CategoryPSN AND d.CompanyId= @companyId
)
SELECT *  FROM cte WHERE (','+ @syncId +',') like ('%,' + convert(varchar(200) ,cte.SyncItemId)  +',%')
END
GO
/****** Object:  StoredProcedure [dbo].[SyncProductRecordVersion]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SyncProductRecordVersion]
@storeId nvarchar(50),
@token int
AS
BEGIN

if object_id('tempdb..#tempCategoryForStoreInventory') is not null Begin
	drop table #tempCategoryForStoreInventory
end;
--处理门店销售分类
with cte as
(
    select l.SyncItemVersion,l.CategorySN from ProductCategory l
    right join Warehouse r on  ','+r.CategorySN+',' like '%,'+ convert(varchar(200),l.CategorySN) +',%' and r.CompanyId= @token  and l.CompanyId= @token
	where  r.StoreId=@storeId
    union all
    select d.SyncItemVersion,d.CategorySN from cte c 
	inner join ProductCategory d on c.CategorySN = d.CategoryPSN and d.CompanyId= @token
)
select *  into #tempCategoryForStoreInventory from cte ;


---初始化基础信息
select 
t1.SyncItemId,'' EntityType,
(SELECT MAX(T.SyncItemVersion) FROM
(
SELECT  t1.SyncItemVersion SyncItemVersion
UNION ALL
SELECT  t4.SyncItemVersion SyncItemVersion from ProductBrand t4 where t1.BrandSN = t4.BrandSN and t4.CompanyId =@token 
UNION ALL
SELECT SyncItemVersion FROM Inventory I WHERE I.CompanyId=@token AND I.Barcode = T1.Barcode AND I.StoreId = @storeId
UNION ALL 
SELECT SyncItemVersion FROM ProductMultSupplier I WHERE  I.CompanyId=@token AND I.Barcode = T1.Barcode 
UNION ALL
SELECT SyncItemVersion FROM ProductMultPrice I WHERE I.CompanyId=@token AND I.Barcode = T1.Barcode AND I.StoreId = @storeId
UNION ALL
SELECT (case WHEN R2.SyncItemVersion >R1.SyncItemVersion THEN   R2.SyncItemVersion ELSE  R1.SyncItemVersion END) FROM ProductChangePrice R1,ProductChangePriceList R2
WHERE R1.CompanyId=@token AND R2.Barcode = T1.Barcode AND (','+R1.StoreId+',') like ('%,'+@storeId+',%') and R1.Id = R2.ChangePriceId
) AS T)
 SyncItemVersion
from ProductRecord t1 
left join #tempCategoryForStoreInventory t2 on t1.CategorySN = t2.CategorySN  
WHERE t1.Barcode is not null AND t2.CategorySN is not NULL
	drop table #tempCategoryForStoreInventory;
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_UpdateSysLimit]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-15
-- Description: 根据权限数据信息修改对应记录
-- =============================================
CREATE PROCEDURE [dbo].[Sys_UpdateSysLimit]

	@id				INT,	--权限Id
	@title			VARCHAR(200),	--权限名称
	@plimitid		INT,	--父级权限ID
	@status			INT		--权限状态
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @pdepth INT;
	DECLARE @depth INT;
	DECLARE @dep INT;
	
	SELECT @pdepth=depth FROM dbo.SysLimits WHERE plimitid=@plimitid
	SELECT @depth=depth FROM dbo.SysLimits WHERE Id=@Id
	SET @dep = ISNULL(@depth,0)-ISNULL(@pdepth,0);
	
	SELECT @pdepth,@depth,@dep
	
	UPDATE SysLimits SET Title=@title,plimitid=@plimitid,[status]=@status,depth=depth-@dep
	WHERE Id=@Id
	IF(@pdepth<>1)
	BEGIN
		;WITH tree
		 AS
		(    
		 SELECT * FROM dbo.SysLimits  WHERE Id=@id     
		 UNION ALL   
		 SELECT a.* FROM dbo.SysLimits a, tree   WHERE TREE.LimitId = a.PLimitId
		) 
		SELECT distinct * INTO #t1  FROM tree order by LimitId
		
		UPDATE a SET a.Depth=a.Depth-@dep 
		FROM dbo.SysLimits a
		JOIN #t1 t1 ON t1.LimitId=a.LimitId
		WHERE a.Id<>@Id;
	END
	select 1
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_SetLimitChildDepthByLimitId]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-15
-- Description: 根据父级权限ID设置子集的深度
-- =============================================
CREATE PROCEDURE [dbo].[Sys_SetLimitChildDepthByLimitId]

	@LimitId		Int				--父级权限ID
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @pdepth INT;
	DECLARE @depth INT;
	DECLARE @dep INT;
	
	SET @pdepth=(SELECT depth FROM dbo.SysLimits WHERE LimitId=(SELECT PLimitId FROM dbo.SysLimits WHERE LimitId=@LimitId))
	SET @depth=(SELECT depth FROM dbo.SysLimits WHERE LimitId=@LimitId)
	
	SET @dep = ISNULL(@depth,0)-ISNULL(@pdepth,0);
	
	WITH tree
	 AS
	(    
	 SELECT * FROM dbo.SysLimits  WHERE PLimitId=0     
	 UNION ALL   
	 SELECT a.* FROM dbo.SysLimits a, tree   WHERE TREE.LimitId = a.PLimitId
	) 
	SELECT distinct * INTO #t1 FROM tree order by LimitId
	
	UPDATE a SET Depth=Depth-@dep FROM dbo.SysLimits a
	JOIN #t1 ON t1.LimitId=a.LimitId
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_RoleList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-31
-- Description:	获取角色管理列表数据源
-- =============================================
CREATE PROCEDURE [dbo].[Sys_RoleList]
	@companyId		INT
AS
BEGIN

	SET NOCOUNT ON;

	select a.Id,a.RoleId,a.Title,a.LimitsIds,a.Memo,a.[Status]
	,(CASE WHEN (b.[ObjId] IS NOT null) THEN '已配置' ELSE '未配置' END) HasMenus
	,(CASE WHEN (a.LimitsIds<>'-1' AND LEN(a.LimitsIds)>0) THEN '已配置' ELSE '未配置' END) HasLimits
	,r1.UsersNum
	from SysRoles a
	LEFT JOIN (SELECT DISTINCT [ObjId] from dbo.SysCustomMenus) b ON b.[ObjId]=a.RoleId
	LEFT JOIN (
		SELECT RoleId,SUM(CONVERT(INT,num)) UsersNum 
		FROM (
		SELECT r.RoleId,r.Title,u.[UID],u.FullName,dbo.Comm_F_NumIsInGroup(r.roleId,u.RoleIds) num
		FROM dbo.SysRoles r,dbo.SysUserInfo u WHERE r.CompanyId=u.CompanyId and u.CompanyId=@companyId) a
		GROUP BY a.RoleId
	) r1 ON r1.RoleId=a.RoleId
	where a.ShowView=1 AND a.companyId=@companyId
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_PaymentList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		cyb
-- Create date: 2016-02-02
-- Description: 获取支付配置列表信息（含搜索条件、分页）
-- =============================================
CREATE PROCEDURE [dbo].[Sys_PaymentList]
	@PayType     	SMALLINT,		--支付类型（1：支付宝，2：微信支付）
	@StoreId		Nvarchar(300),	--适用门店
	@State		    SMALLINT,	    --状态
	@CurrentPage	Int,			--当前页
	@PageSize		INT,				--页大小
	@CompanyId		INT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @RecordStart INT;
	DECLARE @RecordEnd INT;
	
	IF(@CurrentPage<=1)		
	BEGIN
		SET @RecordStart=1;
		SET @RecordEnd=@PageSize;
	END
	ELSE
	BEGIN
		SET @RecordStart=((@CurrentPage-1)*@PageSize)+1;
		SET @RecordEnd=@CurrentPage*@PageSize;
	END
	
	--
	;WITH RecordList AS 
	(
		SELECT (ROW_NUMBER() OVER ( ORDER BY a.AlterDT DESC)) AS RSNO,
			(CASE WHEN (a.StoreId LIKE '-1,%') THEN '全部' ELSE (dbo.F_TrimStrMore(STUFF((SELECT '、'+w.Title FROM dbo.Warehouse w INNER join dbo.SplitString(a.storeId,',',1) s ON s.Value=w.StoreId FOR XML PATH('')),1,1,''),60)) END) AS StoreTitle,                       
			a.Id,a.StoreId,a.PayType,a.[State],a.PartnerId,a.AppId,a.CheckKey,a.NotifyUrl, (Select CONVERT(varchar(100), a.AlterDT, 23)) AS AlterDate,(CASE WHEN (a.State=0 ) THEN '停用' ELSE '可用' END) AS StateTitle                     
		FROM dbo.SysPaymentSetting a 
		WHERE 1=1 		
			AND (@PayType !=-1 AND a.PayType=@PayType) 
			AND (
					(@StoreId !='-1' 
						AND (
								(a.StoreId not like '%,%' and a.StoreId=@StoreId) or (a.StoreId like @StoreId+',%') or (a.StoreId like '%,'+@StoreId) or (a.StoreId like '%,'+@StoreId+',%') or a.StoreId='0'
							)
					) 
					OR  @StoreId = '-1'
				)
			AND ((@State !=-1 AND a.[State]=@State) OR @State=-1)
			AND a.CompanyId=@CompanyId
	), RecordPage AS (
		SELECT MAX(RSNO) AS [RecordTotal]
				,(CASE WHEN @CurrentPage>Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN (Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)-1)*@PageSize+1
					   ELSE @RecordStart END
				  ) AS [RecordStart]
				,(CASE WHEN @CurrentPage>(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)*@PageSize
					   ELSE @RecordEnd END
				  ) AS [RecordEnd]									
		FROM RecordList
	) SELECT *
	FROM RecordList AS RL, RecordPage AS RP
	WHERE (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd);
	--
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_Menu_Sync]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-12-04>
-- Description:	<同步更新菜单,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sys_Menu_Sync]
	-- Add the parameters for the stored procedure here
	@companyId INT--最新的商户菜单
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @cid INT;
	DECLARE contact_cursor CURSOR FOR
	SELECT DISTINCT CompanyId FROM dbo.SysMenus WHERE CompanyId<>@companyId
	OPEN contact_cursor
	FETCH NEXT FROM contact_cursor INTO @cid
	WHILE @@FETCH_STATUS=0
	BEGIN
		INSERT SysMenus(CompanyId,MenuId,PMenuId,SortOrder,Title,url,Status,Type)
		SELECT @cid,MenuId,PMenuId,SortOrder,Title,url,Status,Type FROM dbo.SysMenus s WHERE CompanyId=@companyId
		AND not EXISTS(SELECT 1 FROM dbo.SysMenus WHERE MenuId=s.MenuId AND CompanyId=@cid)
		FETCH NEXT FROM contact_cursor iNTO @cid
	END;
	CLOSE contact_cursor
	DEALLOCATE contact_cursor
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_LogList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-11
-- Description: 获取日志列表信息（含搜索条件、分页）
-- =============================================
CREATE PROCEDURE [dbo].[Sys_LogList]
	@startDate VARCHAR(10),
	@endDate VARCHAR(10),
	@Type			Int,			--日志类型
	@Key			Nvarchar(100),	--关键词（帐号/IP）
	@CurrentPage	Int,			--当前页
	@PageSize		INT,				--页大小
	@CompanyId		INT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @RecordStart INT;
	DECLARE @RecordEnd INT;
	
	IF(@CurrentPage<=1)		
	BEGIN
		SET @RecordStart=1;
		SET @RecordEnd=@PageSize;
	END
	ELSE
	BEGIN
		SET @RecordStart=((@CurrentPage-1)*@PageSize)+1;
		SET @RecordEnd=@CurrentPage*@PageSize;
	END
	
	--
	
	;WITH RecordList AS 
	(
		SELECT (ROW_NUMBER() OVER ( ORDER BY l.CreateDT DESC)) AS RSNO 
			,l.Id
			,l.[Type]
			,l.[UId]
			,l.Summary
			,l.ClientIP
			,l.ServerName
			,l.CreateDT
			,u1.LoginName
			,l.ModuleName
		FROM dbo.SysLog as l
		LEFT JOIN dbo.SysUserInfo u1 ON u1.[UID]=l.[UId]
		WHERE (ISNULL(@Key,'')=''
				OR (u1.[LoginName] LIKE '%!'+@Key+'%' ESCAPE '!')
				OR (l.ClientIP LIKE '%!'+@Key+'%' ESCAPE '!')
				) 
				AND (l.[Type]=@Type OR @Type=0)
				AND (ISNULL(@startDate,'')='' OR CONVERT(VARCHAR(10), l.CreateDT,120) BETWEEN @startDate AND @endDate)
				AND (l.CompanyId=@CompanyId)--16.03.24添加企业过滤
	), RecordPage AS (
		SELECT MAX(RSNO) AS [RecordTotal]
				,(CASE WHEN @CurrentPage>Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN (Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)-1)*@PageSize+1
					   ELSE @RecordStart END
				  ) AS [RecordStart]
				,(CASE WHEN @CurrentPage>(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)*@PageSize
					   ELSE @RecordEnd END
				  ) AS [RecordEnd]									
		FROM RecordList
	) SELECT *
	FROM RecordList AS RL, RecordPage AS RP
	WHERE (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd);
	--
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_LimitIdsByUID]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-03
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Sys_LimitIdsByUID] 
	@UID VARCHAR(50)	--当前用户UID
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @roleids VARCHAR(2000);
	DECLARE @menuids VARCHAR(max);
	DECLARE @companyId int;
	SELECT @roleids=roleids,@companyId=CompanyId FROM dbo.SysUserInfo WHERE [uid]=@UID AND [Status]=1
	
	IF(@roleids IS NOT NULL AND len(@roleids)>0)
	BEGIN
		SELECT @menuids=stuff(
				(select ',' +LimitsIds
				FROM dbo.SysRoles a
				JOIN (
					SELECT a.* from SplitString(@roleids,',',1) a
					JOIN dbo.SysRoles b ON convert(VARCHAR(4),b.RoleId)=a.Value
					WHERE b.CompanyId=@companyId and b.[Status]=1
				) b on b.VALUE=a.RoleId
				WHERE a.CompanyId=@companyId AND [Status]=1
				order by RoleId
				for xml path('')
				),1,1,'')
	END
	
	IF(@menuids IS NOT NULL AND LEN(@menuids)>0)
	BEGIN
		SELECT LimitId Id
			,LimitId Value
			,PLimitId ParentId
			,Title Name
			,[Status]
			,NULL [Level]
		FROM dbo.SysLimits a
		JOIN (SELECT DISTINCT Value FROM dbo.SplitString(@menuids,',',1)) b ON b.Value=a.LimitId
		WHERE a.CompanyId=@companyId and a.[Status]<>0
		order by a.LimitId
	END
	ELSE
	BEGIN
		SELECT LimitId Id
			,LimitId Value
			,PLimitId ParentId
			,Title Name
			,[Status]
			,NULL [Level]
		FROM dbo.SysLimits
		WHERE 1=2
	END					
END

--[Sys_HomeMenusByUID1] 'b9e91bda16f04adb8770c7341158ccb7'

--[Sys_HomeMenusByUID1] 'b20b0206a05c4fab97e526db06e72acc'
GO
/****** Object:  StoredProcedure [dbo].[Sys_LimitIdsByRoleId]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2015-08-03
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Sys_LimitIdsByRoleId] 
	@RoleId VARCHAR(50),	--角色ID
	@companyId INT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @roleids VARCHAR(2000);
	DECLARE @menuids VARCHAR(max);

	IF(len(@RoleId)>0)
	BEGIN
		SELECT @menuids=stuff(
				(select ',' +LimitsIds
				FROM dbo.SysRoles a
				JOIN (
					SELECT a.* from SplitString(@RoleId,',',1) a
					JOIN dbo.SysRoles b ON convert(VARCHAR(4),b.RoleId)=a.Value
					WHERE b.CompanyId=@companyId and b.[Status]=1
				) b on b.VALUE=a.RoleId
				WHERE a.CompanyId=@companyId AND [Status]=1
				order by RoleId
				for xml path('')
				),1,1,'')
	END
	
	IF(@menuids IS NOT NULL AND LEN(@menuids)>0)
	BEGIN
		SELECT LimitId Id
			,LimitId Value
			,PLimitId ParentId
			,Title Name
			,[Status]
			,NULL [Level]
		FROM dbo.SysLimits a
		JOIN (SELECT DISTINCT Value FROM dbo.SplitString(@menuids,',',1)) b ON b.Value=a.LimitId
		WHERE a.CompanyId=@companyId AND a.[Status]<>0
		order by a.LimitId
	END
	ELSE
	BEGIN
		SELECT LimitId Id
			,LimitId Value
			,PLimitId ParentId
			,Title Name
			,[Status]
			,NULL [Level]
		FROM dbo.SysLimits
		WHERE 1=2
	END					
END

--[Sys_HomeMenusByUID1] 'b9e91bda16f04adb8770c7341158ccb7'

--[Sys_HomeMenusByUID1] 'b20b0206a05c4fab97e526db06e72acc'
GO
/****** Object:  StoredProcedure [dbo].[Sys_HomeMenusByUID]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-03
-- Description:	首页菜单根据用户UID获取数据
-- =============================================
CREATE PROCEDURE [dbo].[Sys_HomeMenusByUID] 
	@UID VARCHAR(50),	--当前用户UID
	@Type SMALLINT=0  --菜单类型 0-系统，1-门店
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @roleids VARCHAR(2000);
	DECLARE @menuids VARCHAR(max);
	DECLARE @companyId int;
	
	SELECT @roleids=roleids,@companyId=CompanyId FROM dbo.SysUserInfo WHERE [uid]=@UID AND [Status]=1
	
	IF(@roleids IS NOT NULL AND len(@roleids)>0)
	BEGIN
		SELECT @menuids=stuff(
				(select ',' +MenuIds
				FROM dbo.SysCustomMenus a
				JOIN (
					SELECT a.* from SplitString(@roleids,',',1) a
					JOIN dbo.SysRoles b ON convert(VARCHAR(4),b.RoleId)=a.Value
					WHERE b.CompanyId=@companyId and b.[Status]=1
				) b on b.VALUE=a.[ObjId]
				WHERE a.CompanyId=@companyId AND [Type]=2
				order by MenuIds
				for xml path('')
				),1,1,'')
	END
	
	IF(@menuids IS NOT NULL AND LEN(@menuids)>0)
	BEGIN
		SELECT MenuId Id
			,MenuId Value
			,PMenuId ParentId
			,Title Name
			,Url
			,[Status]
			,NULL [Level]
		FROM dbo.SysMenus a
		JOIN (SELECT DISTINCT Value FROM dbo.SplitString(@menuids,',',1)) b ON b.Value=a.MenuId
		WHERE a.CompanyId=@companyId AND a.type=@Type and a.[Status]=1
		order by a.SortOrder
	END
	IF(LEN(@UID)<=0)
	BEGIN
		SELECT MenuId Id
			,MenuId Value
			,PMenuId ParentId
			,Title Name
			,Url
			,[Status]
			,NULL [Level]
		FROM dbo.SysMenus
		WHERE CompanyId=@companyId AND type=@Type and Status=1
		order by SortOrder
	END					
END

--[Sys_HomeMenusByUID1] 'b9e91bda16f04adb8770c7341158ccb7'

--[Sys_HomeMenusByUID1] 'b20b0206a05c4fab97e526db06e72acc'
GO
/****** Object:  UserDefinedFunction [dbo].[Sys_F_RoleTitlesByIds]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    ywb
-- Create date: 2015-07-22
-- Description: 根据一个或多个角色Id获得一个或多个角色名称并以逗号分隔
-- =============================================
CREATE FUNCTION [dbo].[Sys_F_RoleTitlesByIds]
(
  @roleids varchar(2000),  --组织机构RoleId,RoleId,RoleId
  @companId int
)
RETURNS varchar(2000)
AS
BEGIN
  declare @result VARCHAR(2000);
  set @result='';
  
  SET @roleids=ISNULL(@roleids,'');
  --todo:
  select @result=@result+b.Title+',' from  [dbo].[SplitString](@roleids,',',1) as a
  join SysRoles b on b.RoleId=a.Value AND b.CompanyId=@companId
  
  IF LEN(@result)>0
  SET @result = LEFT(@result,len(@result)-1)
  
  RETURN @result;

END
GO
/****** Object:  UserDefinedFunction [dbo].[Sys_F_DepUsersNum]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-07-22
-- Description:	根据组织机构Id获取组织机构子成员数量
-- =============================================
CREATE FUNCTION [dbo].[Sys_F_DepUsersNum]
(
	@depid INT,	--组织机构DepId
	@companyId int
)
RETURNS int
AS
BEGIN
	declare @result int;
	set @result=0;
	
	SELECT @result=COUNT(*) FROM dbo.SysUserInfo WHERE CompanyId=@companyId and BumenId=@depid;
	
	RETURN @result;

END
GO
/****** Object:  UserDefinedFunction [dbo].[Sys_F_DepChildsNum]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-07-22
-- Description:	根据组织机构Id获取组织机构子成员数量
-- =============================================
CREATE FUNCTION [dbo].[Sys_F_DepChildsNum]
(
	@depid int	--组织机构DepId
)
RETURNS int
AS
BEGIN
	declare @result int;
	set @result=0;
	
	with subquery(DepId,Title,PDepId) as (
		select DepId,Title,PDepId from dbo.SysDepartments where DepId=@depid
		union all
		select a.DepId,a.Title,a.PDepId from dbo.SysDepartments a,subquery b
		where a.PDepId = b.DepId
	)
	select @result=COUNT(*) from subquery
	where DepId<>@depid;
	
	RETURN @result;

END
GO
/****** Object:  StoredProcedure [dbo].[Sys_UserList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-11
-- Description: 获取用户列表信息（含搜索条件、分页）排序:在职状态（升序）、最近登录时间（降序）、创建时间（降序）
-- =============================================
CREATE PROCEDURE [dbo].[Sys_UserList]

	@Key			NVARCHAR(100)=N'',	--关键词（姓名、账号）
	@Status			SMALLINT=4,--状态
	@OrganizationId INT=0,   --组织ID
	@DepartmentId   INT=0,   --部门ID
	@RroleGroupsId  VARCHAR(2000)=N'',  --隶属角色ID
	@CurrentPage	INT,			--当前页
	@PageSize		INT,				--页大小
	@CompanyId      INT               --企业标识
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @RecordStart INT;
	DECLARE @RecordEnd INT;
	
	IF(@CurrentPage<=1)		
	BEGIN
		SET @RecordStart=1;
		SET @RecordEnd=@PageSize;
	END
	ELSE
	BEGIN
		SET @RecordStart=((@CurrentPage-1)*@PageSize)+1;
		SET @RecordEnd=@CurrentPage*@PageSize;
	END
	
	--
	
	;WITH RecordList AS 
	(	
		SELECT (ROW_NUMBER() OVER ( ORDER BY u.FullName DESC)) AS RSNO 
		,u.*
		,dbo.F_DeptNameById(u.BranchId,u.CompanyId) AS OrganizationName
		,dbo.F_DeptNameById(u.BumenId,u.CompanyId) AS DepartmentName
		,dbo.F_UserNameById(u.BossUId) AS BossUName
		,dbo.F_DicNameForSN(u.PositionId,u.CompanyId) AS PositionName
		,dbo.[Sys_F_RoleTitlesByIds](u.RoleIds,u.CompanyId) AS RoleNames
		,dbo.Sys_F_StoreRolesByUID(u.[UID]) StoreRoles
		FROM dbo.SysUserInfo AS u
		WHERE (ISNULL(@Key,'')=''
				OR (u.FullName LIKE '%!'+@Key+'%' ESCAPE '!')
				OR (u.LoginName LIKE '%!'+@Key+'%' ESCAPE '!')
				OR (u.UserCode LIKE '%!'+@Key+'%' ESCAPE '!')
				)AND
				(@OrganizationId=0
				OR (u.BranchId = @OrganizationId)
				)AND
				(@DepartmentId=0
				OR(u.BumenId = @DepartmentId)
				)AND(
				ISNULL(@RroleGroupsId,'')=''
				OR(u.RoleIds LIKE '%!'+@RroleGroupsId+'%' ESCAPE '!')
				)AND(
				@Status=4 or u.Status=@Status
				) AND(--16.03.24增加企业过滤
				u.CompanyId=@CompanyId
				)
	), RecordPage AS (
		SELECT MAX(RSNO) AS [RecordTotal]
				,(CASE WHEN @CurrentPage>CEILING(CONVERT(DECIMAL(18,2),MAX(RSNO))/@PageSize)
					   THEN (CEILING(CONVERT(DECIMAL(18,2),MAX(RSNO))/@PageSize)-1)*@PageSize+1
					   ELSE @RecordStart END
				  ) AS [RecordStart]
				,(CASE WHEN @CurrentPage>(CONVERT(DECIMAL(18,2),MAX(RSNO))/@PageSize)
					   THEN CEILING(CONVERT(DECIMAL(18,2),MAX(RSNO))/@PageSize)*@PageSize
					   ELSE @RecordEnd END
				  ) AS [RecordEnd]									
		FROM RecordList
	) SELECT *
	FROM RecordList AS RL, RecordPage AS RP
	WHERE (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd)
	--ORDER BY [Status] ASC,LoginDT DESC,CreateDT DESC;
	--
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sys_DepartmentList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-07-22
-- Description:	获取组织机构列表信息（含搜索条件、分页）
-- =============================================
CREATE PROCEDURE [dbo].[Sys_DepartmentList] 
	@id INT,
	@companyId INT
AS
BEGIN
	SET NOCOUNT ON;
	
	IF(@id>=0)
	BEGIN
		SELECT d1.* ,d2.Title PTitle,d2.[TYPE] PType
			,u1.FullName ManagerUName
			,u2.FullName DeputyUName
			--,dbo.[Sys_F_DepChildsNum](d1.DepId) AS ChildsNum
			,dbo.[Sys_F_DepUsersNum](d1.DepId,d1.CompanyId) AS ChildsNum
		FROM dbo.SysDepartments d1
		LEFT JOIN dbo.SysUserInfo u1 ON u1.UID=d1.ManagerUId AND u1.CompanyId=@companyId
		LEFT JOIN dbo.SysUserInfo u2 ON u2.UID=d1.DeputyUId AND u2.CompanyId=@companyId
		LEFT JOIN dbo.SysDepartments d2 ON d2.DepId=d1.PDepId  AND d2.CompanyId=@companyId
		WHERE d1.Id=@id AND d1.CompanyId=@companyId 
	END
	ELSE
	BEGIN
		SELECT d1.* ,d2.Title PTitle,d2.[TYPE] PType
			,u1.FullName ManagerUName
			,u2.FullName DeputyUName
			--,dbo.[Sys_F_DepChildsNum](d1.DepId) AS ChildsNum
			,dbo.[Sys_F_DepUsersNum](d1.DepId,d1.CompanyId) AS ChildsNum
		FROM dbo.SysDepartments d1
		LEFT JOIN dbo.SysUserInfo u1 ON u1.UID=d1.ManagerUId AND u1.CompanyId=@companyId
		LEFT JOIN dbo.SysUserInfo u2 ON u2.UID=d1.DeputyUId AND u2.CompanyId=@companyId
		LEFT JOIN dbo.SysDepartments d2 ON d2.DepId=d1.PDepId  AND d2.CompanyId=@companyId
		WHERE d1.CompanyId=@companyId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SyncProductRecord]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<余雄文>
-- Create date: <2016-04-20>
-- Description:	<产品档案用于数据同步>
-- =============================================
CREATE PROCEDURE [dbo].[SyncProductRecord]
@storeId nvarchar(50),
@token int,
@SyncItemId varchar(5000)
AS
BEGIN
	if object_id('tempdb..#tempCategoryForStoreInventory') is not null Begin
drop table #tempCategoryForStoreInventory
end;
	--处理门店销售分类
with cte as
(
    select l.SyncItemVersion,l.Title,l.CategoryPSN,l.CategorySN,convert(nvarchar(200),l.CategorySN) CategoryPath,convert(nvarchar(200),l.Title) CategoryPathName,r.StoreId,0 as lvl from ProductCategory l
    right join Warehouse r on  ','+r.CategorySN+',' like '%,'+ convert(varchar(200),l.CategorySN) +',%' and r.CompanyId= @token  and l.CompanyId= @token
	where  r.StoreId=@storeId
    union all
    select d.SyncItemVersion,d.Title, d.CategoryPSN,d.CategorySN,convert(nvarchar(200),(c.CategoryPath+'/'+ convert(varchar(200),d.CategorySN))) CategoryPath,convert(nvarchar(200),(c.CategoryPathName+'/'+d.Title)) as CategoryPathName,c.StoreId,lvl+1 from cte c 
	inner join ProductCategory d on c.CategorySN = d.CategoryPSN and d.CompanyId= @token
)
select *  into #tempCategoryForStoreInventory from cte ;

---初始化基础信息
select 
'' EntityType,
t1.CompanyId,
t1.ProductCode,
t1.Barcode,
t1.Title,
t1.Size,
t1.BrandSN,
t1.CategorySN,
[dbo].[F_BuyPriceByBarcode](t1.SupplierId,t1.barcode,t1.CompanyId) BuyPrice,
[dbo].[F_SysPriceByBarcode](@storeId,t1.Barcode,@token) SysPrice,
t1.Nature,
t1.OldBarcode,
t1.SaleNum,
t1.State,
t1.Favorable,
t1.ValuationType,
t1.IsReturnSale,
t1.InventoryWarning,
t1.ValidityWarning,
t1.Barcodes,
t1.BarcodeMult,
t1.StockRate,
t1.SaleRate,
t1.CreateDT,
t1.SupplierId,
t1.CityId,
t1.BigUnitId,
t1.SubUnitId,
t1.RaterUID,
t1.BoxBoard,
t1.Expiry,
t1.ExpiryUnit,
t1.Factory,
t1.IsAcceptOrder,
t1.TradePrice,
t1.JoinPrice,
t4.Title as BrandName,
t2.CategoryPath,
t2.CategoryPathName,
t2.Title as CategoryName,
[dbo].[F_DicNameForSN](t1.SubUnitId,@token) Unit,
ISNULL([dbo].[F_InventoryNum](@storeId,t1.Barcode,t1.Nature,@token),0) Inventory,
t1.SyncItemId,
(SELECT MAX(T.SyncItemVersion) FROM
(
SELECT  t1.SyncItemVersion SyncItemVersion
UNION ALL
SELECT  t4.SyncItemVersion SyncItemVersion
UNION ALL
SELECT SyncItemVersion FROM Inventory I WHERE I.CompanyId=@token AND I.Barcode = T1.Barcode AND I.StoreId = @storeId
UNION ALL 
SELECT SyncItemVersion FROM ProductMultSupplier I WHERE  I.CompanyId=@token AND I.Barcode = T1.Barcode 
UNION ALL
SELECT SyncItemVersion FROM ProductMultPrice I WHERE I.CompanyId=@token AND I.Barcode = T1.Barcode AND I.StoreId = @storeId
UNION ALL
SELECT (case WHEN R2.SyncItemVersion >R1.SyncItemVersion THEN   R2.SyncItemVersion ELSE  R1.SyncItemVersion END) FROM ProductChangePrice R1,ProductChangePriceList R2
WHERE R1.CompanyId=@token AND R2.Barcode = T1.Barcode AND (','+R1.StoreId+',') like ('%,'+@storeId+',%') and R1.Id = R2.ChangePriceId
) AS T)
 SyncItemVersion
from ProductRecord t1  
left join #tempCategoryForStoreInventory t2 on t1.CategorySN = t2.CategorySN  and t1.CompanyId=@token and ','+@SyncItemId+',' like '%,' + convert(varchar(200) ,t1.SyncItemId) +',%'
left join ProductBrand t4 on t1.BrandSN = t4.BrandSN and t4.CompanyId =@token 
where t1.Barcode is not null and t2.CategorySN is not NULL
End
GO
/****** Object:  StoredProcedure [dbo].[CheckedStoreProductInfoByProductCode]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<余雄文>
-- Create date: <2016-03-10>
-- Description:	<通过货号查询商品信息>
-- =============================================
CREATE PROCEDURE [dbo].[CheckedStoreProductInfoByProductCode]
	@storeId varchar(5),
@token int,
@productCode varchar(100)
AS
BEGIN
	if object_id('tempdb..#tempCategoryForStoreInventory') is not null Begin
    drop table #tempCategoryForStoreInventory
End;
--处理门店销售分类
with cte as
(
    select l.CategoryPSN,l.CategorySN,l.Title CategoryName,cast(l.CategorySN as varchar(100))  CategoryPath,convert(varchar(200),l.Title) CategoryPathName,r.StoreId,0 as lvl,r.CompanyId from ProductCategory l
    right join Warehouse r on  ','+r.CategorySN+',' like '%,'+ convert(varchar(200),l.CategorySN) +',%' and r.CompanyId= l.CompanyId
	where  r.StoreId=@storeId and r.CompanyId = @token and l.CompanyId = @token
    union all
    select d.CategoryPSN,d.CategorySN,d.Title CategoryName,cast(cast(c.CategoryPath AS varchar)+'/'+ cast( d.CategorySN as varchar) as varchar(100)) as CategoryPath,convert(varchar(200),(c.CategoryPathName+'/'+d.Title)) as CategoryPathName,c.StoreId,lvl+1,C.CompanyId from cte c 
	inner join ProductCategory d on c.CategorySN = d.CategoryPSN and d.CompanyId= C.CompanyId
)
select *  into #tempCategoryForStoreInventory from cte ;
SELECT 
p.ProductCode,
p.Barcode MainBarcode,
p.Title AS Title,
p.Size AS Size,
b.Title AS Brand,
c.CategoryPathName AS Category,
[dbo].[F_DicNameForSN](p.SubUnitId,p.CompanyId) Unit,
CAST((CASE WHEN p.ValuationType =1THEN 1 ELSE 0 end) AS BIT )EnableEditNum,
CAST(p.Favorable AS BIT) EnableEditPrice,
[dbo].[F_SysPriceByBarcode](c.StoreId,p.Barcode,p.CompanyId) SystemPrice,
p.BuyPrice BuyPrice,
(
CASE WHEN p.ValuationType =2 THEN 1 
WHEN p.ValuationType =1 AND p.Nature=0 THEN 0  
WHEN p.ValuationType =1 AND p.Nature=1 THEN 4 
WHEN p.ValuationType =1 AND p.Nature=2 THEN 3 END)  ProductType
 FROM #tempCategoryForStoreInventory c
right join ProductRecord p 
ON c.CategorySN = p.CategorySN and p.CompanyId = c.CompanyId 
left join ProductBrand b on p.BrandSN = b.BrandSN and b.CompanyId = p.CompanyId
where  c.StoreId=@storeId and p.ProductCode=@productCode AND p.State=1
END
GO
/****** Object:  StoredProcedure [dbo].[CheckedStoreProductInfo]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		余雄文
-- Create date: <20160310>
-- Description:	<门店产品信息查询>
-- =============================================
CREATE PROCEDURE [dbo].[CheckedStoreProductInfo]
@storeId varchar(5),
@token int,
@barcode varchar(100)
AS
BEGIN
	if object_id('tempdb..#tempCategoryForStore') is not null Begin
    drop table #tempCategoryForStore
End;
--处理门店销售分类
with cte as
(
    select l.CategoryPSN,l.CategorySN,l.Title CategoryName,cast(l.CategorySN as varchar(100))  CategoryPath,convert(varchar(200),l.Title) CategoryPathName,r.StoreId,0 as lvl,r.CompanyId from ProductCategory l
    right join Warehouse r on  ','+r.CategorySN+',' like '%,'+ convert(varchar(200),l.CategorySN) +',%' and r.CompanyId= l.CompanyId and l.CategoryPSN=0
	where  r.StoreId=@storeId and r.CompanyId = @token and l.CompanyId = @token
    union all
    select d.CategoryPSN,d.CategorySN,d.Title CategoryName,cast(cast(c.CategoryPath AS varchar)+'/'+ cast( d.CategorySN as varchar) as varchar(100)) as CategoryPath,convert(varchar(200),(c.CategoryPathName+'/'+d.Title)) as CategoryPathName,c.StoreId,lvl+1,C.CompanyId from cte c 
	inner join ProductCategory d on c.CategorySN = d.CategoryPSN and d.CompanyId= C.CompanyId
)
select *  into #tempCategoryForStore from cte ;
SELECT 
'' MultiCode,
Isnull(BarcodeMult,'')+','+Isnull(Barcodes,'') MultiCodes,
p.ProductCode,
p.Barcode MainBarcode,
p.Title AS Title,
p.Size AS Size,
b.Title AS Brand,
c.CategoryPath AS Category,
[dbo].[F_DicNameForSN](p.SubUnitId,p.CompanyId) Unit,
CAST((CASE WHEN p.ValuationType =1THEN 1 ELSE 0 end) AS BIT )EnableEditNum,
CAST(p.Favorable AS BIT) EnableEditPrice,
[dbo].[F_SysPriceByBarcode](c.StoreId,p.Barcode,p.CompanyId) SystemPrice,
[dbo].F_BuyPriceByBarcode(p.SupplierId,p.Barcode,@token) BuyPrice,

(
CASE WHEN p.ValuationType =2 THEN 1 
WHEN p.ValuationType =1 AND p.Nature=0 THEN 0  
WHEN p.ValuationType =1 AND p.Nature=1 THEN 4 
WHEN p.ValuationType =1 AND p.Nature=2 THEN 3 END)  ProductType
 FROM #tempCategoryForStore c
right join ProductRecord p 
ON c.CategorySN = p.CategorySN and p.CompanyId = c.CompanyId 
left join ProductBrand b on p.BrandSN = b.BrandSN and b.CompanyId = p.CompanyId
where  c.StoreId=@storeId AND p.State=1 and (p.Barcode=@barcode or (','+ p.BarcodeMult+',') like ('%,'+@barcode+',%') or (','+ p.Barcodes+',') like ('%,'+@barcode+',%'))
END
GO
/****** Object:  StoredProcedure [dbo].[CheckedPrice]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		余雄文
-- Create date: 2015-11-10
-- Description:	POS查价格
-- =============================================
CREATE PROCEDURE [dbo].[CheckedPrice]
@categorySns nvarchar(800),
@storeId nvarchar(50),
@from money,
@to money,
@token int
AS
BEGIN
 if object_id('tempdb..#tempCategoryForStoreInventory') is not null Begin
    drop table #tempCategoryForStoreInventory
End;

if object_id('tempdb..#tempCategoryForInventory') is not null Begin
    drop table #tempCategoryForInventory
End;


--处理门店销售分类
with cte as
(
    select l.CategoryPSN,l.CategorySN,convert(nvarchar(200),l.Title) Title,r.StoreId,0 as lvl from ProductCategory l
    right join Warehouse r on  ','+r.CategorySN+',' like '%,'+ convert(varchar(200),l.CategorySN) +',%' and r.CompanyId= @token  and l.CompanyId= @token
	where  r.StoreId=@storeId
    union all
    select d.CategoryPSN,d.CategorySN,convert(nvarchar(200),(c.Title+'/'+d.Title)) as Title,c.StoreId,lvl+1 from cte c 
	inner join ProductCategory d on c.CategorySN = d.CategoryPSN and d.CompanyId= @token
)
select *  into #tempCategoryForStoreInventory from cte ;

--处理查询分类

with cte2 as
(
    select l.CategoryPSN,l.CategorySN,l.Title,l.StoreId from #tempCategoryForStoreInventory l
	where  (','+ @categorySns+','like '%,'+ convert(varchar(200),l.CategorySN) +',%'or  @categorySns='0' or  @categorySns is null or  @categorySns='') 
    union all
    select d.CategoryPSN,d.CategorySN,d.Title,d.StoreId from cte2 c 
	inner join #tempCategoryForStoreInventory d on c.CategorySN = d.CategoryPSN
)

select DISTINCT *  into #tempCategoryForInventory from cte2 ;


select * from 
(select 
t1.Barcode,
t1.Title,
t1.Size,
t4.Title as Brand,
t2.Title as Category,
[dbo].[F_DicNameForSN](t1.SubUnitId,@token) Unit,
[dbo].[F_SysPriceByBarcode](@storeId,t1.Barcode,@token) Price,
ISNULL( [dbo].[F_InventoryNum](@storeId,t1.Barcode,t1.Nature,@token),0) Inventory ,
t1.ProductCode
from ProductRecord t1
left join #tempCategoryForInventory t2 on t1.CategorySN = t2.CategorySN  and t1.CompanyId=@token
--left join Inventory t3 on t1.Barcode = t3.Barcode and t2.StoreId = t3.StoreId and t3.StoreId =@storeId and t3.CompanyId =@token
left join ProductBrand t4 on t1.BrandSN = t4.BrandSN and t4.CompanyId =@token 
where t2.CategorySN is not NULL AND t1.ValuationType=1 )

as t where 
t.Price between @from and @to

END
GO
/****** Object:  StoredProcedure [dbo].[CheckedInventory]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		余雄文
-- Create date: 2015-11-10
-- Description:	POS查库存
-- =============================================
CREATE PROCEDURE [dbo].[CheckedInventory]
	@categorySns nvarchar(800),
	@storeId nvarchar(50),
	@keyword nvarchar(200),
	@price money,
	@token int
AS
BEGIN

with cte as
(
	--处理门店销售分类
    select l.CategoryPSN,l.CategorySN,convert(nvarchar(200),l.Title) Title,r.StoreId,0 as lvl
    from ProductCategory as l
    right join Warehouse r on (r.CompanyId= @token and l.CompanyId= @token)
						and (','+r.CategorySN+',' like '%,'+ convert(varchar(200),l.CategorySN) +',%')
		where  r.StoreId=@storeId
    union all
    select d.CategoryPSN,d.CategorySN,convert(nvarchar(200),(c.Title+'/'+d.Title)) as Title,c.StoreId,lvl+1
    from cte as c 
	inner join ProductCategory d on (d.CompanyId= @token) and (c.CategorySN = d.CategoryPSN)
), cte1 as (
	--处理查询分类
    select l.CategoryPSN,l.CategorySN,l.Title,l.StoreId from cte as l
		where  ((@categorySns='0' or  @categorySns is null or  @categorySns='')
				or (','+ @categorySns+',' like '%,'+ convert(varchar(200),l.CategorySN) +',%')) 
    union all
    select d.CategoryPSN,d.CategorySN,d.Title,d.StoreId from cte1 as c 
	inner join cte as d on c.CategorySN = d.CategoryPSN
), cte2 as (
	select DISTINCT * from cte1
), kucun as (
	---初始化基础信息
	select 
		t1.Barcode,
		t1.Title,
		t1.Size,
		t4.Title as Brand,
		t2.Title as Category,
		[dbo].[F_DicNameForSN](t1.SubUnitId,@token) as Unit,
		[dbo].[F_SysPriceByBarcode](@storeId,t1.Barcode,@token) as Price,
		iSNULL([dbo].[F_InventoryNum](@storeId,t1.Barcode,t1.Nature,@token),0) as Inventory ,
		t1.ProductCode
	from ProductRecord as t1 
	left join cte2 as t2 on (t1.CompanyId=@token) and (t1.CategorySN=t2.CategorySN)
	left join ProductBrand as t4 on (t4.CompanyId=@token) and (t1.BrandSN=t4.BrandSN) 
	where (t1.ValuationType=1)
		and (t2.CategorySN is not NULL)
		and (t1.Barcode is not null)
		and ((@keyword='' or @keyword is null)
			or (t1.barcode like '%'+@keyword+'%')
			or (t1.productcode like '%'+@keyword+'%')
			or (t1.BarcodeMult like '%'+@keyword+'%')
			or (t1.Barcodes like '%'+@keyword+'%')
		 )
		and (@price=0 or [dbo].[F_SysPriceByBarcode](@storeId,t1.Barcode,@token)=@price)
) select * from kucun;

END
GO
/****** Object:  StoredProcedure [dbo].[AffectInventory_SKU_Recount]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-28
-- Description:	重新计算关联商品库存
--				(供dbo.AffectInventory_Recount内部调用)
-- =============================================
CREATE PROCEDURE [dbo].[AffectInventory_SKU_Recount]
	@CompanyId  Int,
	@StoreId	Int,
	@Source		SmallInt,		--来源标识
	@Barcode	Varchar(30),
	@Number		Money,			--数量（正值）
	@OperatId	Varchar(40)='',	--入库ID或配送ID
	@CreateUID  Varchar(40),	--操作人UID
	@CreateDT	Datetime
AS
BEGIN
	DECLARE @num Money; SET @num=@Number;
	DECLARE @_number Money; SET @_number=@Number;

	--1.更新剩余库存（实时库存）
	IF EXISTS (SELECT * FROM dbo.Inventory WHERE CompanyId=@CompanyId AND StoreId=@StoreId
										AND Barcode=@Barcode)
	BEGIN
		UPDATE [dbo].[Inventory]
		SET [StockNumber] = @Number
		WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[Inventory] ([CompanyId],[StoreId],[Barcode],[StockNumber])
						VALUES	(@CompanyId,@StoreId,@Barcode,@num);
	END
			
	--2.更新库存每日结余
	SELECT @Number=ISNULL(StockNumber,0)
	FROM dbo.Inventory
	WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
	--库存金额
	DECLARE @StockAmount Money;
	DECLARE @supplierId varchar(40);
	SELECT @supplierId=SupplierId FROM dbo.ProductRecord WHERE CompanyId=@CompanyId AND Barcode=@Barcode;
	SET @StockAmount=(dbo.F_BuyPriceByBarcode(@supplierId,@Barcode,@CompanyId) * @Number);

	--销售均价
	DECLARE @SaleAveragePrice Money;
	SET @SaleAveragePrice=dbo.[F_SaleAveragePrice] (@CompanyId,@StoreId,CONVERT(Varchar(10),@CreateDT,120),@Barcode,1);
	--销售金额
	DECLARE @SaleAmount Money;
	SET @SaleAmount=dbo.[F_SaleAveragePrice] (@CompanyId,@StoreId,CONVERT(Varchar(10),@CreateDT,120),@Barcode,2);		
	--
	IF EXISTS (SELECT * FROM dbo.InventoryBalance
					WHERE CONVERT(Varchar(10),BalanceDate,120)=CONVERT(Varchar(10),@CreateDT,120)
							AND CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode)
	BEGIN
		UPDATE [dbo].InventoryBalance
		SET Number = @Number, StockAmount=@StockAmount
			, SaleAveragePrice=@SaleAveragePrice, SaleAmount=@SaleAmount, [Period]=0
		WHERE CONVERT(Varchar(10),BalanceDate,120)=CONVERT(Varchar(10),@CreateDT,120)
			AND CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
	END	
    ELSE
    BEGIN
		INSERT INTO [dbo].[InventoryBalance]
			([CompanyId],[StoreId],[Barcode],[Number],[BalanceDate]
			,[SaleAveragePrice], [SaleAmount], [StockAmount], [Period])
		VALUES (@CompanyId,@StoreId,@Barcode,@Number,@CreateDT
				,@SaleAveragePrice, @SaleAmount, @StockAmount, '0');
    END
    --
	--3.写入库存变化明细
	IF NOT EXISTS (SELECT * FROM dbo.InventoryRecord
					WHERE CompanyId=@CompanyId AND StoreId=@StoreId
					AND Barcode=@Barcode AND Number=@Number AND [OperatId]=@OperatId)
	BEGIN
		INSERT INTO [dbo].[InventoryRecord]
				([CompanyId],[StoreId],[Barcode],[Number],[AveragePrice],[CreateDT],[CreateUID],[Source],[OperatId])
		 VALUES (@CompanyId,@StoreId,@Barcode,@Number,@SaleAveragePrice,@CreateDT,@CreateUID,17,@OperatId);
    END

END
GO
/****** Object:  StoredProcedure [dbo].[AffectInventory_SKU]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-22
-- Description:	影响普通单品库存量
--				(供dbo.AffectInventory和dbo.AffectInventory_SplitGoods内部调用)
-- =============================================
CREATE PROCEDURE [dbo].[AffectInventory_SKU]
	@CompanyId  Int,
	@StoreId	Int,
	@Source		SmallInt,		--来源标识
	@OperatType	SmallInt,		--操作类型（1:增加，2:相减）
	@Barcode	Varchar(30),
	@Number		Money,			--数量（正值）
	@OperatId	Varchar(40)='',	--入库ID或配送ID
	@CreateUID  Varchar(40),	--操作人UID
	@CreateDT	Datetime,
	@SalePrice	Money=0			--销售单价
AS
BEGIN
	DECLARE @num Money; SET @num=@Number;
	DECLARE @_number Money; SET @_number=@Number;
	--1.更新剩余库存（实时库存）
	IF EXISTS (SELECT * FROM dbo.Inventory WHERE CompanyId=@CompanyId AND StoreId=@StoreId
											AND Barcode=@Barcode)
	BEGIN
		IF(@Source=15)
		BEGIN
			--纠正库存
			UPDATE [dbo].[Inventory]
			SET [StockNumber] = @Number
			WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
		END
		ELSE
		BEGIN
			SET @num=abs(@num);
			IF(@OperatType=1)
			BEGIN
				--增加
				UPDATE [dbo].[Inventory]
				SET [StockNumber] = [StockNumber]+@num
				WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
			END
			ELSE
			BEGIN
				--相减
				UPDATE [dbo].[Inventory]
				SET [StockNumber] = [StockNumber]-@num
				WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
			END
		END
	END
	ELSE
	BEGIN
		--IF(@Source<>15)
		--BEGIN
			SET @num=abs(@num);
		--END
		IF(@OperatType=2)
		BEGIN
			SET @num=-@num;
		END
		--
		INSERT INTO [dbo].[Inventory] ([CompanyId],[StoreId],[Barcode],[StockNumber])
							VALUES	(@CompanyId,@StoreId,@Barcode,@num);
	END
		
	--2.更新库存每日结余
	SELECT @Number=ISNULL(StockNumber,0)
	FROM dbo.Inventory
	WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
	--库存金额
	DECLARE @StockAmount Money;
	DECLARE @supplierId varchar(40);
	SELECT @supplierId=SupplierId FROM dbo.ProductRecord WHERE CompanyId=@CompanyId AND Barcode=@Barcode;
	SET @StockAmount=(dbo.F_BuyPriceByBarcode(@supplierId,@Barcode,@CompanyId) * @Number);

	--销售均价
	DECLARE @SaleAveragePrice Money;
	IF(@Source=15)
	BEGIN
		SET @SaleAveragePrice=dbo.[F_SaleAveragePrice] (@CompanyId,@StoreId,CONVERT(Varchar(10),@CreateDT,120),@Barcode,1);
		IF(@SaleAveragePrice=0)
		BEGIN
			SET @SaleAveragePrice=dbo.[F_SysPriceByBarcode] (@StoreId,@Barcode,@CompanyId);
		END
	END
	ELSE
	BEGIN
		--非盘点时，以传进来销售单价计算
		SET @SaleAveragePrice=@SalePrice;
	END
	
	--销售金额
	DECLARE @SaleAmount Money;
	SET @SaleAmount=dbo.[F_SaleAveragePrice] (@CompanyId,@StoreId,CONVERT(Varchar(10),@CreateDT,120),@Barcode,2);		
	--
	IF EXISTS (SELECT * FROM dbo.InventoryBalance
					WHERE CONVERT(Varchar(10),BalanceDate,120)=CONVERT(Varchar(10),@CreateDT,120)
							AND CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode)
	BEGIN
		UPDATE [dbo].InventoryBalance
		SET Number = @Number, StockAmount=@StockAmount
			, SaleAveragePrice=@SaleAveragePrice, SaleAmount=@SaleAmount, [Period]=0
		WHERE CONVERT(Varchar(10),BalanceDate,120)=CONVERT(Varchar(10),@CreateDT,120)
			AND CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
	END	
    ELSE
    BEGIN		
		INSERT INTO [dbo].[InventoryBalance]
			([CompanyId],[StoreId],[Barcode],[Number],[BalanceDate]
			,[SaleAveragePrice], [SaleAmount], [StockAmount],[Period])
		VALUES (@CompanyId,@StoreId,@Barcode,@Number,@CreateDT
				,@SaleAveragePrice, @SaleAmount, @StockAmount,'0');
    END
    --
    	
	--3.写入库存变化明细
	--
	INSERT INTO [dbo].[InventoryRecord]
			([CompanyId],[StoreId],[Barcode],[Number],[AveragePrice],[CreateDT],[CreateUID],[Source],[OperatId])
     VALUES (@CompanyId,@StoreId,@Barcode,@_number,@SaleAveragePrice,@CreateDT,@CreateUID,@Source,@OperatId);

    --重新计算相关联商品的库存
    --EXEC [dbo].[AffectInventory_Recount] @CompanyId,@StoreId,@Source,@Barcode,@OperatId,@CreateUID,@CreateDT;

END
GO
/****** Object:  StoredProcedure [dbo].[GetStoreInventory]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		余雄文
-- Create date: 2015-11-10
-- Description:	POS查库存数据同步
-- =============================================
CREATE PROCEDURE [dbo].[GetStoreInventory]
@storeId nvarchar(50)
AS
BEGIN
 

if object_id('tempdb..#tempCategoryForStoreInventory') is not null Begin
    drop table #tempCategoryForStoreInventory
End;

if object_id('tempdb..#tempInventoryForStoreInventory') is not null Begin
    drop table #tempInventoryForStoreInventory
End;

if object_id('tempdb..#StoreInventory') is not null Begin
    drop table #StoreInventory
End;
--处理门店销售分类
with cte as
(
    select l.CategoryPSN,l.CategorySN,convert(nvarchar(200),l.Title) Title,r.StoreId,0 as lvl from ProductCategory l
    right join Warehouse r on  ','+r.CategorySN+',' like '%,'+ convert(varchar(200),l.CategorySN) +',%' 	
	where  r.StoreId=@storeId
    union all
    select d.CategoryPSN,d.CategorySN,convert(nvarchar(200),(c.Title+'/'+d.Title)) as Title,c.StoreId,lvl+1 from cte c 
	inner join ProductCategory d on c.CategorySN = d.CategoryPSN
)

select *  into #tempCategoryForStoreInventory from cte ;


---初始化基础信息
select 
t1.Nature,t1.SaleNum,t1.OldBarcode,t1.SysPrice,
t1.Barcode,t1.Title,t4.Title as Brand,t1.Size Size,
t2.Title as Category,t2.StoreId,[dbo].[F_DicNameForSN] (t1.SubUnitId) Unit,
ISNULL(t3.StockNumber,0) StockNumber 
into #tempInventoryForStoreInventory from ProductRecord t1
right join #tempCategoryForStoreInventory t2 on t1.CategorySN = t2.CategorySN  
left join Inventory t3 on t1.Barcode = t3.Barcode and t2.StoreId = t3.StoreId and t3.StoreId =@storeId
left join ProductBrand t4 on t1.BrandSN = t4.BrandSN
where t1.Barcode is not null 

--处理库存、门店系统售价

select a.*, Category,
isnull(
case a.Nature 
 when 0 then 
      (
	      t1.StockNumber 
	  )
 when 1 then 
	 (
		 (select  min(b.StockNumber/a.Number)  from  ProductGroup a ,#tempInventoryForStoreInventory b
		  where a.Barcode = t1.Barcode and b.Barcode =a.GroupBarcode )
      ) 
 when 2 then
     (
		  select top(1)( t1.StockNumber + (CASE WHEN  (c.StockNumber * ISNULL(t1.saleNum,0))>0 THEN (c.StockNumber * ISNULL(t1.saleNum,0)) else 0 end  ))  
		  from #tempInventoryForStoreInventory c where c.Barcode = t1.OldBarcode
	  ) 
end,t1.StockNumber)
StockNumber,

isnull(
 case when ( select count(*) from ProductChangePrice q,ProductChangePriceList w where q.Id= w.ChangePriceId and q.State=1 and w.Barcode=t1.Barcode and w.StartDate <= GETDATE() and  w.endDate>=GETDATE())>0 
 then 
 (select top(1) w.CurSysPrice from ProductChangePrice q,ProductChangePriceList w where q.Id= w.ChangePriceId and q.State=1 and w.StartDate <= GETDATE() and  w.endDate>=GETDATE() and w.Barcode=t1.Barcode order by q.CreateDT desc)
 else  
 case when (select count(*) from ProductMultPrice where StoreId = @storeId and Barcode =t1.Barcode )>0
 then
 (select top(1) Price from ProductMultPrice where StoreId = @storeId and Barcode =t1.Barcode )
 else
 t1.SysPrice
  end
  end,t1.SysPrice)
Price

into #StoreInventory
 from #tempInventoryForStoreInventory t1  ,ProductRecord a
 where t1.Barcode = a.Barcode
 update #StoreInventory set StockNumber =0 where StockNumber<0 and Nature in (1,2);
 update #StoreInventory set SysPrice =Price;
 select * from #StoreInventory

END
GO
/****** Object:  StoredProcedure [dbo].[OMS_Sys_UserList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ywb
-- Create date: 2015-08-11
-- Description: 获取用户列表信息（含搜索条件、分页）排序:在职状态（升序）、最近登录时间（降序）、创建时间（降序）
-- =============================================
CREATE PROCEDURE [dbo].[OMS_Sys_UserList]

	@Key			Nvarchar(100)=N'',	--关键词（姓名、账号）
	@Status			SMALLINT=4,--状态
	@OrganizationId INT=0,   --组织ID
	@DepartmentId   INT=0,   --部门ID
	@RroleGroupsId  VARCHAR(2000)=N'',  --隶属角色ID
	@CurrentPage	Int,			--当前页
	@PageSize		Int				--页大小
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @RecordStart INT;
	DECLARE @RecordEnd INT;
	
	IF(@CurrentPage<=1)		
	BEGIN
		SET @RecordStart=1;
		SET @RecordEnd=@PageSize;
	END
	ELSE
	BEGIN
		SET @RecordStart=((@CurrentPage-1)*@PageSize)+1;
		SET @RecordEnd=@CurrentPage*@PageSize;
	END
	
	--
	
	;WITH RecordList AS 
	(	
		SELECT (ROW_NUMBER() OVER ( ORDER BY u.FullName DESC)) AS RSNO 
		,u.*
		,dbo.F_DeptNameById(u.BranchId) AS OrganizationName
		,dbo.F_DeptNameById(u.BumenId) AS DepartmentName
		,dbo.F_UserNameById(u.BossUId) as BossUName
		,dbo.F_DicNameForSN(u.PositionId,null) as PositionName
		,dbo.[Sys_F_RoleTitlesByIds](u.RoleIds) as RoleNames
		,dbo.Sys_F_StoreRolesByUID(u.[UID]) StoreRoles
		FROM dbo.OMS_SysUserInfo as u
		WHERE (ISNULL(@Key,'')=''
				OR (u.FullName LIKE '%!'+@Key+'%' ESCAPE '!')
				OR (u.LoginName LIKE '%!'+@Key+'%' ESCAPE '!')
				)AND
				(@OrganizationId=0
				OR (u.BranchId = @OrganizationId)
				)AND
				(@DepartmentId=0
				OR(u.BumenId = @DepartmentId)
				)AND(
				ISNULL(@RroleGroupsId,'')=''
				OR(u.RoleIds LIKE '%!'+@RroleGroupsId+'%' ESCAPE '!')
				)AND(
				u.Status<=@Status
				)
	), RecordPage AS (
		SELECT MAX(RSNO) AS [RecordTotal]
				,(CASE WHEN @CurrentPage>Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN (Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)-1)*@PageSize+1
					   ELSE @RecordStart END
				  ) AS [RecordStart]
				,(CASE WHEN @CurrentPage>(Convert(decimal(18,2),MAX(RSNO))/@PageSize)
					   THEN Ceiling(Convert(decimal(18,2),MAX(RSNO))/@PageSize)*@PageSize
					   ELSE @RecordEnd END
				  ) AS [RecordEnd]									
		FROM RecordList
	) SELECT *
	FROM RecordList AS RL, RecordPage AS RP
	WHERE (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd)
	ORDER BY [Status] ASC,LoginDT DESC,CreateDT DESC;
	--
	
END
GO
/****** Object:  View [dbo].[Vw_Product]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--2015-11-15
--更新视图Vw_Product
CREATE VIEW [dbo].[Vw_Product]
AS
    SELECT  *,
            --BigCategoryTitle + CASE WHEN LEN(MidCategoryTitle) > 0
            --                        THEN '/' + MidCategoryTitle
            --                             + ( CASE WHEN LEN(SubCategoryTitle) > 0
            --                                      THEN '/' + SubCategoryTitle
            --                                      ELSE ''
            --                                 END )
            --                        ELSE ''
            --                   END AS CategoryTitle ,
			--dbo.F_ProductCategoryFromTitle(CategoryTitle,'/',1) BigCategoryTitle,
			--dbo.F_ProductCategoryFromTitle(CategoryTitle,'/',2) MidCategoryTitle,
			--dbo.F_ProductCategoryFromTitle(CategoryTitle,'/',3) SubCategoryTitle,
            ( SELECT    COUNT(*) AS Expr1
              FROM      dbo.ProductRecord
              WHERE     ( OldBarcode = tb.Barcode )
            ) AS ChildCount,
            CASE WHEN tb.Nature=1 THEN '[组] '+tb.Title WHEN tb.Nature=2 THEN '[拆] '+tb.Title ELSE tb.Title END AS PrefixTitle
    FROM    ( SELECT    a.*,
						dbo.F_ProductCategoryFullDescBySN(a.CategorySN,a.CompanyId) AS CategoryTitle,
                        dbo.F_ProductCategoryDescForSN(a.CategorySN, 1, 1,a.CompanyId) AS BigCategoryTitle ,
                        dbo.F_ProductCategoryDescForSN(a.CategorySN, 2, 1,a.CompanyId) AS MidCategoryTitle ,
                        dbo.F_ProductCategoryDescForSN(a.CategorySN, 3, 1,a.CompanyId) AS SubCategoryTitle ,
                        b.Title AS BrandTitle ,
                        dbo.F_DicNameForSN(a.BigUnitId,a.CompanyId) AS BigUnit ,
                        dbo.F_DicNameForSN(a.SubUnitId,a.CompanyId) AS SubUnit ,
                        dbo.F_SupplierNameById(a.SupplierId) AS SupplierTitle ,
                        ISNULL(dbo.F_GetDiscountPrice(a.Barcode,a.CompanyId),a.SysPrice) AS DiscountPrice ,
                        dbo.F_InventoryNum('',a.Barcode,a.Nature,a.CompanyId) AS AcceptNums ,
                        0 AS PurchaseNumbers
              FROM      dbo.ProductRecord AS a
                        LEFT OUTER JOIN dbo.ProductBrand AS b ON a.BrandSN = b.BrandSN AND b.CompanyId = a.CompanyId
            ) AS tb
GO
/****** Object:  View [dbo].[Vw_StockTaking]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_StockTaking]
AS
	WITH list AS(
    SELECT  a.Id ,
			a.CompanyId,
            a.CheckBatch ,
            b.LockStoreID ,
            a.LockNumber ,
            c.number ActualNumber ,
			c.State ActualState,
            a.CorrectNumber,
            c.CheckUID ,
			c.CreateUID,
            c.CreateDT,
            CONVERT(VARCHAR(10),c.CreateDT,120) LockDate,--盘点日期
            b.State,
			a.Sure,
			CASE a.Sure WHEN 1 THEN '无差异' WHEN 2 THEN '有差异' ELSE '未确认' END SureTitle,
            d.ProductCode ,
            d.Barcode ,
            d.Title ,
            d.SubUnit,
			dbo.F_ProductCategoryFullDescBySN(d.CategorySN,d.CompanyId) AS CategoryTitle,
			d.CategorySN,
			d.BrandSN,
            d.Size,
            d.SupplierId,
            c.InitNumber,
			c.number,
            c.number-a.LockNumber SubstractNum--盈亏数量
    FROM    dbo.StockTaking a
            INNER JOIN dbo.TreasuryLocks b ON a.CheckBatch = b.CheckBatch AND a.companyid=b.companyid
            LEFT JOIN Vw_StockTaking_Log c ON a.CheckBatch = c.CheckBatch
                                AND a.Barcode = c.Barcode
                                AND a.companyid = c.companyid
            INNER JOIN (
			SELECT p.Barcode,p.Title,p.SupplierId,p.BrandSN,p.CategorySN,p.Size,dbo.F_DicNameForSN(p.SubUnitId,p.CompanyId) AS SubUnit,p.ProductCode,p.CompanyId FROM dbo.ProductRecord p
			UNION ALL
			SELECT g.NewBarcode,'[捆绑] '+g.Title AS Title,'',0,0,'','捆','',g.CompanyId FROM dbo.Bundling g
			) d ON a.Barcode = d.Barcode AND a.companyid=d.companyid
	) SELECT *
	--,(SELECT SUM(ActualNumber) FROM list WHERE CompanyId=l.companyid AND CheckBatch=l.checkbatch) AS ActualNumbers
	--,(SELECT SUM(LockNumber) FROM list WHERE CompanyId=l.companyid AND CheckBatch=l.checkbatch) AS LockNumbers
	--,(SELECT SUM(SubstractNum) FROM list WHERE CompanyId=l.companyid AND CheckBatch=l.checkbatch) AS SubstractNums
	--,(SELECT SUM(SubstractTotal) FROM list WHERE CompanyId=l.companyid AND CheckBatch=l.checkbatch) AS SubstractTotals
	--,(SELECT SUM(ActualTotal) FROM list WHERE CompanyId=l.companyid AND CheckBatch=l.checkbatch) AS ActualTotals
	FROM list l
GO
/****** Object:  View [dbo].[Vw_SaleDetail]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_SaleDetail]
AS
SELECT     d.Id, d.PaySN, d.Barcode, dbo.F_CommodityTitleByBarcode(d.Barcode) AS Title, d.PurchaseNumber, d.BuyPrice, d.SysPrice, d.ActualPrice, d.SalesClassifyId,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.SalesReturnsDetailed AS b
                            WHERE      (ReceiptsNumber = d.PaySN) AND (Barcode = d.Barcode)) AS HasReturned,
                          (SELECT     SUM(Number) AS Expr1
                            FROM          dbo.SalesReturnsDetailed AS b
                            WHERE      (ReceiptsNumber = d.PaySN) AND (Barcode = d.Barcode)) AS ReturnedNumber, o.ReturnId, o.StoreId, o.Type, o.State
FROM         dbo.SaleOrders AS o INNER JOIN
                      dbo.SaleDetail AS d ON o.PaySN = d.PaySN
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售明细（包含售后退换信息）视图' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_SaleDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 244
               Bottom = 125
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_SaleDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_SaleDetail'
GO
/****** Object:  View [dbo].[Vw_Supplier]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Supplier]
AS
SELECT  *
FROM    ( SELECT    a.* ,
					dbo.F_UserNameById(a.Designee) Designeer,
					dbo.F_DicNameForSN(a.ClassifyId,a.CompanyId) ClassName,
                    b.ContractSN ,
                    b.State ,
                    b.EndDate,
                    (SELECT COUNT(*) FROM dbo.IndentOrder WHERE SupplierID=b.SupplierId) OrderNum,
                    (SELECT COUNT(*) FROM dbo.OutboundGoods WHERE ApplyOrgId=a.Id) ApplyNum,
                    ROW_NUMBER() OVER ( ORDER BY a.CreateDT DESC ) rw
          FROM      dbo.Supplier a
                    LEFT JOIN ( SELECT  number = ROW_NUMBER() OVER ( PARTITION BY SupplierId ORDER BY CreateDT DESC ) ,
                                        *
                                FROM    dbo.Contract
                              ) b ON a.Id = b.SupplierId
                                     AND b.number = 1
          --ORDER BY  a.CreateDT DESC
        ) tb
GO
/****** Object:  View [dbo].[Vw_Order]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Order]
AS
    SELECT DISTINCT
            a.Id ,
            a.companyid,
            a.IndentOrderId ,
            a.StoreId ,
            a.RecipientsUID ,
            a.Phone ,
            a.SupplierID ,
            a.OrderTotal ,
            a.ShippingAddress ,
            a.DeliveryDate ,
            a.PeiSongStartDate ,
            a.PeiSongEndDate ,
            a.ReceivedDT ,
            a.CreateDT ,
            a.CreateUID ,
            a.State ,
            dbo.F_StoreNameById(a.StoreId,a.CompanyId) AS StoreTitle ,
            dbo.F_UserNameById(a.CreateUID) AS OrderTitle ,
            dbo.F_SupplierNameById(a.SupplierID) AS SupplierTitle ,
            dbo.F_UserNameById(a.RecipientsUID) AS RecipientsTitle ,
            dbo.F_UserNameById(a.CreateUID) AS CreateTitle ,
            b.IndentNums ,
            b.DeliveryNums ,
            b.AcceptNums ,
            '' AS DistributionBatch ,
            '' AS Memo ,
            a.ApproveDT ,
            ( dbo.F_NumberAutoStr(b.IndentNums) + ' / '
              + ISNULL(( SELECT dbo.F_NumberAutoStr(SUM(IndentNum))
                         FROM   IndentOrderList
                         WHERE  IndentOrderId = a.IndentOrderId
                                AND Nature = 1
                       ), '0') ) AS OrderGiftnum
    FROM    dbo.IndentOrder AS a
            INNER JOIN ( SELECT SUM(IndentNum) AS IndentNums ,
                                SUM(DeliveryNum) AS DeliveryNums ,
                                SUM(AcceptNum) AS AcceptNums ,
                                IndentOrderId
                         FROM   dbo.IndentOrderList
                         WHERE  Nature = 0
                         GROUP BY IndentOrderId
                       ) AS b ON b.IndentOrderId = a.IndentOrderId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 125
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_Order'
GO
/****** Object:  StoredProcedure [dbo].[Rpt_SupplierSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<hs>
-- Create date: <2015-09-28>
-- Description:	<供应商同比汇总月报>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_SupplierSummary]
    @startDate VARCHAR(20),
    @endDate VARCHAR(20),
    @SameStartDate VARCHAR(20),
    @SameEndDate VARCHAR(20),
    @storeId VARCHAR(100)=''
    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF(LEN(@storeId)>0 and @storeId IS not NULL)
		BEGIN
        SELECT tb.*,ISNULL(sameTb.SameSaleTotal,0) SameSaleTotal,ISNULL(sameTb.SameJML,0) + '' SameJML,ISNULL(sameTb.SameJMLL,0.0) + '%' SameJMLL,
    ISNULL(sameTb.RAWSameJMLL, 0) RAWSameJMLL,
    CASE WHEN (SameSaleTotal = 0 OR SameSaleTotal IS NULL) THEN '-' ELSE CAST((((SaleTotal - SameSaleTotal) / SameSaleTotal)*100) as varchar(20)) + '%' END SaleYOY,
    CASE WHEN (SameJML = 0 OR SameJML IS NULL) THEN '-' ELSE CAST((((JML - SameJML) / SameJML)*100) as varchar(20)) + '%' END JMLYOY,
    CASE WHEN (RAWSameJMLL = 0 OR RAWSameJMLL IS NULL) THEN '-' ELSE CAST(CAST((((RAWJMLL - RAWSameJMLL) / RAWSameJMLL)*100) as NUMERIC(5,2)) as varchar(20)) + '%' END JMLLYOY
     FROM (
    SELECT  b.SupplierTitle,
		(SUM(a.ActualPrice*a.PurchaseNumber)) SaleTotal,
		(SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber)) JML,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN '0.0' ELSE CAST(CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) as varchar(20)) END + '%' JMLL,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN 0 ELSE CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) END RAWJMLL
    FROM    dbo.SaleDetail a
            LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
            WHERE EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN @startDate AND @endDate and EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId)) GROUP BY b.SupplierId,b.SupplierTitle
    ) AS tb 
    LEFT JOIN
        (SELECT  b.SupplierTitle,
		(SUM(a.ActualPrice*a.PurchaseNumber)) SameSaleTotal,
		(SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber)) SameJML,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN '0' ELSE CAST(CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) as varchar(20)) END + '' SameJMLL,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN '0' ELSE CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) END RAWSameJMLL
    FROM    dbo.SaleDetail a
            LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
            WHERE EXISTS ( SELECT 1
											 FROM   dbo.SaleOrders
											 WHERE  PaySN = a.PaySN
											 AND CreateDT BETWEEN @SameStartDate AND @SameEndDate and StoreId=@storeId) GROUP BY b.SupplierId,b.SupplierTitle
    ) AS sameTb
    ON tb.SupplierTitle = sameTb.SupplierTitle
	END
	
	
	ELSE
	BEGIN
	      SELECT tb.*,ISNULL(sameTb.SameSaleTotal,0) SameSaleTotal,ISNULL(sameTb.SameJML,0) + '' SameJML,ISNULL(sameTb.SameJMLL,0.0) + '%' SameJMLL,
    ISNULL(sameTb.RAWSameJMLL, 0) RAWSameJMLL,
    CASE WHEN (SameSaleTotal = 0 OR SameSaleTotal IS NULL) THEN '-' ELSE CAST((((SaleTotal - SameSaleTotal) / SameSaleTotal)*100) as varchar(20)) + '%' END SaleYOY,
    CASE WHEN (SameJML = 0 OR SameJML IS NULL) THEN '-' ELSE CAST((((JML - SameJML) / SameJML)*100) as varchar(20)) + '%' END JMLYOY,
    CASE WHEN (RAWSameJMLL = 0 OR RAWSameJMLL IS NULL) THEN '-' ELSE CAST(CAST((((RAWJMLL - RAWSameJMLL) / RAWSameJMLL)*100) as NUMERIC(5,2)) as varchar(20)) + '%' END JMLLYOY
     FROM (
    SELECT  b.SupplierTitle,
		(SUM(a.ActualPrice*a.PurchaseNumber)) SaleTotal,
		(SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber)) JML,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN '0.0' ELSE CAST(CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) as varchar(20)) END + '%' JMLL,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN 0 ELSE CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) END RAWJMLL
    FROM    dbo.SaleDetail a
            LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
            WHERE EXISTS ( SELECT 1
                         FROM   dbo.SaleOrders
                         WHERE  PaySN = a.PaySN
                                AND CreateDT BETWEEN @startDate AND @endDate) GROUP BY b.SupplierId,b.SupplierTitle
    ) AS tb 
    LEFT JOIN
        (SELECT  b.SupplierTitle,
		(SUM(a.ActualPrice*a.PurchaseNumber)) SameSaleTotal,
		(SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber)) SameJML,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN '0' ELSE CAST(CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) as varchar(20)) END + '' SameJMLL,
		CASE WHEN SUM(a.ActualPrice*a.PurchaseNumber) = 0 THEN '0' ELSE CAST(((SUM(a.ActualPrice*a.PurchaseNumber)-SUM(a.BuyPrice*a.PurchaseNumber))/SUM(a.ActualPrice*a.PurchaseNumber))*100 as NUMERIC(5,1)) END RAWSameJMLL
    FROM    dbo.SaleDetail a
            LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
            WHERE EXISTS ( SELECT 1
											 FROM   dbo.SaleOrders
											 WHERE  PaySN = a.PaySN
											 AND CreateDT BETWEEN @SameStartDate AND @SameEndDate) GROUP BY b.SupplierId,b.SupplierTitle
    ) AS sameTb
    ON tb.SupplierTitle = sameTb.SupplierTitle
	END
    

    
   
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_GiftMonthlyStatistical]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_GiftMonthlyStatistical]
	@startDate varchar(20),
	@endDate varchar(20),
	@category VARCHAR(300)='',
	@supplier varchar(500)='',
	@store varchar(100)
AS
BEGIN
if exists(select * from tempdb..sysobjects where id=object_id('tempdb..#T'))
 drop table #t;
with my1 as(
	select * from ProductCategory WHERE EXISTS(SELECT 1 FROM dbo.SplitString(@category,',',1) WHERE CAST(Value AS int)=CategorySN)
	           union all select ProductCategory.* from my1, ProductCategory where my1.CategorySN = ProductCategory.CategoryPSN)
select CategorySN into #t from my1;

    SELECT 
		i.Title store,
		b.CreateDT riqi ,
		f.Title supplier,
		c.BigCategoryTitle category,
		(c.BigCategoryTitle+'/'+c.MidCategoryTitle+'/'+c.SubCategoryTitle) CategoryTitle,
		(select Title from [dbo].[ProductBrand] where [BrandSN] = c.[BrandSN])  brand ,
		a.Barcode barcode ,
		c.Title title ,
		h.Title unit,
		a.PurchaseNumber num,
		a.SysPrice price,
		a.PurchaseNumber * a.SysPrice total
        FROM  [dbo].[SaleDetail] AS a
        INNER JOIN [dbo].[SaleOrders] AS b ON (a.[PaySN] = b.[PaySN]) 
        INNER JOIN [dbo].[Vw_Product] AS c ON (a.[Barcode] = c.[Barcode])
       -- INNER JOIN [dbo].[ProductBrand] AS e ON e.[BrandSN] = c.[BrandSN]
        INNER JOIN [dbo].[Supplier] AS f ON f.[Id] = c.[SupplierId]
        INNER JOIN [dbo].[SysDataDictionary] AS h ON h.[DicSN] = c.[SubUnitId]
		INNER JOIN [dbo].[Warehouse] AS i ON (i.[StoreId] = b.[StoreId])
        WHERE  a.[ActualPrice]=0 
		and (@category='' or c.CategorySN in (select * from #t))
		AND (1 = i.[State])
	      AND (@supplier='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplier,',',1) WHERE Value=c.SupplierId))
	     AND (@store='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@store,',',1) WHERE Value=b.StoreId))
	     AND (b.[CreateDT] between @startDate and @endDate)


END
GO
/****** Object:  View [dbo].[Vw_Product_Bundling]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Product_Bundling]
AS
SELECT
  b.Id,
  b.Barcode ,
  b.PrefixTitle Title ,
  b.SubUnit ,
  b.SupplierId ,
  b.BrandSN ,
  b.CategorySN,
  b.CategoryTitle,
  b.SupplierTitle,
  b.ProductCode,
  b.StockRate,
  b.SaleRate,
  b.CompanyId,
  b.Barcodes,
  b.BuyPrice,
  b.SysPrice,
  b.Size,
  b.BrandTitle,
  b.ValuationType
  FROM
  Vw_Product b
  UNION ALL
  SELECT
  1000000+a.Id,
  NewBarcode ,
  '[捆绑] '+Title Title,
  '捆' ,
  '' ,
  0 ,
  0,
  '',
  '',
  '',
  17,
  17,
  CompanyId,
  '',
  a.BuyPrices,
  a.SysPrices,
  '',
  '',
  1
  FROM
  dbo.Bundling a
GO
/****** Object:  View [dbo].[Vw_OrderList]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--采购和入库

CREATE VIEW [dbo].[Vw_OrderList] AS	

	SELECT *,CASE WHEN t.Nature=0 THEN t.IndentNum ELSE 0 END AS IndentNoGiftNum FROM (
	SELECT '采购' OrderType,c.CompanyId,c.IndentOrderId,c.IndentOrderId AS InboundGoodsId, b.ProductCode, b.Barcode,b.Title,c.SupplierID,b.BrandSN,b.CategorySN,b.SubUnit,a.IndentNum,a.AcceptNum,a.Price,a.SysPrice,c.StoreId,c.State,b.StockRate,ISNULL(c.ReceivedDT,c.CreateDT) CreateDT,CONVERT(VARCHAR(20),c.ReceivedDT,23) OperatDT,a.Nature,b.BrandTitle FROM dbo.IndentOrderList a
			INNER JOIN dbo.IndentOrder c ON a.IndentOrderId=c.IndentOrderId
			INNER JOIN dbo.Vw_Product b ON (a.Barcode=b.Barcode OR ','+b.Barcodes+',' LIKE '%,'+a.Barcode+',%') AND b.CompanyId=c.CompanyId
			WHERE c.State>0
			UNION ALL
		SELECT '入库' OrderType,c.CompanyId,c.IndentOrderId,c.InboundGoodsId, b.ProductCode, b.Barcode,b.Title,c.SupplierID,b.BrandSN,b.CategorySN,b.SubUnit,a.InboundNumber,a.InboundNumber,a.BuyPrice,a.SysPrice,c.StoreId,5 State,b.StockRate,ISNULL( c.VerifyTime,c.CreateDT) CreateDT,CONVERT(VARCHAR(20),c.ReceivedDT,23) OperatDT,a.IsGift,b.BrandTitle FROM dbo.InboundList a
		INNER JOIN dbo.InboundGoods c ON a.InboundGoodsId=c.InboundGoodsId
		INNER JOIN dbo.Vw_Product b ON (a.Barcode=b.Barcode OR ','+b.Barcodes+',' LIKE '%,'+a.Barcode+',%') AND b.CompanyId=c.CompanyId
		WHERE (c.source=2 OR ISNULL(c.IndentOrderId,'')='') AND c.State=1
	) t
GO
/****** Object:  StoredProcedure [dbo].[AffectInventory_SplitGoods]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-22
-- Description:	影响拆分商品库存量
--				(供dbo.AffectInventory内部调用)
-- =============================================
CREATE PROCEDURE [dbo].[AffectInventory_SplitGoods]
	@CompanyId  Int,
	@StoreId	Int,
	@Source		SmallInt,		--来源标识
	@OperatType	SmallInt,		--操作类型（1:增加，2:相减）
	@CurBarcode	Varchar(30),
	@OldBarcode	Varchar(30),
	@Number		Money,			--数量（正值）
	@OperatId	Varchar(40)='',	--入库ID或配送ID
	@CreateUID  Varchar(40),	--操作人UID
	@CreateDT	Datetime,
	@SalePrice	Money=0			--销售单价
AS
BEGIN
	IF(@OperatType=1)
	BEGIN
		--入库
		EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
								,@CurBarcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;
	END
	ELSE
	BEGIN
		--出库
		--得到要拆的父商品，和子商品应扣数量
		DECLARE @FatherBarcode Varchar(30);
		DECLARE @Barcode Varchar(30);
		DECLARE @Nature SmallInt; SET @Nature=2;
		DECLARE @SaleNum Money; SET @SaleNum=0;
		DECLARE @_SysPrice Money; SET @_SysPrice=0;
		
		SELECT @Barcode=Barcode,@FatherBarcode=[OldBarcode],@SaleNum=[SaleNum]
		FROM dbo.ProductRecord WHERE CompanyId=@CompanyId AND Barcode=@CurBarcode;
				
		SELECT @Nature=[Nature]
			,@_SysPrice=@_SysPrice + [dbo].[F_SysPriceByBarcode] (@StoreId,[Barcode],@CompanyId)
		FROM dbo.ProductRecord WHERE CompanyId=@CompanyId AND Barcode=@FatherBarcode;
		
		--
		IF(@Nature=0 AND @SaleNum>0)
		BEGIN
			--若为单品，则影响库存量
			DECLARE @CurNumber Money; SET @CurNumber=0;
			--
			SELECT @CurNumber=StockNumber
			FROM dbo.Inventory
			where CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
			
			IF(@CurNumber<@Number)
			BEGIN
				--子商品不够量，则计算要拆几件父商品
				SELECT @SaleNum=[SaleNum], @FatherBarcode=[OldBarcode]
				FROM dbo.ProductRecord WHERE CompanyId=@CompanyId AND Barcode=@CurBarcode;

				DECLARE @Differ Money;
				SET @Differ=ceiling(abs(@CurNumber-@Number)/@SaleNum);
				
				--影响父商品库存变化明细
				EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,8,2
												,@FatherBarcode,@Differ,@OperatId,@CreateUID,@CreateDT,@_SysPrice;
				

				--得到该父商品下的子商品集合
				DECLARE @Items Nvarchar(500); SET @Items='';
				DECLARE @Nums Nvarchar(500); SET @Nums='';
				DECLARE @Prices Nvarchar(500); SET @Prices='';
				
				SELECT @Items=@Items+'|'+Barcode
						,@Nums=@Nums+'|'+CAST(SaleNum as Nvarchar)
						,@Prices=@Prices+'|'+CAST([dbo].[F_SysPriceByBarcode] (@StoreId,Barcode,@CompanyId) as Nvarchar)
				FROM ProductRecord WHERE OldBarcode=@FatherBarcode;
				
				--去掉首尾|符号
				SELECT @Items=dbo.Sys_F_RemoveSign(@Items,'|');
				SELECT @Nums=dbo.Sys_F_RemoveSign(@Nums,'|');
				SELECT @Prices=dbo.Sys_F_RemoveSign(@Prices,'|');
				
				IF(LEN(@Items)>0)
				BEGIN
					
					DECLARE @i INT, @j Int, @k Int;
					SET @i = CHARINDEX('|',@Items);	--Barcode
					SET @j = CHARINDEX('|',@Nums);	--Number
					SET @k = CHARINDEX('|',@Prices);--SysPrice

					DECLARE @code varchar(30);
					DECLARE @snum money;
					DECLARE @sprice money;

					WHILE(@i>0)
					BEGIN
						SET @code = LEFT(@Items,@i-1);
						SET @snum = LEFT(@Nums,@j-1);
						SET @sprice = LEFT(@Prices,@k-1);
						
						SET @Items = SUBSTRING(@Items,@i+1,LEN(@Items)-@i);
						SET @Nums = SUBSTRING(@Nums,@j+1,LEN(@Nums)-@j);
						SET @Prices = SUBSTRING(@Prices,@k+1,LEN(@Prices)-@k);
						
						SET @i = CHARINDEX('|',@Items);
						SET @j = CHARINDEX('|',@Nums);
						SET @k = CHARINDEX('|',@Prices);
						
						--将拆出来的入库到相关子商品中
						SET @snum=@snum*@Differ;
						EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,7,1
														,@code,@snum,@OperatId,@CreateUID,@CreateDT,@sprice;

					END	
					
					IF(@i<1 AND LEN(@Items)>0)
					BEGIN
						--将拆出来的商品入库到最后一个子商品中
						SET @Nums=@Nums*@Differ;
						EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,7,1
														,@Items,@Nums,@OperatId,@CreateUID,@CreateDT,@Prices;

					END		
				END
			END
			
			--影响子商品库存
			EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
											,@CurBarcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;			

		END
		ELSE IF (@Nature=2)
		BEGIN
			--还需再拆分
			EXEC dbo.[AffectInventory_SplitGoods] @CompanyId,@StoreId,@Source,@OperatType
											,@FatherBarcode,@FatherBarcode,@Number,@OperatId
											,@CreateUID,@CreateDT,@SalePrice;			
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCurrentPrice]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2016-06-01
-- Description:	当前价格信息
-- =============================================
CREATE PROCEDURE [dbo].[GetCurrentPrice]
	@companyId INT,
	@barcode VARCHAR(30), 
	@type SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF(@type=3)
	BEGIN
		SELECT '批发商' AS [Type],t.StoreId,t.Title,CAST(t.TradePrice AS VARCHAR(20)) AS [Description] INTO #whole FROM(
			SELECT a.Wholesaler StoreId,c.Title,d.Barcode,d.TradePrice,ROW_NUMBER() OVER(PARTITION BY c.Id ORDER BY a.AuditorDT desc) rn FROM dbo.ProductTradePrice a
			OUTER APPLY dbo.SplitString(a.Wholesaler,',',1) b
			INNER JOIN dbo.Supplier c ON (b.Value=c.Id OR b.Value='-1') AND c.CompanyId = a.CompanyId AND c.BusinessType=2
			INNER JOIN dbo.ProductTradePriceList d ON d.TradePriceId=a.Id AND GETDATE()>=d.StartDate AND GETDATE()<DATEADD(DAY,1,d.EndDate)
			WHERE a.State=1 AND d.Barcode=@barcode AND a.CompanyId=@companyId) t WHERE t.rn=1
			IF(EXISTS(SELECT 1 FROM #whole))
			BEGIN
				SELECT * FROM #whole ORDER BY Description;
			END
			ELSE
			BEGIN
				SELECT '默认价' AS [Type],'' StoreId,'' Title,CAST(TradePrice AS VARCHAR(20)) AS [Description] FROM dbo.ProductRecord WHERE CompanyId=@companyId AND Barcode=@barcode
			end
	END
	ELSE
	begin
		IF(@type=1)--售价
			BEGIN
				DECLARE @unit varchar(20);
				SELECT @unit='('+SubUnit+')' FROM dbo.Vw_Product WHERE CompanyId=@companyId AND Barcode=@barcode
				--单品折扣
				SELECT '单品折扣' AS [Type],d.StoreId,d.Title,CASE
				WHEN d.Way=1 THEN '固定量叠加 '+dbo.F_NumberAutoStr(d.MinPurchaseNum)+@unit+CAST(d.DiscountPrice AS VARCHAR(10))
				WHEN d.way=3 THEN '固定量不叠加 '+dbo.F_NumberAutoStr(d.MinPurchaseNum)+@unit+CAST(d.DiscountPrice AS VARCHAR(10))
				ELSE '起购量 '+dbo.F_NumberAutoStr(d.MinPurchaseNum)+@unit+'起 '+CAST(d.DiscountRate AS VARCHAR(10))+' 折'
				END AS [Description] INTO #discount
				FROM (
					SELECT a.StoreId,d.Title,a.CreateDT,b.*,ROW_NUMBER() OVER(PARTITION BY d.StoreId ORDER BY a.CreateDT desc) rn FROM dbo.CommodityPromotion a 
					INNER JOIN dbo.CommodityDiscount b ON a.Id=b.CommodityId
					OUTER APPLY dbo.SplitString(a.StoreId,',',1) c
					INNER JOIN dbo.Warehouse d ON (c.Value=d.StoreId OR c.Value='-1') AND d.CompanyId = a.CompanyId
					WHERE a.State=1 AND a.PromotionType=1 AND (a.Timeliness=0 OR (a.Timeliness=1 AND (CONVERT(VARCHAR(20),GETDATE(),8) BETWEEN StartAging1 AND EndAging1)
						OR CONVERT(VARCHAR(20),GETDATE(),8) BETWEEN StartAging2 AND EndAging2 OR CONVERT(VARCHAR(20),GETDATE(),8) BETWEEN StartAging3 AND EndAging3))
						AND b.Barcode=@barcode
						AND a.CompanyId=@companyId
				) AS d WHERE d.rn=1
					
				IF(EXISTS(SELECT 1 FROM #discount))
				BEGIN
					SELECT * FROM #discount ORDER BY [Description];
				END
				else
				begin	
				--变价
					SELECT '产品变价' AS [Type],c.StoreId,c.Title,CAST(c.CurSysPrice AS VARCHAR(20)) AS [Description] INTO #change
					FROM (
						SELECT a.StoreId,c.Title,d.Barcode,d.CurBuyPrice,d.CurSysPrice,dbo.F_SupplierNameById(a.SupplierId) SupplierTitle,ROW_NUMBER() OVER(PARTITION BY c.StoreId ORDER BY a.AuditorDT desc) rn FROM dbo.ProductChangePrice a
						OUTER APPLY dbo.SplitString(a.StoreId,',',1) b
						INNER JOIN dbo.Warehouse c ON (b.Value=c.StoreId OR b.Value='-1') AND c.CompanyId = a.CompanyId
						INNER JOIN ProductChangePriceList d ON d.ChangePriceId=a.Id AND d.State=1
						WHERE a.State=1 AND d.Barcode=@barcode AND a.CompanyId=@companyId
					) AS c WHERE rn=1
					
					IF(EXISTS(SELECT 1 FROM #change))
					BEGIN
						SELECT * FROM #change ORDER BY [Description];
					END
					ELSE
					BEGIN
						SELECT '一品多价' AS [Type],a.StoreId,b.Title,CAST(a.Price AS VARCHAR(20)) AS [Description] INTO #price FROM dbo.ProductMultPrice a
						INNER JOIN dbo.Warehouse b ON b.StoreId = a.StoreId
						WHERE a.Barcode=@barcode AND a.CompanyId=@companyId
						IF(EXISTS(SELECT 1 FROM #price))
						BEGIN
							SELECT * FROM #price ORDER BY [Description];
						END
						ELSE
						BEGIN
						SELECT '默认价' AS [Type],'' StoreId,'' Title,CAST(SysPrice AS VARCHAR(20)) AS [Description] FROM dbo.ProductRecord WHERE CompanyId=@companyId AND Barcode=@barcode
						end
					END
				end
		END
		ELSE
			BEGIN
			SELECT '产品变价' AS [Type],c.StoreId,c.Title,CAST(c.CurBuyPrice AS VARCHAR(20)) AS [Description] INTO #change2
				FROM (
					SELECT a.StoreId,c.Title,d.Barcode,d.CurBuyPrice,d.CurSysPrice,dbo.F_SupplierNameById(a.SupplierId) SupplierTitle,ROW_NUMBER() OVER(PARTITION BY c.StoreId ORDER BY a.AuditorDT desc) rn FROM dbo.ProductChangePrice a
					OUTER APPLY dbo.SplitString(a.StoreId,',',1) b
					INNER JOIN dbo.Warehouse c ON (b.Value=c.StoreId OR b.Value='-1') AND c.CompanyId = a.CompanyId
					INNER JOIN ProductChangePriceList d ON d.ChangePriceId=a.Id AND d.State=1
					WHERE a.State=1 AND d.Barcode=@barcode AND a.CompanyId=@companyId
				) AS c WHERE rn=1
			IF(EXISTS(SELECT 1 FROM #change2))
			BEGIN
				SELECT * FROM #change2 ORDER BY [Description];
			END
			ELSE
			BEGIN
				SELECT '一品多商' AS [Type],a.SupplierId,dbo.F_SupplierNameById(a.SupplierId) Title,CAST(a.BuyPrice AS VARCHAR(20)) AS [Description] INTO #sup FROM dbo.ProductMultSupplier a
				WHERE a.Barcode=@barcode AND a.CompanyId=@companyId
				IF(EXISTS(SELECT 1 FROM #sup))
				BEGIN
					SELECT * FROM #sup ORDER BY [Description];
				END
				ELSE
				BEGIN
					SELECT '默认价' AS [Type],'' StoreId,'' Title,CAST(BuyPrice AS VARCHAR(20)) AS [Description] FROM dbo.ProductRecord WHERE CompanyId=@companyId AND Barcode=@barcode
				end
			end
		END
    end
END
GO
/****** Object:  StoredProcedure [dbo].[AffectInventory_Recount]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-28
-- Description:	重新计算相关联的库存
--				(供dbo.AffectInventory 内部调用)
-- =============================================
CREATE PROCEDURE [dbo].[AffectInventory_Recount]
	@CompanyId   Int,
	@StoreId	 Int,
	@Source		 SmallInt,
	@Barcode	 Varchar(30),	--仅限单品
	@OperatId	 Varchar(40)='',--入库ID或配送ID
	@CreateUID   Varchar(40),
	@CreateDT	 Datetime
AS
BEGIN
	DECLARE @_num Money, @kuCun Money, @pMin Money, @min Money, @_min Money, @BarcodeType SmallInt;
	DECLARE @ValuationType Smallint; SET @ValuationType=1;
	DECLARE @_Barcode Varchar(30); set @_Barcode=@Barcode;
	SET @Source=17; SET @BarcodeType=3;
	--
	IF(OBJECT_ID('tempdb.dbo.#tmpRecountList','U') IS NOT NULL)
	BEGIN
		DROP TABLE dbo.#tmpRecountList;
	END
	CREATE TABLE dbo.#tmpRecountList(item varchar(30), num money, valuationType smallint);

	--寻找该单品被分布位置，优先级：3.拆分新条码、2.组合新条码、1.捆绑新条码
	--
	IF(OBJECT_ID('tempdb.dbo.#tmpRecount','U') IS NOT NULL)
	BEGIN
		DROP TABLE dbo.#tmpRecount;
	END
	CREATE TABLE dbo.#tmpRecount(p_item varchar(30), p_id varchar(40));
	--
	IF EXISTS (SELECT * FROM dbo.ProductGroup
					WHERE CompanyId=@CompanyId AND GroupBarcode=@Barcode)
	BEGIN
		--2.存在被组合，则得到同一组子商品
		SET @BarcodeType=2;
		SET @_min=0;
		SET @min=0;
		SET @_num=0;
		--得到所在组的组合父条码
		--TRUNCATE TABLE dbo.#tmpRecount;
		INSERT INTO dbo.#tmpRecount SELECT Barcode,''
		FROM dbo.ProductGroup WHERE CompanyId=@CompanyId AND GroupBarcode=@Barcode;

		WHILE EXISTS (SELECT p_item FROM dbo.#tmpRecount)
		BEGIN
			--得到该组下的子商品
			SET ROWCOUNT 1;
			SELECT @_Barcode=p_item FROM dbo.#tmpRecount;						
			SET ROWCOUNT 0;
			DELETE FROM dbo.#tmpRecount WHERE p_item=@_Barcode;

			TRUNCATE TABLE dbo.#tmpRecountList;
			INSERT INTO dbo.#tmpRecountList
			SELECT * FROM (
				SELECT g.GroupBarcode as [item],g.Number as [num], r.ValuationType as [valuationType]
				FROM dbo.ProductGroup as g INNER JOIN dbo.ProductRecord as r ON r.CompanyId=g.CompanyId
				AND g.Barcode=r.Barcode
				WHERE g.CompanyId=@CompanyId AND g.Barcode=@_Barcode
			)  AS tmp GROUP BY item,num,valuationType
			--取该组合的库存
			SET @min=dbo.F_InventoryNum(@StoreId,@_Barcode,1,@CompanyId);

			--取同一组子商品最小的数量
			WHILE EXISTS(SELECT item FROM dbo.#tmpRecountList)
			BEGIN
				SET ROWCOUNT 1;
				SELECT @Barcode=item,@_num=num,@ValuationType=valuationType FROM dbo.#tmpRecountList;
				
				SET ROWCOUNT 0;
				DELETE FROM dbo.#tmpRecountList WHERE item=@Barcode;

				SELECT @_min=ISNULL(StockNumber,0)
				FROM dbo.Inventory
				WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
				
				IF(@ValuationType=1)
				BEGIN
					SET @_min=floor(@_min/@_num);
				END
				ELSE
				BEGIN
					SET @_min=(@_min/@_num);
				END
				
				IF(@_min<@min)
				BEGIN
					SET @min=@_min;
				END				
			END 
			
			IF(@min<0) SET @min=0;
			EXEC [dbo].[AffectInventory_SKU_Recount] @CompanyId, @StoreId, @Source
								,@_Barcode, @min, @OperatId, @CreateUID, @CreateDT;
		END
		--

	END
	
	--
	IF EXISTS (SELECT b.* FROM dbo.Bundling as b
					INNER JOIN dbo.BundlingList as l on l.CommodityId=b.CommodityId
					INNER JOIN dbo.CommodityPromotion as cp on cp.Id=b.CommodityId
					AND cp.[State]=1
					AND cp.CompanyId=b.CompanyId
					AND cp.PromotionType=2
					AND dbo.Comm_F_NumIsInGroup(@StoreId,cp.StoreId)=1
					WHERE b.CompanyId=@CompanyId AND l.Barcode=@Barcode
					)
	BEGIN
		--1.存在被捆绑，则得到同一捆子商品
		SET @BarcodeType=1;
		SET @_num=0;
		SET @_min=0;
		SET @min=0;
		--得到所在捆绑的新条码
		DECLARE @CommodityId Varchar(40);
		TRUNCATE TABLE dbo.#tmpRecount;
		INSERT INTO dbo.#tmpRecount
		SELECT b.NewBarcode as [p_item], b.CommodityId as [p_id]
			FROM dbo.Bundling as b
			INNER JOIN dbo.BundlingList as l on l.CommodityId=b.CommodityId
			INNER JOIN dbo.CommodityPromotion as cp on cp.Id=b.CommodityId
			AND cp.[State]=1
			AND cp.CompanyId=b.CompanyId
			AND cp.PromotionType=2
			AND dbo.Comm_F_NumIsInGroup(@StoreId,cp.StoreId)=1
			WHERE b.CompanyId=@CompanyId AND l.Barcode=@Barcode;
		
		WHILE EXISTS (SELECT p_item FROM dbo.#tmpRecount)
		BEGIN
			SET ROWCOUNT 1;
			SELECT @CommodityId=[p_id],@_Barcode=[p_item] FROM dbo.#tmpRecount;
			
			SET ROWCOUNT 0;
			DELETE FROM dbo.#tmpRecount WHERE [p_id]=@CommodityId;
			
			--得到该组下的子商品
			TRUNCATE TABLE dbo.#tmpRecountList;
			INSERT INTO dbo.#tmpRecountList
			SELECT * FROM (
				SELECT l.Barcode as [item],l.Number as [num],r.ValuationType as [valuationType]
				FROM dbo.BundlingList as l
				INNER JOIN dbo.Bundling as b ON b.CommodityId=l.CommodityId
				INNER JOIN dbo.ProductRecord as r ON r.CompanyId=b.CompanyId AND l.Barcode=r.Barcode OR ','+r.Barcodes+',' LIKE '%,'+l.Barcode+',%'
				WHERE l.CommodityId=@CommodityId
			) AS tmp GROUP BY item,num,valuationType;

			
			--取该捆绑的库存
			SELECT @min=ISNULL(StockNumber,0)
			FROM dbo.Inventory
			WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@_Barcode;

			--取同一捆子商品最小的数量
			WHILE EXISTS(SELECT item FROM dbo.#tmpRecountList)
			BEGIN
				SET ROWCOUNT 1;
				SELECT @Barcode=item,@_num=num,@ValuationType=valuationType FROM dbo.#tmpRecountList;
				SET ROWCOUNT 0;
				DELETE FROM dbo.#tmpRecountList WHERE item=@Barcode;
				
				SELECT @_min=ISNULL(StockNumber,0)
				FROM dbo.Inventory
				WHERE CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@Barcode;
				
				IF(@ValuationType=1)
				BEGIN
					SET @_min=floor(@_min/@_num);
				END
				ELSE
				BEGIN
					SET @_min=(@_min/@_num);
				END
				
				IF(@_min<@min)
				BEGIN
					SET @min=@_min;
				END
			END

			IF(@min<0) SET @min=0;
			EXEC [dbo].[AffectInventory_SKU_Recount] @CompanyId, @StoreId, @Source
								,@_Barcode, @min, @OperatId, @CreateUID, @CreateDT;

		END
	END

END
GO
/****** Object:  StoredProcedure [dbo].[AffectInventory_GroupedGoods]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-23
-- Description:	影响组合商品库存量
--				(供dbo.AffectInventory内部调用)
-- =============================================
CREATE PROCEDURE [dbo].[AffectInventory_GroupedGoods]
	@CompanyId  Int,
	@StoreId	Int,
	@Source		SmallInt,		--来源标识
	@OperatType	SmallInt,		--操作类型（1:增加，2:相减）
	@FatherBarcode	Varchar(30),--组合新条码
	@Number		Money,			--数量（正值）
	@OperatId	Varchar(40)='',	--入库ID或配送ID
	@CreateUID  Varchar(40),	--操作人UID
	@CreateDT	Datetime,
	@SalePrice	Money=0			--销售单价
AS
BEGIN
	DECLARE @_source SmallInt; SET @_source=@Source;
	DECLARE @Nature SmallInt; SET @Nature=1;
	DECLARE @_SysPrice Money; SET @_SysPrice=0;
	
	SELECT @_SysPrice=@_SysPrice + ([dbo].[F_SysPriceByBarcode] (@StoreId,GroupBarcode,@CompanyId) * Number)
	FROM dbo.ProductGroup WHERE CompanyId=@CompanyId AND Barcode=@FatherBarcode;
	
	SELECT @Nature=[Nature] FROM dbo.ProductRecord WHERE CompanyId=@CompanyId AND Barcode=@FatherBarcode;
	--
	IF(@Nature=1)
	BEGIN
		--得到分拆后的子商品集，含子商品应扣数量
		DECLARE @Items NVarchar(500); SET @Items='';
		DECLARE @Nums Nvarchar(500); SET @Nums='';
		DECLARE @Prices Nvarchar(500); SET @Prices='';

		SELECT @Items=@Items+'|'+GroupBarcode
				,@Nums=@Nums+'|'+CAST(Number as Nvarchar)
				,@Prices=@Prices+'|'+CAST([dbo].[F_SysPriceByBarcode] (@StoreId,GroupBarcode,@CompanyId) as Nvarchar)
		FROM dbo.ProductGroup WHERE Barcode=@FatherBarcode;
					
		--去掉首尾|符号
		IF(CHARINDEX('|',@Items)=1)
		BEGIN
			SELECT @Items=dbo.Sys_F_RemoveSign(@Items,'|');
			SELECT @Nums=dbo.Sys_F_RemoveSign(@Nums,'|');
			SELECT @Prices=dbo.Sys_F_RemoveSign(@Prices,'|');
		END
		--select @Items,@Nums,@Prices,@SalePrice;

		IF(LEN(@Items)>0)
		BEGIN
			--销售均价
			--DECLARE @SaleAveragePrice Money;
			--SET @SaleAveragePrice=dbo.[F_SaleAveragePrice] (@CompanyId,@StoreId,CONVERT(Varchar(10),@CreateDT,120),@FatherBarcode,1);
	
			--记录组合新商品库存变化
			EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
				,@FatherBarcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;

			IF(@Source IN (2,4,6,8,9,10,12,13))
			BEGIN
				--记录组合新商品套装的记录				
				EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,18,1
								,@FatherBarcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;				
			END		
				
			--获取该组合商品的库存量
			DECLARE @CurNumber Money; SET @CurNumber=0;
			SELECT @CurNumber=StockNumber
			FROM dbo.Inventory
			where CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@FatherBarcode;
			
			IF(@CurNumber<@Number)
			BEGIN
				--若为该组合商品的库存量不足，则从子商品中拿
				DECLARE @Differ Money;
				IF(@CurNumber<=0)
				BEGIN
					SET @Differ=@Number;
				END
				ELSE
				BEGIN
					SET @Differ=@Number-@CurNumber;
				END
				--
				DECLARE @i INT, @j Int, @k Int;
				SET @i = CHARINDEX('|',@Items);	--Barcode
				SET @j = CHARINDEX('|',@Nums);	--Number
				SET @k = CHARINDEX('|',@Prices);--SysPrice
				
				DECLARE @code varchar(30);
				DECLARE @snum money;
				DECLARE @sprice money;
				DECLARE @SubNature SmallInt; SET @SubNature=0;
				
				WHILE(@i>0)
				BEGIN
					SET @code = LEFT(@Items,@i-1);
					SET @snum = LEFT(@Nums,@j-1) * @Differ;
					SET @sprice = LEFT(@Prices,@k-1);
					
					SET @Items = SUBSTRING(@Items,@i+1,LEN(@Items)-@i);
					SET @Nums = SUBSTRING(@Nums,@j+1,LEN(@Nums)-@j);
					SET @Prices = SUBSTRING(@Prices,@k+1,LEN(@Prices)-@k);
					
					SET @i = CHARINDEX('|',@Items);
					SET @j = CHARINDEX('|',@Nums);
					SET @k = CHARINDEX('|',@Prices);
					
					--校验分拆出来的子商品是否为组合商品
					SELECT @SubNature=[Nature]
					FROM dbo.ProductRecord WHERE CompanyId=@CompanyId AND Barcode=@code;
					
					IF(@SubNature=1)
					BEGIN
						--若子商品为组合商品，则继续分拆
						EXEC [dbo].[AffectInventory_GroupedGoods] @CompanyId,@StoreId,@Source,@OperatType
													,@FatherBarcode,@Number,@OperatId,@CreateUID,@CreateDT,@sprice;
					END
					ELSE IF(@SubNature=0)
					BEGIN
						--若子商品为单品，则无法再分拆，并直接影响该子商品库存量
						IF(@code=@FatherBarcode)
						BEGIN
							SET @Source=@_source;
						END
						ELSE
						BEGIN
							SET @Source=10;	--动态执行：销售组合商品消减
							SET @sprice=(@SalePrice/@_SysPrice)*@sprice;
						END
						
						EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
														,@code,@snum,@OperatId,@CreateUID,@CreateDT,@sprice;
					END
				END
				--
				IF(@i<1 AND LEN(@Items)>0)
				BEGIN
					IF(@code=@FatherBarcode)
					BEGIN
						SET @Source=@_source;
					END
					ELSE
					BEGIN
						SET @Source=10;	--销售组合商品消减
						SET @Prices=(@SalePrice/@_SysPrice)*@Prices;
					END
						
					--将影响分拆出来的最后一个子商品库存
					SET @Nums=@Nums*@Differ;
					EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
													,@Items,@Nums,@OperatId,@CreateUID,@CreateDT,@Prices;
				END
				--
			END
		END	
		
	END		
	
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_BigCategorySummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<hs>
-- Create date: <2015-09-23>
-- Description:	<大类同比汇总月报>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_BigCategorySummary]
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @SameStartDate VARCHAR(20) ,
    @SameEndDate VARCHAR(20) ,
    @storeId VARCHAR(100) = ''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
    
        IF ( LEN(@storeId) > 0
             AND @storeId IS NOT NULL
           )
            BEGIN
                SELECT  tb.* ,
                        ISNULL(sameTb.SameSaleTotal, 0) SameSaleTotal ,
                        ISNULL(sameTb.SameJML, 0) + '' SameJML ,
                        ISNULL(sameTb.SameJMLL, 0.0) + '%' SameJMLL ,
                        ISNULL(sameTb.RAWSameJMLL, 0) RAWSameJMLL ,
                        CASE WHEN ( SameSaleTotal = 0
                                    OR SameSaleTotal IS NULL
                                  ) THEN '-'
                             ELSE CAST(( ( ( SaleTotal - SameSaleTotal )
                                           / SameSaleTotal ) * 100 ) AS VARCHAR(20))
                                  + '%'
                        END SaleYOY ,
                        CASE WHEN ( SameJML = 0
                                    OR SameJML IS NULL
                                  ) THEN '-'
                             ELSE CAST(( ( ( JML - SameJML ) / SameJML ) * 100 ) AS VARCHAR(20))
                                  + '%'
                        END JMLYOY ,
                        CASE WHEN ( RAWSameJMLL = 0
                                    OR RAWSameJMLL IS NULL
                                  ) THEN '-'
                             ELSE CAST(CAST(( ( ( RAWJMLL - RAWSameJMLL )
                                                / RAWSameJMLL ) * 100 ) AS NUMERIC(5,
                                                              2)) AS VARCHAR(20))
                                  + '%'
                        END JMLLYOY
                FROM    ( SELECT    b.BigCategoryTitle ,
									(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber) ) SaleTotal ,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber)
                                      - SUM(a.BuyPrice * a.PurchaseNumber) ) JML ,
                                    CASE WHEN SUM(a.ActualPrice
                                                  * a.PurchaseNumber) = 0
                                         THEN '0.0'
                                         ELSE CAST(CAST(( ( SUM(a.ActualPrice
                                                              * a.PurchaseNumber)
                                                            - SUM(a.BuyPrice
                                                              * a.PurchaseNumber) )
                                                          / SUM(a.ActualPrice
                                                              * a.PurchaseNumber) )
                                              * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                                    END + '%' JMLL ,
                                    CASE WHEN SUM(a.ActualPrice
                                                  * a.PurchaseNumber) = 0
                                         THEN 0
                                         ELSE CAST(( ( SUM(a.ActualPrice
                                                           * a.PurchaseNumber)
                                                       - SUM(a.BuyPrice
                                                             * a.PurchaseNumber) )
                                                     / SUM(a.ActualPrice
                                                           * a.PurchaseNumber) )
                                              * 100 AS NUMERIC(5, 1))
                                    END RAWJMLL
                          FROM      dbo.SaleDetail a
                                    LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                          WHERE     EXISTS ( SELECT 1
                                             FROM   dbo.SaleOrders
                                             WHERE  PaySN = a.PaySN
                                                    AND CreateDT BETWEEN @startDate AND @endDate
                                                    AND StoreId = @storeId )
                          GROUP BY  b.BigCategoryTitle,b.MidCategoryTitle
                        ) AS tb
                        LEFT JOIN ( SELECT  b.BigCategoryTitle ,
											(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                            ( SUM(a.ActualPrice
                                                  * a.PurchaseNumber) ) SameSaleTotal ,
                                            ( SUM(a.ActualPrice
                                                  * a.PurchaseNumber)
                                              - SUM(a.BuyPrice
                                                    * a.PurchaseNumber) ) SameJML ,
                                            CASE WHEN SUM(a.ActualPrice
                                                          * a.PurchaseNumber) = 0
                                                 THEN '0'
                                                 ELSE CAST(CAST(( ( SUM(a.ActualPrice
                                                              * a.PurchaseNumber)
                                                              - SUM(a.BuyPrice
                                                              * a.PurchaseNumber) )
                                                              / SUM(a.ActualPrice
                                                              * a.PurchaseNumber) )
                                                      * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                                            END + '' SameJMLL ,
                                            CASE WHEN SUM(a.ActualPrice
                                                          * a.PurchaseNumber) = 0
                                                 THEN '0'
                                                 ELSE CAST(( ( SUM(a.ActualPrice
                                                              * a.PurchaseNumber)
                                                              - SUM(a.BuyPrice
                                                              * a.PurchaseNumber) )
                                                             / SUM(a.ActualPrice
                                                              * a.PurchaseNumber) )
                                                      * 100 AS NUMERIC(5, 1))
                                            END RAWSameJMLL
                                    FROM    dbo.SaleDetail a
                                            LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                                    WHERE   EXISTS ( SELECT 1
                                                     FROM   dbo.SaleOrders
                                                     WHERE  PaySN = a.PaySN
                                                            AND CreateDT BETWEEN @SameStartDate AND @SameEndDate
                                                            AND EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
                                    GROUP BY b.BigCategoryTitle,b.MidCategoryTitle
                                  ) AS sameTb ON tb.BigCategoryTitle = sameTb.BigCategoryTitle
    
            END
        ELSE
            BEGIN
                SELECT  tb.* ,
                        ISNULL(sameTb.SameSaleTotal, 0) SameSaleTotal ,
                        ISNULL(sameTb.SameJML, 0) + '' SameJML ,
                        ISNULL(sameTb.SameJMLL, 0.0) + '%' SameJMLL ,
                        ISNULL(sameTb.RAWSameJMLL, 0) RAWSameJMLL ,
                        CASE WHEN ( SameSaleTotal = 0
                                    OR SameSaleTotal IS NULL
                                  ) THEN '-'
                             ELSE CAST(( ( ( SaleTotal - SameSaleTotal )
                                           / SameSaleTotal ) * 100 ) AS VARCHAR(20))
                                  + '%'
                        END SaleYOY ,
                        CASE WHEN ( SameJML = 0
                                    OR SameJML IS NULL
                                  ) THEN '-'
                             ELSE CAST(( ( ( JML - SameJML ) / SameJML ) * 100 ) AS VARCHAR(20))
                                  + '%'
                        END JMLYOY ,
                        CASE WHEN ( RAWSameJMLL = 0
                                    OR RAWSameJMLL IS NULL
                                  ) THEN '-'
                             ELSE CAST(CAST(( ( ( RAWJMLL - RAWSameJMLL )
                                                / RAWSameJMLL ) * 100 ) AS NUMERIC(5,
                                                              2)) AS VARCHAR(20))
                                  + '%'
                        END JMLLYOY
                FROM    ( SELECT    b.BigCategoryTitle ,
									(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber) ) SaleTotal ,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber)
                                      - SUM(a.BuyPrice * a.PurchaseNumber) ) JML ,
                                    CASE WHEN SUM(a.ActualPrice
                                                  * a.PurchaseNumber) = 0
                                         THEN '0.0'
                                         ELSE CAST(CAST(( ( SUM(a.ActualPrice
                                                              * a.PurchaseNumber)
                                                            - SUM(a.BuyPrice
                                                              * a.PurchaseNumber) )
                                                          / SUM(a.ActualPrice
                                                              * a.PurchaseNumber) )
                                              * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                                    END + '%' JMLL ,
                                    CASE WHEN SUM(a.ActualPrice
                                                  * a.PurchaseNumber) = 0
                                         THEN 0
                                         ELSE CAST(( ( SUM(a.ActualPrice
                                                           * a.PurchaseNumber)
                                                       - SUM(a.BuyPrice
                                                             * a.PurchaseNumber) )
                                                     / SUM(a.ActualPrice
                                                           * a.PurchaseNumber) )
                                              * 100 AS NUMERIC(5, 1))
                                    END RAWJMLL
                          FROM      dbo.SaleDetail a
                                    LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                          WHERE     EXISTS ( SELECT 1
                                             FROM   dbo.SaleOrders
                                             WHERE  PaySN = a.PaySN
                                                    AND CreateDT BETWEEN @startDate AND @endDate )
                          GROUP BY  b.BigCategoryTitle,b.MidCategoryTitle
                        ) AS tb
                        LEFT JOIN ( SELECT  b.BigCategoryTitle ,
											(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                            ( SUM(a.ActualPrice
                                                  * a.PurchaseNumber) ) SameSaleTotal ,
                                            ( SUM(a.ActualPrice
                                                  * a.PurchaseNumber)
                                              - SUM(a.BuyPrice
                                                    * a.PurchaseNumber) ) SameJML ,
                                            CASE WHEN SUM(a.ActualPrice
                                                          * a.PurchaseNumber) = 0
                                                 THEN '0'
                                                 ELSE CAST(CAST(( ( SUM(a.ActualPrice
                                                              * a.PurchaseNumber)
                                                              - SUM(a.BuyPrice
                                                              * a.PurchaseNumber) )
                                                              / SUM(a.ActualPrice
                                                              * a.PurchaseNumber) )
                                                      * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                                            END + '' SameJMLL ,
                                            CASE WHEN SUM(a.ActualPrice
                                                          * a.PurchaseNumber) = 0
                                                 THEN '0'
                                                 ELSE CAST(( ( SUM(a.ActualPrice
                                                              * a.PurchaseNumber)
                                                              - SUM(a.BuyPrice
                                                              * a.PurchaseNumber) )
                                                             / SUM(a.ActualPrice
                                                              * a.PurchaseNumber) )
                                                      * 100 AS NUMERIC(5, 1))
                                            END RAWSameJMLL
                                    FROM    dbo.SaleDetail a
                                            LEFT JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                                    WHERE   EXISTS ( SELECT 1
                                                     FROM   dbo.SaleOrders
                                                     WHERE  PaySN = a.PaySN
                                                            AND CreateDT BETWEEN @SameStartDate AND @SameEndDate )
                                    GROUP BY b.BigCategoryTitle,b.MidCategoryTitle
                                  ) AS sameTb ON tb.BigCategoryTitle = sameTb.BigCategoryTitle
            END
    

    
   
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_IndexSalesData]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		hs
-- Create date: 2015-11-12
-- Description:	<首页销售数据>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_IndexSalesData]
    @startDate VARCHAR(10) ,
    @endDate VARCHAR(10) ,
    @type CHAR(1) = '1' ,--类别1：销售量，类型2：热销商品
	@companyId INT,
    @storeId VARCHAR(20) = ''
AS
    BEGIN
        SET NOCOUNT ON;
    
        IF ( @type = '1' )
            BEGIN
                SELECT  ISNULL(SUM(s.Quantity), 0) AS TotalQuantity
                FROM    dbo.SaleOrders AS so
                        INNER JOIN ( SELECT PaySN ,
                                            SUM(CASE WHEN vp.ValuationType = 1
                                                     THEN sd.PurchaseNumber
                                                     ELSE 1
                                                END) AS Quantity
                                     FROM   dbo.SaleDetail AS sd
                                            LEFT JOIN dbo.Vw_Product vp ON vp.Barcode = sd.Barcode
                                     GROUP BY PaySN
                                   ) AS s ON s.PaySN = so.PaySN
                WHERE   ( CONVERT(varchar(10),so.CreateDT,120)
								BETWEEN CONVERT(varchar(10),@startDate,120)
								AND CONVERT(varchar(10),@endDate,120) )
                        AND ( ISNULL(@storeId, '') = ''
                              OR @storeId = '-1'
                              OR so.StoreId = @storeId
                            )	
                            AND so.IsTest=0		
                            AND so.State=0 AND so.Type=0
							AND so.CompanyId=@companyId
            END
		
        IF ( @type = '2' )
            BEGIN
                SELECT  vp.Title ,
                        SUM(sd.PurchaseNumber) AS Quantity
                FROM    dbo.SaleDetail AS sd
                        LEFT JOIN dbo.Vw_Product vp ON vp.Barcode = sd.Barcode
                WHERE   vp.ValuationType = 1
                        AND EXISTS ( SELECT 1
                                     FROM   dbo.SaleOrders AS so
                                     WHERE  PaySN = sd.PaySN
                                            AND (CONVERT(varchar(10),so.CreateDT,120)
													BETWEEN CONVERT(varchar(10),@startDate,120)
														AND CONVERT(varchar(10),@endDate,120))
                                            AND so.IsTest=0		
                                            AND so.State=0 AND so.Type=0
											AND so.CompanyId=@companyId
                                            AND ( ISNULL(@storeId, '') = ''
                                                  OR @storeId = '-1'
                                                  OR so.StoreId = @storeId
                                                ) )
                GROUP BY vp.Barcode ,
                        vp.Title
                ORDER BY SUM(sd.PurchaseNumber) DESC
            END            
            
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_StoreStockDetail]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2016-05-24
-- Description:	整店库存汇总
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_StoreStockDetail] 
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @categorySN VARCHAR(2000) = '' ,
    @supplierId VARCHAR(40)='',
    @title VARCHAR(100) = '' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    DECLARE @start DATE;
    DECLARE @end DATE;
    IF(@endDate='')
	BEGIN
		SET @endDate=CONVERT(VARCHAR(10),GETDATE(),120);
	end
	SET @title=RTRIM(LTRIM(@title));

	SELECT top 1 @endDate=cast(isnull(i.BalanceDate,@endDate) as varchar(10))
	FROM dbo.InventoryBalance as i
	WHERE (i.BalanceDate <= @endDate) AND (i.CompanyId=@companyId)
		 AND (@storeId='' or @storeId='0' or @storeId='-1'
			  or dbo.Comm_F_NumIsInGroup(i.StoreId,@storeId)=1)
	ORDER BY i.BalanceDate DESC;
				  
    IF(@startDate='')
    begin
		SET @startDate=@endDate;
	END
	SET @start=CAST(@startDate AS DATE);
	SET @end=CAST(@endDate AS DATE);
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END
      ;WITH KunCun as(
			SELECT i.CompanyId, i.StoreId, i.Barcode
					,isnull(SUM(i.Number),0) as StockNumber
					,cast(isnull(i.BalanceDate,@endDate) as varchar(10)) as BalanceDate
					,isnull(sum(i.SaleAveragePrice),0) as SaleAveragePrice
					,isnull(sum(i.SaleAmount),0) as SaleAmount
					,isnull(sum(i.StockAmount),0) as StockAmount
			FROM dbo.InventoryBalance as i
			WHERE (@startDate='' or CONVERT(VARCHAR(10),i.BalanceDate,120) BETWEEN @startDate AND @endDate)
				 AND (i.CompanyId=@companyId)
				 AND (@storeId='' or @storeId='0' or @storeId='-1'
					  or dbo.Comm_F_NumIsInGroup(i.StoreId,@storeId)=1)
			GROUP BY i.CompanyId,i.StoreId,i.Barcode,i.BalanceDate
			
		), RecordList as (
			SELECT ROW_NUMBER() OVER ( ORDER BY p.CategoryTitle,k.BalanceDate ) AS RSNO,k.*
					,p.Title
                    ,p.CategoryTitle
                    ,p.SupplierTitle
                    ,p.Size
                    ,p.SupplierId
                    ,p.CategorySN
                    ,p.ProductCode
                    ,p.SubUnit,
					dbo.F_StoreNameById(k.StoreId,@companyId) StoreTitle,
                    dbo.F_SysPriceByBarcode(@storeId,k.Barcode,@companyId) AS [当前零售价],
                    k.StockAmount as [成本金额含],
                    ROUND(k.StockAmount/(100+ISNULL(p.SaleRate,0))*100,2)  AS [成本金额未],
                    CASE k.StockNumber WHEN 0 THEN 0 else k.StockAmount/k.StockNumber end AS [平均成本价]
			FROM    KunCun AS k			
				left join dbo.Vw_Product as p on p.Barcode=k.Barcode AND p.CompanyId=k.companyid
			WHERE	p.CompanyId=@companyId
					AND ( @categorySn = ''
							OR EXISTS ( SELECT 1 FROM dbo.SplitString(@categorySn, ',', 1)
								WHERE Value = CAST(p.CategorySN AS VARCHAR(20)) ))
                    AND ( @supplierId = '' OR p.SupplierId = @supplierId )
                    AND ( @title = '' OR ( p.Barcode LIKE '%'+ @title + '%'
						OR p.ProductCode LIKE '%' + @title + '%' OR p.Title LIKE '%' + @title + '%'))
						
		),RecordPage AS (
			  SELECT   MAX(RSNO) AS [RecordTotal] ,
                        ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,2), MAX(RSNO)) / @PageSize)
                               THEN ( CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO)) / @PageSize) - 1 )
                                    * @PageSize + 1
                               ELSE @RecordStart
                          END ) AS [RecordStart] ,
                        ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,2), MAX(RSNO)) / @PageSize )
                               THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO)) / @PageSize) * @PageSize
                               ELSE @RecordEnd
                          END ) AS [RecordEnd]
               FROM     RecordList
        )
        SELECT  *,RL.SaleAmount AS [售价金额]
        FROM    RecordList AS RL ,
                RecordPage AS RP
		WHERE   ((RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd AND @ispage = 1)
				  OR @ispage = 0);
        
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ShoppingGuideSaleDetailDay]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<hs>
-- Create date: <2015-11-05>
-- Description:	<导购销售明细日报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_ShoppingGuideSaleDetailDay]
    @startDate VARCHAR(10),
    @endDate VARCHAR(10),
    @storeId VARCHAR(3)='',
    @memberKeyword VARCHAR(100)=''

AS
    BEGIN
        SET NOCOUNT ON;
        
  SELECT u.FullName AS SalesManName, (CASE WHEN isnull(so.CreateDT,'')='' THEN ''
					ELSE CONVERT(varchar(19),so.CreateDT,120) END) AS SaleDate, 
				s.*, CONVERT(VARCHAR, so.TotalAmount,18) AS SaleTotal,
				CONVERT(VARCHAR,so.PreferentialPrice,18) AS PreferentialPrice, so.ApiCode,
				STUFF((SELECT ',' + Title
						FROM dbo.ApiLibrary WHERE ApiCode IN (
						SELECT ApiCode FROM dbo.ConsumptionPayment WHERE PaySN = so.PaySN)
						FOR XML PATH('')),1,1,'') AS PayTitle
		FROM dbo.SaleOrders AS so
		INNER JOIN (
			SELECT PaySN, 
				SUM(CASE WHEN vp.ValuationType=1 THEN sd.PurchaseNumber ELSE 1 END) AS Quantity,
				SUM(CASE WHEN vp.ValuationType=2 THEN sd.PurchaseNumber ELSE 0 END) AS Weigh
			FROM dbo.SaleDetail AS sd 
			LEFT JOIN dbo.Vw_Product vp ON vp.Barcode = sd.Barcode
			GROUP BY PaySN
		) AS s ON s.PaySN = so.PaySN
		LEFT JOIN dbo.SysUserInfo u ON u.UID = so.Salesman
		WHERE (isnull(so.Salesman,'') <> '')
			AND (so.CreateDT BETWEEN @startDate AND @endDate)
			AND (ISNULL(@storeId,'')='' OR @storeId='-1' OR so.StoreId=@storeId)
			AND (ISNULL(@memberKeyword,'')='' OR u.UserCode=@memberKeyword OR u.FullName=@memberKeyword);
        
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_MembersSaleDetailDay]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<hs>
-- Create date: <2015-11-03>
-- Description:	<会员销售明细日报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_MembersSaleDetailDay]
    @startDate VARCHAR(10) ,
    @endDate VARCHAR(10) ,
    @storeId VARCHAR(100) = '' ,
    @memberKeyword VARCHAR(100) = '' ,
    @CurrentPage INT=1,			--当前页
    @PageSize INT=20,				--页大小
    @ispage SMALLINT=1    --是否分页
AS
    BEGIN
        SET NOCOUNT ON;
        DECLARE @RecordStart INT;
        DECLARE @RecordEnd INT;
		
        IF ( @CurrentPage <= 1 )
            BEGIN
                SET @RecordStart = 1;
                SET @RecordEnd = @PageSize;
            END
        ELSE
            BEGIN
                SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
                SET @RecordEnd = @CurrentPage * @PageSize;
            END
		
       ; WITH    RecordList
                  AS ( SELECT   ( CASE WHEN ISNULL(so.CreateDT, '') = ''
                                       THEN ''
                                       ELSE CONVERT(VARCHAR(19), so.CreateDT, 120)
                                  END ) AS SaleDate ,
                                m.MobilePhone ,
                                m.Weixin ,
                                s.* ,
                                SaleTotal=so.TotalAmount,
                                so.PreferentialPrice,
                                so.ApiCode ,
                                STUFF(( SELECT  ',' + Title
                                        FROM    dbo.ApiLibrary
                                        WHERE   ApiCode IN (
                                                SELECT  ApiCode
                                                FROM    dbo.ConsumptionPayment
                                                WHERE   PaySN = so.PaySN )
                                      FOR
                                        XML PATH('')
                                      ), 1, 1, '') AS PayTitle ,
                                ( ROW_NUMBER() OVER ( ORDER BY so.CreateDT DESC ) ) AS RSNO
                       FROM     dbo.SaleOrders AS so
                                INNER JOIN ( SELECT PaySN ,
                                                    SUM(CASE WHEN vp.ValuationType = 1
                                                             THEN sd.PurchaseNumber
                                                             ELSE 1
                                                        END) AS Quantity ,
                                                    SUM(CASE WHEN vp.ValuationType = 2
                                                             THEN sd.PurchaseNumber
                                                             ELSE 0
                                                        END) AS Weigh
                                             FROM   dbo.SaleDetail AS sd
                                                    LEFT JOIN dbo.Vw_Product vp ON vp.Barcode = sd.Barcode
                                             GROUP BY PaySN
                                           ) AS s ON s.PaySN = so.PaySN
                                LEFT JOIN dbo.Members m ON m.MemberId = so.MemberId
                       WHERE    ( ISNULL(so.MemberId, '') <> '' )
                                AND ( so.CreateDT BETWEEN @startDate AND @endDate )
                                AND ( ISNULL(@storeId, '') = ''
                                      OR @storeId = '-1'
                                      OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=so.StoreId)
                                    )
                                AND ( ISNULL(@memberKeyword, '') = ''
                                      OR m.MobilePhone = @memberKeyword
                                      OR m.Weixin = @memberKeyword
                                    )
                     ),
                RecordPage
                  AS ( SELECT   MAX(RSNO) AS [RecordTotal] ,
                                ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                              / @PageSize)
                                       THEN ( CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                                      / @PageSize) - 1 )
                                            * @PageSize + 1
                                       ELSE @RecordStart
                                  END ) AS [RecordStart] ,
                                ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                             / @PageSize )
                                       THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                                    / @PageSize) * @PageSize
                                       ELSE @RecordEnd
                                  END ) AS [RecordEnd]
                       FROM     RecordList
                     )
            SELECT  *
            FROM    RecordList AS RL ,
                    RecordPage AS RP
            WHERE   ( (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd AND @ispage=1) OR @ispage=0 )
            
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ProductSaleSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<hs>
-- Create date: <2015-09-28>
-- Description:	<同比明细月报>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_ProductSaleSummary]
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @SameStartDate VARCHAR(20) ,
    @SameEndDate VARCHAR(20) ,
    @ChainStartDate VARCHAR(20) ,
    @ChainEndDate VARCHAR(20) ,
    @storeId VARCHAR(100) = ''
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        IF ( LEN(@storeId) > 0
             AND @storeId IS NOT NULL
           )
            BEGIN
					--#ts1===============
 
                SELECT  tb.* ,
                        ( tb.SaleTotal - tb.BuyPrice ) JML ,
                        CASE WHEN tb.SaleTotal = 0 THEN '0.0%'
                             ELSE CAST(CAST(( tb.SaleTotal - tb.BuyPrice )
                                  / tb.SaleTotal * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                        END + '%' JMLL
                INTO    #ts1
                FROM    ( SELECT    b.BigCategoryTitle ,
									(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SupplierTitle ,
                                    c.StoreId ,
                                    b.SubUnit ,
                                    b.BrandTitle ,
                                    b.SysPrice ,
                                    SUM(a.ActualPrice) ExchangePrice ,
                                    SUM(a.PurchaseNumber) PurchaseNumber ,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber) ) SaleTotal ,
                                    ( SUM(a.BuyPrice * a.PurchaseNumber) ) BuyPrice
                          FROM      dbo.SaleDetail a
                                    INNER JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                                    INNER JOIN dbo.SaleOrders c ON a.PaySN = c.PaySN
                          WHERE     c.CreateDT BETWEEN @startDate AND @endDate
                                    AND b.BigCategoryTitle IS NOT NULL
                                    AND c.StoreId = @storeId
                          GROUP BY  b.BigCategoryTitle ,
									b.MidCategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SubUnit ,
                                    b.SupplierTitle ,
                                    c.StoreId ,
                                    b.BrandTitle ,
                                    b.SysPrice
                        ) AS tb
				--#ts2===============
			 
                SELECT  tb.* ,
                        ( tb.SameSaleTotal - tb.SameBuyPrice ) SameJML ,
                        CASE WHEN tb.SameSaleTotal = 0 THEN '0.0'
                             ELSE CAST(CAST(( tb.SameSaleTotal
                                              - tb.SameBuyPrice )
                                  / tb.SameSaleTotal * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                        END SameJMLL
                INTO    #ts2
                FROM    ( SELECT    b.BigCategoryTitle ,
									(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SupplierTitle ,
                                    c.StoreId ,
                                    b.SubUnit ,
                                    SUM(a.ActualPrice) SameExchangePrice ,
                                    SUM(a.PurchaseNumber) SamePurchaseNumber ,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber) ) SameSaleTotal ,
                                    ( SUM(a.BuyPrice * a.PurchaseNumber) ) SameBuyPrice
                          FROM      dbo.SaleDetail a
                                    INNER JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                                    INNER JOIN dbo.SaleOrders c ON a.PaySN = c.PaySN
                          WHERE     c.CreateDT BETWEEN @SameStartDate
                                               AND     @SameStartDate
                                    AND b.BigCategoryTitle IS NOT NULL
                                    AND EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=c.StoreId)
                          GROUP BY  b.BigCategoryTitle ,
									b.MidCategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SubUnit ,
                                    b.SupplierTitle ,
                                    c.StoreId
                        ) AS tb

				--#ts3===============
                SELECT  tb.* ,
                        ( tb.ChainSaleTotal - tb.ChainBuyPrice ) ChainJML ,
                        CASE WHEN tb.ChainSaleTotal = 0 THEN '0.0'
                             ELSE CAST(CAST(( tb.ChainSaleTotal
                                              - tb.ChainBuyPrice )
                                  / tb.ChainSaleTotal * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                        END ChainJMLL
                INTO    #ts3
                FROM    ( SELECT    b.BigCategoryTitle ,
									(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SupplierTitle ,
                                    c.StoreId ,
                                    b.SubUnit ,
                                    SUM(a.ActualPrice) ChainExchangePrice ,
                                    SUM(a.PurchaseNumber) ChainPurchaseNumber ,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber) ) ChainSaleTotal ,
                                    ( SUM(a.BuyPrice * a.PurchaseNumber) ) ChainBuyPrice
                          FROM      dbo.SaleDetail a
                                    INNER JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                                    INNER JOIN dbo.SaleOrders c ON a.PaySN = c.PaySN
                          WHERE     c.CreateDT BETWEEN @ChainStartDate
                                               AND     @ChainEndDate
                                    AND b.BigCategoryTitle IS NOT NULL
                                    AND c.StoreId = @storeId
                          GROUP BY  b.BigCategoryTitle ,
									b.MidCategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SubUnit ,
                                    b.SupplierTitle ,
                                    c.StoreId
                        ) AS tb

                SELECT  t.* ,
                        wh.Title AS StoreTitle ,
                        ISNULL(sameT.SameJML, 0) SameJML ,
                        ISNULL(sameT.SameJMLL, 0.0) + '%' SameJMLL ,
                        ISNULL(sameT.SameExchangePrice, 0) SameExchangePrice ,
                        ISNULL(sameT.SamePurchaseNumber, 0) SamePurchaseNumber ,
                        ISNULL(sameT.SameSaleTotal, 0) SameSaleTotal ,
                        ISNULL(sameT.SameBuyPrice, 0) SameBuyPrice ,
                        ISNULL(ChainT.ChainJML, 0) ChainJML ,
                        ISNULL(ChainT.ChainJMLL, 0.0) + '%' ChainJMLL ,
                        ISNULL(ChainT.ChainExchangePrice, 0) ChainExchangePrice ,
                        ISNULL(ChainT.ChainPurchaseNumber, 0) ChainPurchaseNumber ,
                        ISNULL(ChainT.ChainSaleTotal, 0) ChainSaleTotal ,
                        ISNULL(ChainT.ChainBuyPrice, 0) ChainBuyPrice
                FROM    #ts1 AS t
                        LEFT JOIN #ts2 AS sameT ON t.Barcode = sameT.Barcode
                        LEFT JOIN #ts3 AS ChainT ON t.Barcode = ChainT.Barcode
                        INNER JOIN dbo.Warehouse AS wh ON t.StoreId = wh.StoreId


                DROP TABLE #ts1
                DROP TABLE #ts2
                DROP TABLE #ts3
            END

        ELSE
            BEGIN
					--#t1===============
 
                SELECT  tb.* ,
                        ( tb.SaleTotal - tb.BuyPrice ) JML ,
                        CASE WHEN tb.SaleTotal = 0 THEN '0.0%'
                             ELSE CAST(CAST(( tb.SaleTotal - tb.BuyPrice )
                                  / tb.SaleTotal * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                        END + '%' JMLL
                INTO    #t1
                FROM    ( SELECT    b.BigCategoryTitle ,
									(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SupplierTitle ,
                                    c.StoreId ,
                                    b.SubUnit ,
                                    b.BrandTitle ,
                                    b.SysPrice ,
                                    SUM(a.ActualPrice) ExchangePrice ,
                                    SUM(a.PurchaseNumber) PurchaseNumber ,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber) ) SaleTotal ,
                                    ( SUM(a.BuyPrice * a.PurchaseNumber) ) BuyPrice
                          FROM      dbo.SaleDetail a
                                    INNER JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                                    INNER JOIN dbo.SaleOrders c ON a.PaySN = c.PaySN
                          WHERE     c.CreateDT BETWEEN @startDate AND @endDate
                                    AND b.BigCategoryTitle IS NOT NULL
                          GROUP BY  b.BigCategoryTitle ,
									b.MidCategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SubUnit ,
                                    b.SupplierTitle ,
                                    c.StoreId ,
                                    b.BrandTitle ,
                                    b.SysPrice
                        ) AS tb
				--#t2===============
			 
                SELECT  tb.* ,
                        ( tb.SameSaleTotal - tb.SameBuyPrice ) SameJML ,
                        CASE WHEN tb.SameSaleTotal = 0 THEN '0.0'
                             ELSE CAST(CAST(( tb.SameSaleTotal
                                              - tb.SameBuyPrice )
                                  / tb.SameSaleTotal * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                        END SameJMLL
                INTO    #t2
                FROM    ( SELECT    b.BigCategoryTitle ,
									(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SupplierTitle ,
                                    c.StoreId ,
                                    b.SubUnit ,
                                    SUM(a.ActualPrice) SameExchangePrice ,
                                    SUM(a.PurchaseNumber) SamePurchaseNumber ,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber) ) SameSaleTotal ,
                                    ( SUM(a.BuyPrice * a.PurchaseNumber) ) SameBuyPrice
                          FROM      dbo.SaleDetail a
                                    INNER JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                                    INNER JOIN dbo.SaleOrders c ON a.PaySN = c.PaySN
                          WHERE     c.CreateDT BETWEEN @SameStartDate
                                               AND     @SameStartDate
                                    AND b.BigCategoryTitle IS NOT NULL
                          GROUP BY  b.BigCategoryTitle ,
									b.MidCategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SubUnit ,
                                    b.SupplierTitle ,
                                    c.StoreId
                        ) AS tb

				--#t3===============
                SELECT  tb.* ,
                        ( tb.ChainSaleTotal - tb.ChainBuyPrice ) ChainJML ,
                        CASE WHEN tb.ChainSaleTotal = 0 THEN '0.0'
                             ELSE CAST(CAST(( tb.ChainSaleTotal
                                              - tb.ChainBuyPrice )
                                  / tb.ChainSaleTotal * 100 AS NUMERIC(5, 1)) AS VARCHAR(20))
                        END ChainJMLL
                INTO    #t3
                FROM    ( SELECT    b.BigCategoryTitle ,
									(b.BigCategoryTitle+'/'+b.MidCategoryTitle) CategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SupplierTitle ,
                                    c.StoreId ,
                                    b.SubUnit ,
                                    SUM(a.ActualPrice) ChainExchangePrice ,
                                    SUM(a.PurchaseNumber) ChainPurchaseNumber ,
                                    ( SUM(a.ActualPrice * a.PurchaseNumber) ) ChainSaleTotal ,
                                    ( SUM(a.BuyPrice * a.PurchaseNumber) ) ChainBuyPrice
                          FROM      dbo.SaleDetail a
                                    INNER JOIN dbo.Vw_Product b ON b.Barcode = a.Barcode
                                    INNER JOIN dbo.SaleOrders c ON a.PaySN = c.PaySN
                          WHERE     c.CreateDT BETWEEN @ChainStartDate
                                               AND     @ChainEndDate
                                    AND b.BigCategoryTitle IS NOT NULL
                          GROUP BY  b.BigCategoryTitle ,
									b.MidCategoryTitle,
                                    b.Barcode ,
                                    b.Title ,
                                    b.SubUnit ,
                                    b.SupplierTitle ,
                                    c.StoreId
                        ) AS tb

                SELECT  t.* ,
                        wh.Title AS StoreTitle ,
                        ISNULL(sameT.SameJML, 0) SameJML ,
                        ISNULL(sameT.SameJMLL, 0.0) + '%' SameJMLL ,
                        ISNULL(sameT.SameExchangePrice, 0) SameExchangePrice ,
                        ISNULL(sameT.SamePurchaseNumber, 0) SamePurchaseNumber ,
                        ISNULL(sameT.SameSaleTotal, 0) SameSaleTotal ,
                        ISNULL(sameT.SameBuyPrice, 0) SameBuyPrice ,
                        ISNULL(ChainT.ChainJML, 0) ChainJML ,
                        ISNULL(ChainT.ChainJMLL, 0.0) + '%' ChainJMLL ,
                        ISNULL(ChainT.ChainExchangePrice, 0) ChainExchangePrice ,
                        ISNULL(ChainT.ChainPurchaseNumber, 0) ChainPurchaseNumber ,
                        ISNULL(ChainT.ChainSaleTotal, 0) ChainSaleTotal ,
                        ISNULL(ChainT.ChainBuyPrice, 0) ChainBuyPrice
                FROM    #t1 AS t
                        LEFT JOIN #t2 AS sameT ON t.Barcode = sameT.Barcode
                        LEFT JOIN #t3 AS ChainT ON t.Barcode = ChainT.Barcode
                        INNER JOIN dbo.Warehouse AS wh ON t.StoreId = wh.StoreId


                DROP TABLE #t1
                DROP TABLE #t2
                DROP TABLE #t3
            END
    
   
    END
GO
/****** Object:  StoredProcedure [dbo].[StockQuery]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: 2015-12-29
-- Description:	 库存查询
-- =============================================
CREATE PROCEDURE [dbo].[StockQuery]
	@companyId INT,
    @startDate VARCHAR(20) = '' ,
    @endDate VARCHAR(20) = '' ,
    @storeId VARCHAR(100) = '' ,
    @supplierId VARCHAR(100) = '' ,
    @categorySn VARCHAR(2000) = '' ,
    @title VARCHAR(50) = '' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页	
AS
    BEGIN
        SET NOCOUNT ON;
        DECLARE @RecordStart INT;
        DECLARE @RecordEnd INT;
        DECLARE @start DATE;
        DECLARE @end DATE;
		IF(@endDate='')
		BEGIN
			SET @endDate=CONVERT(VARCHAR(10),GETDATE(),120);
		end
		SET @title=RTRIM(LTRIM(@title));
		--从库存结余表取最大的结余日期
		SELECT top 1 @endDate=cast(isnull(i.BalanceDate,@endDate) as varchar(10))
		FROM dbo.InventoryBalance as i
		WHERE (i.BalanceDate <= @endDate) AND (i.CompanyId=@companyId)
			 AND (@storeId='' or @storeId='0' or @storeId='-1'
				  or dbo.Comm_F_NumIsInGroup(i.StoreId,@storeId)=1)
		ORDER BY i.BalanceDate DESC;
				  
        IF(@startDate='')
        begin
			SET @startDate=@endDate;
		end
		
        IF ( @CurrentPage <= 1 )
            BEGIN
                SET @RecordStart = 1;
                SET @RecordEnd = @PageSize;
            END
        ELSE
            BEGIN
                SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
                SET @RecordEnd = @CurrentPage * @PageSize;
            END
		SET @start=CONVERT(DATE,@startDate,23);
        SET @end=CONVERT(DATE,@endDate,23);
		;WITH KunCun as(
			SELECT i.CompanyId, i.Barcode
					,isnull(SUM(i.Number),0) as StockNumber --库存量
					,cast(isnull(i.BalanceDate,@endDate) as varchar(10)) as BalanceDate --结余日期
					,isnull(sum(i.SaleAveragePrice),0) as SaleAveragePrice --平均售价
					,isnull(sum(i.SaleAmount),0) as SaleAmount --销售金额
					,isnull(sum(i.StockAmount),0) as StockAmount--库存金额
			FROM dbo.InventoryBalance as i
			WHERE (@startDate='' or i.BalanceDate BETWEEN @start AND @end)
				 AND (i.CompanyId=@companyId)
				 AND (@storeId='' or @storeId='0' or @storeId='-1'
					  or dbo.Comm_F_NumIsInGroup(i.StoreId,@storeId)=1)
			GROUP BY i.CompanyId, i.Barcode,i.BalanceDate
			
		), RecordList as (
			SELECT ROW_NUMBER() OVER ( ORDER BY k.BalanceDate ) AS RSNO,k.*
					,p.Title
                    ,p.CategoryTitle
                    ,p.Size
                    ,p.SupplierId
                    ,p.CategorySN
                    ,p.ProductCode
                    ,p.SubUnit
			FROM    KunCun AS k			
				INNER join dbo.Vw_Product_Bundling as p on p.Barcode=k.Barcode AND p.CompanyId = k.CompanyId
			WHERE	p.CompanyId=@companyId
					AND ( @categorySn = ''
							OR EXISTS ( SELECT 1 FROM dbo.SplitString(@categorySn, ',', 1)
								WHERE Value = CAST(p.CategorySN AS VARCHAR(20)) ))
                    AND ( @supplierId = '' OR p.SupplierId = @supplierId )
                    AND ( @title = '' OR ( p.Barcode LIKE '%'+ @title + '%'
						OR p.ProductCode LIKE '%' + @title + '%' OR p.Title LIKE '%' + @title + '%'))
						
		),
		RecordTot AS(
			SELECT * FROM RecordList AS r,(
				SELECT SUM(a.StockNumber) StockNumbers,
				SUM(a.SaleAmount) SaleAmounts,SUM(a.StockAmount) StockAmounts FROM RecordList a 
			) AS t
		)
		,RecordPage AS (
			  SELECT   MAX(RSNO) AS [RecordTotal] ,
                        ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,2), MAX(RSNO)) / @PageSize)
                               THEN ( CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO)) / @PageSize) - 1 )
                                    * @PageSize + 1
                               ELSE @RecordStart
                          END ) AS [RecordStart] ,
                        ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,2), MAX(RSNO)) / @PageSize )
                               THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO)) / @PageSize) * @PageSize
                               ELSE @RecordEnd
                          END ) AS [RecordEnd]
               FROM     RecordList
        )
        SELECT  *
        FROM    RecordTot AS RL ,
                RecordPage AS RP
		WHERE   ((RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd AND @ispage = 1)
				  OR @ispage = 0) ORDER BY RL.CategoryTitle;
        
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ProductSaleDetails]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2015-11-19>
-- Description:	<商品销售明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_ProductSaleDetails]
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = '' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
		SET @title=RTRIM(LTRIM(@title));
        DECLARE @RecordStart INT;
        DECLARE @RecordEnd INT;
        IF ( @CurrentPage <= 1 )
            BEGIN
                SET @RecordStart = 1;
                SET @RecordEnd = @PageSize;
            END
        ELSE
            BEGIN
                SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
                SET @RecordEnd = @CurrentPage * @PageSize;
            END
		
		SELECT  b.Barcode ,
                SUM(b.PurchaseNumber) returnNumber ,
                ROUND(SUM(b.PurchaseNumber * b.AveragePrice),2) returnTotal
        INTO    #t1
        FROM    dbo.SaleOrders a
                INNER JOIN dbo.SaleDetail b ON b.PaySN = a.PaySN
        WHERE   a.Type IN(3)
                AND a.CreateDT BETWEEN @startDate AND @endDate
                AND a.IsTest=0 AND a.CompanyId=@companyId
                AND (@storeId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@storeId,',', 1) WHERE Value = a.StoreId )) 
        GROUP BY b.Barcode;
		
		SELECT  b.Barcode ,
                SUM(b.PurchaseNumber) returnHuangNumber ,
                ROUND(SUM(b.PurchaseNumber* b.AveragePrice),2) returnHuangTotal
        INTO    #t4
        FROM    dbo.SaleOrders a
                INNER JOIN dbo.SaleDetail b ON b.PaySN = a.PaySN
        WHERE   a.Type IN(2,1) AND a.Receive<=0
                AND a.CreateDT BETWEEN @startDate AND @endDate
                AND a.IsTest=0 AND a.CompanyId=@companyId
                AND (@storeId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@storeId,',', 1) WHERE Value = a.StoreId )) 
        GROUP BY b.Barcode;

        SELECT  b.Barcode ,
                SUM(b.PurchaseNumber) giftNumber ,
                SUM(b.PurchaseNumber * b.SysPrice) giftTotal
        INTO    #t2
        FROM    dbo.SaleOrders a
                INNER JOIN dbo.SaleDetail b ON b.PaySN = a.PaySN
        WHERE   b.SalesClassifyId IN(49,161)
                AND a.CreateDT BETWEEN @startDate AND @endDate
                AND a.IsTest=0 AND a.CompanyId=@companyId
                AND (@storeId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@storeId,',', 1) WHERE Value = a.StoreId )) 
        GROUP BY b.Barcode;
        
        SELECT  b.Barcode ,
                SUM(b.PurchaseNumber) huanNumber ,
                ROUND(SUM(b.PurchaseNumber*b.AveragePrice),2) huanTotal
        INTO    #t3
        FROM    dbo.SaleOrders a
                INNER JOIN dbo.SaleDetail b ON b.PaySN = a.PaySN
        WHERE   a.Type=1 AND a.Receive>0
                AND a.CreateDT BETWEEN @startDate AND @endDate
                AND a.IsTest=0 AND a.CompanyId=@companyId
                AND (@storeId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@storeId,',', 1) WHERE Value = a.StoreId )) 
        GROUP BY b.Barcode;
            WITH    RecordList
                      AS ( SELECT   * ,
									( SaleTotal - BuyTotal ) MLE,
                                    CASE WHEN SaleTotal = 0
                                         THEN '0'
                                         ELSE CAST(CAST((SaleTotal - BuyTotal)/ SaleTotal * 100 AS MONEY) AS VARCHAR(20))
                                    END + '%' MLL ,
                                    ROW_NUMBER() OVER ( ORDER BY 
										CASE WHEN @sortField='SupplierTitle,asc' THEN SupplierTitle END ASC,
										CASE WHEN @sortField='SupplierTitle,desc' THEN SupplierTitle END desc,
										CASE WHEN @sortField='PurchaseNumber,asc' THEN PurchaseNumber END asc,
										CASE WHEN @sortField='PurchaseNumber,desc' THEN PurchaseNumber END desc,
										CASE WHEN @sortField='SaleTotal,asc' THEN SaleTotal END asc,
										CASE WHEN @sortField='SaleTotal,desc' THEN SaleTotal END desc
									) AS RSNO
                           FROM     ( SELECT    SupplierTitle,
												dbo.F_BrandNameForSN(BrandSN) BrandTitle,
                                                tb.Barcode ,
                                                tb.Title ,
                                                tb.SubUnit ,--tb.PurchaseNumber,SaleTotal,
                                                PurchaseNumber=tb.PurchaseNumber,--ISNULL(#t3.huanNumber ,0),--销售 - 换货 - 赠送
                                                SaleTotal=tb.SaleTotal,--ISNULL(#t3.huanTotal ,0),
                                                tb.BuyTotal,
                                                tb.SysTotal,
                                                CASE WHEN PurchaseNumber=0 THEN 0
												ELSE ABS(ROUND(SaleTotal/ PurchaseNumber, 2)) end ActualPrice ,
												CASE WHEN PurchaseNumber=0 THEN 0
												else ABS(ROUND(SysTotal/ PurchaseNumber, 2)) end SysPrice ,
                                                ISNULL(#t1.returnNumber ,0) ReturnNumber,
                                                ISNULL(#t1.returnTotal ,0) ReturnTotal,
												ISNULL(#t4.returnHuangNumber ,0) ReturnHuangNumber,
                                                ISNULL(#t4.returnHuangTotal ,0) ReturnHuangTotal,
                                                ISNULL(#t3.huanNumber,0) HuanNumber,
                                                ISNULL(#t3.huanTotal,0) HuanTotal,
												ISNULL(#t2.giftNumber ,0) GiftNumber,
                                                ISNULL(#t2.giftTotal,0) GiftTotal
                                      FROM      ( SELECT    Barcode ,
                                                            Title ,
                                                            SubUnit ,
															BrandSN,
															SupplierTitle,
                                                            SUM(PurchaseNumber*AveragePrice) SaleTotal ,
                                                            SUM(PurchaseNumber*BuyPrice) BuyTotal ,
                                                            ROUND(SUM(PurchaseNumber* SysPrice),2) SysTotal ,
                                                            SUM(PurchaseNumber) PurchaseNumber ,
                                                            ROUND(SUM(BuyPrice)/ COUNT(1), 2) BuyPrice
                                                  FROM      ( SELECT
                                                              b.Barcode ,
															  b.Barcodes,
															  b.ProductCode,
                                                              b.Title ,
                                                              b.SubUnit ,
                                                              a.PurchaseNumber,
                                                              a.ActualPrice ,
                                                              a.BuyPrice ,
                                                              a.SysPrice ,
                                                              a.AveragePrice,
                                                              a.PaySN ,
                                                              b.SupplierId ,
                                                              b.BrandSN ,
                                                              b.CategorySN,
															  b.SupplierTitle
                                                              FROM
                                                              dbo.SaleDetail a
                                                              INNER JOIN Vw_Product_Bundling b ON (a.Barcode = b.Barcode OR ','+b.Barcodes+',' LIKE '%,'+a.Barcode+',%') AND b.CompanyId = a.CompanyId
                                                            ) newtable
                                                  WHERE     1 = 1
															--AND newtable.ActualPrice>0
                                                            AND EXISTS ( SELECT 1 FROM dbo.SaleOrders WHERE
                                                              PaySN = newtable.PaySN AND IsTest=0  AND CompanyId=@companyId 
                                                              AND CreateDT BETWEEN @startDate AND @endDate
                                                              AND ( @storeId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@storeId,',', 1) WHERE Value = StoreId ) ) )
                                                            AND ( @supplierId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@supplierId,',', 1) WHERE Value = newtable.SupplierId ))
                                                            AND ( @brandSN = '' OR EXISTS ( SELECT  1 FROM dbo.SplitString(@brandSN,',', 1) WHERE Value = newtable.BrandSN ) )
                                                            AND ( @bigCategorySN = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@bigCategorySN, ',', 1) WHERE Value = newtable.CategorySN ))
                                                            AND (@title='' OR newtable.Title LIKE '%'+@title+'%' OR newtable.Barcode = ''+@title+''  OR newtable.ProductCode = ''+@title+'' OR newtable.Barcodes LIKE '%'+@title+'%')
                                                  GROUP BY  Barcode ,
                                                            Title ,
                                                            SubUnit,
															BrandSN,
															SupplierTitle
                                                ) tb
                                                LEFT JOIN #t1 ON #t1.Barcode = tb.Barcode
                                                LEFT JOIN #t2 ON #t2.Barcode = tb.Barcode
                                                LEFT JOIN #t3 ON #t3.Barcode = tb.Barcode
                                                LEFT JOIN #t4 ON #t4.Barcode = tb.Barcode
                                    ) t
                         ),
                    RecordTot AS(
						SELECT * FROM RecordList AS r,(
							SELECT SUM(a.PurchaseNumber) PurchaseNumbers,
							SUM(a.SaleTotal) SaleTotals,SUM(a.BuyTotal) BuyTotals,SUM(a.HuanNumber) HuanNumbers,SUM(a.HuanTotal) HuanTotals,
							SUM(a.ReturnNumber) ReturnNumbers,SUM(a.ReturnTotal) ReturnTotals,SUM(a.GiftNumber) GiftNumbers,SUM(a.GiftTotal) GiftTotals,
							SUM(a.MLE) MLES,SUM(a.ReturnHuangNumber) ReturnHuangNumbers,SUM(a.ReturnHuangTotal) ReturnHuangTotals
							 FROM RecordList a 
						) AS t
                     ),
                    RecordPage
                      AS ( SELECT   MAX(RSNO) AS [RecordTotal] ,
                                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                              / @PageSize)
                                           THEN ( CEILING(CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                          / @PageSize) - 1 )
                                                * @PageSize + 1
                                           ELSE @RecordStart
                                      END ) AS [RecordStart] ,
                                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                              / @PageSize )
                                           THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                                        / @PageSize)
                                                * @PageSize
                                           ELSE @RecordEnd
                                      END ) AS [RecordEnd]
                           FROM     RecordList
                         )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
                
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ProductSaleDetailDays]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-06-18>
-- Description:	<商品销售日明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_ProductSaleDetailDays]
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @RecordStart INT;
        DECLARE @RecordEnd INT;
        DECLARE @start DATE;
        DECLARE @end DATE;
        SET @start=CAST(@startDate AS DATE);
        SET @end=CAST(@endDate AS DATE);
		SET @title=RTRIM(LTRIM(@title));
        IF ( @CurrentPage <= 1 )
            BEGIN
                SET @RecordStart = 1;
                SET @RecordEnd = @PageSize;
            END
        ELSE
            BEGIN
                SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
                SET @RecordEnd = @CurrentPage * @PageSize;
            END
		
			;WITH details AS(
				SELECT
					  a.ProductCode,
					  a.Barcode ,
					  a.Title ,
					  b.SubUnit ,
					  a.PurchaseNumber ,
					  (CASE WHEN b.ValuationType=2 THEN 1 else a.PurchaseNumber END) PurchaseNumber2,
					  a.ActualPrice ,
					  a.BuyPrice ,
					  a.SysPrice ,
					  a.AveragePrice,
					  a.PaySN ,
					  a.Total,
					  a.SalesClassifyId,
					  b.SupplierId ,
					  b.BrandSN ,
					  b.CategorySN
					  FROM
					  dbo.SaleDetail a
					  INNER JOIN Vw_Product_Bundling b ON (a.Barcode = b.Barcode OR ','+b.Barcodes+',' LIKE '%,'+a.Barcode+',%') AND b.CompanyId = a.CompanyId
				)
			,recordls AS(
				SELECT d.*,s.CreateDT,s.StoreId,s.State,s.Type
				,CASE WHEN s.Type=3 THEN d.PurchaseNumber ELSE 0 END ReturnNumber,CASE WHEN s.Type=3 THEN d.PurchaseNumber*d.AveragePrice ELSE 0 END ReturnTotal
				,CASE WHEN s.Type=1 AND s.Receive>0 THEN d.PurchaseNumber ELSE 0 END HuanNumber,CASE WHEN s.Type=1 AND s.Receive>0 THEN d.PurchaseNumber*d.AveragePrice ELSE 0 END HuanTotal
				,CASE WHEN s.Type IN(1,2) AND s.Receive<=0 THEN d.PurchaseNumber ELSE 0 END TuiHuanNumber,CASE WHEN s.Type IN(1,2) AND s.Receive<=0 THEN d.PurchaseNumber*d.AveragePrice ELSE 0 END TuiHuanTotal
				,CASE WHEN d.SalesClassifyId IN(49,161) THEN d.PurchaseNumber ELSE 0 END GiftNumber,CASE WHEN d.SalesClassifyId IN(49,161)  THEN d.PurchaseNumber*d.SysPrice ELSE 0 END GiftTotal
				 FROM  details d
					INNER JOIN dbo.SaleOrders s ON s.PaySN = d.PaySN
				WHERE s.IsTest=0 AND s.CompanyId=@companyId and CreateDT BETWEEN @start AND @end
					AND ( @storeId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@storeId,',', 1) WHERE Value = s.StoreId ) ) 
					AND ( @supplierId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@supplierId,',', 1) WHERE Value = d.SupplierId ))
					AND ( @brandSN = '' OR EXISTS ( SELECT  1 FROM dbo.SplitString(@brandSN,',', 1) WHERE Value = d.BrandSN ) )
					AND ( @bigCategorySN = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@bigCategorySN, ',', 1) WHERE Value = d.CategorySN ))
					AND (@title='' OR d.Title LIKE '%'+@title+'%' OR d.Barcode=''+@title+'' OR d.ProductCode=''+@title+'')
			)
             ,RecordList
                      AS ( SELECT   * ,
									( SaleTotal - BuyTotal ) MLE,
                                    CASE WHEN SaleTotal = 0
                                         THEN '0'
                                         ELSE CAST(CAST((SaleTotal - BuyTotal)/ SaleTotal * 100 AS MONEY) AS VARCHAR(20))
                                    END + '%' MLL ,
                                    ROW_NUMBER() OVER ( ORDER BY Barcode,CreateDT ) AS RSNO
                           FROM     ( SELECT    CreateDT,
                                                dbo.F_SupplierNameById(SupplierId) SupplierTitle,
                                                dbo.F_BrandNameForSN(BrandSN) BrandTitle,
                                                tb.Barcode ,
                                                tb.ProductCode,
                                                tb.Title ,
                                                tb.SubUnit ,
                                                tb.PurchaseNumber,
                                                tb.SaleTotal,
                                                tb.BuyTotal,
                                                CASE WHEN PurchaseNumber=0 THEN 0 ELSE ABS(ROUND(SaleTotal/ PurchaseNumber, 2)) end ActualPrice ,
												CASE WHEN PurchaseNumber=0 THEN 0 ELSE ABS(ROUND(SysTotal/ PurchaseNumber, 2)) end SysPrice,
                                                tb.ReturnNumber,
												tb.HuanNumber,
												tb.TuiHuanNumber,
												tb.GiftNumber,
												tb.ReturnTotal,
												tb.HuanTotal,
												tb.TuiHuanTotal,
												tb.GiftTotal
                                      FROM      ( SELECT    CONVERT(VARCHAR(10),CreateDT,120) CreateDT,
															SupplierId,
															BrandSN,
															Barcode ,
															ProductCode,
                                                            Title ,
                                                            SubUnit,
                                                            SUM(PurchaseNumber*AveragePrice) SaleTotal ,
                                                            SUM(PurchaseNumber*BuyPrice) BuyTotal ,
                                                            SUM(PurchaseNumber* SysPrice) SysTotal ,
                                                            SUM(PurchaseNumber) PurchaseNumber,
															SUM(recordls.ReturnNumber) ReturnNumber,
															SUM(recordls.HuanNumber) HuanNumber,
															SUM(recordls.TuiHuanNumber) TuiHuanNumber,
															SUM(recordls.GiftNumber) GiftNumber,
															ROUND(SUM(recordls.ReturnTotal),2) ReturnTotal,
															ROUND(SUM(recordls.HuanTotal),2) HuanTotal,
															ROUND(SUM(recordls.TuiHuanTotal),2) TuiHuanTotal,
															ROUND(SUM(recordls.GiftTotal),2) GiftTotal
												  FROM    recordls
                                                  GROUP BY  CONVERT(VARCHAR(10),CreateDT,120),
															SupplierId,
															BrandSN,
															ProductCode,
															Barcode ,
                                                            Title ,
                                                            SubUnit
                                                ) tb
                                    ) t
                         ),
					RecordTot AS(
						SELECT * FROM RecordList AS r,(
							SELECT SUM(a.PurchaseNumber) PurchaseNumbers,
							SUM(a.SaleTotal) SaleTotals,SUM(a.BuyTotal) BuyTotals,SUM(a.HuanNumber) HuanNumbers,SUM(a.HuanTotal) HuanTotals,
							SUM(a.ReturnNumber) ReturnNumbers,SUM(a.ReturnTotal) ReturnTotals,SUM(a.GiftNumber) GiftNumbers,SUM(a.GiftTotal) GiftTotals,
							SUM(a.MLE) MLES,SUM(a.TuiHuanNumber) TuiHuanNumbers,SUM(a.TuiHuanTotal) TuiHuanTotals
							 FROM RecordList a 
						) AS t
                     ),
                    RecordPage
                      AS ( SELECT   MAX(RSNO) AS [RecordTotal] ,
                                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                              / @PageSize)
                                           THEN ( CEILING(CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                          / @PageSize) - 1 )
                                                * @PageSize + 1
                                           ELSE @RecordStart
                                      END ) AS [RecordStart] ,
                                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                              / @PageSize )
                                           THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                                        / @PageSize)
                                                * @PageSize
                                           ELSE @RecordEnd
                                      END ) AS [RecordEnd]
                           FROM     RecordList
                         )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
                
    END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_WholesalSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-10>
-- Description:	<批发汇总报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_WholesalSummary]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

	
	;WITH recordls AS(
		SELECT a.ApplyOrgId,b.Barcode,c.ProductCode,c.Title,c.SubUnit,a.StoreId,dbo.F_StoreNameById(a.StoreId,a.CompanyId) StoreTitle
		,b.OutboundNumber,b.BuyPrice,b.OutPrice,b.OutPrice/(100+ISNULL(c.StockRate,0))*100 AS [未税单价],c.SysPrice,CONVERT(VARCHAR(10),a.VerifyTime,120) VerifyTime 
		,dbo.F_UserNameById(a.OperatorUID) Operator
		FROM dbo.OutboundGoods a
		INNER JOIN dbo.OutboundList b ON b.OutboundId = a.OutboundId
		INNER JOIN dbo.Vw_Product_Bundling c ON c.Barcode = b.Barcode AND c.CompanyId = a.CompanyId
		WHERE a.CompanyId=@companyId AND a.Channel=1 AND a.State=1
		AND (@startDate='' OR (a.VerifyTime BETWEEN @start AND @end))
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=a.ApplyOrgId))
		AND (@title='' OR c.Title LIKE '%'+@title+'%' OR c.Barcode=''+@title+'' OR c.ProductCode=''+@title+'' OR c.Barcodes LIKE '%'+@title+'%')
	),RecordList AS(
		SELECT   * ,dbo.F_SupplierNameById(ApplyOrgId) ApplyOrg,
                ROW_NUMBER() OVER ( ORDER BY t.ApplyOrgId) AS RSNO
        FROM     ( SELECT   
							ApplyOrgId,
							SUM(recordls.OutboundNumber*SysPrice) SaleTotal ,
							SUM(recordls.OutboundNumber*OutPrice) [批发金额],
							SUM(recordls.OutboundNumber) OutboundNumber,
							SUM(recordls.[未税单价]*recordls.OutboundNumber) [未税金额]
					FROM    recordls
					GROUP BY  
							ApplyOrgId
                           
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.OutboundNumber) OutboundNumbers,
			SUM(a.SaleTotal) SaleTotals,SUM(a.[批发金额]) [批发金额s],SUM(a.[未税金额]) [未税金额s] FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_WholesalDetail]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-10>
-- Description:	<批发明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_WholesalDetail]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

	
	;WITH recordls AS(
		SELECT a.ApplyOrgId,b.Barcode,c.ProductCode,c.Title,c.SubUnit,a.StoreId,dbo.F_StoreNameById(a.StoreId,a.CompanyId) StoreTitle
		,b.OutboundNumber,b.BuyPrice,b.OutPrice,b.OutPrice/(100+ISNULL(c.StockRate,0))*100 AS [未税单价],c.SysPrice,CONVERT(VARCHAR(10),a.VerifyTime,120) VerifyTime 
		,dbo.F_UserNameById(a.OperatorUID) Operator
		FROM dbo.OutboundGoods a
		INNER JOIN dbo.OutboundList b ON b.OutboundId = a.OutboundId
		INNER JOIN dbo.Vw_Product_Bundling c ON c.Barcode = b.Barcode AND c.CompanyId = a.CompanyId
		WHERE a.CompanyId=@companyId AND a.Channel=1 AND a.State=1
		AND (@startDate='' OR (a.VerifyTime BETWEEN @start AND @end))
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=a.ApplyOrgId))
		AND (@title='' OR c.Title LIKE '%'+@title+'%' OR c.Barcode=''+@title+'' OR c.ProductCode=''+@title+'' OR c.Barcodes LIKE '%'+@title+'%')
	),RecordList AS(
		SELECT   * ,dbo.F_SupplierNameById(ApplyOrgId) ApplyOrg,
                ROW_NUMBER() OVER ( ORDER BY t.ApplyOrgId) AS RSNO
        FROM     ( SELECT   
							ApplyOrgId,
							recordls.Operator,
							recordls.VerifyTime,
							recordls.Barcode,
							recordls.Title,
							recordls.SubUnit,
							SUM(recordls.OutboundNumber*SysPrice) SaleTotal ,
							SUM(recordls.OutboundNumber*OutPrice) [批发金额],
							SUM(recordls.OutboundNumber) OutboundNumber,
							SUM(recordls.[未税单价]*recordls.OutboundNumber) [未税金额]
					FROM    recordls
					GROUP BY  
							ApplyOrgId,
							recordls.VerifyTime,
							recordls.Operator,
							recordls.Barcode,
							recordls.Title,
							recordls.SubUnit
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.OutboundNumber) OutboundNumbers,
			SUM(a.SaleTotal) SaleTotals,SUM(a.[批发金额]) [批发金额s],SUM(a.[未税金额]) [未税金额s] FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ProductOrderSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-08-09>
-- Description:	<商品采购汇总报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_ProductOrderSummary]
	-- Add the parameters for the stored procedure here
	@companyId INT,
	@startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
	@title VARCHAR(100) = '' ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END
    
    ;WITH Recordls AS(
		SELECT t.CompanyId, t.ProductCode,t.Barcode,t.Title,t.SupplierID,t.SubUnit,t.InboundGoodsId,t.OperatDT,t.IndentNoGiftNum,t.Price*t.IndentNoGiftNum 采购金额,t.IndentNoGiftNum*t.SysPrice 零售金额,
		CASE WHEN t.Nature=1 THEN t.IndentNum ELSE 0 end 赠品数量,
		dbo.F_StoreNameById(t.StoreId,t.CompanyId) StoreTitle,t.StoreId,t.StockRate FROM Vw_OrderList t 
		WHERE  t.CompanyId=@companyId and t.State=5
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=t.StoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(t.CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(t.BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=t.SupplierID))
		AND (@startDate='' OR (t.OperatDT BETWEEN @startDate AND @endDate))
		AND (@title='' OR Title LIKE '%'+@title+'%' OR Barcode=''+@title+'' OR ProductCode=''+@title+'')
	),RecordList AS(
		SELECT t.ProductCode,t.Barcode,t.Title,t.SupplierID,t.SubUnit,t.InboundGoodsId,t.OperatDT,SUM(t.IndentNoGiftNum) 数量,ROUND(SUM(采购金额),2) 采购金额,ROUND(SUM(t.零售金额),2) 零售金额,
		ISNULL(SUM(赠品数量),0) 赠品数量,StoreTitle,t.StoreId,t.StockRate,ROW_NUMBER() OVER ( ORDER BY t.InboundGoodsId,t.SupplierID,t.OperatDT ) AS RSNO FROM Recordls t 
		GROUP BY t.CompanyId,t.ProductCode,t.Barcode,t.Title,t.SupplierID,t.SubUnit,t.StoreId,StoreTitle,t.StockRate,t.InboundGoodsId,t.OperatDT
    ),
	RecordTot AS(
		SELECT * FROM RecordList l,(
			SELECT SUM(r.数量) as [数量s],SUM(r.赠品数量) AS [赠品数量s],SUM(r.采购金额) AS [采购金额s],SUM(r.零售金额) AS [零售金额s],SUM(ROUND(采购金额/(100+ISNULL(StockRate,0))*100,2)) AS[未税金额s] FROM RecordList r
		) t
	),
	RecordPage AS ( SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                              2), MAX(RSNO))
                                              / @PageSize)
                           THEN ( CEILING(CONVERT(DECIMAL(18,
                                              2), MAX(RSNO))
                                          / @PageSize) - 1 )
                                * @PageSize + 1
                           ELSE @RecordStart
                      END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                              2), MAX(RSNO))
                                              / @PageSize )
                           THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                           ELSE @RecordEnd
                      END ) AS [RecordEnd]
           FROM     RecordTot)
        SELECT  *,CASE WHEN 数量=0 THEN 0 ELSE ROUND(采购金额/数量,2) END 单价, ROUND(采购金额/(100+ISNULL(StockRate,0))*100,2) 未税金额,CASE WHEN 数量=0 THEN 0 else ROUND(采购金额/数量/CAST((100+ISNULL(StockRate,0)) AS NUMERIC)*100,2) end 未税单价,
        dbo.F_SupplierNameById(RL.SupplierID) SupplierTitle--dbo.F_GetStockRecord(@endDate,@storeId,RL.Barcode) 库存量
			FROM   RecordTot AS RL , RecordPage AS RP
				WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
							AND @ispage = 1) OR @ispage = 0 )
    
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ProductOrderDetaillist]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-01-19>
-- Description:	<商品采购明细清单>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_ProductOrderDetaillist]
	-- Add the parameters for the stored procedure here
	@companyId INT,
	@startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @barcode VARCHAR(20) = '' 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT *,ROUND(Price*IndentNum,2) OrderTotal,dbo.F_GetStockRecord(@endDate,@storeId,@barcode,v.CompanyId) StockNum,CASE WHEN v.Nature=0 THEN '正常' ELSE '赠品' END Flag from Vw_OrderList v 
	WHERE 1=1
	--Nature=0
	AND (@startDate='' OR v.createdt BETWEEN @startDate AND @endDate)
    AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=storeid))
    AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(categorysn AS VARCHAR(20))))
    AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(brandsn AS VARCHAR(20))))
    AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=supplierid))
    AND CompanyId=@companyId AND barcode=@barcode
    ORDER BY v.IndentOrderId
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_ProductOrderDetail]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-01-15>
-- Description:	<商品采购明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_ProductOrderDetail]
	-- Add the parameters for the stored procedure here
	@companyId INT,
	@startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
	@title VARCHAR(100) = '' ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END
    
    ;WITH Recordls AS(
		SELECT t.CompanyId, t.ProductCode,t.Barcode,t.Title,t.SupplierID,t.SubUnit,t.InboundGoodsId,t.OperatDT,t.IndentNoGiftNum,t.Price*t.IndentNoGiftNum 采购金额,t.IndentNoGiftNum*t.SysPrice 零售金额,
		CASE WHEN t.Nature=1 THEN t.IndentNum ELSE 0 end 赠品数量,
		dbo.F_StoreNameById(t.StoreId,t.CompanyId) StoreTitle,t.StoreId,t.StockRate FROM Vw_OrderList t 
		WHERE  t.CompanyId=@companyId and t.State=5
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=t.StoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(t.CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(t.BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=t.SupplierID))
		AND (@startDate='' OR (t.OperatDT BETWEEN @startDate AND @endDate))
		AND (@title='' OR Title LIKE '%'+@title+'%' OR Barcode=''+@title+'' OR ProductCode=''+@title+'')

	),RecordList AS(
		SELECT t.ProductCode,t.Barcode,t.Title,t.SupplierID,t.SubUnit,t.InboundGoodsId,t.OperatDT,SUM(t.IndentNoGiftNum) 数量,ROUND(SUM(采购金额),2) 采购金额,ROUND(SUM(t.零售金额),2) 零售金额,
		ISNULL(SUM(赠品数量),0) 赠品数量,StoreTitle,t.StoreId,t.StockRate,ROW_NUMBER() OVER ( ORDER BY t.InboundGoodsId,t.SupplierID,t.OperatDT ) AS RSNO FROM Recordls t 
		GROUP BY t.CompanyId,t.ProductCode,t.Barcode,t.Title,t.SupplierID,t.SubUnit,t.StoreId,StoreTitle,t.StockRate,t.InboundGoodsId,t.OperatDT
    ),
	RecordTot AS(
		SELECT * FROM RecordList l,(
			SELECT SUM(r.数量) as [数量s],SUM(r.赠品数量) AS [赠品数量s],SUM(r.采购金额) AS [采购金额s],SUM(r.零售金额) AS [零售金额s],SUM(ROUND(采购金额/(100+ISNULL(StockRate,0))*100,2)) AS[未税金额s] FROM RecordList r
		) t
	),
	RecordPage AS ( SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                              2), MAX(RSNO))
                                              / @PageSize)
                           THEN ( CEILING(CONVERT(DECIMAL(18,
                                              2), MAX(RSNO))
                                          / @PageSize) - 1 )
                                * @PageSize + 1
                           ELSE @RecordStart
                      END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                              2), MAX(RSNO))
                                              / @PageSize )
                           THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                           ELSE @RecordEnd
                      END ) AS [RecordEnd]
           FROM     RecordTot)
        SELECT  *,CASE WHEN 数量=0 THEN 0 ELSE ROUND(采购金额/数量,2) END 单价, ROUND(采购金额/(100+ISNULL(StockRate,0))*100,2) 未税金额,CASE WHEN 数量=0 THEN 0 else ROUND(采购金额/数量/CAST((100+ISNULL(StockRate,0)) AS NUMERIC)*100,2) end 未税单价,
        dbo.F_SupplierNameById(RL.SupplierID) SupplierTitle--dbo.F_GetStockRecord(@endDate,@storeId,RL.Barcode) 库存量
			FROM   RecordTot AS RL , RecordPage AS RP
				WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
							AND @ispage = 1) OR @ispage = 0 )
    
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_OutboundSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-10>
-- Description:	<其它出库汇总报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_OutboundSummary]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

	
	;WITH recordls AS(
		SELECT c.CategoryTitle,b.Barcode,c.ProductCode,c.Title,c.SubUnit,a.StoreId,dbo.F_StoreNameById(a.StoreId,a.CompanyId) StoreTitle
		,b.OutboundNumber,b.BuyPrice,b.BuyPrice/(100+ISNULL(c.StockRate,0))*100 AS [未税单价],c.SysPrice,CONVERT(VARCHAR(10),a.VerifyTime,120) VerifyTime 
		,dbo.F_UserNameById(a.OperatorUID) Operator
		FROM dbo.OutboundGoods a
		INNER JOIN dbo.OutboundList b ON b.OutboundId = a.OutboundId
		INNER JOIN dbo.Vw_Product_Bundling c ON c.Barcode = b.Barcode AND c.CompanyId = a.CompanyId
		WHERE a.CompanyId=@companyId AND a.OutboundType=2 AND a.Channel=0 AND a.State=1
		AND (@startDate='' OR (a.VerifyTime BETWEEN @start AND @end))
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=SupplierID))
		AND (@title='' OR c.Title LIKE '%'+@title+'%' OR c.Barcode=''+@title+'' OR c.ProductCode=''+@title+'' OR c.Barcodes LIKE '%'+@title+'%')
	),RecordList AS(
		SELECT   * ,
                ROW_NUMBER() OVER ( ORDER BY t.StoreId) AS RSNO
        FROM     ( SELECT   
							StoreId,
							StoreTitle,
							Barcode ,
							ProductCode,
							Title ,
							SubUnit,
							SUM(recordls.OutboundNumber*SysPrice) SaleTotal ,
							SUM(recordls.OutboundNumber* recordls.BuyPrice) [出库金额],
							SUM(recordls.OutboundNumber) OutboundNumber,
							SUM(recordls.[未税单价]*recordls.OutboundNumber) [未税金额]
					FROM    recordls
					GROUP BY  
							StoreId,
							StoreTitle,
							ProductCode,
							Barcode ,
							Title,
							SubUnit
                           
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.OutboundNumber) OutboundNumbers,
			SUM(a.SaleTotal) SaleTotals,SUM(a.[出库金额]) [出库金额s],SUM(a.[未税金额]) [未税金额s] FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_OutboundDetail]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-10>
-- Description:	<其它出库明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_OutboundDetail]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

	
	;WITH recordls AS(
		SELECT c.CategoryTitle,b.Barcode,c.ProductCode,c.Title,c.SubUnit,a.StoreId,dbo.F_StoreNameById(a.StoreId,a.CompanyId) StoreTitle
		,b.OutboundNumber,b.BuyPrice,b.BuyPrice/(100+ISNULL(c.StockRate,0))*100 AS [未税单价],c.SysPrice,CONVERT(VARCHAR(10),a.VerifyTime,120) VerifyTime 
		,dbo.F_UserNameById(a.OperatorUID) Operator
		FROM dbo.OutboundGoods a
		INNER JOIN dbo.OutboundList b ON b.OutboundId = a.OutboundId
		INNER JOIN dbo.Vw_Product_Bundling c ON c.Barcode = b.Barcode AND c.CompanyId = a.CompanyId
		WHERE a.CompanyId=@companyId AND a.OutboundType=2 AND a.Channel=0 AND a.State=1
		AND (@startDate='' OR (a.VerifyTime BETWEEN @start AND @end))
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=SupplierID))
		AND (@title='' OR c.Title LIKE '%'+@title+'%' OR c.Barcode=''+@title+'' OR c.ProductCode=''+@title+'' OR c.Barcodes LIKE '%'+@title+'%')
	),RecordList AS(
		SELECT   * ,
                ROW_NUMBER() OVER ( ORDER BY t.StoreId) AS RSNO
        FROM     ( SELECT   
							StoreId,
							StoreTitle,
							VerifyTime,
							Barcode ,
							ProductCode,
							Title ,
							SubUnit,
							Operator,
							SUM(recordls.OutboundNumber*SysPrice) SaleTotal ,
							SUM(recordls.[未税单价]) [未税单价] ,
							SUM(recordls.OutboundNumber* recordls.BuyPrice) [出库金额],
							SUM(recordls.OutboundNumber) OutboundNumber,
							SUM(recordls.[未税单价]*recordls.OutboundNumber) [未税金额]
					FROM    recordls
					GROUP BY  
							StoreId,
							StoreTitle,
							VerifyTime,
							ProductCode,
							Barcode ,
							Title,
							SubUnit,
							Operator
                           
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.OutboundNumber) OutboundNumbers,
			SUM(a.SaleTotal) SaleTotals,SUM(a.[出库金额]) [出库金额s],SUM(a.[未税金额]) [未税金额s] FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_InvoicingSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		linbl
-- Create date: <2015-12-16>
-- Description:	<进销存统计报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_InvoicingSummary]
	@companyId INT,
	@startDate VARCHAR(20)='', 
	@endDate VARCHAR(20)='', 
	@storeId VARCHAR(100)='',
	@supplierId VARCHAR(300)='',
	@categorySn	VARCHAR(2000)='',
	@title VARCHAR(50)='',
	@CurrentPage	INT=1,			--当前页	@PageSize		INT=20,				--页大小,
	@ispage SMALLINT=1,  --是否分页
	@isRelated smallint=1	--0:全部，1:仅显示有业务往来
AS
BEGIN
	SET NOCOUNT ON;
	--IF OBJECT_ID('tempdb.dbo.#t1','U') IS NOT NULL DROP TABLE #t1;
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END
    
    IF(ISNULL(@title,'')<>'' )
    BEGIN
		SET @isRelated=0;--用关键字查询时,查所有
    end       
	--采购量
	SELECT t.Barcode,SUM(t.IndentNoGiftNum) 采购入库数,ROUND(SUM(t.IndentNoGiftNum*t.Price),2) 采购入库金额 INTO #t1 FROM (
		SELECT * FROM dbo.Vw_OrderList a
		WHERE a.State=5 AND a.Nature=0
		AND (@startDate='' OR @endDate='' OR (a.CreateDT BETWEEN @startDate AND @endDate))
		AND (@storeId='' OR EXISTS(SELECT * FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.StoreId))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=a.SupplierID))
		AND a.companyid=@companyId
	) t GROUP BY Barcode
	
	--采购赠送量
	SELECT SUM(v.IndentNum) 赠送入库数量,SUM(v.IndentNum*v.Price) 赠送入库金额,v.Barcode  INTO #t2  FROM dbo.Vw_OrderList v
	WHERE v.State=5 AND v.Nature=1
	AND (@startDate='' OR @endDate='' OR (v.CreateDT BETWEEN @startDate AND @endDate))
	AND (@storeId='' OR EXISTS(SELECT * FROM dbo.SplitString(@storeId,',',1) WHERE Value=v.StoreId))
	AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=v.SupplierID))
	AND v.companyid=@companyId
	GROUP BY v.Barcode
	
	--采购退换
	SELECT retdt.Barcode,SUM(retdt.采购退货数量) 采购退货数量,SUM(retdt.采购退货金额) 采购退货金额 INTO #t3 FROM(
	SELECT a.Barcode,SUM(ReturnNum) 采购退货数量,SUM(b.Price*ReturnNum) as 采购退货金额 FROM OrderReturns a,dbo.IndentOrderList b WHERE a.IndentOrderId=b.IndentOrderId and a.Barcode=b.Barcode and ReturnType=0 
	AND (@startDate='' OR @endDate='' OR (CreateDT BETWEEN @startDate AND @endDate))
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.IndentOrder,dbo.SplitString(@storeId,',',1) WHERE IndentOrderId=b.IndentOrderId AND StoreId=Value))
	AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.IndentOrder,dbo.SplitString(@supplierId,',',1) WHERE IndentOrderId=b.IndentOrderId AND SupplierID=Value))
	AND a.companyid=@companyId
	GROUP BY a.Barcode
	UNION all
	SELECT b.Barcode,SUM(b.ReturnNum) 退货登记数量,SUM(b.BuyPrice*b.ReturnNum) 退货登记金额 FROM dbo.CommodityReturns a,dbo.CommodityReturnsDetail b WHERE b.ReturnId=a.ReturnId AND a.State=2
	AND (@startDate='' OR @endDate='' OR (CreateDT BETWEEN @startDate AND @endDate))
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.StoreId))
	AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=a.SupplierID))
	AND a.companyid=@companyId
	GROUP BY b.Barcode
	) retdt GROUP BY retdt.Barcode
	
	--调拨调出
	--SELECT a.Barcode,SUM(a.DeliveryQuantity) 店内调出数量,SUM(dbo.F_SysPriceByBarcode('',a.Barcode)*a.DeliveryQuantity) as 店内调出金额 INTO #t4 FROM STHouseMove a 
	--WHERE a.State=4 AND( @startDate='' OR @endDate='' OR (CreateDT BETWEEN @startDate AND @endDate))
	--AND(@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.OutStoreId))
	--GROUP BY a.Barcode
	SELECT Barcode,SUM(DeliveryQuantity) as [店内调出数量],SUM(DeliveryQuantity*SysPrice) as [店内调出金额] INTO #t4 FROM Vw_HouseMove a WHERE 1=1
	AND( @startDate='' OR @endDate='' OR (a.ActualDT BETWEEN @startDate AND @endDate))
	AND(@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.OutStoreId))
	AND companyid=@companyId AND state IN(2,4)
	GROUP BY Barcode
	
	--调拨调入
	--SELECT a.Barcode,SUM(a.ActualQuantity) 店内调入数量,SUM(dbo.F_SysPriceByBarcode('',a.Barcode)*a.ActualQuantity) as 店内调入金额 INTO #t12 FROM STHouseMove a 
	--WHERE a.State=4 AND( @startDate='' OR @endDate='' OR (CreateDT BETWEEN @startDate AND @endDate))
	--AND(@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.InStoreId))
	--GROUP BY a.Barcode
	SELECT Barcode,SUM(ActualQuantity) 店内调入数量,SUM(ActualQuantity*SysPrice) as 店内调入金额 INTO #t12 FROM Vw_HouseMove a WHERE 1=1
	AND( @startDate='' OR @endDate='' OR (a.ActualDT BETWEEN @startDate AND @endDate))
	AND(@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.InStoreId))
	AND a.companyid=@companyId AND state=4
	GROUP BY Barcode
	
	--批发
	SELECT b.Barcode,SUM(b.OutboundNumber) 批发销售数量,SUM(b.SysPrice*b.OutboundNumber) 批发销售金额,
	SUM(b.OutboundNumber*b.BuyPrice) 批发销售成本 INTO #t5
	FROM OutboundGoods a,dbo.OutboundList b WHERE a.OutboundId=b.OutboundId AND a.Channel=1 AND a.State=1
	and (@startDate='' OR @endDate='' OR (a.VerifyTime BETWEEN @startDate AND @endDate))
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.StoreId))
	AND a.companyid=@companyId
	GROUP BY b.Barcode
	--其它出库
	SELECT b.Barcode,	SUM(b.OutboundNumber) 其它出库数量,SUM(b.SysPrice*b.OutboundNumber) 其它出库金额 INTO #t6
	FROM OutboundGoods a,dbo.OutboundList b WHERE a.OutboundId=b.OutboundId AND a.Channel=0 AND a.State=1 AND a.OutboundType=2
	and (@startDate='' OR @endDate='' OR (a.VerifyTime BETWEEN @startDate AND @endDate))
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.StoreId))
	AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=a.ApplyOrgId))
	AND a.companyid=@companyId
	GROUP BY b.Barcode
	--销售

	SELECT Barcode,SUM(PurchaseNumber) 零售数量,ROUND(SUM(AveragePrice*PurchaseNumber),3) 零售金额,SUM(BuyPrice*PurchaseNumber) 零售成本 INTO #t7
	FROM (
	SELECT b.Barcode,b.AveragePrice,b.BuyPrice,b.PurchaseNumber FROM dbo.SaleOrders a
	INNER join dbo.SaleDetail b ON b.PaySN = a.PaySN
	WHERE a.IsTest=0
	and (@startDate='' OR (CreateDT BETWEEN @startDate AND @endDate))
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.StoreId))
	AND a.companyid=@companyId) t
	GROUP BY Barcode
	--其它入库
	SELECT Barcode,SUM(InboundNumber) 其它入库数量,SUM(其它入库金额) 其它入库金额 INTO #t8 FROM 
	(
	SELECT a.StoreId,a.SupplierID,a.VerifyTime, Barcode,InboundNumber,InboundNumber*BuyPrice 其它入库金额 FROM dbo.InboundGoods a, dbo.InboundList b 
	WHERE a.InboundGoodsId=b.InboundGoodsId AND CompanyId=@companyId AND a.State=1  AND a.InboundType=2
	) t WHERE 1=1
	and (@startDate='' OR @endDate='' OR (VerifyTime BETWEEN @startDate AND @endDate))
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
	AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=SupplierID))
	GROUP BY Barcode

	--报损
	SELECT b.Barcode,SUM(b.BreakageNumber) 报损数量,SUM(b.BreakageNumber*b.BreakagePrice) 报损金额 INTO #t9 FROM dbo.BreakageGoods a ,dbo.BreakageList b WHERE a.BreakageGoodsId=b.BreakageGoodsId AND a.State=1
	and (@startDate='' OR @endDate='' OR (a.VerifyTime BETWEEN @startDate AND @endDate))
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.StoreId))
	AND a.companyid=@companyId
	GROUP BY b.Barcode
	--组合
	--SELECT b.Barcode,SUM(b.PurchaseNumber) 组合数量,sum(b.PurchaseNumber*b.AveragePrice) 组合金额 INTO #t10 FROM dbo.SaleOrders a, dbo.SaleDetail b 
	--WHERE a.PaySN=b.PaySN AND EXISTS(SELECT 1 FROM dbo.ProductRecord WHERE CompanyId=a.CompanyId and Barcode=b.Barcode AND Nature=1)
	--and (@startDate='' OR @endDate='' OR CreateDT BETWEEN @startDate AND @endDate)
	--AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=a.StoreId))
	--AND a.companyid=@companyId
	--GROUP BY b.Barcode
	SELECT Barcode, SUM(Number) 组合数量加,SUM(AveragePrice*Number) 组合金额加 into #t10 FROM InventoryRecord 
	WHERE CompanyId=@companyId AND Source=18
	and (@startDate='' OR @endDate='' OR CreateDT BETWEEN @startDate AND @endDate)
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
	GROUP BY Barcode

	SELECT Barcode, SUM(Number) 组合数量减,SUM(AveragePrice*Number) 组合金额减 into #t16 FROM InventoryRecord 
	WHERE CompanyId=@companyId AND Source=10
	and (@startDate='' OR @endDate='' OR CreateDT BETWEEN @startDate AND @endDate)
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
	GROUP BY Barcode

	--拆分
	--SELECT ROW_NUMBER() OVER(PARTITION BY Barcode ORDER BY BalanceDate desc) row,Barcode,Number 拆分数量,dbo.F_BuyPriceByBarcode('',Barcode,a.CompanyId)*number 拆分金额 INTO #t13 FROM dbo.InventoryBalance a WHERE 1=1
	--AND EXISTS(SELECT 1 FROM dbo.ProductRecord WHERE Barcode=a.Barcode AND Nature=2)
	--and (@startDate='' OR @endDate='' OR (BalanceDate BETWEEN @startDate AND @endDate))
	--AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
	--AND a.companyid=@companyId
	SELECT Barcode, SUM(Number) 拆分数量加,SUM(AveragePrice*Number) 拆分金额加 into #t13 FROM InventoryRecord 
	WHERE CompanyId=@companyId AND Source=7
	and (@startDate='' OR @endDate='' OR CreateDT BETWEEN @startDate AND @endDate)
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
	GROUP BY Barcode
	SELECT Barcode, SUM(Number) 拆分数量减,SUM(AveragePrice*Number) 拆分金额减 into #t17 FROM InventoryRecord 
	WHERE CompanyId=@companyId AND Source=8
	and (@startDate='' OR @endDate='' OR CreateDT BETWEEN @startDate AND @endDate)
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
	GROUP BY Barcode

	--盘点盈亏
	SELECT Barcode,SUM(SubstractNum) 盘点盈亏数量,SUM([dbo].[F_BuyPriceByBarcode](SupplierId,Barcode,CompanyId)*(number-LockNumber)) 盘点盈亏金额 INTO #t11 FROM dbo.Vw_StockTaking WHERE state=1
	and (@startDate='' OR @endDate='' OR (CreateDT BETWEEN @startDate AND @endDate))
	AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=LockStoreID))
	AND companyid=@companyId
	GROUP BY Barcode

	--SELECT  SUM(Number) 结存数量,Barcode,SUM(StockAmount) 结存金额 INTO #t14 FROM dbo.InventoryBalance WHERE 1=1
	--AND (@startDate='' OR @endDate='' OR (BalanceDate BETWEEN @startDate AND @endDate))
	--AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
	--AND companyid=@companyId
	--GROUP BY Barcode
	
	--结存
	SELECT Barcode,SUM(t.Number) 期初库存,SUM(StockAmount) 期初金额 INTO #t14 FROM(
		SELECT  ROW_NUMBER() OVER(PARTITION BY StoreId,Barcode ORDER BY BalanceDate DESC) row,* FROM dbo.InventoryBalance
		WHERE BalanceDate<@startDate
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
		AND CompanyId=@companyId 
	) t WHERE row=1 GROUP BY Barcode
		
	SELECT Barcode,SUM(t.Number) 结存数量,SUM(StockAmount) 结存金额 INTO #t15 FROM(
		SELECT  ROW_NUMBER() OVER(PARTITION BY StoreId,Barcode ORDER BY BalanceDate DESC) row,* FROM dbo.InventoryBalance
		WHERE BalanceDate<@endDate
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
		AND CompanyId=@companyId 
	) t WHERE row=1 GROUP BY Barcode
	
	;WITH RelatedLsit as (
			select Barcode from (
				SELECT Barcode
				FROM dbo.InventoryRecord
				WHERE (@startDate='' OR @endDate='' OR (CreateDT BETWEEN @startDate AND @endDate))
					AND (CompanyId=@companyId)
					 AND (@storeId='' or @storeId='0' or @storeId='-1'
						or dbo.Comm_F_NumIsInGroup(StoreId,@storeId)=1)
			) as tmp group by barcode
	), RecordList AS(
		SELECT a.SupplierTitle as [主供应商],a.ProductCode as [商品编码]
				,a.Barcode as [商品条码],a.Title as [品名],a.SubUnit as [单位]
				,a.CategoryTitle as [商品类别],a.StockRate
				,m.[期初库存], m.[期初金额], b.[采购入库数], b.[采购入库金额]
				,c.[赠送入库数量], c.[赠送入库金额], d.[采购退货数量], d.[采购退货金额]
				,e.[店内调出数量], e.[店内调出金额], o.[店内调入数量], o.[店内调入金额]
				,f.[批发销售数量], f.[批发销售金额], f.[批发销售成本]
				,(f.[批发销售金额] - f.[批发销售成本]) as [批发毛利]
				,CAST(CASE ISNULL(f.[批发销售金额],0) WHEN 0 THEN 0
					ELSE cast((f.[批发销售金额]-f.[批发销售成本])/f.[批发销售金额]*100 AS DECIMAL(18,2))
					END AS VARCHAR(20))+'%' as [批发毛利率]
				,g.[其它出库数量],g.[其它出库金额],i.[其它入库数量]
				,i.[其它入库金额],h.[零售数量],h.[零售金额],h.[零售成本]
				,ROUND(h.[零售成本]/(100+ISNULL(a.SaleRate,0))*100,2) as [未税零售成本]
				,h.[零售金额]-h.[零售成本] as [零售毛利],
				CAST(CASE ISNULL(h.[零售金额],0) WHEN 0 THEN 0
						ELSE  cast((h.[零售金额]-h.[零售成本])/h.[零售金额]*100 AS DECIMAL(18,2))
						END AS VARCHAR(20))+'%' as [零售毛利率]
				,h.[零售成本] as [销售成本],h.[零售金额]-h.[零售成本] as [销售毛利]
				,CAST(CASE ISNULL(h.[零售金额],0) WHEN 0 THEN 0
						ELSE cast((h.[零售金额]-h.[零售成本])/h.[零售金额]*100 AS DECIMAL(18,2))
						END AS VARCHAR(20))+'%' as [销售毛利率]
				,j.[报损数量],j.[报损金额],n.[盘点盈亏数量],n.[盘点盈亏金额]
				,k.[组合数量加],k.[组合金额加],l.[拆分数量加],l.[拆分金额加]
				,q.[组合数量减],q.[组合金额减],r.[拆分数量减],r.[拆分金额减]
				,p.[结存数量],p.[结存金额],ROUND([结存金额]/(100+ISNULL(a.StockRate,0))*100,2) as [未税结存金额]
				,dbo.F_BuyPriceByBarcode(@supplierId,a.Barcode,a.CompanyId) as BuyPrice
				,ROW_NUMBER() OVER(ORDER BY a.Barcode) AS RSNO
		FROM dbo.Vw_Product_Bundling as a
			LEFT JOIN  #t1 b ON a.Barcode=b.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+b.Barcode+',%'
			LEFT JOIN  #t2 c ON a.Barcode=c.Barcode   OR ','+a.Barcodes+',' LIKE '%,'+c.Barcode+',%'
			LEFT JOIN  #t3 d ON a.Barcode=d.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+d.Barcode+',%'
			LEFT JOIN  #t4 e ON a.Barcode=e.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+e.Barcode+',%'
			LEFT JOIN  #t5 f ON a.Barcode=f.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+f.Barcode+',%'
			LEFT JOIN  #t6 g ON a.Barcode=g.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+g.Barcode+',%'
			LEFT JOIN  #t7 h ON a.Barcode=h.Barcode OR ','+a.Barcodes+',' LIKE '%,'+h.Barcode+',%'
			LEFT JOIN  #t8 i ON a.Barcode=i.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+i.Barcode+',%'
			LEFT JOIN  #t9 j ON a.Barcode=j.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+j.Barcode+',%'
			LEFT JOIN  #t10 k ON a.Barcode=k.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+k.Barcode+',%'
			LEFT JOIN #t13 l ON a.Barcode=l.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+l.Barcode+',%'
			LEFT JOIN #t14 m ON a.Barcode=m.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+m.Barcode+',%'
			LEFT JOIN  #t11 n ON a.Barcode=n.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+n.Barcode+',%'
			LEFT JOIN  #t12 o ON a.Barcode=o.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+o.Barcode+',%'
			LEFT JOIN #t15 p ON a.Barcode=p.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+p.Barcode+',%'
			LEFT JOIN #t16 q ON a.Barcode=q.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+q.Barcode+',%'
			LEFT JOIN #t17 r ON a.Barcode=r.Barcode  OR ','+a.Barcodes+',' LIKE '%,'+r.Barcode+',%'
		WHERE a.companyid=@companyId
		AND (@title='' OR a.Barcode = ''+@title+''  OR a.ProductCode = ''+@title+'' OR a.Barcodes LIKE '%'+@title+'%' OR a.Title LIKE '%'+@title+'%')
		AND (@categorySn='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@categorySn,',',1) s WHERE s.Value=CAST(a.CategorySN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=a.SupplierId))
		AND (@isRelated='0' or a.Barcode in (select Barcode from RelatedLsit))
		
		),
		RecordTot AS(
			SELECT * FROM RecordList AS r,(
				SELECT SUM([采购入库数]) AS [采购入库数s],ROUND(SUM([采购入库金额]),2) AS [采购入库金额s], SUM([赠送入库数量]) AS [赠送入库数量s],ROUND(SUM([赠送入库金额]),2) AS [赠送入库金额s], SUM([采购退货数量]) AS [采购退货数量s],ROUND(SUM([采购退货金额]),2) AS [采购退货金额s], SUM([店内调出数量]) AS [店内调出数量s],ROUND(SUM([店内调出金额]),2) AS [店内调出金额s], SUM([店内调入数量]) AS [店内调入数量s],ROUND(SUM([店内调入金额]),2) AS [店内调入金额s], SUM([批发销售数量]) AS [批发销售数量s],
                ROUND(SUM([批发销售金额]),2) AS [批发销售金额s],ROUND(SUM([批发销售成本]),2) AS [批发销售成本s],ROUND(SUM([批发毛利]),2) AS [批发毛利s], SUM([其它出库数量]) AS [其它出库数量s],ROUND(SUM([其它出库金额]),2) AS [其它出库金额s], SUM([零售数量]) AS [零售数量s],ROUND(SUM([零售金额]),2) AS [零售金额s],ROUND(SUM([零售成本]),2) AS [零售成本s],ROUND(SUM([未税零售成本]),2) AS [未税零售成本s],ROUND(SUM([零售毛利]),2) AS [零售毛利s],ROUND(SUM([销售成本]),2) AS [销售成本s],ROUND(SUM([销售毛利]),2) AS [销售毛利s],ROUND(SUM([期初库存]),2) AS [期初库存s],ROUND(SUM([期初金额]),2) AS [期初金额s],
                SUM([其它入库数量]) AS [其它入库数量s],ROUND(SUM([其它入库金额]),2) AS [其它入库金额s], SUM([报损数量]) AS [报损数量s],ROUND(SUM([报损金额]),2) AS [报损金额s], SUM([组合数量加]) AS [组合数量加s],ROUND(SUM([组合金额加]),2) AS [组合金额加s], SUM([拆分数量加]) AS [拆分数量加s],ROUND(SUM([拆分金额加]),2) AS [拆分金额加s], SUM([组合数量减]) AS [组合数量减s],ROUND(SUM([组合金额减]),2) AS [组合金额减s], SUM([拆分数量减]) AS [拆分数量减s],ROUND(SUM([拆分金额减]),2) AS [拆分金额减s],
				SUM([结存数量]) AS [结存数量s],ROUND(SUM([结存金额]),2) AS [结存金额s],ROUND(SUM([未税结存金额]),2) AS [未税结存金额s], SUM([盘点盈亏数量]) AS [盘点盈亏数量s],ROUND(SUM([盘点盈亏金额]),2) AS [盘点盈亏金额s]
				FROM RecordList a 
				
			) AS t
		),
		RecordPage AS (
				SELECT   MAX(RSNO) AS [RecordTotal] ,
						( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
													  2), MAX(RSNO))
													  / @PageSize)
							   THEN ( CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
											  / @PageSize) - 1 )
									* @PageSize + 1
							   ELSE @RecordStart
						  END ) AS [RecordStart] ,
						( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
													  2), MAX(RSNO))
													 / @PageSize )
							   THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
											/ @PageSize) * @PageSize
							   ELSE @RecordEnd
						  END ) AS [RecordEnd]
			   FROM     RecordList
			 )
	SELECT  *
	FROM    RecordTot AS RL ,
			RecordPage AS RP
	WHERE   ( (RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd AND @ispage=1) OR @ispage=0 )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_HouseMoveSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-10>
-- Description:	<调拨汇总报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_HouseMoveSummary]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @inStoreId VARCHAR(100) = '' ,
    @outStoreId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

	
	;WITH recordls AS(
		SELECT c.CompanyId, c.CategorySN,b.Barcode,c.ProductCode,c.Title,c.SubUnit,b.OutStoreId,dbo.F_StoreNameById(b.OutStoreId,b.CompanyId) OutStoreTitle,b.InStoreId,dbo.F_StoreNameById(b.InStoreId,b.CompanyId) InStoreTitle,b.ActualQuantity
		,b.BuyPrice,b.SysPrice,b.SysPrice/(100+ISNULL(c.StockRate,0))*100 AS [未税调价],b.SysPrice*b.ActualQuantity as SubTotal,CONVERT(VARCHAR(10),b.ActualDT,120) ActualDT,dbo.F_UserNameById(b.CreateUID) Opertaor
		FROM Vw_HouseMove b
		INNER JOIN dbo.Vw_Product_Bundling c ON c.Barcode = b.Barcode AND c.CompanyId = b.CompanyId
		WHERE c.CompanyId=@companyId 
		AND (@startDate='' OR (ActualDT BETWEEN @start AND @end))
		AND (@inStoreId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@inStoreId,',',1) WHERE Value=InStoreId))
		AND (@outStoreId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@outStoreId,',',1) WHERE Value=OutStoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=SupplierID))
		AND (@title='' OR c.Title LIKE '%'+@title+'%' OR c.Barcode=''+@title+'' OR c.ProductCode=''+@title+'' OR c.Barcodes LIKE '%'+@title+'%')
	),RecordList AS(
		SELECT   * ,dbo.F_ProductCategoryFullDescBySN(t.CategorySN,t.CompanyId) AS CategoryTitle,
                ROW_NUMBER() OVER ( ORDER BY t.InStoreId,t.OutStoreId,t.CategorySN) AS RSNO
        FROM     ( SELECT   CategorySN,
							CompanyId,
							InStoreId,
							InStoreTitle,
							OutStoreId,
							OutStoreTitle,
							Barcode ,
							ProductCode,
							Title ,
							SubUnit,
							SUM(recordls.SubTotal) as [调价金额] ,
							SUM(recordls.SysPrice) as [调价] ,
							SUM(recordls.未税调价) as [未税调价] ,
							SUM(recordls.未税调价* recordls.ActualQuantity) as [未税金额] ,
							SUM(recordls.ActualQuantity) as ActualQuantity,
							SUM(recordls.SubTotal)-SUM(recordls.未税调价* recordls.ActualQuantity) AS [税额]
					FROM    recordls
					GROUP BY  CompanyId,
							recordls.InStoreId,
							recordls.InStoreTitle,
							recordls.OutStoreId,
							recordls.OutStoreTitle,
							CategorySN,
							ProductCode,
							Barcode ,
							Title,
							SubUnit
                           
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.ActualQuantity) ActualQuantitys,
				SUM(a.[调价金额]) as [调价金额s],SUM(a.未税金额) as [未税金额s],SUM(a.税额) [税额s] FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_HouseMoveDetail]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-10>
-- Description:	<调拨明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_HouseMoveDetail]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @inStoreId VARCHAR(100) = '' ,
    @outStoreId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

	
	;WITH recordls AS(
		SELECT c.CompanyId, c.CategorySN,b.Barcode,c.ProductCode,c.Title,c.SubUnit,b.OutStoreId,dbo.F_StoreNameById(b.OutStoreId,b.CompanyId) OutStoreTitle,b.InStoreId,dbo.F_StoreNameById(b.InStoreId,b.CompanyId) InStoreTitle,b.ActualQuantity
		,b.BuyPrice,b.SysPrice,b.SysPrice/(100+ISNULL(c.StockRate,0))*100 AS [未税调价],b.SysPrice*b.ActualQuantity as SubTotal,CONVERT(VARCHAR(10),b.ActualDT,120) ActualDT,dbo.F_UserNameById(b.CreateUID) Opertaor
		FROM Vw_HouseMove b
		INNER JOIN dbo.Vw_Product_Bundling c ON c.Barcode = b.Barcode AND c.CompanyId = b.CompanyId
		WHERE b.CompanyId=@companyId
		AND (@startDate='' OR (b.ActualDT BETWEEN @start AND @end))
		AND (@inStoreId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@inStoreId,',',1) WHERE Value=b.InStoreId))
		AND (@outStoreId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@outStoreId,',',1) WHERE Value=b.OutStoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=SupplierID))
		AND (@title='' OR c.Title LIKE '%'+@title+'%' OR c.Barcode=''+@title+'' OR c.ProductCode=''+@title+'' OR c.Barcodes LIKE '%'+@title+'%')
	),RecordList AS(
		SELECT   * ,dbo.F_ProductCategoryFullDescBySN(t.CategorySN,t.CompanyId) AS CategoryTitle,
                ROW_NUMBER() OVER ( ORDER BY t.InStoreId,t.OutStoreId,t.CategorySN) AS RSNO
        FROM     ( SELECT   CompanyId,
							CategorySN,
							InStoreId,
							InStoreTitle,
							OutStoreId,
							OutStoreTitle,
							ActualDT,
							Opertaor,
							Barcode ,
							ProductCode,
							Title ,
							SubUnit,
							SUM(recordls.SubTotal) as [调价金额] ,
							SUM(recordls.SysPrice) as [调价] ,
							SUM(recordls.未税调价) as [未税调价] ,
							SUM(recordls.未税调价* recordls.ActualQuantity) as [未税金额] ,
							SUM(recordls.ActualQuantity) as ActualQuantity,
							SUM(recordls.SubTotal)-SUM(recordls.未税调价* recordls.ActualQuantity) AS [税额]
					FROM    recordls
					GROUP BY recordls.CompanyId,
							recordls.InStoreId,
							recordls.InStoreTitle,
							recordls.OutStoreId,
							recordls.OutStoreTitle,
							recordls.Opertaor,
							ActualDT,
							CategorySN,
							ProductCode,
							Barcode ,
							Title,
							SubUnit
                           
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.ActualQuantity) ActualQuantitys,
				SUM(a.[调价金额]) as [调价金额s],SUM(a.未税金额) as [未税金额s],SUM(a.税额) [税额s] FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_BreakageSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-10>
-- Description:	<报损汇总报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_BreakageSummary]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

	
	;WITH recordls AS(
		SELECT a.CompanyId, c.CategorySN,b.Barcode,c.ProductCode,c.Title,c.SubUnit,a.StoreId,dbo.F_StoreNameById(a.StoreId,a.CompanyId) StoreTitle,a.Receipt,b.BreakageNumber,b.BreakagePrice,b.BreakagePrice/(100+ISNULL(c.StockRate,0))*100 AS [未税单价],c.SysPrice FROM dbo.BreakageGoods a
		INNER JOIN dbo.BreakageList b ON b.BreakageGoodsId = a.BreakageGoodsId
		INNER JOIN dbo.Vw_Product_Bundling c ON c.Barcode = b.Barcode AND c.CompanyId = a.CompanyId
		WHERE a.CompanyId=@companyId AND b.State=1
		AND (@startDate='' OR (a.CreateDT BETWEEN @start AND @end))
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=SupplierID))
		AND (@title='' OR c.Title LIKE '%'+@title+'%' OR c.Barcode=''+@title+'' OR c.ProductCode=''+@title+'' OR c.Barcodes LIKE '%'+@title+'%')
	),RecordList AS(
		SELECT   * ,dbo.F_ProductCategoryFullDescBySN(CategorySN,CompanyId) AS CategoryTitle,
                ROW_NUMBER() OVER ( ORDER BY t.StoreId,t.CategorySN) AS RSNO
        FROM     ( SELECT   CategorySN,
							CompanyId,
							StoreId,
							StoreTitle,
							Barcode ,
							ProductCode,
							Title ,
							SubUnit,
							SUM(recordls.BreakageNumber*SysPrice) SaleTotal ,
							SUM(recordls.BreakageNumber* recordls.BreakagePrice) BreakageTotal ,
							SUM(recordls.BreakageNumber) BreakageNumber,
							SUM(recordls.[未税单价]*recordls.BreakageNumber) [未税金额]
					FROM    recordls
					GROUP BY CompanyId,
							StoreId,
							StoreTitle,
							CategorySN,
							ProductCode,
							Barcode ,
							Title,
							SubUnit
                           
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.BreakageNumber) BreakageNumbers,
			SUM(a.SaleTotal) SaleTotals,SUM(a.BreakageTotal) BreakageTotals,SUM(a.[未税金额]) [未税金额s] FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_BreakageDetail]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-10>
-- Description:	<报损明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_BreakageDetail]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

	
	;WITH recordls AS(
		SELECT a.CompanyId, c.CategorySN,b.Barcode,c.ProductCode,c.Title,c.SubUnit,a.StoreId,dbo.F_StoreNameById(a.StoreId,a.CompanyId) StoreTitle,a.Receipt,b.BreakageNumber,b.BreakagePrice,b.BreakagePrice/(100+ISNULL(c.StockRate,0))*100 AS [未税单价],c.SysPrice,CONVERT(VARCHAR(10),a.CreateDT,120) CreateDT FROM dbo.BreakageGoods a
		INNER JOIN dbo.BreakageList b ON b.BreakageGoodsId = a.BreakageGoodsId
		INNER JOIN dbo.Vw_Product_Bundling c ON c.Barcode = b.Barcode AND c.CompanyId = a.CompanyId
		WHERE a.CompanyId=@companyId AND b.State=1
		AND (@startDate='' OR (a.CreateDT BETWEEN @start AND @end))
		AND (@storeId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@storeId,',',1) WHERE Value=StoreId))
		AND (@bigCategorySN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@bigCategorySN,',',1) WHERE Value=CAST(CategorySN AS VARCHAR(20))))
		AND (@brandSN='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@brandSN,',',1) WHERE Value=CAST(BrandSN AS VARCHAR(20))))
		AND (@supplierId='' OR EXISTS(SELECT 1 FROM dbo.SplitString(@supplierId,',',1) WHERE Value=SupplierID))
		AND (@title='' OR c.Title LIKE '%'+@title+'%' OR c.Barcode=''+@title+'' OR c.ProductCode=''+@title+'' OR c.Barcodes LIKE '%'+@title+'%')
	),RecordList AS(
		SELECT   * ,dbo.F_ProductCategoryFullDescBySN(CategorySN,CompanyId) AS CategoryTitle,
                ROW_NUMBER() OVER ( ORDER BY t.StoreId,t.CategorySN) AS RSNO
        FROM     ( SELECT   CategorySN,
							CompanyId,
							StoreId,
							StoreTitle,
							CreateDT,
							Receipt,
							Barcode ,
							ProductCode,
							Title ,
							SubUnit,
							SUM(recordls.BreakageNumber*SysPrice) SaleTotal ,
							SUM(recordls.[未税单价]) [未税单价] ,
							SUM(recordls.BreakageNumber* recordls.BreakagePrice) BreakageTotal ,
							SUM(recordls.BreakageNumber) BreakageNumber,
							SUM(recordls.[未税单价]*recordls.BreakageNumber) [未税金额]
					FROM    recordls
					GROUP BY  CompanyId,
							StoreId,
							StoreTitle,
							CategorySN,
							CreateDT,
							Receipt,
							ProductCode,
							Barcode ,
							Title,
							SubUnit
                           
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.BreakageNumber) BreakageNumbers,
			SUM(a.SaleTotal) SaleTotals,SUM(a.BreakageTotal) BreakageTotals,SUM(a.[未税金额]) [未税金额s] FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_BeforeSaleSummary]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-9>
-- Description:	<前台销售商品门店汇总报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_BeforeSaleSummary]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

		IF OBJECT_ID('tempdb.dbo.#detail','U') IS NOT NULL DROP TABLE #detail;

		SELECT
				b.ProductCode,
				b.Barcode ,
				b.Title ,
				b.SubUnit ,
				a.PurchaseNumber ,
				a.ActualPrice ,
				a.BuyPrice ,
				a.SysPrice ,
				a.AveragePrice,
				a.PaySN ,
				a.Total,
				a.SalesClassifyId,
				b.SupplierId ,
				b.BrandSN ,
				b.CategorySN,
				b.CategoryTitle
				INTO #detail
				FROM
				dbo.SaleDetail a
				INNER JOIN Vw_Product_Bundling b ON (a.Barcode = b.Barcode OR ','+b.Barcodes+',' LIKE '%,'+a.Barcode+',%') AND b.CompanyId = a.CompanyId
				WHERE EXISTS(SELECT 1 FROM dbo.SaleOrders s WHERE a.PaySN=s.PaySN and a.CompanyId=@companyId AND CreateDT BETWEEN @start AND @end
					AND ( @storeId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@storeId,',', 1) WHERE Value = s.StoreId ) ) 
					AND ( @supplierId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@supplierId,',', 1) WHERE Value = b.SupplierId ))
					AND ( @brandSN = '' OR EXISTS ( SELECT  1 FROM dbo.SplitString(@brandSN,',', 1) WHERE Value = b.BrandSN ) )
					AND ( @bigCategorySN = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@bigCategorySN, ',', 1) WHERE Value = b.CategorySN ))
					AND (@title='' OR a.Title LIKE '%'+@title+'%' OR a.Barcode=''+@title+'' OR a.ProductCode=''+@title+'' OR b.Barcodes LIKE '%'+@title+'%')
					AND s.IsTest=0
				)
	CREATE INDEX idx_#detail ON #detail(CategoryTitle,PaySN);

	;WITH recordls AS(
		SELECT d.*,s.CreateDT,s.StoreId,dbo.F_StoreNameById(s.StoreId,s.CompanyId) StoreTitle,s.State,s.Type
		,CASE WHEN s.Type=3 THEN d.PurchaseNumber ELSE 0 END ReturnNumber,CASE WHEN s.Type=3 THEN d.PurchaseNumber*d.AveragePrice ELSE 0 END ReturnTotal
		,CASE WHEN s.Type=1 AND s.Receive>0 THEN d.PurchaseNumber ELSE 0 END HuanNumber,CASE WHEN s.Type=1 AND s.Receive>0 THEN d.PurchaseNumber*d.AveragePrice  ELSE 0 END HuanTotal
		,CASE WHEN s.Type IN(1,2) AND s.Receive<=0 THEN d.PurchaseNumber ELSE 0 END TuiHuanNumber,CASE WHEN s.Type IN(1,2) AND s.Receive<=0 THEN d.PurchaseNumber*d.AveragePrice ELSE 0 END TuiHuanTotal
		,CASE WHEN d.SalesClassifyId IN(49,161) THEN d.PurchaseNumber ELSE 0 END GiftNumber,CASE WHEN d.SalesClassifyId IN(49,161) THEN d.PurchaseNumber*d.SysPrice ELSE 0 END GiftTotal
		 FROM  #detail d
		INNER JOIN dbo.SaleOrders s ON s.PaySN = d.PaySN
	),RecordList AS(
		SELECT   * ,
				( SaleTotal - BuyTotal ) MLE,
                CASE WHEN SaleTotal = 0
                        THEN '0'
                        ELSE CAST(CAST((SaleTotal - BuyTotal)/ SaleTotal * 100 AS MONEY) AS VARCHAR(20))
                END + '%' MLL ,
                ROW_NUMBER() OVER ( ORDER BY t.StoreId) AS RSNO
        FROM     ( SELECT    tb.StoreId,
                            tb.StoreTitle,
                            tb.CategoryTitle,
                            tb.Barcode ,
                            tb.ProductCode,
                            tb.Title ,
                            tb.SubUnit ,
                            tb.PurchaseNumber,
                            tb.SaleTotal,
                            tb.BuyTotal,
                            tb.ReturnNumber,
							tb.HuanNumber,
							tb.TuiHuanNumber,
							tb.GiftNumber,
							tb.ReturnTotal,
							tb.HuanTotal,
							tb.TuiHuanTotal,
							tb.GiftTotal
                                                
                    FROM      ( SELECT  CategoryTitle,
										StoreId,
										StoreTitle,
										Barcode ,
										ProductCode,
                                        Title ,
                                        SubUnit,
                                        ROUND(SUM(PurchaseNumber*AveragePrice),3) SaleTotal ,
                                        SUM(PurchaseNumber*BuyPrice) BuyTotal ,
                                        SUM(PurchaseNumber* SysPrice) SysTotal ,
                                        SUM(PurchaseNumber) PurchaseNumber,
										SUM(recordls.ReturnNumber) ReturnNumber,
										SUM(recordls.HuanNumber) HuanNumber,
										SUM(recordls.TuiHuanNumber) TuiHuanNumber,
										SUM(recordls.GiftNumber) GiftNumber,
										ROUND(SUM(recordls.ReturnTotal),2) ReturnTotal,
										ROUND(SUM(recordls.HuanTotal),2) HuanTotal,
										ROUND(SUM(recordls.TuiHuanTotal),2) TuiHuanTotal,
										ROUND(SUM(recordls.GiftTotal),2) GiftTotal
								FROM    recordls
                                GROUP BY  
										StoreId,
										StoreTitle,
										CategoryTitle,
										ProductCode,
										Barcode ,
                                        Title ,
                                        SubUnit
                            ) tb
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.PurchaseNumber) PurchaseNumbers,
			SUM(a.SaleTotal) SaleTotals,SUM(a.BuyTotal) BuyTotals,SUM(a.HuanNumber) HuanNumbers,SUM(a.HuanTotal) HuanTotals,
			SUM(a.ReturnNumber) ReturnNumbers,SUM(a.ReturnTotal) ReturnTotals,SUM(a.GiftNumber) GiftNumbers,SUM(a.GiftTotal) GiftTotals,
			SUM(a.MLE) MLES,SUM(a.TuiHuanNumber) TuiHuanNumbers,SUM(a.TuiHuanTotal) TuiHuanTotals
				FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_BeforeSaleDetail]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-8-9>
-- Description:	<前台销售商品门店汇总报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_BeforeSaleDetail]
	-- Add the parameters for the stored procedure here
	@companyId INT,
    @startDate VARCHAR(20) ,
    @endDate VARCHAR(20) ,
    @storeId VARCHAR(100) = '' ,
    @bigCategorySN VARCHAR(2000) = '' ,
    @brandSN VARCHAR(100) = '' ,
    @supplierId VARCHAR(500) = '' ,
    @title VARCHAR(100) = '' ,
    @sortField VARCHAR(20) = 'Barcode desc' ,
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @start DATE;
    DECLARE @end DATE;
    SET @start=CAST(@startDate AS DATE);
    SET @end=CAST(@endDate AS DATE);
	SET @title=RTRIM(LTRIM(@title));
	DECLARE @RecordStart INT;
    DECLARE @RecordEnd INT;
    IF ( @CurrentPage <= 1 )
        BEGIN
            SET @RecordStart = 1;
            SET @RecordEnd = @PageSize;
        END
    ELSE
        BEGIN
            SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
            SET @RecordEnd = @CurrentPage * @PageSize;
        END

		IF OBJECT_ID('tempdb.dbo.#detail','U') IS NOT NULL DROP TABLE #detail;

		SELECT
				b.ProductCode,
				b.Barcode ,
				b.Title ,
				b.SubUnit ,
				a.PurchaseNumber ,
				a.ActualPrice ,
				a.BuyPrice ,
				a.SysPrice ,
				a.AveragePrice,
				a.PaySN ,
				a.Total,
				a.SalesClassifyId,
				b.SupplierId ,
				b.BrandSN ,
				b.CategorySN,
				b.CategoryTitle
				INTO #detail
				FROM
				dbo.SaleDetail a
				INNER JOIN Vw_Product_Bundling b ON (a.Barcode = b.Barcode  OR ','+b.Barcodes+',' LIKE '%,'+a.Barcode+',%') AND b.CompanyId = a.CompanyId
				WHERE EXISTS(SELECT 1 FROM dbo.SaleOrders s WHERE a.PaySN=s.PaySN and a.CompanyId=@companyId AND CreateDT BETWEEN @start AND @end
					AND ( @storeId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@storeId,',', 1) WHERE Value = s.StoreId ) ) 
					AND ( @supplierId = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@supplierId,',', 1) WHERE Value = b.SupplierId ))
					AND ( @brandSN = '' OR EXISTS ( SELECT  1 FROM dbo.SplitString(@brandSN,',', 1) WHERE Value = b.BrandSN ) )
					AND ( @bigCategorySN = '' OR EXISTS ( SELECT 1 FROM dbo.SplitString(@bigCategorySN, ',', 1) WHERE Value = b.CategorySN ))
					AND (@title='' OR b.Title LIKE '%'+@title+'%' OR b.Barcode=''+@title+'' OR b.ProductCode=''+@title+'' OR b.Barcodes LIKE '%'+@title+'%')
					AND s.IsTest=0
				)
	CREATE INDEX idx_#detail ON #detail(CategoryTitle,PaySN)	
	;WITH recordls AS(
		SELECT d.*,s.CreateDT,s.StoreId,dbo.F_StoreNameById(s.StoreId,s.CompanyId) StoreTitle,s.State,s.Type
		,CASE WHEN s.Type=3 THEN d.PurchaseNumber ELSE 0 END ReturnNumber,CASE WHEN s.Type=3 THEN d.PurchaseNumber*d.AveragePrice  ELSE 0 END ReturnTotal
		,CASE WHEN s.Type=1 AND s.Receive>0 THEN d.PurchaseNumber ELSE 0 END HuanNumber,CASE WHEN s.Type=1 AND s.Receive>0 THEN d.PurchaseNumber*d.AveragePrice  ELSE 0 END HuanTotal
		,CASE WHEN s.Type IN(1,2) AND s.Receive<=0 THEN d.PurchaseNumber ELSE 0 END TuiHuanNumber,CASE WHEN s.Type IN(1,2) AND s.Receive<=0 THEN d.PurchaseNumber*d.AveragePrice  ELSE 0 END TuiHuanTotal
		,CASE WHEN d.SalesClassifyId IN(49,161) THEN d.PurchaseNumber ELSE 0 END GiftNumber,CASE WHEN d.SalesClassifyId IN(49,161) THEN d.PurchaseNumber*d.SysPrice ELSE 0 END GiftTotal
		 FROM  #detail d
		INNER JOIN dbo.SaleOrders s ON s.PaySN = d.PaySN
	),RecordList AS(
		SELECT   * ,
				( SaleTotal - BuyTotal ) MLE,
                CASE WHEN SaleTotal = 0
                        THEN '0'
                        ELSE CAST(CAST((SaleTotal - BuyTotal)/ SaleTotal * 100 AS MONEY) AS VARCHAR(20))
                END + '%' MLL ,
                ROW_NUMBER() OVER ( ORDER BY t.StoreId,t.CreateDT) AS RSNO
        FROM     ( SELECT    tb.StoreId,
                            tb.StoreTitle,
                            tb.CategoryTitle,
							tb.CreateDT,
                            tb.Barcode ,
                            tb.ProductCode,
                            tb.Title ,
                            tb.SubUnit ,
                            tb.PurchaseNumber,
                            tb.SaleTotal,
                            tb.BuyTotal,
                            tb.ReturnNumber,
							tb.HuanNumber,
							tb.TuiHuanNumber,
							tb.GiftNumber,
							tb.ReturnTotal,
							tb.HuanTotal,
							tb.TuiHuanTotal,
							tb.GiftTotal
                                                
                    FROM      ( SELECT  CategoryTitle,
										StoreId,
										StoreTitle,
										CONVERT(VARCHAR(10),recordls.CreateDT,120) CreateDT,
										Barcode ,
										ProductCode,
                                        Title ,
                                        SubUnit,
                                        ROUND(SUM(PurchaseNumber*AveragePrice),3) SaleTotal ,
                                        SUM(PurchaseNumber*BuyPrice) BuyTotal ,
                                        SUM(PurchaseNumber* SysPrice) SysTotal ,
                                        SUM(PurchaseNumber) PurchaseNumber,
										SUM(recordls.ReturnNumber) ReturnNumber,
										SUM(recordls.HuanNumber) HuanNumber,
										SUM(recordls.TuiHuanNumber) TuiHuanNumber,
										SUM(recordls.GiftNumber) GiftNumber,
										ROUND(SUM(recordls.ReturnTotal),2) ReturnTotal,
										ROUND(SUM(recordls.HuanTotal),2) HuanTotal,
										ROUND(SUM(recordls.TuiHuanTotal),2) TuiHuanTotal,
										ROUND(SUM(recordls.GiftTotal),2) GiftTotal
								FROM    recordls
                                GROUP BY  
										StoreId,
										StoreTitle,
										CategoryTitle,
										CONVERT(VARCHAR(10),recordls.CreateDT,120),
										ProductCode,
										Barcode ,
                                        Title ,
                                        SubUnit
                            ) tb
                ) t
	),RecordTot AS(
		SELECT * FROM RecordList AS r,(
			SELECT SUM(a.PurchaseNumber) PurchaseNumbers,
			SUM(a.SaleTotal) SaleTotals,SUM(a.BuyTotal) BuyTotals,SUM(a.HuanNumber) HuanNumbers,SUM(a.HuanTotal) HuanTotals,
			SUM(a.ReturnNumber) ReturnNumbers,SUM(a.ReturnTotal) ReturnTotals,SUM(a.GiftNumber) GiftNumbers,SUM(a.GiftTotal) GiftTotals,
			SUM(a.MLE) MLES,SUM(a.TuiHuanNumber) TuiHuanNumbers,SUM(a.TuiHuanTotal) TuiHuanTotals
				FROM RecordList a 
		) AS t
    ),RecordPage AS ( 
		SELECT   MAX(RSNO) AS [RecordTotal] ,
                    ( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize)
                            THEN ( CEILING(CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                            / @PageSize) - 1 )
                                * @PageSize + 1
                            ELSE @RecordStart
                        END ) AS [RecordStart] ,
                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                2), MAX(RSNO))
                                                / @PageSize )
                            THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                        / @PageSize)
                                * @PageSize
                            ELSE @RecordEnd
                        END ) AS [RecordEnd]
            FROM     RecordList
            )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
END
GO
/****** Object:  StoredProcedure [dbo].[Rpt_BeforeProductSaleDetails]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<linbl>
-- Create date: <2016-03-21>
-- Description:	<前台商品销售明细报表>
-- =============================================
CREATE PROCEDURE [dbo].[Rpt_BeforeProductSaleDetails]
	@companyId INT,
    @startDate VARCHAR(10) ,
    @endDate VARCHAR(10),
    @storeIds VARCHAR(100) = '' ,
    @cashiers VARCHAR(2000) = '' ,
    @salers VARCHAR(2000) = '' ,
    @apicodes VARCHAR(100) = '' ,
    @title VARCHAR(100) = '' ,
    @type VARCHAR(10)='',
	@sortField VARCHAR(30)='',
    @CurrentPage INT = 1 ,			--当前页    @PageSize INT = 20 ,				--页大小,
    @ispage SMALLINT = 1  --是否分页
AS
    BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
        SET NOCOUNT ON;
        DECLARE @RecordStart INT;
        DECLARE @RecordEnd INT;
        DECLARE @start DATE;
        DECLARE @end DATE;
        SET @start=CONVERT(DATE,@startDate,23);
        SET @end=CONVERT(DATE,@endDate,23);
		SET @title=RTRIM(LTRIM(@title));
        --select SQL_VARIANT_PROPERTY(@startDate,'BaseType')
        PRINT @type
        IF ( @CurrentPage <= 1 )
            BEGIN
                SET @RecordStart = 1;
                SET @RecordEnd = @PageSize;
            END
        ELSE
            BEGIN
                SET @RecordStart = ( ( @CurrentPage - 1 ) * @PageSize ) + 1;
                SET @RecordEnd = @CurrentPage * @PageSize;
            END

            ;WITH    RecordList
                      AS ( SELECT   * 
									,ROW_NUMBER() OVER(PARTITION BY RSNO ORDER BY CreateDT) Sort
                           FROM     ( 
								SELECT  Id ,
										DENSE_RANK() OVER ( ORDER BY 
										CASE WHEN ISNULL(@sortField,'')='' OR @sortField='asc' then id END,
										CASE WHEN ISNULL(@sortField,'desc')='desc' OR @sortField='desc'  then id END DESC
										) AS RSNO,
										--CONVERT(VARCHAR(30),CreateDT,112)+ REPLACE(CONVERT(VARCHAR(30),CreateDT,114),':','') AS [guid],
										[Type],
										CreateDT ,
										Cashier ,
										Saler ,
										Store ,
										PaySN ,
										HuanCount ,
										TuiCount ,
										CustomOrderSn,
										( CustomOrderSn + ( CASE WHEN HuanCount > 0 THEN '<font color=''red''>【换货】</font>' WHEN TuiZhengCount > 0 THEN '<font color=''red''>【退整单】</font>' WHEN TuiCount > 0 THEN '<font color=''red''>【退货】</font>'  ELSE '' END ) ) PaySNFormat ,
										--( CASE WHEN HuanCount > 0 THEN '换货' WHEN TuiZhengCount > 0 THEN '退整单' WHEN TuiCount > 0 THEN '退货'  ELSE '' END )  TypeTitle ,
										ISNULL(TradeNo, '') ApiOrderSN ,
										Receive TotalAmount ,
										PreferentialPrice ,
										-ABS(OrderDiscount) OrderDiscount,
										ApiTitle ,
										Title ,
										PurchaseNumber ,
										ProductCount,
										SysPrice ,
										ActualPrice ,
										Barcode ,
										MobilePhone ,
										( CASE WHEN SalesClassifyId = 49 OR SalesClassifyId=161 THEN '<font color=''red''>赠送</font>'
											   ELSE '销售'
										  END ) SalesClassifyId
								FROM    ( SELECT    a.* ,
													dbo.F_UserNameById(ISNULL(a.ReturnOrderUID,a.CreateUID)) Cashier ,
													dbo.F_UserNameById(Salesman) Saler ,
													dbo.F_StoreNameById(a.StoreId,a.CompanyId) Store ,
													ISNULL(c.Title,b.Title) Title,
												 	b.PurchaseNumber,
													b.SysPrice ,
													b.AveragePrice ActualPrice,
													b.Barcode ,
													b.SalesClassifyId ,
													STUFF(( SELECT  DISTINCT ',' + Title
															FROM    ConsumptionPayment ,ApiLibrary
															WHERE   ApiLibrary.ApiCode = dbo.ConsumptionPayment.ApiCode AND PaySN = a.PaySN 
																AND ApiLibrary.CompanyId = dbo.ConsumptionPayment.CompanyId AND ApiLibrary.CompanyId=a.CompanyId
															FOR XML PATH('')
														  ), 1, 1, '') ApiTitle ,
													ISNULL(
													STUFF((SELECT DISTINCT ','+p.TradeNo FROM dbo.PayNotifyResult p INNER JOIN ConsumptionPayment s ON s.CompanyId=p.CompanyId and s.ApiOrderSN=p.PaySN WHERE s.PaySN=a.paysn AND ISNULL(p.TradeNo,'')<>'' for XML PATH('')),1,1,''),
													STUFF((SELECT DISTINCT ','+ApiOrderSN FROM ConsumptionPayment WHERE CompanyId=a.CompanyId and PaySN=a.paysn AND ISNULL(ApiOrderSN,'')<>'' for XML PATH('')),1,1,'')) TradeNo,
													( SELECT    COUNT(*) FROM      dbo.SaleOrders sr WHERE sr.CompanyId=a.CompanyId and sr.PaySN = a.PaySN AND sr.Type = 3) AS TuiZhengCount ,
													( SELECT    COUNT(*) FROM      dbo.SaleOrders sr WHERE sr.CompanyId=a.CompanyId and  sr.PaySN = a.PaySN AND sr.Type = 2) AS TuiCount ,
													( SELECT    COUNT(*) FROM      dbo.SaleOrders sr WHERE sr.CompanyId=a.CompanyId and  sr.PaySN = a.PaySN AND sr.Type = 1) AS HuanCount ,
													CASE WHEN ISNULL(d.RealName,'')='' then d.MobilePhone ELSE d.RealName+'('+d.MobilePhone+')' END MobilePhone
										  FROM      dbo.SaleOrders a
													INNER JOIN dbo.SaleDetail b ON a.PaySN = b.PaySN
													LEFT JOIN dbo.Vw_Product_Bundling c ON b.Barcode = c.Barcode AND a.CompanyId=c.CompanyId
													LEFT JOIN dbo.Members d ON a.MemberId = d.MemberId  AND a.CompanyId=d.CompanyId
										  WHERE     a.IsTest=0 AND a.CompanyId=@companyId
													--AND ((@tuihuan=0 and a.[State]=0 AND a.[Type]=0)
														--OR (@tuihuan=1 AND not(a.[State]=0 AND a.[Type]=0)))
                                                    --AND ((@tuihuan=0 and a.CreateDT BETWEEN @start AND @end)
														--OR (@tuihuan=1 and a.ReturnDT BETWEEN @start AND @end))
													AND a.CreateDT BETWEEN @start AND @end
                                                    AND (@storeIds = ''
														OR dbo.Comm_F_NumIsInGroup(a.StoreId,@storeIds)=1)
                                                    AND (@cashiers = ''
														OR dbo.Comm_F_NumIsInGroup(a.CreateUID,@cashiers)=1)
                                                    AND (@salers = ''
														OR dbo.Comm_F_NumIsInGroup(a.Salesman,@salers)=1)
                                                    AND (@apicodes = ''
														OR EXISTS ( SELECT 1 FROM dbo.SplitString(@apicodes,',', 1) WHERE ','+a.ApiCode+',' LIKE '%,'+Value+',%' ) )
                                                    AND ( EXISTS(SELECT 1 FROM dbo.SaleDetail sd
														WHERE sd.PaySN=a.PaySN AND (sd.Barcode = ''+@title+'' OR sd.ProductCode = ''+@title+'' OR sd.Title LIKE '%'+@title+'%'))
                                                     OR MobilePhone = ''+@title+'' or a.CustomOrderSn like '%'+@title+''
                                                     OR EXISTS(SELECT 1 FROM dbo.ConsumptionPayment WHERE PaySN=a.PaySN AND ApiOrderSN = ''+@title+''))
                                                    and (@type='' or EXISTS(SELECT 1 FROM dbo.SplitString(@type,',',1) WHERE CAST(Value AS SMALLINT)=a.Type))
										) tb 
                                    ) t
                         ),
                     RecordTot AS(
						SELECT * FROM RecordList AS r,(SELECT SUM(PurchaseNumber) as ProductCounts,SUM(TotalAmount) as TotalAmounts, SUM(OrderDiscount) as OrderDiscounts, SUM(PreferentialPrice) as PreferentialPrices 
						FROM(SELECT paysn,MAX(TotalAmount) TotalAmount,sum(PurchaseNumber) PurchaseNumber ,MAX(OrderDiscount) OrderDiscount,MAX(PreferentialPrice) PreferentialPrice FROM RecordList
							GROUP BY RecordList.PaySN) t) AS t
                     ),
                    RecordPage
                      AS ( 
                      select MAX(RSNO) AS [RecordTotal] ,( CASE WHEN @CurrentPage > CEILING(CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                              / @PageSize)
                                           THEN ( CEILING(CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                          / @PageSize) - 1 )
                                                * @PageSize + 1
                                           ELSE @RecordStart
                                      END ) AS [RecordStart] ,
                                    ( CASE WHEN @CurrentPage > ( CONVERT(DECIMAL(18,
                                                              2), MAX(RSNO))
                                                              / @PageSize )
                                           THEN CEILING(CONVERT(DECIMAL(18, 2), MAX(RSNO))
                                                        / @PageSize)
                                                * @PageSize
                                           ELSE @RecordEnd
                                      END ) AS [RecordEnd]
                           FROM     RecordList
                         )
            SELECT  *
            FROM    RecordTot AS RL ,
                    RecordPage AS RP
            WHERE   ( ( RL.RSNO BETWEEN RP.RecordStart AND RP.RecordEnd
                        AND @ispage = 1
                      )
                      OR @ispage = 0
                    )
                
    END
GO
/****** Object:  StoredProcedure [dbo].[AffectInventory_BindGoods]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-24
-- Description:	影响捆绑商品库存量
--				(供dbo.AffectInventory内部调用)
-- =============================================
CREATE PROCEDURE [dbo].[AffectInventory_BindGoods]
	@CompanyId  Int,
	@StoreId	Int,
	@Source		SmallInt,		--来源标识
	@OperatType	SmallInt,		--操作类型（1:增加，2:相减）
	@NewBarcode	Varchar(30),	--捆绑新条码
	@Number		Money,			--数量（正值）
	@OperatId	Varchar(40)='',	--入库ID或配送ID
	@CreateUID  Varchar(40),	--操作人UID
	@CreateDT	Datetime,
	@SalePrice	Money=0			--销售单价
AS
BEGIN
	DECLARE @_source SmallInt; SET @_source=@Source;
	DECLARE @_SysPrice Money;

	DECLARE @CommodityId VARCHAR(40);
	SELECT @CommodityId=CommodityId,@_SysPrice=SysPrices
		FROM Bundling WHERE CompanyId=@CompanyId AND NewBarcode=@newbarcode;
	
	--得到分拆后的子商品集，含子商品应扣数量、单个商品售价
	DECLARE @Items NVarchar(500); SET @Items='';
	DECLARE @Nums Nvarchar(500); SET @Nums='';
	DECLARE @Prices Nvarchar(500); SET @Prices='';

	SELECT @Items=@Items+'|'+Barcode
			,@Nums=@Nums+'|'+CAST(Number as Nvarchar)
			,@Prices=@Prices+'|'+CAST(SysPrice as Nvarchar)
	FROM dbo.BundlingList WHERE CommodityId=@CommodityId;
	

	--去掉首尾|符号
	IF(CHARINDEX('|',@Items)=1)
	BEGIN
		SET @Items=SUBSTRING(@Items,2,LEN(@Items)-0);
		SET @Nums=SUBSTRING(@Nums,2,LEN(@Nums)-0);
		SET @Prices=SUBSTRING(@Prices,2,LEN(@Nums)-0);
	END
	
	IF(LEN(@Items)>0)
	BEGIN
		IF(@Source IN (2,4,6,8,9,10,12,13))
		BEGIN
			--记录捆绑新商品套装的记录
			EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,18,1
				,@NewBarcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;
		END
			
		--记录捆绑新商品库存变化
		EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
			,@NewBarcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;
		
		--
		DECLARE @i INT, @j Int, @k Int;
		SET @i = CHARINDEX('|',@Items);	--Barcode
		SET @j = CHARINDEX('|',@Nums);	--Number
		SET @k = CHARINDEX('|',@Prices);--SysPrice
		
		DECLARE @code varchar(30);
		DECLARE @snum money;
		DECLARE @sprice money;
		DECLARE @SubNature SmallInt; SET @SubNature=0;
		
		--获取该捆绑商品的库存量
		DECLARE @CurNumber Money; SET @CurNumber=0;
		SELECT @CurNumber=StockNumber
		FROM dbo.Inventory
		where CompanyId=@CompanyId AND StoreId=@StoreId AND Barcode=@NewBarcode;
		
		IF(@CurNumber<@Number)
		BEGIN
			--若为该捆绑商品的库存量不足，则从子商品中拿
			DECLARE @Differ Money;
			IF(@CurNumber<=0)
			BEGIN
				SET @Differ=@Number;
			END
			ELSE
			BEGIN
				SET @Differ=@Number-@CurNumber;
			END
		
			WHILE(@i>0)
			BEGIN
				SET @code = LEFT(@Items,@i-1);
				SET @snum = LEFT(@Nums,@j-1) * @Differ;
				SET @sprice = LEFT(@Prices,@k-1);
				
				SET @Items = SUBSTRING(@Items,@i+1,LEN(@Items)-@i);
				SET @Nums = SUBSTRING(@Nums,@j+1,LEN(@Nums)-@j);
				SET @Prices = SUBSTRING(@Prices,@k+1,LEN(@Prices)-@k);
				
				SET @i = CHARINDEX('|',@Items);
				SET @j = CHARINDEX('|',@Nums);
				SET @k = CHARINDEX('|',@Prices);
				
				--校验分拆出来的子商品是否为组合商品
				SELECT @SubNature=[Nature]
				FROM dbo.ProductRecord WHERE CompanyId=@CompanyId AND Barcode=@code;
				
				IF(@SubNature=1)
				BEGIN
					--若子商品为组合商品，则继续分拆

					EXEC [dbo].[AffectInventory_GroupedGoods] @CompanyId,@StoreId,@Source,@OperatType
												,@code,@snum,@OperatId,@CreateUID,@CreateDT,@sprice;
				END
				ELSE IF(@SubNature=0)
				BEGIN
					--若子商品为单品，则无法再分拆，并直接影响该子商品库存量
					IF(@code=@NewBarcode)
					BEGIN
						SET @Source=@_source;
					END
					ELSE
					BEGIN
						SET @Source=10;	--动态执行：销售组合商品消减
						SET @sprice=(@SalePrice/@_SysPrice)*@sprice;
					END	
					
					EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
													,@code,@snum,@OperatId,@CreateUID,@CreateDT,@sprice;
				END
			END
			--	
			IF(@i<1 AND LEN(@Items)>0)
			BEGIN
				IF(@code=@NewBarcode)
				BEGIN
					SET @Source=@_source;
				END
				ELSE
				BEGIN
					SET @Source=10;	--动态执行：销售组合商品消减
					SET @Prices=(@SalePrice/@_SysPrice)*@Prices;
				END			
				--将影响分拆出来的最后一个子商品库存
				SET @Nums=@Nums*@Differ;
				EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
												,@Items,@Nums,@OperatId,@CreateUID,@CreateDT,@Prices;
			END
			
		END
	END		


END
GO
/****** Object:  StoredProcedure [dbo].[AffectInventory]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		蔡少发
-- Create date: 2016-03-22
-- Description:	影响库存量（统一出入口）
-- =============================================
CREATE PROCEDURE [dbo].[AffectInventory]
	@CompanyId  Int,
	@StoreId	Int,
	@Source		SmallInt,		--来源标识
	@Barcode	Varchar(30),
	@Number		Money,			--数量（正值）
	@OperatId	Varchar(40)='',	--出、入库ID 或配送ID 或销售流水号 或盘点批次等单据ID
	@CreateUID  Varchar(40),	--操作人UID
	@CreateDT	DATETIME,
	@SalePrice	Money=0			--销售单价，来源销售明细表（SaleDetail）中的均价（AveragePrice）。
AS
BEGIN TRAN Tran_Inventory;
BEGIN TRY
	DECLARE @tran_error int; SET @tran_error=0;
	DECLARE @OperatType SmallInt;
	SET @OperatType=1;	--1:增加，2:相减
	--
	/*来源标识（@Source）
	1、总部入库；2、总部出库；3、调拨入库；4、调拨出库；5、门店售后退换货入库；
	6、门店售后换货出库；7、拆分子商品入库；8、拆分父商品消减；9、销售商品消减出库；
	10、销售组合商品消减出库; 18、销售组合商品入库；11、门店收货；12、门店预约退换；
	13、总部批发出库; 14、总部退货;
	15、库存纠正(正、负)；16、总部报损出库；17、动态重新计算关联库存（内部自动调用）
	*/
	IF(@Source=2 OR @Source=4 OR @Source=6 OR @Source=8 OR @Source=9
		OR @Source=10 OR @Source=13 OR @Source=14 OR @Source=16)
	BEGIN
		SET @OperatType=2;
	END
	ELSE IF(@Source=12 AND @Number>0)
	BEGIN
		--退给供应商，正数=出库，负数=入库
		SET @OperatType=2;
	END	
	
	--
	IF(@Source=15)
	BEGIN
		--纠正库存
		EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
									,@Barcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;
	END
	ELSE
	BEGIN
		--识别条码分类，优先级：1.捆绑新条码、2.组合新条码、3.拆分新条码、4.单品条码
		DECLARE @BarcodeType SmallInt; SET @BarcodeType=0;
		
		IF EXISTS (SELECT b.* FROM dbo.Bundling as b
						INNER JOIN dbo.CommodityPromotion as cp on cp.Id=b.CommodityId
						AND cp.[State]=1
						AND cp.CompanyId=b.CompanyId
						AND cp.PromotionType=2
						AND dbo.Comm_F_NumIsInGroup(@StoreId,cp.StoreId)=1
						WHERE b.CompanyId=@CompanyId AND b.NewBarcode=@Barcode
						)
		BEGIN
			--1.捆绑新条码
			SET @BarcodeType=1;
		END
		ELSE IF EXISTS (SELECT * FROM dbo.ProductRecord
						WHERE [Nature]=1 AND CompanyId=@CompanyId AND Barcode=@Barcode)
		BEGIN
			--2.组合新条码
			SET @BarcodeType=2;
		END
		ELSE IF EXISTS (SELECT * FROM dbo.ProductRecord
						WHERE [Nature]=2 AND CompanyId=@CompanyId AND Barcode=@Barcode)
		BEGIN
			--3.拆分新条码
			SET @BarcodeType=3;
		END
		ELSE IF EXISTS (SELECT * FROM dbo.ProductRecord
						WHERE [Nature]=0 AND CompanyId=@CompanyId AND Barcode=@Barcode)
		BEGIN
			--4.单品条码
			SET @BarcodeType=4;
		END
		
		--
		SET NOCOUNT ON;
		IF(@BarcodeType=1)
		BEGIN
			--1.影响捆绑商品库存量
			EXEC dbo.[AffectInventory_BindGoods] @CompanyId,@StoreId,@Source,@OperatType
											,@Barcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;
		END
		ELSE IF(@BarcodeType=2)
		BEGIN
			--2.影响组合商品库存量
			EXEC dbo.[AffectInventory_GroupedGoods] @CompanyId,@StoreId,@Source,@OperatType
											,@Barcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;
		END
		ELSE IF(@BarcodeType=3)
		BEGIN
			--3.影响拆分商品库存量
			EXEC dbo.AffectInventory_SplitGoods @CompanyId,@StoreId,@Source,@OperatType
											,@Barcode,@Barcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;
		END
		ELSE
		BEGIN IF(@BarcodeType=4)
			--4.影响普通单品库存量
			EXEC dbo.[AffectInventory_SKU] @CompanyId,@StoreId,@Source,@OperatType
											,@Barcode,@Number,@OperatId,@CreateUID,@CreateDT,@SalePrice;
		END
    END
END TRY

BEGIN CATCH
	SELECT '异常：'+error_message();
	SET @tran_error=@tran_error+1;
END CATCH

IF (@tran_error>0)
BEGIN
	--失败
	ROLLBACK TRAN;
	RETURN '0';
	--SELECT '0'AS [State];
END
ELSE
BEGIN
	--成功
	COMMIT TRAN;
	RETURN '1';
	--SELECT '1' AS [State];
END
GO
/****** Object:  StoredProcedure [dbo].[AffectInventory_Sale]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<余雄文>
-- Create date: <2016-03-28>
-- Description:	<销售库存记录处理>
-- =============================================
CREATE PROCEDURE  [dbo].[AffectInventory_Sale]
    @CompanyId  Int,
	@StoreId	Int,
	@CustomOrderSn Varchar(50),
	@OrderState Int,
	@OrderType Int,
	@InInventory Int,
	@Barcode	Varchar(30),
	@Number		Money,
	@SalePrice	Money,			--销售单价
	@CreateUID  Varchar(40),	--操作人UID
	@CreateDT	Datetime
	AS
BEGIN
--PRINT @Barcode;
--PRINT @OrderState;
--print @OrderType;
--print @InInventory;
--print @Number;
--print @CreateUID;
--print @CreateDT;
--print @Number;
--PRINT @StoreId;
    DECLARE  @RESULT INT,
	@EXECRESULT INT;

	IF(@OrderType=0 AND @OrderState=0) --销售单处理
	BEGIN
		EXEC @EXECRESULT =dbo.[AffectInventory] @CompanyId,@StoreId,9,@Barcode,@Number,@CustomOrderSn,@CreateUID,@CreateDT,@SalePrice;
		SET @RESULT = 1
	END
	ELSE IF(@OrderType=1 AND @OrderState=0 AND @InInventory=0)--换货单处理
	BEGIN
		IF(@Number<0)
		BEGIN
			SET @Number =- @Number;
			EXEC @EXECRESULT =dbo.[AffectInventory] @CompanyId,@StoreId,5,@Barcode, @Number,@CustomOrderSn,@CreateUID,@CreateDT,@SalePrice;
		END
		ELSE IF(@Number>0)
		BEGIN
			EXEC @EXECRESULT =dbo.[AffectInventory] @CompanyId,@StoreId,6,@Barcode,@Number,@CustomOrderSn,@CreateUID,@CreateDT,@SalePrice;
		END
		SET @RESULT = 1
	END
	ELSE IF((@OrderType=2 AND @OrderState=0 AND @InInventory=0)OR(@OrderType=3 AND @OrderState=1 AND @InInventory=0))--退货单处理
	BEGIN
		IF(@Number<0)
		BEGIN
			SET @Number =- @Number;
		END
	    EXEC @EXECRESULT =dbo.[AffectInventory] @CompanyId,@StoreId,5,@Barcode,@Number,@CustomOrderSn,@CreateUID,@CreateDT,@SalePrice;
		SET @RESULT = 1
	END
	
	IF(@EXECRESULT=0)
	BEGIN
		RAISERROR('更新库存失败！',15,1);
	END
	ELSE
	BEGIN
		RETURN @RESULT
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[Auto_OrderToInventory_Test]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		余雄文
-- Modify date: 2016-08-20
-- Description:	处理销售单批量入库
-- =============================================
CREATE PROCEDURE  [dbo].[Auto_OrderToInventory_Test]
AS
BEGIN
	IF OBJECT_ID('tempdb.dbo.#tempOrders','U') IS NOT NULL DROP TABLE dbo.#tempOrders;
	IF OBJECT_ID('tempdb.dbo.#tempOrderSns','U') IS NOT NULL DROP TABLE dbo.#tempOrderSns;
	DECLARE @RowId int,
    @CompanyId  Int,
	@StoreId	Int,
	@OrderState Int,
	@OrderType Int,
	@InInventory Int,
	@Barcode	Varchar(30),
	@Number		Money,
	@SalePrice	Money,			--销售单价
	@CreateUID  Varchar(40),	--操作人UID
	@CreateDT	Datetime,
	@OrderSn varchar(50),
	@CustomOrderSn varchar(50),
	@ERRORNUM INT,
	@Result int;
	SET @Result=0;

	SELECT PAYSN into dbo.#tempOrderSns FROM SaleOrders a WHERE  a.IsProcess=0 and a.IsTest = 0 and a.InInventory=0;
	WHILE EXISTS(SELECT PAYSN FROM dbo.#tempOrderSns)
	BEGIN
		SET ROWCOUNT 1
			SELECT @OrderSn =PaySN FROM dbo.#tempOrderSns
		SET ROWCOUNT 0		  
	
		select b.[Id] Id,a.[CreateDt],a.[CreateUid],a.[InInventory],a.[State],a.[StoreId],a.[MachineSn],a.[CompanyId],a.[Type],b.[PaySn],b.[Barcode],b.[PurchaseNumber],b.AveragePrice,b.[ProductCode],a.ReturnDt,a.CustomOrderSn
		into dbo.#tempOrders 
		FROM SaleOrders a 
		left join SaleDetail b on a.PaySn = b.PaySn
		where  b.PaySn is not null and a.PaySN = @OrderSn order by a.PaySn

		BEGIN TRAN Tran_OrderToInventory;--事务
		BEGIN TRY
			SET @ERRORNUM =0
			WHILE EXISTS(SELECT Id FROM dbo.#tempOrders)
			BEGIN
				SET ROWCOUNT 1
				SELECT @RowId=Id, @CompanyId= CompanyId, @StoreId= StoreId,@OrderState= [State],@OrderType =[type],@InInventory =InInventory,@Barcode=Barcode,@Number=[PurchaseNumber],@SalePrice=[AveragePrice],@CreateUID=[CreateUid], @CreateDT =ISNULL(returnDT,[CreateDt]),@CustomOrderSn=[CustomOrderSn] FROM dbo.#tempOrders;
				SET ROWCOUNT 0		  
				EXEC  @Result =dbo.[AffectInventory_Sale] @CompanyId,@StoreId,@CustomOrderSn,@OrderState,@OrderType,@InInventory,@Barcode,@Number,@SalePrice,@CreateUID,@CreateDT;
				DELETE FROM dbo.#tempOrders WHERE Id =@RowId;
			END
		END TRY

		BEGIN CATCH
		  SET @ERRORNUM =1
		END CATCH
		
		IF(@ERRORNUM =1)--处理异常
		BEGIN		
			ROLLBACK TRAN Tran_OrderToInventory;
		END
		ELSE
		BEGIN
			UPDATE SaleOrders SET InInventory = @Result ,IsProcess =1 where PaySN = @OrderSn
        	COMMIT TRAN;
		END
	    IF OBJECT_ID('tempdb.dbo.#tempOrders','U') IS NOT NULL DROP TABLE dbo.#tempOrders;
		DELETE FROM dbo.#tempOrderSns WHERE PAYSN =@OrderSn;
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[Auto_OrderToInventory]    Script Date: 04/12/2017 14:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<余雄文>
-- Create date: <2016-03-28>
-- Description:	<处理销售单批量入库>
-- =============================================
CREATE PROCEDURE  [dbo].[Auto_OrderToInventory]
AS
BEGIN
 	IF OBJECT_ID('tempdb.dbo.#tempOrders','U') IS NOT NULL DROP TABLE dbo.#tempOrders;
	IF OBJECT_ID('tempdb.dbo.#tempOrderSns','U') IS NOT NULL DROP TABLE dbo.#tempOrderSns;
	DECLARE @RowId int,
    @CompanyId  Int,
	@StoreId	Int,
	@OrderState Int,
	@OrderType Int,
	@InInventory Int,
	@Barcode	Varchar(30),
	@Number		Money,
	@SalePrice	Money,			--销售单价
	@CreateUID  Varchar(40),	--操作人UID
	@CreateDT	Datetime,
	@OrderSn varchar(50),
	@CustomOrderSn varchar(50),
	@ERRORNUM INT,
	@Result int;
	SET @Result=0;

	SELECT CompanyId,PAYSN
	into dbo.#tempOrderSns
	FROM SaleOrders a WHERE a.IsProcess=0 and a.IsTest = 0 and a.InInventory=0;
	WHILE EXISTS(SELECT PAYSN FROM dbo.#tempOrderSns)
	BEGIN
		SET ROWCOUNT 1
			SELECT @CompanyId=CompanyId, @OrderSn =PaySN FROM dbo.#tempOrderSns;
		SET ROWCOUNT 0		  
	
		select b.[Id] Id,a.[CreateDt],a.[CreateUid],a.[InInventory],a.[State],a.[StoreId],a.[MachineSn],a.[CompanyId],a.[Type],b.[PaySn],b.[Barcode],b.[PurchaseNumber],b.AveragePrice,b.[ProductCode],a.ReturnDt,a.CustomOrderSn
		into dbo.#tempOrders 
		FROM SaleOrders a 
		left join SaleDetail b on a.PaySn = b.PaySn
		where  (b.PaySn is not null) and (a.PaySN = @OrderSn)
			and (b.CompanyId=a.CompanyId) and (a.CompanyId=@CompanyId)
		order by a.PaySn

		BEGIN TRANSACTION Tran_OrderToInventory;--事务
		BEGIN
			--SET @ERRORNUM =0
			WHILE EXISTS(SELECT Id FROM dbo.#tempOrders)
			BEGIN
				SET ROWCOUNT 1
				SELECT @RowId=Id, @CompanyId= CompanyId, @StoreId= StoreId,@OrderState= [State],@OrderType =[type],@InInventory =InInventory,@Barcode=Barcode,@Number=[PurchaseNumber],@SalePrice=[AveragePrice],@CreateUID=[CreateUid], @CreateDT =ISNULL(returnDT,[CreateDt]),@CustomOrderSn=[CustomOrderSn] FROM dbo.#tempOrders;
				SET ROWCOUNT 0		  
				EXEC  @Result =dbo.[AffectInventory_Sale] @CompanyId,@StoreId,@CustomOrderSn,@OrderState,@OrderType,@InInventory,@Barcode,@Number,@SalePrice,@CreateUID,@CreateDT;
				DELETE FROM dbo.#tempOrders WHERE Id =@RowId and CompanyId=@CompanyId;
			END
 		END
 		
		DELETE FROM dbo.#tempOrderSns WHERE PAYSN =@OrderSn and CompanyId=@CompanyId;
		IF OBJECT_ID('tempdb.dbo.#tempOrders','U') IS NOT NULL DROP TABLE dbo.#tempOrders;
		
 		IF @@ERROR<>0
 		BEGIN
 			ROLLBACK TRAN Tran_OrderToInventory; 
 		END
 		ELSE
 		BEGIN
			UPDATE SaleOrders SET InInventory=@Result,IsProcess =1 where PaySN=@OrderSn and CompanyId=@CompanyId;
			COMMIT TRAN Tran_OrderToInventory;
		END
 	END 
 END
GO
/****** Object:  Default [DF_SysWebSetting_CompanyId]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysWebSetting] ADD  CONSTRAINT [DF_SysWebSetting_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysUserInfo_CompanyId]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysUserInfo] ADD  CONSTRAINT [DF_SysUserInfo_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysUserInfo_Sex]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysUserInfo] ADD  CONSTRAINT [DF_SysUserInfo_Sex]  DEFAULT ((1)) FOR [Sex]
GO
/****** Object:  Default [DF_SysUserInfo_Status]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysUserInfo] ADD  CONSTRAINT [DF_SysUserInfo_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_SysUserInfo_LoginDT]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysUserInfo] ADD  CONSTRAINT [DF_SysUserInfo_LoginDT]  DEFAULT (getdate()) FOR [LoginDT]
GO
/****** Object:  Default [DF_SysUserInfo_LoginNum]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysUserInfo] ADD  CONSTRAINT [DF_SysUserInfo_LoginNum]  DEFAULT ((0)) FOR [LoginNum]
GO
/****** Object:  Default [DF_SysUserInfo_CreateDT]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysUserInfo] ADD  CONSTRAINT [DF_SysUserInfo_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_SysUserInfo_IsShopManager]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysUserInfo] ADD  CONSTRAINT [DF_SysUserInfo_IsShopManager]  DEFAULT ((0)) FOR [IsShopManager]
GO
/****** Object:  Default [DF_SysStoreUserInfo_Sex]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysStoreUserInfo] ADD  CONSTRAINT [DF_SysStoreUserInfo_Sex]  DEFAULT ((1)) FOR [Sex]
GO
/****** Object:  Default [DF_SysStoreUserInfo_LoginDT]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysStoreUserInfo] ADD  CONSTRAINT [DF_SysStoreUserInfo_LoginDT]  DEFAULT (getdate()) FOR [LoginDT]
GO
/****** Object:  Default [DF_SysStoreUserInfo_CreateDT]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysStoreUserInfo] ADD  CONSTRAINT [DF_SysStoreUserInfo_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_SysStoreUserInfo_CompanyId]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysStoreUserInfo] ADD  CONSTRAINT [DF_SysStoreUserInfo_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF__SysStoreU__SyncI__241E3C13]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysStoreUserInfo] ADD  CONSTRAINT [DF__SysStoreU__SyncI__241E3C13]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_SysRoles_CompanyId]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysRoles] ADD  CONSTRAINT [DF_SysRoles_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysRoles_LimitsCode]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysRoles] ADD  CONSTRAINT [DF_SysRoles_LimitsCode]  DEFAULT ((-1)) FOR [LimitsIds]
GO
/****** Object:  Default [DF_SysRoles_Status]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysRoles] ADD  CONSTRAINT [DF_SysRoles_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_SysRoles_AllowDel]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysRoles] ADD  CONSTRAINT [DF_SysRoles_AllowDel]  DEFAULT ((1)) FOR [AllowDel]
GO
/****** Object:  Default [DF_SysRoles_AllowAward]    Script Date: 04/12/2017 14:11:32 ******/
ALTER TABLE [dbo].[SysRoles] ADD  CONSTRAINT [DF_SysRoles_AllowAward]  DEFAULT ((1)) FOR [ShowView]
GO
/****** Object:  Default [DF_SysPaymentSetting_State]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysPaymentSetting] ADD  CONSTRAINT [DF_SysPaymentSetting_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_SysPaymentSetting_CreateDT]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysPaymentSetting] ADD  CONSTRAINT [DF_SysPaymentSetting_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_SysPaymentSetting_AlterDT]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysPaymentSetting] ADD  CONSTRAINT [DF_SysPaymentSetting_AlterDT]  DEFAULT (getdate()) FOR [AlterDT]
GO
/****** Object:  Default [DF_SysPaymentSetting_CompanyId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysPaymentSetting] ADD  CONSTRAINT [DF_SysPaymentSetting_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysMenus_CompanyId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysMenus] ADD  CONSTRAINT [DF_SysMenus_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysMenus_MenuId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysMenus] ADD  CONSTRAINT [DF_SysMenus_MenuId]  DEFAULT ((-1)) FOR [MenuId]
GO
/****** Object:  Default [DF_Sys_Menus_PId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysMenus] ADD  CONSTRAINT [DF_Sys_Menus_PId]  DEFAULT ((-1)) FOR [PMenuId]
GO
/****** Object:  Default [DF_Sys_Menus_SortOrder]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysMenus] ADD  CONSTRAINT [DF_Sys_Menus_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_SysMenus_Type]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysMenus] ADD  CONSTRAINT [DF_SysMenus_Type]  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF_Sys_Menus_Status]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysMenus] ADD  CONSTRAINT [DF_Sys_Menus_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_SysMailSender_CompanyId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysMailSender] ADD  CONSTRAINT [DF_SysMailSender_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysMailReceive_CompanyId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysMailReceive] ADD  CONSTRAINT [DF_SysMailReceive_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysLog_CompanyId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysLog] ADD  CONSTRAINT [DF_SysLog_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysLog_CreateDT]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysLog] ADD  CONSTRAINT [DF_SysLog_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_SysLimits_CompanyId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysLimits] ADD  CONSTRAINT [DF_SysLimits_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysLimits_LimitId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysLimits] ADD  CONSTRAINT [DF_SysLimits_LimitId]  DEFAULT ((0)) FOR [LimitId]
GO
/****** Object:  Default [DF_SysLimits_SortOrder]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysLimits] ADD  CONSTRAINT [DF_SysLimits_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_SysLimits_Status]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysLimits] ADD  CONSTRAINT [DF_SysLimits_Status]  DEFAULT ((2)) FOR [Status]
GO
/****** Object:  Default [DF_SysDepartments_CompanyId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDepartments] ADD  CONSTRAINT [DF_SysDepartments_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Sys_Departments_Type]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDepartments] ADD  CONSTRAINT [DF_Sys_Departments_Type]  DEFAULT ((2)) FOR [Type]
GO
/****** Object:  Default [DF_Sys_Departments_PId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDepartments] ADD  CONSTRAINT [DF_Sys_Departments_PId]  DEFAULT ((0)) FOR [PDepId]
GO
/****** Object:  Default [DF_Sys_Departments_SortOrder]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDepartments] ADD  CONSTRAINT [DF_Sys_Departments_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_Sys_Departments_ManagerUId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDepartments] ADD  CONSTRAINT [DF_Sys_Departments_ManagerUId]  DEFAULT ((-1)) FOR [ManagerUId]
GO
/****** Object:  Default [DF_Sys_Departments_DeputyUId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDepartments] ADD  CONSTRAINT [DF_Sys_Departments_DeputyUId]  DEFAULT ((-1)) FOR [DeputyUId]
GO
/****** Object:  Default [DF_Sys_Departments_Status]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDepartments] ADD  CONSTRAINT [DF_Sys_Departments_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_SysDataDictionary_CompanyId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDataDictionary] ADD  CONSTRAINT [DF_SysDataDictionary_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysDataDictionary_SortOrder]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDataDictionary] ADD  CONSTRAINT [DF_SysDataDictionary_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_SysDataDictionary_Depth]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDataDictionary] ADD  CONSTRAINT [DF_SysDataDictionary_Depth]  DEFAULT ((1)) FOR [Depth]
GO
/****** Object:  Default [DF_SysDataDictionary_Status]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDataDictionary] ADD  CONSTRAINT [DF_SysDataDictionary_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF__SysDataDi__SyncI__29D71569]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysDataDictionary] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_SysCustomMenus_CompanyId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysCustomMenus] ADD  CONSTRAINT [DF_SysCustomMenus_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SysCustomMenus_Type]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysCustomMenus] ADD  CONSTRAINT [DF_SysCustomMenus_Type]  DEFAULT ((-1)) FOR [Type]
GO
/****** Object:  Default [DF_SysCustomMenus_ObjId]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysCustomMenus] ADD  CONSTRAINT [DF_SysCustomMenus_ObjId]  DEFAULT ((-1)) FOR [ObjId]
GO
/****** Object:  Default [DF_SysCustomMenus_MenuIds]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysCustomMenus] ADD  CONSTRAINT [DF_SysCustomMenus_MenuIds]  DEFAULT ((-1)) FOR [MenuIds]
GO
/****** Object:  Default [DF_SysCustomMenus_SortOrder]    Script Date: 04/12/2017 14:11:33 ******/
ALTER TABLE [dbo].[SysCustomMenus] ADD  CONSTRAINT [DF_SysCustomMenus_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_Supplier_CompanyId]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Supplier_ClassifyId]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_ClassifyId]  DEFAULT ((-1)) FOR [ClassifyId]
GO
/****** Object:  Default [DF_Supplier_Designee]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Designee]  DEFAULT ((-1)) FOR [Designee]
GO
/****** Object:  Default [DF_Supplier_MasterState]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_MasterState]  DEFAULT ((0)) FOR [MasterState]
GO
/****** Object:  Default [DF_Supplier_CreateDT]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_StoredValueCardPayRecord_Balance]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[StoredValueCardPayRecord] ADD  CONSTRAINT [DF_StoredValueCardPayRecord_Balance]  DEFAULT ((0)) FOR [Balance]
GO
/****** Object:  Default [DF_StockTakingLog_State]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[StockTakingLog] ADD  CONSTRAINT [DF_StockTakingLog_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF__StockTaki__Sourc__61873D06]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[StockTakingLog] ADD  DEFAULT ((1)) FOR [Source]
GO
/****** Object:  Default [DF_StockTaking_LockNumber]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[StockTaking] ADD  CONSTRAINT [DF_StockTaking_LockNumber]  DEFAULT ((0)) FOR [LockNumber]
GO
/****** Object:  Default [DF_StockTaking_ActualNumber]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[StockTaking] ADD  CONSTRAINT [DF_StockTaking_ActualNumber]  DEFAULT ((0)) FOR [ActualNumber]
GO
/****** Object:  Default [DF_StockTaking_Sure]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[StockTaking] ADD  CONSTRAINT [DF_StockTaking_Sure]  DEFAULT ((0)) FOR [Sure]
GO
/****** Object:  Default [DF_StockTaking_CreateDT]    Script Date: 04/12/2017 14:11:35 ******/
ALTER TABLE [dbo].[StockTaking] ADD  CONSTRAINT [DF_StockTaking_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_OutboundList_OutboundNumber]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OutboundList] ADD  CONSTRAINT [DF_OutboundList_OutboundNumber]  DEFAULT ((1)) FOR [OutboundNumber]
GO
/****** Object:  Default [DF_OutboundList_BuyPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OutboundList] ADD  CONSTRAINT [DF_OutboundList_BuyPrice]  DEFAULT ((0)) FOR [OutPrice]
GO
/****** Object:  Default [DF_OutboundList_SysPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OutboundList] ADD  CONSTRAINT [DF_OutboundList_SysPrice]  DEFAULT ((0)) FOR [SysPrice]
GO
/****** Object:  Default [DF_OutboundList_B]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OutboundList] ADD  CONSTRAINT [DF_OutboundList_B]  DEFAULT ((0)) FOR [BuyPrice]
GO
/****** Object:  Default [DF_SaleDetail_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleDetail] ADD  CONSTRAINT [DF_SaleDetail_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SaleDetail_PurchaseNumber]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleDetail] ADD  CONSTRAINT [DF_SaleDetail_PurchaseNumber]  DEFAULT ((0)) FOR [PurchaseNumber]
GO
/****** Object:  Default [DF_SaleDetail_BuyPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleDetail] ADD  CONSTRAINT [DF_SaleDetail_BuyPrice]  DEFAULT ((0)) FOR [BuyPrice]
GO
/****** Object:  Default [DF_SaleDetail_SysPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleDetail] ADD  CONSTRAINT [DF_SaleDetail_SysPrice]  DEFAULT ((0)) FOR [SysPrice]
GO
/****** Object:  Default [DF_SaleDetail_ActualPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleDetail] ADD  CONSTRAINT [DF_SaleDetail_ActualPrice]  DEFAULT ((0)) FOR [ActualPrice]
GO
/****** Object:  Default [DF_SaleDetail_SalesClassifyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleDetail] ADD  CONSTRAINT [DF_SaleDetail_SalesClassifyId]  DEFAULT ((-1)) FOR [SalesClassifyId]
GO
/****** Object:  Default [DF__SaleDetai__SyncI__2DA7A64D]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleDetail] ADD  CONSTRAINT [DF__SaleDetai__SyncI__2DA7A64D]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF__SaleCommod__Mode__5090EFD7]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleCommodityHistory] ADD  DEFAULT ((1)) FOR [Mode]
GO
/****** Object:  Default [DF_STHouseMove_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[STHouseMove] ADD  CONSTRAINT [DF_STHouseMove_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_STHouseMove_DeliveryQuantity]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[STHouseMove] ADD  CONSTRAINT [DF_STHouseMove_DeliveryQuantity]  DEFAULT ((0)) FOR [DeliveryQuantity]
GO
/****** Object:  Default [DF_STHouseMove_ActualQuantity]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[STHouseMove] ADD  CONSTRAINT [DF_STHouseMove_ActualQuantity]  DEFAULT ((0)) FOR [ActualQuantity]
GO
/****** Object:  Default [DF_STHouseMove_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[STHouseMove] ADD  CONSTRAINT [DF_STHouseMove_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF_STHouseMove_StockOut]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[STHouseMove] ADD  CONSTRAINT [DF_STHouseMove_StockOut]  DEFAULT ((0)) FOR [StockOut]
GO
/****** Object:  Default [DF_ReturnStageRules_ReturnType]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ReturnStageRules] ADD  CONSTRAINT [DF_ReturnStageRules_ReturnType]  DEFAULT ((0)) FOR [ReturnType]
GO
/****** Object:  Default [DF_ReturnStageRules_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ReturnStageRules] ADD  CONSTRAINT [DF_ReturnStageRules_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_ReturnRules_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ReturnRules] ADD  CONSTRAINT [DF_ReturnRules_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ReturnRules_ExpiryStart]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ReturnRules] ADD  CONSTRAINT [DF_ReturnRules_ExpiryStart]  DEFAULT (getdate()) FOR [ExpiryStart]
GO
/****** Object:  Default [DF_ReturnRules_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ReturnRules] ADD  CONSTRAINT [DF_ReturnRules_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_ReturnRules_AgingType]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ReturnRules] ADD  CONSTRAINT [DF_ReturnRules_AgingType]  DEFAULT ((0)) FOR [AgingType]
GO
/****** Object:  Default [DF_ReturnRules_LimitNum]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ReturnRules] ADD  CONSTRAINT [DF_ReturnRules_LimitNum]  DEFAULT ((-1)) FOR [LimitNum]
GO
/****** Object:  Default [DF_ReturnRules_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ReturnRules] ADD  CONSTRAINT [DF_ReturnRules_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_RechargeGiftsStage_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGiftsStage] ADD  CONSTRAINT [DF_RechargeGiftsStage_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_RechargeGiftsStage_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGiftsStage] ADD  CONSTRAINT [DF_RechargeGiftsStage_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_RechargeGifts_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGifts] ADD  CONSTRAINT [DF_RechargeGifts_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_RechargeGifts_RuleId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGifts] ADD  CONSTRAINT [DF_RechargeGifts_RuleId]  DEFAULT (replace(newid(),'-','')) FOR [RuleId]
GO
/****** Object:  Default [DF_RechargeGifts_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGifts] ADD  CONSTRAINT [DF_RechargeGifts_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_RechargeGifts_Stage]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGifts] ADD  CONSTRAINT [DF_RechargeGifts_Stage]  DEFAULT ((0)) FOR [Stage]
GO
/****** Object:  Default [DF_RechargeGifts_GiftProject]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGifts] ADD  CONSTRAINT [DF_RechargeGifts_GiftProject]  DEFAULT ((1)) FOR [GiftProject]
GO
/****** Object:  Default [DF_RechargeGifts_Category]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGifts] ADD  CONSTRAINT [DF_RechargeGifts_Category]  DEFAULT ((0)) FOR [Category]
GO
/****** Object:  Default [DF_RechargeGifts_LimitNumber]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGifts] ADD  CONSTRAINT [DF_RechargeGifts_LimitNumber]  DEFAULT ((-1)) FOR [LimitNumber]
GO
/****** Object:  Default [DF_RechargeGifts_GiftAging]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGifts] ADD  CONSTRAINT [DF_RechargeGifts_GiftAging]  DEFAULT ((0)) FOR [GiftAging]
GO
/****** Object:  Default [DF_RechargeGifts_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[RechargeGifts] ADD  CONSTRAINT [DF_RechargeGifts_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_Receipts_CategoryId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Receipts] ADD  CONSTRAINT [DF_Receipts_CategoryId]  DEFAULT ((-1)) FOR [CategoryId]
GO
/****** Object:  Default [DF_Receipts_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Receipts] ADD  CONSTRAINT [DF_Receipts_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_Receipts_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Receipts] ADD  CONSTRAINT [DF_Receipts_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_PromotionBlendList_BrandSN]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PromotionBlendList] ADD  CONSTRAINT [DF_PromotionBlendList_BrandSN]  DEFAULT ((0)) FOR [BrandSN]
GO
/****** Object:  Default [DF__Promotion__SyncI__363CEC4E]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PromotionBlendList] ADD  CONSTRAINT [DF__Promotion__SyncI__363CEC4E]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_PromotionBlend_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PromotionBlend] ADD  CONSTRAINT [DF_PromotionBlend_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_PromotionBlend_PriceRange]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PromotionBlend] ADD  CONSTRAINT [DF_PromotionBlend_PriceRange]  DEFAULT ((0)) FOR [PriceRange]
GO
/****** Object:  Default [DF_PromotionBlend_AllowedAccumulate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PromotionBlend] ADD  CONSTRAINT [DF_PromotionBlend_AllowedAccumulate]  DEFAULT ((1)) FOR [AllowedAccumulate]
GO
/****** Object:  Default [DF__Promotion__SyncI__308412F8]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PromotionBlend] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_ProductTradePrice_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductTradePrice] ADD  CONSTRAINT [DF_ProductTradePrice_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ProductRecord_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ProductRecord_BrandSN]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_BrandSN]  DEFAULT ((-1)) FOR [BrandSN]
GO
/****** Object:  Default [DF_ProductRecord_CityId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_CityId]  DEFAULT ((-1)) FOR [CityId]
GO
/****** Object:  Default [DF_ProductRecord_BigCategorySN]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_BigCategorySN]  DEFAULT ((-1)) FOR [CategorySN]
GO
/****** Object:  Default [DF_ProductRecord_BigUnitId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_BigUnitId]  DEFAULT ((-1)) FOR [BigUnitId]
GO
/****** Object:  Default [DF_ProductRecord_SubUnitId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_SubUnitId]  DEFAULT ((-1)) FOR [SubUnitId]
GO
/****** Object:  Default [DF_ProductRecord_BuyPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_BuyPrice]  DEFAULT ((0)) FOR [BuyPrice]
GO
/****** Object:  Default [DF_ProductRecord_SysPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_SysPrice]  DEFAULT ((0)) FOR [SysPrice]
GO
/****** Object:  Default [DF_ProductRecord_TradePrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_TradePrice]  DEFAULT ((0)) FOR [TradePrice]
GO
/****** Object:  Default [DF_ProductRecord_JoinPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_JoinPrice]  DEFAULT ((0)) FOR [JoinPrice]
GO
/****** Object:  Default [DF_ProductRecord_Nature]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_Nature]  DEFAULT ((0)) FOR [Nature]
GO
/****** Object:  Default [DF_ProductRecord_Favorable]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_Favorable]  DEFAULT ((1)) FOR [Favorable]
GO
/****** Object:  Default [DF_ProductRecord_Expiry]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_Expiry]  DEFAULT ((0)) FOR [Expiry]
GO
/****** Object:  Default [DF_ProductRecord_ExpiryUnit]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_ExpiryUnit]  DEFAULT ((1)) FOR [ExpiryUnit]
GO
/****** Object:  Default [DF_ProductRecord_ValuationType]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_ValuationType]  DEFAULT ((1)) FOR [ValuationType]
GO
/****** Object:  Default [DF_ProductRecord_IsReturnSale]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_IsReturnSale]  DEFAULT ((1)) FOR [IsReturnSale]
GO
/****** Object:  Default [DF_ProductRecord_IsAcceptOrder]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_IsAcceptOrder]  DEFAULT ((1)) FOR [IsAcceptOrder]
GO
/****** Object:  Default [DF_ProductRecord_RaterUID]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_RaterUID]  DEFAULT ((-1)) FOR [RaterUID]
GO
/****** Object:  Default [InventoryWarning_Def]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [InventoryWarning_Def]  DEFAULT ((5)) FOR [InventoryWarning]
GO
/****** Object:  Default [ValidityWarning_Def]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [ValidityWarning_Def]  DEFAULT ((5)) FOR [ValidityWarning]
GO
/****** Object:  Default [DF_ProductRecord_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF_ProductRecord_StockRate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_StockRate]  DEFAULT ((17)) FOR [StockRate]
GO
/****** Object:  Default [DF_ProductRecord_SaleRate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_SaleRate]  DEFAULT ((17)) FOR [SaleRate]
GO
/****** Object:  Default [DF_ProductRecord_InventoryWarningMax]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_InventoryWarningMax]  DEFAULT ((5)) FOR [InventoryWarningMax]
GO
/****** Object:  Default [DF_ProductRecord_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF_ProductRecord_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF__ProductRe__IsRel__0EE3280B]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF__ProductRe__IsRel__0EE3280B]  DEFAULT ((0)) FOR [IsRelationship]
GO
/****** Object:  Default [DF__ProductRe__SyncI__391958F9]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductRecord] ADD  CONSTRAINT [DF__ProductRe__SyncI__391958F9]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_ProductMultSupplier_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductMultSupplier] ADD  CONSTRAINT [DF_ProductMultSupplier_CompanyId]  DEFAULT ((0)) FOR [CompanyId]
GO
/****** Object:  Default [DF__ProductMu__SyncI__41AE9EFA]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductMultSupplier] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_ProductMultPrice_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductMultPrice] ADD  CONSTRAINT [DF_ProductMultPrice_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF__ProductMu__SyncI__3CE9E9DD]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductMultPrice] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_ProductImage_Status]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductImage] ADD  CONSTRAINT [DF_ProductImage_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_ProductGroup_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF_ProductGroup_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ProductGroup_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF_ProductGroup_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF__ProductGr__SyncI__28E2F130]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductGroup] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_ProductChangePriceList_OldBuyPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductChangePriceList] ADD  CONSTRAINT [DF_ProductChangePriceList_OldBuyPrice]  DEFAULT ((1)) FOR [OldBuyPrice]
GO
/****** Object:  Default [DF_ProductChangePriceList_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductChangePriceList] ADD  CONSTRAINT [DF_ProductChangePriceList_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF__ProductCh__SyncI__40BA7AC1]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductChangePriceList] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_ProductChangePrice_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductChangePrice] ADD  CONSTRAINT [DF_ProductChangePrice_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ProductChangePrice_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductChangePrice] ADD  CONSTRAINT [DF_ProductChangePrice_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_ProductChangePrice_AuditorDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductChangePrice] ADD  CONSTRAINT [DF_ProductChangePrice_AuditorDT]  DEFAULT (getdate()) FOR [AuditorDT]
GO
/****** Object:  Default [DF_ProductChangePrice_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductChangePrice] ADD  CONSTRAINT [DF_ProductChangePrice_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF__ProductCh__SyncI__3DDE0E16]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductChangePrice] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_ProductCategory_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ProductCategory_Grade]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Grade]  DEFAULT ((1)) FOR [Grade]
GO
/****** Object:  Default [DF_ProductCategory_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF__ProductCa__SyncI__2E9BCA86]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_ProductBrand_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductBrand] ADD  CONSTRAINT [DF_ProductBrand_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ProductBrand_ClassifyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductBrand] ADD  CONSTRAINT [DF_ProductBrand_ClassifyId]  DEFAULT ((-1)) FOR [ClassifyId]
GO
/****** Object:  Default [DF_ProductBrand_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductBrand] ADD  CONSTRAINT [DF_ProductBrand_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF__ProductBr__SyncI__3ED2324F]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ProductBrand] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_ScaleHistories_SysPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ScaleHistory] ADD  CONSTRAINT [DF_ScaleHistories_SysPrice]  DEFAULT ((0)) FOR [SysPrice]
GO
/****** Object:  Default [DF_ScaleHistories_SubUnitId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ScaleHistory] ADD  CONSTRAINT [DF_ScaleHistories_SubUnitId]  DEFAULT ((-1)) FOR [SubUnitId]
GO
/****** Object:  Default [DF_SalesReturnsDetailed_Number]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SalesReturnsDetailed] ADD  CONSTRAINT [DF_SalesReturnsDetailed_Number]  DEFAULT ((1)) FOR [Number]
GO
/****** Object:  Default [DF_SalesReturnsDetailed_Price]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SalesReturnsDetailed] ADD  CONSTRAINT [DF_SalesReturnsDetailed_Price]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF_SalesReturnsDetailed_TradingPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SalesReturnsDetailed] ADD  CONSTRAINT [DF_SalesReturnsDetailed_TradingPrice]  DEFAULT ((0)) FOR [TradingPrice]
GO
/****** Object:  Default [DF_SalesReturns_ReturnPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SalesReturns] ADD  CONSTRAINT [DF_SalesReturns_ReturnPrice]  DEFAULT ((0)) FOR [ReturnPrice]
GO
/****** Object:  Default [DF_SalesReturns_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SalesReturns] ADD  CONSTRAINT [DF_SalesReturns_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_SalesReturns_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SalesReturns] ADD  CONSTRAINT [DF_SalesReturns_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF_SalesReturns_Source]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SalesReturns] ADD  CONSTRAINT [DF_SalesReturns_Source]  DEFAULT ((0)) FOR [Source]
GO
/****** Object:  Default [DF_SalesRecord_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SalesRecord] ADD  CONSTRAINT [DF_SalesRecord_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF__SalesReco__SyncI__33607FA3]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SalesRecord] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_SaleOrders_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_SaleOrders_ProductCount]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_ProductCount]  DEFAULT ((0)) FOR [ProductCount]
GO
/****** Object:  Default [DF_SaleOrders_TotalAmount]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
/****** Object:  Default [DF_SaleOrders_OrderDiscount]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_OrderDiscount]  DEFAULT ((0)) FOR [OrderDiscount]
GO
/****** Object:  Default [DF_SaleOrders_PreferentialPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_PreferentialPrice]  DEFAULT ((0)) FOR [PreferentialPrice]
GO
/****** Object:  Default [DF_SaleOrders_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_SaleOrders_Status]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_Status]  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF__SaleOrder__State__420DC656]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF__SaleOrder__State__420DC656]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_SaleOrders_AtivityId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_AtivityId]  DEFAULT ((0)) FOR [ActivityId]
GO
/****** Object:  Default [DF_SaleOrders_IsTest]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_IsTest]  DEFAULT ((0)) FOR [IsTest]
GO
/****** Object:  Default [DF_SaleOrders_InInventory]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_InInventory]  DEFAULT ((0)) FOR [InInventory]
GO
/****** Object:  Default [DF_SaleOrders_IsProcess]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_IsProcess]  DEFAULT ((0)) FOR [IsProcess]
GO
/****** Object:  Default [DF_SaleOrders_SyncItemId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrders] ADD  CONSTRAINT [DF_SaleOrders_SyncItemId]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_SaleOrderHistory_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[SaleOrderHistory] ADD  CONSTRAINT [DF_SaleOrderHistory_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_Coupons_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupons_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Coupons_StoreId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupons_StoreId]  DEFAULT ((-1)) FOR [StoreId]
GO
/****** Object:  Default [DF_Coupons_UsedDate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupons_UsedDate]  DEFAULT (getdate()) FOR [UsedDate]
GO
/****** Object:  Default [DF_CouponCardDetail_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CouponCardDetail] ADD  CONSTRAINT [DF_CouponCardDetail_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_CouponApplyDetails_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CouponApplyDetails] ADD  CONSTRAINT [DF_CouponApplyDetails_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Contract_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Contract_ClassifyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_ClassifyId]  DEFAULT ((-1)) FOR [ClassifyId]
GO
/****** Object:  Default [DF_Contract_Version]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_Version]  DEFAULT ((1)) FOR [Version]
GO
/****** Object:  Default [DF_Contract_CreateUID]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_CreateUID]  DEFAULT ((-1)) FOR [CreateUID]
GO
/****** Object:  Default [DF_Contract_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_Contract_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Contract] ADD  CONSTRAINT [DF_Contract_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_ConsumptionPayment_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ConsumptionPayment] ADD  CONSTRAINT [DF_ConsumptionPayment_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ConsumptionPayment_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ConsumptionPayment] ADD  CONSTRAINT [DF_ConsumptionPayment_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_ConsumptionPayment_Change]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ConsumptionPayment] ADD  CONSTRAINT [DF_ConsumptionPayment_Change]  DEFAULT ((0)) FOR [Change]
GO
/****** Object:  Default [DF_ConsumptionPayment_Received]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ConsumptionPayment] ADD  CONSTRAINT [DF_ConsumptionPayment_Received]  DEFAULT ((0)) FOR [Received]
GO
/****** Object:  Default [DF__Consumpti__SyncI__3548C815]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ConsumptionPayment] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_CommodityReturnsDetail_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityReturnsDetail] ADD  CONSTRAINT [DF_CommodityReturnsDetail_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_CommodityReturns_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityReturns] ADD  CONSTRAINT [DF_CommodityReturns_CompanyId]  DEFAULT ((0)) FOR [CompanyId]
GO
/****** Object:  Default [DF_CommodityReturns_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityReturns] ADD  CONSTRAINT [DF_CommodityReturns_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_CommodityPromotion_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityPromotion] ADD  CONSTRAINT [DF_CommodityPromotion_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_CommodityPromotion_CustomerObj]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityPromotion] ADD  CONSTRAINT [DF_CommodityPromotion_CustomerObj]  DEFAULT ((0)) FOR [CustomerObj]
GO
/****** Object:  Default [DF_CommodityPromotion_Timeliness]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityPromotion] ADD  CONSTRAINT [DF_CommodityPromotion_Timeliness]  DEFAULT ((0)) FOR [Timeliness]
GO
/****** Object:  Default [DF_CommodityPromotion_RestrictionBuyNum]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityPromotion] ADD  CONSTRAINT [DF_CommodityPromotion_RestrictionBuyNum]  DEFAULT ((0)) FOR [RestrictionBuyNum]
GO
/****** Object:  Default [DF_CommodityPromotion_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityPromotion] ADD  CONSTRAINT [DF_CommodityPromotion_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_CommodityPromotion_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityPromotion] ADD  CONSTRAINT [DF_CommodityPromotion_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF__Commodity__SyncI__2ACB39A2]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityPromotion] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_CommodityDiscount_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityDiscount] ADD  CONSTRAINT [DF_CommodityDiscount_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_CommodityDiscount_DiscountRate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityDiscount] ADD  CONSTRAINT [DF_CommodityDiscount_DiscountRate]  DEFAULT ((0)) FOR [DiscountRate]
GO
/****** Object:  Default [DF_CommodityDiscount_MinPurchaseNum]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityDiscount] ADD  CONSTRAINT [DF_CommodityDiscount_MinPurchaseNum]  DEFAULT ((1)) FOR [MinPurchaseNum]
GO
/****** Object:  Default [DF_CommodityDiscount_Way]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityDiscount] ADD  CONSTRAINT [DF_CommodityDiscount_Way]  DEFAULT ((1)) FOR [Way]
GO
/****** Object:  Default [DF__Commodity__SyncI__326C5B6A]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CommodityDiscount] ADD  CONSTRAINT [DF__Commodity__SyncI__326C5B6A]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_Commodity_ExpiryDate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Commodity] ADD  CONSTRAINT [DF_Commodity_ExpiryDate]  DEFAULT ((-1)) FOR [ExpiryDate]
GO
/****** Object:  Default [DF_Commodity_ExpiryDateUnit]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Commodity] ADD  CONSTRAINT [DF_Commodity_ExpiryDateUnit]  DEFAULT ((1)) FOR [ExpiryDateUnit]
GO
/****** Object:  Default [DF_Commodity_StockNumber]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Commodity] ADD  CONSTRAINT [DF_Commodity_StockNumber]  DEFAULT ((0)) FOR [StockNumber]
GO
/****** Object:  Default [DF_ChangePriceLog_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ChangePriceLog] ADD  CONSTRAINT [DF_ChangePriceLog_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ChangePriceLog_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ChangePriceLog] ADD  CONSTRAINT [DF_ChangePriceLog_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_CardInfo_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CardInfo] ADD  CONSTRAINT [DF_CardInfo_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_CardInfo_MinRecharge]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CardInfo] ADD  CONSTRAINT [DF_CardInfo_MinRecharge]  DEFAULT ((0)) FOR [MinRecharge]
GO
/****** Object:  Default [DF_CardInfo_DefaultPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CardInfo] ADD  CONSTRAINT [DF_CardInfo_DefaultPrice]  DEFAULT ((0)) FOR [DefaultPrice]
GO
/****** Object:  Default [DF_CardInfo_DefaultIntegr]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CardInfo] ADD  CONSTRAINT [DF_CardInfo_DefaultIntegr]  DEFAULT ((0)) FOR [DefaultIntegr]
GO
/****** Object:  Default [DF_CardInfo_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CardInfo] ADD  CONSTRAINT [DF_CardInfo_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_CardInfo_SyncItemId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[CardInfo] ADD  CONSTRAINT [DF_CardInfo_SyncItemId]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_BundlingList_Number]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[BundlingList] ADD  CONSTRAINT [DF_BundlingList_Number]  DEFAULT ((1)) FOR [Number]
GO
/****** Object:  Default [DF_BundlingList_SysPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[BundlingList] ADD  CONSTRAINT [DF_BundlingList_SysPrice]  DEFAULT ((0)) FOR [SysPrice]
GO
/****** Object:  Default [DF_BundlingList_BuyPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[BundlingList] ADD  CONSTRAINT [DF_BundlingList_BuyPrice]  DEFAULT ((0)) FOR [BuyPrice]
GO
/****** Object:  Default [DF__BundlingL__SyncI__3454A3DC]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[BundlingList] ADD  CONSTRAINT [DF__BundlingL__SyncI__3454A3DC]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_Bundling_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Bundling] ADD  CONSTRAINT [DF_Bundling_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Bundling_BundledPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Bundling] ADD  CONSTRAINT [DF_Bundling_BundledPrice]  DEFAULT ((0)) FOR [BundledPrice]
GO
/****** Object:  Default [DF_Bundling_TotalBundled]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Bundling] ADD  CONSTRAINT [DF_Bundling_TotalBundled]  DEFAULT ((1)) FOR [TotalBundled]
GO
/****** Object:  Default [DF__Bundling__SyncIt__2F8FEEBF]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Bundling] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_Notice_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Notice] ADD  CONSTRAINT [DF_Notice_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Notice_Type]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Notice] ADD  CONSTRAINT [DF_Notice_Type]  DEFAULT ((0)) FOR [Type]
GO
/****** Object:  Default [DF_Notice_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Notice] ADD  CONSTRAINT [DF_Notice_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF__Notice__SyncItem__26FAA8BE]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Notice] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_MembershipCardSetting_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCardSetting] ADD  CONSTRAINT [DF_MembershipCardSetting_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_MembershipCardSetting_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCardSetting] ADD  CONSTRAINT [DF_MembershipCardSetting_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_MembershipCard_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_MembershipCard_ReChargeTotal]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_ReChargeTotal]  DEFAULT ((0)) FOR [ReChargeTotal]
GO
/****** Object:  Default [DF_MembershipCard_GiveTotal]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_GiveTotal]  DEFAULT ((0)) FOR [GiveTotal]
GO
/****** Object:  Default [DF_MembershipCard_Balance]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_Balance]  DEFAULT ((0)) FOR [Balance]
GO
/****** Object:  Default [DF_MembershipCard_Deposit]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_Deposit]  DEFAULT ((0)) FOR [Deposit]
GO
/****** Object:  Default [DF_MembershipCard_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_State]  DEFAULT ((-1)) FOR [State]
GO
/****** Object:  Default [DF_MembershipCard_ExpiryStart]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_ExpiryStart]  DEFAULT (getdate()) FOR [ExpiryStart]
GO
/****** Object:  Default [DF_MembershipCard_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_MembershipCard_CreateDT1]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_CreateDT1]  DEFAULT (getdate()) FOR [ExportDT]
GO
/****** Object:  Default [DF_MembershipCard_Password]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_Password]  DEFAULT ('') FOR [Password]
GO
/****** Object:  Default [DF_MembershipCard_SyncItemId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MembershipCard] ADD  CONSTRAINT [DF_MembershipCard_SyncItemId]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_Members_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Members_MemberGroupId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_MemberGroupId]  DEFAULT ((-1)) FOR [MemberGroupId]
GO
/****** Object:  Default [DF_Members_Sex]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_Sex]  DEFAULT ((-1)) FOR [Sex]
GO
/****** Object:  Default [DF_Members_CurrentCityProvinceID]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CurrentCityProvinceID]  DEFAULT ((-1)) FOR [CurrentProvinceID]
GO
/****** Object:  Default [DF_Members_CurrentCityId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CurrentCityId]  DEFAULT ((-1)) FOR [CurrentCityId]
GO
/****** Object:  Default [DF_Members_CurrentCounty]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CurrentCounty]  DEFAULT ((-1)) FOR [CurrentCountyId]
GO
/****** Object:  Default [DF_Members_DefaultPreferentialId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_DefaultPreferentialId]  DEFAULT ((-1)) FOR [DefaultPreferentialId]
GO
/****** Object:  Default [DF_Members_DefaultIntegrationId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_DefaultIntegrationId]  DEFAULT ((-1)) FOR [DefaultIntegrationId]
GO
/****** Object:  Default [DF_Members_UsableIntegral]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_UsableIntegral]  DEFAULT ((0)) FOR [UsableIntegral]
GO
/****** Object:  Default [DF_Members_UsableBalance]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_UsableBalance]  DEFAULT ((0)) FOR [UsableBalance]
GO
/****** Object:  Default [DF_Members_RechargeTotal]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_RechargeTotal]  DEFAULT ((0)) FOR [RechargeTotal]
GO
/****** Object:  Default [DF_Members_ConsumeTotal]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_ConsumeTotal]  DEFAULT ((0)) FOR [ConsumeTotal]
GO
/****** Object:  Default [DF_Members_Insider]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_Insider]  DEFAULT ((0)) FOR [Insider]
GO
/****** Object:  Default [DF_Member_Status]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Member_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Members_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_Member_SyncItemId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Member_SyncItemId]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_MemberRecharge_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  CONSTRAINT [DF_MemberRecharge_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_MemberRecharge_Type]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  CONSTRAINT [DF_MemberRecharge_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_MemberRecharge_GivenAmount]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  CONSTRAINT [DF_MemberRecharge_GivenAmount]  DEFAULT ((0)) FOR [GivenAmount]
GO
/****** Object:  Default [DF_MemberRecharge_PresentExp]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  CONSTRAINT [DF_MemberRecharge_PresentExp]  DEFAULT ((0)) FOR [PresentExp]
GO
/****** Object:  Default [DF__MemberRec__Befor__0E04DDC2]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  CONSTRAINT [DF__MemberRec__Befor__0E04DDC2]  DEFAULT ((0)) FOR [BeforeAmount]
GO
/****** Object:  Default [DF_MemberRecharge_AfterAmount]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  CONSTRAINT [DF_MemberRecharge_AfterAmount]  DEFAULT ((0)) FOR [AfterAmount]
GO
/****** Object:  Default [DF_MemberRecharge_AfterIntegral]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  CONSTRAINT [DF_MemberRecharge_AfterIntegral]  DEFAULT ((0)) FOR [AfterIntegral]
GO
/****** Object:  Default [DF_MemberRecharge_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  CONSTRAINT [DF_MemberRecharge_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_MemberRecharge_Number]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  CONSTRAINT [DF_MemberRecharge_Number]  DEFAULT ((1)) FOR [Number]
GO
/****** Object:  Default [DF__MemberRec__Store__3D49DC90]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  DEFAULT ('-1') FOR [StoreId]
GO
/****** Object:  Default [DF__MemberRec__IsTes__3E3E00C9]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  DEFAULT ((0)) FOR [IsTest]
GO
/****** Object:  Default [DF__MemberRec__Machi__3F322502]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberRecharge] ADD  DEFAULT ('-1') FOR [MachineSN]
GO
/****** Object:  Default [DF_MemberLevel_MemberLevelId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberLevel] ADD  CONSTRAINT [DF_MemberLevel_MemberLevelId]  DEFAULT (replace(newid(),'-','')) FOR [MemberLevelId]
GO
/****** Object:  Default [DF_MemberLevel_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberLevel] ADD  CONSTRAINT [DF_MemberLevel_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_MemberLevel_CouponType]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberLevel] ADD  CONSTRAINT [DF_MemberLevel_CouponType]  DEFAULT ((0)) FOR [CouponType]
GO
/****** Object:  Default [DF_MemberLevel_Discount]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberLevel] ADD  CONSTRAINT [DF_MemberLevel_Discount]  DEFAULT ((-1)) FOR [Discount]
GO
/****** Object:  Default [DF_MemberLevel_IntegerType]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberLevel] ADD  CONSTRAINT [DF_MemberLevel_IntegerType]  DEFAULT ((0)) FOR [IntegerType]
GO
/****** Object:  Default [DF_MemberLevel_AutoUpdate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberLevel] ADD  CONSTRAINT [DF_MemberLevel_AutoUpdate]  DEFAULT ((0)) FOR [AutoUpdate]
GO
/****** Object:  Default [DF_MemberLevel_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberLevel] ADD  CONSTRAINT [DF_MemberLevel_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF__MemberLev__Integ__6740165C]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberLevel] ADD  CONSTRAINT [DF__MemberLev__Integ__6740165C]  DEFAULT ((100)) FOR [IntegralCoefficient]
GO
/****** Object:  Default [DF__MemberInt__SyncI__448B0BA5]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegralSetList] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_MemberIntegralSet_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegralSet] ADD  CONSTRAINT [DF_MemberIntegralSet_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_MemberIntegralSet_CustomerObj]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegralSet] ADD  CONSTRAINT [DF_MemberIntegralSet_CustomerObj]  DEFAULT ((-1)) FOR [CustomerObj]
GO
/****** Object:  Default [DF_MemberIntegralSet_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegralSet] ADD  CONSTRAINT [DF_MemberIntegralSet_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF__MemberInt__SyncI__457F2FDE]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegralSet] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_MemberIntegral_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegral] ADD  CONSTRAINT [DF_MemberIntegral_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_MemberIntegral_ActualPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegral] ADD  CONSTRAINT [DF_MemberIntegral_ActualPrice]  DEFAULT ((0)) FOR [IntegralRuleId]
GO
/****** Object:  Default [DF_MemberIntegral_Integral]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegral] ADD  CONSTRAINT [DF_MemberIntegral_Integral]  DEFAULT ((0)) FOR [Integral]
GO
/****** Object:  Default [DF_MemberIntegral_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegral] ADD  CONSTRAINT [DF_MemberIntegral_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF__MemberInt__SyncI__2BBF5DDB]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MemberIntegral] ADD  CONSTRAINT [DF__MemberInt__SyncI__2BBF5DDB]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_MakingMembershipCard_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingMembershipCard] ADD  CONSTRAINT [DF_MakingMembershipCard_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_MakingMembershipCard_NumberStart]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingMembershipCard] ADD  CONSTRAINT [DF_MakingMembershipCard_NumberStart]  DEFAULT ((0)) FOR [NumberStart]
GO
/****** Object:  Default [DF_MakingMembershipCard_NumberEnd]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingMembershipCard] ADD  CONSTRAINT [DF_MakingMembershipCard_NumberEnd]  DEFAULT ((0)) FOR [NumberEnd]
GO
/****** Object:  Default [DF_MakingMembershipCard_MakeNumber]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingMembershipCard] ADD  CONSTRAINT [DF_MakingMembershipCard_MakeNumber]  DEFAULT ((0)) FOR [MakeNumber]
GO
/****** Object:  Default [DF_MakingMembershipCard_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingMembershipCard] ADD  CONSTRAINT [DF_MakingMembershipCard_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_MakingMembershipCard_ExpiryStart]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingMembershipCard] ADD  CONSTRAINT [DF_MakingMembershipCard_ExpiryStart]  DEFAULT (getdate()) FOR [ExpiryStart]
GO
/****** Object:  Default [DF_MakingMembershipCard_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingMembershipCard] ADD  CONSTRAINT [DF_MakingMembershipCard_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_MakingCouponCard_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingCouponCard] ADD  CONSTRAINT [DF_MakingCouponCard_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_MakingCouponCard_StoreIds]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingCouponCard] ADD  CONSTRAINT [DF_MakingCouponCard_StoreIds]  DEFAULT ((-1)) FOR [StoreIds]
GO
/****** Object:  Default [DF_MakingCouponCard_ProductTypes]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingCouponCard] ADD  CONSTRAINT [DF_MakingCouponCard_ProductTypes]  DEFAULT ((-1)) FOR [ProductTypes]
GO
/****** Object:  Default [DF_MakingCouponCard_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakingCouponCard] ADD  CONSTRAINT [DF_MakingCouponCard_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_MakeShipCardHistory_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakeShipCardHistory] ADD  CONSTRAINT [DF_MakeShipCardHistory_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_MakeShipCardHistory_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[MakeShipCardHistory] ADD  CONSTRAINT [DF_MakeShipCardHistory_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_InventoryValidity_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryValidity] ADD  CONSTRAINT [DF_InventoryValidity_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_InventoryRecord_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryRecord] ADD  CONSTRAINT [DF_InventoryRecord_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_InventoryRecord_AveragePrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryRecord] ADD  CONSTRAINT [DF_InventoryRecord_AveragePrice]  DEFAULT ((0)) FOR [AveragePrice]
GO
/****** Object:  Default [DF_InventoryRecord_]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryRecord] ADD  CONSTRAINT [DF_InventoryRecord_]  DEFAULT ((0)) FOR [InValidity]
GO
/****** Object:  Default [DF_InventoryBalance_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryBalance] ADD  CONSTRAINT [DF_InventoryBalance_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_InventoryBalance_Number]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryBalance] ADD  CONSTRAINT [DF_InventoryBalance_Number]  DEFAULT ((0)) FOR [Number]
GO
/****** Object:  Default [DF_InventoryBalance_BalanceDate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryBalance] ADD  CONSTRAINT [DF_InventoryBalance_BalanceDate]  DEFAULT (getdate()) FOR [BalanceDate]
GO
/****** Object:  Default [DF_InventoryBalance_SaleAveragePrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryBalance] ADD  CONSTRAINT [DF_InventoryBalance_SaleAveragePrice]  DEFAULT ((0)) FOR [SaleAveragePrice]
GO
/****** Object:  Default [DF_InventoryBalance_SaleAmount]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryBalance] ADD  CONSTRAINT [DF_InventoryBalance_SaleAmount]  DEFAULT ((0)) FOR [SaleAmount]
GO
/****** Object:  Default [DF_InventoryBalance_StockAmount]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryBalance] ADD  CONSTRAINT [DF_InventoryBalance_StockAmount]  DEFAULT ((0)) FOR [StockAmount]
GO
/****** Object:  Default [DF_InventoryBalance_Period]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InventoryBalance] ADD  CONSTRAINT [DF_InventoryBalance_Period]  DEFAULT ((0)) FOR [Period]
GO
/****** Object:  Default [DF_Inventory_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Inventory] ADD  CONSTRAINT [DF_Inventory_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF__Inventory__SyncI__3FC65688]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Inventory] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_IntegralRule_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralRule] ADD  CONSTRAINT [DF_IntegralRule_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_IntegralRule_UseUsers]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralRule] ADD  CONSTRAINT [DF_IntegralRule_UseUsers]  DEFAULT ((-1)) FOR [UseUsers]
GO
/****** Object:  Default [DF_IntegralRule_IsStack]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralRule] ADD  CONSTRAINT [DF_IntegralRule_IsStack]  DEFAULT ((1)) FOR [IsStack]
GO
/****** Object:  Default [DF_IntegralRule_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralRule] ADD  CONSTRAINT [DF_IntegralRule_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_IntegralRecords_CreateDt]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralRecords] ADD  CONSTRAINT [DF_IntegralRecords_CreateDt]  DEFAULT (getdate()) FOR [CreateDt]
GO
/****** Object:  Default [DF_IntegralRecords_StoreId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralRecords] ADD  CONSTRAINT [DF_IntegralRecords_StoreId]  DEFAULT ('') FOR [StoreId]
GO
/****** Object:  Default [DF_IntegralRecords_OperatorUid]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralRecords] ADD  CONSTRAINT [DF_IntegralRecords_OperatorUid]  DEFAULT ('') FOR [OperatorUid]
GO
/****** Object:  Default [DF__IntegralF__Amoun__01F40C98]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralFlows] ADD  CONSTRAINT [DF__IntegralF__Amoun__01F40C98]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [DF__IntegralF__UseIn__02E830D1]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralFlows] ADD  CONSTRAINT [DF__IntegralF__UseIn__02E830D1]  DEFAULT ((0)) FOR [Integral]
GO
/****** Object:  Default [DF__IntegralF__Disco__03DC550A]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralFlows] ADD  CONSTRAINT [DF__IntegralF__Disco__03DC550A]  DEFAULT ((0)) FOR [DiscountAmount]
GO
/****** Object:  Default [DF__IntegralF__Recei__04D07943]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralFlows] ADD  CONSTRAINT [DF__IntegralF__Recei__04D07943]  DEFAULT ((0)) FOR [Received]
GO
/****** Object:  Default [DF_IntegralFlows_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IntegralFlows] ADD  CONSTRAINT [DF_IntegralFlows_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_InstalmentRecord_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InstalmentRecord] ADD  CONSTRAINT [DF_InstalmentRecord_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_IndentOrderList_IndentNum]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IndentOrderList] ADD  CONSTRAINT [DF_IndentOrderList_IndentNum]  DEFAULT ((0)) FOR [IndentNum]
GO
/****** Object:  Default [DF_IndentOrderList_Price]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IndentOrderList] ADD  CONSTRAINT [DF_IndentOrderList_Price]  DEFAULT ((0)) FOR [Price]
GO
/****** Object:  Default [DF_IndentOrderList_Subtotal]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IndentOrderList] ADD  CONSTRAINT [DF_IndentOrderList_Subtotal]  DEFAULT ((0)) FOR [Subtotal]
GO
/****** Object:  Default [DF_IndentOrderList_DeliveryNum]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IndentOrderList] ADD  CONSTRAINT [DF_IndentOrderList_DeliveryNum]  DEFAULT ((0)) FOR [DeliveryNum]
GO
/****** Object:  Default [DF_IndentOrderList_AcceptNum]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IndentOrderList] ADD  CONSTRAINT [DF_IndentOrderList_AcceptNum]  DEFAULT ((0)) FOR [AcceptNum]
GO
/****** Object:  Default [DF_IndentOrderList_Nature]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IndentOrderList] ADD  CONSTRAINT [DF_IndentOrderList_Nature]  DEFAULT ((0)) FOR [Nature]
GO
/****** Object:  Default [DF_IndentOrderList_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IndentOrderList] ADD  CONSTRAINT [DF_IndentOrderList_State]  DEFAULT ((2)) FOR [State]
GO
/****** Object:  Default [DF_IndentOrder_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IndentOrder] ADD  CONSTRAINT [DF_IndentOrder_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_IndentOrder_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[IndentOrder] ADD  CONSTRAINT [DF_IndentOrder_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_InboundList_BuyPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundList] ADD  CONSTRAINT [DF_InboundList_BuyPrice]  DEFAULT ((0)) FOR [BuyPrice]
GO
/****** Object:  Default [DF_InboundList_SysPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundList] ADD  CONSTRAINT [DF_InboundList_SysPrice]  DEFAULT ((0)) FOR [SysPrice]
GO
/****** Object:  Default [DF_InboundList_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundList] ADD  CONSTRAINT [DF_InboundList_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_InboundList_ExpiryDate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundList] ADD  CONSTRAINT [DF_InboundList_ExpiryDate]  DEFAULT ((-1)) FOR [ExpiryDate]
GO
/****** Object:  Default [DF_InboundList_ExpiryDateUnit]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundList] ADD  CONSTRAINT [DF_InboundList_ExpiryDateUnit]  DEFAULT ((1)) FOR [ExpiryDateUnit]
GO
/****** Object:  Default [DF__InboundLi__IsGif__0EC32C7A]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundList] ADD  DEFAULT ((0)) FOR [IsGift]
GO
/****** Object:  Default [DF_InboundGoods_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundGoods] ADD  CONSTRAINT [DF_InboundGoods_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_InboundGoods_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundGoods] ADD  CONSTRAINT [DF_InboundGoods_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF__InboundGo__Inbou__36F11965]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundGoods] ADD  CONSTRAINT [DF__InboundGo__Inbou__36F11965]  DEFAULT ((1)) FOR [InboundType]
GO
/****** Object:  Default [DF_InboundGoods_Source]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[InboundGoods] ADD  CONSTRAINT [DF_InboundGoods_Source]  DEFAULT ((2)) FOR [Source]
GO
/****** Object:  Default [DF_ImportSet_RefCreate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[ImportSet] ADD  CONSTRAINT [DF_ImportSet_RefCreate]  DEFAULT ((0)) FOR [RefCreate]
GO
/****** Object:  Default [DF_HouseMoveList_DeliveryQuantity]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[HouseMoveList] ADD  CONSTRAINT [DF_HouseMoveList_DeliveryQuantity]  DEFAULT ((0)) FOR [DeliveryQuantity]
GO
/****** Object:  Default [DF_HouseMoveList_ActualQuantity]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[HouseMoveList] ADD  CONSTRAINT [DF_HouseMoveList_ActualQuantity]  DEFAULT ((0)) FOR [ActualQuantity]
GO
/****** Object:  Default [DF_HouseMoveList_BuyPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[HouseMoveList] ADD  CONSTRAINT [DF_HouseMoveList_BuyPrice]  DEFAULT ((0)) FOR [BuyPrice]
GO
/****** Object:  Default [DF_HouseMoveList_SysPrice]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[HouseMoveList] ADD  CONSTRAINT [DF_HouseMoveList_SysPrice]  DEFAULT ((0)) FOR [SysPrice]
GO
/****** Object:  Default [DF_HouseMoveList_StockOut]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[HouseMoveList] ADD  CONSTRAINT [DF_HouseMoveList_StockOut]  DEFAULT ((0)) FOR [StockOut]
GO
/****** Object:  Default [DF_HouseMoveList_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[HouseMoveList] ADD  CONSTRAINT [DF_HouseMoveList_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF_HouseMove_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[HouseMove] ADD  CONSTRAINT [DF_HouseMove_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_HouseMove_ActualDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[HouseMove] ADD  CONSTRAINT [DF_HouseMove_ActualDT]  DEFAULT (getdate()) FOR [ActualDT]
GO
/****** Object:  Default [DF_HouseMove_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[HouseMove] ADD  CONSTRAINT [DF_HouseMove_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF_Grouping_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[Grouping] ADD  CONSTRAINT [DF_Grouping_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF_OutboundGoods_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OutboundGoods] ADD  CONSTRAINT [DF_OutboundGoods_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_OutboundGoods_Channel]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OutboundGoods] ADD  CONSTRAINT [DF_OutboundGoods_Channel]  DEFAULT ((0)) FOR [Channel]
GO
/****** Object:  Default [DF__OutboundG__Outbo__407A839F]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OutboundGoods] ADD  CONSTRAINT [DF__OutboundG__Outbo__407A839F]  DEFAULT ((1)) FOR [OutboundType]
GO
/****** Object:  Default [DF_OrderReturns_ReasonId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderReturns] ADD  CONSTRAINT [DF_OrderReturns_ReasonId]  DEFAULT ((-1)) FOR [ReasonId]
GO
/****** Object:  Default [DF_OrderReturns_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderReturns] ADD  CONSTRAINT [DF_OrderReturns_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_OrderReturns_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderReturns] ADD  CONSTRAINT [DF_OrderReturns_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_OrderDistribution_ExpiryDate]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderDistribution] ADD  CONSTRAINT [DF_OrderDistribution_ExpiryDate]  DEFAULT ((-1)) FOR [ExpiryDate]
GO
/****** Object:  Default [DF_OrderDistribution_ExpiryDateUnit]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderDistribution] ADD  CONSTRAINT [DF_OrderDistribution_ExpiryDateUnit]  DEFAULT ((1)) FOR [ExpiryDateUnit]
GO
/****** Object:  Default [DF_OrderDistribution_DeliveryNum]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderDistribution] ADD  CONSTRAINT [DF_OrderDistribution_DeliveryNum]  DEFAULT ((0)) FOR [DeliveryNum]
GO
/****** Object:  Default [DF_OrderDistribution_DeliveryDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderDistribution] ADD  CONSTRAINT [DF_OrderDistribution_DeliveryDT]  DEFAULT (getdate()) FOR [DeliveryDT]
GO
/****** Object:  Default [DF_OrderDistribution_ReceivedNum]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderDistribution] ADD  CONSTRAINT [DF_OrderDistribution_ReceivedNum]  DEFAULT ((0)) FOR [ReceivedNum]
GO
/****** Object:  Default [DF_OrderDistribution_ReceivedDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderDistribution] ADD  CONSTRAINT [DF_OrderDistribution_ReceivedDT]  DEFAULT (getdate()) FOR [ReceivedDT]
GO
/****** Object:  Default [DF_OrderDistribution_State]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OrderDistribution] ADD  CONSTRAINT [DF_OrderDistribution_State]  DEFAULT ((5)) FOR [State]
GO
/****** Object:  Default [DF_OMS_SysUserInfo_Sex]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OMS_SysUserInfo] ADD  CONSTRAINT [DF_OMS_SysUserInfo_Sex]  DEFAULT ((1)) FOR [Sex]
GO
/****** Object:  Default [DF_OMS_SysUserInfo_Status]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OMS_SysUserInfo] ADD  CONSTRAINT [DF_OMS_SysUserInfo_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_OMS_SysUserInfo_LoginDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OMS_SysUserInfo] ADD  CONSTRAINT [DF_OMS_SysUserInfo_LoginDT]  DEFAULT (getdate()) FOR [LoginDT]
GO
/****** Object:  Default [DF_OMS_SysUserInfo_LoginNum]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OMS_SysUserInfo] ADD  CONSTRAINT [DF_OMS_SysUserInfo_LoginNum]  DEFAULT ((0)) FOR [LoginNum]
GO
/****** Object:  Default [DF_OMS_SysUserInfo_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OMS_SysUserInfo] ADD  CONSTRAINT [DF_OMS_SysUserInfo_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_OMS_SysUserInfo_IsShopManager]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[OMS_SysUserInfo] ADD  CONSTRAINT [DF_OMS_SysUserInfo_IsShopManager]  DEFAULT ((0)) FOR [IsShopManager]
GO
/****** Object:  Default [DF_PrintConponHistory_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PrintConponHistory] ADD  CONSTRAINT [DF_PrintConponHistory_CompanyId]  DEFAULT ((-1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_PrintConponHistory_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PrintConponHistory] ADD  CONSTRAINT [DF_PrintConponHistory_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_PosIncomePayout_CompanyId]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PosIncomePayout] ADD  CONSTRAINT [DF_PosIncomePayout_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_PosIncomePayout_Amount]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PosIncomePayout] ADD  CONSTRAINT [DF_PosIncomePayout_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [DF_PosIncomePayout_CreateDT]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PosIncomePayout] ADD  CONSTRAINT [DF_PosIncomePayout_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_PosIncomePayout_IsTest]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PosIncomePayout] ADD  CONSTRAINT [DF_PosIncomePayout_IsTest]  DEFAULT ((0)) FOR [IsTest]
GO
/****** Object:  Default [DF__PosIncome__SyncI__27EECCF7]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PosIncomePayout] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF__PosDevice__State__019E3B86]    Script Date: 04/12/2017 14:11:39 ******/
ALTER TABLE [dbo].[PosDevice] ADD  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_PayNotifyResult_CompanyId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[PayNotifyResult] ADD  CONSTRAINT [DF_PayNotifyResult_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF__PayNotify__Creat__67A95F59]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[PayNotifyResult] ADD  CONSTRAINT [DF__PayNotify__Creat__67A95F59]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_Attachment_Size]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[Attachment] ADD  CONSTRAINT [DF_Attachment_Size]  DEFAULT ((0)) FOR [Size]
GO
/****** Object:  Default [DF_Area_AreaPID]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[Area] ADD  CONSTRAINT [DF_Area_AreaPID]  DEFAULT ((-1)) FOR [AreaPID]
GO
/****** Object:  Default [DF_Area_Type]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[Area] ADD  CONSTRAINT [DF_Area_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_Area_SyncItemId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[Area] ADD  CONSTRAINT [DF_Area_SyncItemId]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_AppPaymentRecords_DiscountAmount]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[AppPaymentRecords] ADD  CONSTRAINT [DF_AppPaymentRecords_DiscountAmount]  DEFAULT ((0)) FOR [DiscountAmount]
GO
/****** Object:  Default [DF_AppPaymentRecords_CreateDate]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[AppPaymentRecords] ADD  CONSTRAINT [DF_AppPaymentRecords_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_ApiLibrary_CompanyId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[ApiLibrary] ADD  CONSTRAINT [DF_ApiLibrary_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_ApiLibrary_ApiOrder]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[ApiLibrary] ADD  CONSTRAINT [DF_ApiLibrary_ApiOrder]  DEFAULT ((1)) FOR [ApiOrder]
GO
/****** Object:  Default [DF_ApiLibrary_State]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[ApiLibrary] ADD  CONSTRAINT [DF_ApiLibrary_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF_ApiLibrary_SyncItemId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[ApiLibrary] ADD  CONSTRAINT [DF_ApiLibrary_SyncItemId]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_DeviceRegInfo_CompanyId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[DeviceRegInfo] ADD  CONSTRAINT [DF_DeviceRegInfo_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_DeviceRegInfo_CreateDT]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[DeviceRegInfo] ADD  CONSTRAINT [DF_DeviceRegInfo_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_DeviceRegInfo_State]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[DeviceRegInfo] ADD  CONSTRAINT [DF_DeviceRegInfo_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_DeviceRegInfo_SyncItemId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[DeviceRegInfo] ADD  CONSTRAINT [DF_DeviceRegInfo_SyncItemId]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_FreeGiftPurchaseList_GiftNumber]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[FreeGiftPurchaseList] ADD  CONSTRAINT [DF_FreeGiftPurchaseList_GiftNumber]  DEFAULT ((1)) FOR [GiftNumber]
GO
/****** Object:  Default [DF__FreeGiftP__SyncI__2CB38214]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[FreeGiftPurchaseList] ADD  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_FreeGiftPurchase_CompanyId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[FreeGiftPurchase] ADD  CONSTRAINT [DF_FreeGiftPurchase_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_FreeGiftPurchase_MinPurchaseNum]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[FreeGiftPurchase] ADD  CONSTRAINT [DF_FreeGiftPurchase_MinPurchaseNum]  DEFAULT ((1)) FOR [MinPurchaseNum]
GO
/****** Object:  Default [DF_FreeGiftPurchase_RestrictionBuyNum]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[FreeGiftPurchase] ADD  CONSTRAINT [DF_FreeGiftPurchase_RestrictionBuyNum]  DEFAULT ((0)) FOR [RestrictionBuyNum]
GO
/****** Object:  Default [DF_FreeGiftPurchase_BrandSN]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[FreeGiftPurchase] ADD  CONSTRAINT [DF_FreeGiftPurchase_BrandSN]  DEFAULT ((0)) FOR [BrandSN]
GO
/****** Object:  Default [DF__FreeGiftP__SyncI__382534C0]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[FreeGiftPurchase] ADD  CONSTRAINT [DF__FreeGiftP__SyncI__382534C0]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_WipeZero_CompanyId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[WipeZero] ADD  CONSTRAINT [DF_WipeZero_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF__WipeZero__SyncIt__37311087]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[WipeZero] ADD  CONSTRAINT [DF__WipeZero__SyncIt__37311087]  DEFAULT (newid()) FOR [SyncItemId]
GO
/****** Object:  Default [DF_Warehouse_CompanyId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_Warehouse_State]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_State]  DEFAULT ((1)) FOR [State]
GO
/****** Object:  Default [DF_Warehouse_CreateDT]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_CreateDT]  DEFAULT (getdate()) FOR [CreateDT]
GO
/****** Object:  Default [DF_Warehouse_Type]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF__Warehouse__Admin__6B64E1A4]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF__Warehouse__Admin__6B64E1A4]  DEFAULT ((1)) FOR [AdminState]
GO
/****** Object:  Default [DF_TreasuryLocks_CompanyId]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[TreasuryLocks] ADD  CONSTRAINT [DF_TreasuryLocks_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
/****** Object:  Default [DF_TreasuryLocks_LockDate]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[TreasuryLocks] ADD  CONSTRAINT [DF_TreasuryLocks_LockDate]  DEFAULT (getdate()) FOR [LockDate]
GO
/****** Object:  Default [DF_TreasuryLocks_State]    Script Date: 04/12/2017 14:11:40 ******/
ALTER TABLE [dbo].[TreasuryLocks] ADD  CONSTRAINT [DF_TreasuryLocks_State]  DEFAULT ((0)) FOR [State]
GO
/****** Object:  Default [DF_SaleInventoryHistory_CompanyId]    Script Date: 04/12/2017 14:11:41 ******/
ALTER TABLE [dbo].[SaleInventoryHistory] ADD  CONSTRAINT [DF_SaleInventoryHistory_CompanyId]  DEFAULT ((1)) FOR [CompanyId]
GO
