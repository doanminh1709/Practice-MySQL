create database QLBH;
use QLBH;


create table HangSX(
	MaHangSX varchar(20) ,
    TenHang varchar(30) not null , 
    DiaChi varchar(30) not null , 
    SoDt varchar(9) , 
    Email varchar(30), 
    primary key(MaHangSX)
);
create table SanPham(
	 MaSp varchar(20) , 
     MaHangSX varchar(20) , 
     TenSp varchar(30) not null , 
     SoLuong int not null , 
     MauSac varchar(30) not null , 
     GiaBan float not null , 
     DonViTinh varchar(20) , 
     MoTa varchar(20),
     primary key(MaSp) ,
     foreign key(MaHangSX) references HangSX(MaHangSX)
);

create table NhanVien(
	MaNV varchar(20) , 
    TenNV varchar(30) not null , 
    GioiTinh varchar(10) , 
    DiaChi varchar(30) , 
    SoDT varchar(9) not null , 
    Email varchar(30) , 
    TenPhong varchar(40),
    primary key(MaNv)
);
create table PNhap(
	SoHDN varchar(30) , 
    NgayNhap datetime not null , 
    MaNV varchar(20) , 
    primary key(SoHDN) , 
  constraint Fk_Pn foreign key(MaNV) references NhanVien(MaNV)
);

create table Nhap(
	 SoHDN varchar(30) , 
     MaSp varchar(20) , 
     SoLuongN int not null , 
     DonGiaNhap float not null , 
     constraint Pk_Nhap primary key(SoHDN,MaSp),
     constraint Fk_Nhap_Sp foreign key(MaSp) references SanPham(MaSp), 
     constraint Fk_Nhap_PNhap foreign key(SoHDN) references PNhap(SoHDN)
);

create table PXuat(
	SoHDX varchar(30) , 
    NgayXuat datetime not null , 
    MaNV varchar(20) , 
    primary key(SoHDX) , 
    constraint Fk_Px foreign key(MaNV) references NhanVien(MaNV)
);

create table Xuat(
	 SoHDX varchar(30) , 
     MaSp varchar(20) , 
     SoLuongX int not null , 
     constraint Pk_Nhap primary key(SoHDX,MaSp),
     constraint Fk_Xuat_Sp foreign key(MaSp) references SanPham(MaSp), 
     constraint Fk_Xuat_PXuat foreign key(SoHDX) references PXuat(SoHDX)
);


-- add data 
insert into HangSX values('HSP001' , 'SamSung' , N'Hà Nội' , '089764531' ,'Samsung@gmail.com');
insert into HangSX values('HSP002' , 'Sony' , N'Hải Phòng' , '089234354' ,'Sony@gmail.com');
insert into HangSX values('HSP003' , 'Panasonic' , N'Hà Nội','023264531' ,'Panasonic@gmail.com');
insert into HangSX values('HSP004' , 'Apple' , N'Ninh Bình' ,   '023764534' ,'Apple@gmail.com');
insert into HangSX values('HSP005' , 'Toyota' , N'Thanh Hóa' ,  '034376336' ,'Toyota@gmail.com');
select*from HangSX;

insert into SanPham values('SP1' ,'HSP002'  , N'Tivi' , 233 , N'Đen' , 140000.34 , 'VND' , N'Hàng bóc hộp');
insert into SanPham values('SP2' ,'HSP001'  , N'Tủ lạnh' , 123 , N'Đỏ' , 230000.34 , 'VND' , N'Hàng bóc hộp');
insert into SanPham values('SP3' ,'HSP005'  , N'Máy giặt' , 433 , N'Vàng' , 430000.34 , 'VND' , N'Hàng bóc hộp');
insert into SanPham values('SP4' ,'HSP003'  , N'Điều Hòa' , 534 , N'Tím' , 3650000.34 , 'VND' , N'Hàng bóc hộp');
insert into SanPham values('SP5' ,'HSP004'  , N'Điện thoại' , 625 , N'Xanh' , 530000.34 , 'VND' , N'Hàng bóc hộp');
insert into SanPham values('SP6' ,'HSP001'  , N'Nồi cơm' , 225 , N'Xanh' , 530000.34 , 'VND' , N'Hàng bóc hộp');
select*from SanPham;

insert into NhanVien values('NV1' , N'Nguyễn Thị A' , N'Nữ' , N'Nam Định' ,   '023764531' , 'nguyenthia@gmail.com' , N'Kế toán');
insert into NhanVien values('NV2' , N'Nguyễn Thị B' , N'Nữ' ,  N'Hải Phòng' , '023264535' , 'nguyenthib@gmail.com' , N'Kinh doanh');
insert into NhanVien values('NV3' , N'Nguyễn Thị C' , N'Nữ' , N'Yên Bái' ,    '045464533' , 'nguyenthic@gmail.com' , N'Marketing');
insert into NhanVien values('NV4' , N'Nguyễn Văn D' , N'Nam' ,  N'Hải Phòng' ,'045464533' , 'nguyenvand@gmail.com' , N'Quản lý');
insert into NhanVien values('NV5' , N'Nguyễn Hữu E' , N'Nam' , N'Quảng Bình' ,'045464534' , 'nguyenhuue@gmail.com' , N'Điều hành');
insert into NhanVien values('NV6' , N'Nguyễn Văn F' , N'Nam' , N'Nghệ An' ,   '034554324' , 'nguyenvanf@gmail.com' , N'Quản lý');
select*from NhanVien;

insert into PNhap values('SHDN1' , '2020-09-22' , 'NV1');
insert into PNhap values('SHDN2' , '2020-08-11' , 'NV2');
insert into PNhap values('SHDN3' , '2019-11-12' , 'NV2');
insert into PNhap values('SHDN4' , '2020-12-10' , 'NV4');
insert into PNhap values('SHDN5' , '2019-01-15' , 'NV5');
select*from PNhap;

insert into PXuat values('SHXN1' , '2021-09-11' ,'NV1');
insert into PXuat values('SHXN2' , '2021-11-02' ,'NV2');
insert into PXuat values('SHXN3' , '2022-09-23' ,'NV4');
insert into PXuat values('SHXN4' , '2021-09-25' , 'NV3');
insert into PXuat values('SHXN5' , '2021-05-07' , 'NV5');
select*from PXuat;


insert into Nhap values('SHDN1' , 'SP1' , 232 , 230000.3);
insert into Nhap values('SHDN3' , 'SP2' , 121 , 5430000.3);
insert into Nhap values('SHDN4' , 'SP3' , 424 , 5430000.3);
insert into Nhap values('SHDN5' , 'SP5' , 454 , 530000.3);
insert into Nhap values('SHDN2' , 'SP4' , 353 , 330000.3);
select*from Nhap;

insert into Xuat values('SHXN1' , 'SP3' , 119);
insert into Xuat values('SHXN4' , 'SP1' , 242);
insert into Xuat values('SHXN5' , 'SP2' , 452);
insert into Xuat values('SHXN3' , 'SP4' , 643);
insert into Xuat values('SHXN2' , 'SP5' , 455);
insert into Xuat values('SHXN1' , 'SP6' , 232);
select*from Xuat;


-- practice 
select MaSP , TenSP , TenHang , MauSac , GiaBan , DonViTinh , MoTa from SanPham , HangSX 
where SanPham.MaHangSX = HangSX.MaHangSx 
order by GiaBan DESC;

-- Dua ra thong tin cac sp do hang samsung sx 
select MaSP , TenSP , MauSac , GiaBan , DonViTinh , MoTa from SanPham , HangSX 
where SanPham.MaHangSX = HangSX.MaHangSx and TenHang = 'SamSung';


-- Dua ra thong tin nhan vien nu o phong ke toan 
select *from NhanVien where GioiTinh = N'Nữ' and TenPhong = N'Kế toán';


-- Đưa ra thông tin phiếu nhập gồm: SoHDN, MaSP, TenSP, TenHang, SoLuongN,
-- DonGiaN, TienNhap=SoLuongN*DonGiaN, MauSac, DonViTinh, NgayNhap, TenNV,
-- TenPhong, sắp xếp theo chiều tăng dần của hóa đơn nhập.

select PNhap.SoHDN , SanPham.MaSP , TenSP , Tenhang ,SoLuongN , DonGiaNhap , (SoLuongN*DonGiaNhap) 
as 'TienNhap', MauSac , DonViTinh , NgayNhap , TenNV , TenPhong 
from HangSX inner join SanPham on HangSX.MaHangSX = SanPham.MaHangSX 
inner join Nhap on Nhap.MaSP = SanPham.MaSp 
inner join PNhap on PNhap.SoHDN = Nhap.SoHDN 
inner join NhanVien on PNhap.MaNV = NhanVien.MaNV
order by PNhap.SoHDN ASC;

-- Đưa ra thông tin phiếu xuất gồm: SoHDX, MaSP, TenSP, TenHang, SoLuongX,
-- GiaBan, tienxuat=SoLuongX*GiaBan, MauSac, DonViTinh, NgayXuat, TenNV,
-- TenPhong trong tháng 09 năm 2021, sắp xếp theo chiều tăng dần của SoHDX.

select PXuat.SoHDX , SanPham.MaSP , TenSP , TenHang , SoLuongX ,
GiaBan, SoLuongX*GiaBan as Tienxuat, MauSac, DonViTinh, NgayXuat, TenNV,
TenPhong from HangSX inner join SanPham on HangSX.MaHangSX = SanPham.MaHangSX 
inner join Xuat on Xuat.MaSP = SanPham.MaSp 
inner join PXuat on PXuat.SoHDX = Xuat.SoHDX 
inner join NhanVien on PXuat.MaNV = NhanVien.MaNV
where month(NgayXuat) = 09 and year(NgayXuat) = 2021
order by PXuat.SoHDX ASC;


-- Đưa ra các thông tin về các hóa đơn mà hãng Samsung đã nhập trong năm 2019, gồm:
-- SoHDN, MaSP, TenSP, SoLuongN, DonGiaN, NgayNhap, TenNV, TenPhong
select PNhap.SoHDN , Nhap.MaSP , TenSP , SoLuongN , DonGiaNhap , NgayNhap , TenNV , TenPhong 
from HangSX inner join SanPham on HangSX.MaHangSX = SanPham.MaHangSX 
inner join Nhap on Nhap.MaSP = SanPham.MaSp 
inner join PNhap on PNhap.SoHDN = Nhap.SoHDN 
inner join NhanVien on PNhap.MaNV = NhanVien.MaNV
where TenHang = 'SamSung' and year(NgayNhap) = 2019;

 -- Đưa ra Top 10 hóa đơn xuất có số lượng xuất nhiều nhất trong năm 2020, sắp xếp theo
-- chiều giảm dần của SoLuongX. 
select *from Xuat inner join PXuat on Xuat.SoHDX = PXuat.SoHDX 
where year(NgayXuat) = 2021 order by SoLuongX desc limit 3;

-- Đưa ra thông tin 10 sản phẩm có giá bán cao nhất trong cữa hàng, theo chiều giảm dần giá bán.
select*from SanPham order by GiaBan desc limit 4;

-- . Đưa ra các thông tin sản phẩm có giá bán từ 100.000 đến 500.000 của hãng Samsung
select*from SanPham inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
 where TenHang = 'SamSung' and GiaBan BETWEEN 100000 and 500000; 
 
-- e.Tính tổng tiền đã nhập trong năm 2020 của hãng Samsung.
select TenHang , year(NgayNhap) , Sum(SoLuongN* DonGiaNhap) as TongTien 
from SanPham inner join HangSX on HangSX.MaHangSX = SanPham.MaHangSX
inner join Nhap on Nhap.MaSP = SanPham.MaSp 
inner join PNhap on PNhap.SoHDN = Nhap.SoHDN;

-- f. Thống kê tổng tiền đã xuất trong ngày 25/09/2021.
select sum(SoLuongX*DonGiaNhap) as TongTien from Xuat 
inner join SanPham on Xuat.MaSp = SanPham.MaSp 
inner join Nhap on SanPham.MaSp = Nhap.MaSp 
inner join PXuat on Xuat.SoHDX = PXuat.SoHDX 
where NgayXuat = '2021-09-25'; 

-- g. Đưa ra SoHDN, NgayNhap có tiền nhập phải trả cao nhất trong năm 2020.
select Nhap.SoHDN , NgayNhap from PNhap 
inner join Nhap on Nhap.SoHDN = PNhap.SoHDN 
where (DonGiaNhap *SoLuongN) = (select Max(DonGiaNhap *SoLuongN)
from PNhap inner join Nhap on Nhap.SoHDN = PNhap.SoHDN); 

-- a. Hãy thống kê xem mỗi hãng sản xuất có bao nhiêu loại sản phẩm
select TenHang , count(MaSP) as 'So luong' from HangSX 
inner join SanPham on HangSX.MaHangSX = SanPham.MaHangSX 
group by (TenHang);

-- b. Hãy thống kê xem tổng tiền nhập của mỗi sản phẩm trong năm 2020.
select SanPham.MaSp , TenSP , SoLuongN*DonGiaNhap as 'Tong Tien Nhap' 
from SanPham inner join Nhap on SanPham.MaSp = Nhap.MaSp
inner join PNhap on Nhap.SoHDN = PNhap.SoHDN
where year(NgayNhap) = 2020;

-- c. Hãy thống kê các sản phẩm có tổng số lượng xuất năm 2020 là lớn hơn 100 sản phẩm của hãng Samsung.
select SanPham.MaSp, TenSp ,TenHang,  SoLuongX from SanPham
inner join HangSX on HangSX.MaHangSX = SanPham.MaHangSX
inner join Xuat on SanPham.MaSp = Xuat.MaSp 
inner join PXuat on PXuat.SoHDX = Xuat.SoHDX 
where SoLuongX > 100 and TenHang = 'SamSung'
group by (SanPham.MaSp);

-- d. Thống kê số lượng nhân viên Nam của mỗi phòng ban.
select TenPhong , count(MaNV) as TongSo 
from NhanVien where GioiTinh = 'Nam'
group by (TenPhong);

-- e. Thống kê tổng số lượng nhập của mỗi hãng sản xuất trong năm 2020.
select TenHang ,HangSX.MaHangSX , sum(SoLuongN* DonGiaNhap)as 'TongSoLuongNhap'
from HangSX inner join SanPham on HangSX.MaHangSX = SanPham.MaHangSX 
inner join Nhap on Nhap.MaSp = SanPham.MaSp 
inner join PNhap on PNhap.SoHDN = Nhap.SoHDN
where year(NgayNhap) = 2020
group by(HangSX.MaHangSX); 

-- f. Hãy thống kê xem tổng lượng tiền xuất của mỗi nhân viên trong năm 2021 là bao nhiêu.
select  TenNv , NhanVien.MaNv ,SUM(DonGiaNhap*SoLuongX)  as TongTien from Nhap
inner join Xuat on Xuat.MaSp = Nhap.MaSp
inner join PXuat on PXuat.SoHDX = Xuat.SoHDX 
inner join NhanVien on NhanVien.MaNV = PXuat.MaNV 
where year(NgayXuat) = 2021
group by (NhanVien.MaNv);
