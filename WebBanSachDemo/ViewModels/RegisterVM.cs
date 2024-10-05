using System.ComponentModel.DataAnnotations;

namespace WebBanSachDemo.ViewModels
{
    public class RegisterVM
    {
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "*")]
        [MaxLength(20,ErrorMessage ="Không vượt quá 20 kí tự")]
        public string MaKh { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "*")]
        [DataType(DataType.Password)]
        public string MatKhau { get; set; }

        [Required(ErrorMessage = "*")]
        [MaxLength(50, ErrorMessage ="Không vượt quá 50 kí tự")]
        [Display(Name = "Họ tên")]
        public string HoTen { get; set; }
        public bool GioiTinh { get; set; } = true;
        [Display(Name = "Ngày sinh")]
        [DataType(DataType.Date)]
        public DateTime? NgaySinh { get; set; }
        [Display(Name = "Địa chỉ")]
        [MaxLength(60, ErrorMessage ="Không vượt quá 60 kí tự")]
        public string DiaChi { get; set; }
        [Display(Name = "Điện thoại")]
        [MaxLength(24, ErrorMessage ="Không vượt quá 24 kí tự")]
        [RegularExpression(@"0[9875]\d{8}",ErrorMessage ="Chưa đúng định dạng")]
        public string DienThoai { get; set; }
        [EmailAddress(ErrorMessage ="Chưa đúng định dạng Email")]
        public string Email { get; set; }
    }
}
