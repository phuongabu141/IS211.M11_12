CREATE TABLE DEMOKT01.CHINHANH
(
    MACN VARCHAR2(4) CONSTRAINT PK_CN PRIMARY KEY,
    TENCN VARCHAR(20),
    THANHPHO VARCHAR2(10)
);

CREATE TABLE DEMOKT01.KHACHHANG
(
    MAKH VARCHAR2(4) CONSTRAINT PK_KH PRIMARY KEY,
    TENKH VARCHAR2(30),
    NGAYSINH DATE,
    SDT VARCHAR2(10),
    MACN VARCHAR2(4)
);

CREATE TABLE DEMOKT01.LOAITAIKHOAN
(
	MALTK VARCHAR2(5) CONSTRAINT PK_LTK PRIMARY KEY,
	TENLTK VARCHAR2(20),
	MOTA VARCHAR2(30)
);

CREATE TABLE DEMOKT01.TAIKHOAN_QL
(
	SOTK VARCHAR2(9) CONSTRAINT PK_TK PRIMARY KEY,
	MALTK VARCHAR2(5),
	NGAYMO DATE,
	NGAYDONG DATE,
	MACN VARCHAR2(4),
    MAKH VARCHAR2(4)
);

CREATE TABLE DEMOKT01.TAIKHOAN_KH
(	SOTK VARCHAR2(9)CONSTRAINT PK_TK_KH PRIMARY KEY,
	MALTK VARCHAR2(5),
	LAISUAT NUMBER,
	TRANGTHAI VARCHAR2(20),
	MACN VARCHAR2(4),
    MAKH VARCHAR2(4),
    SoTien Number,
    MatKhau Varchar2(6)
);

Create table DEMOKT01.GiaoDich(
    MACN VARCHAR2(4) ,
    MAKH VARCHAR2(4) ,
    TienGD Number,
    NgayGiaoDich Date,
    LoaiGiaoDich Varchar2(10),
    CONSTRAINT PK_GD PRIMARY KEY(MACN,MAKH,NgayGiaoDich)
);


------------------- Khoa ngoai ---------------
ALTER TABLE DEMOKT01.khachhang ADD 
CONSTRAINT FK_KH FOREIGN KEY (MaCN) REFERENCES DEMOKT01.chinhanh(MaCN);

ALTER TABLE DEMOKT01.taikhoan_ql ADD 
CONSTRAINT FK_TK_QL FOREIGN KEY (MaCN) REFERENCES DEMOKT01.chinhanh(MaCN);

ALTER TABLE DEMOKT01.TaiKhoan_QL ADD 
CONSTRAINT FK_TK_QL_2 FOREIGN KEY (MaLTK) REFERENCES DEMOKT01.loaitaikhoan(MaLTK);

ALTER TABLE DEMOKT01.TaiKhoan_QL ADD 
CONSTRAINT FK_TK_QL_3 FOREIGN KEY (MaKH) REFERENCES DEMOKT01.KhachHang(MaKH);

ALTER TABLE DEMOKT01.TaiKhoan_KH ADD 
CONSTRAINT FK_TK_KH FOREIGN KEY (MaCN) REFERENCES DEMOKT01.ChiNhanh(MaCN);

ALTER TABLE DEMOKT01.TaiKhoan_KH ADD 
CONSTRAINT FK_TK_KH_2 FOREIGN KEY (MaLTK) REFERENCES DEMOKT01.loaitaikhoan(MaLTK);

ALTER TABLE DEMOKT01.TaiKhoan_KH ADD 
CONSTRAINT FK_TK_KH_3 FOREIGN KEY (MaKH) REFERENCES DEMOKT01.KhachHang(MaKH);

ALTER TABLE DEMOKT01.GiaoDich ADD 
CONSTRAINT FK_GD FOREIGN KEY (MaCN) REFERENCES DEMOKT01.ChiNhanh(MaCN);

ALTER TABLE DEMOKT01.GiaoDich ADD 
CONSTRAINT FK_GD_2 FOREIGN KEY (MaKH) REFERENCES DEMOKT01.KhachHang(MaKH);

ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';
 
------------------Insert data-------------------------------------------- 

insert into DEMOKT01.ChiNhanh values('CN01','CN Ho Chí Minh','HCM');
insert into DEMOKT01.ChiNhanh values ('CN02','CN Hue', 'HUE');

select  *from demokt01.chinhanh;

insert into DEMOKT01.KhachHang values('KH01','Nguyen Thi Mai Phuong','01/04/2001','387143373','CN01');	
insert into DEMOKT01.KhachHang values('KH02','Vo Minh Tri','25/06/2001','989234346','CN01');
insert into DEMOKT01.KhachHang values('KH04','Nguyen Van Huu Nghia','27/08/2001','258193786','CN01');	
insert into DEMOKT01.KhachHang values('KH07','Nguyen Minh Hieu','17/07/2001','689543268','CN01');
insert into DEMOKT01.KhachHang values('KH10','Tran Van Anh','23/07/1998','387143986','CN01');
insert into DEMOKT01.KhachHang values('KH11','Tran Quang Linh','08/09/2000','689723156','CN01');	
insert into DEMOKT01.KhachHang values('KH13','Tran Van Loc','28/05/1987','989683114','CN01');
insert into DEMOKT01.KhachHang values('KH14','Truong Nguyen Ngoc','06/09/1991','967865148','CN01');	
insert into DEMOKT01.KhachHang values('KH17','Pham Van Anh','15/10/1975','334502448','CN01');
insert into DEMOKT01.KhachHang values('KH18','Nguyen Cong Hung','12/12/1974','334568789','CN01');	
insert into DEMOKT01.KhachHang values('KH20','Tran Huyen Nhu','08/04/1993','687235689','CN01');

insert into DEMOKT01.khachhang values('KH03','Vu Huu Tung','06/09/2001','0327146893','CN02');
insert into DEMOKT01.khachhang values('KH05','Nguyen Thi Oanh','22/02/1995','0386953128','CN02');
insert into DEMOKT01.khachhang values('KH06','Nguyen Canh Hung','29/12/1999','0689723865','CN02');
insert into DEMOKT01.khachhang values('KH08','Dang Ngan Hue','10/08/2000','0902448678','CN02');
insert into DEMOKT01.khachhang values('KH09','Nguyen Duc Trang','08/03/1997','0256897963','CN02');
insert into DEMOKT01.khachhang values('KH12','Nguyen Bao Han','10/07/1998','0638972543','CN02');
insert into DEMOKT01.khachhang values('KH15','Tran Thanh Tung','15/10/1995','0687143986','CN02');
insert into DEMOKT01.khachhang values('KH16','Dang Thi Huong','06/03/2001','0689147863','CN02');
insert into DEMOKT01.khachhang values('KH19','Phan Van Nhat','15/10/2002','0686459783','CN02');

select *from demokt01.khachhang;

insert into DEMOKT01.loaitaikhoan values('LTK01','Tiet Kiem','Tien gui tiet kiem');
insert into DEMOKT01.loaitaikhoan values('LTK02','Vay','Vay von ngan hang');
insert into DEMOKT01.loaitaikhoan values('LTK03','Thanh Toan','The ATM');
insert into DEMOKT01.loaitaikhoan values('LTK04','The Tin Dung','Tra truoc, tra sau');

select *from demokt01.loaitaikhoan;

insert into DEMOKT01.TAIKHOAN_QL values('898966668','LTK01','01/01/2021',	'01/07/2021','CN01','KH01');
insert into DEMOKT01.TAIKHOAN_QL values('898543689','LTK02','09/10/2020',	'09/10/2021','CN01','KH02');
insert into DEMOKT01.TAIKHOAN_QL values('898634572','LTK04','20/08/2021',	'20/08/2026','CN01','KH04');
insert into DEMOKT01.TAIKHOAN_QL values('898239856','LTK02','06/02/2019',	'06/02/2020','CN01','KH07');
insert into DEMOKT01.TAIKHOAN_QL values('898231123','LTK03','01/12/2021',	'01/12/2026','CN01','KH10');
insert into DEMOKT01.TAIKHOAN_QL values('898469873','LTK01','03/09/2019',	'03/09/2020','CN01','KH11');
insert into DEMOKT01.TAIKHOAN_QL values('898753210','LTK02','20/11/2021',	'20/12/2022','CN01','KH13');
insert into DEMOKT01.TAIKHOAN_QL values('898637142','LTK02','02/03/2021',	'02/03/2022','CN01','KH14');
insert into DEMOKT01.TAIKHOAN_QL values('898723846','LTK02','01/03/2019',	'01/03/2020','CN01','KH17');
insert into DEMOKT01.TAIKHOAN_QL values('898068793','LTK01','17/07/2021',	'17/07/2022','CN01','KH18');
insert into DEMOKT01.TAIKHOAN_QL values('898764539','LTK03','06/08/2018',	'06/08/2023','CN01','KH20');
insert into DEMOKT01.TAIKHOAN_QL values('896004231','LTK02','22/11/2021',	'22/11/2022','CN01','KH20');
insert into DEMOKT01.TAIKHOAN_QL values('898564223','LTK01','26/04/2021',	'26/04/2022','CN01','KH14');

insert into DEMOKT01.taikhoan_ql values('898674235','LTK01','10/08/2021','10/02/2022','CN02','KH03');
insert into DEMOKT01.taikhoan_ql values('898123456','LTK03','22/12/2020','22/12/2025','CN02','KH03');
insert into DEMOKT01.taikhoan_ql values('898064589','LTK01','28/09/2020','28/09/2021','CN02','KH05');
insert into DEMOKT01.taikhoan_ql values('898234597','LTK04','22/02/2021','22/02/2026','CN02','KH08');
insert into DEMOKT01.taikhoan_ql values('898743182','LTK01','24/12/2020','24/12/2021','CN02','KH09');
insert into DEMOKT01.taikhoan_ql values('898679325','LTK02','26/8/2019','26/8/2020','CN02','KH12');
insert into DEMOKT01.taikhoan_ql values('898754632','LTK03','01/07/2020','01/07/2025','CN02','KH15');
insert into DEMOKT01.taikhoan_ql values('898632689','LTK04','05/10/2019','05/10/2024','CN02','KH16');
insert into DEMOKT01.taikhoan_ql values('898683421','LTK01','01/01/2021','01/01/2022','CN02','KH19');
insert into DEMOKT01.taikhoan_ql values('898673549','LTK04','24/06/2021','24/06/2025','CN02','KH19');
insert into DEMOKT01.taikhoan_ql values('898687239','LTK04','21/10/2017','21/10/2022','CN02','KH15');
insert into DEMOKT01.taikhoan_ql values('898723465','LTK01','23/03/2019','23/10/2020','CN02','KH12');

select *from demokt01.taikhoan_ql;


insert into DEMOKT01.TAIKHOAN_KH values('898966668','LTK01','4','Hoat dong','CN01','KH01','100000000','000000';
insert into DEMOKT01.TAIKHOAN_KH values('898543689','LTK02','8','Khoa','CN01','KH02','1000000000','000001');
insert into DEMOKT01.TAIKHOAN_KH values('898634572','LTK04','2.16','Hoat dong','CN01','KH04','50000000','000101');
insert into DEMOKT01.TAIKHOAN_KH values('898239856','LTK02','7.5','Khoa','CN01','KH07','150000000','000110');
insert into DEMOKT01.TAIKHOAN_KH values('898231123','LTK03','0','Chua kich hoat','CN01','KH10','0','000111');
insert into DEMOKT01.TAIKHOAN_KH values('898469873','LTK01','4.5','Khoa','CN01','KH11','80000000','001001');
insert into DEMOKT01.TAIKHOAN_KH values('898753210','LTK02','8','Chua kich hoat','CN01','KH13','260000000','001111');
insert into DEMOKT01.TAIKHOAN_KH values('898637142','LTK02','8','Hoat dong','CN01','KH14','260000000','010001');
insert into DEMOKT01.TAIKHOAN_KH values('898723846','LTK02','8','Khoa','CN01','KH17','150000000','010011');
insert into DEMOKT01.TAIKHOAN_KH values('898068793','LTK01','4','Hoat dong','CN01','KH18','600000000','010100');
insert into DEMOKT01.TAIKHOAN_KH values('898764539','LTK03','0','Khoa','CN01','KH20','50000','010101');
insert into DEMOKT01.TAIKHOAN_KH values('896004231','LTK02','8','Chua kich hoat','CN01','KH20','100000000','011000');
insert into DEMOKT01.TAIKHOAN_KH values('898564223','LTK01','4','Hoat dong','CN01','KH14','240000000','011001');
insert into DEMOKT01.taikhoan_KH values('898674235','LTK01',4,'Hoat dong','CN02','KH03',250000000,'000010');
insert into DEMOKT01.taikhoan_KH values('898123456','LTK03',0,'Chua kich hoat','CN02','KH03',0,'000011');
insert into DEMOKT01.taikhoan_KH values('898064589','LTK01',0,'Hoat dong','CN02','KH05',75000000,'000100');
insert into DEMOKT01.taikhoan_KH values('898234597','LTK04',2.16,'Hoat dong','CN02','KH08',40000000,'001000');
insert into DEMOKT01.taikhoan_KH values('898743182','LTK01',4,'Hoat dong','CN02','KH09',230000000,'001010');
insert into DEMOKT01.taikhoan_KH values('898679325','LTK02',8,'Khoa','CN02','KH12',100000,'001100');
insert into DEMOKT01.taikhoan_KH values('898754632','LTK03',0,'Hoat dong','CN02','KH15', 100000,'001100');
insert into DEMOKT01.taikhoan_KH values('898632689','LTK04',2.16,'Khoa','CN02','KH16',1000000,'001101');
insert into DEMOKT01.taikhoan_KH values('898683421','LTK01',4,'Hoat dong','CN02','KH19',80000000,'010000');
insert into DEMOKT01.taikhoan_KH values('898673549','LTK04',2.16,'Hoat dong','CN02','KH19',300000000,'010010');
insert into DEMOKT01.taikhoan_KH values('898687239','LTK04',2.16,'Hoat dong','CN02','KH15',200000000,'010111');
insert into DEMOKT01.taikhoan_KH values('898723465','LTK01',4,'khoa','CN02','KH12',300000000,'011011');

select *from demokt01.taikhoan_kh

---------------yeu cau4---------
---Tìm Khách hàng(MaKH, TenKH) có n?m m? tài kho?n là 2020 và có tr?ng thái 'Khoa' 
--t?i chi nhánh ? ThanhPho = 'HUE'
explain plan
for 
select distinct kh.makh,tenkh
from demokt01.chinhanh cn, demokt01.khachhang kh,  demokt01.loaitaikhoan ltk 
    demokt01.taikhoan_ql ql, demokt01.taikhoan_kh tkkh
where cn.macn = kh.macn  ltk.maltk = ql.maltk and ltk.maltk = tkkh.maltk and kh.makh = ql.makh and kh.makh = tkkh.makh
and extract (year from(ngaymo)) = 2021 and extract (year from(ngaysinh)) =  2001
and tkkh.trangthai = 'Hoat dong'and cn.macn = 'CN02'
commit; 
 
select plan_table_output from table (dbms_xplan.display())


explain plan
for  
select distinct kh.makh,tenkh
from demokt01.khachhang kh, demokt01.taikhoan_ql ql, demokt01.taikhoan_kh tkkh
where kh.makh = ql.makh and kh.makh = tkkh.makh
and extract (year from(ngaymo)) = 2021 and extract (year from(ngaysinh)) =  2001
and tkkh.trangthai = 'Hoat dong' and kh.macn = 'CN02'

-----------------------toi uu lan 1------------------------
explain plan
for 
select kh.makh, tenkh, tencn, sotien
from demokt01.chinhanh cn, demokt01.loaitaikhoan ltk, demokt01.khachhang kh, demokt01.taikhoan_ql ql, demokt01.taikhoan_kh tkkh
where ql.maltk =ltk.maltk and kh.makh = ql.makh and kh.makh = tkkh.makh and ql.makh = tkkh.makh
and trangthai = 'khoa' and tenltk = 'Tiet Kiem' and tencn ='CN Hue'

select plan_table_output from table (dbms_xplan.display())

-----------------------toi uu lan 2--------------------
explain plan
for 
select kh.makh, tenkh, tencn, sotien
from demokt01.chinhanh cn, demokt01.loaitaikhoan ltk, demokt01.khachhang kh, demokt01.taikhoan_kh tkkh
where tkkh.maltk = ltk.maltk and kh.makh = tkkh.makh 
and trangthai = 'khoa' and tenltk = 'Tiet Kiem' and tencn ='CN Hue'

-----------------------toi uu lan 3--------------------
explain plan
for 
select kh.makh, tenkh, tencn, sotien
from  demokt01.loaitaikhoan ltk, demokt01.khachhang kh, demokt01.taikhoan_kh tkkh
where cn.macn = kh.macn and tkkh.maltk = ltk.maltk and kh.makh = tkkh.makh 
and trangthai = 'khoa' and tenltk = 'Tiet Kiem' and tencn ='CN Hue'

---------- chua toi uu--------------------
explain plan
for 
select kh.makh, tenkh, tencn, sotien
from demokt01.chinhanh cn, demokt01.loaitaikhoan ltk, demokt01.khachhang kh, demokt01.taikhoan_ql ql, demokt01.taikhoan_kh tkkh
where cn.macn = kh.macn and ql.maltk =ltk.maltk and tkkh.maltk = ltk.maltk and kh.makh = ql.makh and kh.makh = tkkh.makh and ql.makh = tkkh.makh
and tkkh.trangthai = 'khoa' and ltk.tenltk = 'Tiet Kiem' and cn.tencn ='CN Hue'

select plan_table_output from table (dbms_xplan.display())
--------------------- chua toi uu-----
select /*+ GATHER_PLAN_STATISTICS */kh.makh, tenkh, tencn, sotien
from demokt01.chinhanh cn, demokt01.loaitaikhoan ltk, demokt01.khachhang kh, demokt01.taikhoan_ql ql, demokt01.taikhoan_kh tkkh
where cn.macn = kh.macn and ql.maltk =ltk.maltk and tkkh.maltk = ltk.maltk and kh.makh = ql.makh and kh.makh = tkkh.makh and ql.makh = tkkh.makh
and tkkh.trangthai = 'khoa' and ltk.tenltk = 'Tiet Kiem' and cn.tencn ='CN Hue'

SELECT * FROM TABLE(DBMS_XPLAN.display_cursor(format=>'ALLSTATS LAST'));
------------ toi uu lan 2---------
select /*+ GATHER_PLAN_STATISTICS */kh.makh, tenkh, tencn, sotien
from demokt01.chinhanh cn, demokt01.loaitaikhoan ltk, demokt01.khachhang kh, demokt01.taikhoan_kh tkkh
where tkkh.maltk = ltk.maltk and kh.makh = tkkh.makh 
and trangthai = 'khoa' and tenltk = 'Tiet Kiem' and tencn ='CN Hue'