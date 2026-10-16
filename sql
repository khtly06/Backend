CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY,
    TaiKhoan VARCHAR(50),
    MatKhau VARCHAR(100),
    TenNV VARCHAR(100),
    VaiTro VARCHAR(20),
    SDT VARCHAR(15)
);

CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY,
    TenKH VARCHAR(100),
    SDT VARCHAR(15),
    Email VARCHAR(100),
    Diem INT
);

CREATE TABLE Phim (
    MaPhim INT PRIMARY KEY,
    TenPhim VARCHAR(100),
    TheLoai VARCHAR(50),
    ThoiLuong INT,
    MoTa TEXT
);

CREATE TABLE PhongChieu (
    MaPhong INT PRIMARY KEY,
    TenPhong VARCHAR(50),
    SoGhe INT,
    LoaiPhong VARCHAR(20)
);

CREATE TABLE GheNgoi (
    MaGhe INT PRIMARY KEY,
    MaPhong INT,
    Hang VARCHAR(5),
    So INT,
    LoaiGhe VARCHAR(20),
    FOREIGN KEY (MaPhong) REFERENCES PhongChieu(MaPhong)
);

CREATE TABLE SuatChieu (
    MaSuat INT PRIMARY KEY,
    MaPhim INT,
    MaPhong INT,
    ThoiGian DATETIME,
    FOREIGN KEY (MaPhim) REFERENCES Phim(MaPhim),
    FOREIGN KEY (MaPhong) REFERENCES PhongChieu(MaPhong)
);

CREATE TABLE Ve (
    MaVe INT PRIMARY KEY,
    MaSuat INT,
    MaGhe INT,
    MaKH INT,
    Gia DECIMAL(10,2),
    FOREIGN KEY (MaSuat) REFERENCES SuatChieu(MaSuat),
    FOREIGN KEY (MaGhe) REFERENCES GheNgoi(MaGhe),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

CREATE TABLE HoaDon (
    MaHD INT PRIMARY KEY,
    MaNV INT,
    MaKH INT,
    NgayTT DATETIME,
    TongTien DECIMAL(10,2),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);
