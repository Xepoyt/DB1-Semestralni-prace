-- vybere vsechny zapisy z zavodnik_boulder_uspesnost_lezecky a priradni k nim sloupce ze zavislych tabulek tak, ze je tabulka snadno citelna
SELECT zavodnik.jmeno, zavodnik.prijmeni, zavodnik.datum_narozeni, boulder.oznaceni, boulder.pocet_kroku, boulder.obtiznost_V, zavod.mesto, zavod.telocvicna_nazev, zavod.datum, uspesnost.uspesnost, lezecky.znacka, lezecky.nazev
FROM zavodnik_boulder_uspesnost_lezecky 
	JOIN zavodnik 
    	ON zavodnik_boulder_uspesnost_lezecky.zavodnik_id = zavodnik.id
    JOIN boulder
    	ON zavodnik_boulder_uspesnost_lezecky.boulder_id = boulder.id
    JOIN zavod
    	ON boulder.zavod_id = zavod.id
    JOIN uspesnost
    	ON zavodnik_boulder_uspesnost_lezecky.uspesnost_id = uspesnost.id
    LEFT JOIN lezecky
    	ON zavodnik_boulder_uspesnost_lezecky.lezecky_id = lezecky.id
;


-- pridame zavodnika
INSERT INTO zavodnik (jmeno, prijmeni, datum_narozeni) VALUES
	('Adam', 'Herout', '2006-05-23') -- v aplikaci formular pro pridani zavodnika
;

-- pridame jeho lezecky
INSERT INTO lezecky (znacka, nazev) VALUES
	('La Sportiva', 'Mandala') -- v aplikaci formular pro pridani lezecek
;

-- zapiseme zavodnikovu ucast na zavode
INSERT INTO zavodnik_boulder_uspesnost_lezecky (zavodnik_id, boulder_id, uspesnost_id, lezecky_id) VALUES
	(
		(SELECT id FROM zavodnik WHERE jmeno = 'Adam' AND prijmeni = 'Herout' AND datum_narozeni = '2006-05-23'), -- v aplikaci selectbox pro vyber zavodnika
		(SELECT id FROM boulder WHERE zavod_id = (SELECT id FROM zavod WHERE mesto = 'Praha' AND telocvicna_nazev = 'Boulder Bar Praha' AND datum = '2025-04-20') AND oznaceni = 'Slab'), -- v aplikaci zavisly selectbox pro vyber boulderu (podle zavodu)
		(SELECT id FROM uspesnost WHERE uspesnost = 'Top'), -- v aplikaci selectbox pro vyber uspesnosti
		(SELECT id FROM lezecky WHERE znacka = 'La Sportiva' AND nazev = 'Mandala') -- v aplikaci selectbox pro vyber lezecek
	),
	(
		(SELECT id FROM zavodnik WHERE jmeno = 'Adam' AND prijmeni = 'Herout' AND datum_narozeni = '2006-05-23'), -- v aplikaci selectbox pro vyber zavodnika
		(SELECT id FROM boulder WHERE zavod_id = (SELECT id FROM zavod WHERE mesto = 'Praha' AND telocvicna_nazev = 'Boulder Bar Praha' AND datum = '2025-04-20') AND oznaceni = 'Převis'), -- v aplikaci zavisly selectbox pro vyber boulderu (podle zavodu)
		(SELECT id FROM uspesnost WHERE uspesnost = 'Zóna'), -- v aplikaci selectbox pro vyber uspesnosti
		NULL -- v aplikaci selectbox pro vyber lezecek
	),
	(
		(SELECT id FROM zavodnik WHERE jmeno = 'Adam' AND prijmeni = 'Herout' AND datum_narozeni = '2006-05-23'), -- v aplikaci selectbox pro vyber zavodnika
		(SELECT id FROM boulder WHERE zavod_id = (SELECT id FROM zavod WHERE mesto = 'Praha' AND telocvicna_nazev = 'Boulder Bar Praha' AND datum = '2025-04-20') AND oznaceni = 'Dyno'), -- v aplikaci zavisly selectbox pro vyber boulderu (podle zavodu)
		(SELECT id FROM uspesnost WHERE uspesnost = 'Neúspěch'), -- v aplikaci selectbox pro vyber uspesnosti
		(SELECT id FROM lezecky WHERE znacka = 'La Sportiva' AND nazev = 'Mandala') -- v aplikaci selectbox pro vyber lezecek
	)
;

-- po uprave znovu vybere vsechny zapisy z zavodnik_boulder_uspesnost_lezecky a priradni k nim sloupce ze zavislych tabulek tak, ze je tabulka snadno citelna
SELECT zavodnik.jmeno, zavodnik.prijmeni, zavodnik.datum_narozeni, boulder.oznaceni, boulder.pocet_kroku, boulder.obtiznost_V, zavod.mesto, zavod.telocvicna_nazev, zavod.datum, uspesnost.uspesnost, lezecky.znacka, lezecky.nazev
FROM zavodnik_boulder_uspesnost_lezecky 
	JOIN zavodnik 
    	ON zavodnik_boulder_uspesnost_lezecky.zavodnik_id = zavodnik.id
    JOIN boulder
    	ON zavodnik_boulder_uspesnost_lezecky.boulder_id = boulder.id
    JOIN zavod
    	ON boulder.zavod_id = zavod.id
    JOIN uspesnost
    	ON zavodnik_boulder_uspesnost_lezecky.uspesnost_id = uspesnost.id
    LEFT JOIN lezecky
    	ON zavodnik_boulder_uspesnost_lezecky.lezecky_id = lezecky.id
;
