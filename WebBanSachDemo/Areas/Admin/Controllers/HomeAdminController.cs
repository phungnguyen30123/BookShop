using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Runtime.Intrinsics.Arm;
using WebBanSachDemo.Data;

namespace WebBanSachDemo.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [ServiceFilter(typeof(LoadSidebarDataAttribute))]
    public class HomeAdminController : Controller
    {
        private readonly WebBanSachDemoContext db;
        private readonly IWebHostEnvironment _hostEnvironment;
        private readonly ILogger<HomeAdminController> _logger;

        public HomeAdminController(WebBanSachDemoContext context, IWebHostEnvironment hostEnvironment, ILogger<HomeAdminController> logger)
        {
            db = context;
            _hostEnvironment = hostEnvironment;
            _logger = logger;
        }

        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return RedirectToAction("SanPham");
        }

        [Route("loaisanpham")]
        public IActionResult LoaiSanPham()
        {
            var lstLoai = db.Loais.ToList();
            return View(lstLoai);
        }
        [Route("danhmuc")]
        [HttpGet]
        public IActionResult DanhMuc()
        {
            var loaiList = db.Loais.ToList();
            return View(loaiList);
        }

        [Route("themdanhmuc")]
        [HttpGet]
        public IActionResult ThemDanhMuc()
        {
            return View();
        }
        [Route("themdanhmuc")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemDanhMuc(Loai loai, List<IFormFile> HinhFiles)
        {
            if (ModelState.IsValid)
            {
                var existingLoai = db.Loais.FirstOrDefault(l => l.TenLoai == loai.TenLoai);
                if (existingLoai != null)
                {
                    TempData["Message"] = "Thêm Danh Mục Thất Bại(Đã tồn tại !!!!).";
                    TempData["MessageType"] = "success";
                    return RedirectToAction("DanhMuc");
                }

                db.Loais.Add(loai);
                db.SaveChanges();
                string wwwRootPath = _hostEnvironment.WebRootPath;
                string imagesPath = Path.Combine(wwwRootPath, "img");
                if (!Directory.Exists(imagesPath))
                {
                    Directory.CreateDirectory(imagesPath);
                }

                foreach (var file in HinhFiles)
                {
                    if (file != null && file.Length > 0)
                    {
                        // Generate unique file name
                        string fileName = Guid.NewGuid().ToString() + "_" + file.FileName;
                        string filePath = Path.Combine(imagesPath, fileName);

                        // Save the file
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }

                        // Save the first image to HangHoa
                        if (string.IsNullOrEmpty(loai.Hinh))
                        {
                            loai.Hinh = fileName;
                        }
                    }
                }

                db.SaveChanges();
                TempData["Message"] = "Thêm danh mục thành công.";
                TempData["MessageType"] = "success";

                return RedirectToAction("DanhMuc");
            }

            return View(loai);
        }
        [Route("xoasanpham/{id}")]
        [HttpPost]
        public IActionResult XoaSanPham(int id)
        {
            try
            {
                var sp = db.HangHoas.Find(id);
                if (sp == null)
                {
                    return Json(new { success = false, message = "Danh mục không tồn tại." });
                }

                db.HangHoas.Remove(sp);
                db.SaveChanges();
                return Json(new { success = true, message = "Xóa sản phẩm thành công" });
            }
            catch (Exception ex)
            {
                // Optionally log the exception here
                return Json(new { success = false, message = "Đã xảy ra lỗi khi xóa sản phẩm.", error = ex.Message });
            }
        }
       /* [Route("xoadanhmuc/{id}")]
        [HttpGet]
        public IActionResult XoaDanhMuc(int id)
        {
            var loai = db.Loais.Find(id);
            if (loai == null)
            {
                return NotFound();
            }
            return View(loai);
        }*/
        [Route("xoadanhmuc/{id}")]
        [HttpPost]
        public IActionResult DeleteDanhMuc(int id)
        {
            var loai = db.Loais.Find(id);
            if (loai == null)
            {
                return Json(new { success = false, message = "Danh mục không tồn tại." });
            }

            db.Loais.Remove(loai);
            db.SaveChanges();

            return Json(new { success = true, message = "Xóa danh mục thành công." });
        }

        [Route("sanpham/{categoryId?}")]
        public IActionResult SanPham(int? categoryId)
        {
            // Lưu mã loại vào TempData để sử dụng khi thêm sản phẩm mới
            TempData["MaLoai"] = categoryId;

            // Lấy thông tin về loại sản phẩm đã chọn
            ViewBag.MaLoai = categoryId;

            var query = db.HangHoas
               .Include(h => h.MaLoaiNavigation)
               .Include(h => h.MaNccNavigation)
               .Include(h => h.MaNxbNavigation)
               .AsQueryable();

            if (categoryId.HasValue)
            {
                query = query.Where(h => h.MaLoai == categoryId.Value);
            }

            var lstSanPham = query.ToList();
            return View(lstSanPham);
        }

        [Route("ThemSanPhamMoi")]
        [HttpGet]
        public IActionResult ThemSanPhamMoi()
        {
            int? maLoai = null;

            // Kiểm tra xem đã có mã loại sản phẩm được truyền từ request trước đó không
            if (TempData["MaLoai"] != null)
            {
                maLoai = (int)TempData["MaLoai"];
            }
            else
            {
                // Nếu không, kiểm tra xem đã có mã loại sản phẩm được lưu trong session chưa
                if (HttpContext.Session.GetInt32("MaLoai") != null)
                {
                    maLoai = HttpContext.Session.GetInt32("MaLoai");
                }
            }

            // Nếu không có maLoai, mặc định chọn loại đầu tiên
            if (maLoai == null)
            {
                ViewBag.MaLoai = new SelectList(db.Loais.ToList(), "MaLoai", "TenLoai");
            }
            else
            {
                ViewBag.MaLoai = new SelectList(db.Loais.ToList(), "MaLoai", "TenLoai", maLoai);
            }

            ViewBag.MaNcc = new SelectList(db.NhaCungCaps.ToList(), "MaNcc", "TenCongTy");
            ViewBag.MaNxb = new SelectList(db.NhaXuatBans.ToList(), "MaNxb", "Ten");
            return View();
        }

        [Route("ThemSanPhamMoi")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPhamMoi(HangHoa sanPham, List<IFormFile> HinhFiles)
        {
            if (ModelState.IsValid)
            {
                // First, save the HangHoa entity to get the MaHh value
                db.HangHoas.Add(sanPham);
                db.SaveChanges();

                string wwwRootPath = _hostEnvironment.WebRootPath;
                string imagesPath = Path.Combine(wwwRootPath, "img");

                // Ensure the directory exists
                if (!Directory.Exists(imagesPath))
                {
                    Directory.CreateDirectory(imagesPath);
                }

                foreach (var file in HinhFiles)
                {
                    if (file != null && file.Length > 0)
                    {
                        // Generate unique file name
                        string fileName = Guid.NewGuid().ToString() + "_" + file.FileName;
                        string filePath = Path.Combine(imagesPath, fileName);

                        // Save the file
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }

                        // Save the first image to HangHoa
                        if (string.IsNullOrEmpty(sanPham.Hinh))
                        {
                            sanPham.Hinh = fileName;
                        }

                        /*// Save all images to HinhAnhHh
                        HinhAnhHh hinhAnh = new HinhAnhHh
                        {
                            MaHh = sanPham.MaHh, // Use the MaHh value from the saved HangHoa entity
                            Hinh = fileName
                        };
                        db.HinhAnhHhs.Add(hinhAnh);*/
                    }
                }

                db.SaveChanges();

                // Lưu mã loại sản phẩm vào session
                HttpContext.Session.SetInt32("MaLoai", (int)sanPham.MaLoai);

                return RedirectToAction("sanpham");
            }
            else
            {
                _logger.LogWarning("Invalid product data: {@sanPham}", sanPham);
            }
            return View(sanPham);
        }

        [Route("SuaSanPham/{id}")]
        [HttpGet]
        public IActionResult SuaSanPham(int id)
        {
            try
            {
                var sanPham = db.HangHoas.Find(id);
                if (sanPham == null)
                {
                    return NotFound(); // Or return an appropriate view or message indicating the item wasn't found
                }

                // Load danh sách loại, nhà cung cấp, nhà xuất bản
                var loaiList = db.Loais.ToList();
                var nccList = db.NhaCungCaps.ToList();
                var nxbList = db.NhaXuatBans.ToList();

                if (loaiList == null || nccList == null || nxbList == null)
                {
                    return StatusCode(StatusCodes.Status500InternalServerError, "Failed to load data for dropdown lists.");
                }

                ViewBag.MaLoai = new SelectList(loaiList, "MaLoai", "TenLoai", sanPham.MaLoai);
                ViewBag.MaNcc = new SelectList(nccList, "MaNcc", "TenCongTy", sanPham.MaNcc);
                ViewBag.MaNxb = new SelectList(nxbList, "MaNxb", "Ten", sanPham.MaNxb);
                

                return View(sanPham);
            }
            catch (Exception ex)
            {
                // Optionally log the exception here
                return StatusCode(StatusCodes.Status500InternalServerError, $"An error occurred: {ex.Message}");
            }
        }
        [Route("SuaSanPham/{id}")]
        [HttpPost]
        public IActionResult SuaSanPham(int id, HangHoa sanPham, List<IFormFile> HinhFiles)
        {
            if (ModelState.IsValid)
            {
                var existingSanPham = db.HangHoas.Find(id);
                if (existingSanPham == null)
                {
                    return NotFound();
                }

                // Update other product information
                existingSanPham.TenHh = sanPham.TenHh;
                existingSanPham.TenAlias = sanPham.TenAlias;
                existingSanPham.TacGia = sanPham.TacGia;
                existingSanPham.MoTa = sanPham.MoTa;
                existingSanPham.DonGia = sanPham.DonGia;
                existingSanPham.MaLoai = sanPham.MaLoai;
                existingSanPham.MaNcc = sanPham.MaNcc;
                existingSanPham.MaNxb = sanPham.MaNxb;

                string wwwRootPath = _hostEnvironment.WebRootPath;
                string imagesPath = Path.Combine(wwwRootPath, "img");

                // Ensure the directory exists
                if (!Directory.Exists(imagesPath))
                {
                    Directory.CreateDirectory(imagesPath);
                }

                foreach (var file in HinhFiles)
                {
                    if (file != null && file.Length > 0)
                    {
                        // Generate unique file name
                        string fileName = Guid.NewGuid().ToString() + "_" + file.FileName;
                        string filePath = Path.Combine(imagesPath, fileName);

                        // Save the file
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }

                        // Update the image filename
                        existingSanPham.Hinh = fileName;
                    }
                }

                // Save changes to the database
                db.SaveChanges();

                // Redirect to the product listing page with the category ID
                return RedirectToAction("SanPham", new { categoryId = existingSanPham.MaLoai });
            }

            // If ModelState is not valid, return the view with the same model
            // This will display validation errors to the user
            return View(sanPham);
        }

        [Route("logout")]
        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Home", new { area = "" });
        }
        /* Quản Lí Anh*/
        [Route("QuanLyAnh/{id}")]
        [HttpGet]
        public IActionResult QuanLyAnh(int id)
        {
            var sanPham = db.HangHoas.Find(id);
            if (sanPham == null)
            {
                return NotFound();
            }

            var hinhAnhs = db.HinhAnhHhs.Where(h => h.MaHh == id).ToList();
            ViewBag.HinhAnhs = hinhAnhs;

            return View(sanPham);
        }

        [Route("QuanLyAnh/{id}")]
        [HttpPost]
        public IActionResult QuanLyAnh(int id, List<IFormFile> HinhFiles)
        {
            var sanPham = db.HangHoas.Find(id);
            if (sanPham == null)
            {
                return NotFound();
            }

            string wwwRootPath = _hostEnvironment.WebRootPath;
            string imagesPath = Path.Combine(wwwRootPath, "img");

            if (!Directory.Exists(imagesPath))
            {
                Directory.CreateDirectory(imagesPath);
            }

            foreach (var file in HinhFiles)
            {
                if (file != null && file.Length > 0)
                {
                    string fileName = Guid.NewGuid().ToString() + "_" + file.FileName;
                    string filePath = Path.Combine(imagesPath, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }

                    HinhAnhHh hinhAnh = new HinhAnhHh
                    {
                        MaHh = id,
                        Hinh = fileName
                    };

                    db.HinhAnhHhs.Add(hinhAnh);
                }
            }

            db.SaveChanges();

            return RedirectToAction("QuanLyAnh", new { id = id });
        }
    }
}
