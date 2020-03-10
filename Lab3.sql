use ziomsony;

#bawienie sie selectem
SELECT imie Imię, nazwisko Nazwisko, wiek "Ile ma lat" from osoby;

#ale trola zajebalismy, imie tak samo jak miasto lol
SELECT imie AS Imię, nazwisko, miasto Imię from osoby;

#mozna se nazwac wszystko tak samo bo to tylko nazwa
SELECT imie Nazwisko, nazwisko Nazwisko, miasto Naziwsko from osoby;

#------------SORTOWANKO----------------

#orderowanko
SELECT * from osoby ORDER BY miasto;
#w domysle jest asc

SELECT  * FROM osoby ORDER BY miasto desc; #desc malejaco

#dodalem sobie zeby bylo wiecej z jednego miasta
insert into osoby(imie, nazwisko, wiek, miasto)
values('Ala', 'Mostowiak', 40, 'Sosnowiec');

#jak posortowane po miesice, to potem po imieniu(?)
SELECT * FROM osoby ORDER BY  miasto, imie;

#po miescie rosnaco, po imieniu malejaco
SELECT imie kto, nazwisko, miasto gdzie
FROM osoby
ORDER BY gdzie, imie desc;

#zepsujmy cos
SELECT  imie kto, nazwisko, miasto kto
FROM osoby
ORDER BY kto; #kto jest ambiguous, niejednoznaczne

SELECT imie kto, nazwisko, miasto imie
FROM osoby
ORDER BY  imie; #pierwwszy jest alias

#sortowanie po numerze kolumny
#1 pierwsza kolumna
#2 druga kolumna
SELECT imie, nazwisko, miasto
FROM osoby
ORDER BY  1, 2 desc;

#to jest typu enum, dlatego wyjebalo w kolejnosci jakiej jest w enum
SELECT *
FROM telefony
ORDER BY  operator;

#--------------USUWANIE--------------

#dziady starsze od 40
SELECT * FROM osoby
WHERE
wiek>40;

#dziady miedzy 35 a 55
SELECT * FROM osoby
WHERE
wiek>35 and wiek<55;

#przyklad paru AND/OR
SELECT * FROM osoby
WHERE
wiek>35 and (wiek<55 or id_o>4);
#tutaj najpierw patrzy na osoby mniejsze od 55 lat
#albo wieksze id 4
#potem usuwa te osoby mlodsze od 35
#jakby nie bylo nawiasu to wezmie te z przedzialu 35--55 + id>4

SELECT * FROM osoby
WHERE
wiek BETWEEN  20 and 53;
#between ma nierownosc slaba, (<= / >=)

#NOT BETWEEN
SELECT * FROM osoby
WHERE
wiek NOT BETWEEN 20 and 53;

#branie mniejszych od jakiegos tam imienia co jest bez sensu
SELECT * FROM osoby
WHERE
imie <= "dgh";

#branie tylko z z konkretnego miasta
SELECT * FROM osoby
WHERE
miasto = "Las palmas";

#branie wszystkich bez jakiegos tam miasta konkretenego
SELECT * FROM osoby
WHERE
miasto != "Las palmas"; #MOZE TEZ BYC <>

SELECT * FROM osoby
WHERE
miasto NOT LIKE "Las palmas"; #ALBO NOT LIKE

#----LIKE----
#po to zeby szukac iminion zaczynajacych sie na coś lub konczących na coś itd

SELECT * FROM osoby
WHERE
imie LIKE "____"; # PODKRESLNIK '_' TO JEDEN ZNAK

INSERT INTO  osoby(imie, nazwisko, wiek, miasto)
VALUES
('Jan', 'Żółw', 45, 'Gliwice'),
('Jan', 'Zodiak', 66, 'Gliwice');

#wszyscy ktorzy w nazwisko maja jakis znak
SELECT * FROM osoby
WHERE
imie LIKE "%o%";

