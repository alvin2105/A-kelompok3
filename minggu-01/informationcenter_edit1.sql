-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Sep 2019 pada 12.01
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `informationcenter_edit1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_dosen`
--

CREATE TABLE `data_dosen` (
  `NIP` varchar(14) NOT NULL,
  `Nama_Dosen` varchar(30) NOT NULL,
  `Jenis_Kelamin` enum('L','P') NOT NULL,
  `Kontak` varchar(14) NOT NULL,
  `Alamat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_dosen`
--

INSERT INTO `data_dosen` (`NIP`, `Nama_Dosen`, `Jenis_Kelamin`, `Kontak`, `Alamat`) VALUES
('140810100001', 'Rudi Rosadi', 'L', '082222222222', 'Jln. Caringin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_mahasiswa`
--

CREATE TABLE `data_mahasiswa` (
  `NPM` varchar(14) NOT NULL,
  `Nama_Mahasiswa` varchar(30) NOT NULL,
  `Semester` enum('1','2','3','4','5','6','7','8') NOT NULL,
  `Jenis_Kelamin` enum('L','P') NOT NULL,
  `Kontak` varchar(14) NOT NULL,
  `Alamat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_mahasiswa`
--

INSERT INTO `data_mahasiswa` (`NPM`, `Nama_Mahasiswa`, `Semester`, `Jenis_Kelamin`, `Kontak`, `Alamat`) VALUES
('140810180049', 'Rizky Anugerah', '3', 'L', '081111111111', 'Jln. Perumahan Ikopin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `Id_MataKuliah` varchar(14) NOT NULL,
  `Nama_MataKuliah` varchar(30) NOT NULL,
  `Hari` date NOT NULL,
  `Waktu` datetime(6) NOT NULL,
  `Sks` enum('2','3') NOT NULL,
  `Kurikulum` enum('2016','2017') NOT NULL,
  `Semester` enum('1','2','3','4','5','6','7','8') NOT NULL,
  `NIP` varchar(14) NOT NULL,
  `Nama_Dosen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`Username`, `Password`) VALUES
('admin', '*4ACFE3202A5FF5CF467');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_dosen`
--
ALTER TABLE `data_dosen`
  ADD PRIMARY KEY (`NIP`);

--
-- Indeks untuk tabel `data_mahasiswa`
--
ALTER TABLE `data_mahasiswa`
  ADD PRIMARY KEY (`NPM`),
  ADD UNIQUE KEY `Semester` (`Semester`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`Id_MataKuliah`),
  ADD KEY `Semester` (`Semester`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `Nama_Dosen` (`Nama_Dosen`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Username`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `data_dosen` (`NIP`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`Semester`) REFERENCES `data_mahasiswa` (`Semester`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
