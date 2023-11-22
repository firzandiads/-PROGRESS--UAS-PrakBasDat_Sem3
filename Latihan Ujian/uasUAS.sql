#Firzandi Ahsan Dwi styana
#21537144016

use siakad;

#Nomor 1, Tampilkan jumlah mahasiswa setiap tahun (mulai tahun 2005 sampai 2010).
select p.nama,
if(k.ta = '2005', count(k.ta),0) '2005',
if(k.ta = '2006', count(k.ta),0) '2006',
if(k.ta = '2007', count(k.ta),0) '2007',
if(k.ta = '2008', count(k.ta),0) '2008',
if(k.ta = '2009', count(k.ta),0) '2009',
if(k.ta = '2010', count(k.ta),0) '2010'
from prodi p join mahasiswa m using(ps) join krs_khs k using (nim)
group by k.ta;



#Nomor 2, Tampilkan IP untuk seorang mahasiswa seperti contoh.
SELECT m.nim, m.nama, round(sum(mk.sks * konversi(kk.nilai))/sum(mk.sks),2) as IP, mk.semester
from mahasiswa m join krs_khs kk using(nim) join pengampu using(kdambil) join matakuliah mk using(kodemk)
where m.nama = 'Adhi Wicaksono' and mk.semester="2";



#Nomor 3. Tampilkan IPK untuk seorang mahasiswa seperti contoh.

#Nomor 4, Tampilkan data hasil belajar mahasiswa untuk suatu angkatan.

#Nomor 5, Tampilkan data IP setiap semester dan IPK-nya untuk seluruh mahasiswa.





