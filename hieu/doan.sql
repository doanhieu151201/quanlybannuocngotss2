USE [Nuocngot]
GO
/****** Object:  Table [dbo].[Chitiethoadon]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chitiethoadon](
	[Mact] [int] IDENTITY(1,1) NOT NULL,
	[Mahd] [int] NULL,
	[Masp] [int] NULL,
	[Soluong] [int] NULL,
 CONSTRAINT [PK_Chitiethoadon] PRIMARY KEY CLUSTERED 
(
	[Mact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhmucSP]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhmucSP](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenDm] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhmucSP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hoadon]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadon](
	[Mahd] [int] IDENTITY(1,1) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
	[Diachi] [nvarchar](250) NULL,
	[Ngaygui] [date] NULL,
 CONSTRAINT [PK_Hoadon] PRIMARY KEY CLUSTERED 
(
	[Mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SP]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SP](
	[Masp] [int] IDENTITY(1,1) NOT NULL,
	[Anh] [varchar](250) NULL,
	[Ten] [nvarchar](50) NULL,
	[Gia] [int] NULL,
	[Ban] [int] NULL,
	[Loai] [nvarchar](50) NULL,
 CONSTRAINT [PK_SP] PRIMARY KEY CLUSTERED 
(
	[Masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tintuc]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tintuc](
	[Matt] [int] IDENTITY(1,1) NOT NULL,
	[Anh] [nvarchar](50) NULL,
	[Tentt] [nvarchar](50) NULL,
	[Noidung] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Tintuc] PRIMARY KEY CLUSTERED 
(
	[Matt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Chitiethoadon] ON 

INSERT [dbo].[Chitiethoadon] ([Mact], [Mahd], [Masp], [Soluong]) VALUES (1, 2, 2, 20)
INSERT [dbo].[Chitiethoadon] ([Mact], [Mahd], [Masp], [Soluong]) VALUES (3, 21, 23, 23)
SET IDENTITY_INSERT [dbo].[Chitiethoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhmucSP] ON 

INSERT [dbo].[DanhmucSP] ([id], [TenDm]) VALUES (0, N'Coca-Cola')
INSERT [dbo].[DanhmucSP] ([id], [TenDm]) VALUES (1, N'Fanta')
INSERT [dbo].[DanhmucSP] ([id], [TenDm]) VALUES (2, N'Sprite')
INSERT [dbo].[DanhmucSP] ([id], [TenDm]) VALUES (3, N'Pepsi')
INSERT [dbo].[DanhmucSP] ([id], [TenDm]) VALUES (9, N'hh')
SET IDENTITY_INSERT [dbo].[DanhmucSP] OFF
GO
SET IDENTITY_INSERT [dbo].[Hoadon] ON 

INSERT [dbo].[Hoadon] ([Mahd], [Hoten], [Diachi], [Ngaygui]) VALUES (1, N'DoanVanA', N'HungYen', CAST(N'2021-12-13' AS Date))
SET IDENTITY_INSERT [dbo].[Hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[SP] ON 

INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (2, N'asset/img/imgsprite/img1.png', N'Spriteee', 10000, 1000, N'sprite')
INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (3, N'Areas/Admin/content/img/imgcoca/sp1.png', N'cocaa', 10000, 500, N'coca')
INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (4, N'asset/img/imgcoca/sp2.jpg', N'Coca năng lượng', 10000, 300, N'coca')
INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (5, N'âsa', N'asset/img/imgsprite/img1.png', 2000, 35622, N'sprite')
INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (6, N'asset/img/imgfanta/img3.png', N'Fanta nho', 10000, 400, N'fanta')
INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (7, N'asset/img/imgcoca/sp3.jpg', N'Coca Chery', 10000, 200, N'coca')
INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (8, N'asset/img/imgfanta/img2.jpg', N'Fanta Chanh', 10000, 150, N'fanta')
INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (9, N'asset/img/imgsprite/img3.jpg', N'Sprite chanh', 10000, 50, N'sprite')
INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (10, N'toan', N'toan', 1000, 1, N'toan')
INSERT [dbo].[SP] ([Masp], [Anh], [Ten], [Gia], [Ban], [Loai]) VALUES (11, N'as', N'asd', 12, 12, N'fanta')
SET IDENTITY_INSERT [dbo].[SP] OFF
GO
SET IDENTITY_INSERT [dbo].[Tintuc] ON 

INSERT [dbo].[Tintuc] ([Matt], [Anh], [Tentt], [Noidung]) VALUES (1, N'Areas/Admin/content/img/imgcoca/sp1.png', N'Coca-cola', N'Coca siêu ngon')
INSERT [dbo].[Tintuc] ([Matt], [Anh], [Tentt], [Noidung]) VALUES (2, N'Areas/Admin/content/img/imgcoca/art2.png', N'Tin tức mới', N'Jon Radtke, giám đốc phát triển bền vững nước và nông nghiệp của Công ty Coca-Cola cho biết: "Chất                      lượng và tính toàn vẹn của các sản phẩm của chúng tôi phụ thuộc vào một chuỗi cung ứng lành mạnh với                      các cộng đồng và hệ sinh thái nông nghiệp thành công và phát triển mạnh mẽ. " "Chúng tôi đang làm việc                      với các nhà cung cấp và đối tác của mình để tạo ra sự thay đổi có hệ thống trong chuỗi cung ứng nông                      nghiệp của chúng tôi bằng cách thúc đẩy thực hành nông nghiệp bền vững và xây dựng khả năng của nhà cung                      cấp để đáp ứng các tiêu chuẩn về quyền con người và nơi làm việc, bảo vệ môi trường và quản lý trang trại                      có trách nhiệm được quy định trong Nguyên tắc nông nghiệp bền vững (PSA) của chúng tôi."')
INSERT [dbo].[Tintuc] ([Matt], [Anh], [Tentt], [Noidung]) VALUES (3, N'Areas/Admin/content/img/imgcoca/img1.jpg', N'Tin tức trong ngày', N'Người trồng ngô nhập dữ liệu vào công cụ Fieldprint Platform để đánh giá các quyết định canh tác                  liên quan đến đa dạng sinh học, sử dụng năng lượng, phát thải khí nhà kính, sử dụng nước có tưới                  tiêu, sử dụng đất, carbon đất, bảo tồn đất và chất lượng nước.')
INSERT [dbo].[Tintuc] ([Matt], [Anh], [Tentt], [Noidung]) VALUES (4, N'Areas/Admin/content/img/imgcoca/img8.jpg', N'Tin tức ngày hôm qua', N'Anna Pierce, giám đốc bền vững, Tate &Lyle, cho biết: "Tăng tốc cải tiến liên tục của Field to Market tiếp tục mang lại                  tiếng nói và tính nhất quán của ngành cho việc báo cáo và hỗ trợ các nhà cung cấp bền vững thực phẩm và nông nghiệp,                  như Tate & Lyle, trong việc chia sẻ kết quả với khách hàng, như Coca-Cola, đồng thời cải thiện tính minh bạch cho người                  tiêu dùng," Anna Pierce, giám đốc bền vững, Tate &Lyle cho biết.')
INSERT [dbo].[Tintuc] ([Matt], [Anh], [Tentt], [Noidung]) VALUES (5, N'Areas/Admin/content/img/imgcoca/img7.png', N'Coca mới', N'Kết quả ban đầu rất hứa hẹn. Nền tảng này đang thông báo cho người trồng về một số thực tiễn nhất định để thực hiện                  có thể giúp giảm lượng khí thải GHG, ví dụ, bằng cách thay đổi cây trồng che phủ, thực hành làm đất và sử dụng phân                   bón, Maguire nói, thêm rằng ít nhất năm năm dữ liệu là cần thiết để chứng minh giảm dấu chân môi trường bền vững. Công ty Coca-Cola sẽ tiếp tục đăng ký 100% nguồn cung ngô Của Hoa Kỳ trong Field to Market''s Continuous Improvement Accelerator')
INSERT [dbo].[Tintuc] ([Matt], [Anh], [Tentt], [Noidung]) VALUES (6, N'dsa', N'das', N'das')
SET IDENTITY_INSERT [dbo].[Tintuc] OFF
GO
/****** Object:  StoredProcedure [dbo].[addct]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addct]
   
  @Mahd int,
  @Masp int,
  @Soluong int
  as
  begin 
  insert into Chitiethoadon
  (
  
	  [Mahd]
	  ,[Masp]
	  ,[Soluong]

  )
  values
  (
 
  @Mahd ,
  @Masp ,
  @Soluong 
  )
  end
GO
/****** Object:  StoredProcedure [dbo].[addDanhm]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[addDanhm]
  @TenDm varchar(50)
  as
  begin 
  insert into DanhmucSP
  (
   
      [TenDm]
  )
  values
  (
 
  @TenDm 
  )
  end
GO
/****** Object:  StoredProcedure [dbo].[addHD]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addHD]
     @Mahd int,
  @Hoten nvarchar(50),
  @Diachi nvarchar(50),
  @Ngaygui Date
  as
  begin 
  insert into Hoadon
  (
  
	  [Mahd]
	  ,[Hoten]
	  ,[Diachi]
	  ,[Ngaygui]


  )
  values
  (
 
  @Mahd ,
  @Hoten ,

  @Diachi ,
  @Ngaygui
  )
  end
GO
/****** Object:  StoredProcedure [dbo].[addnew]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[addnew]
   
  @Anh nvarchar(50),
  @Tentt nvarchar(50),
  @Noidung nvarchar(50)
  as
  begin 
  insert into Tintuc
  (
  
      [Anh]
	  ,[Tentt]
	  ,[Noidung]
  )
  values
  (
 
  @Anh,
   @Tentt,
    @Noidung
  )
  end
GO
/****** Object:  StoredProcedure [dbo].[addSP]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[addSP]
 
  @Anh varchar(50),
  @Ten varchar(50),
  @Gia int,
  @Ban int,
  @Loai varchar(50)
  as
  begin 
  insert into SP
  (
   [Anh]
      ,[Ten]
      ,[Gia]
      ,[Ban]
      ,[Loai]


  )
  values
  (
  
  @Anh ,
  @Ten ,
  @Gia ,
  @Ban ,
  @Loai 
  )
  end
GO
/****** Object:  StoredProcedure [dbo].[delct]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create proc [dbo].[delct]
  @Mact int,
  @Mahd int,
  @Masp int,
  @Soluong int
  as
  begin
  delete from Chitiethoadon where Mact=@Mact
  end
GO
/****** Object:  StoredProcedure [dbo].[deldanhm]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deldanhm]
  @id int
  as
  begin
  delete from DanhmucSP where id=@id
  end
GO
/****** Object:  StoredProcedure [dbo].[deletee]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[deletee]
  @id int
  as
  begin
  delete from SP where Masp=@id
  end
GO
/****** Object:  StoredProcedure [dbo].[delHD]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[delHD]
  @Mahd int,
  @Hoten nvarchar(50),
  @Diachi nvarchar(50),
  @Ngaygui Date
  as
  begin
  delete from Hoadon where Mahd=@Mahd
  end
GO
/****** Object:  StoredProcedure [dbo].[delnew]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[delnew]
  @Matt int,
  @Anh nvarchar(50),
  @Tentt nvarchar(50),
  @Noidung nvarchar(50)
  as
  begin
  delete from Tintuc where Matt=@Matt
  end
GO
/****** Object:  StoredProcedure [dbo].[getallSP]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getallSP] as
begin
Select * from SP
end
GO
/****** Object:  StoredProcedure [dbo].[getcthd]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getcthd]
	as
	begin
	Select * from Chitiethoadon
	end
GO
/****** Object:  StoredProcedure [dbo].[getDanhmuc]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getDanhmuc]
  as
	begin
	Select * from DanhmucSP
	end
GO
/****** Object:  StoredProcedure [dbo].[getHD]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getHD]
	as
	begin
	Select * from Hoadon
	end
GO
/****** Object:  StoredProcedure [dbo].[getma]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getma]
 @id int
  as
  begin
  select * from DanhmucSP where id=@id
  end
GO
/****** Object:  StoredProcedure [dbo].[getmact]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getmact]
  @Mact int
  
  as
  begin
  select * from Chitiethoadon where Mact=@Mact
  end
GO
/****** Object:  StoredProcedure [dbo].[getmahd]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getmahd]
  @Mahd int

  as
  begin
  select * from Hoadon where Mahd=@Mahd
  end
GO
/****** Object:  StoredProcedure [dbo].[getmanew]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getmanew]
  @Matt int

  as
  begin
  select * from Tintuc where Matt=@Matt
  end
GO
/****** Object:  StoredProcedure [dbo].[getnew]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[getnew]
	as
	begin
	Select * from Tintuc
	end
GO
/****** Object:  StoredProcedure [dbo].[selectma]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[selectma]
  @id int
  as
  begin
  select * from SP where Masp=@id
  end
GO
/****** Object:  StoredProcedure [dbo].[updatect]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[updatect]
  @Mact int,
  @Mahd int,
  @Masp int,
  @Soluong int
  as
  begin
  update Chitiethoadon set Mahd=@Mahd,Masp=@Masp,Soluong=@Soluong Where Mact=@Mact
  end
GO
/****** Object:  StoredProcedure [dbo].[updateD]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateD]
  @id int,
  @TenDm varchar(50)
  as
  begin
  update DanhmucSP set TenDm=@TenDm Where id=@id 
  end
GO
/****** Object:  StoredProcedure [dbo].[updatee]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[updatee]
  @Masp int,
    @Anh varchar(50),
  @Ten varchar(50),
  @Gia int,
  @Ban int,
  @Loai varchar(50)
  as
  begin
  update SP set Anh=@Anh, Ten=@Ten,Gia=@Gia,Ban=@Ban,Loai=@Loai Where Masp=@Masp 
  end
GO
/****** Object:  StoredProcedure [dbo].[updateHD]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateHD]
 @Mahd int,
  @Hoten nvarchar(50),
  @Diachi nvarchar(50),
  @Ngaygui Date
  as
  begin
  update Hoadon set Hoten=@Hoten,Diachi=@Diachi ,Ngaygui=@Ngaygui Where Mahd=@Mahd
  end
GO
/****** Object:  StoredProcedure [dbo].[updatenew]    Script Date: 26/05/2022 9:31:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatenew]
  @Matt int,
  @Anh nvarchar(50),
  @Tentt nvarchar(50),
  @Noidung nvarchar(50)
  as
  begin
  update Tintuc set Anh=@Anh,Tentt=@Tentt,Noidung=@Noidung Where Matt=@Matt
  end
GO
