create database NguyenKimAnDB
go
use NguyenKimAnDB
go
create table UserAccount(
	Id int identity(1,1) primary key,
	UserName nvarchar(50),
	Passwords nvarchar(max),
	Status int
)
go
create table Category(
	Id int identity(1,1) primary key,
	Name nvarchar(max),
	Description nvarchar(max)
)
go
create table Product(
	Id int identity(1,1) primary key,
	Name nvarchar(max),
	UnitCost float,
	Quantity int,
	Image nvarchar(max),
	Description nvarchar(max),
	Status int,
	CategoryId int foreign key  references Category(Id)
)
go

insert into UserAccount values ('1811505310301','nguyenkiman',1)
insert into UserAccount values ('1811505310302','nguyenvantri',1)
insert into UserAccount values ('1811505310303','lethikimthoa',1)
insert into UserAccount values ('1811505310304','duongxuanduong',1)
insert into UserAccount values ('1811505310305','tangthidiemhuong',1)
insert into UserAccount values ('1811505310306','nguyenhuutuan',0)
insert into UserAccount values ('1811505310307','trinhquangphuc',0)
insert into UserAccount values ('1811505310130','nguyenthimai',0)
go
insert into Category values('Asus',N'ASUS là một trong ba nhà cung cấp máy tính xách tay hàng 
							đầu đồng thời ASUS cũng là nhà sản xuất bo mạch chủ bán chạy nhất và giành được nhiều giải')
insert into Category values('Acer',N'Acer là một tập đoàn đa quốc gia chuyên sản xuất và kinh doanh các thiết bị điện tử
							và phần cứng máy tính được thành lập từ năm 1976 có trụ sở tại Đài Loan')
insert into Category values('Dell',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.')
insert into Category values('HP',N'Giới thiệu về thương hiệu HP. HP là tên viết tắt của tập đoàn Hewlett-Packard,
được thành lập ngày 1/1/1939 tại bang California, Palo Alto')
insert into Category values('Lenovo',N'Lenovo Group Ltd là tập đoàn đa quốc gia về công nghệ máy tính có trụ sở
chính ở Bắc Kinh, Trung Quốc và Morrisville, Bắc Carolina, Mỹ.')
GO
insert into Product values (N'Laptop Asus ROG Zephyrus G',100,20,'images/skdarealest.jpg',N'ASUS là một trong ba nhà cung cấp máy tính xách tay hàng 
							đầu đồng thời ASUS cũng là nhà sản xuất bo mạch chủ bán chạy nhất và giành được nhiều giải',1,1);
insert into Product values (N'Laptop Dell Gaming G7 7588',200,20,'images/hip-hop-logo.jpg',N'ASUS là một trong ba nhà cung cấp máy tính xách tay hàng 
							đầu đồng thời ASUS cũng là nhà sản xuất bo mạch chủ bán chạy nhất và giành được nhiều giải',1,1);
insert into Product values (N'Apple Macbook Air 2019',300,30,'images/skdarealest.jpg',N'ASUS là một trong ba nhà cung cấp máy tính xách tay hàng 
							đầu đồng thời ASUS cũng là nhà sản xuất bo mạch chủ bán chạy nhất và giành được nhiều giải',1,1);
insert into Product values (N'Apple Macbook Pro Touch Bar 2019',400,30,'images/hip-hop-logo.jpg',N'ASUS là một trong ba nhà cung cấp máy tính xách tay hàng 
							đầu đồng thời ASUS cũng là nhà sản xuất bo mạch chủ bán chạy nhất và giành được nhiều giải',1,1);
insert into Product values (N'Laptop Asus Zenbook UX433FA-A6061T',500,40,'images/skdarealest.jpg',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop HP Envy 13',600,40,'images/hip-hop-logo.jpg',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Dell Latitude E5450',700,10,'images/skdarealest.jpg',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Gaming Asus',100,10,'images/hip-hop-logo.jpg',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Lenovo Legion Y530',200,20,'images/skdarealest.jpg',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Gaming Asus ROG',300,20,'images/hip-hop-logo.jpg',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Gaming Asus NG',400,33,'images/skdarealest.jpg',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Gaming Asus RR',500,44,'images/hip-hop-logo.jpg',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Dell XPS 13 9310 i5 1135G7/8GB/256GB/13.4"FHDTouch/Win 10',700,50,'images/laptop-asus-s330fn-ey037t-1.png',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Dell G3 15 3500B i7 10750H/16GB/512GB/15.6"FHD',700,50,'images/laptop-asus-s330fn-ey037t-1.png',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Dell G5 15 5500 i7 10750H/8GB/512GB/GeForce GTX1660 Ti',600,50,'images/laptop-asus-s330fn-ey037t-1.png',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Dell Inspiron N5502 i5 1135G7/8GB/512GB/15.6"FHD/Win 10',700,50,'images/laptop-asus-s330fn-ey037t-1.png',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Dell G5 15 5500 i7 10750H/16GB/512GB/15.6"FHD/NVIDIA GF RTX 2060 6GB/Win 10',200,50,'images/laptop-asus-s330fn-ey037t-1.png',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
insert into Product values (N'Laptop Dell Insprion N5406 i5 1135G7/8GB/512GB/GT MX330 2GB/14"FHD/Win 10',100,50,'images/laptop-asus-s330fn-ey037t-1.png',N'Laptop Dell là một thương hiệu đến từ Hòa Kỳ, với 30 hoạt động và phát triển cái tên
							này đã dần quen thuộc và là sự lựa chọn hàng đầu của người tiêu dùng.',1,1);
