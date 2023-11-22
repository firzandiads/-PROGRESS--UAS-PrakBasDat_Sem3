insert into pelanggan values
("P009", "Zaky", "L", "Jl. Pramuka Raya 1B", "089677885654", "2000-03-10", "S"),
("P010", "Ina", "P", "Jl. Gedhongan 25", "089799897462", "2002-11-25", "S"),
("P011", "Putra", "L", "Jl. By Pass KM. 13 No.98C", "089811232548", "1999-09-23", "S"),
("P012", "Abel", "P", "Jl. Wunguaji 1", "089984332987", "1995-12-10", "G"),
("P013", "Arfi", "P", "Jl. Gronjal 11", "081185654099", "2000-09-29", "S"),
("P014", "Pascal", "L", "Jl. Jalanyuk 002", "081285000341", "2002-01-06", "S"),
("P015", "Neo", "L", "Jl. Yangberliku 14", "081311776789", "1999-01-03", "S"),
("P016", "Aska", "P", "Jl. Yangnaikturun 55", "082110989005", "1995-11-11", "G"),
("P017", "Fali", "P", "Jl. Menujupasar Baru", "0822223344565", "1995-12-12", "G"),
("P018", "Sadimin", "L", "Jl. Telaga Baru", "082322112322", "1990-02-06", "S"),
("P019", "Barkah", "L", "Jl. Barudicor 9", "085212343349", "1988-08-17", "G"),
("P020", "Bagus", "L", "Jl. Selokan Mataram 33", "085398977007", "1982-10-06", "S"),
("P021", "Panggih", "L", "Jl. Yangenakdilewati 4501", "081734562210", "2002-06-19", "S"),
("P022", "Yuyun", "P", "Jl. Mintadiaspal 51", "081800999656", "1988-03-14", "G"),
("P023", "Tari", "P", "Jl. Berkah 14", "081987865434", "1999-07-27", "S"),
("P024", "Prapto", "L", "Jl. Anggurmerah 55", "087777788987", "1993-08-11", "G"),
("P025", "Heru", "L", "Jl. Menujangbelajarku 8", "087812385321", "1990-02-21", "S"),
("P026", "Pratono", "L", "Jl. Yangberlikaliku 13", "087955123499", "1980-10-11", "S"),
("P027", "Biruku", "P", "Jl. Pramuka Raya 22", "085678776543", "2000-03-10", "G"),
("P028", "Tina", "P", "Jl. Gedhongan 15", "085711232323", "1982-12-05", "S");

#1. tampilkan data pelanggan yang menggunakan Three

select nama "Pelanggan Three"
from pelanggan
where handphone like "0896%"
or handphone like "0897%"
or handphone like "0898%"
or handphone like "0899%";

#2. tampilkan data pelanggan yang menggunakan XL

select nama "Pelanggan XL"
from pelanggan
where handphone like "0817%"
or handphone like "0818%"
or handphone like "0819%"
or handphone like "0859%"
or handphone like "0877%"
or handphone like "0878%"
or handphone like "0879%";

#3. tampilkan data pelanggan yang menggunakan Telkomsel

select nama "Pelanggan Telkomsel"
from pelanggan
where handphone like "0811%"
or handphone like "0812%"
or handphone like "0813%"
or handphone like "0821%"
or handphone like "0822%"
or handphone like "0823%"
or handphone like "0852%"
or handphone like "0853%"
or handphone like "0879%";

#4. tampilkan data pelanggan beserta dengan Operator selular yang digunakannya

select nama, handphone, case
when handphone like "0914%"
or handphone like "0815%"
or handphone like "0816%"
or handphone like "0855%"
or handphone like "0856%"
or handphone like "0857%"
or handphone like "0858%"
then "Indosat"
when handphone like "0811%"
or handphone like "0812%"
or handphone like "0813%"
or handphone like "0821%"
or handphone like "0822%"
or handphone like "0823%"
or handphone like "0852%"
or handphone like "0853%"
then "Telkomsel"
when handphone like "0896%"
or handphone like "0897%"
or handphone like "0898%"
or handphone like "0899%"
then "Three"
when handphone like "0817%"
xor handphone like "0818%"
or handphone like "0819%"
or handphone like "0859%"
or handphone like "0877%"
or handphone like "0878%"
or handphone like "0879%"
then "XL"
else "Tidak Diketahui"
end "Operator"
from pelanggan
group by handphone;

#5. tampilkan data Operator selular dan jumlah pelanggan yang menggunakannya

select case
when handphone like "0914%"
or handphone like "0815%"
or handphone like "0816%"
or handphone like "0855%"
or handphone like "0856%"
or handphone like "0857%"
or handphone like "0858%"
then "Indosat"
when handphone like "0811%"
or handphone like "0812%"
or handphone like "0813%"
or handphone like "0821%"
or handphone like "0822%"
or handphone like "0823%"
or handphone like "0852%"
or handphone like "0853%"
then "Telkomsel"
when handphone like "0896%"
or handphone like "0897%"
or handphone like "0898%"
or handphone like "0899%"
then "Three"
when handphone like "0817%"
xor handphone like "0818%"
or handphone like "0819%"
or handphone like "0859%"
or handphone like "0877%"
or handphone like "0878%"
or handphone like "0879%"
then "XL"
else "Tidak Diketahui"
end "Operator",
count(*) "Telepon"
from pelanggan
group by operator
order by operator;