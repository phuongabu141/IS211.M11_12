
Select * From chinhanh1.TaiKhoan_KH@chinhanh21;
-- câu 3
Select MaKH, sum(SoTien) as TongSoTienLTK01
From ( Select * From chinhanh1.TaiKhoan_KH@chinhanh21
Union
Select * 
From ChiNhanh2.TaiKhoan_KH)
Where MaLTK='LTK01'
Group by MaKH


-- câu 5Tìm các SoTK b? khóa ? c? 2 chi nhánh.
Select SoTK
From ChiNhanh1.TaiKhoan_KH@chinhanh21
Where TrangThai = 'Khoa'
Union
Select SoTK
From ChiNhanh2.TaiKhoan_KH 
Where TrangThai = 'Khoa'


