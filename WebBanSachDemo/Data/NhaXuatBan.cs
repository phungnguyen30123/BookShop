using System;
using System.Collections.Generic;

namespace WebBanSachDemo.Data;

public partial class NhaXuatBan
{
    public int MaNxb { get; set; }

    public string Ten { get; set; } = null!;

    public virtual ICollection<HangHoa> HangHoas { get; set; } = new List<HangHoa>();
}
