-- HO TEN: VO MINH TRI
-- MA SO SINH VIEN: 19522396
-- TAO BANG CAN THIET 
-- cau1:
create table BTKHDL3.HANGHANGKHONG 
(
    MAHANG CHAR(2) PRIMARY KEY, 
    TENHANG VARCHAR(30), 
    NGTL DATE, 
    DUONGBAY NUMBER
);

create table BTKHDL3.CHUYENBAY 
(
    MACB CHAR(5) PRIMARY KEY, 
    MAHANG CHAR(2), 
    XUATPHAT VARCHAR2(20), 
    DIEMDEN VARCHAR2(20), 
    BATDAU DATE, 
    TGBAY FLOAT

);

create table BTKHDL3.NHANVIEN 
(
    MANV CHAR(4) PRIMARY KEY, 
    HOTEN NVARCHAR2(20), 
    GIOITINH NVARCHAR2(3),
    NGSINH DATE, 
    NGVL DATE, 
    CHUYENMON NVARCHAR2(20)
);

create table BTKHDL3.PHANCONG 
(
    MACB CHAR(5), 
    MANV CHAR(4), 
    NHIEMVU NVARCHAR2(20),
    CONSTRAINT PK_PHANCONG PRIMARY KEY (MACB,MANV)
);
-- TAO KHOA NGOAI
ALTER TABLE BTKHDL3.CHUYENBAY 
ADD FOREIGN KEY (MAHANG) REFERENCES BTKHDL3.HANGHANGKHONG(MAHANG);

ALTER TABLE BTKHDL3.PHANCONG
ADD FOREIGN KEY (MACB) REFERENCES BTKHDL3.CHUYENBAY(MACB);

ALTER TABLE BTKHDL3.PHANCONG
ADD FOREIGN KEY (MANV) REFERENCES BTKHDL3.NHANVIEN(MANV);

-- cau 2:
-- insert thong tin
-- hanghangkhong
alter session set nls_date_format = 'dd/MON/yyyy hh24:mi:ss';
ALTER USER BTKHDL3 QUOTA UNLIMITED ON USERS;
INSERT INTO BTKHDL3.HANGHANGKHONG 
VALUES 
('VN','Vietnam Airlines',TO_DATE('1956/01/15', 'yyyy/mm/dd hh:mi:ss'),52);
INSERT INTO BTKHDL3.HANGHANGKHONG 
VALUES 
('VJ','Vietjet Air',TO_DATE('2011/12/25', 'yyyy/mm/dd hh:mi:ss'),33);
INSERT INTO BTKHDL3.HANGHANGKHONG 
VALUES 
('BL','Jetstar Pacific Airlines',TO_DATE('1900/12/01',
'yyyy/mm/dd hh:mi:ss'),13);

-- chuyenbay
INSERT INTO BTKHDL3.CHUYENBAY
VALUES
('VN550', 'VN', 'TP.HCM', 'Singapore', TO_DATE('2015/12/20 01:15:00', 'yyyy/mm/dd hh:mi:ss'), 2);

INSERT INTO BTKHDL3.CHUYENBAY
VALUES
('VJ331', 'VJ', 'Da Nang', 'Vinh', TO_DATE('2015/12/28 10:30:00', 'yyyy/mm/dd hh:mi:ss'), 1);

INSERT INTO BTKHDL3.CHUYENBAY
VALUES
('BL696', 'BL', 'TP.HCM', '?à L?t', TO_DATE('2015/12/24 06:00:00', 'yyyy/mm/dd hh:mi:ss'), 0.5);

--nhanvien
INSERT INTO BTKHDL3.NHANVIEN
VALUES
('NV01', 'Lâm Van Ben', 'Nam',TO_DATE('1978/09/10 12:00:00', 'yyyy/mm/dd hh:mi:ss') , TO_DATE('2000/06/05', 'yyyy/mm/dd hh:mi:ss'), 'Phi cong');
INSERT INTO BTKHDL3.NHANVIEN
VALUES
('NV02', 'Duong Thi Luc', 'N?', TO_DATE('1989/03/22 12:00:00', 'yyyy/mm/dd hh:mi:ss'),TO_DATE('2013/11/12', 'yyyy/mm/dd hh:mi:ss') , 'Tiep vien');
INSERT INTO BTKHDL3.NHANVIEN
VALUES
('NV03', 'Hoang Thanh Tung', 'Nam', TO_DATE('1983/07/29 12:00:00', 'yyyy/mm/dd hh:mi:ss'), TO_DATE('2007/04/11', 'yyyy/mm/dd hh:mi:ss'), 'Tiep vien');

-- phancong

INSERT INTO BTKHDL3.PHANCONG
VALUES 
('VN550','NV01','Co truong');
INSERT INTO BTKHDL3.PHANCONG
VALUES 
('VN550','NV02','Tiep viên');
INSERT INTO BTKHDL3.PHANCONG
VALUES 
('BL696','NV03','Tiep viên truong');


-- cau 3: Hi?n th?c ràng bu?c toàn v?n sau: Chuyên môn c?a nhân viên ch? ???c nh?n giá tr? là ‘Phi 
--công’ ho?c ‘Ti?p viên’.
ALTER TABLE BTKHDL3.NHANVIEN 
ADD CONSTRAINT CHUYENMON_CHECK
CHECK (CHUYENMON = 'Phi cong' or CHUYENMON = 'Tiep vien')
ENABLE NOVALIDATE;
-- cau 4: 
-- cau5: Tìm t?t c? các nhân viên có sinh nh?ttrong tháng 07
SELECT * 
FROM BTKHDL3.NHANVIEN
WHERE EXTRACT(MONTH FROM(NGSINH))= 7

--cau 6: Tìm chuy?n bay có s? nhân viên nhi?u nh?t.
SELECT MACB
FROM BTKHDL3.PHANCONG
GROUP BY MACB
HAVING COUNT(MANV) >= ALL
    (
        SELECT COUNT(MANV)
        FROM BTKHDL3.PHANCONG
        GROUP BY MACB 
        
    );

-- cau 7: V?i m?ihãng hàng không, th?ng kê s? chuy?n bay có ?i?m xu?t phát là 
--‘?à N?ng’ và có s? nhân viên ???c phân công ít h?n 2.

SELECT H.MAHANG, COUNT(C.MACB)
FROM BTKHDL3.CHUYENBAY C, BTKHDL3.PHANCONG PC, BTKHDL3.HANGHANGKHONG H
WHERE C.MACB=PC.MACB AND C.XUATPHAT='Da Nang' AND H.MAHANG = C.MAHANG
GROUP BY H.MAHANG
HAVING COUNT (PC.MANV) =
    ( 
        SELECT COUNT(MANV)
        FROM BTKHDL3.PHANCONG
        GROUP BY MACB 
        HAVING COUNT(MANV)<2
    );

-- cau 8: Tìm nhân viên ???c phân công tham gia t?t c? các chuy?n bay.
SELECT *
FROM BTKHDL3.NHANVIEN NV 
WHERE NOT EXISTS 
    (
        SELECT * 
        FROM BTKHDL3.CHUYENBAY CB 
        WHERE NOT EXISTS 
            (
                SELECT *
                FROM BTKHDL3.PHANCONG PC
                WHERE PC.MANV=NV.MANV AND  PC.MACB=CB.MACB
            )
    )






























