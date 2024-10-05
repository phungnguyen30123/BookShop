using System;
using System.Collections.Generic;

namespace WebBanSachDemo.Data;

public partial class BinhLuan
{
    public int MaBl { get; set; }

    public int? MaHh { get; set; }

    public string? TenKh { get; set; }

    public string? BinhLuan1 { get; set; }

    public DateTime? NgayBinhLuan { get; set; }

    public virtual ICollection<HangHoa> HangHoas { get; set; } = new List<HangHoa>();
}
