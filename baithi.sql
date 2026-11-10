CREATE DATABASE Hethonggiaodichnhadat
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE Hethonggiaodichnhadat;


CREATE TABLE khach_hang (
    ma_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    ten_khach_hang VARCHAR(100) NOT NULL,
    so_dien_thoai VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);



CREATE TABLE giao_dich (
    ma_giao_dich VARCHAR(20) PRIMARY KEY,
    ma_khach_hang INT NOT NULL,
    ngay_giao_dich DATE NOT NULL,
    loai_dich_vu VARCHAR(50) NOT NULL,
    don_gia DECIMAL(15,2) NOT NULL,
    dien_tich DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_giao_dich_khach_hang
    FOREIGN KEY (ma_khach_hang)
    REFERENCES khach_hang(ma_khach_hang)
);




INSERT INTO khach_hang
(ten_khach_hang, so_dien_thoai, email)
VALUES
('Nguyen Van A', '0901234567', 'an@gmail.com'),
('Nguyen Van B', '0912345678', 'binh@gmail.com'),
('Nguyen Van C', '0923456789', 'cuong@gmail.com');



INSERT INTO giao_dich
(ma_giao_dich, ma_khach_hang, ngay_giao_dich,
 loai_dich_vu, don_gia, dien_tich)
VALUES
('MGD-0001', 1, '2026-11-20', 'Nha Dat', 800000, 100),
('MGD-0002', 2, '2026-11-21', 'Dat', 1200000, 150),
('MGD-0003', 3, '2026-11-22', 'Nha Dat', 900000, 200);


SELECT
    gd.ma_giao_dich as 'Mã Giao Dịch',
    kh.ten_khach_hang as 'Tên Khách Hàng',
    DATE_FORMAT(gd.ngay_giao_dich, '%d/%m/%Y') AS 'Ngày Giao Dịch',
    gd.loai_dich_vu as 'Loại Dịch Vụ',
    gd.don_gia as 'Đơn Giá(VND/m2)',
    gd.dien_tich as 'Diện Tích(m2)'
FROM giao_dich gd
INNER JOIN khach_hang kh
ON gd.ma_khach_hang = kh.ma_khach_hang;



