using System;
using System.Collections.Generic;

namespace WebBanSachDemo.Data;

public partial class HinhAnhHh
{
    public int Id { get; set; }

    public int? MaHh { get; set; }

    public string? Hinh { get; set; }

    public virtual HangHoa? MaHhNavigation { get; set; }
}
