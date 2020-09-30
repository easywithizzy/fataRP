INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_crossfire','crossfire',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_crossfire','crossfire',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_crossfire', 'crossfire', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('crossfire', 'crossfire', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('crossfire', 1, 'Jasen', 'Jäsen', 300, '{}', '{}'),
('crossfire', 2, 'Kokenut', 'Kokenut', 300, '{}', '{}'),
('crossfire', 3, 'Luotettu', 'Luotettu', 300, '{}', '{}'),
('crossfire', 4, 'boss', 'Pomo', 300, '{}', '{}');