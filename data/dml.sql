INSERT INTO uspesnost (id, uspesnost) VALUES
(1, 'Neúspěch'),
(2, 'Zóna'),
(3, 'Top');

INSERT INTO lezecky (id, znacka, nazev) VALUES
(1, 'La Sportiva', 'Solution'),
(2, 'Scarpa', 'Drago'),
(3, 'Five Ten', 'Hiangle'),
(4, 'Tenaya', 'Mundaka'),
(5, 'Black Diamond', 'Momentum'),
(6, 'La Sportiva', 'Katana');

INSERT INTO zavod (id, telocvicna_nazev, mesto, datum) VALUES
(1, 'Hangar Brno', 'Brno', '2025-03-15'),
(2, 'Boulder Bar Praha', 'Praha', '2025-04-20');

INSERT INTO boulder (id, oznaceni, pocet_kroku, obtiznost_V, zavod_id) VALUES
(1, 'Modrá', 7, 4, 1),
(2, 'Červená', 5, 5, 1),
(3, 'Zelená', 8, 6, 1),
(4, 'Slab', 6, 7, 2),
(5, 'Převis', 9, 8, 2),
(6, 'Dyno', 4, 5, 2);

INSERT INTO zavodnik (id, jmeno, prijmeni, datum_narozeni) VALUES
(1, 'Adam', 'Ondra', '1993-02-05'),
(2, 'Janja', 'Garnbret', '1999-03-12'),
(3, 'Tomoa', 'Narasaki', '1996-06-22'),
(4, 'Shauna', 'Coxsey', '1993-01-27'),
(5, 'Jakub', 'Novák', '2001-09-10');

INSERT INTO zavodnik_boulder_uspesnost_lezecky (zavodnik_id, boulder_id, uspesnost_id, lezecky_id) VALUES
(1, 1, 3, 1),
(1, 2, 2, 3),
(1, 3, 3, 1),
(1, 4, 2, 4),
(1, 5, 3, 4),
(1, 6, 2, 6),

(2, 1, 3, 5),
(2, 2, 3, 2),
(2, 3, 3, 1),

(3, 1, 2, 3),
(3, 2, 3, 3),
(3, 3, 2, 1),

(4, 4, 2, 5),
(4, 5, 3, 2),
(4, 6, 2, 4),

(5, 4, 1, 5),
(5, 5, 2, 5),
(5, 6, 1, 5);
