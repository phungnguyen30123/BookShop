using System;
using System.Collections.Generic;

namespace WebBanSachDemo.Data;

public partial class TrangThai
{
    public int MaTrangThai { get; set; }

    public string TenTrangThai { get; set; } = null!;

    public string? MoTa { get; set; }

    public virtual ICollection<ChiTietHd> ChiTietHds { get; set; } = new List<ChiTietHd>();

    public virtual ICollection<HoaDon> HoaDons { get; set; } = new List<HoaDon>();
}
