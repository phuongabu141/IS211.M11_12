
Select * From chinhanh1.TaiKhoan_KH@chinhanh21;
-- c�u 3
Select MaKH, sum(SoTien) as TongSoTienLTK01
From ( Select * From chinhanh1.TaiKhoan_KH@chinhanh21
Union
Select * 
From ChiNhanh2.TaiKhoan_KH)
Where MaLTK='LTK01'
Group by MaKH


-- c�u 5T�m c�c SoTK b? kh�a ? c? 2 chi nh�nh.
Select SoTK
From ChiNhanh1.TaiKhoan_KH@chinhanh21
Where TrangThai = 'Khoa'
Union
Select SoTK
From ChiNhanh2.TaiKhoan_KH 
Where TrangThai = 'Khoa'


