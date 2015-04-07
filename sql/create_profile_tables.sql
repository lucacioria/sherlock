DROP TABLE IF EXISTS profile_kinds;
CREATE TABLE `profile_kinds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS profiles;
CREATE TABLE `profiles` (
  `profile_kind_id` int(11) DEFAULT NULL,
  `user_id` varchar(45) NOT NULL,
  `month` char(7) NOT NULL,
  `histogram` text NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `profile_kind_id` (`profile_kind_id`)
);
