// --------------------------------------------------
// Copyright (C) 2016 版权所有
// 创 建 人：蔡少发
// 创建时间：2016-09-03
// 描述信息：
// --------------------------------------------------

using System;

namespace Pharos.Logic.OMS.Entity
{
	/// <summary>
	/// 用于管理本系统的所有设备授权信息
	/// </summary>
	[Serializable]
	public partial class DeviceAuthorize
	{
		/// <summary>
		/// 
		/// [主键：√]
		/// [长度：10]
		/// [不允许为空]
		/// </summary>
		public int Id { get; set; }

		/// <summary>
		/// 
		/// [长度：10]
		/// [不允许为空]
		/// </summary>
		public int? CID { get; set; }

		/// <summary>
		/// 客户来源(1-本司2-代理商)
		/// [长度：5]
		/// [不允许为空]
		/// </summary>
		public short Source { get; set; }

		/// <summary>
		/// 
		/// [长度：40]
		/// [不允许为空]
		/// </summary>
		public string DeviceId { get; set; }

		/// <summary>
		/// 客户名称
		/// [长度：50]
		/// [不允许为空]
		/// </summary>
		public string Title { get; set; }

		/// <summary>
		/// 设备编号
		/// [长度：50]
		/// [不允许为空]
		/// </summary>
		public string DeviceNo { get; set; }

		/// <summary>
		/// 合同编号
		/// [长度：50]
		/// [不允许为空]
		/// </summary>
		public string ContractNo { get; set; }

		/// <summary>
		/// 所在门店
		/// [长度：50]
		/// </summary>
		public string StoreName { get; set; }

		/// <summary>
		/// 生效日期(yyyy-MM-dd)
		/// [长度：10]
		/// [不允许为空]
		/// </summary>
		public string EffectiveDT { get; set; }

		/// <summary>
		/// 有效期月数
		/// [长度：5]
		/// [不允许为空]
		/// [默认值：((12))]
		/// </summary>
		public short? ValidityNum { get; set; }

		/// <summary>
		/// 截止日期(yyyy-MM-dd)
		/// [长度：10]
		/// [不允许为空]
		/// </summary>
		public string ExpirationDT { get; set; }

		/// <summary>
		/// 状态(0:未激活, 1:已激活, 2:已停用)
		/// [长度：5]
		/// [不允许为空]
		/// [默认值：((0))]
		/// </summary>
		public short Status { get; set; }

		/// <summary>
		/// 指派人UID
		/// [长度：40]
		/// </summary>
		public string AssignerUID { get; set; }

		/// <summary>
		/// 
		/// [长度：23，小数位数：3]
		/// [不允许为空]
		/// [默认值：(getdate())]
		/// </summary>
		public DateTime CreateDT { get; set; }

		/// <summary>
		/// 
		/// [长度：40]
		/// [默认值：('0')]
		/// </summary>
		public string CreateUID { get; set; }
        /// <summary>
        /// 自编机号
        /// </summary>
        public string MachineNo { get; set; }
	}
}