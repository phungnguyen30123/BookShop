using System;
using System.Collections.Generic;

namespace WebBanSachDemo.Data;

public partial class HangHoa
{
    public int MaHh { get; set; }

    public string TenHh { get; set; } = null!;

    public string? TenAlias { get; set; }

    public int? MaLoai { get; set; }

    public string? TacGia { get; set; }

    public int? MaNxb { get; set; }

    public string? MoTaDonVi { get; set; }

    public double? DonGia { get; set; }

    public string? Hinh { get; set; }

    public DateTime? NgaySx { get; set; }

    public double? GiamGia { get; set; }

    public int? SoLanXem { get; set; }

    public string? MoTa { get; set; }

    public int? MaNcc { get; set; }

    public int? MaBl { get; set; }

    public virtual ICollection<BanBe> BanBes { get; set; } = new List<BanBe>();

    public virtual ICollection<ChiTietHd> ChiTietHds { get; set; } = new List<ChiTietHd>();

    public virtual ICollection<HinhAnhHh> HinhAnhHhs { get; set; } = new List<HinhAnhHh>();

    public virtual BinhLuan? MaBlNavigation { get; set; }

    public virtual Loai? MaLoaiNavigation { get; set; }

    public virtual NhaCungCap? MaNccNavigation { get; set; }

    public virtual NhaXuatBan? MaNxbNavigation { get; set; }

    public virtual ICollection<YeuThich> YeuThiches { get; set; } = new List<YeuThich>();
}
