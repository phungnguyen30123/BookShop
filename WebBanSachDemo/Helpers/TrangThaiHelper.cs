namespace WebBanSachDemo.Helpers
{
    public static class TrangThaiHelper
    {
        public static string GetBackgroundColor(string tenTrangThai)
        {
            switch (tenTrangThai)
            {
                case "Mới đặt hàng":
                    return "background-color: #ff6666;"; // Đỏ
                case "Khách hàng hủy đơn hàng":
                    return "background-color: #ffd966;"; // Vàng
                case "Đã thanh toán":
                    return "background-color: #66ff66;"; // Xanh lá cây
                case "Chờ giao hàng":
                    return "background-color: #66b3ff;"; // Xanh dương
                case "Đã giao hàng":
                    return "background-color: #9966ff;"; // Tím
                default:
                    return "";
            }
        }
    }
}

