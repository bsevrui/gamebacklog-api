-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 03, 2025 at 09:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamebacklog`
--

-- --------------------------------------------------------

--
-- Table structure for table `gamegenres`
--

CREATE TABLE `gamegenres` (
  `genre` int(11) NOT NULL,
  `game` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gamegenres`
--

INSERT INTO `gamegenres` (`genre`, `game`) VALUES
(1, 21),
(1, 22),
(1, 68),
(1, 69),
(1, 72),
(1, 73),
(1, 78),
(1, 158),
(1, 288),
(2, 23),
(2, 133),
(3, 329),
(3, 372),
(4, 91),
(4, 372),
(5, 57),
(5, 66),
(5, 247),
(5, 249),
(5, 284),
(5, 341),
(5, 398),
(5, 399),
(6, 75),
(6, 227),
(6, 228),
(8, 55),
(8, 57),
(8, 227),
(8, 228),
(8, 244),
(8, 247),
(8, 249),
(8, 262),
(8, 284),
(8, 288),
(8, 398),
(8, 399),
(10, 57),
(10, 227),
(10, 228),
(10, 240),
(10, 247),
(10, 249),
(10, 284),
(10, 341),
(10, 398),
(10, 399),
(11, 278),
(11, 317),
(13, 84),
(14, 113),
(16, 335),
(19, 11),
(20, 4),
(20, 57),
(20, 221),
(20, 247),
(20, 249),
(20, 398),
(20, 399),
(21, 90),
(21, 242),
(21, 244),
(21, 390),
(23, 341),
(24, 174),
(25, 393),
(26, 302),
(27, 394),
(28, 68),
(29, 371),
(30, 396),
(31, 395),
(32, 25),
(33, 240),
(34, 123),
(35, 341),
(36, 393),
(37, 367),
(38, 350),
(39, 353),
(40, 268),
(41, 397),
(42, 284),
(42, 398),
(42, 399);

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('Game','DLC/Expansion') NOT NULL DEFAULT 'Game',
  `cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `title`, `type`, `cover`) VALUES
(1, 'Monster Hunter: World Iceborne', 'DLC/Expansion', NULL),
(2, 'NieR: Automata', 'Game', NULL),
(3, 'Assassin\'s Creed III', 'Game', NULL),
(4, 'Assassin\'s Creed: Odyssey', 'Game', NULL),
(5, 'Assassin\'s Creed: Origins', 'Game', NULL),
(6, 'Assassin\'s Creed: Origins - The Curse of the Pharaos', 'DLC/Expansion', NULL),
(7, 'Assassin\'s Creed: Origins - The Hidden Ones', 'DLC/Expansion', NULL),
(8, 'Bayonetta', 'Game', NULL),
(9, 'Carpe Diem', 'Game', NULL),
(11, 'Dark Souls', 'Game', NULL),
(12, 'Dark Souls: Artorias of the Abyss', 'DLC/Expansion', NULL),
(13, 'Dark Souls II', 'Game', NULL),
(14, 'Dark Souls II: Crown of the Ivory King', 'DLC/Expansion', NULL),
(15, 'Dark Souls II: Crown of the Old King', 'DLC/Expansion', NULL),
(16, 'Dark Souls II: Crown of the Sunken King', 'DLC/Expansion', NULL),
(17, 'Dark Souls III', 'Game', NULL),
(18, 'Dark Souls III: Ashes of Ariandel', 'DLC/Expansion', NULL),
(19, 'Dark Souls III: The Ringed City', 'DLC/Expansion', NULL),
(20, 'Doki Doki Literature Clube', 'Game', NULL),
(21, 'FarCry 3', 'Game', NULL),
(22, 'Grand Theft Auto V [Campaign]', 'Game', NULL),
(23, 'Grand Theft Auto: Liberty City Stories', 'Game', NULL),
(24, 'Hunie Pop', 'Game', NULL),
(25, 'Katawa Shoujo', 'Game', NULL),
(26, 'Minecraft: Java Edition', 'Game', NULL),
(27, 'Monster Hunter: World', 'Game', NULL),
(28, 'Naruto Shippuden: Ultimate Ninja Storm 3 Full Burst', 'Game', NULL),
(29, 'Naruto Shippuden: Ultimate Ninja Storm 4', 'Game', NULL),
(30, 'Naruto Shippuden: Ultimate Ninja Storm Revolution', 'Game', NULL),
(31, 'Nioh', 'Game', NULL),
(32, 'Plants VS Zombies', 'Game', NULL),
(33, 'Pokémon Black Version & White Version', 'Game', NULL),
(34, 'Pokémon Black Version 2 & White Version 2', 'Game', NULL),
(35, 'Pokémon Emerald Version', 'Game', NULL),
(36, 'Half-Life: Blue Shift', 'DLC/Expansion', NULL),
(37, 'Pokémon Fire Red Version & Leaf Green Version', 'Game', NULL),
(38, 'Pokémon Heart Gold Version & Soul Silver', 'Game', NULL),
(39, 'Pokémon Mystery Dungeon: Red Rescue Team', 'Game', NULL),
(40, 'Pokémon Omega Ruby & Alpha Sapphire', 'Game', NULL),
(41, 'Pokémon Platinum Version', 'Game', NULL),
(42, 'Pokémon Ranger: Guardian Signs', 'Game', NULL),
(43, 'Pokémon Ranger: Shadows of Almia', 'Game', NULL),
(45, 'Pokémon Ruby Version & Sapphire Version', 'Game', NULL),
(46, 'Pokémon Sun & Moon', 'Game', NULL),
(47, 'Resident Evil 4 (Biohazard 4)', 'Game', NULL),
(48, 'Pokémon X & Y', 'Game', NULL),
(49, 'PokéPark Wii: Pikachu\'s Adventure', 'Game', NULL),
(50, 'PokéPark 2: Wonders Beyond', 'Game', NULL),
(51, 'Polarity', 'Game', NULL),
(52, 'Portal', 'Game', NULL),
(53, 'Rachet & Clank: Size Matters', 'Game', NULL),
(54, 'Saints Row IV', 'Game', NULL),
(55, 'Sekiro: Shadows Die Twice', 'Game', NULL),
(56, 'Stars Wars Jedi Fallen Order', 'Game', NULL),
(57, 'The Elder Scrolls V: Skyrim', 'Game', NULL),
(58, 'The Legend of Zelda: Breath of the Wild', 'Game', NULL),
(59, 'The Legend of Zelda: Breath of the Wild - The Champions Ballad', 'DLC/Expansion', NULL),
(60, 'The Legend of Zelda: Breath of the Wild - The Master Trials', 'DLC/Expansion', NULL),
(61, 'The Legend of Zelda: Skyward Sword', 'Game', NULL),
(62, 'The Legend of Zelda: Twilight Princess', 'Game', NULL),
(63, 'The Witcher 2: Assassins of Kings', 'Game', NULL),
(64, 'The Witcher III: Blood and Wine', 'DLC/Expansion', NULL),
(65, 'The Witcher III: Hearts of Stone', 'DLC/Expansion', NULL),
(66, 'The Witcher III: Wild Hunt', 'Game', NULL),
(67, 'Tomb Raider (2013)', 'Game', NULL),
(68, 'Call of Duty: Warzone (2020)', 'Game', NULL),
(69, 'Call of Duty Mobile', 'Game', NULL),
(72, 'Battlefield 1 [Campaign]', 'Game', NULL),
(73, 'Battlefield V [Multiplayer]', 'Game', NULL),
(75, 'Black Desert', 'Game', NULL),
(76, 'Black Desert Mobile', 'Game', NULL),
(77, 'Clicker Heroes', 'Game', NULL),
(78, 'Counter-Strike 1.6', 'Game', NULL),
(79, 'Counter-Strike: Global Offensive', 'Game', NULL),
(80, 'Counter-Strike: Zero Condition', 'Game', NULL),
(81, 'Dead or Alive 5 [Multiplayer]', 'Game', NULL),
(82, 'Destiny 2', 'Game', NULL),
(83, 'Dirty Bomb', 'Game', NULL),
(84, 'FIFA 08', 'Game', NULL),
(85, 'FIFA 11', 'Game', NULL),
(86, 'For Honor', 'Game', NULL),
(87, 'Guild Wars 2', 'Game', NULL),
(88, 'Heroes of the Storm', 'Game', NULL),
(89, 'Injustice: God Among Us [Multiplayer]', 'Game', NULL),
(90, 'Injustice 2 [Multiplayer]', 'Game', NULL),
(91, 'League of Legends', 'Game', NULL),
(92, 'Mario Portal', 'Game', NULL),
(93, 'Overwatch', 'Game', NULL),
(94, 'Payday 2', 'Game', NULL),
(95, 'Playerunknown\'s Battlegrounds', 'Game', NULL),
(96, 'Pokémon Battle Revolution', 'Game', NULL),
(97, 'Pokémon GO', 'Game', NULL),
(98, 'Pokémon: Magikarp Jump', 'Game', NULL),
(99, 'Pokémon Pinball: Ruby & Sapphire', 'Game', NULL),
(100, 'Pokémon Stadium', 'Game', NULL),
(101, 'Pokémon Stadium 2', 'Game', NULL),
(102, 'PUBG Mobile', 'Game', NULL),
(103, 'Quake III', 'Game', NULL),
(104, 'Super Smash Bros.', 'Game', NULL),
(105, 'Super Smash Bros. for WiiU', 'Game', NULL),
(106, 'Super Smash Bros. for Nintendo 3DS', 'Game', NULL),
(107, 'Super Smash Bros. Brawl', 'Game', NULL),
(108, 'Super Smash Bros. Melee', 'Game', NULL),
(109, 'Super Smash Bros. Ultimate', 'Game', NULL),
(110, 'Team Fortress Classic', 'Game', NULL),
(111, 'Team Fortress 2', 'Game', NULL),
(112, 'The King of Fighter XIII', 'Game', NULL),
(113, 'Time Clickers', 'Game', NULL),
(114, 'Tom Clancy\'s Rainbow Six Siege', 'Game', NULL),
(115, 'Trove', 'Game', NULL),
(116, 'Warframe', 'Game', NULL),
(117, 'Assassin\'s Creed: Odyssey - Legacy of The First Blade', 'DLC/Expansion', NULL),
(118, 'Assassin\'s Creed: Odyssey - The Fate of Atlantis', 'DLC/Expansion', NULL),
(119, 'Batman: Arkham Asylum', 'Game', NULL),
(120, 'Batman: Arkham City', 'Game', NULL),
(121, 'Castle Crashers', 'Game', NULL),
(122, 'Control', 'Game', NULL),
(123, 'Deponia', 'Game', NULL),
(124, 'FarCry 3: Blood Dragon', 'Game', NULL),
(125, 'FarCry 5', 'Game', NULL),
(126, 'Final Fantasy XV', 'Game', NULL),
(127, 'Final Fantasy VII', 'Game', NULL),
(128, 'Final Fantasy VII Remake', 'Game', NULL),
(129, 'Fire Emblem: Awakening', 'Game', NULL),
(130, 'Fire Emblem Fates: Birthright', 'Game', NULL),
(131, 'Fire Emblem Fates: Conquest', 'Game', NULL),
(132, 'Fire Emblem Fates: Revelations', 'Game', NULL),
(133, 'Gears 5', 'Game', NULL),
(134, 'Halo Reach', 'Game', NULL),
(135, 'Hell Yeah!', 'Game', NULL),
(136, 'Hitman', 'Game', NULL),
(137, 'Hollow Knight', 'Game', NULL),
(138, 'Honkai Impact 3rd', 'Game', NULL),
(139, 'Hotline Miami', 'Game', NULL),
(140, 'Mogeko Castle', 'Game', NULL),
(141, 'Monument Valley', 'Game', NULL),
(142, 'One Piece: Pirate Warriors 3', 'Game', NULL),
(143, 'Rise of the Tomb Raider', 'Game', NULL),
(144, 'Shadow of the Tomb Raider', 'Game', NULL),
(145, 'Super Hot', 'Game', NULL),
(146, 'Tales of Zestiria', 'Game', NULL),
(147, 'The Outer World', 'Game', NULL),
(148, '8BitBoy', 'Game', NULL),
(149, 'Archeblade', 'Game', NULL),
(150, 'Assassin\'s Creed IV: Black Flag', 'Game', NULL),
(151, 'Blasphemus', 'Game', NULL),
(152, 'Diablo III', 'Game', NULL),
(153, 'Dragon\'s Crown', 'Game', NULL),
(154, 'Dust An Elysian Tail', 'Game', NULL),
(155, 'Enclave', 'Game', NULL),
(156, 'Enter the Gungeon', 'Game', NULL),
(157, 'Evolve: Stage 2', 'Game', NULL),
(158, 'FarCry 4', 'Game', NULL),
(159, 'Fortnite', 'Game', NULL),
(160, 'Garry\'s Mod', 'Game', NULL),
(161, 'Gotham City Impostors: Free To Play', 'Game', NULL),
(162, 'Grand Theft Auto IV', 'Game', NULL),
(163, 'Grand Theft Auto: San Andreas', 'Game', NULL),
(164, 'Grand Theft Auto: Vice City', 'Game', NULL),
(165, 'Hyper Light Drifter', 'Game', NULL),
(166, 'Half-Life [Campaign]', 'Game', NULL),
(167, 'Black Mesa', 'Game', NULL),
(168, 'Left 4 Dead 2', 'Game', NULL),
(169, 'Lifes is Strange', 'Game', NULL),
(170, 'Limbo', 'Game', NULL),
(171, 'Medievil', 'Game', NULL),
(172, 'Metro 2033', 'Game', NULL),
(173, 'Metroid: Zero Mission', 'Game', NULL),
(174, 'New Super Mario Bros.', 'Game', NULL),
(175, 'Pillars of Eternity', 'Game', NULL),
(176, 'Pokémon Conquest', 'Game', NULL),
(177, 'Pokémon Crystal Version', 'Game', NULL),
(179, 'Pokémon Mystery Dungeon: Explorers of Sky', 'Game', NULL),
(180, 'Pokémon Mystery Dungeon: Gates to Infinity', 'Game', NULL),
(181, 'Pokémon Diamond Version & Pearl Version', 'Game', NULL),
(182, 'Pokémon Ranger', 'Game', NULL),
(183, 'Pokémon Red Version, Blue Version & Green Version', 'Game', NULL),
(185, 'Pokémon Trading Card Game', 'Game', NULL),
(186, 'Pokémon Ultra Sun & Ultra Moon', 'Game', NULL),
(187, 'Pokémon Uranium', 'Game', NULL),
(188, 'Pokémon Yellow', 'Game', NULL),
(189, 'Shadow Warrior', 'Game', NULL),
(190, 'Smite', 'Game', NULL),
(191, 'Spec Ops: The Line', 'Game', NULL),
(192, 'Stardew Valley', 'Game', NULL),
(193, 'Subnautica', 'Game', NULL),
(194, 'Super Distro', 'Game', NULL),
(195, 'Super Mario Galaxy', 'Game', NULL),
(196, 'Super Mario Galaxy 2', 'Game', NULL),
(197, 'The Legend of Zelda: Majora\'s Mask', 'Game', NULL),
(198, 'The Legend of Zelda: Ocarina of Time', 'Game', NULL),
(199, 'The Legend of Zelda: Phantom Hourglass', 'Game', NULL),
(200, 'The Legend of Zelda: Spirit Tracks', 'Game', NULL),
(201, 'The Simpsons: The Game', 'Game', NULL),
(202, 'The Witcher', 'Game', NULL),
(203, 'Two Worlds II', 'Game', NULL),
(204, 'Unturned', 'Game', NULL),
(205, 'Vertical Drop Heroes HD', 'Game', NULL),
(206, 'Wolfestein: Youngblood', 'Game', NULL),
(207, 'World of Warcraft', 'Game', NULL),
(208, 'Assassin\'s Creed II', 'Game', NULL),
(209, 'Assassin\'s Creed: Revelations', 'Game', NULL),
(210, 'Assassin\'s Creed: Syndicate', 'Game', NULL),
(211, 'Assassin\'s Creed: Unity', 'Game', NULL),
(212, 'Batman: Arkham Origins', 'Game', NULL),
(213, 'Bayonetta 2', 'Game', NULL),
(214, 'Bayonetta 3', 'Game', NULL),
(215, 'Bloodborne', 'Game', NULL),
(216, 'Brütal Legend', 'Game', NULL),
(218, 'Catherine (Catherine Classic)', 'Game', NULL),
(219, 'Catherine Full Body', 'Game', NULL),
(220, 'Chaos on Deponia', 'Game', NULL),
(221, 'Cyberpunk 2077', 'Game', NULL),
(222, 'Darksiders', 'Game', NULL),
(223, 'Darksiders II', 'Game', NULL),
(224, 'Darksiders III', 'Game', NULL),
(225, 'Demon\'s Souls', 'Game', NULL),
(226, 'Deponia Doomsday', 'Game', NULL),
(227, 'Diablo Inmortal', 'Game', NULL),
(228, 'Diablo IV', 'Game', NULL),
(229, 'Doom (2016)', 'Game', NULL),
(230, 'Fire Emblem: Three Houses', 'Game', NULL),
(231, 'God of War (2018)', 'Game', NULL),
(232, 'Goodbye Deponia', 'Game', NULL),
(233, 'Nioh 2', 'Game', NULL),
(234, 'Persona 5', 'Game', NULL),
(235, 'Red Dead Redemption', 'Game', NULL),
(236, 'Red Dead Redemption 2', 'Game', NULL),
(237, 'Shadow of the Colossus', 'Game', NULL),
(238, 'Super Mario Odyssey', 'Game', NULL),
(239, 'Super Meat Boy', 'Game', NULL),
(240, 'Until Dawn', 'Game', NULL),
(241, 'Resident Evil 2 Remake (Biohazard 2 Remake)', 'Game', NULL),
(242, 'Mortal Kombat X', 'Game', NULL),
(243, 'God Of War: Chains of Olympus', 'Game', NULL),
(244, 'Mortal Kombat 11', 'Game', NULL),
(245, 'Wii Sports Resort', 'Game', NULL),
(246, 'Half-Life: Opposing Force', 'DLC/Expansion', NULL),
(247, 'The Elder Scrolls V: Skyrim - Dawnguard', 'DLC/Expansion', NULL),
(248, 'Hearthstone', 'Game', NULL),
(249, 'The Elder Scrolls V: Skyrim - Dragonborn', 'DLC/Expansion', NULL),
(250, 'The Elder Scrolls V: Skyrim - Hearthfire', 'DLC/Expansion', NULL),
(251, 'Counter-Strike: Source', 'Game', NULL),
(252, 'Bakugan Battle Brawler: Defenders of the Core', 'Game', NULL),
(253, 'Monster Hunter: Freedom Unite', 'Game', NULL),
(254, 'Monster Hunter 4 Ultimate', 'Game', NULL),
(256, 'Jump Force', 'Game', NULL),
(257, 'Dragon Ball Z: Tenkaichi Tag Team', 'Game', NULL),
(258, 'Dragon Ball Xenoverse', 'Game', NULL),
(259, 'Dragon Ball Xenoverse 2', 'Game', NULL),
(260, 'Mirror\'s Edge', 'Game', NULL),
(261, 'Rabbids: Go Home', 'Game', NULL),
(262, 'Spider-Man: Web of Shadows', 'Game', NULL),
(263, 'Call of Juarez', 'Game', NULL),
(264, 'Sonic and the Black Knight', 'Game', NULL),
(265, 'Sonic Unleashed', 'Game', NULL),
(266, 'Crash of the Titans', 'Game', NULL),
(267, 'Crash Bandicoot N. Sane Trilogy', 'Game', NULL),
(268, 'Mario Party DS', 'Game', NULL),
(269, 'Super Mario Party', 'Game', NULL),
(270, 'Mario Tennis Aces', 'Game', NULL),
(271, 'Mario Power Tennis', 'Game', NULL),
(272, 'New Super Mario Bros. U', 'Game', NULL),
(273, 'Super Mario 3D Land', 'Game', NULL),
(274, 'Mario Kart 8', 'Game', NULL),
(275, 'Mario Kart 7', 'Game', NULL),
(276, 'Mario Kart DS', 'Game', NULL),
(277, 'Mario Kart Wii', 'Game', NULL),
(278, 'Animal Crossing: Wild World', 'Game', NULL),
(279, 'Animal Crossing: Let\'s Go to the City (Animal Crossing: City Folk)', 'Game', NULL),
(280, 'Animal Crossing: New Leaf', 'Game', NULL),
(281, 'Animal Crossing: New Horizons', 'Game', NULL),
(282, 'Pokémon Sword & Shield', 'Game', NULL),
(283, 'Resident Evil 5 (Biohazard 5)', 'Game', NULL),
(284, 'Dark Souls: Remastered', 'Game', NULL),
(285, 'Nioh: Dragon of the North', 'DLC/Expansion', NULL),
(286, 'Nioh: Defiant Honor', 'DLC/Expansion', NULL),
(287, 'Nioh: Bloodshed\'s End', 'DLC/Expansion', NULL),
(288, 'DOOM: Eternal', 'Game', NULL),
(291, 'Devil May Cry 5', 'Game', NULL),
(292, 'BioShock', 'Game', NULL),
(293, 'BioShock 2', 'Game', NULL),
(294, 'BioShock Remastered', 'Game', NULL),
(295, 'BioShock 2 Remastered', 'Game', NULL),
(296, 'BioShock Infinite', 'Game', NULL),
(297, 'GOD EATER 3', 'Game', NULL),
(298, 'GOD EATER 2: Rage Burst', 'Game', NULL),
(299, 'Dragon Ball FighterZ [Campaign]', 'Game', NULL),
(300, 'The Legend of Zelda: The Wind Waker', 'Game', NULL),
(301, 'The Legend of Zelda: The Wind Waker HD', 'Game', NULL),
(302, 'The Forest', 'Game', NULL),
(303, 'Kingdom Hearts 358/2 Days', 'Game', NULL),
(304, 'Wii Sports', 'Game', NULL),
(305, 'Resident Evil 3: Nemesis (Biohazard 3: Last Escape)', 'Game', NULL),
(306, 'Resident Evil 3 Remake (Biohazard RE: 3)', 'Game', NULL),
(307, 'Resident Evil 2 (Biohazard 2)', 'Game', NULL),
(309, 'Overwatch 2', 'Game', NULL),
(310, 'Resident Evil (Biohazard)', 'Game', NULL),
(311, 'Elder Ring', 'Game', NULL),
(312, 'Call of Duty: Modern Warfare (2019) [Multiplayer]', 'Game', NULL),
(313, 'Resident Evil Zero (Biohazard Ø)', 'Game', NULL),
(314, 'Resident Evil Code: Veronica (Biohazard Code: Veronica)', 'Game', NULL),
(315, 'Resident Evil: Revelations', 'Game', NULL),
(316, 'Resident Evil: Revelations 2', 'Game', NULL),
(317, 'Tabletop Simulator', 'Game', NULL),
(318, 'Minecraft: Bedrock Edition', 'Game', NULL),
(319, 'Cuphead', 'Game', NULL),
(320, 'Crysis', 'Game', NULL),
(321, 'Crysis Warhead', 'Game', NULL),
(322, 'Metal Gear Rising', 'Game', NULL),
(323, 'Crysis 2', 'Game', NULL),
(324, 'Crysis 3', 'Game', NULL),
(325, 'Crysis 3 -  The Lost Island', 'DLC/Expansion', NULL),
(326, 'Borderlands 2', 'Game', NULL),
(327, 'Borderlands: The Pre-Sequel!', 'Game', NULL),
(328, 'A Way Out', 'Game', NULL),
(329, 'Starcraft', 'Game', NULL),
(330, 'Sid Meier\'s Civilization VI', 'Game', NULL),
(332, 'Valorant', 'Game', NULL),
(333, 'Demon\'s Souls Remake', 'Game', NULL),
(334, 'Horizon Zero Dawn', 'Game', NULL),
(335, 'Forza Horizon 4', 'Game', NULL),
(336, 'Horizon Zero Dawn: The Frozen Wilds', 'DLC/Expansion', NULL),
(337, 'Horizon Forbidden West', 'Game', NULL),
(340, 'Assassin\'s Creed: Valhalla', 'Game', NULL),
(341, 'Baldur\'s Gate III', 'Game', NULL),
(342, 'Call of Duty: Black Ops Cold War [Multiplayer]', 'Game', NULL),
(343, 'Among Us', 'Game', NULL),
(344, 'Fall Guys', 'Game', NULL),
(345, 'Monster Hunter Generations (Monster Hunter X)', 'Game', NULL),
(346, 'Monster Hunter Generations Ultimate (Monster Hunter XX)', 'Game', NULL),
(347, 'Monster Hunter Rise', 'Game', NULL),
(348, 'Resident Evil Village', 'Game', NULL),
(349, 'Persona 5 Royal', 'Game', NULL),
(350, 'Ghost of Tsushima', 'Game', NULL),
(351, 'Resident Evil 6 (Biohazard 6)', 'Game', NULL),
(352, 'Resident Evil 7: Biohazard (Biohazard 7: Resident Evil)', 'Game', NULL),
(353, 'Resident Evil HD Remaster', 'Game', NULL),
(354, 'Resident Evil Zero HD Remaster', 'Game', NULL),
(355, 'Resident Evil 4: Ultimate HD Edition', 'Game', NULL),
(357, 'Assassin\'s Creed: Brotherhood', 'Game', NULL),
(358, 'Marvel\'s Spiderman', 'Game', NULL),
(359, 'Metroid Prime', 'Game', NULL),
(360, 'Hyrule Warriors', 'Game', NULL),
(361, 'Hyrule Warriors Definitive Edition', 'Game', NULL),
(362, 'Super Mario 64', 'Game', NULL),
(363, 'Stars War Battlefront II', 'Game', NULL),
(364, 'Super Mario 3D World', 'Game', NULL),
(365, 'Hellblade: Senua\'s Sacrifice', 'Game', NULL),
(366, 'Bloodstained: Ritual of the Night', 'Game', NULL),
(367, 'Genshin Impact', 'Game', NULL),
(368, 'Watch Dogs', 'Game', NULL),
(369, 'Watch Dogs 2', 'Game', NULL),
(370, 'Watch Dogs: Legion', 'Game', NULL),
(371, 'Castlevania: Symphony of the Night', 'Game', NULL),
(372, 'League of Legends: Wild Rift', 'Game', NULL),
(373, 'Legends of Runeterra', 'Game', NULL),
(374, 'The Elder Scrolls III: Morrowind', 'Game', NULL),
(375, 'The Elder Scrolls IV: Oblivion', 'Game', NULL),
(376, 'The Medium', 'Game', NULL),
(378, 'Battlefield 1 [Multiplayer]', 'Game', NULL),
(379, 'Battlefield V [Campaign]', 'Game', NULL),
(380, 'Call of Duty: Black Ops Cold War [Campaign]', 'Game', NULL),
(381, 'Call of Duty: Black Ops Cold War [Zombies]', 'Game', NULL),
(382, 'Call of Duty: Modern Warfare (2019) [Campaign]', 'Game', NULL),
(383, 'Battlefield 3 [Campaign]', 'Game', NULL),
(384, 'Battlefield 3 [Multiplayer]', 'Game', NULL),
(385, 'Battlefield 4 [Campaign]', 'Game', NULL),
(386, 'Battlefield 4 [Multiplayer]', 'Game', NULL),
(387, 'Dragon Ball FigtherZ [Multiplayer]', 'Game', NULL),
(388, 'Half-Life [Multiplayer]', 'Game', NULL),
(389, 'Grand Theft Auto V [Multiplayer]', 'Game', NULL),
(390, 'Injustice 2 [Campaign]', 'Game', NULL),
(391, 'Injustice: God Among Us [Campaign]', 'Game', NULL),
(392, 'Dead or Alive 5 [Campaign]', 'Game', NULL),
(393, 'Sifu', 'Game', NULL),
(394, 'osu!', 'Game', NULL),
(395, 'Monkey Island', 'Game', NULL),
(396, 'Fahrenheit 451', 'Game', NULL),
(397, 'Preguntados', 'Game', NULL),
(398, 'Elden Ring', 'Game', NULL),
(399, 'Elden Ring - Shadow of the Erdtree', 'DLC/Expansion', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `description`) VALUES
(1, 'FPS', 'First Person Shooter'),
(2, 'TPS', 'Third Person Shooter'),
(3, 'RTS', 'Real Time Strategy'),
(4, 'MOBA', 'Multiplayer Online Battle Arena'),
(5, 'RPG', 'Role-playing Game'),
(6, 'MMO', 'Massively Multiplayer Online'),
(8, 'Action', NULL),
(10, 'Adventure', NULL),
(11, 'Simulation', NULL),
(13, 'Sports', NULL),
(14, 'Idle', NULL),
(16, 'Racing', NULL),
(19, 'JRPG', 'Japanese Role-playing Game'),
(20, 'Open World', NULL),
(21, 'Fighter', 'Includes 2D & 3D fighting games'),
(23, 'TBS', 'Turn-Based Strategy'),
(24, 'Platforms', NULL),
(25, 'Beat\'em ups', NULL),
(26, 'Survival', NULL),
(27, 'Rhythm', NULL),
(28, 'Battle Royale', NULL),
(29, 'Metroidvania', NULL),
(30, 'Text Adventure', NULL),
(31, 'Graphic Adventure', NULL),
(32, 'Visual Novel', NULL),
(33, 'Interactive Movie', NULL),
(34, 'Puzzle', NULL),
(35, 'CRPG', 'Computer Role-playing Game'),
(36, 'Roguelike', NULL),
(37, 'Gacha', NULL),
(38, 'Stealth', NULL),
(39, 'Horror', NULL),
(40, 'Party', NULL),
(41, 'Trivia', NULL),
(42, 'Souls', 'Also includes Soulslike');

-- --------------------------------------------------------

--
-- Table structure for table `platforms`
--

CREATE TABLE `platforms` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `releaseDate` date NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `platforms`
--

INSERT INTO `platforms` (`id`, `name`, `releaseDate`, `detail`, `picture`) VALUES
(1, 'Sony\'s PlayStation 4 Family', '2014-02-22', 'Includes: PlayStation 4, PlayStation 4 Slim & PlayStation 4 Pro', NULL),
(2, 'Microsoft\'s Windows', '1985-11-20', 'Includes all versions of Microsoft\'s Windows', NULL),
(3, 'Microsoft\'s Xbox One Family', '2013-11-22', 'Includes: Xbox One, Xbox One S & Xbox One X', NULL),
(4, 'Nintendo\'s 3DS Family', '2011-02-26', 'Includes: 3DS, 3DS XL, 2DS, New 3DS, New 3DS XL & New 2DS', NULL),
(5, 'Nintendo\'s Switch Family', '2017-03-03', 'Includes: Switch, Switch OLED & Switch Lite', NULL),
(6, 'Nintendo\'s DS Family', '2004-12-02', 'Includes: DS, DS Lite, DSi & DSi XL', NULL),
(7, 'Apple\'s MacOS', '1984-01-24', 'Includes all version of MacOS', NULL),
(8, 'Sony\'s PlayStation Portable Family', '2004-12-12', 'Includes: PSP, PSP Slime & Lite, PSP 3000, PSP Go & PSP E1000', NULL),
(9, 'Nintendo\'s Wii Family', '2006-12-02', 'Includes: Wii, Wii Family & Wii Mini', NULL),
(10, 'Nintendo\'s WiiU', '2012-12-08', NULL, NULL),
(11, 'Nintendo\'s GameCube', '2001-09-14', 'Includes Panasonic Q (also known as GameQ)', NULL),
(12, 'Google\'s Android', '2008-09-23', 'Includes all versions of Android', NULL),
(13, 'Apple\'s iOS/iPadOS', '2007-06-29', 'Includes all versions of iOS & iPadOS', NULL),
(14, 'Sony\'s PlayStation 3 Family', '2006-11-11', 'Includes: PS3, PS3 Slim & PS3 Super Slim', NULL),
(15, 'Sony\'s PlayStation Vita Family', '2011-12-17', 'Includes: PS Vita, PS Vita Slim & PS Vita TV', NULL),
(16, 'Microsoft\'s Xbox 360 Family', '2005-11-22', 'Includes: Xbox 360 Standar, Pro, Core, Arcade, Premium, Elite, S & E', NULL),
(17, 'Sony\'s PlayStation 5 Family', '2020-11-12', 'Includes: PlayStation 5 & PlayStation 5 Digital Edition', NULL),
(18, 'Microsoft\'s Xbox Series Family', '2020-11-11', 'Includes: Xbox Series X & Xbox Series S', NULL),
(20, 'Linux', '1991-01-01', 'Includes all Linux distros/versions (SteamOS, Pop! OS, Ubuntu, Archlinux, Manjaro, Debian, ...)', NULL),
(21, 'SEGA\'s Sega Saturn', '1994-11-21', NULL, NULL),
(22, 'Sony\'s PlayStation', '1994-11-03', NULL, NULL),
(23, 'Nintendo\'s Nintendo 64', '1996-06-23', NULL, NULL),
(24, 'Nintendo\'s Gameboy Color', '1998-10-22', NULL, NULL),
(25, 'Nintendo\'s Gameboy', '1989-03-21', NULL, NULL),
(26, 'SEGA\'s Dreamcast', '1998-11-27', NULL, NULL),
(27, 'Sony\'s PlayStation 2 Family', '2000-03-04', 'Includes: PS2 Fat & PS2 Slim', NULL),
(28, 'Microsoft\'s Xbox', '2001-11-15', NULL, NULL),
(29, 'Nintendo\'s Gameboy Advance Family', '2001-03-21', 'Includes: Gameboy Advance & Gameboy Advance SP', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `platformsgames`
--

CREATE TABLE `platformsgames` (
  `platformId` int(11) NOT NULL,
  `gameId` int(11) NOT NULL,
  `releaseDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `platformsgames`
--

INSERT INTO `platformsgames` (`platformId`, `gameId`, `releaseDate`) VALUES
(1, 1, '2019-09-06'),
(1, 2, '2017-02-23'),
(1, 8, '2020-02-18'),
(1, 17, '2016-03-24'),
(1, 19, '2017-03-28'),
(1, 57, '2016-10-28'),
(1, 66, '2015-05-19'),
(1, 228, '2023-06-05'),
(1, 244, '2019-04-23'),
(1, 247, '2016-10-28'),
(1, 249, '2016-10-28'),
(1, 284, '2018-05-24'),
(1, 288, '2020-03-20'),
(1, 312, '2019-10-25'),
(1, 328, '2018-03-23'),
(1, 330, '2019-11-22'),
(1, 398, '2022-02-25'),
(1, 399, '2024-06-20'),
(2, 1, '2020-01-09'),
(2, 2, '2017-03-17'),
(2, 3, '2012-11-20'),
(2, 8, '2017-04-11'),
(2, 17, '2016-03-24'),
(2, 19, '2017-03-27'),
(2, 57, '2011-11-11'),
(2, 66, '2015-05-19'),
(2, 227, '2022-06-02'),
(2, 228, '2023-06-05'),
(2, 244, '2019-04-23'),
(2, 247, '2012-08-02'),
(2, 249, '2013-02-05'),
(2, 284, '2018-05-24'),
(2, 288, '2020-03-20'),
(2, 312, '2019-10-25'),
(2, 326, '2012-09-17'),
(2, 328, '2018-03-23'),
(2, 329, '1998-03-31'),
(2, 330, '2016-10-20'),
(2, 332, '2020-06-02'),
(2, 341, '2023-08-03'),
(2, 398, '2022-02-25'),
(2, 399, '2024-06-20'),
(3, 1, '2019-09-06'),
(3, 2, '2018-06-26'),
(3, 8, '2020-02-18'),
(3, 17, '2016-03-24'),
(3, 19, '2017-03-28'),
(3, 57, '2016-10-28'),
(3, 66, '2015-05-19'),
(3, 228, '2023-06-05'),
(3, 244, '2019-04-23'),
(3, 247, '2016-10-28'),
(3, 249, '2016-10-28'),
(3, 284, '2018-05-24'),
(3, 288, '2020-03-20'),
(3, 312, '2019-10-25'),
(3, 326, '2015-03-24'),
(3, 328, '2018-03-23'),
(3, 330, '2019-11-22'),
(3, 398, '2022-02-25'),
(3, 399, '2024-06-20'),
(4, 48, '2013-10-12'),
(4, 278, '2005-11-23'),
(5, 8, '2018-02-16'),
(5, 57, '2017-11-17'),
(5, 66, '2019-10-15'),
(5, 244, '2019-04-23'),
(5, 247, '2017-11-17'),
(5, 249, '2017-11-17'),
(5, 284, '2018-05-24'),
(5, 288, '2020-12-08'),
(5, 330, '2018-11-16'),
(6, 33, '2010-09-18'),
(6, 278, '2005-11-23'),
(7, 67, '2013-03-05'),
(7, 329, '1999-03-01'),
(7, 341, '2023-09-22'),
(8, 23, '2005-10-24'),
(9, 304, '2006-12-02'),
(10, 3, '2012-11-18'),
(10, 8, '2014-10-24'),
(10, 272, '2012-12-08'),
(11, 62, '2006-12-02'),
(12, 141, '2014-05-14'),
(12, 227, '2022-06-02'),
(12, 372, '2020-10-27'),
(13, 69, '2019-10-01'),
(13, 227, '2022-06-02'),
(13, 330, '2018-10-04'),
(13, 372, '2020-10-27'),
(14, 3, '2012-10-30'),
(14, 8, '2009-10-29'),
(14, 57, '2011-11-11'),
(14, 225, '2009-02-05'),
(14, 247, '2013-02-26'),
(14, 249, '2013-02-12'),
(14, 326, '2012-09-18'),
(15, 326, '2014-05-06'),
(16, 3, '2012-10-30'),
(16, 8, '2009-10-29'),
(16, 57, '2011-11-11'),
(16, 134, '2010-09-14'),
(16, 247, '2012-06-26'),
(16, 249, '2012-12-04'),
(16, 326, '2012-09-18'),
(17, 57, '2021-11-11'),
(17, 228, '2023-06-05'),
(17, 247, '2021-11-11'),
(17, 249, '2021-11-11'),
(17, 288, '2021-06-29'),
(17, 333, '2020-11-12'),
(17, 341, '2023-09-06'),
(17, 398, '2022-02-25'),
(17, 399, '2024-06-20'),
(18, 57, '2021-11-11'),
(18, 221, '2020-12-10'),
(18, 228, '2023-06-05'),
(18, 247, '2021-11-11'),
(18, 249, '2021-11-11'),
(18, 288, '2021-06-29'),
(18, 341, '2023-12-07'),
(18, 398, '2022-02-25'),
(18, 399, '2024-06-20'),
(20, 143, '2016-02-09'),
(21, 371, '1997-03-20'),
(22, 127, '1997-01-31'),
(23, 198, '1998-11-21'),
(24, 177, '2000-12-14'),
(25, 183, '1996-02-27'),
(26, 314, '2000-02-03'),
(27, 163, '2004-10-26'),
(28, 164, '2002-10-27'),
(29, 35, '2004-09-16'),
(29, 37, '2004-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','USER') NOT NULL DEFAULT 'USER',
  `registrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `birthdate` date NOT NULL,
  `firstName` varchar(75) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `profilePicture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `role`, `registrationDate`, `birthdate`, `firstName`, `lastName`, `profilePicture`) VALUES
(16, 'saltman@test.com', 'saltman', '$2b$10$Ge1Gd9loGgSJzzeKqRU5e.SbCn.CFc3zvdkoU..QwDsCE.5FPv8P.', 'USER', '2025-05-28 19:00:06', '1999-02-23', NULL, NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVOf-Aqlh4Szj2z4z_jTcecVgDKXdNDWefuA&s'),
(17, 'user@test.com', 'user', '$2b$10$nrmegSAAwv40VtlN9nVvS.nUTMaeoVsZDJwkT5VagIAztvbxLbPim', 'USER', '2025-05-28 19:01:09', '2025-05-28', NULL, NULL, NULL),
(18, 'prueba3@test.com', 'pruebatres', '$2b$10$KiTsDJ6osYZdyBu.lqiNnOEiO6ZPsZq6qD6pLZklfRof52lkiNNtG', 'USER', '2025-05-29 19:08:36', '2025-05-29', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usersgames`
--

CREATE TABLE `usersgames` (
  `userId` int(11) NOT NULL,
  `gameId` int(11) NOT NULL,
  `status` enum('Played','Playing','Completed','Dropped','On-Hold','Plan-To-Play') NOT NULL,
  `score` int(11) DEFAULT NULL,
  `installed` tinyint(1) NOT NULL DEFAULT 0,
  `platinum` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usersgames`
--

INSERT INTO `usersgames` (`userId`, `gameId`, `status`, `score`, `installed`, `platinum`) VALUES
(16, 57, 'Playing', NULL, 1, 0),
(16, 227, 'Dropped', NULL, 0, 0),
(16, 228, 'Plan-To-Play', NULL, 0, 0),
(16, 247, 'Completed', 8, 1, 0),
(16, 249, 'Playing', NULL, 1, 0),
(16, 284, 'Completed', 9, 0, 0),
(16, 288, 'On-Hold', NULL, 0, 0),
(16, 341, 'Completed', 10, 0, 0),
(16, 372, 'Played', 7, 0, 0),
(16, 398, 'Completed', 9, 0, 1),
(16, 399, 'Completed', 9, 0, 1),
(17, 57, 'Playing', NULL, 0, 0),
(17, 247, 'On-Hold', NULL, 0, 0),
(17, 249, 'Plan-To-Play', NULL, 0, 0),
(17, 284, 'Dropped', NULL, 0, 0),
(17, 341, 'Completed', 9, 0, 0),
(17, 372, 'Played', 6, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gamegenres`
--
ALTER TABLE `gamegenres`
  ADD PRIMARY KEY (`genre`,`game`),
  ADD KEY `IDX_a1fd1e1c180b48bc570adb51fe` (`genre`),
  ADD KEY `IDX_effb0e1bb08f2dd7cda81942a6` (`game`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `genre` (`name`);

--
-- Indexes for table `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nameplatform` (`name`);

--
-- Indexes for table `platformsgames`
--
ALTER TABLE `platformsgames`
  ADD PRIMARY KEY (`platformId`,`gameId`),
  ADD UNIQUE KEY `platformid` (`platformId`,`gameId`),
  ADD KEY `gameId` (`gameId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `usersgames`
--
ALTER TABLE `usersgames`
  ADD PRIMARY KEY (`userId`,`gameId`),
  ADD KEY `gameid` (`gameId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gamegenres`
--
ALTER TABLE `gamegenres`
  ADD CONSTRAINT `FK_a1fd1e1c180b48bc570adb51fe9` FOREIGN KEY (`genre`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_effb0e1bb08f2dd7cda81942a66` FOREIGN KEY (`game`) REFERENCES `games` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `platformsgames`
--
ALTER TABLE `platformsgames`
  ADD CONSTRAINT `platformsgames_ibfk_1` FOREIGN KEY (`platformId`) REFERENCES `platforms` (`id`),
  ADD CONSTRAINT `platformsgames_ibfk_2` FOREIGN KEY (`gameId`) REFERENCES `games` (`id`);

--
-- Constraints for table `usersgames`
--
ALTER TABLE `usersgames`
  ADD CONSTRAINT `usersgames_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `usersgames_ibfk_2` FOREIGN KEY (`gameId`) REFERENCES `games` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
