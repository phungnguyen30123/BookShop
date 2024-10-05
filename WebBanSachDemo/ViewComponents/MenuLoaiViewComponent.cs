using Microsoft.AspNetCore.Mvc;
using WebBanSachDemo.Data;
using WebBanSachDemo.ViewModels;

namespace WebBanSachDemo.ViewComponents
{
    public class MenuLoaiViewComponent : ViewComponent
    {
        private readonly WebBanSachDemoContext db;
        public MenuLoaiViewComponent(WebBanSachDemoContext context) => db = context;
        public IViewComponentResult Invoke()
        {
            var data = db.Loais.Select(lo => new MenuLoaiVM
            {
                MaLoai = lo.MaLoai,
                TenLoai = lo.TenLoai,
                SoLuong = lo.HangHoas.Count
            }).OrderBy(p => p.TenLoai);

            return View(data); // Default.cshtml)
        }
    }
}
