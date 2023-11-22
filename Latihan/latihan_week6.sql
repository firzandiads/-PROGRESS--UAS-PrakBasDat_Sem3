use penjualan_3;

alter table suplier
add email varchar(50) unique;

update suplier set email="pt_puma@puma.com" 
where nama="Pungkas Mandiri" 
and id_suplier="S001";

update suplier set email="sejahtera.kiat@yahoo.co.id"
where nama="Kiat Sejahtera"
and id_suplier="S004";

update suplier set email="yoiki_isakudab@gmail.com" 
where nama="Isaku Niki"
and id_suplier="S006";

update suplier set email="mandirindo@gomandiri.org" 
where nama="Indo Mandiri"
and id_suplier="S007";

select nama "Nama", tgl_lahir "Tanggal Lahir"
from pelanggan
where year(tgl_lahir)="1983"
order by tgl_lahir;

select nama "Nama", tgl_lahir "Tanggal Lahir"
from pelanggan
where month(tgl_lahir)="5"
order by tgl_lahir;

select p.nama "Nama", t.tgl_transaksi 
from pelanggan p, transaksi t
where p.id_pelanggan=t.id_pelanggan
and month(tgl_transaksi)="6"
order by tgl_transaksi;

select p.nama "Nama"
from pelanggan p, transaksi t, detail_transaksi dt, barang b, jenis_barang jb
where p.id_pelanggan=t.id_pelanggan
and t.kode_transaksi=dt.kode_transaksi
and dt.id_barang=b.id_barang
and b.nama="Chitato"
group by p.nama
order by p.nama;

select b.nama "Barang"
from pelanggan p, transaksi t, detail_transaksi dt, barang b, jenis_barang jb
where p.id_pelanggan=t.id_pelanggan
and t.kode_transaksi=dt.kode_transaksi
and dt.id_barang=b.id_barang
and p.nama="Charles"
and month(t.tgl_transaksi)="5"
group by b.nama
order by b.nama;

select nama "Suplier"
from suplier
where email like "%.com"
group by nama
order by nama;

select s.nama "Suplier"
from pelanggan p, transaksi t, detail_transaksi dt,
barang b, suplier s
where p.id_pelanggan=t.id_pelanggan
and t.kode_transaksi=dt.kode_transaksi
and dt.id_barang=b.id_barang
and b.id_suplier=s.id_suplier
and s.telepon like "0811%"
or s.telepon like "0812%"
or s.telepon like "0813%"
or s.telepon like "0821%"
or s.telepon like "0822%"
or s.telepon like "0823%"
or s.telepon like "0852%"
or s.telepon like "0853%"
group by s.nama
order by s.nama;

select s.nama "Suplier", jb.nama_jenis_brg "Jenis Barang"
from barang b, jenis_barang jb, suplier s
where b.id_suplier=s.id_suplier
and b.id_jenis_brg=jb.id_jenis_brg
and jb.nama_jenis_brg like "Mi%"
and s.alamat regexp "Merapi"
group by s.nama
order by s.nama;