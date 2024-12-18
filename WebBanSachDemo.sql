USE [WebBanSachDemo]
GO
/****** Object:  Table [dbo].[BanBe]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanBe](
	[MaBB] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](30) NULL,
	[MaHH] [int] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[NgayGui] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_BanBe] PRIMARY KEY CLUSTERED 
(
	[MaBB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[MaHH] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiamGia] [float] NOT NULL,
 CONSTRAINT [PK_ChiTietHD] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](500) NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GopY]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[MaGY] [int] IDENTITY(1,1) NOT NULL,
	[MaCD] [int] NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGY] [date] NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[CanTraLoi] [bit] NOT NULL,
	[TraLoi] [nvarchar](50) NULL,
	[NgayTL] [date] NULL,
 CONSTRAINT [PK_GopY] PRIMARY KEY CLUSTERED 
(
	[MaGY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [int] IDENTITY(1,1) NOT NULL,
	[TenHH] [nvarchar](max) NOT NULL,
	[TenAlias] [nvarchar](50) NULL,
	[MaLoai] [int] NOT NULL,
	[MoTaDonVi] [nvarchar](max) NULL,
	[DonGia] [float] NULL,
	[Hinh] [nvarchar](500) NULL,
	[NgaySX] [datetime] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[SoLanXem] [int] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaNCC] [int] NOT NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HinhAnhHH]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnhHH](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NULL,
	[Hinh] [nvarchar](max) NULL,
 CONSTRAINT [PK_HinhAnhHH] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nvarchar](30) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[NgayCan] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NOT NULL,
	[DienThoai] [nvarchar](24) NULL,
	[CachThanhToan] [nvarchar](50) NOT NULL,
	[CachVanChuyen] [nvarchar](50) NOT NULL,
	[PhiVanChuyen] [float] NOT NULL,
	[MaTrangThai] [int] NULL,
	[MaNV] [int] NULL,
	[GhiChu] [nvarchar](250) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[CauHoi] [nvarchar](150) NOT NULL,
	[TraLoi] [nvarchar](150) NOT NULL,
	[NgayDua] [date] NOT NULL,
	[MaNV] [int] NOT NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](30) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DiaChi] [nvarchar](60) NULL,
	[DienThoai] [nvarchar](24) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Hinh] [nvarchar](500) NULL,
	[HieuLuc] [bit] NOT NULL,
	[VaiTro] [int] NOT NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TenLoaiAlias] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Hinh] [nvarchar](max) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NULL,
	[NguoiLienLac] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaPB] [int] NOT NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaPB] [int] NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NOT NULL,
	[Sua] [bit] NOT NULL,
	[Xoa] [bit] NOT NULL,
	[Xem] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [int] IDENTITY(1,1) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] IDENTITY(1,1) NOT NULL,
	[TenTrangThai] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 5/2/2024 9:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaYT] [int] IDENTITY(1,1) NOT NULL,
	[MaHH] [int] NOT NULL,
	[MaKH] [nvarchar](30) NULL,
	[NgayChon] [datetime] NULL,
	[MoTa] [nvarchar](255) NULL,
 CONSTRAINT [PK_YeuThich] PRIMARY KEY CLUSTERED 
(
	[MaYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHD] ON 

INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (22, 21, 10, 69300, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (23, 22, 14, 64600, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (24, 23, 10, 69300, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (25, 24, 16, 73150, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (26, 25, 16, 73150, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (27, 26, 14, 64600, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (28, 31, 14, 64600, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (29, 32, 10, 69300, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (30, 33, 14, 64600, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (31, 43, 10, 69300, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (32, 44, 16, 73150, 4, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (33, 44, 10, 69300, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (34, 44, 14, 64600, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (35, 45, 10, 69300, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (36, 45, 14, 64600, 2, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (37, 46, 16, 73150, 1, 0)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaHH], [DonGia], [SoLuong], [GiamGia]) VALUES (38, 48, 14, 64600, 1, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHD] OFF
GO
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (10, N'999 Lá Thư Gửi Cho Chính Mình - Những Lá Thư Ấn Tượng Nhất (Phiên Bản Song Ngữ Trung - Việt)', N'999-la-thu', 4, N'	AZ Việt Nam', 69300, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935325010736.jpg', CAST(N'2023-01-01T00:00:00.000' AS DateTime), 61300, 2, N'999 Lá Thư Gửi Cho Chính Mình - Những Lá Thư Ấn Tượng Nhất (Phiên Bản Song Ngữ Trung - Việt)

Bạn có đang cảm thấy bị “quá tải” với cuộc sống hiện tại không?

Hay là đang loay hoay chữa lành giữa những bộn bề không thể gác lại, chỉ trực chờ để cuốn mình đi?

Đã bao lâu rồi bạn chưa ngồi xuống viết những dòng nhật ký, đã bao lâu rồi bạn chưa tự gửi cho mình một lá thư viết ra những điều bạn mong muốn, viết ra những ước mơ còn dang dở, viết ra những khó khăn bạn đã hoặc đang phải trải qua và cũng không quên động viên, cổ vũ chính mình của hiện tại, nhắn nhủ đến chính mình của tương lai…', 1)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (14, N'Trốn Lên Mái Nhà Để Khóc - Tặng Kèm Bookmark', N'tron-len-mai-nha', 4, N'Skybooks', 64600, N'https://cdn0.fahasa.com/media/catalog/product/b/_/b_a-1-tr_n-l_n-m_i-nh_-_-kh_c-2.jpg', CAST(N'2021-01-01T00:00:00.000' AS DateTime), 60400, 5, N'Những cơn gió heo may len lỏi vào từng góc phố nhỏ, mùa thu về gợi nhớ bao yêu thương đong đầy, bao xúc cảm dịu dàng của ký ức. Đó là nỗi nhớ đau đáu những hương vị quen thuộc của đồng nội, là hoài niệm bất chợt khi đi trên con đường cũ in dấu bao kỷ niệm... để rồi ta ước có một chuyến tàu kỳ diệu trở về những năm tháng ấy, trở về nơi nương náu bình yên sau những tháng ngày loay hoay để học cách trở thành một người lớn. Bạn sẽ được đắm mình trong những cảm xúc đẹp đẽ xen lẫn những tiếc nuối đầy lắng đọng trong “Trốn lên mái nhà đẻ khóc” của Lam.

Có nhiều câu chuyện luôn nằm trong khảm sâu của ký ức…', 1)
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [TenAlias], [MaLoai], [MoTaDonVi], [DonGia], [Hinh], [NgaySX], [GiamGia], [SoLanXem], [MoTa], [MaNCC]) VALUES (16, N'Hộp 12 Sáp Màu Rửa Được Máy Bay Colorkit - Thiên Long PCR-C018/AK', N'hop-12-sap', 1, N'Thiên Long Hoàn Cầu', 73150, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935324017248.jpg', CAST(N'2021-01-01T00:00:00.000' AS DateTime), 65150, 3, N'Bút sáp màu được sản xuất với hình máy bay bằng sáp mềm với thiết kế dễ cầm nắm đối với bàn tay nhỏ bé của các nghệ sĩ trẻ.

Sản phẩm gồm 12 bút sáp màu khác nhau thích hợp cho trẻ em khi bắt đầu tập tô màu.

Bộ sản phẩm đạt tiêu chuẩn chất lượng về an toàn sức khỏe, không độc hại, không gây kích ứng da, an toàn cho các bé.

Sáp khi tô vẽ rất mịn, tươi sáng, ăn màu tốt trên các loại giấy thông dụng.

Sản phẩm có hộp đựng giúp bảo quản sản phẩm tốt hơn, đảm bảo mỹ quan và có tặng kèm 1 bộ flashcard.

Đặc biệt: màu có thể rửa sạch trên da, vải, tường.

', 1)
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO
SET IDENTITY_INSERT [dbo].[HinhAnhHH] ON 

INSERT [dbo].[HinhAnhHH] ([id], [MaHH], [Hinh]) VALUES (1, 10, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935325010736.jpg?_gl=1*1u52r5j*_ga*MTQwNjMwNDI1NS4xNzEyMzMwNzI2*_ga_460L9JMC2G*MTcxMzgzOTUzMC43LjEuMTcxMzgzOTYyNS4yOC4wLjk5NDQxMDI1OA..*_gcl_au*MTM2MjE1ODUxOS4xNzEyMzMwNzI2')
INSERT [dbo].[HinhAnhHH] ([id], [MaHH], [Hinh]) VALUES (3, 10, N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/999_la_thu_gui_cho_chinh_minh___nhung_la_thu_an_tuong_nhat_phien_ban_song_ngu_trung___viet/2023_06_09_17_36_46_1-390x510.jpg?_gl=1*wbxeeo*_ga*MTQwNjMwNDI1NS4xNzEyMzMwNzI2*_ga_460L9JMC2G*MTcxMzgzOTUzMC43LjEuMTcxMzgzOTc3OS41OC4wLjk5NDQxMDI1OA..*_gcl_au*MTM2MjE1ODUxOS4xNzEyMzMwNzI2')
INSERT [dbo].[HinhAnhHH] ([id], [MaHH], [Hinh]) VALUES (4, 10, N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/999_la_thu_gui_cho_chinh_minh___nhung_la_thu_an_tuong_nhat_phien_ban_song_ngu_trung___viet/2023_06_09_17_36_46_2-390x510.jpg?_gl=1*142fzd*_ga*MTQwNjMwNDI1NS4xNzEyMzMwNzI2*_ga_460L9JMC2G*MTcxMzgzOTUzMC43LjEuMTcxMzgzOTg0NC41My4wLjk5NDQxMDI1OA..*_gcl_au*MTM2MjE1ODUxOS4xNzEyMzMwNzI2')
INSERT [dbo].[HinhAnhHH] ([id], [MaHH], [Hinh]) VALUES (5, 14, N'https://cdn0.fahasa.com/media/catalog/product/b/_/b_a-1-tr_n-l_n-m_i-nh_-_-kh_c-2.jpg?_gl=1*1bunbn6*_ga*MTQwNjMwNDI1NS4xNzEyMzMwNzI2*_ga_460L9JMC2G*MTcxMzk1NzQwMi45LjEuMTcxMzk1NzQxMC41Mi4wLjE4NDMxMTExMTk.*_gcl_au*MTM2MjE1ODUxOS4xNzEyMzMwNzI2')
INSERT [dbo].[HinhAnhHH] ([id], [MaHH], [Hinh]) VALUES (6, 14, N'https://cdn0.fahasa.com/media/catalog/product/b/_/b_a_1_tr_n-l_n-m_i-nh_-_-kh_c.jpg')
INSERT [dbo].[HinhAnhHH] ([id], [MaHH], [Hinh]) VALUES (7, 14, N'https://cdn0.fahasa.com/media/catalog/product/_/n/_nh_2_tr_n-l_n-m_i-nh_-_-kh_c.jpg?_gl=1*1a7vbza*_ga*MTQwNjMwNDI1NS4xNzEyMzMwNzI2*_ga_460L9JMC2G*MTcxMzk1NzQwMi45LjEuMTcxMzk1NzUzMS41Ni4wLjE4NDMxMTExMTk.*_gcl_au*MTM2MjE1ODUxOS4xNzEyMzMwNzI2')
INSERT [dbo].[HinhAnhHH] ([id], [MaHH], [Hinh]) VALUES (8, 16, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935324017248.jpg')
INSERT [dbo].[HinhAnhHH] ([id], [MaHH], [Hinh]) VALUES (9, 16, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935324017248-3.jpg')
INSERT [dbo].[HinhAnhHH] ([id], [MaHH], [Hinh]) VALUES (10, 16, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935324017248-1.jpg')
SET IDENTITY_INSERT [dbo].[HinhAnhHH] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (21, N'HoangElsu1', CAST(N'2024-04-29T07:17:17.077' AS DateTime), NULL, NULL, N'Đinh Việt Hoàng', N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'COD', N'GRAB', 0, 1, NULL, N'Alo')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (22, N'HoangElsu1', CAST(N'2024-04-29T07:17:41.187' AS DateTime), NULL, NULL, N'Hoàng Bụi', N'Đại Ca Quảng Nam', N'123456789', N'COD', N'GRAB', 0, 1, NULL, N'AA')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (23, N'HoangElsu1', CAST(N'2024-04-29T14:49:54.330' AS DateTime), NULL, NULL, N'Đinh Việt Hoàng', N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'COD', N'GRAB', 0, 1, NULL, N'abcd')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (24, N'HoangElsu1', CAST(N'2024-04-29T14:51:27.323' AS DateTime), NULL, NULL, N'Đinh Việt Hoàng', N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'COD', N'GRAB', 0, 1, NULL, N'aaaaa')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (25, N'HoangElsu1', CAST(N'2024-04-29T14:52:08.593' AS DateTime), NULL, NULL, N'Đinh Việt Hoàng', N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'COD', N'GRAB', 0, 1, NULL, N'aaaaaaaa')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (26, N'HoangElsu1', CAST(N'2024-04-29T14:53:45.983' AS DateTime), NULL, NULL, N'Đinh Việt Hoàng', N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'COD', N'GRAB', 0, 1, NULL, N'aw')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (31, N'HoangElsu1', CAST(N'2024-05-01T07:13:44.963' AS DateTime), NULL, NULL, NULL, N'1', NULL, N'PAYPAL', N'GRAB', 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (32, N'HoangElsu1', CAST(N'2024-05-01T08:07:29.647' AS DateTime), NULL, NULL, N'Đinh Việt Hoàng', N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'COD', N'GRAB', 0, 1, NULL, N'uuuu')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (33, N'HoangElsu1', CAST(N'2024-05-01T08:52:58.723' AS DateTime), NULL, NULL, N'aaaaaaaaaaaa', N'Đại Ca Quảng Nam', N'123456789', N'COD', N'GRAB', 0, 1, NULL, N'aaaaaa')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (43, N'HoangElsu1', CAST(N'2024-05-01T09:15:22.593' AS DateTime), NULL, NULL, N'Đinh Việt Hoàng', N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'COD', N'GRAB', 0, 1, NULL, N'aaaaa')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (44, N'HoangElsu1', CAST(N'2024-05-01T09:15:42.333' AS DateTime), NULL, NULL, N'Đinh Việt Hoàng', N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'COD', N'GRAB', 0, 1, NULL, N'eeeeeeeeee')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (45, N'HoangElsu1', CAST(N'2024-05-01T19:51:57.540' AS DateTime), NULL, NULL, N'Đinh Việt Hoàng', N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'COD', N'GRAB', 0, 1, NULL, N'Tao đây này')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (46, N'HoangBui', CAST(N'2024-05-02T09:32:07.297' AS DateTime), NULL, NULL, N'Hoàng Bụi', N'Đại Ca Quảng Nam', N'0901143703', N'Đặt hàng COD', N'GRAB', 0, 1, NULL, N'OKE NHES')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [NgayDat], [NgayCan], [NgayGiao], [HoTen], [DiaChi], [DienThoai], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [MaNV], [GhiChu]) VALUES (48, N'HoangElsu1', CAST(N'2024-05-02T09:35:46.783' AS DateTime), NULL, NULL, N'Nguyen Van A', N'aaaaaaaaaa', N'1234567', N'Đặt hàng COD', N'GRAB', 0, 1, NULL, N'1re')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'HoangBui', N'97c5f74c37b2dc9424b87d3fa9d31488', N'Hoàng Bụi', 1, CAST(N'2024-04-28T00:00:00.000' AS DateTime), N'Đại Ca Quảng Nam', N'0901143703', N'hoang2222003@gmail.com', N'', 1, 0, N'u@WyV')
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'HoangElsu', N'b8a2a91c47744322d9a14463d1fcb044', N'Đinh Việt Hoàng', 1, CAST(N'2003-02-22T00:00:00.000' AS DateTime), N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'hoang2222003@gmail.com', N'', 1, 0, N'SdVUv')
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [Hinh], [HieuLuc], [VaiTro], [RandomKey]) VALUES (N'HoangElsu1', N'9de38ff5393a5e580582d3e49e88393f', N'Đinh Việt Hoàng', 1, CAST(N'2024-04-20T00:00:00.000' AS DateTime), N'Thôn Hà My Đông A, Điện Dương, Điện Bàn, Quảng Nam', N'0901143703', N'hoang2222003@gmail.com', N'', 1, 0, N'qL?e@')
GO
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (1, N'Bút Vẽ Trang Trí', N'but-ve-trang-tri', N'
Bút vẽ trang trí là một công cụ sáng tạo phổ biến được sử dụng để tạo ra các tác phẩm nghệ thuật trên nhiều bề mặt khác nhau như giấy, vải, gốm, và thậm chí là tường. Chúng thường có các ngòi mảnh nhỏ với nhiều loại độ dày và hình dạng khác nhau để tạo ra các đường vẽ và chi tiết khác nhau. Các loại bút vẽ trang trí phổ biến bao gồm bút mực, bút sáp, bút màu nước, bút lông, và bút chì màu. Mỗi loại bút có đặc tính và ứng dụng riêng, giúp người sử dụng có thể thể hiện sự sáng tạo của mình qua các bức tranh, họa tiết hoặc chữ viết độc đáo.', N'https://cdn0.fahasa.com/media/wysiwyg/Huyen-KD/6921738026268_5_-removebg-preview.png')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (2, N'Quạt Mini', N'quat-mini', N'Quạt mini là một thiết bị nhỏ gọn và di động được thiết kế để cung cấp luồng gió mát trong các tình huống cần thiết', N'https://www.fahasa.com/bach-hoa-t-ng-h-p/d-di-n-gia-d-ng/quat-cac-loai/quat-sac.html')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (3, N'Đam Mỹ', N'dam-my', N'
Sách đam mỹ là một thể loại văn học tập trung vào mối quan hệ tình cảm giữa những nam nhân. ', N'https://www.fahasa.com/sach-trong-nuoc/dam-y.html')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa], [Hinh]) VALUES (4, N'Văn Học', N'va-hoc', N'Sách văn học là những tác phẩm văn học được viết bằng ngôn ngữ nghệ thuật để thể hiện và truyền đạt các ý tưởng, cảm xúc và trải nghiệm của con người thông qua câu chuyện, nhân vật và ngôn ngữ.', N'https://www.fahasa.com/trang-van-hoc')
SET IDENTITY_INSERT [dbo].[Loai] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenCongTy], [Logo], [NguoiLienLac], [Email], [DienThoai], [DiaChi], [MoTa]) VALUES (1, N'AZ Việt Nam', NULL, N'	Miêu Công Tử', N'mieucongtu@gmail.com', N'123456789', N'', NULL)
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[TrangThai] ON 

INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Khách hàng hủy đơn hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Mới đặt hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (3, N'Đã thanh toán', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (4, N'Chờ giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (5, N'Đã giao hàng', NULL)
SET IDENTITY_INSERT [dbo].[TrangThai] OFF
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_HangHoa]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_KhachHang]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_HoaDon]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_ChuDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuDe] ([MaCD])
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_ChuDe]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_Loai]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_NhaCungCap]
GO
ALTER TABLE [dbo].[HinhAnhHH]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnhHH_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[HinhAnhHH] CHECK CONSTRAINT [FK_HinhAnhHH_HangHoa]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_HangHoa]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_KhachHang]
GO
