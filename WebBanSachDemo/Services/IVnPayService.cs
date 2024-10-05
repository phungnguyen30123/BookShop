using WebBanSachDemo.ViewModels;

namespace WebBanSachDemo.Services
{
    public interface IVnPayService
    {
        string CreatedPaymentUrl(HttpContext context, VnPaymentRequestModel model);
        VnPaymentResponseModel PaymentExecute(IQueryCollection collections);

    }
}
