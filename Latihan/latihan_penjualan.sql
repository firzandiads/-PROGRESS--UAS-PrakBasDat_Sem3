create database penjualan_3;

use penjualan_3;

create table pelanggan
(id_pelanggan char(4) primary key,
nama varchar(20) not null,
jenis_kelamin enum('L','P') not null default 'L',
alamat varchar(50) not null,
telepon varchar(15),
tgl_lahir date not null,
jenis_pelanggan enum('G','S') not null default 'S') engine = InnoDB;

alter table pelanggan
change telepon handphone varchar(15);

create table karyawan
(id_karyawan char(4) primary key,
nama varchar(20) not null,
alamat varchar(50) not null,
telepon varchar(15),
tgl_lahir date not null,
gaji double not null) engine = InnoDB;

alter table karyawan
change telepon handphone varchar(15);

alter table karyawan
add jenis_kelamin enum('L','P') not null default 'L' after nama;

create table transaksi
(kode_transaksi char(4) primary key,
tgl_transaksi datetime not null,
id_pelanggan char(4) not null,
id_karyawan char(4) not null,
foreign key (id_pelanggan) references pelanggan(id_pelanggan) on delete cascade on update cascade,
foreign key (id_karyawan) references karyawan(id_karyawan) on delete cascade on update cascade) engine = InnoDB; 

create table jenis_barang
(id_jenis_brg tinyint primary key auto_increment,
nama_jenis_brg varchar(15) not null) engine = InnoDB;

create table suplier
(id_suplier char(4) primary key,
nama varchar(20) not null,
alamat varchar(50) not null,
telepon varchar(15) not null) engine = InnoDB;

create table barang
(id_barang char(4) primary key,
nama varchar(20) not null,
stok smallint not null,
harga float not null,
persen_laba float not null default '5.0',
diskon float not null default '0.0',
id_jenis_brg tinyint not null,
id_suplier char(4) not null,
foreign key (id_jenis_brg) references jenis_barang(id_jenis_brg) on delete cascade on update cascade,
foreign key (id_suplier) references suplier(id_suplier) on delete cascade on update cascade) engine = InnoDB;

create table detail_transaksi
(kode_transaksi char(4),
id_barang char(4) not null,
jumlah smallint not null default '1',
primary key (kode_transaksi, id_barang),
foreign key (kode_transaksi) references transaksi(kode_transaksi) on delete cascade on update cascade,
foreign key (id_barang) references barang(id_barang) on delete cascade on update cascade) engine = InnoDB;

insert into pelanggan values
('P001', 'Andi', 'L', 'Jl. Sukarno Hatta No.80', '08159132629', '1984-7-16', 'S'),
('P002', 'Susanto', 'L', 'Jl. P. Sudirman No.9', '08189596566', '1983-7-11', 'G'),
('P003', 'Susanti', 'L', 'Jl. Hayam Wuruk No.9A', '08171122222', '1982-8-2', 'G'),
('P004', 'Anton', 'L', 'Jl. Kebon Jeruk No.9B', '08171122223', '1980-6-12', 'S'),
('P005', 'Bobby', 'L', 'Jl. Kebon Sirih No. 80', '081310202326', '1983-5-1', 'G'),
('P006', 'Charles', 'L', 'Jl. P. Diponegoro No. 89', '081399919232', '1980-4-12', 'G'),
('P007', 'Merry', 'P', 'Jl. Kaliurang KM. 6 No. 80', '08125656989', '1978-5-16', 'G'),
('P008', 'Meiliana', 'P', 'Jl. Sukarno Hatta No. 78B', '08164918722', '1986-4-4', 'S');

insert into karyawan values
('K001', 'Tuti', 'P', 'Jl. Kenanga No.8', '08155601135', '1984-2-13', '725069'),
('K002', 'Siti', 'P', 'Jl. Mawar No.36B', '085868426728', '1983-8-29', '900269'),
('K003', 'Endang', 'P', 'Jl. Anggrek No.1', '087811121097', '1982-11-2', '525000'),
('K004', 'Yuli', 'P', 'Jl. Melati No.19', '081327934634', '1980-6-3', '622349'),
('K005', 'Yola', 'P', 'Jl. Melati No. 80', '081328305938', '1983-9-11', '425600'),
('K006', 'Lisa', 'P', 'Jl. Kamboja No. 11', '081572244100', '1980-5-2', '731000'),
('K007', 'Hasan', 'L', 'Jl. Bungaku No. 7', '08123476772', '1978-10-6', '725800'),
('K008', 'Herry', 'L', 'Jl. Bungamu No. 8B', '08125434789', '1982-3-26', '715100');

insert into jenis_barang values
('1', 'Snack'),
('2', 'Minuman'),
('3', 'Elektronik'),
('4', 'Alat Pembersih');

insert into suplier values
('S001', 'Pungkas Mandiri', 'Jl. Merapi No.212', '08122848418'),
('S002', 'Djati Internusa', 'Jl. Semeru No.44', '081328139050'),
('S003', 'Sabar Subur', 'Jl. Galunggung No.66', '08157984898'),
('S004', 'Kiat Sejahtera', 'Jl. Sutami No.545', '081931771735'),
('S005', 'Bersemi Kembali', 'Jl. Sigura-gura No. 7A', '081328171718'),
('S006', 'Isaku Niki', 'Jl. Kawi No. 27', '08126702381'),
('S007', 'Indo Mandiri', 'Jl. Muria No. 34B', '081914057581'),
('S008', 'Karya Indah', 'Jl. Merapi No. 35B', '081328084248');

insert into barang values
('B001', 'Chitato', '200', '3500', '5.0', '10.0', '1', 'S001'),
('B002', 'Cheetos', '100', '2850', '3.0', '10.0', '1', 'S001'),
('B003', 'Sprite', '125', '1650', '7.0', '8.0', '2', 'S003'),
('B004', 'Taro', '120', '2300', '6.0', '10.0', '1', 'S001'),
('B005', 'Fanta', '80', '1450', '6.0', '7.0', '2', 'S003'),
('B006', 'Sapu', '50', '2250', '10.0', '0.0', '4', 'S006'),
('B007', 'Kain Pel', '60', '2800', '4.0', '0.0', '4', 'S007'),
('B008', 'Coca Cola', '56', '1450', '3.0', '8.0', '2', 'S008'),
('B009', 'Seven Up', '65', '1850', '4.0', '8.0', '2', 'S008'),
('B010', 'Pepsi', '89', '1750', '6.0', '8.0', '2', 'S001'),
('B011', 'Telepon Panasonic', '75', '230000', '8.0', '0.0', '3', 'S004'),
('B012', 'Televisi Sharp', '30', '1400000', '7.0', '0.0', '3', 'S005'),
('B013', 'Ember', '78', '15000', '5.0', '0.0', '4', 'S006');

insert into transaksi values
('J001', '2006-5-5 11:30:55', 'P001', 'K001'),
('J002', '2006-5-8 10:10:05', 'P002', 'K002'),
('J003', '2006-5-12 10:45:12', 'P001', 'K003'),
('J004', '2006-5-15 17:57:09', 'P003', 'K004'),
('J005', '2006-5-16 18:01:31', 'P004', 'K005'),
('J006', '2006-5-18 16:42:41', 'P002', 'K001'),
('J007', '2006-5-20 11:31:13', 'P005', 'K002'),
('J008', '2006-5-22 10:30:05', 'P006', 'K003'),
('J009', '2006-5-24 20:19:19', 'P006', 'K004'),
('J010', '2006-5-29 20:39:46', 'P007', 'K005'),
('J011', '2006-6-2 19:16:01', 'P006', 'K001'),
('J012', '2006-6-5 19:00:12', 'P008', 'K002'),
('J013', '2006-6-10 14:38:11', 'P007', 'K003'),
('J014', '2006-6-12 13:10:52', 'P006', 'K004');

insert into detail_transaksi values
('J001', 'B001', '5'),
('J001', 'B002', '2'),
('J001', 'B003', '3'),
('J002', 'B001', '2'),
('J003', 'B005', '2'),
('J003', 'B001', '3'),
('J004', 'B004', '5'),
('J004', 'B007', '4'),
('J004', 'B008', '2'),
('J005', 'B013', '4'),
('J005', 'B011', '1'),
('J006', 'B006', '3'),
('J007', 'B008', '2'),
('J007', 'B001', '3'),
('J008', 'B001', '2'),
('J008', 'B008', '5'),
('J008', 'B004', '2'),
('J009', 'B006', '4'),
('J009', 'B001', '3'),
('J010', 'B013', '2'),
('J011', 'B002', '4'),
('J011', 'B001', '2'),
('J012', 'B002', '4'),
('J012', 'B009', '2'),
('J013', 'B002', '4'),
('J013', 'B001', '2'),
('J013', 'B008', '4'),
('J014', 'B002', '2'),
('J014', 'B006', '3');

