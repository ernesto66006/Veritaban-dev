create database ürüntakip CHARACTER SET utf8 COLLATE utf8_turkish_ci;
use ürüntakip;

create table ürünkategori(
ürünkategoriid int not null,
Ürüntürü varchar(50),
Kategoriadı varchar(50),
primary key(ürünkategoriid)
);
create table ürünler(
ürünid int not null,
ürünkategoriid int not null,
ürünadı varchar(50),
ürünkodu int,
primary key(ürünid)
);
create table satıcı(
satıcıid int not null,
ürünid int not null,
ürünkategoriid int not null,
Firmaadı varchar(50),
Firmapuanı int,
Firmayorumları varchar(50),
primary key(satıcıid)
);
create table sipariş(
siparişid int not null,
satıcıid int not null,
ürünid int not null,
ürünkategoriid int not null,
üyeid int not null,
siparişkodu int,
siparişadedi int,
tutar int,
toplamsatış int,
toplamsipariş int,
primary key(siparişid)
);
create table üyeler(
üyeid int not null,
adı varchar(50),
soyadı varchar(50),
tckimlik varchar(50),
adres varchar(50),
telefon varchar(50),
mailadresi varchar(50),
üyeliktürü varchar(50),
primary key(üyeid)
);
create table kargo(
kargoid int not null,
siparişid int not null,
kargofirması varchar(50),
kargoücreti varchar(50),
kargoteslimsüresi varchar(50),
primary key(kargoid)
);
create table fatura(
faturaid int not null,
üyeid int not null,
ürünid int not null,
ürünkategoriid int not null,
kargoid int not null,
siparişid int not null,
satıcıid int not null,
faturatarihi varchar(50),
primary key(faturaid)
);

INSERT INTO `ürünkategori` (`ürünkategoriid`, `ürüntürü`, `Kategoriadı`) VALUES
(1, 'masa', 'Ev eşyası'),
(2, 'sandalye', 'Ev eşyası'),
(3, 'masa', 'Ev eşyası'),
(4, 'sandalye', 'Ev eşyası'),
(5, 'yatak', 'Yatak Odası'),
(6, 'komidin', 'Ev eşyası'),
(7, 'fırın', 'Mutfak Eşyası');

select*from ürünkategori;

INSERT INTO `ürünler` (`ürünid`, `ürünkategoriid`, `ürünadı`, `ürünkodu`) VALUES
(1, '1', 'Fırın', '0001'),
(2, '2', 'Sandalye', '0002'),
(3, '3', 'mikrodalga fırın', '0003'),
(4, '4', 'Yatak', '0004'),
(5, '5', 'Komidin', '0005'),
(6, '6', 'Fırın', '0006');

select*from ürünler;

INSERT INTO `satıcı` (`satıcıid`, `ürünid`, `ürünkategoriid`,  `Firmaadı`, `Firmapuanı`, `Firmayorumları`) VALUES
(1, '1', '1', 'İkea', '5', 'her ürünü bulabiliyorsunuz'),
(2, '2', '2', 'Yataş', '4', 'yatakları konforlu'),
(3, '3', '3', 'İstikbal', '4', 'kaliteli ürünleri '),
(4, '4', '4', 'mondi', '3', 'fiyat kalite olarak çok iyi');

select*from satıcı;

INSERT INTO `sipariş` (`siparişid`, `satıcıid`,  `ürünid`, `ürünkategoriid`, `üyeid`, `siparişkodu`, `siparişadedi`, `tutar`, `toplamsatış`, `toplamsipariş`) VALUES
(1, 1, 1, 1, 1, '0001', '3', '3000', '3000', '1'),
(2, 2, 2, 2, 2, '0002', '2', '1000', '1000', '2'),
(3, 3, 3, 3, 3, '0003', '1', '1000', '1000', '3'),
(4, 4, 4, 4, 4, '0004', '5', '1000', '5000', '4'),
(5, 5, 5, 5, 5, '0005', '3', '1000', '3000', '5');

select*from sipariş;

INSERT INTO `üyeler` (`üyeid`,  `adı`, `soyadı`, `tckimlik`, `adres`, `telefon`,  `mailadresi`, `üyeliktürü`) VALUES
(1, 'barış', 'kandemir', '54247655547', 'ankara', '05436454345', 'barismedya.06@gmail.com', 'üye'),
(2, 'mehmet', 'kara', '44247652547', 'ankara', '05536454345', 'mehmet@gmail.com', 'Satıcı'),
(3, 'oguzhan', 'kara', '64247655547', 'istanbul', '05336454345', 'oguzhan@gmail.com', 'Satıcı'),
(4, 'dilra', 'eyıpoglu', '74247655547', 'kastamonu', '05636454345', 'dilara@gmail.com', 'üye');

INSERT INTO `kargo` (`kargoid`,  `siparişid`, `kargofirması`, `kargoücreti`, `kargoteslimsüresi`) VALUES
(1, '1', 'mng', '5', '5'),
(2, '2', 'ptt', '7', '4'),
(3, '3', 'aras', '6', '4'),
(4, '4', 'mng', '4', '3');

select*from kargo;

INSERT INTO `fatura` (`faturaid`, `üyeid`, `ürünid`, `ürünkategoriid`, `kargoid`, `siparişid`, `satıcıid`,  `faturatarihi`) VALUES
(1, '1', '1', '1', '1', '1', '2', '25/04/2021'),
(2, '1', '2', '2', '2', '2', '3', '17/04/2021'),
(3, '1', '3', '3', '2', '3', '3', '16/04/2021'),
(4, '1', '2', '3', '3', '4', '3', '14/04/2021'),
(5, '1', '1', '4', '1', '5', '2', '13/04/2021');

select*from fatura;

select ürünkategori.ürünkategoriid, ürünler.ürünadı, ürünkategori.ürüntürü, ürünkategori.kategoriadı, satıcı.Firmaadı, üyeler.adı, üyeler.soyadı,
üyeler.adres, üyeler.tckimlik, üyeler.mailadresi, üyeler.üyeliktürü, sipariş.siparişkodu, sipariş.tutar, 
kargo.kargofirması, kargo.kargoücreti, kargo.kargoteslimsüresi, fatura.faturatarihi 
from ürünkategori
left join ürünler on ürünkategori.ürünkategoriid = ürünler.ürünkategoriid
left join satıcı on satıcı.ürünid = ürünler.ürünid
left join sipariş on sipariş.satıcıid = satıcı.satıcıid
left join üyeler on üyeler.üyeid = sipariş.üyeid
left join kargo on kargo.siparişid = sipariş.siparişid
left join fatura on fatura.kargoid = kargo.kargoid;