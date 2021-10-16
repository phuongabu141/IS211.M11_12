-- HO TEN: VO MINH TRI
-- MA SO SINH VIEN: 19522396
-- TAO BANG CAN THIET 
-- cau1:
CREATE TABLE BTKHDL2.USER_NEW
(
    U_ID CHAR(3) PRIMARY KEY NOT NULL,
    USERNAME VARCHAR(20),
    PASS VARCHAR(20), 
    REGDAY DATE, 
    NATIONALITY NVARCHAR2(20)
);


CREATE TABLE BTKHDL2.CHANNEL
(
    CHANNELID CHAR(4) PRIMARY KEY NOT NULL, 
    CNAME NVARCHAR2(20), 
    SUBSCRIBES number, 
    OWNNER CHAR(3), 
    CREATED DATE
);

CREATE TABLE BTKHDL2.VIDEO
(
    VIDEOID CHAR(7) PRIMARY KEY NOT NULL,
    TITLE NVARCHAR2(100), 
    DURATION number,
    AGE number
);

CREATE TABLE BTKHDL2.SHARE_NEW
(
    VIDEOID CHAR(7), 
    CHANNELID CHAR(4),
    CONSTRAINT PK_SHARE_NEW PRIMARY KEY (VIDEOID,CHANNELID)
);

-- cai dat khoa ngoai
ALTER TABLE BTKHDL2.SHARE_NEW 
ADD FOREIGN KEY (VIDEOID) REFERENCES BTKHDL2.VIDEO(VIDEOID);

ALTER TABLE BTKHDL2.SHARE_NEW 
ADD FOREIGN KEY (CHANNELID) REFERENCES BTKHDL2.CHANNEL(CHANNELID);
--cau 2:
-- INSERT INTO
-- user
alter session set nls_date_format = 'dd/MON/yyyy hh24:mi:ss';
ALTER USER BTKHDL2 QUOTA UNLIMITED ON USERS;
INSERT INTO BTKHDL2.USER_NEW 
VALUES
('001','faptv','123456abc',TO_DATE('2014/01/01', 'yyyy/mm/dd hh:mi:ss'),'Viet Nam');
INSERT INTO BTKHDL2.USER_NEW 
VALUES
('002','kemxoitv','@147869iii',TO_DATE('2015/06/05', 'yyyy/mm/dd hh:mi:ss'),'Campuchia');
INSERT INTO BTKHDL2.USER_NEW 
VALUES
('003','openshare','qwertyuiop',TO_DATE('2009/05/12', 'yyyy/mm/dd hh:mi:ss'),'Viet Nam');

--channel
INSERT INTO BTKHDL2.CHANNEL
VALUES 
('C120','FAP TV',2343,'001',TO_DATE('2014/01/02', 'yyyy/mm/dd hh:mi:ss'));
INSERT INTO BTKHDL2.CHANNEL
VALUES 
('C905','Kem xoi TV',1032,'002',TO_DATE('2015/07/09', 'yyyy/mm/dd hh:mi:ss'));
INSERT INTO BTKHDL2.CHANNEL
VALUES 
('C357','OpenShare Cafe',5064,'003',TO_DATE('2010/12/10', 'yyyy/mm/dd hh:mi:ss'));

--video
INSERT INTO BTKHDL2.VIDEO
VALUES
('V100229','FAPtv C?m Ngu?i T?p 41 - ??t Nh?p',469 ,18);
INSERT INTO BTKHDL2.VIDEO
VALUES
('V211002','Kem x�i: T?p 31 - M?y Kool t�nh y�u c?a anh',312,16);
INSERT INTO BTKHDL2.VIDEO
VALUES
('V400002','N?i t�nh y�u k?t th�c - Ho�ng Tu?n ',378,0);

--share
INSERT INTO BTKHDL2.SHARE_NEW
VALUES
('V100229','C905');
INSERT INTO BTKHDL2.SHARE_NEW
VALUES
('V211002','C120');
INSERT INTO BTKHDL2.SHARE_NEW
VALUES
('V400002','C357');

-- cau 3:
CREATE OR REPLACE TRIGGER USER_TR
BEFORE INSERT ON BTKHDL2.user_new 
FOR EACH ROW 
BEGIN 
    :NEW.REGDAY := SYSDATE;
END;
-- cau 4: 
-- cau 5: T�m t?t c? c�c video c� gi?i h?n ?? tu?i t? 16tr? l�n.
SELECT *
FROM BTKHDL2.VIDEO
WHERE AGE > 16
-- cau 6: T�m k�nh c� s? ng??i theo d�i nhi?u nh?t.
SELECT *
FROM BTKHDL2.CHANNEL
WHERE SUBSCRIBES = (
    SELECT MAX(SUBSCRIBES) 
    FROM BTKHDL2.CHANNEL
)
-- cau 7: V?i m?i video c� gi?i h?n ?? tu?i l� 18, th?ng k� s? k�nh ?� chia s?.
SELECT V.VIDEOID, COUNT(CHANNELID) TONG
FROM BTKHDL2.VIDEO V, BTKHDL2.SHARE_NEW S
WHERE V.VIDEOID = S.VIDEOID AND V.AGE >= 18
GROUP BY V.VIDEOID

-- cau8: T�m video ???c t?t c? c�c k�nh chia s?.
SELECT VIDEOID
FROM BTKHDL2.VIDEO V
WHERE NOT EXISTS(
    SELECT *
    FROM BTKHDL2.CHANNEL C
    WHERE NOT EXISTS (
        SELECT * 
        FROM BTKHDL2.SHARE_NEW S
        WHERE V.VIDEOID = S.VIDEOID
        AND S.CHANNELID = C.CHANNELID
    )
);













