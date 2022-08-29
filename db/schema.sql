
CREATE DATABASE IF NOT EXISTS `sistema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistema`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_permission`
--

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
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(25, 'pbkdf2_sha256$390000$bRCJssOjGOGyBGfBnXLFxI$WE2uArwXZ3HnXE52TuAmu5nW9r6MSMsWibHOyNXyPbE=', '2022-08-25 07:35:00.438186', 0, 'Getúlio ', 'Getúlio ', '', 'getulioduno17@gmail.com', 0, 1, '2022-08-25 07:21:20.328402');

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-08-21 08:05:11.179163'),
(2, 'auth', '0001_initial', '2022-08-21 08:05:17.669154'),
(3, 'admin', '0001_initial', '2022-08-21 08:05:19.021195'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-08-21 08:05:19.066755'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-21 08:05:19.106641'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-08-21 08:05:19.996163'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-08-21 08:05:20.520254'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-08-21 08:05:20.747496'),
(9, 'auth', '0004_alter_user_username_opts', '2022-08-21 08:05:20.809945'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-08-21 08:05:21.489640'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-08-21 08:05:21.514277'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-08-21 08:05:21.561761'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-08-21 08:05:22.256764'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-08-21 08:05:22.706197'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-08-21 08:05:22.870109'),
(16, 'auth', '0011_update_proxy_permissions', '2022-08-21 08:05:22.927109'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-08-21 08:05:23.568609'),
(18, 'sessions', '0001_initial', '2022-08-21 08:05:24.098200');

-- --------------------------------------------------------

--
-- Estrutura da tabela `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('029j7dcoaj5aqeymwcne98q9xym50rbh', '.eJxVjE0OgjAYBe_StWkopbV16d4zNN-voAYSCivj3YWEhW7fzLy3KbAufVmrzGVgczEumdPviEBPGXfCDxjvk6VpXOYB7a7Yg1Z7m1he18P9O-ih9lut2mEQ52JsW3QZqTuHII2ARs9eQSSwxpwZPXHaoG8oMWXi0ChgMp8vKEg5NQ:1oR466:FoDWtIldWjf_8h-R1OcB-9iidrrFz4-viN0A8Xe673Y', '2022-09-08 04:04:02.021403'),
('0sevjjdx4mjs780kjiy6ytrxwegxusys', '.eJxVjE0OgjAYBe_StWkopbV16d4zNN-voAYSCivj3YWEhW7fzLy3KbAufVmrzGVgczEumdPviEBPGXfCDxjvk6VpXOYB7a7Yg1Z7m1he18P9O-ih9lut2mEQ52JsW3QZqTuHII2ARs9eQSSwxpwZPXHaoG8oMWXi0ChgMp8vKEg5NQ:1oR5Xf:gj21Ekd9wZpqhLgp8jrsqi056NFOCwcNzyN4dG0c76U', '2022-09-08 05:36:35.808142'),
('469guzp11u0zwe4wq0qr0yd4hxmauqje', '.eJxVjE0OgjAYBe_StWkopbV16d4zNN-voAYSCivj3YWEhW7fzLy3KbAufVmrzGVgczEumdPviEBPGXfCDxjvk6VpXOYB7a7Yg1Z7m1he18P9O-ih9lut2mEQ52JsW3QZqTuHII2ARs9eQSSwxpwZPXHaoG8oMWXi0ChgMp8vKEg5NQ:1oR5gH:FvZeBTlaa5gM5SfSifG2cb_lpCeL8KP7VCGXhgtBsow', '2022-09-08 05:45:29.842101'),
('5w3ep580wgp9u7putvr34sdjcramycc7', '.eJxVjE0OgjAYBe_StWkopbV16d4zNN-voAYSCivj3YWEhW7fzLy3KbAufVmrzGVgczEumdPviEBPGXfCDxjvk6VpXOYB7a7Yg1Z7m1he18P9O-ih9lut2mEQ52JsW3QZqTuHII2ARs9eQSSwxpwZPXHaoG8oMWXi0ChgMp8vKEg5NQ:1oR5nf:AHENkpUigpdkuQNqo4KeUq8fwLJ9STXZhJxMjIIXve0', '2022-09-08 05:53:07.115266'),
('7bud9ki418jxjsd9pczk652clo8z6o3d', '.eJxVjM0OwiAQhN-FsyFAcdl69O4zkF1-pGogKe3J-O62SQ-azGm-b-YtPK1L8WtPs5-iuAgN4vRbMoVnqjuJD6r3JkOryzyx3BV50C5vLabX9XD_Dgr1sq0RwBGyY6fVoBIFpMg4qAxGIY_jORtmG2JGvcUmDFYBJee0AcisxOcLCCY4DQ:1oQNSv:s6sio6QHuwqPBY9FDHDaome2qOe8jcbglJpzPx8SHkY', '2022-09-06 06:32:45.469854'),
('7ehqfoarszniaimrvdpxdcqw8bvthk58', '.eJxVjE0OgjAYBe_StWkopbV16d4zNN-voAYSCivj3YWEhW7fzLy3KbAufVmrzGVgczEumdPviEBPGXfCDxjvk6VpXOYB7a7Yg1Z7m1he18P9O-ih9lut2mEQ52JsW3QZqTuHII2ARs9eQSSwxpwZPXHaoG8oMWXi0ChgMp8vKEg5NQ:1oR3x5:cu-EA-3KdwH4y1tE_bT13Y56_t18CNYquknA1VoVxKU', '2022-09-08 03:54:43.321091'),
('dnqqnzndm8jynctgwl4wg5h95qh6boy1', '.eJxVjM0OwiAQhN-FsyFAcdl69O4zkF1-pGogKe3J-O62SQ-azGm-b-YtPK1L8WtPs5-iuAgN4vRbMoVnqjuJD6r3JkOryzyx3BV50C5vLabX9XD_Dgr1sq0RwBGyY6fVoBIFpMg4qAxGIY_jORtmG2JGvcUmDFYBJee0AcisxOcLCCY4DQ:1oQOtl:W4x_AZzsHdnPy04yPhmffVwaGBGadvNeapjvQZQwhwI', '2022-09-06 08:04:33.729409'),
('e9nv0u8o2gfilicj6pt8zodx7ld7b1tu', '.eJxVjE0OgjAYBe_StWkopbV16d4zNN-voAYSCivj3YWEhW7fzLy3KbAufVmrzGVgczEumdPviEBPGXfCDxjvk6VpXOYB7a7Yg1Z7m1he18P9O-ih9lut2mEQ52JsW3QZqTuHII2ARs9eQSSwxpwZPXHaoG8oMWXi0ChgMp8vKEg5NQ:1oQkSl:G-409DhAb_BiX7fXybM09oCvnMlqLWEDXzAAvZzb26o', '2022-09-07 07:06:07.150465'),
('ex8jbzps83qlv90y0zlfh69rnpmzqtcd', '.eJxVjM0OwiAQhN-FsyFAcdl69O4zkF1-pGogKe3J-O62SQ-azGm-b-YtPK1L8WtPs5-iuAgN4vRbMoVnqjuJD6r3JkOryzyx3BV50C5vLabX9XD_Dgr1sq0RwBGyY6fVoBIFpMg4qAxGIY_jORtmG2JGvcUmDFYBJee0AcisxOcLCCY4DQ:1oQN6e:h3_MGZIXijCcfj8frPMgCJhl87oGW8OrIhXbaqAcxm8', '2022-09-06 06:09:44.398291'),
('m6f8ovmi2eg5xjabb0mr7cv9jm38arr2', '.eJxVjM0OwiAQhN-FsyFAcdl69O4zkF1-pGogKe3J-O62SQ-azGm-b-YtPK1L8WtPs5-iuAgN4vRbMoVnqjuJD6r3JkOryzyx3BV50C5vLabX9XD_Dgr1sq0RwBGyY6fVoBIFpMg4qAxGIY_jORtmG2JGvcUmDFYBJee0AcisxOcLCCY4DQ:1oQNZJ:RVyexb6dg2YiZvfMZ6-Gr6G3FCNNvR1WZYKMvUTXXFo', '2022-09-06 06:39:21.886886'),
('pc625gyk7wrov4qs00s3mrpw1vbpktln', '.eJxVjM0OwiAQhN-FsyFAcdl69O4zkF1-pGogKe3J-O62SQ-azGm-b-YtPK1L8WtPs5-iuAgN4vRbMoVnqjuJD6r3JkOryzyx3BV50C5vLabX9XD_Dgr1sq0RwBGyY6fVoBIFpMg4qAxGIY_jORtmG2JGvcUmDFYBJee0AcisxOcLCCY4DQ:1oQjjp:Uty1G-BI_KXbxwQch3IUtRVOb7ddMTuCW3y5MtYhinw', '2022-09-07 06:19:41.872525'),
('q04fk35jc6btb8jgoml4y8nmov2voynx', '.eJxVjE0OgjAYBe_StWkopbV16d4zNN-voAYSCivj3YWEhW7fzLy3KbAufVmrzGVgczEumdPviEBPGXfCDxjvk6VpXOYB7a7Yg1Z7m1he18P9O-ih9lut2mEQ52JsW3QZqTuHII2ARs9eQSSwxpwZPXHaoG8oMWXi0ChgMp8vKEg5NQ:1oQkQv:v40Oyj8kyjs1tLFwfQDoVn1td6L4N3RNcsVAijFRfbE', '2022-09-07 07:04:13.918458'),
('qsgwclk5a0ch6vrw7dr7ip0v95a82nw7', '.eJxVjE0OgjAYBe_StWkopbV16d4zNN-voAYSCivj3YWEhW7fzLy3KbAufVmrzGVgczEumdPviEBPGXfCDxjvk6VpXOYB7a7Yg1Z7m1he18P9O-ih9lut2mEQ52JsW3QZqTuHII2ARs9eQSSwxpwZPXHaoG8oMWXi0ChgMp8vKEg5NQ:1oR5dA:8YpbJRGs6bp4gqT3ZEb8in1mACKss9u_WBOBD5IohhI', '2022-09-08 05:42:16.531886'),
('vjr1fkxnjn2z2o5t1ts91eav2okjq1dy', '.eJxVjE0OgjAYBe_StWkopbV16d4zNN-voAYSCivj3YWEhW7fzLy3KbAufVmrzGVgczEumdPviEBPGXfCDxjvk6VpXOYB7a7Yg1Z7m1he18P9O-ih9lut2mEQ52JsW3QZqTuHII2ARs9eQSSwxpwZPXHaoG8oMWXi0ChgMp8vKEg5NQ:1oQkWG:9Oif65V7hC7Rci6ZXpkcnuBU3Vsu2RHBnTxNw92Mr0M', '2022-09-07 07:09:44.397440');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Limitadores para a tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Limitadores para a tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Limitadores para a tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
