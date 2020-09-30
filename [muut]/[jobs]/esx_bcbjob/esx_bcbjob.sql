INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_bcb', 'BCB', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_bcb', 'BCB', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('bcb', 'BCB')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('bcb',0,'recrue','Harjottelija',12,'{}','{}'),
	('bcb',1,'novice','Aloittelija',24,'{}','{}'),
	('bcb',2,'experimente','Kokenut',36,'{}','{}'),
	('bcb',3,'chief','Johtaja',48,'{}','{}'),
	('bcb',4,'boss','Pomo',0,'{}','{}')
;