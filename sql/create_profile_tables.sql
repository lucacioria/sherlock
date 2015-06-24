DROP TABLE IF EXISTS profile_kinds;
CREATE TABLE `profile_kinds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS profiles;
CREATE TABLE `profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `profile_kind_id` int(11) DEFAULT NULL,
  `user_id` varchar(45) NOT NULL,
  `month` char(7) NOT NULL,
  `histogram` text NOT NULL,
  `average_histogram` text DEFAULT NULL,
  `n_transfers` int(11) DEFAULT NULL,
  `average_n_transfers` int(11) DEFAULT NULL,
  `normalized_distance` float DEFAULT NULL,
  `normalized_average` float DEFAULT NULL,
  `normalized_standard_deviation` float DEFAULT NULL,
  `normalized_anomaly` float DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `average` float DEFAULT NULL,
  `standard_deviation` float DEFAULT NULL,
  `anomaly` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `profile_kind_id` (`profile_kind_id`)
);
