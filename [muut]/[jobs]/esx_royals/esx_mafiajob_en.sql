INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_royals','Royals',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_royals','Royals',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_royals', 'Royals', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('royals', 'Royals', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('royals', 1, 'Jasen', 'Tulokas', 350, '{}', '{}'),
('royals', 2, 'Jasen', 'Jäsen', 450, '{}', '{}'),
('royals', 3, 'vpomo', 'Vara-Pomo', 650, '{}', '{}'),
('royals', 4, 'boss', 'Pomo', 750, '{}', '{}');