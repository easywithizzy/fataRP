USE `essentialmode`;

CREATE TABLE `blackmarket` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`store` varchar(100) NOT NULL,
	`item` varchar(100) NOT NULL,
	`price` int(11) NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `blackmarket` (store, item, price) VALUES
	('blackmarket','suppressor',5000)
	('blackmarket','clip',10000)
	('blackmarket','bulletproof',4500)
	('blackmarket','extmag',15000)
	('blackmarket','pendrive',10000)
;