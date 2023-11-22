use penjualan_3;
#menampilkan jenis pelanggan kelompok G
select nama,alamat,jenis_pelanggan from pelanggan
where jenis_pelanggan='G';

#menampilkan jenis kelamin p
select nama,alamat,jenis_kelamin from pelanggan
where jenis_kelamin='P';

#mencoba untuk perbandingan
select nama, stok, harga from barang
where stok>100;

select nama, stok, harga from barang
where harga <= 2500;

select nama, jenis_kelamin from karyawan
where jenis_kelamin <> 'P';

#menggunakan like 
select nama, tgl_lahir from pelanggan where nama like 'me%';
select nama, tgl_lahir from pelanggan where nama like '%anto';
select nama, tgl_lahir from pelanggan where nama like '%san';
select nama, tgl_lahir from pelanggan where nama like 'susant_';
select nama, tgl_lahir from pelanggan where nama like 'susan_';
select nama, tgl_lahir from pelanggan where nama like '_e%';

#menampilkan klausa in
select nama, harga, persen_laba from barang where persen_laba in (3,6,7);
select nama, harga, persen_laba from barang where nama in ('chitato');
select nama, harga, persen_laba, id_suplier from barang where id_suplier in ('s001');

#menambah kolom email di tabel suplier
alter table suplier add email varchar(20) unique;
alter table suplier change email email varchar(50);

desc suplier;
#memasukan data email 
UPDATE suplier
SET email = 'pt_puma@puma.com'
WHERE id_suplier = 'S001' ;

UPDATE suplier
SET email = 'sejahtera.kiat@yahoo.co.id'
WHERE id_suplier = 'S004' and nama = 'Kiat Sejahtera';

UPDATE suplier
SET email = 'yoiki_isakudab@gmail.com'
WHERE id_suplier = 'S006' and nama = 'isaku niki';

UPDATE suplier
SET email = 'mandiriindo@gomandiri.org'
WHERE id_suplier = 'S007' and nama = 'indo mandiri';

#latihan
#no 1
select  nama, tgl_lahir from pelanggan where tgl_lahir like '1983%';

#no 2
select  nama, tgl_lahir from pelanggan where MONTH (tgl_lahir) = 5;

#no 3
select p.nama,t.tgl_transaksi from pelanggan p, transaksi t
where p.id_pelanggan=t.id_pelanggan and t.tgl_transaksi like '%06%';

#no 4
select p.nama, b.nama, persen_laba from pelanggan p, barang b, detail_transaksi dt, transaksi t
where b.id_barang=dt.id_barang and dt.kode_transaksi=t.kode_transaksi and t.id_pelanggan=p.id_pelanggan
and b.nama in ('chitato');

#no 5
select p.nama, b.nama, t.tgl_transaksi from pelanggan p, barang b, transaksi t, detail_transaksi dt
where dt.kode_transaksi=t.kode_transaksi and dt.id_barang=b.id_barang and t.id_pelanggan=p.id_pelanggan
and t.tgl_transaksi like '%05' and p.nama in ('charles');

#no 6
select id_suplier, nama, email from suplier
where email like '%.com';

#no 7
select nama, alamat, telepon from suplier
where telepon like '0811%' or telepon like'0812%' or telepon like'0813%' or telepon like'0821%'
or telepon like'0822%' or telepon like'0823%';

#no 8
select distinct s.nama, j.nama_jenis_brg, s.alamat from suplier s, barang b, jenis_barang j
where s.id_suplier=b.id_suplier and b.id_jenis_brg=j.id_jenis_brg
and b.id_jenis_brg Regexp 2 and s.alamat like '%merapi%';

