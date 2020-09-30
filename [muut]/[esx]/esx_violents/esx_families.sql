INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_families','families',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_families','families',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_families', 'families', 1)
;

INSERT INTO `jobs` (`name`, `label`) VALUES
('families', 'Families');


INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('families', 0, 'recruit', 'Little Balla', 150, '{}', '{}'),
('families', 1, 'serkku', 'Young Balla', 150, '{}', '{}'),
('families', 2, 'veli', 'Balla', 150, '{}', '{}'),
('families', 3, 'boss', 'OG', 150, '{}', '{}');