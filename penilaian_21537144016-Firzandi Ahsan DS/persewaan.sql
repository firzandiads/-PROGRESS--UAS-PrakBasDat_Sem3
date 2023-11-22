-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Nov 2022 pada 09.22
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `persewaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_jaminan`
--

CREATE TABLE `detail_jaminan` (
  `id_jaminan` varchar(5) NOT NULL,
  `nama_jaminan` char(30) NOT NULL,
  `keterangan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_jaminan`
--

INSERT INTO `detail_jaminan` (`id_jaminan`, `nama_jaminan`, `keterangan`) VALUES
('F010A', 'Passport', 'Bersedia'),
('F012A', 'SIM', 'Bersedia'),
('F013A', 'STNK', 'Bersedia'),
('F014A', 'BPJS', 'Bersedia'),
('F015A', 'Passport', 'Bersedia'),
('F016A', 'BPJS', 'Bersedia'),
('F017A', 'STNK', 'Bersedia'),
('F018A', 'STNK', 'Bersedia'),
('F019A', 'BPJS', 'Bersedia'),
('F021A', 'STNK', 'Bersedia'),
('F022A', 'BPJS', 'Bersedia'),
('F023A', 'Passport', 'Bersedia'),
('F024A', 'SIM', 'Bersedia'),
('F025A', 'BPJS', 'Bersedia'),
('F026A', 'Passport', 'Bersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jaminan`
--

CREATE TABLE `jaminan` (
  `id_jaminan` varchar(5) NOT NULL,
  `id_penyewa` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jaminan`
--

INSERT INTO `jaminan` (`id_jaminan`, `id_penyewa`) VALUES
('F014A', '06941'),
('F010A', '12551'),
('F016A', '42341'),
('F015A', '58291'),
('F025A', '64151'),
('F022A', '64351'),
('F018A', '65331'),
('F017A', '68751'),
('F019A', '69771'),
('F012A', '74811'),
('F021A', '77981'),
('F024A', '77981'),
('F026A', '78411'),
('F023A', '78641'),
('F013A', '85921');

-- --------------------------------------------------------

--
-- Struktur dari tabel `motor`
--

CREATE TABLE `motor` (
  `nopol` varchar(10) NOT NULL,
  `merek` varchar(20) NOT NULL,
  `keterangan` varchar(30) DEFAULT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `motor`
--

INSERT INTO `motor` (`nopol`, `merek`, `keterangan`, `harga`) VALUES
('A235111111', 'Suzuki', 'Thunder', 65),
('A687222222', 'Yamaha', 'Mio', 87),
('AD23444444', 'Honda', 'Pcx', 89),
('B123444444', 'Honda', 'Pcx', 65),
('B423333333', 'Suzuki', 'Thunder', 43),
('B432555555', 'Honda', 'Revo', 24),
('B432999999', 'Yamaha', 'Nmax', 54),
('B532333333', 'Yamaha', 'Aerox', 34),
('B768777777', 'Yamaha', 'Nmax', 50),
('BH58200000', 'Honda', 'Supra', 12),
('D580666666', 'Honda', 'Revo', 24),
('F435666666', 'Kawasaki', 'Ninja', 19),
('F555888888', 'Kawasaki', 'Ninja', 21),
('G859777777', 'Honda', 'Pcx', 12),
('H544555555', 'suzuki', 'Thunder', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewa`
--

CREATE TABLE `penyewa` (
  `id_penyewa` varchar(5) NOT NULL,
  `nama` char(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `kota` char(10) NOT NULL,
  `provinsi` char(10) NOT NULL,
  `negara` char(10) NOT NULL,
  `telpon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nama`, `alamat`, `kota`, `provinsi`, `negara`, `telpon`) VALUES
('0694', 'Dwi', 'jl. Kakalia', 'Jakarta', 'Jawa Barat', 'Indonesia', '08174927462'),
('06941', 'Dwi', 'jl. Kakalia', 'Jakarta', 'Jawa Barat', 'Indonesia', '08174927462'),
('1255', 'Fauzi', 'jl. Kakalia', 'Tanjung Pi', 'Sumatra', 'Indonesia', '021356544512'),
('12551', 'Fauzi', 'jl. Kakalia', 'Tanjung Pi', 'Sumatra', 'Indonesia', '021356544512'),
('1798', 'Fiko', 'jl. Jerapah', 'Batam', 'Sumatra', 'Indonesia', '021358472462'),
('17981', 'Fiko', 'jl. Jerapah', 'Batam', 'Sumatra', 'Indonesia', '021358472462'),
('4234', 'Rezha', 'jl. Anoa', 'Surabaya', 'Jawa Timur', 'Indonesia', '081258452512'),
('42341', 'Rezha', 'jl. Anoa', 'Surabaya', 'Jawa Timur', 'Indonesia', '081258452512'),
('5829', 'Styana', 'jl. Jerapah', 'Bekasi', 'Jawa Barat', 'Indonesia', '0228747954'),
('58291', 'Styana', 'jl. Jerapah', 'Bekasi', 'Jawa Barat', 'Indonesia', '0228747954'),
('6415', 'Yaya', 'jl. Jerapah', 'Bekasi', 'Jawa Barat', 'Indonesia', '0213658474512'),
('64151', 'Yaya', 'jl. Jerapah', 'Bekasi', 'Jawa Barat', 'Indonesia', '0213658474512'),
('6435', 'Ihza', 'jl. Kakalia', 'Pemalang', 'Jawa Tenga', 'Indonesia', '021358474512'),
('64351', 'Ihza', 'jl. Kakalia', 'Pemalang', 'Jawa Tenga', 'Indonesia', '021358474512'),
('6533', 'Aiman', 'jl. Kakalia', 'Ponorogo', 'Jawa Timur', 'Indonesia', '081258474645'),
('65331', 'Aiman', 'jl. Kakalia', 'Ponorogo', 'Jawa Timur', 'Indonesia', '081258474645'),
('6875', 'Faris', 'jl. Jerapah', 'Ponorogo', 'Jawa Timur', 'Indonesia', '081258423452'),
('68751', 'Faris', 'jl. Jerapah', 'Ponorogo', 'Jawa Timur', 'Indonesia', '081258423452'),
('6977', 'Zidan', 'jl. Anoa', 'Batam', 'Sumatra', 'Indonesia', '081258474512'),
('69771', 'Zidan', 'jl. Anoa', 'Batam', 'Sumatra', 'Indonesia', '081258474512'),
('7481', 'Firzandi', 'jl. Jerapah', 'Bekasi', 'Jawa Barat', 'Indonesia', '0815343512'),
('74811', 'Firzandi', 'jl. Jerapah', 'Bekasi', 'Jawa Barat', 'Indonesia', '0815343512'),
('7798', 'Daffa', 'jl. Jerapah', 'Bekasi', 'Jawa Barat', 'Indonesia', '021358472462'),
('77981', 'Daffa', 'jl. Jerapah', 'Bekasi', 'Jawa Barat', 'Indonesia', '021358472462'),
('7824', 'Lala', 'jl. Anoa', 'Surabaya', 'Jawa Timur', 'Indonesia', '021338474512'),
('78411', 'Lala', 'jl. Anoa', 'Surabaya', 'Jawa Timur', 'Indonesia', '021338474512'),
('7864', 'Arfi', 'jl. Kakalia', 'Surabaya', 'Jawa Timur', 'Indonesia', '021338474512'),
('78641', 'Arfi', 'jl. Kakalia', 'Surabaya', 'Jawa Timur', 'Indonesia', '021338474512'),
('8592', 'Ahsan', 'jl. Anoa', 'Jakarta', 'Jawa Barat', 'Indonesia', '0219583902'),
('85921', 'Ahsan', 'jl. Anoa', 'Jakarta', 'Jawa Barat', 'Indonesia', '0219583902');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sewa`
--

CREATE TABLE `sewa` (
  `id_jaminan` varchar(5) NOT NULL,
  `nopol` varchar(10) NOT NULL,
  `tgl_sewa` datetime(6) NOT NULL,
  `tgl_harus_kembali` datetime(6) NOT NULL,
  `tgl_kembali` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sewa`
--

INSERT INTO `sewa` (`id_jaminan`, `nopol`, `tgl_sewa`, `tgl_harus_kembali`, `tgl_kembali`) VALUES
('F010A', 'A235111111', '2013-11-22 00:00:00.000000', '2014-11-22 00:00:00.000000', '2014-11-22 00:00:00.000000'),
('F012A', 'B423333333', '2018-11-22 00:00:00.000000', '2019-11-22 00:00:00.000000', '2019-11-22 00:00:00.000000'),
('F013A', 'B123444444', '2018-11-22 00:00:00.000000', '2019-11-22 00:00:00.000000', '2019-11-22 00:00:00.000000'),
('F014A', 'B432555555', '2019-11-22 00:00:00.000000', '2020-11-22 00:00:00.000000', '2020-11-22 00:00:00.000000'),
('F015A', 'D580666666', '2019-11-22 00:00:00.000000', '2020-11-22 00:00:00.000000', '2020-11-22 00:00:00.000000'),
('F016A', 'G859777777', '2011-11-22 00:00:00.000000', '2012-11-22 00:00:00.000000', '2012-11-22 00:00:00.000000'),
('F017A', 'F555888888', '2011-11-22 00:00:00.000000', '2012-11-22 00:00:00.000000', '2012-11-22 00:00:00.000000'),
('F018A', 'B432999999', '2012-11-22 00:00:00.000000', '2013-11-22 00:00:00.000000', '2013-11-22 00:00:00.000000'),
('F019A', 'BH58200000', '2012-11-22 00:00:00.000000', '2013-11-22 00:00:00.000000', '2013-11-22 00:00:00.000000'),
('F021A', 'A687222222', '2013-11-22 00:00:00.000000', '2014-11-22 00:00:00.000000', '2014-11-22 00:00:00.000000'),
('F022A', 'B532333333', '2014-11-22 00:00:00.000000', '2015-11-22 00:00:00.000000', '2015-11-22 00:00:00.000000'),
('F023A', 'AD23444444', '2014-11-22 00:00:00.000000', '2015-11-22 00:00:00.000000', '2015-11-22 00:00:00.000000'),
('F024A', 'H544555555', '2015-11-22 00:00:00.000000', '2016-11-22 00:00:00.000000', '2016-11-22 00:00:00.000000'),
('F025A', 'F435666666', '2015-11-22 00:00:00.000000', '2016-11-22 00:00:00.000000', '2016-11-22 00:00:00.000000'),
('F026A', 'B768777777', '2016-11-22 00:00:00.000000', '2017-11-22 00:00:00.000000', '2017-11-22 00:00:00.000000');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_jaminan`
--
ALTER TABLE `detail_jaminan`
  ADD PRIMARY KEY (`id_jaminan`,`nama_jaminan`);

--
-- Indeks untuk tabel `jaminan`
--
ALTER TABLE `jaminan`
  ADD PRIMARY KEY (`id_jaminan`),
  ADD KEY `id_penyewa` (`id_penyewa`);

--
-- Indeks untuk tabel `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`nopol`);

--
-- Indeks untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`);

--
-- Indeks untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id_jaminan`,`nopol`),
  ADD KEY `nopol` (`nopol`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_jaminan`
--
ALTER TABLE `detail_jaminan`
  ADD CONSTRAINT `detail_jaminan_ibfk_1` FOREIGN KEY (`id_jaminan`) REFERENCES `jaminan` (`id_jaminan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jaminan`
--
ALTER TABLE `jaminan`
  ADD CONSTRAINT `jaminan_ibfk_1` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa` (`id_penyewa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_jaminan`) REFERENCES `jaminan` (`id_jaminan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`nopol`) REFERENCES `motor` (`nopol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
