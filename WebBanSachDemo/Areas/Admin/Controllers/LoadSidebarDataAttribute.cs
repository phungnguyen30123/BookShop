using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using WebBanSachDemo.Data;

namespace WebBanSachDemo.Areas.Admin.Controllers
{
    public class LoadSidebarDataAttribute : ActionFilterAttribute
    {
        private readonly WebBanSachDemoContext _context;

        public LoadSidebarDataAttribute(WebBanSachDemoContext context)
        {
            _context = context;
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var controller = context.Controller as Controller;
            if (controller != null)
            {
                controller.ViewBag.Loais = _context.Loais.ToList();
            }

            base.OnActionExecuting(context);
        }
    }

}
