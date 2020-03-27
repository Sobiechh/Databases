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

