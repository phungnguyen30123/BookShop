using Microsoft.AspNetCore.Mvc;
using WebBanSachDemo.Helpers;
using WebBanSachDemo.ViewModels;

namespace WebBanSachDemo.ViewComponents
{
    public class CartViewComponent: ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var cart =   HttpContext.Session.Get<List<CartItem>>
                (MySetting.CART_KEY) ?? new List<CartItem>();

            return View("CartPanel", new CartModel
            {
                Quantity = cart.Select(p => p.MaHh).Distinct().Count(),
                Total = cart.Sum (p => p.ThanhTien),
            });      
        }
    }
}
