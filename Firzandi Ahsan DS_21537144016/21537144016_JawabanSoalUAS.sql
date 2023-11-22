#Firzandi Ahsan Dwi styana
#21537144016

use siakad;

#Nomor 1, Tampilkan jumlah mahasiswa setiap tahun (mulai tahun 2005 sampai 2010).
select p.nama 'nama', 
sum(if(k.ta=2005,1,0))'2005', sum(if(k.ta=2006,1,0))'2006',
sum(if(k.ta=2007,1,0))'2007', sum(if(k.ta=2008,1,0))'2008',
sum(if(k.ta=2009,1,0))'2009', sum(if(k.ta=2010,1,0))'2010',
sum(if(k.ta=2005 || k.ta=2006 || k.ta=2007 || k.ta=2008 || k.ta=2009 || k.ta=2010,1,0))'Total'
from prodi p join mahasiswa m using(ps) join krs_khs k using(nim) 
where p.kdjurusan=52 
group by p.nama;


#Nomor 2, Tampilkan IP untuk seorang mahasiswa seperti contoh.
SELECT m.nim, m.nama, round(sum(mk.sks * konversi(kk.nilai))/sum(mk.sks),2) as IP, mk.semester
from mahasiswa m join krs_khs kk using(nim) join pengampu using(kdambil) join matakuliah mk using(kodemk)
where m.nama = 'Adhi Wicaksono' 
and mk.semester="2";


#Nomor 3. Tampilkan IPK untuk seorang mahasiswa seperti contoh.
call IPK('Adhi Wicaksono');


#Nomor 4, Tampilkan data hasil belajar mahasiswa untuk suatu angkatan.

#4.A
select distinct p.nama, m.nim, m.nama, round(konversi(k.nilai),2) 'ip'
from prodi p join mahasiswa m using(ps) join krs_khs k using(nim)
where k.ta='2008' 
and k.semester=2;

#4.B
select distinct p.nama, m.nim, m.nama, round(konversi(k.nilai),2) 'ip'
from prodi p join mahasiswa m using(ps) join krs_khs k using(nim)
where k.ta='2009' 
and k.semester=2;


#Nomor 5, Tampilkan data IP setiap semester dan IPK-nya untuk seluruh mahasiswa.
select distinct m.nim, m.nama 'mahasiswa',
if(k.ta = '2007' and k.semester = 1, round(konversi(k.nilai),2), 0) '2007/1',
if(k.ta = '2007' and k.semester = 2, round(konversi(k.nilai),2), 0) '2007/2',
if(k.ta = '2008' and k.semester = 1, round(konversi(k.nilai),2), 0) '2007/1',
if(k.ta = '2008' and k.semester = 2, round(konversi(k.nilai),2), 0) '2007/2',
if(k.ta = '2009' and k.semester = 1, round(konversi(k.nilai),2), 0) '2007/1',
if(k.ta = '2009' and k.semester = 2, round(konversi(k.nilai),2), 0) '2007/2'
from mahasiswa m natural join krs_khs k;