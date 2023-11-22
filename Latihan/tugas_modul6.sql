#MENGGUNAKAN DATABASE
use penjualan_3;

#NOMOR 1
#Pelanggan yang lahir pada bulan mei.
select nama "Pelanggan"
from pelanggan
where monthname(tgl_lahir)="May";

#NOMOR 2
#Pelanggan yang melakukan transaksi pembelian pada bulan juni.
select p.nama "Pelanggan"
from pelanggan p, transaksi t
where p.id_pelanggan=t.id_pelanggan
and monthname(t.tgl_transaksi)="June";

#NOMOR 3
#Barang apa saja yang dibeli oleh Charles pada bulan mei.
select b.nama "Nama Barang"
from pelanggan p, transaksi t, detail_transaksi dt, barang b
where p.id_pelanggan=t.id_pelanggan
and t.kode_transaksi=dt.kode_transaksi
and dt.id_barang=b.id_barang
and p.nama="Charles"
and monthname(t.tgl_transaksi)="May"
group by b.nama;

#NOMOR 4
#Berapa umur masing-masing pelanggan pada hari ini? (tahun,bulan,hari)
select nama "Nama", timestampdiff(year, tgl_lahir,now()) "Umur", tgl_lahir "Tanggal Lahir"
from pelanggan;

#NOMOR 5
#Berapa total harga yang harus dibayar oleh Andi untuk kode transaksi J001, tanpa memperhitungkan diskon.
select sum(dt.jumlah*b.harga) "Total Harga"
from pelanggan p, transaksi t, detail_transaksi dt, barang b
where p.id_pelanggan=t.id_pelanggan
and t.kode_transaksi=dt.kode_transaksi
and dt.id_barang=b.id_barang
and p.nama="Andi"
and dt.kode_transaksi="J001";

#NOMOR 6
#Berapa keuntungan perusahaan pada bulan Juni 2006, penjualan tanpa ada diskon?
select sum((b.harga*b.persen_laba/100)*dt.jumlah) 'Laba'
from transaksi t, detail_transaksi dt, barang b
where t.kode_transaksi=dt.kode_transaksi
and dt.id_barang=b.id_barang
and YEAR(t.tgl_transaksi)='2006'
and MONTH(t.tgl_transaksi)='6';

#NOMOR 7
#Berapa uang yang harus kita bayar pada PT. Pungkas Mandiri pada bulan mei 2006 karena barangnya berhasil kita jual?
select sum(b.harga*dt.jumlah-((b.harga*b.persen_laba/100)*dt.jumlah)) 'Harga Belanja'
from transaksi t, detail_transaksi dt, barang b, suplier s
where t.kode_transaksi=dt.kode_transaksi
and dt.id_barang=b.id_barang
and b.id_suplier=s.id_suplier
and s.nama='Pungkas Mandiri'
and YEAR(t.tgl_transaksi)='2006'
and MONTH(t.tgl_transaksi)='5';