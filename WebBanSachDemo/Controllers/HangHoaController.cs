using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net.NetworkInformation;
using System.Security.Claims;
using WebBanSachDemo.Data;
using WebBanSachDemo.Helpers;
using WebBanSachDemo.ViewModels;
using X.PagedList;
using Microsoft.AspNetCore.Authorization;
namespace WebBanSachDemo.Controllers
{
    
    public class HangHoaController : Controller
    {
        private readonly WebBanSachDemoContext db;

        public HangHoaController(WebBanSachDemoContext context)
        {
                db = context;
        }
       
        public IActionResult Index(int? loai, int? page)
        {
            int pageSize = 6;
            int pageNumber = page==null||page<0?1:page.Value;

            var hangHoas = db.HangHoas.AsQueryable();
            if(loai.HasValue)
                {
                    hangHoas = hangHoas.Where(p => p.MaLoai == loai.Value); 
                }
                var result = hangHoas.Select(p => new HangHoaVM
                {
                    MaHH = p.MaHh,
                    TenHH = p.TenHh,
                    DonGia = p.DonGia ?? 0,
                    Hinh = p.Hinh ?? "",
                    MoTaNgan = p.MoTaDonVi ?? "",
                    TenLoai = p.MaLoaiNavigation.TenLoai
                });
            PagedList<HangHoaVM> result1 = new PagedList<HangHoaVM>(result, pageNumber, pageSize);
            return View(result1); 
        }
        public IActionResult Search(string? query, int? page)
        {
            int pageSize = 3;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var hangHoas = db.HangHoas.AsQueryable();
            if (query != null)
            {
                hangHoas = hangHoas.Where(p => p.TenHh.Contains(query));
            }
            var result = hangHoas.Select(p => new HangHoaVM
            {
                MaHH = p.MaHh,
                TenHH = p.TenHh,
                DonGia = p.DonGia ?? 0,
                Hinh = p.Hinh ?? "",
                MoTaNgan = p.MoTaDonVi ?? "",
                TenLoai = p.MaLoaiNavigation.TenLoai
            });
            PagedList<HangHoaVM> result1 = new PagedList<HangHoaVM>(result, pageNumber, pageSize);
            return View(result1);
        }
        public IActionResult Detail(int id)
        {
            /*var data = db.HangHoas.Include(p => p.MaLoaiNavigation).SingleOrDefault(p => p.MaHh == id);*/
            var data = db.HangHoas.Include(p => p.MaLoaiNavigation).SingleOrDefault(p => p.MaHh == id);
            if(data == null)
            {
                TempData["Message"] = $"Không thấy sản phẩm";
                return Redirect("/404");
            }
            var danhSachHinhAnh = db.HinhAnhHhs.Where(h => h.MaHh == id).Select(h => h.Hinh).ToList();
            /*var binhLuan = db.BinhLuans.Where(h => h.MaHh == id).Select(h => h.BinhLuan1).ToList();*/
            var binhLuanInfos = db.BinhLuans
                         .Where(h => h.MaHh == id)
                         .OrderByDescending(h => h.MaBl)
                         .Select(h => new BinhLuanInfo
                         {
                             TenKH = h.TenKh,
                             BinhLuan = h.BinhLuan1,
                             NgayBinhLuan = h.NgayBinhLuan
                         })
                         .ToList();
            var result = new ChiTietHangHoaVM
            {
                MaHH = data.MaHh,
                TenHH = data.TenHh,
                DonGia = data.DonGia ?? 0,
                ChiTiet = data.MoTa ?? string.Empty,
                Hinh = data.Hinh ?? string.Empty,
                TacGia = data.TacGia ?? string.Empty,
                HinhLienKet = danhSachHinhAnh,
                BinhLuan = binhLuanInfos,
                MoTaNgan = data.MoTaDonVi ?? string.Empty,
                TenLoai = data.MaLoaiNavigation.TenLoai,
                SoLuongTon = 10,
                DiemDanhGia = 5
            };
            return View(result);
         }
        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult BinhLuanS(string binhluan, int id, string hoten)
        {
            try
            {
                if(binhluan == null)
                {
                    return Json(new { success = false, message = "Không được để trống lời phản hồi" });
                }
                else
                {
                    var binhLuanMoi = new BinhLuan
                    {
                        TenKh = hoten,
                        BinhLuan1 = binhluan,
                        MaHh = id,
                        NgayBinhLuan = DateTime.Now // Ngày bình luận sẽ là ngày hiện tại
                    };
                    db.BinhLuans.Add(binhLuanMoi);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Phản hồi sản phẩm thành công" });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Có lỗi xảy ra, vui lòng thử lại" });
            }
        }
    }
}
