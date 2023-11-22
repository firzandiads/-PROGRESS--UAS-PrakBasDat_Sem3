#menampilkan database yang ada di server mysql
show databases;

#membuat database sendiri
create database modul2;

#masuk database modul2
use modul2;

#membuat tabel di dalam database modul2;
create table mahasiswa (nim char(11) primary key, nama char(30) not null default 'Fth',
alamat varchar(30) not null, hp char(13));	

#melihat tabel dalam database
show tables;

#melihat deskripsi / struktur tabel
desc mahasiswa2;

desc mahasiswa;

#membuat tabel yang memiliki lebih dari 1 primary key
create table mahasiswa2 (nim char(11), nama char(30) not null default 'Fth',
alamat varchar(30) not null, hp char(13), primary key(nim, hp));

#memasukkan data ke dalam tabel
insert into mahasiswa values
('21537144017', 'Fathin Izzulhaq', 'Jl. Wiyoro Kidul', '081226840578'), 
('21537144099', 'Annisa', 'Jl. Tentrem No.10', null); 

insert into mahasiswa (hp, nim, alamat) values
('081226840568', '21537144002', 'Jl. Wiyoro Lor'), 
(null, '21537144056', 'Jl. Tentrem No.11'); 

#melihat data yang ada di tabel
select * from mahasiswa; #perintah dasar

select nama, nim
from mahasiswa
where hp is not null; #perintah melihat data yang meiliki nomor hp

#memperbarui / memperbaiki data
update mahasiswa
set alamat = 'Jl. Wiyoro Lor'
where nim = '21537144017';

#mengubah / memperbaiki nama tabel
alter table mahasiswa rename to student; #bisa pakai RENAME	TO atau RENAME saja

#mengganti / mengubah / memperbaiki nama kolom / field
#juga BISA mengganti tipe data 
#atau BISA membuat null menjadi not null atau sebaliknya
#atau BISA membuat default atau menghilangkan default
#atau BISA memindah atau mengganti urutan kolom / field

alter table student change nama name char(30);
alter table student change name nama varchar(30) not null default 'Fth' after hp;
alter table student change nama nama varchar(30) not null default 'Fth' first;

desc student;

select * from student;

#menambah kolom pada tabel
alter table student add fakultas varchar(30) not null after nim;

#menghapus kolom 
alter table student drop fakultas;	

update student 
set fakultas = 'FIS'
where nim = '21537144017';

update student 
set fakultas = 'FMIPA'
where nim = '21537144016';

update student 
set fakultas = 'FE'
where nim = '21537144056';

update student 
set fakultas = 'FIS'
where nim = '21537144002';

update student 
set fakultas = 'FBS'
where nim = '21537144098';
#menambah constraint / batasan /  aturan pada kolom / field 
alter table student add constraint fakultas_unik unique (fakultas);

#menghapus constraint 
alter table student drop index fakultas_unik;