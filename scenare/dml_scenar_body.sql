-- secte zavodnikum body podle soutezi a seradi vystup podle data a mista souteze a ziskanych bodu zavodniku
SELECT zavodnik.jmeno, zavodnik.prijmeni, zavod.mesto, zavod.telocvicna_nazev, zavod.datum, 
	SUM(
        CASE
        	WHEN uspesnost.uspesnost = 'Zóna' THEN 1
        	WHEN uspesnost.uspesnost = 'Top' THEN 2
        	ELSE 0
        END
    ) AS body
FROM zavodnik_boulder_uspesnost_lezecky
	JOIN zavodnik 
    	ON zavodnik_boulder_uspesnost_lezecky.zavodnik_id = zavodnik.id
    JOIN boulder
    	ON zavodnik_boulder_uspesnost_lezecky.boulder_id = boulder.id
    JOIN zavod
    	ON boulder.zavod_id = zavod.id
    JOIN uspesnost
    	ON zavodnik_boulder_uspesnost_lezecky.uspesnost_id = uspesnost.id
GROUP BY zavodnik_boulder_uspesnost_lezecky.zavodnik_id, boulder.zavod_id
ORDER BY zavod.datum DESC, zavod.mesto, zavod.telocvicna_nazev, body DESC
;


-- pridame zavod
INSERT INTO zavod (mesto, telocvicna_nazev, datum) VALUES
    ('Plzeň', 'Lezecké centrum V16', '2025-12-05') -- v aplikaci formular pro pridani zavodu
;

-- pridame bouldery pro tento zavod
INSERT INTO boulder (zavod_id, oznaceni, pocet_kroku, obtiznost_V) VALUES -- v aplikaci formular pro pridani boulderu
    (
        (SELECT id FROM zavod WHERE mesto = 'Plzeň' AND telocvicna_nazev = 'Lezecké centrum V16' AND datum = '2025-12-05'), -- v aplikaci selectbox pro vyber zavodu
        '1',
        12,
        13
    ),
    (
        (SELECT id FROM zavod WHERE mesto = 'Plzeň' AND telocvicna_nazev = 'Lezecké centrum V16' AND datum = '2025-12-05'), -- v aplikaci selectbox pro vyber zavodu
        '2',
        15,
        14
    ),
    (
        (SELECT id FROM zavod WHERE mesto = 'Plzeň' AND telocvicna_nazev = 'Lezecké centrum V16' AND datum = '2025-12-05'), -- v aplikaci selectbox pro vyber zavodu
        '3',
        10,
        12
    )
;

-- zapiseme vysledky zavodu
INSERT INTO zavodnik_boulder_uspesnost_lezecky (zavodnik_id, boulder_id, uspesnost_id, lezecky_id) VALUES
    (
        (SELECT id FROM zavodnik WHERE jmeno = 'Adam' AND prijmeni = 'Ondra' AND datum_narozeni = '1993-02-05'), -- v aplikaci selectbox pro vyber zavodnika
        (SELECT id FROM boulder WHERE zavod_id = (SELECT id FROM zavod WHERE mesto = 'Plzeň' AND telocvicna_nazev = 'Lezecké centrum V16' AND datum = '2025-12-05') AND oznaceni = '1'), -- v aplikaci zavisly selectbox pro vyber boulderu (podle zavodu)
		(SELECT id FROM uspesnost WHERE uspesnost = 'Top'), -- v aplikaci selectbox pro vyber uspesnosti
        (SELECT id FROM lezecky WHERE znacka = 'Five Ten' AND nazev = 'Hiangle' ) -- v aplikaci selectbox pro vyber lezecek
    ),
    (
        (SELECT id FROM zavodnik WHERE jmeno = 'Adam' AND prijmeni = 'Ondra' AND datum_narozeni = '1993-02-05'), -- v aplikaci selectbox pro vyber zavodnika
        (SELECT id FROM boulder WHERE zavod_id = (SELECT id FROM zavod WHERE mesto = 'Plzeň' AND telocvicna_nazev = 'Lezecké centrum V16' AND datum = '2025-12-05') AND oznaceni = '2'), -- v aplikaci zavisly selectbox pro vyber boulderu (podle zavodu)
        (SELECT id FROM uspesnost WHERE uspesnost = 'Top'), -- v aplikaci selectbox pro vyber uspesnosti
        (SELECT id FROM lezecky WHERE znacka = 'Scarpa' AND nazev = 'Drago' ) -- v aplikaci selectbox pro vyber lezecek
    ),
    (
        (SELECT id FROM zavodnik WHERE jmeno = 'Adam' AND prijmeni = 'Ondra' AND datum_narozeni = '1993-02-05'), -- v aplikaci selectbox pro vyber zavodnika
        (SELECT id FROM boulder WHERE zavod_id = (SELECT id FROM zavod WHERE mesto = 'Plzeň' AND telocvicna_nazev = 'Lezecké centrum V16' AND datum = '2025-12-05') AND oznaceni = '3'), -- v aplikaci zavisly selectbox pro vyber boulderu (podle zavodu)
        (SELECT id FROM uspesnost WHERE uspesnost = 'Top'), -- v aplikaci selectbox pro vyber uspesnosti
        (SELECT id FROM lezecky WHERE znacka = 'Five Ten' AND nazev = 'Hiangle' ) -- v aplikaci selectbox pro vyber lezecek
    ),
    (
        (SELECT id FROM zavodnik WHERE jmeno = 'Jakub' AND prijmeni = 'Novák' AND datum_narozeni = '2001-09-10'), -- v aplikaci selectbox pro vyber zavodnika
        (SELECT id FROM boulder WHERE zavod_id = (SELECT id FROM zavod WHERE mesto = 'Plzeň' AND telocvicna_nazev = 'Lezecké centrum V16' AND datum = '2025-12-05') AND oznaceni = '1'), -- v aplikaci zavisly selectbox pro vyber boulderu (podle zavodu)
        (SELECT id FROM uspesnost WHERE uspesnost = 'Top'), -- v aplikaci selectbox pro vyber uspesnosti
        (SELECT id FROM lezecky WHERE znacka = 'La Sportiva' AND nazev = 'Katana' ) -- v aplikaci selectbox pro vyber lezecek
    ),
    (
        (SELECT id FROM zavodnik WHERE jmeno = 'Jakub' AND prijmeni = 'Novák' AND datum_narozeni = '2001-09-10'), -- v aplikaci selectbox pro vyber zavodnika
        (SELECT id FROM boulder WHERE zavod_id = (SELECT id FROM zavod WHERE mesto = 'Plzeň' AND telocvicna_nazev = 'Lezecké centrum V16' AND datum = '2025-12-05') AND oznaceni = '2'), -- v aplikaci zavisly selectbox pro vyber boulderu (podle zavodu)
        (SELECT id FROM uspesnost WHERE uspesnost = 'Zóna'), -- v aplikaci selectbox pro vyber uspesnosti
        (SELECT id FROM lezecky WHERE znacka = 'La Sportiva' AND nazev = 'Katana' ) -- v aplikaci selectbox pro vyber lezecek
    ),
    (
        (SELECT id FROM zavodnik WHERE jmeno = 'Jakub' AND prijmeni = 'Novák' AND datum_narozeni = '2001-09-10'), -- v aplikaci selectbox pro vyber zavodnika
        (SELECT id FROM boulder WHERE zavod_id = (SELECT id FROM zavod WHERE mesto = 'Plzeň' AND telocvicna_nazev = 'Lezecké centrum V16' AND datum = '2025-12-05') AND oznaceni = '3'), -- v aplikaci zavisly selectbox pro vyber boulderu (podle zavodu)
        (SELECT id FROM uspesnost WHERE uspesnost = 'Top'), -- v aplikaci selectbox pro vyber uspesnosti
        (SELECT id FROM lezecky WHERE znacka = 'La Sportiva' AND nazev = 'Katana' ) -- v aplikaci selectbox pro vyber lezecek
    )
;


-- po uprave znovu secte zavodnikum body podle soutezi a seradi vystup podle data a mista souteze a ziskanych bodu zavodniku
SELECT zavodnik.jmeno, zavodnik.prijmeni, zavod.mesto, zavod.telocvicna_nazev, zavod.datum, 
	SUM(
        CASE
        	WHEN uspesnost.uspesnost = 'Zóna' THEN 1
        	WHEN uspesnost.uspesnost = 'Top' THEN 2
        	ELSE 0
        END
    ) AS body
FROM zavodnik_boulder_uspesnost_lezecky
	JOIN zavodnik 
    	ON zavodnik_boulder_uspesnost_lezecky.zavodnik_id = zavodnik.id
    JOIN boulder
    	ON zavodnik_boulder_uspesnost_lezecky.boulder_id = boulder.id
    JOIN zavod
    	ON boulder.zavod_id = zavod.id
    JOIN uspesnost
    	ON zavodnik_boulder_uspesnost_lezecky.uspesnost_id = uspesnost.id
GROUP BY zavodnik_boulder_uspesnost_lezecky.zavodnik_id, boulder.zavod_id
ORDER BY zavod.datum DESC, zavod.mesto, zavod.telocvicna_nazev, body DESC
;