-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 14. říj 2025, 21:49
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `bouldering`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `boulder`
--

CREATE TABLE `boulder` (
  `id` int(11) NOT NULL,
  `oznaceni` text NOT NULL,
  `pocet_kroku` int(11) NOT NULL,
  `obtiznost_V` int(11) NOT NULL,
  `zavod_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `lezecky`
--

CREATE TABLE `lezecky` (
  `id` int(11) NOT NULL,
  `znacka` text NOT NULL,
  `nazev` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `uspesnost`
--

CREATE TABLE `uspesnost` (
  `id` int(11) NOT NULL,
  `uspesnost` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `zavod`
--

CREATE TABLE `zavod` (
  `id` int(11) NOT NULL,
  `telocvicna_nazev` text NOT NULL,
  `mesto` text NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `zavodnik`
--

CREATE TABLE `zavodnik` (
  `id` int(11) NOT NULL,
  `jmeno` text NOT NULL,
  `prijmeni` text NOT NULL,
  `datum_narozeni` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `zavodnik_boulder_uspesnost_lezecky`
--

CREATE TABLE `zavodnik_boulder_uspesnost_lezecky` (
  `zavodnik_id` int(11) NOT NULL,
  `boulder_id` int(11) NOT NULL,
  `uspesnost_id` int(11) NOT NULL,
  `lezecky_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `boulder`
--
ALTER TABLE `boulder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oznaceni` (`oznaceni`,`zavod_id`) USING HASH,
  ADD KEY `zavod_id` (`zavod_id`);

--
-- Indexy pro tabulku `lezecky`
--
ALTER TABLE `lezecky`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `uspesnost`
--
ALTER TABLE `uspesnost`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `zavod`
--
ALTER TABLE `zavod`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `zavodnik`
--
ALTER TABLE `zavodnik`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `zavodnik_boulder_uspesnost_lezecky`
--
ALTER TABLE `zavodnik_boulder_uspesnost_lezecky`
  ADD PRIMARY KEY (`zavodnik_id`,`boulder_id`),
  ADD KEY `boulder_id` (`boulder_id`),
  ADD KEY `uspesnost_id` (`uspesnost_id`),
  ADD KEY `lezecky_id` (`lezecky_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `boulder`
--
ALTER TABLE `boulder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `lezecky`
--
ALTER TABLE `lezecky`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `uspesnost`
--
ALTER TABLE `uspesnost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `zavod`
--
ALTER TABLE `zavod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `zavodnik`
--
ALTER TABLE `zavodnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `boulder`
--
ALTER TABLE `boulder`
  ADD CONSTRAINT `boulder_ibfk_1` FOREIGN KEY (`zavod_id`) REFERENCES `zavod` (`id`);

--
-- Omezení pro tabulku `zavodnik_boulder_uspesnost_lezecky`
--
ALTER TABLE `zavodnik_boulder_uspesnost_lezecky`
  ADD CONSTRAINT `zavodnik_boulder_uspesnost_lezecky_ibfk_1` FOREIGN KEY (`zavodnik_id`) REFERENCES `zavodnik` (`id`),
  ADD CONSTRAINT `zavodnik_boulder_uspesnost_lezecky_ibfk_2` FOREIGN KEY (`boulder_id`) REFERENCES `boulder` (`id`),
  ADD CONSTRAINT `zavodnik_boulder_uspesnost_lezecky_ibfk_3` FOREIGN KEY (`uspesnost_id`) REFERENCES `uspesnost` (`id`),
  ADD CONSTRAINT `zavodnik_boulder_uspesnost_lezecky_ibfk_4` FOREIGN KEY (`lezecky_id`) REFERENCES `lezecky` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
