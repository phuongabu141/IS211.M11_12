Delete 
from chinhanh2.CHINHANH;

CREATE TABLE chinhanh2.CHINHANH
(
MACN VARCHAR2(4) CONSTRAINT PK_CN PRIMARY KEY,
TENCN VARCHAR(20),
THANHPHO VARCHAR2(10)
);
CREATE TABLE chinhanh2.KHACHHANG
(
MAKH VARCHAR2(4) CONSTRAINT PK_KH PRIMARY KEY,
TENKH VARCHAR2(30),
NGAYSINH DATE,
SDT VARCHAR2(10),
MACN VARCHAR2(4)
);
CREATE TABLE chinhanh2.LOAITAIKHOAN
(
MALTK VARCHAR2(5) CONSTRAINT PK_LTK PRIMARY KEY,
TENLTK VARCHAR2(20),
MOTA VARCHAR2(30)
);
CREATE TABLE chinhanh2.TAIKHOAN_QL
(
SOTK VARCHAR2(9) CONSTRAINT PK_TK PRIMARY KEY,
MALTK VARCHAR2(5),
NGAYMO DATE,
NGAYDONG DATE,
MACN VARCHAR2(4),
MAKH VARCHAR2(4)
);
CREATE TABLE chinhanh2.TAIKHOAN_KH
( SOTK VARCHAR2(9)CONSTRAINT PK_TK_KH PRIMARY KEY,
MALTK VARCHAR2(5),
LAISUAT NUMBER,
TRANGTHAI VARCHAR2(20),
MACN VARCHAR2(4),
MAKH VARCHAR2(4),
SoTien Number,
MatKhau Varchar2(6)
);
Create table chinhanh2.GiaoDich(
MACN VARCHAR2(4) ,
MAKH VARCHAR2(4) ,
TienGD Number,
NgayGiaoDich Date,
LoaiGiaoDich Varchar2(10),
CONSTRAINT PK_GD PRIMARY KEY(MACN,MAKH,NgayGiaoDich)
);
commit;



------------------- Khóa ngo?i ---------------
ALTER TABLE chinhanh2.KhachHang ADD
CONSTRAINT FK_KH FOREIGN KEY (MaCN) REFERENCES chinhanh2.ChiNhanh(MaCN);
ALTER TABLE chinhanh2.TaiKhoan_QL ADD
CONSTRAINT FK_TK_QL FOREIGN KEY (MaCN) REFERENCES chinhanh2.ChiNhanh(MaCN);
ALTER TABLE chinhanh2.TaiKhoan_QL ADD
CONSTRAINT FK_TK_QL_2 FOREIGN KEY (MaLTK) REFERENCES chinhanh2.loaitaikhoan(MaLTK);
ALTER TABLE chinhanh2.TaiKhoan_QL ADD
CONSTRAINT FK_TK_QL_3 FOREIGN KEY (MaKH) REFERENCES chinhanh2.KhachHang(MaKH);
ALTER TABLE chinhanh2.TaiKhoan_KH ADD
CONSTRAINT FK_TK_KH FOREIGN KEY (MaCN) REFERENCES chinhanh2.ChiNhanh(MaCN);
ALTER TABLE chinhanh2.TaiKhoan_KH ADD
CONSTRAINT FK_TK_KH_2 FOREIGN KEY (MaLTK) REFERENCES chinhanh2.loaitaikhoan(MaLTK);
ALTER TABLE chinhanh2.TaiKhoan_KH ADD
CONSTRAINT FK_TK_KH_3 FOREIGN KEY (MaKH) REFERENCES chinhanh2.KhachHang(MaKH);
ALTER TABLE chinhanh2.GiaoDich ADD
CONSTRAINT FK_GD FOREIGN KEY (MaCN) REFERENCES chinhanh2.ChiNhanh(MaCN);
ALTER TABLE chinhanh2.GiaoDich ADD
CONSTRAINT FK_GD_2 FOREIGN KEY (MaKH) REFERENCES chinhanh2.KhachHang(MaKH);



ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';



commit;


ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';
ALTER USER chinhanh2 QUOTA UNLIMITED ON USERS;
insert into chinhanh2.CHINHANH values 
('CN01','CN Ho Chi Minh','HCM');
insert into chinhanh2.CHINHANH values 
('CN02','CN Hue','HUE');

insert into chinhanh2.khachhang values
('KH03','Vu Huu Tung','06/09/2001','0327146893','CN02');
insert into chinhanh2.khachhang values
('KH05','Nguyen Thi Oanh','22/02/1995','0386953128','CN02');
insert into chinhanh2.khachhang values
('KH06','Nguyen Canh Hung','29/12/1999','0689723865','CN02');
insert into chinhanh2.khachhang values
('KH08','Dang Ngan Hue','10/08/2000','0902448678','CN02');
insert into chinhanh2.khachhang values
('KH09','Nguyen Duc Trang','08/03/1997','0256897963','CN02');
insert into chinhanh2.khachhang values
('KH12','Nguyen Bao Han','10/07/1998','0638972543','CN02');
insert into chinhanh2.khachhang values
('KH15','Tran Thanh Tung','15/10/1995','0687143986','CN02');
insert into chinhanh2.khachhang values
('KH16','Dang Thi Huong','06/03/2001','0689147863','CN02');
insert into chinhanh2.khachhang values
('KH19','Phan Van Nhat','15/10/2002','0686459783','CN02');

insert into chinhanh2.loaitaikhoan values
('LTK01','Tiet Kiem','Tien gui tiet kiem');
insert into chinhanh2.loaitaikhoan values
('LTK02','Vay','Vay von ngan hang');
insert into chinhanh2.loaitaikhoan values
('LTK03','Thanh Toan','The ATM');
insert into chinhanh2.loaitaikhoan values
('LTK04','The Tin Dung','Tra truoc, tra sau');


insert into chinhanh2.taikhoan_ql values
('898674235','LTK01','10/08/2021','10/02/2022','CN02','KH03');
insert into chinhanh2.taikhoan_ql values
('898123456','LTK03','22/12/2020','22/12/2025','CN02','KH03');
insert into chinhanh2.taikhoan_ql values
('898064589','LTK01','28/09/2020','28/09/2021','CN02','KH05');
insert into chinhanh2.taikhoan_ql values
('898234597','LTK04','22/02/2021','22/02/2026','CN02','KH08');
insert into chinhanh2.taikhoan_ql values
('898743182','LTK01','24/12/2020','24/12/2021','CN02','KH09');
insert into chinhanh2.taikhoan_ql values
('898679325','LTK02','26/8/2019','26/8/2020','CN02','KH12');
insert into chinhanh2.taikhoan_ql values
('898754632','LTK03','01/07/2020','01/07/2025','CN02','KH15');
insert into chinhanh2.taikhoan_ql values
('898632689','LTK04','05/10/2019','05/10/2024','CN02','KH16');
insert into chinhanh2.taikhoan_ql values
('898683421','LTK01','01/01/2021','01/01/2022','CN02','KH19');
insert into chinhanh2.taikhoan_ql values
('898673549','LTK04','24/06/2021','24/06/2025','CN02','KH19');
insert into chinhanh2.taikhoan_ql values
('898687239','LTK04','21/10/2017','21/10/2022','CN02','KH15');
insert into chinhanh2.taikhoan_ql values
('898723465','LTK01','23/03/2019','23/10/2020','CN02','KH12');



insert into chinhanh2.taikhoan_KH values
('898674235','LTK01',4,'Hoat dong','CN02','KH03',250000000,'000010');
insert into chinhanh2.taikhoan_KH values
('898123456','LTK03',0,'Chua kich hoat','CN02','KH03',0,'000011');
insert into chinhanh2.taikhoan_KH values
('898064589','LTK01',0,'Hoat dong','CN02','KH05',75000000,'000100');
insert into chinhanh2.taikhoan_KH values
('898234597','LTK04',2.16,'Hoat dong','CN02','KH08',40000000,'001000');
insert into chinhanh2.taikhoan_KH values
('898743182','LTK01',4,'Hoat dong','CN02','KH09',230000000,'001010');
insert into chinhanh2.taikhoan_KH values
('898679325','LTK02',8,'Khoa','CN02','KH12',100000,'001100');
insert into chinhanh2.taikhoan_KH values
('898754632','LTK03',0,'Hoat dong','CN02','KH15', 100000,'001100');
insert into chinhanh2.taikhoan_KH values
('898632689','LTK04',2.16,'Khoa','CN02','KH16',1000000,'001101');
insert into chinhanh2.taikhoan_KH values
('898683421','LTK01',4,'Hoat dong','CN02','KH19',80000000,'010000');
insert into chinhanh2.taikhoan_KH values
('898673549','LTK04',2.16,'Hoat dong','CN02','KH19',300000000,'010010');
insert into chinhanh2.taikhoan_KH values
('898687239','LTK04',2.16,'Hoat dong','CN02','KH15',200000000,'010111');
insert into chinhanh2.taikhoan_KH values
('898723465','LTK01',4,'khoa','CN02','KH12',300000000,'011011');

--insert into chinhanh2.tkkh values
--('898674235','KH03',250000000);
--insert into chinhanh2.tkkh values
--('898123456','KH03',0);
--insert into chinhanh2.tkkh values
--('898064589','KH05',75000000);
--insert into chinhanh2.tkkh values
--('898234597','KH08',40000000);
--insert into chinhanh2.tkkh values
--('898743182','KH09',230000000);
--insert into chinhanh2.tkkh values
--('898679325','KH12',100000000);
--insert into chinhanh2.tkkh values
--('898754632','KH15',100000);
--insert into chinhanh2.tkkh values
--('898632689','KH16',1000000000);
--insert into chinhanh2.tkkh values
--('898683421','KH19',80000000);
--insert into chinhanh2.tkkh values
--('898673549','KH19',300000000);
--insert into chinhanh2.tkkh values
--('898687239','KH15',200000000);
--insert into chinhanh2.tkkh values
--('898723465','KH12',300000000);
commit;
select * from chinhanh2.khachhang;

-- procedure chuy?n ti?n
create or replace procedure Deposit(v_CUSID in varchar2,v_money in Number,v_MatKhau Varchar2(6))
As
    dem int;
Begin
    select count(CUSID) into dem from CUSTOMER where CUSID = v_CUSID;
            if(dem>0) then
                    insert into TRANSACT values('CN02',v_CUSID,v_money, 'Deposit');
            else
            select count(CUSID) into dem from M01_.CUSTOMER@DBL_M01_2 where CUSID = v_CUSID;
            if(dem>0) then
                    insert into M01_.TRANSACT@DBL_M01_2 values('CN02',v_CUSID,v_money, 'Deposit');
--            else
--                    select count(CUSID) into dem from M03.CUSTOMER@ DBL_M03 where CUSID = v_CUSID;
--                    if(dem>0) then
--                            insert into M03.TRANSACT@ DBL_M03 values('CN02',v_CUSID,v_money, 'Deposit');
--                    end if;         
            end if;
    end if;
COMMIT;
End;
-- procedure rút ti?n
create or replace procedure Withdraw(v_CUSID in varchar2,v_money in Number)
 As
    dem int;
 Begin
    select count(CUSID) into dem from CUSTOMER where CUSID = v_CUSID;
            if(dem>0) then
                    insert into TRANSACT values('CN02',v_CUSID,v_money, 'Withdraw');
            else
                          select count(CUSID) into dem from M01_.CUSTOMER@DBL_M01_2 where CUSID = v_CUSID;
                          if(dem>0) then
                                  insert into M01_.TRANSACT@DBL_M01_2 values('CN02',v_CUSID,v_money, 'Withdraw');
--            else
--                    select count(CUSID) into dem from M03.CUSTOMER@ DBL_M03 where CUSID = v_CUSID;
--                    if(dem>0) then
--                            insert into M03.TRANSACT@ DBL_M03 values('CN02',v_CUSID,v_money, 'Withdraw');
--                    end if;
            end if;
       end if;
   COMMIT;
End;


declare 
    trans_id Varchar2(100);
begin
    trans_id := dbms_transaction.local_transaction_id( TRUE );
end;

SELECT s.sid, s.serial#,
    CASE BITAND(t.flag, POWER(2, 28))
        WHEN 0 THEN 'READ COMMITTED'
        ELSE 'SERIALIZABLE'
    END AS isolation_level
FROM v$transaction t 
JOIN v$session s ON t.addr = s.taddr AND s.sid = sys_context('USERENV', 'SID');

ALTER SESSION SET ISOLATION_LEVEL= READ COMMITTED;
ALTER SESSION SET ISOLATION_LEVEL= SERIALIZABLE;

--LOSS UPDATE
SELECT * FROM CHINHANH2.KHACHHANG;


update chinhanh2.khachhang
set sdt = '0987123456'
where makh = 'KH03';
COMMIT;


update chinhanh2.khachhang
set sdt = '0999999999'
where makh = 'KH03';
commit;

-- non repeatable
SELECT * FROM CHINHANH2.KHACHHANG
where makh = 'KH03';

update chinhanh2.khachhang
set sdt = '0999999999'
where makh = 'KH03';
commit;

update chinhanh2.khachhang
set sdt = '0111111111'
where makh = 'KH03';
commit;


--phantom
insert into chinhanh2.khachhang values 
('KH21','Vo Thi Tu Anh','02-05-2008','0222222222','CN02');
COMMIT;


insert into chinhanh2.khachhang values
('KH22','Nguyen Van A','03-06-2001','0545222222','CN02');
COMMIT;
--delete 
--from chinhanh2.khachhang
--where makh = 'KH21' or makh = 'KH22';
-- deadlock
update chinhanh2.khachhang
set sdt = '0114444444'
where makh = 'KH03';

update chinhanh2.khachhang
set sdt = '0441111111'
where makh = 'KH05';

commit;


--cau 1
SELECT TenKH
FROM ChiNhanh2.KhachHang@chinhanh2 T
WHERE NOT EXISTS 
(   SELECT * 
    FROM ChiNhanh2.LoaiTaiKhoan@chinhanh2 L
    WHERE NOT EXISTS 
    (   SELECT * 
        FROM ChiNhanh2.TaiKhoan_QL@chinhanh2 K
        WHERE K.MaKH=T.MaKH and K.MaLTK = L.MaLTK
    )
);
Select * From chinhanh1.TaiKhoan_KH@chinhanh2_2
--câu 3
Select MaKH, sum(SoTien) as Tong So Tien LTK01
From ( Select * From chinhanh1.TaiKhoan_KH@chinhanh21
Union
Select* 
From ChiNhanh2.TaiKhoan_KH)
Where MaLTK=LTK01
Group by MaKH;

Create or replace Trigger Insert_Update_TK 
Before Insert or Update on chinhanh2.TaiKhoan_ql
For each row
Declare 
    NgaySinh_temp date;
Begin 
	Select chinhanh2.KhachHang.NgaySinh into NgaySinh_temp
	From chinhanh2.KhachHang
	Where chinhanh2.KhachHang.MaKH = :NEW.MaKH;

	If :New.NgayMo < NgaySinh_temp then
        Raise_application_error (-20100,'Ngay mo phai lon hon ngay sinh');
	End if;
End;

-- B?ng KhachHang
Create or replace trigger update_KH
Before update on chinhanh2.khachhang
For each row
Declare
	Cursor TK_ROW is select chinhanh2.taikhoan_ql.ngaymo from chinhanh2.taikhoan_ql where :new.makh=chinhanh2.taikhoan_ql.makh; 
Begin 
	For item in TK_ROW
	Loop
		If: new.NgaySinh > Item.NgayMo then
			Raise_application_error (-20100,'Ngay mo phai lon hon ngay sinh');
		End if;
	End loop;
End;
commit
