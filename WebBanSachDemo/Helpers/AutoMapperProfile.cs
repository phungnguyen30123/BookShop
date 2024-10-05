﻿using AutoMapper;
using WebBanSachDemo.Data;
using WebBanSachDemo.ViewModels;

namespace WebBanSachDemo.Helpers
{
    public class AutoMapperProfile:Profile
    {
        public AutoMapperProfile() {
            CreateMap<RegisterVM, KhachHang>();
                /*.ForMember(kh => kh.HoTen, option => option.MapFrom(RegisterVM =>
                RegisterVM.HoTen))*/
        }
    }
}
