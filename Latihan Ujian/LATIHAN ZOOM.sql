#Membuat database baru
create database belajars;

#Cek database apakah sudah terbentuk apa belum
show databases;

#Masuk ke database "belajars"
use belajars;

#Membuat tabel
create table buku(kode_buku char(5) primary key, judul char(30) not null, pengarang char(30) not null, harga int, jumlah int);

#Melihat struktur/deskripsi tabel
desc buku;

#Cara primary key nya jadi 2 (ada 2 cara)
create table buku2(kode_buku char(5), judul char(30) not null, pengarang char(30) not null, harga int, jumlah int, primary key(kode_buku, pengarang) );

desc buku2;



#MODUL 2
#Alter, digunakan untuk memodifikasi tabel

#Mengubah null yes menjadi no (jangan lupa tulis type data nya)
alter table buku change harga harga int not null;
#Kenapa harga harga? karena itu merupakan nama kolom nama dan kolom baru
#not null=no, null=yes
#null=boleh kosong

#Mengubah nama kolom (not null juga harus ditulis karena termasuk mengganti kolom)
alter table buku change harga price int not null;

#Mengubah nama tabel buku2 menjadi book
alter table buku2 rename to book;

#Menampilkan tabel
show tables;

#SOAL! tambahkan data "issn" pada tabel book dimana letaknya setelah judul, type data char, null
#kalau boleh null berarti gausah ditulis apa-apa, tapi kalo tidak boleh null tulisnya not null
alter table book add issn char(10) after judul; 

desc book; 

#Meletakan "harga" menjadi paling depan
#Jangan lupa tulis "harga harga" dan type datanya
alter table book change harga harga int first;

#data issn bisa sama karena belom ada unique
#Ubah key issn menjadi unique
alter table book add constraint issn unique(issn);
#Ubah key issn menjadi unique sesuai aturan
alter table book add constraint issn_unik unique(issn);

#Menghapus unique dari issn
alter table book drop index issn;
#Menghapus unique dari issn sesuai aturan
alter table book drop index issn_unik;



#MODUL 3
#Membuat tabel lebih dari satu, yang saling ber-relasi
#Kalimat yang tebal(bold) adalah primary key

#Membuat tabel "penerbit" dan "buku"
#Data dari tabel penerbit terdiri atas kode_penerbit dan nm_penerbit (nm=nama)
#Data dari tabel buku terdiri atas kode_buku, judul, pengarang, jml_buku dan kode_penerbit
#Hubungan antara tabel "penerbit" dan "buku" adalah one to many
#Untuk type data terserah, null terserah, unique terserah, default terserah
#One to many=1 penerbit bisa menerbitkan banyak buku, dan 1 buku diterbitkan 1 penerbit
#One lambangnya "1", Many lambangnya "8 tiduran/infinite"
create database coba;

use coba;

create table penerbit (kode_penerbit char(5) primary key, nama_penerbit char(10)) engine = InnoDB;
#engine innoDB digunakan apabila error

desc penerbit;

create table buku (kode_buku char(5) primary key, judul char(10), pengarang char(10),
jml_buku int, kode_penerbit char(5), foreign key (kode_penerbit) references penerbit(kode_penerbit)
on delete cascade on update cascade) engine = InnoDB;

desc buku;

#Cara ngecek apakah kedua tabel tersebut terhubung apa tidak
#drop table penerbit

#Memasukan data ke dalam tabel penerbit
insert into penerbit values ("12345", "Gramedia"), ("54321", "Serangkai");

#Melihat isi data tabel "penerbit"
select * from penerbit;

#Memasukan data ke dalam tabel buku
insert into buku values ("ab123", "Belajar MySQL", "Arfiko", 10, "12345"),
("xy745", "Cintaku di kampus oren", "Najib", 11, "54321");

#Melihat isi data tabel "buku"
select * from buku;

#Menghapus data di tabel penerbit
delete from penerbit
where kode_penerbit = "54321";