using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using WebBanSachDemo.Data;

namespace WebBanSachDemo.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [ServiceFilter(typeof(LoadSidebarDataAttribute))]
    public class QuanLiDonHangController : Controller
    {
        private readonly WebBanSachDemoContext db;
        public QuanLiDonHangController(WebBanSachDemoContext context)
        {
            db = context;
           
        }
        [Route("quanlidonhang")]
        [HttpGet]
        public async Task<IActionResult> Index()
        {

            var hoaDonWithDetails = await db.HoaDons
            .Include(h => h.ChiTietHds)
                .ThenInclude(ct => ct.MaTrangThaiNavigation)
            .OrderByDescending(h => h.MaHd)
            .ToListAsync();

            return View(hoaDonWithDetails);
        }
        [Route("capnhatdonhang/{id}")]
        [HttpGet]
        public async Task<IActionResult> CapNhatDonHang(int id)
        {
            var chiTietHd = await db.ChiTietHds
                        .Include(ct => ct.MaTrangThaiNavigation)
                        .Include(ct => ct.MaHhNavigation) // Bao gồm thông tin từ bảng Hàng Hóa
                        .FirstOrDefaultAsync(ct => ct.MaCt == id);

            if (chiTietHd == null)
            {
                return NotFound(); // Trả về 404 Not Found nếu không tìm thấy chi tiết hóa đơn
            }
            ViewBag.TrangThaiList = await db.TrangThais.ToListAsync();
            return View(chiTietHd); // Trả về view với chi tiết hóa đơn đã tìm thấy
        }
        [Route("capnhatdonhang/{id}")]
        [HttpPost]
        public async Task<IActionResult> CapNhatDH(int id, int maTrangThai)
        {
            // Lấy chi tiết đơn hàng từ cơ sở dữ liệu
            var chiTietHd = await db.ChiTietHds.FirstOrDefaultAsync(ct => ct.MaCt == id);

            if (chiTietHd == null)
            {
                return NotFound(); // Trả về 404 Not Found nếu không tìm thấy chi tiết đơn hàng
            }

            // Cập nhật trạng thái cho chi tiết đơn hàng
            chiTietHd.MaTrangThai = maTrangThai;

            // Lưu thay đổi vào cơ sở dữ liệu
            db.SaveChanges();

            return RedirectToAction("Index"); // Chuyển hướng về action Index hoặc một action khác tùy vào yêu cầu của bạn
        }
    }
}
