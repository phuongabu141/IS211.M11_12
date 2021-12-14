CREATE TABLE ChiNhanh1.CHINHANH
(
    MACN VARCHAR2(4) CONSTRAINT PK_CN PRIMARY KEY,
    TENCN VARCHAR(20),
    THANHPHO VARCHAR2(10)
);


CREATE TABLE ChiNhanh1.KHACHHANG
(
    MAKH VARCHAR2(4) CONSTRAINT PK_KH PRIMARY KEY,
    TENKH VARCHAR2(30),
    NGAYSINH DATE,
    SDT VARCHAR2(10),
    MACN VARCHAR2(4)
);

CREATE TABLE ChiNhanh1.LOAITAIKHOAN
(
	MALTK VARCHAR2(5) CONSTRAINT PK_LTK PRIMARY KEY,
	TENLTK VARCHAR2(20),
	MOTA VARCHAR2(30)
)

CREATE TABLE ChiNhanh1.TAIKHOAN_QL
(
	SOTK VARCHAR2(9) CONSTRAINT PK_TK PRIMARY KEY,
	MALTK VARCHAR2(5),
	NGAYMO DATE,
	NGAYDONG DATE,
	MACN VARCHAR2(4),
    MAKH VARCHAR2(4)
)

CREATE TABLE ChiNhanh1.TAIKHOAN_KH
(	SOTK VARCHAR2(9)CONSTRAINT PK_TK_KH PRIMARY KEY,
	MALTK VARCHAR2(5),
	LAISUAT NUMBER,
	TRANGTHAI VARCHAR2(20),
	MACN VARCHAR2(4),
    MAKH VARCHAR2(4),
    SoTien Number,
    MatKhau Varchar2(6)
)
 
 
Create table ChiNhanh1.GiaoDich(
    MACN VARCHAR2(4) ,
    MAKH VARCHAR2(4) ,
    TienGD Number,
    NgayGiaoDich Date,
    LoaiGiaoDich Varchar2(10),
    CONSTRAINT PK_GD PRIMARY KEY(MACN,MAKH,NgayGiaoDich)
)

------------------- Khóa ngo?i ---------------
ALTER TABLE ChiNhanh1.KhachHang ADD 
CONSTRAINT FK_KH FOREIGN KEY (MaCN) REFERENCES ChiNhanh1.ChiNhanh(MaCN);

ALTER TABLE ChiNhanh1.TaiKhoan_QL ADD 
CONSTRAINT FK_TK_QL FOREIGN KEY (MaCN) REFERENCES ChiNhanh1.ChiNhanh(MaCN);

ALTER TABLE ChiNhanh1.TaiKhoan_QL ADD 
CONSTRAINT FK_TK_QL_2 FOREIGN KEY (MaLTK) REFERENCES ChiNhanh1.loaitaikhoan(MaLTK);

ALTER TABLE ChiNhanh1.TaiKhoan_QL ADD 
CONSTRAINT FK_TK_QL_3 FOREIGN KEY (MaKH) REFERENCES ChiNhanh1.KhachHang(MaKH);

ALTER TABLE ChiNhanh1.TaiKhoan_KH ADD 
CONSTRAINT FK_TK_KH FOREIGN KEY (MaCN) REFERENCES ChiNhanh1.ChiNhanh(MaCN);

ALTER TABLE ChiNhanh1.TaiKhoan_KH ADD 
CONSTRAINT FK_TK_KH_2 FOREIGN KEY (MaLTK) REFERENCES ChiNhanh1.loaitaikhoan(MaLTK);

ALTER TABLE ChiNhanh1.TaiKhoan_KH ADD 
CONSTRAINT FK_TK_KH_3 FOREIGN KEY (MaKH) REFERENCES ChiNhanh1.KhachHang(MaKH);

ALTER TABLE ChiNhanh1.GiaoDich ADD 
CONSTRAINT FK_GD FOREIGN KEY (MaCN) REFERENCES ChiNhanh1.ChiNhanh(MaCN);

ALTER TABLE ChiNhanh1.GiaoDich ADD 
CONSTRAINT FK_GD_2 FOREIGN KEY (MaKH) REFERENCES ChiNhanh1.KhachHang(MaKH);

ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';

commit;

--------------------------------------------
insert into ChiNhanh1.ChiNhanh values('CN01','CN H? Chí Minh','HCM');
insert into ChiNhanh1.ChiNhanh values ('CN02','CN Hu?', 'HUE')

insert into ChiNhanh1.KhachHang values('KH01','Nguyen Thi Mai Phýõng','01/04/2001','387143373','CN01');	
insert into ChiNhanh1.KhachHang values('KH02','Vo Minh Tri','25/06/2001','989234346','CN01');
insert into ChiNhanh1.KhachHang values('KH04','Nguyen Van Huu Nghia','27/08/2001','258193786','CN01');	
insert into ChiNhanh1.KhachHang values('KH07','Nguyen Minh Hieu','17/07/2001','689543268','CN01');
insert into ChiNhanh1.KhachHang values('KH10','Tran Van Anh','23/07/1998','387143986','CN01');
insert into ChiNhanh1.KhachHang values('KH11','Tran Quang Linh','08/09/2000','689723156','CN01');	
insert into ChiNhanh1.KhachHang values('KH13','Tran Van Loc','28/05/1987','989683114','CN01');
insert into ChiNhanh1.KhachHang values('KH14','Truong Nguyen Ngoc','06/09/1991','967865148','CN01');	
insert into ChiNhanh1.KhachHang values('KH17','Pham Van Anh','15/10/1975','334502448','CN01');
insert into ChiNhanh1.KhachHang values('KH18','Nguyen Cong Hung','12/12/1974','334568789','CN01');	
insert into ChiNhanh1.KhachHang values('KH20','Tran Huyen Nhu','08/04/1993','687235689','CN01')	

insert into ChiNhanh1.loaitaikhoan values('LTK01','Tiet Kiem','Tien gui tiet kiem');
insert into ChiNhanh1.loaitaikhoan values('LTK02','Vay','Vay von ngan hang');
insert into ChiNhanh1.loaitaikhoan values('LTK03','Thanh Toan','The ATM');
insert into ChiNhanh1.loaitaikhoan values('LTK04','The Tin Dung','Tra truoc, tra sau');

insert into ChiNhanh1.TAIKHOAN_QL values('898966668','LTK01','01/01/2021',	'01/07/2021','CN01','KH01');
insert into ChiNhanh1.TAIKHOAN_QL values('898543689','LTK02','09/10/2020',	'09/10/2021','CN01','KH02');
insert into ChiNhanh1.TAIKHOAN_QL values('898634572','LTK04','20/08/2021',	'20/08/2026','CN01','KH04');
insert into ChiNhanh1.TAIKHOAN_QL values('898239856','LTK02','06/02/2019',	'06/02/2020','CN01','KH07');
insert into ChiNhanh1.TAIKHOAN_QL values('898231123','LTK03','01/12/2021',	'01/12/2026','CN01','KH10');
insert into ChiNhanh1.TAIKHOAN_QL values('898469873','LTK01','03/09/2019',	'03/09/2020','CN01','KH11');
insert into ChiNhanh1.TAIKHOAN_QL values('898753210','LTK02','20/11/2021',	'20/12/2022','CN01','KH13');
insert into ChiNhanh1.TAIKHOAN_QL values('898637142','LTK02','02/03/2021',	'02/03/2022','CN01','KH14');
insert into ChiNhanh1.TAIKHOAN_QL values('898723846','LTK02','01/03/2019',	'01/03/2020','CN01','KH17');
insert into ChiNhanh1.TAIKHOAN_QL values('898068793','LTK01','17/07/2021',	'17/07/2022','CN01','KH18');
insert into ChiNhanh1.TAIKHOAN_QL values('898764539','LTK03','06/08/2018',	'06/08/2023','CN01','KH20');
insert into ChiNhanh1.TAIKHOAN_QL values('896004231','LTK02','22/11/2021',	'22/11/2022','CN01','KH20');
insert into ChiNhanh1.TAIKHOAN_QL values('898564223','LTK01','26/04/2021',	'26/04/2022','CN01','KH14');

insert into ChiNhanh1.TAIKHOAN_KH values('898966668','LTK01','4','Hoat dong','CN01','KH01','100000000','000000';
insert into ChiNhanh1.TAIKHOAN_KH values('898543689','LTK02','8','Khoa','CN01','KH02','1000000000','000001');
insert into ChiNhanh1.TAIKHOAN_KH values('898634572','LTK04','2.16','Hoat dong','CN01','KH04','50000000','000101');
insert into ChiNhanh1.TAIKHOAN_KH values('898239856','LTK02','7.5','Khoa','CN01','KH07','150000000','000110');
insert into ChiNhanh1.TAIKHOAN_KH values('898231123','LTK03','0','Chua kich hoat','CN01','KH10','0','000111');
insert into ChiNhanh1.TAIKHOAN_KH values('898469873','LTK01','4.5','Khoa','CN01','KH11','80000000','001001');
insert into ChiNhanh1.TAIKHOAN_KH values('898753210','LTK02','8','Chua kich hoat','CN01','KH13','260000000','001111');
insert into ChiNhanh1.TAIKHOAN_KH values('898637142','LTK02','8','Hoat dong','CN01','KH14','260000000','010001');
insert into ChiNhanh1.TAIKHOAN_KH values('898723846','LTK02','8','Khoa','CN01','KH17','150000000','010011');
insert into ChiNhanh1.TAIKHOAN_KH values('898068793','LTK01','4','Hoat dong','CN01','KH18','600000000','010100');
insert into ChiNhanh1.TAIKHOAN_KH values('898764539','LTK03','0','Khoa','CN01','KH20','50000','010101');
insert into ChiNhanh1.TAIKHOAN_KH values('896004231','LTK02','8','Chua kich hoat','CN01','KH20','100000000','011000');
insert into ChiNhanh1.TAIKHOAN_KH values('898564223','LTK01','4','Hoat dong','CN01','KH14','240000000','011001');

commit

select * from ChiNhanh1.Taikhoan_ql;

---------- Trigger --------- Hi?n th?c ràng bu?c toàn v?n sau: Ngày m? tài kho?n khách hàng luôn ph?i l?n hõn ngày sinh c?a khách hàng ðó.
Create or replace Trigger Insert_Update_TK 
Before Insert or Update on chinhanh1.TaiKhoan_ql
For each row
Declare 
    NgaySinh_temp date;
Begin 
	Select chinhanh1.KhachHang.NgaySinh into NgaySinh_temp
	From chinhanh1.KhachHang
	Where chinhanh1.KhachHang.MaKH = :NEW.MaKH;

	If :New.NgayMo < NgaySinh_temp then
        Raise_application_error (-20100,'Ngay mo phai lon hon ngay sinh');
	End if;
End;


Create or replace trigger update_KH
Before update on chinhanh1.khachhang
For each row
Declare
	Cursor TK_ROW is select chinhanh1.taikhoan_ql.ngaymo from chinhanh1.taikhoan_ql where :new.makh=chinhanh1.taikhoan_ql.makh; 
Begin 
	For item in TK_ROW
	Loop
		If: new.NgaySinh > Item.NgayMo then
			Raise_application_error (-20100,'Ngay mo phai lon hon ngay sinh');
		End if;
	End loop;
End;

------------ Test trigger ---------

select * from chinhanh1.khachhang;
select * from chinhanh1.taikhoan_ql;

update chinhanh1.khachhang c
set c.ngaysinh = '02/04/2021'
where c.makh='KH07';

insert into ChiNhanh1.TAIKHOAN_QL values('77777777','LTK02','02/04/2000', '01/07/2021','CN01','KH02');

-- Create a procedure chuyen khach hang ---
create or replace procedure chinhanh1.Trans_Costumer (Cus_ID in varchar2,bra_ID in varchar)
 is
    SOTK_ VARCHAR2(9);
 Begin
    if(bra_ID!='CN01') then
        ----------- Bang Khach Hang --------
        insert into chinhanh2.Khachhang@chinhanh2 values (Cus_ID,null,null,null,bra_ID);
        Update chinhanh2.Khachhang@chinhanh2 C
            set (C.TenKH,
            C.NgaySinh,
            C.SDT) = (Select K.TenKH, K.NgaySinh, K.SDT
                                                from chinhanh1.KhachHang K
                                                where C.MaKH= K.MaKH)
            where exists (select 1 from chinhanh1.khachhang k where C.MaKH=K.MaKH);
        
        ----------- Bang Tai Khoan_QL --------
        select T.SoTK into SoTK_ from chinhanh1.TaiKhoan_QL T where T.MaKH=Cus_ID;
        
        insert into chinhanh2.TaiKhoan_QL@chinhanh2 values (SoTK_,null,null,null,bra_ID,Cus_ID);
        Update chinhanh2.TaiKhoan_QL@chinhanh2 C
            set (C.MaLTK,
            C.NgayMo,
            C.NgayDong) = (Select K.MaLTK, K.NgayMo, K.NgayDong
                                from chinhanh1.TaiKhoan_QL K
                                where C.MaKH= K.MaKH )
            where exists (select 1 from chinhanh1.TaiKhoan_QL k where C.MaKH=K.MaKH);
        
        ----------- Bang Tai Khoan_KH --------
        insert into chinhanh2.TaiKhoan_KH@chinhanh2 values (SoTK_,null,null,null,bra_ID,Cus_ID,null,null);
        Update chinhanh2.TaiKhoan_KH@chinhanh2 C
            set (C.MaLTK,
            C.LaiSuat,
            C.TrangThai,
            C.SoTien,
            C.MatKhau) = (Select K.MaLTK, K.LaiSuat, K.TrangThai, K.SoTien, K.MatKhau
                                from chinhanh1.TaiKhoan_KH K
                                where C.MaKH= K.MaKH )
            where exists (select 1 from chinhanh1.TaiKhoan_KH k where C.MaKH=K.MaKH);
            
        delete from chinhanh1.TaiKhoan_QL where chinhanh1.TaiKhoan_QL.makh=Cus_ID;
        delete from chinhanh1.TaiKhoan_KH where chinhanh1.TaiKhoan_KH.makh=Cus_ID;
        delete from chinhanh1.Khachhang where chinhanh1.khachhang.makh=Cus_ID;
        commit;
    end if;
 End;

---- Test procedure ----
execute CHINHANH1.Trans_Costumer('KH02','CN02');

select * from chinhanh1.khachhang;
select * from chinhanh1.taikhoan_ql;
select * from chinhanh1.taikhoan_kh;

select * from chinhanh2.khachhang@chinhanh2;
select * from chinhanh2.taikhoan_ql@chinhanh2;
select * from chinhanh2.taikhoan_kh@chinhanh2;