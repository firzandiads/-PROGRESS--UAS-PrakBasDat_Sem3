CREATE DEFINER=`root`@`localhost` PROCEDURE `IPK`(nama varchar(50))
BEGIN
select m.nim 'Nim',
m.nama 'Nama',
round(sum(case 
when nilai = 'A' then 4*mk.sks
when nilai = 'A-' then 3.7*mk.sks
when nilai = 'B+' then 3.3*mk.sks
when nilai = 'B' then 3*mk.sks
when nilai = 'B-' then 2.7*mk.sks
when nilai = 'C+' then 2.3*mk.sks
when nilai = 'C' then 2*mk.sks
when nilai = 'D' then 1*mk.sks
else
0*mk.sks
end)/sum(mk.sks),2) 'IPK'
from prodi p join mahasiswa m using (ps) join krs_khs k using (nim) 
join pengampu using (kdambil) join matakuliah mk using (kodemk)
where m.nama regexp nama;
END