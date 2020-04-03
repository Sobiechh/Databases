use swiat;

show tables;

create table test(
     wiek int not null,
     CONSTRAINT zabezpieczenie -- zabezpieczenie to nazwa warunku
     CHECK(wiek > 0))
     engine=innodb;

#cannot insert <0 values
insert test values (34), (9), (2), (4);

select * from test;

drop table test;

# 3 null here
select name, gnpold from country
where name like "P%";

#wont work
select name, gnpold from country
    where name like "P%"
    and
    (gnpold = null -- no
    or
    gnpold = "null" -- nope
    or
    gnpold = "" -- nope
    or
    gnpold = 0); -- nope

#we just use IS NULL
select name, gnpold from country
    where name like "P%"
    and GNPOld IS NULL;

#is not null
select name, gnpold from country
    where name like "P%"
    and gnpold is not null;

#same
select name, gnpold from country
    where name like "P%"
    and gnpold like "%";

#null is not smthng
select name, gnpold from country
     where name like "P%"
     and gnpold not like "%";
#nothing printed

#null operations
select null+3, 4-null, null*pi(), 3/NULL, sqrt(null), 3/0, sqrt(-2), log(-1);

#ifnull
 select name, gnp, ifnull(gnpold,"there was null") "ifnull working",
    gnp*gnpold from country
    where name like"P%";

# ----------------- ex-s with ifnull ---------------------

#change null to 0
 select name, gnp, ifnull(gnpold,0) "gnpold",
ifnull(gnp*gnpold,0) "gnp*gnpold" from country
where name like "P%";

#same ex
#change * to +
select name, gnp, ifnull(gnpold,0) "gnpold",
 ifnull(gnp+gnpold,gnp) "gnp+gnpold" from country
 where name like "P%";

#-------DATA TIME--------------

#test table
create table test
(
imie varchar(12) not null,
kiedy date, #date column
zamawia datetime, #datetime column
czas time, #time column
zwrot timestamp #can be autofilled
);

desc test;

 insert test values
("Jan","1975:07:23","2007.05.30 21-12-56","12:43:55","1999:04:20 11-12-13");

select * from test;

select CURRENT_DATE() "1", CURRENT_TIME() "2", #basic
DATE_FORMAT(current_date(), "%w<-->%M~~-~~%Y..:.:.:..%d") "3", #imagination
TIME_FORMAT(current_time(), "%H |_| %i \\?/ %s <---> %p") "4";

#https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html

#gettin time
 select year(now()), month(now()), day(now()), hour(now()), second(now());

#some data
insert test (imie, kiedy, zamawia, czas) value
 ("Ewa","1975-07-23","2007.05.30 21-12-56","12:43:55"),
 ("Ola",now(),now(),now()),
 ("Iza","2012-12.12","2000,12-12 12-1:2","0:3:07");

select * from test;

select imie, year(now()) - year(kiedy) wiek
 from test;

select imie, year(now()) - year(kiedy) wiek
     from test
     where year(kiedy) > 0
     order by czas desc;

#show country and headofstate and average life expectancy

select CONCAT(name, headofstate) 'kraj-glowa', lifeexpectancy zycie
    from country
    where
    name like "p%"
    order by 2 desc;

select CONCAT(name, " --> ",headofstate) "kraj-glowa", lifeexpectancy zycie
from country
where
name like "p%"
order by headofstate;

select concat("W kraju ",name," panuje ",headofstate,".") "kraj-glowa"
 from country
 where
 name like "p%"
 order by headofstate;

#string opers

select LEFT("Ala ma kota.",5);

select RIGHT("Ala ma kota.",3);

select lower("abC DefG HiJkLm O");

select length("Ala ma kota.");

insert test (imie, kiedy, zamawia, czas) value(" alA", now(), now(), now()),("eWa ", now(), now(), now()),(" leNa ", now(), now(), now());

select imie from test;

#firs letter to upper
select concat(upper(left(imie,1)),lower(right(imie,length(imie)-1))) imie from test;

#trim
select ltrim("  Ala   ma  kota.   ") napis;

select concat(upper(left(ltrim(imie),1)),lower(right(imie,length(ltrim(imie))-1)))
imie from test;

#if
select if(2+4=6,"g00d","wrong");

#woman  / man
select imie, if(right(trim(imie),1)="a","kobieta","facet") sex from test;

