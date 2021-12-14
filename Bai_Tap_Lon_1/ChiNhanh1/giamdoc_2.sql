--- Cau 1
SELECT *
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

--- Cau 2
Select MaLTK
From ( Select *
	From ChiNhanh2.TaiKhoan_KH@chinhanh2
	Where TrangThai='Hoat dong'
	Union
	Select *
	From ChiNhanh1.TaiKhoan_KH
	Where TrangThai='Hoat dong')
Group by MaLTK
HAVING COUNT (MaLTK) >= ALL (SELECT COUNT(MaLTK)
				FROM ( Select *
				From ChiNhanh2.TaiKhoan_KH@chinhanh2
				Where TrangThai='Hoat dong'
				Union
				Select *
				From ChiNhanh1.TaiKhoan_KH
				Where TrangThai='Hoat dong')
			GROUP BY (MaLTK));
            
--- Cau 3: gom nhom và tính toán
Select MaKH, sum(SoTien) as Tong_So_Tien_LTK01
From ( Select * 
From ChiNhanh1.TaiKhoan_KH
Union
Select* 
From ChiNhanh2.TaiKhoan_KH@chinhanh2)
Where MaLTK='LTK01'
Group by MaKH;

--- Cau 4:
with uni_ as(Select * 
        From ChiNhanh1.TaiKhoan_QL T
        Where EXTRACT (Year FROM T.NgayMo) = 2020
        Union
        Select* 
        From ChiNhanh2.TaiKhoan_QL@chinhanh2 H
        Where EXTRACT (Year FROM H.NgayMo) = 2020
        )
     
Select MaLTK, count(MaLTK) as So_Luong
from uni_
group by MaLTK 
having count(MaLTK) >= All ( Select count (MaLTK)
    from uni_
    group by MaLTK
)

--- Cau 5:
Select SoTK
From ChiNhanh1.TaiKhoan_KH
Where TrangThai = 'Khoa'
Union
Select SoTK
From ChiNhanh2. TaiKhoan_KH@chinhanh2
Where TrangThai = 'Khoa'

--- Cau 6
SELECT TK.MaKH,TenKH,TK. SOTK
FROM chinhanh1.KhachHang KH JOIN chinhanh1.TaiKhoan_KH TK ON KH.MaCN =TK.MaCN
WHERE TK.LaiSuat<4
UNION
SELECT TK.MaKH,TenKH, TK.SOTK
FROM Chinhanh2.KhachHang@chinhanh2 KH JOIN Chinhanh2.TaiKhoan_KH@chinhanh2 TK ON KH.MaCN =TK.MaCN
WHERE TK.LaiSuat<4

--- Cau 7
SELECT LTK.TenLTK
FROM CHINHANH1.TaiKhoan_QL TK JOIN CHINHANH1.LoaiTaiKhoan LTK ON TK.MaLTK = LTK.MaLTK
MINUS
(SELECT LTK1.TenLTK
FROM CHINHANH1.TaiKhoan_QL TK1 JOIN CHINHANH1.LoaiTaiKhoan LTK1 ON TK1.MaLTK = LTK1.MaLTK
INTERSECT
SELECT LTK2.TenLTK
FROM CHINHANH2.TaiKhoan_QL@chinhanh2 TK2  JOIN CHINHANH2.LoaiTaiKhoan@chinhanh2 LTK2 ON TK2.MaLTK = LTK2.MaLTK
);

--- Cau 8
SELECT TenKH
FROM CHINHANH1.TaiKhoan_QL T  JOIN CHINHANH1.KhachHang KH ON T.MaKH = KH.MaKH
INTERSECT
SELECT TenKH
FROM CHINHANH2.TaiKhoan_QL@chinhanh2 T1  JOIN CHINHANH2.KhachHang@chinhanh2 KH1 ON T1.MaKH = KH1.MaKH

--- Cau 9
SELECT A.MaCN, Max(SoTien)
FROM CHINHANH1.TaiKhoan_KH  A JOIN CHINHANH1.KhachHang KH ON A.MaKH = KH.MaKH
group by A.MaCN
Union
SELECT A1.MaCN, Max(SoTien)
FROM CHINHANH2.TaiKhoan_KH@chinhanh2 A1 JOIN CHINHANH2.KhachHang@chinhanh2 KH ON A1.MaKH = KH.MaKH
group by A1.MaCN

--- Cau 10
SELECT MaLTK,MACN,Count(MaLTK)
FROM CHINHANH1.TaiKhoan_QL 
group by MaLTK,MaCN
UNION
SELECT MaLTK,MACN,Count(MaLTK)
FROM Chinhanh2.TaiKhoan_QL@chinhanh2
Group by MaLTK,MACN

--- B1:
declare 
    trans_id Varchar2(100);
begin
    trans_id := dbms_transaction.local_transaction_id( TRUE );
end;

--- B2:
SELECT s.sid, s.serial#,
       CASE BITAND(t.flag, POWER(2, 28))
          WHEN 0 THEN 'READ COMMITTED'
          ELSE 'SERIALIZABLE'
       END AS isolation_level
    FROM v$transaction t 
    JOIN v$session s ON t.addr = s.taddr AND s.sid = sys_context('USERENV', 'SID');
    
--- B3:
ALTER SESSION SET ISOLATION_LEVEL= SERIALIZABLE;
ALTER SESSION SET ISOLATION_LEVEL= READ COMMITTED;

commit;

--- Lost update
select * from chinhanh2.Khachhang@chinhanh2;

update chinhanh2.Khachhang@chinhanh2
set SDT='999999999'
where MaKH='KH03'

commit

--- un repeatable
select * from chinhanh2.Khachhang@chinhanh2
where MaKH= 'KH03';
commit

--- Phantom 
select * from chinhanh2.Khachhang@chinhanh2;

commit

--- Deadlock
select * from chinhanh2.Khachhang@chinhanh2;

update chinhanh2.Khachhang@chinhanh2
set SDT = '0123456789'
where MaKH='KH05';

update chinhanh2.Khachhang@chinhanh2
set SDT = '0123456789'
where MaKH='KH03';

commit
----------------------------------

select kh.makh, tenkh, tencn, sotien
from chinhanh2.chinhanh@chinhanh2 cn, chinhanh2.loaitaikhoan@chinhanh2 ltk,
chinhanh2.khachhang@chinhanh2 kh, chinhanh2.taikhoan_kh@chinhanh2 tkkh
where tkkh.maltk = ltk.maltk and kh.makh = tkkh.makh
and trangthai = 'khoa' and tenltk = 'Tiet Kiem' and tencn ='CN Hue'


