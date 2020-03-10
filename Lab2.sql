show databases;
use znajomi;
select *
from osoby;

create table t
(
    i char(9),
    w int
);

insert into t
select imie, miasto
from osoby;

select *
from t;

drop table osoby; # nie mozna dropowac bo jest w relacji z kluczem
drop table t; # to juz dziala

insert into telefony
    (numer, typ, operator)
values (null, 'komorkowy', null);

select *
from telefony;


alter table osoby
    add nk int default 8; #dodawanie kolumny dodatkowej, ale jest na końcu dodana

desc osoby;

alter table osoby
    add nk2 char(5) not null first; #dodawanie kolumny jako pierwszą
desc osoby;

alter table osoby
    add nk3 char(5) after imie; #kolumna ma być po kolumnie imie
desc osoby;
select *
from osoby;

alter table osoby
    drop nk3; #wywalamy kolumne przez drop
desc osoby;

#alter table osoby drop id_o # nie mozna bo spojnosc sie zwali bo to klucz dla innej tabeli;
desc k;

alter table k
    drop primary key; #system wie co jest kluczem primary, ale jest autoincrement ktory moze istniec tylko do klucza glownego

alter table k
    modify
        id_k tinyint unsigned not null; #usuwamy autoincrement

alter table k
    drop primary key; #teraz dziala

desc k;

# zad domowe - jak usunac klucz obcy zeby ten mul usunal


alter table k
    add primary key (id_k);
desc k; #znowu dodajemy

alter table k
    change id_k idy tinyint unsigned not null auto_increment; #dodajemy autoincrement

desc k;

alter table k drop foreign key k_ibfk_1; # nw

desc k;

alter table osoby alter nk drop default;
desc osoby;
alter table osoby alter nk set default 11;

alter table k rename kabel; #zmiana nazwy
desc kabel;ą
show tables;

select * from osoby;

delete from osoby where id_o= 1; # mozemy tez dac where naziwsko=cos tam zeby wszystkie nazwiska wyjebac

update osoby set wiek=369 where id_o=3; #mozemy updatowac dane

drop database znajomi; #usuwamy znajomi
create database znajomi;


