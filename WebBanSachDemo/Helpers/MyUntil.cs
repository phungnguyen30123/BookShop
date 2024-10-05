using System.Text;

namespace WebBanSachDemo.Helpers
{
    public class MyUntil
    {
        public static string GenerateRamdomkey(int lenght = 5)
        {
            var patter = @"qazwsxedcrfvtgbyhnujmiklopQAZWSCEDCXRFVTGBYHNUJMIKLOP!?@#$";
            var sb = new StringBuilder();
            var rd = new Random();
            for(int i = 0; i < lenght; i++)
            {
                sb.Append(patter[rd.Next(0, patter.Length)]);
            }
            return sb.ToString();
        }
    }
}
