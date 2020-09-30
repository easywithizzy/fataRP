USE `es_extended`;

CREATE TABLE `weashops` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`zone` varchar(255) NOT NULL,
	`item` varchar(255) NOT NULL,
	`price` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `licenses` (`type`, `label`) VALUES
	('weapon', "Permis de port d'arme")
;

INSERT INTO `weashops` (`zone`, `item`, `price`) VALUES
	('pistolShop','WEAPON_PISTOL_MK2', 45000),
	('pistolShop','WEAPON_SNSPISTOL', 25000),
	('pistolShop','WEAPON_PISTOL50', 65000),
	('pistolShop','WEAPON_VINTAGEPISTOL', 40000),
	('smgShop','WEAPON_SMG', 100000),
	('smgShop','WEAPON_MICROSMG', 85000),
	('smgShop','WEAPON_COMBATPDW', 110000),
	('arShop','WEAPON_ASSAULTRIFLE', 135000),
	('arShop','WEAPON_SPECIALCARBINE', 145000),
	('snpShop','WEAPON_MARKSMANRIFLE', 300000),
	('snpShop','WEAPON_HEAVYSNIPER', 700000),
;
