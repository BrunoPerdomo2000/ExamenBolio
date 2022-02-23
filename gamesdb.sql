-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.7.1-MariaDB-1:10.7.1+maria~focal - mariadb.org binary distribution
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para gamesdb
CREATE DATABASE IF NOT EXISTS `gamesdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `gamesdb`;

-- Volcando estructura para tabla gamesdb.api_desarrolladora
CREATE TABLE IF NOT EXISTS `api_desarrolladora` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.api_desarrolladora: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `api_desarrolladora` DISABLE KEYS */;
INSERT INTO `api_desarrolladora` (`id`, `name`) VALUES
	(1, 'EpicGames'),
	(2, 'Blizzard'),
	(3, 'Activition');
/*!40000 ALTER TABLE `api_desarrolladora` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.api_games
CREATE TABLE IF NOT EXISTS `api_games` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `year` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `precio` int(11) NOT NULL,
  `genero_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_games_genero_id_30e2b177_fk_api_genero_id` (`genero_id`),
  CONSTRAINT `api_games_genero_id_30e2b177_fk_api_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `api_genero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.api_games: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `api_games` DISABLE KEYS */;
INSERT INTO `api_games` (`id`, `name`, `year`, `description`, `precio`, `genero_id`) VALUES
	(1, 'Fortnite', 2017, 'una isla en la cual sobrevive el mas fuerte ', 0, 1),
	(2, 'Overwatch', 2016, 'dos equipos buscando la victoria donde solo uno ganara', 765, 2),
	(3, 'WarZone', 2020, 'zona de guerra donde todos luchan por ser el mejor', 0, 1);
/*!40000 ALTER TABLE `api_games` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.api_games_desarrolladora
CREATE TABLE IF NOT EXISTS `api_games_desarrolladora` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `games_id` bigint(20) NOT NULL,
  `desarrolladora_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_games_desarrolladora_games_id_desarrolladora__8aebee62_uniq` (`games_id`,`desarrolladora_id`),
  KEY `api_games_desarrolla_desarrolladora_id_2b92ab7c_fk_api_desar` (`desarrolladora_id`),
  CONSTRAINT `api_games_desarrolla_desarrolladora_id_2b92ab7c_fk_api_desar` FOREIGN KEY (`desarrolladora_id`) REFERENCES `api_desarrolladora` (`id`),
  CONSTRAINT `api_games_desarrolladora_games_id_e239f5e2_fk_api_games_id` FOREIGN KEY (`games_id`) REFERENCES `api_games` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.api_games_desarrolladora: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `api_games_desarrolladora` DISABLE KEYS */;
INSERT INTO `api_games_desarrolladora` (`id`, `games_id`, `desarrolladora_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3);
/*!40000 ALTER TABLE `api_games_desarrolladora` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.api_genero
CREATE TABLE IF NOT EXISTS `api_genero` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `genero` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.api_genero: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `api_genero` DISABLE KEYS */;
INSERT INTO `api_genero` (`id`, `genero`) VALUES
	(1, 'BattleRoyal'),
	(2, 'Shooter');
/*!40000 ALTER TABLE `api_genero` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.auth_permission: ~40 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add API key', 7, 'add_apikey'),
	(26, 'Can change API key', 7, 'change_apikey'),
	(27, 'Can delete API key', 7, 'delete_apikey'),
	(28, 'Can view API key', 7, 'view_apikey'),
	(29, 'Can add desarrolladora', 8, 'add_desarrolladora'),
	(30, 'Can change desarrolladora', 8, 'change_desarrolladora'),
	(31, 'Can delete desarrolladora', 8, 'delete_desarrolladora'),
	(32, 'Can view desarrolladora', 8, 'view_desarrolladora'),
	(33, 'Can add genero', 9, 'add_genero'),
	(34, 'Can change genero', 9, 'change_genero'),
	(35, 'Can delete genero', 9, 'delete_genero'),
	(36, 'Can view genero', 9, 'view_genero'),
	(37, 'Can add games', 10, 'add_games'),
	(38, 'Can change games', 10, 'change_games'),
	(39, 'Can delete games', 10, 'delete_games'),
	(40, 'Can view games', 10, 'view_games');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.auth_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$320000$YP6B0sTYgZcM8XbaQoNGjk$HrsbBlJrbM6eLl4xFQoJgO2611MO1nKQpf65a0/vC/0=', '2022-02-23 18:29:43.140875', 1, 'newuser', '', '', '', 1, 1, '2022-02-23 18:29:16.486811');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.django_admin_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2022-02-23 18:30:10.749863', 'U1GTumyC.pbkdf2_sha256$320000$hELTremkPfpK8qDaPHqUAj$Ttgmaa4jmLviPSDRIE4S0qwq/oVKdqMHpFAxwbR6viY=', 'bruno', 1, '[{"added": {}}]', 7, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.django_content_type: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(8, 'api', 'desarrolladora'),
	(10, 'api', 'games'),
	(9, 'api', 'genero'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'rest_framework_api_key', 'apikey'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.django_migrations: ~23 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-02-23 18:25:55.571026'),
	(2, 'auth', '0001_initial', '2022-02-23 18:25:56.738362'),
	(3, 'admin', '0001_initial', '2022-02-23 18:25:56.968849'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-23 18:25:56.990564'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-23 18:25:57.011556'),
	(6, 'api', '0001_initial', '2022-02-23 18:25:57.542784'),
	(7, 'contenttypes', '0002_remove_content_type_name', '2022-02-23 18:25:57.755440'),
	(8, 'auth', '0002_alter_permission_name_max_length', '2022-02-23 18:25:57.876451'),
	(9, 'auth', '0003_alter_user_email_max_length', '2022-02-23 18:25:57.955759'),
	(10, 'auth', '0004_alter_user_username_opts', '2022-02-23 18:25:57.980697'),
	(11, 'auth', '0005_alter_user_last_login_null', '2022-02-23 18:25:58.096703'),
	(12, 'auth', '0006_require_contenttypes_0002', '2022-02-23 18:25:58.117538'),
	(13, 'auth', '0007_alter_validators_add_error_messages', '2022-02-23 18:25:58.143774'),
	(14, 'auth', '0008_alter_user_username_max_length', '2022-02-23 18:25:58.220579'),
	(15, 'auth', '0009_alter_user_last_name_max_length', '2022-02-23 18:25:58.301492'),
	(16, 'auth', '0010_alter_group_name_max_length', '2022-02-23 18:25:58.372038'),
	(17, 'auth', '0011_update_proxy_permissions', '2022-02-23 18:25:58.401403'),
	(18, 'auth', '0012_alter_user_first_name_max_length', '2022-02-23 18:25:58.474331'),
	(19, 'rest_framework_api_key', '0001_initial', '2022-02-23 18:25:58.597990'),
	(20, 'rest_framework_api_key', '0002_auto_20190529_2243', '2022-02-23 18:25:58.672903'),
	(21, 'rest_framework_api_key', '0003_auto_20190623_1952', '2022-02-23 18:25:58.696036'),
	(22, 'rest_framework_api_key', '0004_prefix_hashed_key', '2022-02-23 18:25:59.056250'),
	(23, 'sessions', '0001_initial', '2022-02-23 18:25:59.179275');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.django_session: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('k5zsbvj7aphb0cqk8wgjunq6yuzxd0x2', '.eJxVjMEKwyAQRP_Fc5EY1F177L3fIKtra9qiEJNT6b8nQg4pzFzmPeYrPK1L9mtLs59YXIUSl_MWKL5T6YBfVJ5VxlqWeQqyK_KgTd4rp8_tcP8OMrXcb63SGjUgAuhkaOSEDvfGCINRgA6sDcOu2B7WjGTRRKdcGB_E4rcBoYw2lA:1nMwOV:injEnKfPCPWvUzYYk1ju9cmN_g-h5Ns2YaG1CmYl_XQ', '2022-03-09 18:29:43.147086');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla gamesdb.rest_framework_api_key_apikey
CREATE TABLE IF NOT EXISTS `rest_framework_api_key_apikey` (
  `id` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `hashed_key` varchar(100) NOT NULL,
  `prefix` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`),
  KEY `rest_framework_api_key_apikey_created_c61872d9` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla gamesdb.rest_framework_api_key_apikey: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` DISABLE KEYS */;
INSERT INTO `rest_framework_api_key_apikey` (`id`, `created`, `name`, `revoked`, `expiry_date`, `hashed_key`, `prefix`) VALUES
	('U1GTumyC.pbkdf2_sha256$320000$hELTremkPfpK8qDaPHqUAj$Ttgmaa4jmLviPSDRIE4S0qwq/oVKdqMHpFAxwbR6viY=', '2022-02-23 18:30:10.749346', 'bruno', 0, NULL, 'pbkdf2_sha256$320000$hELTremkPfpK8qDaPHqUAj$Ttgmaa4jmLviPSDRIE4S0qwq/oVKdqMHpFAxwbR6viY=', 'U1GTumyC');
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
