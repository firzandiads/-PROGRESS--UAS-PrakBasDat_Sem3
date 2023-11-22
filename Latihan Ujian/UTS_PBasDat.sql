create database persewaan;

show databases;

use persewaan;

create table penyewa (id_penyewa varchar(5) primary key not null,
nama char(30) not null, alamat varchar(30) not null,
kota char(10) not null, provinsi char(10) not null, 
negara char(10) not null,  telpon varchar(15) not null) engine =  InnoDB;

create table jaminan (id_jaminan varchar(5) primary key not null,
id_penyewa varchar(5) not null, foreign key (id_penyewa) references penyewa(id_penyewa) 
on delete cascade on update cascade) engine =  InnoDB;

create table detail_jaminan (id_jaminan varchar(5) not null, nama_jaminan char(30) not null,
keterangan varchar(30), primary key(id_jaminan, nama_jaminan), foreign key (id_jaminan) references jaminan(id_jaminan) 
on delete cascade on update cascade) engine =  InnoDB;

create table sewa (id_jaminan varchar(5) not null, nopol varchar(10) not null,
tgl_sewa datetime(6) not null, tgl_harus_kembali datetime(6) not null, tgl_kembali datetime(6) not null,
primary key(id_jaminan, nopol), foreign key (id_jaminan) references jaminan(id_jaminan) 
on delete cascade on update cascade, foreign key (nopol) references motor(nopol) 
on delete cascade on update cascade) engine =  InnoDB;

create table motor(nopol varchar(10) not null, merek varchar(20) not null,
keterangan varchar(30), harga int(10) not null, primary key (nopol)) engine =  InnoDB;

insert into penyewa values
('74811','Firzandi','jl. Jerapah','Bekasi','Jawa Barat', 'Indonesia', '0815343512'),
('85921','Ahsan','jl. Anoa','Jakarta','Jawa Barat', 'Indonesia', '0219583902'),
('06941','Dwi','jl. Kakalia','Jakarta','Jawa Barat', 'Indonesia', '08174927462'),
('58291','Styana','jl. Jerapah','Bekasi','Jawa Barat', 'Indonesia', '0228747954'),
('42341','Rezha','jl. Anoa','Surabaya','Jawa Timur', 'Indonesia', '081258452512'),
('68751','Faris','jl. Jerapah','Ponorogo','Jawa Timur', 'Indonesia', '081258423452'),
('65331','Aiman','jl. Kakalia','Ponorogo','Jawa Timur', 'Indonesia', '081258474645'),
('69771','Zidan','jl. Anoa','Batam','Sumatra', 'Indonesia', '081258474512'),
('12551','Fauzi','jl. Kakalia','Tanjung','Sumatra', 'Indonesia', '021356544512'),
('77981','Daffa','jl. Jerapah','Bekasi','Jawa Barat', 'Indonesia', '021358472462'),
('64351','Ihza','jl. Kakalia','Pemalang','Jawa Tengah', 'Indonesia', '021358474512'),
('78641','Arfi','jl. Kakalia','Surabaya','Jawa Timur', 'Indonesia', '021338474512'),
('17981','Fiko','jl. Jerapah','Batam','Sumatra', 'Indonesia', '021358472462'),
('64151','Yaya','jl. Jerapah','Bekasi','Jawa Barat', 'Indonesia', '0213658474512'),
('78411','Lala','jl. Anoa','Surabaya','Jawa Timur', 'Indonesia', '021338474512');

insert into jaminan values
('F012A','74811'),
('F013A','85921'),
('F014A','06941'),
('F015A','58291'),
('F016A','42341'),
('F017A','68751'),
('F018A','65331'),
('F019A','69771'),
('F010A','12551'),
('F021A','77981'),
('F022A','64351'),
('F023A','78641'),
('F024A','77981'),
('F025A','64151'),
('F026A','78411');

insert into detail_jaminan values
('F012A','SIM','Bersedia'),
('F013A','STNK','Bersedia'),
('F014A','BPJS','Bersedia'),
('F015A','Passport','Bersedia'),
('F016A','BPJS','Bersedia'),
('F017A','STNK','Bersedia'),
('F018A','STNK','Bersedia'),
('F019A','BPJS','Bersedia'),
('F010A','Passport','Bersedia'),
('F021A','STNK','Bersedia'),
('F022A','BPJS','Bersedia'),
('F023A','Passport','Bersedia'),
('F024A','SIM','Bersedia'),
('F025A','BPJS','Bersedia'),
('F026A','Passport','Bersedia');

insert into sewa values
('F012A','B423333333','181122','191122','191122'),
('F013A','B123444444','181122','191122','191122'),
('F014A','B432555555','191122','201122','201122'),
('F015A','D580666666','191122','201122','201122'),
('F016A','G859777777','111122','121122','121122'),
('F017A','F555888888','111122','121122','121122'),
('F018A','B432999999','121122','131122','131122'),
('F019A','BH582000000','121122','131122','131122'),
('F010A','A235111111','131122','141122','141122'),
('F021A','A687222222','131122','141122','141122'),
('F022A','B532333333','141122','151122','151122'),
('F023A','AD234444444','141122','151122','151122'),
('F024A','H544555555','151122','161122','161122'),
('F025A','F435666666','151122','161122','161122'),
('F026A','B768777777','161122','171122','171122');

insert into motor values
('B423333333','Suzuki','Thunder','43.000'),
('B123444444','Honda', 'Pcx', '65.000'),
('B432555555','Honda','Revo','24.000'),
('D580666666','Honda','Revo','24.000'),
('G859777777','Honda','Pcx','12.000'),
('F555888888','Kawasaki','Ninja','21.000'),
('B432999999','Yamaha','Nmax','54.000'),
('BH582000000','Honda','Supra','12.000'),
('A235111111','Suzuki','Thunder','65.000'),
('A687222222','Yamaha','Mio','87.000'),
('B532333333','Yamaha','Aerox','34.000'),
('AD234444444','Honda','Pcx','89.000'),
('H544555555','suzuki','Thunder','12.000'),
('F435666666','Kawasaki','Ninja','19.000'),
('B768777777','Yamaha','Nmax','50.000');

select * from penyewa where provinsi = 'Jawa Timur';

select * from penyewa where provinsi = 'Jawa Barat';

select nama, telpon,
case
	when telpon regexp '^021' then "Telkomsel"
    when telpon regexp '081' or telpon regexp '0859' then "XL"
    when telpon regexp '026' then "Three"
	else "Indosat"
end 'operator'
from penyewa order by operator;