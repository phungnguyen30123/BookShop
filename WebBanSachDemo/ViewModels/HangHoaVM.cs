using System.ComponentModel.DataAnnotations;

namespace WebBanSachDemo.ViewModels
{
    public class BinhLuanInfo
    {
        public string TenKH { get; set; }
       
        public string BinhLuan { get; set; }
        public DateTime? NgayBinhLuan { get; set; }
    }
    public class HangHoaVM
    {
        public int MaHH { get; set; }
        public string TenHH { get; set; }
        public string Hinh { get; set; }
        public double DonGia { get; set; }
        public string MoTaNgan {  get; set; }
        public string TenLoai { get; set; }
    }
    public class ChiTietHangHoaVM
    {
        public int MaHH { get; set; }
        public string TenHH { get; set; }
        public string Hinh { get; set; }
        public List<String> HinhLienKet { get; set; }
        public List<BinhLuanInfo> BinhLuan { get; set; }
        public string TacGia { get; set; }
        public double DonGia { get; set; }
        public string MoTaNgan { get; set; }
        public string TenLoai { get; set; }
        public string ChiTiet { get; set; }
        public int  DiemDanhGia { get; set; }
        public int SoLuongTon { get; set; }
    }
}
