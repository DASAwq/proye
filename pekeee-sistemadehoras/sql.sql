-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para zombie
CREATE DATABASE IF NOT EXISTS `zombie` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `zombie`;

-- Volcando estructura para tabla zombie.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(60) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `crafting_level` int(11) DEFAULT NULL,
  `last_property` varchar(255) DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `loaf_furniture` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `hotbar` longtext DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `pincode` int(50) DEFAULT NULL,
  `credits` int(11) NOT NULL DEFAULT 0,
  `tasks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{"fly":0.0,"drive":0.0,"run":0.0}',
  `tasks_completed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[false,false,false,false]',
  `winnings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `horas` int(11) DEFAULT 0,
  `lastconnexion` datetime DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla zombie.users: ~4 rows (aproximadamente)
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `skin`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `status`, `crafting_level`, `last_property`, `is_dead`, `loaf_furniture`, `tattoos`, `jail`, `hotbar`, `iban`, `pincode`, `credits`, `tasks`, `tasks_completed`, `winnings`, `jail_time`, `horas`, `lastconnexion`) VALUES
	('009512f2b97f9308df93f948b13d11bdf12b8976', '{"money":0,"bank":8020,"ultra_coin":0,"black_money":0}', 'admin', '[]', 'police', 1, '[]', '{"armor":0,"health":200}', '{"y":-1110.6065673828126,"z":26.4322509765625,"x":-37.16043853759765}', '{"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}],"props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"tattoos":[],"faceFeatures":{"cheeksWidth":0,"chinBoneSize":0,"eyesOpening":0,"nosePeakSize":0,"lipsThickness":0,"noseWidth":0,"chinBoneLowering":0,"neckThickness":0,"eyeBrownHigh":0,"nosePeakHigh":0,"nosePeakLowering":0,"cheeksBoneWidth":0,"noseBoneHigh":0,"chinHole":0,"jawBoneWidth":0,"cheeksBoneHigh":0,"chinBoneLenght":0,"noseBoneTwist":0,"eyeBrownForward":0,"jawBoneBackSize":0},"model":"mp_m_freemode_01","headBlend":{"shapeFirst":0,"shapeThird":0,"skinSecond":0,"skinMix":0,"skinThird":0,"shapeMix":0,"shapeSecond":0,"skinFirst":0,"thirdMix":0},"hair":{"texture":0,"highlight":0,"style":0,"color":0},"headOverlays":{"makeUp":{"opacity":0,"color":0,"style":0,"secondColor":0},"blemishes":{"opacity":0,"color":0,"style":0,"secondColor":0},"eyebrows":{"opacity":0,"color":0,"style":0,"secondColor":0},"lipstick":{"opacity":0,"color":0,"style":0,"secondColor":0},"bodyBlemishes":{"opacity":0,"color":0,"style":0,"secondColor":0},"sunDamage":{"opacity":0,"color":0,"style":0,"secondColor":0},"chestHair":{"opacity":0,"color":0,"style":0,"secondColor":0},"blush":{"opacity":0,"color":0,"style":0,"secondColor":0},"beard":{"opacity":0,"color":0,"style":0,"secondColor":0},"ageing":{"opacity":0,"color":0,"style":0,"secondColor":0},"moleAndFreckles":{"opacity":0,"color":0,"style":0,"secondColor":0},"complexion":{"opacity":0,"color":0,"style":0,"secondColor":0}},"eyeColor":0}', 'William', 'Jhonson', '04/04/2000', 'm', 185, '[]', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, '{"fly":0.126,"run":26.32099999999975,"drive":20.79599999999973}', '[false,false,false,false]', '{}', 0, 0, NULL),
	('7dee3965f5596ad261e5d02cbd1f27db0b20af6e', '{"ultra_coin":0,"money":0,"bank":30084,"black_money":0}', 'admin', '[{"count":1,"name":"WEAPON_PISTOL","metadata":{"ammo":12,"registered":"Pablo Schar","serial":"683415SKR196900","components":[],"durability":93.7000000000002},"slot":1},{"count":1,"name":"WEAPON_KNIFE","metadata":{"components":[],"durability":100},"slot":2},{"count":1,"name":"bag","slot":3},{"count":384,"name":"jewels","slot":4},{"count":25,"name":"ammo-9","slot":5},{"count":20,"name":"meat","slot":7},{"count":27,"name":"clothe","slot":8}]', 'police', 0, '[]', '{"armor":0,"health":200}', '{"x":1078.945068359375,"y":-3142.523193359375,"z":5.2857666015625}', '{"model":"mp_m_freemode_01","faceFeatures":{"chinHole":0,"jawBoneWidth":0,"neckThickness":0,"nosePeakLowering":0,"eyeBrownForward":0,"chinBoneSize":0,"eyesOpening":0,"cheeksWidth":0,"noseWidth":0,"nosePeakSize":0,"lipsThickness":0,"jawBoneBackSize":0,"chinBoneLenght":0,"noseBoneHigh":0,"nosePeakHigh":0,"chinBoneLowering":0,"eyeBrownHigh":0,"cheeksBoneWidth":0,"noseBoneTwist":0,"cheeksBoneHigh":0},"hair":{"highlight":0,"texture":0,"style":0,"color":0},"eyeColor":0,"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"tattoos":[],"headOverlays":{"blemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"lipstick":{"secondColor":0,"opacity":0,"style":0,"color":0},"eyebrows":{"secondColor":0,"opacity":0,"style":0,"color":0},"beard":{"secondColor":0,"opacity":0,"style":0,"color":0},"ageing":{"secondColor":0,"opacity":0,"style":0,"color":0},"complexion":{"secondColor":0,"opacity":0,"style":0,"color":0},"chestHair":{"secondColor":0,"opacity":0,"style":0,"color":0},"sunDamage":{"secondColor":0,"opacity":0,"style":0,"color":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"style":0,"color":0},"blush":{"secondColor":0,"opacity":0,"style":0,"color":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"makeUp":{"secondColor":0,"opacity":0,"style":0,"color":0}},"headBlend":{"skinFirst":0,"shapeMix":0,"shapeThird":0,"skinMix":0,"thirdMix":0,"shapeSecond":0,"shapeFirst":0,"skinSecond":0,"skinThird":0},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":15},{"component_id":11,"texture":0,"drawable":153},{"component_id":4,"texture":0,"drawable":73},{"component_id":6,"texture":0,"drawable":66},{"component_id":3,"texture":0,"drawable":24}]}', 'Pablo', 'Schar', '22/02/1999', 'm', 170, '[{"percent":81.07,"name":"hunger","val":810700},{"percent":85.80250000000001,"name":"thirst","val":858025}]', NULL, NULL, 0, NULL, NULL, 0, NULL, 'MA509873', NULL, 0, '{"run":1.20999999999995,"fly":0.291,"drive":1.99699999999998}', '[false,false,false,false]', '{}', 0, 0, NULL),
	('b9ff3a2728295ddcc6e611b18d327fac03300fa3', '{"bank":5008,"black_money":0,"money":0,"ultra_coin":0}', 'admin', '[]', 'unemployed', 0, '[]', '[]', '{"z":37.6373291015625,"x":-538.984619140625,"y":-214.85275268554688}', '{"faceFeatures":{"cheeksBoneHigh":0,"chinHole":0,"noseBoneTwist":0,"noseBoneHigh":0,"chinBoneSize":0,"eyesOpening":0,"neckThickness":0,"nosePeakHigh":0,"chinBoneLowering":0,"nosePeakSize":0,"cheeksBoneWidth":0,"jawBoneWidth":0,"eyeBrownForward":0,"jawBoneBackSize":0,"nosePeakLowering":0,"cheeksWidth":0,"chinBoneLenght":0,"lipsThickness":0,"noseWidth":0,"eyeBrownHigh":0},"headBlend":{"thirdMix":0,"shapeFirst":0,"skinThird":0,"shapeThird":0,"shapeSecond":0,"shapeMix":0,"skinSecond":0,"skinMix":0,"skinFirst":0},"model":"mp_f_freemode_01","hair":{"highlight":0,"style":0,"texture":0,"color":0},"eyeColor":0,"headOverlays":{"eyebrows":{"secondColor":0,"style":0,"opacity":0,"color":0},"makeUp":{"secondColor":0,"style":0,"opacity":0,"color":0},"ageing":{"secondColor":0,"style":0,"opacity":0,"color":0},"blush":{"secondColor":0,"style":0,"opacity":0,"color":0},"chestHair":{"secondColor":0,"style":0,"opacity":0,"color":0},"beard":{"secondColor":0,"style":0,"opacity":0,"color":0},"bodyBlemishes":{"secondColor":0,"style":0,"opacity":0,"color":0},"lipstick":{"secondColor":0,"style":0,"opacity":0,"color":0},"sunDamage":{"secondColor":0,"style":0,"opacity":0,"color":0},"complexion":{"secondColor":0,"style":0,"opacity":0,"color":0},"blemishes":{"secondColor":0,"style":0,"opacity":0,"color":0},"moleAndFreckles":{"secondColor":0,"style":0,"opacity":0,"color":0}},"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"tattoos":[],"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}]}', 'Santi', 'Caniggia', '30/03/2000', 'f', 200, '[{"name":"hunger","val":635100,"percent":63.51},{"name":"thirst","val":726325,"percent":72.6325}]', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, '{"fly":0.0,"drive":0.0,"run":0.0}', '[false,false,false,false]', '{}', 0, 0, NULL),
	('c9f1646c0f9293c73d5a92f8bd52411bb967593e', '{"money":0,"bank":5000,"black_money":0,"ultra_coin":0}', 'user', '[]', 'unemployed', 0, '[]', '[]', '{"x":-539.024169921875,"z":37.6373291015625,"y":-214.8000030517578}', NULL, 'Asdasdas', 'Asdasd', '09/08/1997', 'm', 180, '[{"percent":99.41,"val":994100,"name":"hunger"},{"percent":99.5575,"val":995575,"name":"thirst"}]', NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, 0, '{"fly":0.0,"drive":0.0,"run":0.0}', '[false,false,false,false]', '{}', 0, 0, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
