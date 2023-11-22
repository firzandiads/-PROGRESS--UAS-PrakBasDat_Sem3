use coba;

create table penerbit (kode_penerbit char(5) primary key, nama_penerbit char(10)) engine = InnoDB;

desc penerbit;

create table buku (kode_buku char(5) primary key, judul char(10), pengarang char(10), 
jml_buku int, kode_penerbit char(5), foreign key (kode_penerbit) references penerbit(kode_penerbit) 
on delete cascade on update cascade) engine = InnoDB;

drop table penerbit;

insert into penerbit values ("12345", "Gramedia"), ("54321", "Serangkai");

select * from penerbit;

insert into buku values ("ab123", "Belajar MySQL", "Arfiko", 10, "12345"),
("xy745", "Cintaku di kampus oren", "Najib", 11, "54321");

select * from buku2;

delete from penerbit2 
where kode_penerbit = "54321";

create table penerbit2 (kode_penerbit char(5) primary key, nama_penerbit char(10)) engine = InnoDB;

create table buku2 (kode_buku char(5) primary key, judul char(10), pengarang char(10), 
jml_buku int, kode_penerbit char(5), foreign key (kode_penerbit) references penerbit2(kode_penerbit)) engine = InnoDB;

show tables;

drop table buku2;

insert into penerbit2 values ("12345", "Gramedia"), ("54321", "Serangkai");

insert into buku2 values ("ab123", "Belajar MySQL", "Arfiko", 10, "12345"),
("xy745", "Cintaku di kampus oren", "Najib", 11, "54321");

#coba tampilkan informasi judul buku dan penerbitnya
select b.judul, p.nama_penerbit 
from buku2 b, penerbit2 p
where p.kode_penerbit = b.kode_penerbit;

select buku2.judul, penerbit2.nama_penerbit 
from buku2, penerbit2
where penerbit2.kode_penerbit = buku2.kode_penerbit;

select b.judul, p.nama_penerbit 
from buku2 b, penerbit2 p
where p.kode_penerbit = b.kode_penerbit and p.nama_penerbit = "Gramedia";

#update judul buku "Belajar My" menjadi "Study My"
update buku2 set judul = "Study My" 
where judul = "Belajar My";

select * from penerbit;

insert into penerbit values ("12345", "Arjuna");

replace into penerbit values ("12345", "Arjuna");

