-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th6 24, 2021 lúc 12:53 PM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phamngocquy`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `adminName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` char(32) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`adminid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminid`, `username`, `adminName`, `email`, `pass`, `level`, `trash`) VALUES
(1, 'quy', 'Quy Gamming', 'sv2119110227@hitu.edu.vn', '1f32aa4c9a1d2ea010adcf2348166a04', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

DROP TABLE IF EXISTS `tbl_brand`;
CREATE TABLE IF NOT EXISTS `tbl_brand` (
  `brandId` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(100) CHARACTER SET utf8 NOT NULL,
  `trash` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`brandId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`, `alias`, `trash`, `status`) VALUES
(1, 'Asus', 'asus', 0, 1),
(2, 'Acer', 'acer', 0, 1),
(3, 'Msi', 'msi', 0, 1),
(4, 'Dell', 'dell', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_cart`
--

DROP TABLE IF EXISTS `tbl_cart`;
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `sId` varchar(255) CHARACTER SET utf8 NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_cart`
--

INSERT INTO `tbl_cart` (`cartId`, `sId`, `productId`, `productName`, `price`, `quantity`, `image`) VALUES
(28, 'hb1dkvk8ptdfhleq375m01e891', 1, ' Ariyan Lorem Ipsum fsdfasdaf', 525.00, 1, 'upload/a2d9ff0c56.png'),
(42, 'ki70g8rmb4mfqs7cmei2l3qpi3', 10, 'Woman Tshirt 03', 300.00, 1, 'upload/a2fccb0144.png'),
(43, 'e6r6avk209clao063d5p18i597', 7, 'Mans Tshirt 02', 400.00, 1, 'upload/4b2b2f0556.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `catId` int(11) NOT NULL AUTO_INCREMENT,
  `catName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `parentId` int(11) NOT NULL,
  `trash` tinyint(4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`catId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`, `alias`, `parentId`, `trash`, `status`) VALUES
(1, 'LapTop', 'lap-top', 0, 0, 1),
(2, 'Pc Gamming', 'pc-gamming', 0, 0, 1),
(3, 'Màn Hình', 'man-hinh', 0, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE IF NOT EXISTS `tbl_contact` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `trash` tinyint(1) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`contactId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `trash` tinyint(1) NOT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_customer`
--

INSERT INTO `tbl_customer` (`customerId`, `userId`, `fullname`, `address`, `phone`, `email`, `trash`) VALUES
(2, 0, '', 'Groan Puran Polton south Dhaka ', '4544555455', 'kaziariyan@gmail.com', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_image`
--

DROP TABLE IF EXISTS `tbl_image`;
CREATE TABLE IF NOT EXISTS `tbl_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `imageName` varchar(255) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `trash` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_image`
--

INSERT INTO `tbl_image` (`id`, `title`, `image`, `imageName`, `position`, `trash`, `status`) VALUES
(1, 'Slider1', 'quy_slide01.jpg', '', 1, 0, 1),
(2, 'Slider2', 'quy_slide02.jpg', '', 1, 0, 1),
(3, 'Slider3', 'quy_slide03.jpg', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_link`
--

DROP TABLE IF EXISTS `tbl_link`;
CREATE TABLE IF NOT EXISTS `tbl_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `position` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `oders` tinyint(4) NOT NULL,
  `trash` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_link`
--

INSERT INTO `tbl_link` (`id`, `title`, `position`, `img`, `link`, `oders`, `trash`, `status`) VALUES
(1, 'Mua hàng trả góp', 'bottommenu1', '', '#', 1, 0, 1),
(2, 'Chính sách bảo hành', 'bottommenu1', '', '#', 2, 0, 1),
(3, 'Chính sách đổi trả', 'bottommenu1', '', '#', 3, 0, 1),
(4, 'Hỗ trợ kỹ thuật\r\n1800.1068', 'bottommenu2', '', '#', 1, 0, 1),
(5, 'Tư vấn miễn phí\r\n1800.1086', 'bottommenu2', '', '#', 2, 0, 1),
(7, 'News', 'globalnav', '', '#', 1, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `orderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` float(10,2) NOT NULL,
  `note` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `trash` tinyint(1) NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`orderId`, `customerId`, `orderDate`, `total`, `note`, `status`, `trash`) VALUES
(8, 2, '0000-00-00 00:00:00', 500.00, '', 1, 0),
(9, 2, '0000-00-00 00:00:00', 400.00, '', 0, 0),
(10, 2, '0000-00-00 00:00:00', 450.00, '', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_orderdetail`
--

DROP TABLE IF EXISTS `tbl_orderdetail`;
CREATE TABLE IF NOT EXISTS `tbl_orderdetail` (
  `orderDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `trash` tinyint(1) NOT NULL,
  PRIMARY KEY (`orderDetailId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_page`
--

DROP TABLE IF EXISTS `tbl_page`;
CREATE TABLE IF NOT EXISTS `tbl_page` (
  `pageId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `createBy` int(11) NOT NULL,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `trash` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`pageId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `tbl_page`
--

INSERT INTO `tbl_page` (`pageId`, `title`, `content`, `createBy`, `createDate`, `updateDate`, `trash`, `status`) VALUES
(1, 'Vê chúng tôi', 'Có nhiều lý do khiến chúng tôi quyết định mở rộng hoạt động kinh doanh, bán củ giống chất lượng cho người dùng hoa mà không thông qua bất cứ trung gian nào khác. Dù bạn muốn tự trồng và chăm sóc một chậu hoa để gần gũi với thiên nhiên hơn, thư giãn đầu óc sau một ngày làm việc. Hoặc bạn muốn có một chậu hoa đẹp vào dịp tết, tránh việc mua phải những bó hoa lạnh, hoa kém chất lượng với giá quá cao. Dù lý do là gì, chúng tôi tự tin mang tới cho bạn những cử giống hoa chất lượng nhất với chi phí hợp lý.\r\n\r\nĐược thành lập từ năm 2014, công ty chúng tôi là đơn vị tiên phong trong lĩnh vực phân phối củ giống hoa Ly và các loại hoa thành phẩm như hoa Ly, hoa hồng ngoại. Sản phẩm củ giống hoa Ly được chúng tôi nhập khẩu trực tiếp từ các nhà cung cấp tới từ châu Âu như Hà Lan, Pháp …đảm bảo chất lượng tốt nhất cho người trồng.\r\n\r\nCác vườn hoa có tổng diện tích 10ha của chúng tôi tại huyện Đan Phượng – Hà Nội cung cấp hoa tươi bán buôn, hoa tươi tết cho không chỉ thị trường Hà Nội mà cả các tỉnh miền Bắc như Nam Định, Hải Phòng, Quảng Ninh, Lạng Sơn …\r\n\r\nKhách hàng chính của chúng tôi là các nhà vườn trồng hoa ly tại miền Bắc ở các vùng chuyên canh trồng hoa như làng hoa Tây Tựu, hoa Mê Linh, hoa Sapa. Sản phẩm chất lượng và việc tư vấn sát sao tới từng người trồng là bí quyết tạo dựng uy tín công ty chúng tôi.', 1, '2021-03-02 23:09:19', '0000-00-00 00:00:00', 0, 1),
(2, 'Chính sách', 'Chúng tôi áp dụng phương thức thu tiền khi giao hàng và chuyển khoản ngân hàng với các đơn hàng trên toàn lãnh thổ Việt Nam.\r\n\r\nThông tin tài khoản:\r\n\r\nChủ tài khoản: Trịnh Xuân Trường\r\nSố tài khoản: 19032 80223 6018\r\nNgân hàng Techcombank chi nhánh Từ Liêm\r\nCó 3 cách chủ yếu để bạn đặt hàng trên hệ thống của chúng tôi:\r\n\r\nCách 1: Bạn chọn sản phẩm và số lượng mình muốn, rồi đặt hàng trên web (ưu tiên sử dụng)\r\nCách 2: Bạn để lại thông tin số điện thoại trên website hoặc facebook để chúng tôi chủ động liên lạc lại. \r\nCách 3: Bạn gọi điện trực tiếp tới các số điện thoại của Gánh hoa Ly trên website hoặc facebook.', 1, '2021-03-16 23:09:19', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `catid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `detail` text NOT NULL,
  `price` float NOT NULL,
  `saleprice` float DEFAULT NULL,
  `img` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productid`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`productid`, `productName`, `alias`, `catid`, `brandid`, `detail`, `price`, `saleprice`, `img`, `status`, `trash`) VALUES
(1, 'Laptop Gaming Msi Gl65', 'laptop-gaming-msi-gl65', 1, 3, '- CPU: Intel core i7-10750H (2.60GHz upto 5.00 GHz, 12MB)\r\n- RAM: 8GB DDR4 2666Mhz\r\n- Ổ cứng: 512GB NVMe PCIe SSD + 1 slot 2.5\"\r\n- VGA: NVIDIA® GeForce® GTX 1650 4GB GDDR6\r\n- Màn hình: 15.6 inch FHD (1920*1080), IPS-Level 144Hz, 45%NTSC Thin Bezel\r\n- Cân nặng: 2.3 kg\r\n- Tính năng: Đèn nền bàn phím\r\n- OS: Windows 10 Home', 1085.77, 1000, 'quy_sp1.jpg', 1, 0),
(2, 'Laptop Asus Rog Zephyrus G15', 'laptop-asus-rog-zephyrus-g15', 1, 1, 'CPU: AMD Ryzen 7 4800HS\r\nRAM: 8GB\r\nỔ cứng: 512GB SSD\r\nVGA: NVIDIA GTX 1660Ti 6GB\r\nMàn hình: 15.6 inch FHD 144Hz\r\nHĐH: Win 10\r\nMàu: Đen', 2825.54, 2750, 'quy_sp2.jpg', 1, 0),
(3, 'Laptop Dell Gaming G3 3500', 'laptop-dell-gaming-c3-3500', 1, 4, 'CPU: Intel Core i5 10300H\r\nHệ điều hành: Windows 10 Home SL 64 Bit\r\nRAM: DDR4 8GB (2x4GB) 3200MHz, 2 slots, up to 32GB\r\nGPU: Geforce GTX 1650Ti 4GB\r\nMàn hình: 15.6\" Full HD ( 1920 x 1080 ), 120Hz, IPS Panel\r\nỔ cứng SSD: 512GB SSD NVMe M.2 PCIe Gen 3×2\r\nPin: 4 Cells, 56WHrs\r\nKích thước: 389 x 274 x 24.95 mm\r\nTrọng lượng: 2.5 kg', 1217.6, 1200, 'quy_sp3.jpg', 1, 0),
(4, 'Laptop Gaming Msi Stealth', 'laptop-gaming-msi-stealth', 1, 3, 'CPU Intel Core i7-1185G7 3.0GHz up to 4.8GHz 12MB\r\nRAM 16GB (8GBx2) DDR4 3200MHz (2x SO-DIMM socket, up to 64GB SDRAM)\r\nỔ cứng	512GB SSD PCIE G3X4\r\nCard đồ họa NVIDIA GeForce GTX 1660Ti 6GB GDDR6\r\nMàn hình 15.6\" FHD (1920*1080), IPS-Level 144Hz 45%NTSC Thin Bezel', 1300.5, 1250, 'quy_sp4.jpg', 1, 0),
(5, 'Laptop Gaming Msi Gt76 Titan', 'laptop-gaming-msi-gt76-titan', 1, 3, 'Chip: Intel Core i9-8950HK (2.90GHz upto 4.80GHz, 6Cores, 12Threads, 12MB cache, FSB 8GT/s)\r\nRAM: 32GB DDR4 2666MHz, 4 Slots, Max 64GB\r\nỔ cứng: Super Raid 4-256GB (128GB*2) NVMe SSD +1TB (SATA) 7200rpm\r\nChipset đồ họa: NVIDIA GeForce GTX 1080 8GB GDDR5X\r\nMàn hình: 17.3 inch Full HD (1920 x 1080), 120Hz wideview 94% NTSC color Anti-Glare 3ms\r\nHệ điều hành: Windows 10 Home bản quyền\r\nPin: 8 Cell 75 Whrs', 4346.99, 4300, 'quy_sp5.jpg', 1, 0),
(6, 'Laptop Gaming Msi Ge66 Raider', 'laptop-gaming-msi-ge66-raider', 1, 3, 'CPU	\r\nIntel Core i7 10750H\r\nHệ điều hành	\r\nWindows 10 SL 64 Bit\r\nRAM	\r\nDDR4 16GB (2 x 8GB) 2666MHz, 2 slots, up to 32GB\r\nGPU	\r\nGeforce RTX 2070 8GB\r\nMàn hình	\r\n15.6\" FHD (1920×1080) IPS, 240Hz\r\nỔ cứng SSD	\r\n1TB SSD NVMe M.2 PCIe Gen 3 x 4\r\nLan	\r\nKiller Gb LAN\r\nWireless Lan	\r\nKiller Wi-Fi 6 AX1650i (2*2 ax) + BT5\r\nBàn phím	\r\nSteelSeries Backlight Keyboard (Per-Key RGB, Full-Color)\r\nPin	\r\n4 Cells, 99.9Whrs\r\nKích thước	\r\n397 x 268.5 x 27.5 mm\r\nTrọng lượng	\r\n2.4 kg', 1484.4, 1420, 'quy_sp6.jpg', 1, 0),
(7, 'Laptop Gaming Msi Ge75 Raider', 'laptop-gaming-msi-ge75-raider', 1, 3, 'Model\r\nMSI GE75 10SFS - 270VN\r\nCPU\r\n- Intel® Core i9 Gen 10th\r\n- Intel® Core i7 Gen 10th\r\nRAM\r\n- 32GB DDR4 3200MHz (2 slots)\r\n- 16GB DDR4 3200MHz (2 slots)\r\nỔ cứng\r\nSSD 512GB M.2 PCIe + HDD 1TB 5400rpm (2 slot SSD M.2 + 1 slot 2.5 inch)\r\nCD/DVD\r\nNone\r\nCard VGA\r\n- Nvidia Geforce RTX 2080 Super 8GB GDDR6\r\n- Nvidia Geforce RTX 2070 Super 8GB GDDR6\r\n- Intel® UHD Graphics\r\nMàn hình\r\n17.3-inch FHD IPS (1920x1080) with 240Hz, close to 100% sRGB, viền mỏng, chống chói.\r\nKết nối\r\nKiller Wi-Fi 6 AX201 (2x2ax) + Bluetooth 5.1', 1484.4, 1400, 'quy_sp7.jpg', 1, 0),
(8, 'Pc gaming Falcon 015', 'pc-gaming-falcon-015', 2, 1, 'Thương hiệu	PC HANOICOMPUTER\r\nModel	PCGM178\r\nCHI TIẾT\r\nMainboard	ASUS B360M-E GAMING\r\nCPU	CPU Intel Core i5-9400F (2.9  Ghz Upto 4.1 GHz/9MB/6 Cores,6 Threads/Socket 1151 / Coffee Lake)\r\nRam	Desktop Adata XPG Spectrix D41 RGB DDR4 8GB (1x8GB) 3000Mhz\r\nỔ Cứng	SSD,HDD Tự chọn\r\nVGA	Asus TUF GTX 1660 Super 6G Gaming\r\nNguồn	XIGMATEK X-POWER II 500 450W (EN41831)', 565.5, 550, 'quy_sp01.jpg', 1, 0),
(9, 'Intel Pc Gaming Rakitan i5 9400F', 'intel-pc-gaming-rakitan-i5-9400f', 2, 1, 'CPU	Intel Core i5-9400F 2.90Ghz Turbo up to 4.10GHz 6C/6T\r\nMAINBOARD	Asus EX-B365M-V5/ LGA-1151/DDR4 2666/2400/2133 MHz\r\nRAM	Ram Adata 8gB-DR4 bus 2666 Hãng\r\nVGA	Gigabyte GeForce GTX 1660 OC 6GB (GV-N1660OC-6GD)\r\nSSD	VERICO NIGHTHAWK 120GB', 500, 450, 'quy_sp02.jpg', 1, 0),
(10, 'Bộ Pc Gaming Gland Maser', 'bo-pc-gaming-gland-master', 2, 0, 'CPU: CPU Intel Core i5-10400\r\nMAIN:ASROCK B460M STEEL LEGEND\r\nRAM: ADATA 16GB BUS 3000/2666\r\nVGA: INNO3D RTX 2060 GAMING OC\r\nSSD: PNY CS900 240GB\r\nPSU: ATOM 550W\r\nVỏ case: Xigmatek EROS\r\nTẢN NHIỆT : COOLER MASTER T400I', 480, 440, 'quy_sp03.jpg', 1, 0),
(11, 'Pc Gaming Shark 010 I5 9400F', 'pc-gaming-shark-010-i5-9400f', 2, 0, 'Thông số sản phẩm\r\nMain:B360\r\nCPU: Intel Core I5 9400F\r\nRAM: 8GB RAM\r\nỔ cứng: Tự chọn\r\nVGA: AMD RX580 8GB\r\nNguồn: 550W', 560, 540, 'quy_sp04.jpg', 1, 0),
(12, 'Bộ Pc Gaming Intel Core I3 9100F', 'bo-pc-gaming-intel-core-i3-9100f', 2, 0, 'CPU	Intel Core I3 9100F : 6Mb , Upto 4.2Ghz\r\nMAIN	H310M Socket 1151\r\nRAM	Lexar 8GB Bus 2666 CL16 \r\nSSD	Kingston A400 240GB\r\nVGA	 GTX 1650 4GB GDDR6\r\nNGUỒN	Xigmatek X-Power III 500 (450W, 230V)CASE	SAMA 3301\r\nCASE	SAMA 3301', 560, 520, 'quy_sp05.jpg', 1, 0),
(13, 'Bộ Pc Gaming Fland Master', 'bo-pc-gaming-fland-master', 2, 1, 'CPU: CPU Intel Core I9 - 10900\r\nMAIN:ASUS B460-F STRIX\r\nRAM: ADATA D50 16GB BUS 3000 RGB\r\nVGA: INNO3D RTX 2060 GAMING OC\r\nSSD: WESTERN BLACK SN750 250GB M.2 NVME\r\nPSU: COOLERMASTER MWE 650W BRONZE V2\r\nVỏ case: EDRA ECS 1501\r\nTẢN NHIỆT : COOLER MASTER MA620P', 500, 450, 'quy_sp06.jpg', 1, 0),
(14, 'Pc Gaming i5 10400F Gtx 1660Ti Ram 16GB Ssd 16Gb', 'pc-gaming-i5-10400f-1660ti-ram-16g-ssd-16gb', 2, 0, 'CPU: Intel Core I5 10400F\r\nMainboard: B460\r\nRAM: 16GB RAM\r\nỔ cứng: 250GB SSD\r\nVGA: NVIDIA GTX 1660 SUPER\r\nNguồn: 500W', 760, 740, 'quy_sp06.jpg', 1, 0),
(15, 'Màn hình cong Asus TUF GAMING VG32VQ1B 32“ 2K 165Hz HDR10', 'man-hinh-cong-asus-tuf-gaming-vga32vq1b-32\'\'-2k-165hz-hdr10', 3, 1, 'Thương hiệu\r\nAsus \r\nBảo hành\r\n36\r\nKích thước\r\n31.5 inch\r\nĐộ phân giải\r\n2560x1440\r\nTấm nền\r\nVA\r\nTần số quét	165Hz \r\nThời gian phản hồi	1s\r\nKiểu màn hình ( phẳng / cong )	Cong\r\nĐộ sáng	250 cd/m2', 421.25, 400, 'quy_sp001.jpg', 1, 0),
(16, 'Màn Hình Cong Msi Gaming Monitor Optix Mag332cqrv', 'man-hinh-cong-msi-gaming-monitor-optix-mag322cqrv', 3, 3, 'Hãng sản xuất\r\nMSI\r\nModel\r\nOptix MAG322CQRV\r\nKích thước màn hình\r\n31.5 inch\r\nĐộ phân giải\r\nQHD (2560 x 1440) \r\nTỉ lệ\r\n16:9\r\nTấm nền màn hình\r\nVA\r\nĐộ sáng\r\n300\r\nMàu sắc hiển thị\r\n16.7 triệu màu\r\nĐộ tương phản\r\n100,000,000:1\r\nTần số quét\r\n144Hz\r\nCổng kết nối\r\nHDMI®-in\r\nDisplayPort™\r\nThời gian đáp ứng\r\n1ms (MPRT)\r\nKích thước\r\n710 x 510 x 262 mm / 28 x 20 x 10.3 inch\r\nCân nặng\r\n7.3kg / 8.94kg', 812.53, 800.5, 'quy_sp002.jpg', 1, 0),
(17, 'Màn Hình Asus Rog Strix Xg258Q 25\" TN 240Hz 1ms Chuyên Game', 'man-hinh-asus-rog-strix-xg258q-25-tn240hz-1ms-chuyen-game', 3, 1, 'Kích thước\r\n  Màn hình Wide 24.5\"(62.23cm) 16:9\r\n Độ phân giải\r\n  1920x1080 Full HD\r\nTần số quét\r\n   240Hz\r\n Độ làm tươi\r\n  DP: 67~255KHz (H) / 30~240Hz (V)\r\n  HDMI: 30~90KHz (H) / 24~60Hz (V)\r\n Độ tương phản\r\n  1000:1\r\n Độ sáng\r\n  400 cd/㎡\r\n Thời gian đáp ứng\r\n  1ms (Gray to Gray)\r\n Điểm ảnh\r\n  0.2832 x 0.2802 mm\r\n Góc nhìn\r\n  (CR ≧ 10): 170°(H)/160°(V)\r\n Màu\r\n  16.7 triệu màu\r\n Audio \r\n  Giắc cắm tai nghe: 3.5mm Mini-Jack \r\n Cổng kết nối\r\n  Tín hiệu vào: HDMI, DisplayPort\r\n  Cổng USB: 3.0x2\r\n Điện tiêu thụ\r\n Chế độ bật: <65W (độ sáng màn hình là 200 nit  khi không kết nối âm thanh / USB/ Đầu đọc thẻ)\r\n Chế độ Tiết kiệm Điện/Tắt: <0.5W\r\n Điện áp: 100-240V, 50/60Hz\r\n Phụ kiện\r\n  Dây nguồn, Sạc nguồn, Cáp DisplayPort, Cáp        USB 3.0\r\n', 450, 440, 'quy_sp003.jpg', 1, 0),
(18, 'Màn Hình Asus ProArt PA279CV 27\" IPS 4K Chuyên Đồ Họa', 'man-hinh-asus-proart-pa279cv-27-ips-4k-chuyen-do-hoa', 3, 1, 'Màn hình 27 inch 4K UHD (3840 x 2160) đèn nền LED với tấm nền IPS góc nhìn rộng 178°\r\nTiêu chuẩn màu quốc tế đạt 100% phổ màu sRGB và 100% phổ màu Rec.709\r\nMàn hình đạt chứng nhận Calman Verified nhờ được hiệu chuẩn trước khi xuất xưởng để mang lại độ chính xác màu tuyệt vời Delta E < 2\r\nKết nối mở rộng bao gồm DP qua USB-C™ với 65W Power Delivery, DisplayPort, HDMI, USB 3.0 hub\r\nCông nghệ Adaptive-Sync (40 ~ 60Hz) cho nội dung chuyển động với hành động nhanh và loại bỏ hiện tượng xé hình\r\nCác tính năng ProArt Preset và ProArt Palette độc quyền của ASUS cung cấp nhiều loại thông số màu sắc có thể điều chỉnh\r\nThiết kế tiện dụng với độ nghiêng + 35° ~ -5°, xoay ± 45°, trục xoay ± 90° và điều chỉnh chiều cao 150mm cho trải nghiệm xem thoải mái', 580.58, 570.51, 'quy_sp004.jpg', 1, 0),
(19, 'Màn Hình Cong Msi Optix MAG272CQR 27\" 2K 165Hz', 'man-hinh-cong-msi-optix-mag272cqr-27-2k-165hz', 3, 3, 'Kích thước màn hình	27-inch\r\nĐộ phân giải	WQHD 2560 x 1440\r\nTỉ lệ màn hình	16:9\r\nGóc nhìn	178° (H) / 178° (V)\r\nĐộ sáng	300 nits\r\nTấm nền	VA Anti-glare cong 1500R\r\nKích cỡ điểm ảnh	0.2331(H) x 0.2331(V)\r\nĐộ tương phản	100000000:1', 425.86, 410.58, 'quy_sp006.jpg', 1, 0),
(20, 'Màn Hình Cong Msi Optix G27C4 27\" Va 165Hz', 'man-hinh-cong-msi-optix-g27c4-27-va-165hz', 3, 3, 'Kích thước màn hình: 27\"\r\nTấm nền - Panel: Samsung VA\r\nĐộ phân giải: 1920×1080\r\nTốc độ phản hồi: 1ms\r\nCổng kết nối: 1x DP (1.2a); 2x HDMI (1.4b)\r\nTần số quét: 165Hz\r\nĐộ cong: 1500R', 368.58, 340.56, 'quy_sp006.jpg', 1, 0),
(21, 'Laptop Msi Gaming Stealth 15M A11SDK', 'laptop-msi-gaming-stealth-15m-a11sdk', 1, 3, 'CPU: Intel Core i7 1185G7\r\nRAM: 16GB\r\nỔ cứng: 512GB SSD\r\nVGA: NVIDIA GTX1660Ti 6G MaxQ\r\nMàn hình: 15.6 inch FHD\r\nBàn phím: có đèn led\r\nHĐH: Win 10\r\nMàu: Xám Đen', 1477.78, 1470, 'quy_sp9.jpg', 1, 0),
(22, 'Laptop Dell Inspiron 5406 (N4I5047W)', 'laptop-dell-inspiron-5046-(n4i5047w)', 1, 4, 'CPU: Intel Core i5 1135G7\r\nRAM: 8GB\r\nỔ cứng: 512GB SSD\r\nVGA: Nvidia MX330 2GB\r\nMàn hình: 14 inch FHD cảm ứng\r\nHĐH: Win 10\r\nMàu: Xám', 999.67, 990.1, 'quy_sp10.jpg', 1, 0),
(23, 'Laptop Asus Gaming Rog Strix G512-IAL011T', 'laptop-asus-gaming-rog-strix-g512-ial011t', 1, 3, 'CPU: Intel Core i7 1075H\r\nRAM: 8GB\r\nỔ cứng: 512GB SSD\r\nVGA: NVIDIA GTX1650Ti 4GB\r\nMàn hình: 15.6 inch FHD 144hz\r\nBàn phím: có đèn led\r\nHĐH: Win 10\r\nMàu: Xanh', 1170.35, 1160.1, 'quy_sp13.jpg', 1, 0),
(24, 'Laptop Asus Gaming Tuf FA506QM HN005T', 'laptop-asus gaming-tuf-fa506qm-hn005t', 1, 1, 'CPU: AMD R7 5800H\r\nRAM: 16GB\r\nỔ cứng: 1TB SSD\r\nVGA: RTX 3060 6GB\r\nMàn hình: 15.6 inch FHD\r\nBàn phím: có đèn led\r\nHĐH: Win 10\r\nMàu: Xám', 1434.68, 1430.25, 'quy_sp11.jpg', 1, 0),
(25, 'Laptop Dell Gaming G3 15 3500', 'laptop-dell-gaming-g3-15-3500', 1, 4, 'CPU	\r\nIntel Core i5 10300H\r\nHệ điều hành	\r\nWindows 10 SL 64 Bit\r\nRAM	\r\nDDR4 8GB (2x4GB) 3200MHz, 2 slots, up to 32GB\r\nGPU	\r\nGeforce GTX 1650 4GB\r\nMàn hình	\r\n15.6\" Full HD ( 1920 x 1080 ), 120Hz, IPS Panel\r\nỔ cứng SSD	\r\n256GB SSD NVMe M.2 PCIe Gen 3×2\r\nỔ cứng HDD	\r\n1TB HDD\r\nPin	\r\n4 Cells, 56WHrs\r\nKích thước	\r\n389 x 274 x 24.95 mm\r\nTrọng lượng	\r\n2.5 kg', 812, 800, 'quy_sp12.jpg', 1, 0),
(26, 'Laptop Acer Gaming Nitro 5 AN515-56-51N4', 'laptop-acer-gaming-nitro-5-an515-56-51n4', 1, 2, 'CPU: Intel core i5 11300H\r\nRAM: 8GB\r\nỔ cứng: 512GB SSD\r\nVGA: NVIDIA GTX1650 4G\r\nMàn hình: 15.6 inch FHD 144hz\r\nHĐH: Win 10\r\nMàu: Đen', 951.76, 940.56, 'quy_sp14.jpg', 1, 0),
(27, 'Laptop Acer Aspire 7 A715-42G-R4ST', 'laptop-acer-asprice-7-a715-42g-r4st', 1, 2, 'CPU: AMD Ryzen 5 5500U\r\nRAM: 8GB\r\nỔ cứng: 256GB SSD\r\nVGA: NVIDIA GTX1650 4G DDR6\r\nMàn hình: 15.6 inch FHD\r\nHĐH: Win 10\r\nMàu: Đen', 807.67, 800, 'quy_sp15', 1, 0),
(28, 'Laptop Acer Gaming Predator Helios 300 PH315-53-78TN', 'laptop-acer-gaming-predator-helios-300-ph315-53-78tn', 1, 2, 'CPU: Intel Core i7 10750H\r\nRAM: 16GB\r\nỔ cứng: 512GB SSD\r\nVGA: Nvidia RTX3060 6G\r\nMàn hình: 15.6 inch FHD 300Hz\r\nĐèn bàn phím: RGB\r\nHĐH: Win 10\r\nMàu: Đen', 1830, NULL, 'quy_sp16.jpg', 1, 0),
(29, 'Laptop Acer Gaming Nitro 5 AN515-45-R0B6', 'laptop-acer-gaming-nitro-5-an515-45-r0b6', 1, 2, 'CPU: AMD Ryzen 7 5800H\r\nRAM: 8GB\r\nỔ cứng: 512GB SSD\r\nVGA: NVIDIA RTX3060 6G\r\nMàn hình: 15.6 inch FHD 144hz\r\nHĐH: Win 10\r\nMàu: Đen\r\n', 1423, NULL, 'quy_sp17.jpg', 1, 0),
(30, 'Laptop Acer Gaming Aspire 7 A715-41G-R282', 'laptop-acer-gaming-asprice-a715-41g-r282', 1, 2, 'CPU: AMD Ryzen5 3550H\r\nRAM: 8GB\r\nỔ cứng: 512GB SSD\r\nVGA: NVIDIA GTX1650 4GB\r\nMàn hình: 15.6 inch FHD IPS\r\nHĐH: Win 10\r\nMàu: Đen', 812, NULL, 'quy_sp18.jpg', 1, 0),
(31, 'Laptop Acer Gaming Predator Helios 300 PH315-53-770L', 'laptop-acer-gaming-predator-helios-300-ph315-53-770l', 1, 2, 'CPU: Intel Core i7 10750H\r\nRAM: 8GB RAM\r\nỔ cứng: 512GB SSD\r\nVGA: NVIDIA GTX1660Ti 6G\r\nMàn hình: 15.6\" FHD 144Hz\r\nHệ điều hành: Win 10', 1571, NULL, 'quy_sp19', 1, 0),
(32, 'Laptop Acer Gaming Predator Triton 500 PT515-52-78PN', 'laptop-acer-gaming-predator-triton-500-pt515-52-78pn', 1, 2, 'CPU: Intel Core i7 10750H\r\nRAM: 32GB RAM\r\nỔ cứng: 1TB SSD\r\nVGA: NVIDIA GTX1660Ti 6G\r\nMàn hình: 15.6\" FHD 144Hz\r\nHệ điều hành: Win 10', 3040, NULL, 'quy_sp20', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `pass` char(32) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `trash` tinyint(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
