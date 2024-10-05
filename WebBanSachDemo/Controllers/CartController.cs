using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net.NetworkInformation;
using WebBanSachDemo.Data;
using WebBanSachDemo.Helpers;
using WebBanSachDemo.Services;
using WebBanSachDemo.ViewModels;
using X.PagedList;

namespace WebBanSachDemo.Controllers
{
    public class CartController : Controller
    {
        private readonly IVnPayService _vnPayservice;
        private readonly PaypalClient _paypalClient;
        private readonly WebBanSachDemoContext db;
        public CartController(WebBanSachDemoContext context,PaypalClient paypalClient,IVnPayService vnPayService)
        {
            _vnPayservice = vnPayService;
            _paypalClient = paypalClient;
            db = context;
        }
       /* const string CART_KEY = "MYCART";*/
        public List<CartItem> Cart => HttpContext.Session.Get<List<CartItem>>
            (MySetting.CART_KEY) ?? new List<CartItem>();
        public IActionResult Index()
        {
            return View(Cart);
        }
        public IActionResult AddToCart(int id, int quantity = 1, string operation = "plus")
        {
            var gioHang = Cart;
            var item = gioHang.SingleOrDefault(p => p.MaHh == id);
            if (item == null)
            {
                var hangHoa = db.HangHoas.SingleOrDefault(p => p.MaHh == id);
                if (hangHoa == null)
                {
                    /* TempData["Message"] = $"Không tìm thấy sản phẩm có mã {id}";
                     return Redirect("/404");*/
                    return Json(new { success = false, message = $"Không tìm thấy sản phẩm có mã {id}" });
                }
                item = new CartItem
                {
                    MaHh = hangHoa.MaHh,
                    TenHH = hangHoa.TenHh,
                    DonGia = hangHoa.DonGia ?? 0,
                    Hinh = hangHoa.Hinh ?? string.Empty,
                    SoLuong = quantity
                };
                gioHang.Add(item);
               
            }
            else
            {
                if (operation == "plus")
                {
                    item.SoLuong += 1; 
                    HttpContext.Session.Set(MySetting.CART_KEY, gioHang);
                    return RedirectToAction("Index");
                }
                else if (operation == "minus")
                {
                    if (item.SoLuong > 1)
                    {
                        item.SoLuong -= 1; 
                        HttpContext.Session.Set(MySetting.CART_KEY, gioHang);
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        item.SoLuong  = 1; 
                        HttpContext.Session.Set(MySetting.CART_KEY, gioHang);
                        return RedirectToAction("Index");
                    }
                }
            }
            /* HttpContext.Session.Set(MySetting.CART_KEY, gioHang);
             return RedirectToAction("Index");*/
            HttpContext.Session.Set(MySetting.CART_KEY, gioHang);
            return Json(new { success = true, message = "Sản phẩm đã được thêm vào giỏ hàng."});
        }

        public IActionResult RemoveCart(int id)
        {
            var gioHang = Cart;
            var item = gioHang.SingleOrDefault(p => p.MaHh == id);
            if(item != null)
            {
                gioHang.Remove(item);
            }
            HttpContext.Session.Set(MySetting.CART_KEY, gioHang);
            return RedirectToAction("Index");
        }
        [Authorize]
        [HttpGet]
        public IActionResult Checkout()
        {

            if(Cart.Count == 0)
            {
                return Redirect("/");
            }
            ViewBag.PaypalClientId = _paypalClient.ClientId;
            return View(Cart);
        }
        [Authorize]
        [HttpPost]
        public IActionResult Checkout(CheckoutVM model, string payment = "COD")
        {
			if (ModelState.IsValid)
			{
                if(payment == "Thanh Toán VNPAY")
                {
                    var vnPaymodel = new VnPaymentRequestModel
                    {
                        Amount = Cart.Sum(p => p.ThanhTien),
                        CreatedDate = DateTime.Now,
                        Description = $"{model.HoTen} {model.DienThoai}",
                        FullName = model.HoTen,
                        OrderId = new Random().Next(100, 1000)
                    };
                    return Redirect(_vnPayservice.CreatedPaymentUrl(HttpContext, vnPaymodel));
                }
				var customerId = HttpContext.User.Claims.SingleOrDefault(p => p.Type == MySetting.CLAIM_CUSTOMERID).Value;
				var khachHang = new KhachHang();
				if (model.GiongKhachHang)
				{
					khachHang = db.KhachHangs.SingleOrDefault(kh => kh.MaKh == customerId);
				}

				var hoadon = new HoaDon
				{
					MaKh = customerId,
					HoTen = model.HoTen ?? khachHang.HoTen,
					DiaChi = model.DiaChi ?? khachHang.DiaChi,
					DienThoai = model.DienThoai ?? khachHang.DienThoai,
					NgayDat = DateTime.Now,
					CachThanhToan = payment,
					CachVanChuyen = "GRAB",
					MaTrangThai = 1,
					GhiChu = model.GhiChu
				};
				db.Database.BeginTransaction();
				try
				{
					db.Database.CommitTransaction();
					db.Add(hoadon);
					db.SaveChanges();

					var cthds = new List<ChiTietHd>();
					foreach (var item in Cart)
					{
						cthds.Add(new ChiTietHd
						{
							MaHd = hoadon.MaHd,
							SoLuong = item.SoLuong,
							DonGia = item.DonGia,
							MaHh = item.MaHh,
                            MaTrangThai = 2,

							GiamGia = 0
						});
					}
					db.AddRange(cthds);
					db.SaveChanges();
					HttpContext.Session.Set<List<CartItem>>(MySetting.CART_KEY, new List<CartItem>());
					return View("Success");
				}
				catch
				{
					db.Database.RollbackTransaction();
				}
			}

			return View(Cart);
		}
        [Authorize]
        public IActionResult PaymentSuccess()
        {
            return View("Success");
        }
        #region
        [Authorize]
        [HttpPost("Cart/create-paypal-order")]
        public async Task<IActionResult> CreatePaypalOrder(CancellationToken cancellationToken)
        {
            // thông tin đơn hàng gửi qua Paypal
            var tongTien = Cart.Sum(p => p.ThanhTien).ToString();
            var donViTienTe = "USD";
            var maDonHangThamChieu = "DH" + DateTime.Now.Ticks.ToString();
            try
            {
                var response = await _paypalClient.CreateOrder(tongTien, donViTienTe, maDonHangThamChieu);
                return Ok(response);
            }
            catch(Exception ex)
            {
                var error = new { ex.GetBaseException().Message };
                return BadRequest(error);
            }

        }
        [Authorize]
        [HttpPost("Cart/capture-paypal-order")]
        public async Task<IActionResult> CapturePaypalOrder(string orderID, CancellationToken cancellationToken, [FromForm] CheckoutVM model)
        {
            try
            {
                var response = await _paypalClient.CaptureOrder(orderID);

                // Lưu database đơn hàng của mình

                return Ok(response);
            }
            catch (Exception ex)
            {
                var error = new { ex.GetBaseException().Message };
                return BadRequest(error);
            }
        }
        #endregion
        [Authorize]
        public IActionResult PaymentFails()
        {
            return View();
        }
        [Authorize]
        public IActionResult PaymentCallBack()
        {
            var response = _vnPayservice.PaymentExecute(Request.Query);
            if(response == null || response.VnPayResponseCode != "00")
            {
                TempData["Message"] = $"Lỗi thanh toán VNPAY:{response.VnPayResponseCode}";
                return RedirectToAction("PaymentFails");
            }
            //Lưu đơn hàng dô data
            TempData["Message"] = "Thanh toán VNPAY thàng công";
            return RedirectToAction("PaymentSuccess");
        }
    }

}
