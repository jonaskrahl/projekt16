-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Okt 2016 um 12:22
-- Server-Version: 5.6.24
-- PHP-Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `sit_project`
--
CREATE DATABASE IF NOT EXISTS `sit_project` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sit_project`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beruf`
--

CREATE TABLE IF NOT EXISTS `beruf` (
  `beruf_id` int(11) NOT NULL,
  `bezeichnung` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `beruf`
--

INSERT INTO `beruf` (`beruf_id`, `bezeichnung`) VALUES
(1, 'FIAE'),
(2, 'FISI');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `class_id` int(11) NOT NULL,
  `bezeichnung` text NOT NULL,
  `stundenplan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `class`
--

INSERT INTO `class` (`class_id`, `bezeichnung`, `stundenplan_id`) VALUES
(7, 'IT4a', NULL),
(8, 'IT4b', NULL),
(9, 'IT4c', NULL),
(10, 'IT4d', NULL),
(11, 'IT4e', NULL),
(12, 'IT4f', NULL),
(13, 'IT4g', NULL),
(14, 'IT4h', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stundenplan`
--

CREATE TABLE IF NOT EXISTS `stundenplan` (
  `stundenplan_id` int(11) NOT NULL,
  `stundenplan_blob` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `termine`
--

CREATE TABLE IF NOT EXISTS `termine` (
  `termine_id` int(11) NOT NULL,
  `bezeichnung` text NOT NULL,
  `datum` datetime NOT NULL,
  `kommentar` longtext,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL,
  `first_name` text CHARACTER SET utf8 NOT NULL,
  `last_name` text CHARACTER SET utf8 NOT NULL,
  `password` varchar(128) NOT NULL,
  `beruf_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `password`, `beruf_id`, `class_id`) VALUES
(8, 'Niklas', 'Grieger', 'start123', 7, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `beruf`
--
ALTER TABLE `beruf`
  ADD PRIMARY KEY (`beruf_id`);

--
-- Indizes für die Tabelle `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`), ADD KEY `fk_stundenplan` (`stundenplan_id`);

--
-- Indizes für die Tabelle `stundenplan`
--
ALTER TABLE `stundenplan`
  ADD PRIMARY KEY (`stundenplan_id`);

--
-- Indizes für die Tabelle `termine`
--
ALTER TABLE `termine`
  ADD PRIMARY KEY (`termine_id`), ADD KEY `user_fk` (`user_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`), ADD KEY `fk_class` (`class_id`), ADD KEY `fk_beruf` (`beruf_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `beruf`
--
ALTER TABLE `beruf`
  MODIFY `beruf_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT für Tabelle `stundenplan`
--
ALTER TABLE `stundenplan`
  MODIFY `stundenplan_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `termine`
--
ALTER TABLE `termine`
  MODIFY `termine_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;