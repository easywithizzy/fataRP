INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_ub','Mafia',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_ub','Mafia',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_ub', 'Mafia', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ub', 'Mafia', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('ub', 0, 'recruit', 'Tulokas', 200, '{}', '{}'),
('ub', 1, 'officer', 'Jäsen', 300, '{}', '{}'),
('ub', 2, 'sergeant', 'Täysi jäsen', 400, '{}', '{}'),
('ub', 3, 'lieutenant', 'Vara johtaja', 500, '{}', '{}'),
('ub', 4, 'boss', 'Johtaja', 600, '{}', '{}')
 ;