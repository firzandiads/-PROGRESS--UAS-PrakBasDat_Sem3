
use penjualan_3;

#menampilkan jumlah pelanggan laki-laki dan perempuan dengan menggunakan IF
select if(jenis_kelamin="L","Laki-laki","Perempuan") "Jenis Kelamin", 
count(*) as "jumlah" 
from pelanggan 
group by jenis_kelamin
order by jumlah desc;


#tampilkan barang-barang yang sudah dibeli oleh ANdi dengan transaksi J003
#yang ditampilkan nama barang apa saja, jumlah berapa, tgl berapa transaksinya
#PETUNJUK:
#identifikasi tabel apa saja yg terlibat
#hubungan antar tabel (yg menghubungkan)
#pada bagian where tambah AND utk persyaratan lebih 1
select b.nama, d.jumlah, t.tgl_transaksi
from barang b, transaksi t, pelanggan p, detail_transaksi d
where p.id_pelanggan=t.id_pelanggan and t.kode_transaksi=d.kode_transaksi and
b.id_barang=d.id_barang and p.nama="Andi" and t.kode_transaksi="J008";


#bisa ditambahkan fungsi ARITMATIKA => penjumlahan, pengurangan, perkalian, pembagian dst
select b.nama, d.jumlah, t.tgl_transaksi, b.harga, d.jumlah * b.harga "sub total"
from barang b, transaksi t, detail_transaksi d
where t.kode_transaksi=d.kode_transaksi and
b.id_barang=d.id_barang and t.kode_transaksi="J008";

#total harga dari pembelian untuk transaksi di atas (kode transaksi J008)
#menggunakanfungsi agregasi SUM
select sum(d.jumlah * b.harga) "total"
from barang b, transaksi t, detail_transaksi d
where t.kode_transaksi=d.kode_transaksi and
b.id_barang=d.id_barang and t.kode_transaksi="J008";


#menampilkan besarnya transaksi untuk setiap transaksi (kode transaksi)
select t.kode_transaksi, sum(d.jumlah * b.harga) "total"
from barang b, transaksi t, detail_transaksi d
where t.kode_transaksi=d.kode_transaksi and
b.id_barang=d.id_barang
group by t.kode_transaksi;

#TUGAS LATIHAN (TIDAK DIKUMPULKAN)
#1. pada query di atas, tambahkan nama pelanggan yang melakukan setiap transaksi dan kapan transaksi tersebut dilakukan 

select p.nama, t.kode_transaksi, t.tgl_transaksi
from pelanggan p, transaksi t, detail_transaksi dt
where t.kode_transaksi=dt.kode_transaksi 
and p.id_pelanggan=t.id_pelanggan
group by t.kode_transaksi
order by t.kode_transaksi;

#2. urutkan informasi di atas berdasarkan tanggal transaksinya

select p.nama, t.kode_transaksi, t.tgl_transaksi
from pelanggan p, transaksi t, detail_transaksi dt
where t.kode_transaksi=dt.kode_transaksi 
and p.id_pelanggan=t.id_pelanggan
group by t.kode_transaksi
order by t.tgl_transaksi;

#3. tampilkan informasi tersebut di atas untuk bulan Juni 2006

select  p.nama, t.kode_transaksi, t.tgl_transaksi
from pelanggan p, transaksi t, detail_transaksi dt
where t.kode_transaksi=dt.kode_transaksi 
and p.id_pelanggan=t.id_pelanggan
and t.tgl_transaksi between "2006-06-1 00:00:00" and "2006-06-30 23:59:59"
group by t.kode_transaksi
order by t.kode_transaksi;

#4. besarnya transaksi untuk setiap bulan pada tahun 2006

select month(t.tgl_transaksi) "Bulan", year(t.tgl_transaksi) "Tahun", sum(dt.jumlah * b.harga) "Besar Transaksi"
from transaksi t, detail_transaksi dt, barang b
where t.kode_transaksi=dt.kode_transaksi
and dt.id_barang=b.id_barang
group by month(t.tgl_transaksi)
order by t.tgl_transaksi;