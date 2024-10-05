using System;
using System.Collections.Generic;

namespace WebBanSachDemo.Data;

public partial class PhanCong
{
    public int MaPc { get; set; }

    public int MaNv { get; set; }

    public int MaPb { get; set; }

    public DateTime? NgayPc { get; set; }

    public bool? HieuLuc { get; set; }

    public virtual NhanVien MaNvNavigation { get; set; } = null!;

    public virtual PhongBan MaPbNavigation { get; set; } = null!;
}
