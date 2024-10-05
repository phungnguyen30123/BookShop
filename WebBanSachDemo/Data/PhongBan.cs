using System;
using System.Collections.Generic;

namespace WebBanSachDemo.Data;

public partial class PhongBan
{
    public int MaPb { get; set; }

    public string TenPb { get; set; } = null!;

    public string? ThongTin { get; set; }

    public virtual ICollection<PhanCong> PhanCongs { get; set; } = new List<PhanCong>();

    public virtual ICollection<PhanQuyen> PhanQuyens { get; set; } = new List<PhanQuyen>();
}
