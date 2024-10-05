﻿using System;
using System.Collections.Generic;

namespace WebBanSachDemo.Data;

public partial class NhaCungCap
{
    public int MaNcc { get; set; }

    public string TenCongTy { get; set; } = null!;

    public string? Logo { get; set; }

    public string? NguoiLienLac { get; set; }

    public string Email { get; set; } = null!;

    public string? DienThoai { get; set; }

    public string DiaChi { get; set; } = null!;

    public string? MoTa { get; set; }

    public virtual ICollection<HangHoa> HangHoas { get; set; } = new List<HangHoa>();
}
