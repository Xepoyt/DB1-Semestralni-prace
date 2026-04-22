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
ORDER BY zavod.datum DESC, zavod.mesto, zavod.telocvicna_nazev, body DESC, zavodnik.prijmeni, zavodnik.jmeno
;