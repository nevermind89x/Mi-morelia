-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 07-05-2012 a las 13:51:29
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `adminv2n`
-- 
CREATE DATABASE `adminv2n` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `adminv2n`;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `banner`
-- 

CREATE TABLE `banner` (
  `id_banner` mediumint(8) unsigned NOT NULL auto_increment,
  `id_section` tinyint(3) unsigned NOT NULL,
  `id_zone` tinyint(2) unsigned default NULL,
  `link` varchar(60) default NULL,
  `order` tinyint(2) unsigned default '0',
  `updated_at` datetime default NULL,
  `created_at` datetime default NULL,
  `status` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id_banner`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Volcar la base de datos para la tabla `banner`
-- 

INSERT INTO `banner` VALUES (1, 1, 2, 'algo.com', 1, '2012-04-19 17:49:33', '2012-04-19 17:49:33', 1);
INSERT INTO `banner` VALUES (2, 1, 2, 'algo.com', 1, '2012-04-19 18:05:37', '2012-04-19 18:05:37', 1);
INSERT INTO `banner` VALUES (3, 1, 2, 'enlace.com', 1, '2012-04-19 18:10:58', '2012-04-19 18:10:58', 1);
INSERT INTO `banner` VALUES (4, 1, 2, 'asd', 1, '2012-04-19 18:48:18', '2012-04-19 18:48:18', 1);
INSERT INTO `banner` VALUES (5, 1, 2, 'enlacneackslandlasdccom', 1, '2012-04-19 19:14:57', '2012-04-19 19:14:57', 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `bannersection`
-- 

CREATE TABLE `bannersection` (
  `id_bannersection` int(10) unsigned NOT NULL auto_increment,
  `id_parent` int(11) NOT NULL,
  `name` varchar(155) default NULL,
  PRIMARY KEY  (`id_bannersection`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `bannersection`
-- 

INSERT INTO `bannersection` VALUES (1, 0, 'Seccion 1');
INSERT INTO `bannersection` VALUES (2, 1, 'Zona 1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `category`
-- 

CREATE TABLE `category` (
  `id_category` smallint(5) unsigned NOT NULL auto_increment,
  `id_section` tinyint(3) unsigned NOT NULL,
  `id_parent` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`id_category`,`id_section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `category`
-- 

INSERT INTO `category` VALUES (1, 2, 0, 'Categoria geolocalizacion');
INSERT INTO `category` VALUES (2, 2, 0, 'nueva cat');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `economic_unit_categories`
-- 

CREATE TABLE `economic_unit_categories` (
  `economic_unit_category_id` int(11) NOT NULL auto_increment,
  `economic_unit_category_name` varchar(500) default NULL,
  PRIMARY KEY  (`economic_unit_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `economic_unit_categories`
-- 

INSERT INTO `economic_unit_categories` VALUES (1, 'Test asd');
INSERT INTO `economic_unit_categories` VALUES (2, 'nueva cat geo');
INSERT INTO `economic_unit_categories` VALUES (3, 'nueva cat geoo');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `economic_unit_product`
-- 

CREATE TABLE `economic_unit_product` (
  `economic_unit_product_id` int(10) unsigned NOT NULL auto_increment,
  `economic_unit_id` int(10) unsigned NOT NULL,
  `name` varchar(150) default NULL,
  `price` double default NULL,
  `description` text,
  `image` varchar(255) default NULL,
  PRIMARY KEY  (`economic_unit_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- 
-- Volcar la base de datos para la tabla `economic_unit_product`
-- 

INSERT INTO `economic_unit_product` VALUES (1, 6, 'abuelos', 1200.56, 'los abuelos del pakillo', NULL);
INSERT INTO `economic_unit_product` VALUES (2, 7, 'abuelos', 1200.56, 'los abuelos del pakillo', NULL);
INSERT INTO `economic_unit_product` VALUES (3, 8, 'abuelos', 1200.56, 'los abuelos del pakillo', NULL);
INSERT INTO `economic_unit_product` VALUES (4, 9, 'abuelos2', 31200.56, 'los abuelos del pakillo2', NULL);
INSERT INTO `economic_unit_product` VALUES (5, 9, 'tarahmunara', 1123, 'tareas', NULL);
INSERT INTO `economic_unit_product` VALUES (6, 10, 'abuelos2', 31200.56, 'los abuelos del pakillo2', 'bisabuelos_jpg.jpg');
INSERT INTO `economic_unit_product` VALUES (7, 10, 'tarahmunara', 1123, 'tareas', 'tarahumaras1_jpg.jpg');
INSERT INTO `economic_unit_product` VALUES (8, 11, 'abuelos2', 31200.56, 'los abuelos del pakillo2', 'bisabuelos_jpg.jpg');
INSERT INTO `economic_unit_product` VALUES (9, 11, 'tarahmunara', 1123, 'tareas', 'tarahumaras1_jpg.jpg');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `economic_unit_service`
-- 

CREATE TABLE `economic_unit_service` (
  `economic_unit_sevice_id` int(11) unsigned NOT NULL,
  `economic_unit_id` int(11) unsigned NOT NULL,
  `description` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`economic_unit_sevice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `economic_unit_service`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `economic_units`
-- 

CREATE TABLE `economic_units` (
  `economic_unit_id` int(11) NOT NULL auto_increment,
  `economic_unit_name` varchar(500) default NULL,
  `economic_unit_street_type` varchar(50) default NULL,
  `economic_unit_latitude` varchar(100) default NULL,
  `economic_unit_longitude` varchar(100) default NULL,
  `economic_unit_description` text,
  `economic_unit_street_name` varchar(100) default NULL,
  `economic_unit_location_number` varchar(45) default NULL,
  `economic_unit_reserve` varchar(100) default NULL,
  `economic_unit_phone` varchar(45) default NULL,
  `economic_unit_cellphone` varchar(256) default NULL,
  `economic_unit_email` varchar(256) default NULL,
  `economic_unit_credit_card` varchar(256) default NULL,
  `economic_unit_facebook_page` varchar(256) default NULL,
  `economic_unit_twitter` varchar(256) default NULL,
  `economic_unit_logo` varchar(256) default NULL,
  `active` tinyint(2) unsigned NOT NULL,
  `verified` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY  (`economic_unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- Volcar la base de datos para la tabla `economic_units`
-- 

INSERT INTO `economic_units` VALUES (1, 'Geolocalizacion', 'Tipo', '19.708381003693315', '-101.21639795736957', 'descip', 'calle', '123', 'asentamiento', '123123', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (2, 'nombre', 'tipo2', '19.6941074446', '-101.194825844', 'descrip 2', 'calle 2', 'numero 2', 'asentamiento 2', 'telefono 2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (3, 'nombre', 'tipo2', '19.6941074445611', '-101.194825843925', 'descrip 2', 'calle 2', 'numero 2', 'asentamiento 2', 'telefono 2', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (4, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (5, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (6, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (7, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (8, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (9, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (10, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `economic_units` VALUES (11, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `economic_units_has_economic_unit_categories`
-- 

CREATE TABLE `economic_units_has_economic_unit_categories` (
  `economic_units_economic_unit_id` int(11) NOT NULL,
  `economic_unit_categories_economic_unit_category_id` int(11) NOT NULL,
  PRIMARY KEY  (`economic_units_economic_unit_id`,`economic_unit_categories_economic_unit_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `economic_units_has_economic_unit_categories`
-- 

INSERT INTO `economic_units_has_economic_unit_categories` VALUES (1, 1);
INSERT INTO `economic_units_has_economic_unit_categories` VALUES (1, 2);
INSERT INTO `economic_units_has_economic_unit_categories` VALUES (5, 2);
INSERT INTO `economic_units_has_economic_unit_categories` VALUES (6, 2);
INSERT INTO `economic_units_has_economic_unit_categories` VALUES (7, 2);
INSERT INTO `economic_units_has_economic_unit_categories` VALUES (8, 2);
INSERT INTO `economic_units_has_economic_unit_categories` VALUES (9, 2);
INSERT INTO `economic_units_has_economic_unit_categories` VALUES (10, 2);
INSERT INTO `economic_units_has_economic_unit_categories` VALUES (11, 2);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `log`
-- 

CREATE TABLE `log` (
  `id_log` int(10) unsigned NOT NULL auto_increment,
  `query` text NOT NULL,
  `executed_at` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `id_user` mediumint(8) unsigned NOT NULL,
  `type` varchar(30) NOT NULL,
  `tabla` varchar(50) NOT NULL,
  PRIMARY KEY  (`id_log`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

-- 
-- Volcar la base de datos para la tabla `log`
-- 

INSERT INTO `log` VALUES (1, 'id_user => 1, id_role => 1, email => juanito@hotmail.com, user => , password => 872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274, first_name => Juanito, last_name => Espinosa Alvizouri, birthday => , phone => 3158081, cellphone => 4431808182, nextel => 4433808987, fax => , address => , updated_at => 2012-01-14 11:54:42, created_at => 2011-12-27 11:00:06, ', '2012-04-17 01:04:03', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (2, 'id_user => 12, id_role => 1, email => betaboy_12@hotmail.com, user => , password => 872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274, first_name => Juana, last_name => De Arco, birthday => 1989-01-30 00:00:00, phone => 3131313, cellphone => 3131313, nextel => 3131313, fax => , address => , updated_at => 2012-02-16 18:10:26, created_at => 2012-01-04 12:53:59, ', '2012-04-17 01:04:07', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (3, 'id_user => 17, id_role => 4, email => usuario@hotmail.com, user => , password => 872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274, first_name => Alejandro, last_name => Madrigal Torres, birthday => 2012-02-15 00:00:00, phone => 3158081, cellphone => 31415679, nextel => 3141414, fax => , address => , updated_at => , created_at => 2012-02-13 13:05:19, ', '2012-04-17 01:04:12', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (4, 'id_user => 18, id_role => 2, email => admin@gmail.com, user => , password => 872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274, first_name => algo, last_name => algo, birthday => 2012-02-02 00:00:00, phone => 1231231, cellphone => 12983123, nextel => 120931238, fax => 465, address => direccion, updated_at => , created_at => 2012-02-13 13:34:56, ', '2012-04-17 01:04:13', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (5, 'id_user => 25, id_role => 2, email => ginafarfan644@gmail.com, user => matutino, password => dab02b0a77e4cfbc3ef909284aa54bd29b667d7c42894f15e271dcc9c5e658a5, first_name => Primaria Esther Tapia Morelia M., last_name => aplleidos, birthday => 2012-03-21 00:00:00, phone => 312-3031++, cellphone => , nextel => , fax => 12323, address => Corregidora N&ordm; 644 Col. Centro.Morelia,Mich., updated_at => , created_at => , ', '2012-04-17 01:04:15', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (6, 'id_user => 26, id_role => 14, email => rosysalazar@rsviajes.com, user => RS Viajes, password => 85e2f01486dd98f6dc46443a0e415189dae35e799b0f3bfafc1a5e0603c5f1e4, first_name => RS Viajes, last_name => , birthday => , phone => 314-9670+4431544105+, cellphone => , nextel => Nextel id 72*13*6516, fax => , address => Av. Ventura Puente 712 - A COL. CUAUHTEMOC\r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              , updated_at => , created_at => , ', '2012-04-17 01:04:16', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (7, 'id_user => 27, id_role => 14, email => briciadelrio@yahoo.com.mx, user => cristal, password => dab02b0a77e4cfbc3ef909284aa54bd29b667d7c42894f15e271dcc9c5e658a5, first_name => Joyeria en Cristal Morelia, last_name => , birthday => , phone => 299 18 01+4433693887+4432 02 05 68, cellphone => , nextel => , fax => , address => Calle Prisionero de San Juan de Ulúa #90 Fracc. Rinconada del Valle Morelia, Michoacan ( MEXICO )\r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n              \r\n       , updated_at => , created_at => , ', '2012-04-17 01:04:17', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (8, 'id_user => 28, id_role => 14, email => omar_avalos@hotmail.com, user => moto2, password => 08f136809b91592d7f1d7fd68caa75579ac8aa4927afd3313dfb069adff81a3e, first_name => Moto2, last_name => , birthday => , phone => (443)3400021++, cellphone => , nextel => (443) 324 0814 Nextel 52*310081*2, fax => , address => Av. Camelinas 3290-C. Col. 5 de Diciembre\r\nMorelia, Michoacán. México, updated_at => , created_at => , ', '2012-04-17 01:04:18', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (9, 'id_user => 30, id_role => 12, email => mariangela6@yahoo.com.mx, user => dysa, password => dab02b0a77e4cfbc3ef909284aa54bd29b667d7c42894f15e271dcc9c5e658a5, first_name => DYSA Inmobiliaria, last_name => , birthday => , phone => (443)3156612 CEL. 4433723095, cellphone => , nextel => , fax => , address => , updated_at => , created_at => , ', '2012-04-17 01:04:19', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (10, 'id_user => 31, id_role => 12, email => promocasa8@hotmail.com, user => promoc4s4, password => dab02b0a77e4cfbc3ef909284aa54bd29b667d7c42894f15e271dcc9c5e658a5, first_name => Promocasa8, last_name => , birthday => , phone => Ofna. 324 2568, cellphone => , nextel => , fax => , address => Av. Acueducto #1170 int. 4 Col. Chapultepec Norte, updated_at => , created_at => , ', '2012-04-17 01:04:21', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (11, 'id_user => 29, id_role => 12, email => , user => 4ltozano, password => dab02b0a77e4cfbc3ef909284aa54bd29b667d7c42894f15e271dcc9c5e658a5, first_name => Altozano, last_name => , birthday => , phone => 443 113 55 00, cellphone => , nextel => , fax => , address => Av. Montaña Monarca 2000, Altozano, Morelia Mich., updated_at => , created_at => , ', '2012-04-17 01:04:23', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (12, 'id_user => 32, id_role => 6, email => isai@hotmail.com, user => , password => 8f1f360fd0b24550417e08126a1f218f46f0c90a7185eced437f33f5ff6c6758, first_name => Isa&iacute;, last_name => Ayala C&eacute;sar, birthday => 2012-03-02 00:00:00, phone => 524431173317, cellphone => 524431173317, nextel => Tzintzuntzan #139 L&oacute;mas de Vistabella, fax => faxxxxlkdjas, address => direccion, updated_at => , created_at => , ', '2012-04-17 01:04:30', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (13, 'id_user => 33, id_role => 10, email => txane@hotmail.com, user => , password => 872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274, first_name => pakillo, last_name => asd, birthday => 2012-03-02 00:00:00, phone => 123123, cellphone => 123123, nextel => di, fax => , address => , updated_at => , created_at => , ', '2012-04-17 01:04:33', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (14, 'id_user => 34, id_role => 10, email => tasd@hotmail.com, user => , password => 943484dff5cbc38c0d032f1a24170196fbfed166a5fe4b3560e23a2ee889b17f, first_name => asdas, last_name => asda, birthday => 2012-03-07 00:00:00, phone => , cellphone => , nextel => , fax => , address => , updated_at => , created_at => , ', '2012-04-17 01:04:34', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (15, 'id_user => 35, id_role => 12, email => inmuebles@hotmail.com, user => , password => 872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274, first_name => Inmuebles morelia, last_name => d, birthday => 2012-03-07 00:00:00, phone => 3123123, cellphone => 123123, nextel => asdasd, fax => , address => , updated_at => , created_at => , ', '2012-04-17 01:04:35', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (16, 'id_user => 36, id_role => 7, email => inm@hotmail.com, user => , password => 872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274, first_name => inmobiliaria X, last_name => as, birthday => 2012-03-06 00:00:00, phone => 123, cellphone => 123, nextel => asdasd, fax => 123123, address => por ahi, updated_at => , created_at => , ', '2012-04-17 01:04:36', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (17, 'id_user => 37, id_role => 14, email => cliente@hotmail.com, user => , password => 872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274, first_name => cliente, last_name => cliente, birthday => 2012-03-10 00:00:00, phone => 123123, cellphone => 123123, nextel => direccion, fax => , address => , updated_at => , created_at => , ', '2012-04-17 01:04:36', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (18, 'id_user => 38, id_role => 6, email => test@hotmail.com, user => , password => 872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274, first_name => Usuario , last_name => Administrador, birthday => 2012-03-21 00:00:00, phone => 3123, cellphone => 123, nextel => asd, fax => , address => , updated_at => , created_at => , ', '2012-04-17 01:04:37', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (19, 'id_user => 39, id_role => 11, email => i@h.com, user => , password => 86ad3ca10cae3d67cf54d46c83f744aa9293a59129dfeb8a293b77b0d6ce39c9, first_name => sai, last_name => silver, birthday => 2012-03-01 00:00:00, phone => 897897, cellphone => 97, nextel => Pino 8, fax => , address => , updated_at => , created_at => , ', '2012-04-17 01:04:37', 'http://localhost/adminv3/user/list.php', '127.0.0.1', 13, 'DELETE', 'User');
INSERT INTO `log` VALUES (20, 'id_user => 40, id_role => 2, email => cedi.moc@gmail.com, user => , password => 29c7f472c3b157c4d990eea9f6f32a503a220f8f7e98128c9572e447bbf47276, first_name => Jorge, last_name => Cedi Voirol, birthday => 2012-03-29 00:00:00, phone => , cellphone => , nextel => , fax => 123123, address => asdasd, updated_at => , created_at => , ', '2012-04-17 02:04:00', 'http://localhost/adminv3/user/edit.php?id=40', '127.0.0.1', 13, 'UPDATE', 'User');
INSERT INTO `log` VALUES (21, 'id_bannersection => 1, id_region => , id_parent => 0, name => Seccion 1, ', '2012-04-17 02:04:19', 'http://localhost/adminv3/banner/addSection.php', '127.0.0.1', 13, 'INSERT', 'BannerSection');
INSERT INTO `log` VALUES (22, 'id_bannersection => 2, id_region => , id_parent => 1, name => Zona 1, ', '2012-04-17 02:04:37', 'http://localhost/adminv3/banner/addSection.php', '127.0.0.1', 13, 'INSERT', 'BannerSection');
INSERT INTO `log` VALUES (23, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.6929761, economic_unit_longitude => -101.180299, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 1, verified => 1, ', '2012-04-18 01:04:22', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (24, 'economic_unit_id => 2, economic_unit_name => nombre, economic_unit_street_type => tipo2, economic_unit_latitude => 19.6941074446, economic_unit_longitude => -101.194825844, economic_unit_description => descrip 2, economic_unit_street_name => calle 2, economic_unit_location_number => numero 2, economic_unit_reserve => asentamiento 2, economic_unit_phone => telefono 2, active => 1, verified => 1, ', '2012-04-18 01:04:44', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (25, 'economic_unit_id => 3, economic_unit_name => nombre, economic_unit_street_type => tipo2, economic_unit_latitude => 19.694107444561077, economic_unit_longitude => -101.19482584392466, economic_unit_description => descrip 2, economic_unit_street_name => calle 2, economic_unit_location_number => numero 2, economic_unit_reserve => asentamiento 2, economic_unit_phone => telefono 2, active => 1, verified => 1, ', '2012-04-18 01:04:17', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (26, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.6929761, economic_unit_longitude => -101.180299, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 1, verified => 0, ', '2012-04-18 02:04:05', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (27, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.6917235306, economic_unit_longitude => -101.183689312, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 1, verified => 0, ', '2012-04-18 02:04:35', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (28, 'id_category => , id_section => 2, id_parent => 0, name => Categoria geolocalizacion, ', '2012-04-18 02:04:11', 'http://localhost/adminv3/categories/add.php', '127.0.0.1', 13, 'INSERT', 'Category');
INSERT INTO `log` VALUES (29, 'economic_unit_category_id => 1, economic_unit_category_name => asd, economic_unit_category_original_id => 0, ', '2012-04-18 02:04:57', 'http://localhost/adminv3/categories/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (30, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.6917235306, economic_unit_longitude => -101.183689312, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 0, verified => 0, ', '2012-04-18 02:04:35', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (31, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:35', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (32, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.6917235306, economic_unit_longitude => -101.183689312, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 1, verified => 0, ', '2012-04-18 02:04:40', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (33, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:40', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (34, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.6917235306, economic_unit_longitude => -101.183689312, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 0, verified => 0, ', '2012-04-18 02:04:09', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (35, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:09', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (36, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.6975620365, economic_unit_longitude => -101.188646034, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 0, verified => 0, ', '2012-04-18 02:04:21', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (37, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:21', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (38, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.6975620365, economic_unit_longitude => -101.188646034, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 0, verified => 0, ', '2012-04-18 02:04:13', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (39, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:13', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (40, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.6974610261, economic_unit_longitude => -101.189783291, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 0, verified => 0, ', '2012-04-18 02:04:45', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (41, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:45', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (42, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.7029761007, economic_unit_longitude => -101.195641235, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 0, verified => 0, ', '2012-04-18 02:04:55', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (43, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:55', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (44, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.7046932097, economic_unit_longitude => -101.198666767, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 0, verified => 0, ', '2012-04-18 02:04:02', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (45, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:02', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (46, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.706491104035702, economic_unit_longitude => -101.1936456714929, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 0, verified => 0, ', '2012-04-18 02:04:59', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (47, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:59', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (48, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.705754890097374, economic_unit_longitude => -101.19515486197184, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 1, verified => 1, ', '2012-04-18 02:04:45', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (49, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:45', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (50, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.71092627264714, economic_unit_longitude => -101.20423145727841, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 1, verified => 1, ', '2012-04-18 02:04:16', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (51, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:16', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (52, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.70892642187905, economic_unit_longitude => -101.20772905783343, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 1, verified => 1, ', '2012-04-18 02:04:29', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (53, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-18 02:04:29', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (54, 'id_banner => 1, id_section => 1, id_zone => 2, link => algo.com, order => 1, updated_at => 2012-04-19 17:49:33, created_at => 2012-04-19 17:49:33, status => 1, ', '2012-04-19 05:04:33', 'http://localhost/adminv3/banner/add.php', '127.0.0.1', 13, 'INSERT', 'Banner');
INSERT INTO `log` VALUES (55, 'id_banner => 2, id_section => 1, id_zone => 2, link => algo.com, order => 1, updated_at => 2012-04-19 18:05:37, created_at => 2012-04-19 18:05:37, status => 1, ', '2012-04-19 06:04:37', 'http://localhost/adminv3/banner/add.php', '127.0.0.1', 13, 'INSERT', 'Banner');
INSERT INTO `log` VALUES (56, 'id_banner => 3, id_section => 1, id_zone => 2, link => enlace.com, order => 1, updated_at => 2012-04-19 18:10:58, created_at => 2012-04-19 18:10:58, status => 1, ', '2012-04-19 06:04:58', 'http://localhost/adminv3/banner/add.php', '127.0.0.1', 13, 'INSERT', 'Banner');
INSERT INTO `log` VALUES (57, 'id_category => , id_section => 2, id_parent => 0, name => nueva cat, ', '2012-04-19 06:04:48', 'http://localhost/adminv3/categories/add.php', '127.0.0.1', 13, 'INSERT', 'Category');
INSERT INTO `log` VALUES (58, 'id_banner => 4, id_section => 1, id_zone => 2, link => asd, order => 1, updated_at => 2012-04-19 18:48:18, created_at => 2012-04-19 18:48:18, status => 1, ', '2012-04-19 06:04:18', 'http://localhost/adminv3/banner/add.php', '127.0.0.1', 13, 'INSERT', 'Banner');
INSERT INTO `log` VALUES (59, 'economic_unit_category_id => 2, economic_unit_category_name => nueva cat geo, ', '2012-04-19 07:04:42', 'http://localhost/adminv3/categories/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (60, 'economic_unit_category_id => 3, economic_unit_category_name => nueva cat geoo, ', '2012-04-19 07:04:57', 'http://localhost/adminv3/categories/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (61, 'economic_unit_category_id => 1, economic_unit_category_name => asd, ', '2012-04-19 07:04:34', 'http://localhost/adminv3/categories/edit.php?id=1&s=2', '127.0.0.1', 13, 'UPDATE', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (62, 'economic_unit_category_id => 2, economic_unit_category_name => nueva cat geo, ', '2012-04-19 07:04:45', 'http://localhost/adminv3/categories/edit.php?id=2&s=2', '127.0.0.1', 13, 'UPDATE', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (63, 'economic_unit_category_id => 1, economic_unit_category_name => asd, ', '2012-04-19 07:04:13', 'http://localhost/adminv3/categories/edit.php?id=1&s=2', '127.0.0.1', 13, 'UPDATE', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (64, 'economic_unit_category_id => 1, economic_unit_category_name => asd, ', '2012-04-19 07:04:37', 'http://localhost/adminv3/categories/edit.php?id=1&s=2', '127.0.0.1', 13, 'UPDATE', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (65, 'economic_unit_category_id => 1, economic_unit_category_name => asd, ', '2012-04-19 07:04:41', 'http://localhost/adminv3/categories/edit.php?id=1&s=2', '127.0.0.1', 13, 'UPDATE', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (66, 'economic_unit_category_id => 1, economic_unit_category_name => asd, ', '2012-04-19 07:04:59', 'http://localhost/adminv3/categories/edit.php?id=1&s=2', '127.0.0.1', 13, 'UPDATE', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (67, 'economic_unit_category_id => 1, economic_unit_category_name => Test asd, ', '2012-04-19 07:04:22', 'http://localhost/adminv3/categories/edit.php?id=1&s=2', '127.0.0.1', 13, 'UPDATE', 'EconomicUnitCategory');
INSERT INTO `log` VALUES (68, 'id_banner => 5, id_section => 1, id_zone => 2, link => enlacneackslandlasdccom, order => 1, updated_at => 2012-04-19 19:14:57, created_at => 2012-04-19 19:14:57, status => 1, ', '2012-04-19 07:04:57', 'http://localhost/adminv3/banner/add.php', '127.0.0.1', 13, 'INSERT', 'Banner');
INSERT INTO `log` VALUES (69, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.70892642187905, economic_unit_longitude => -101.20772905783343, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 1, verified => 1, ', '2012-04-19 07:04:51', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (70, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-19 07:04:51', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (71, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 2, ', '2012-04-19 07:04:51', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (72, 'economic_unit_id => 1, economic_unit_name => Geolocalizacion, economic_unit_street_type => Tipo, economic_unit_latitude => 19.708381003693315, economic_unit_longitude => -101.21639795736957, economic_unit_description => descip, economic_unit_street_name => calle, economic_unit_location_number => 123, economic_unit_reserve => asentamiento, economic_unit_phone => 123123, active => 1, verified => 1, ', '2012-04-19 07:04:02', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'UPDATE', 'EconomicUnit');
INSERT INTO `log` VALUES (73, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 1, ', '2012-04-19 07:04:02', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (74, 'economic_units_economic_unit_id => 1, economic_unit_categories_economic_unit_category_id => 2, ', '2012-04-19 07:04:02', 'http://localhost/adminv3/geolocation/edit.php?id=1', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (75, 'economic_unit_id => 4, economic_unit_name => , economic_unit_street_type => , economic_unit_latitude => 0, economic_unit_longitude => 0, economic_unit_description => , economic_unit_street_name => , economic_unit_location_number => , economic_unit_reserve => , economic_unit_phone => , economic_unit_cellphone => , economic_unit_email => , economic_unit_credit_card => , economic_unit_facebook_page => , economic_unit_twitter => , economic_unit_logo => , active => 1, verified => 1, ', '2012-05-05 02:05:49', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (76, 'economic_unit_id => 5, economic_unit_name => , economic_unit_street_type => , economic_unit_latitude => 0, economic_unit_longitude => 0, economic_unit_description => , economic_unit_street_name => , economic_unit_location_number => , economic_unit_reserve => , economic_unit_phone => , economic_unit_cellphone => , economic_unit_email => , economic_unit_credit_card => , economic_unit_facebook_page => , economic_unit_twitter => , economic_unit_logo => , active => 1, verified => 1, ', '2012-05-07 01:05:32', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (77, 'economic_units_economic_unit_id => 5, economic_unit_categories_economic_unit_category_id => 2, ', '2012-05-07 01:05:32', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (78, 'economic_unit_id => 6, economic_unit_name => , economic_unit_street_type => , economic_unit_latitude => 0, economic_unit_longitude => 0, economic_unit_description => , economic_unit_street_name => , economic_unit_location_number => , economic_unit_reserve => , economic_unit_phone => , economic_unit_cellphone => , economic_unit_email => , economic_unit_credit_card => , economic_unit_facebook_page => , economic_unit_twitter => , economic_unit_logo => , active => 1, verified => 1, ', '2012-05-07 01:05:20', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (79, 'economic_units_economic_unit_id => 6, economic_unit_categories_economic_unit_category_id => 2, ', '2012-05-07 01:05:20', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (80, 'economic_unit_product_id => 1, economic_unit_id => 6, name => abuelos, price => 1200.56, description => los abuelos del pakillo, ', '2012-05-07 01:05:20', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitProduct');
INSERT INTO `log` VALUES (81, 'economic_unit_id => 7, economic_unit_name => , economic_unit_street_type => , economic_unit_latitude => 0, economic_unit_longitude => 0, economic_unit_description => , economic_unit_street_name => , economic_unit_location_number => , economic_unit_reserve => , economic_unit_phone => , economic_unit_cellphone => , economic_unit_email => , economic_unit_credit_card => , economic_unit_facebook_page => , economic_unit_twitter => , economic_unit_logo => , active => 1, verified => 1, ', '2012-05-07 01:05:44', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (82, 'economic_units_economic_unit_id => 7, economic_unit_categories_economic_unit_category_id => 2, ', '2012-05-07 01:05:44', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (83, 'economic_unit_product_id => 2, economic_unit_id => 7, name => abuelos, price => 1200.56, description => los abuelos del pakillo, ', '2012-05-07 01:05:44', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitProduct');
INSERT INTO `log` VALUES (84, 'economic_unit_id => 8, economic_unit_name => , economic_unit_street_type => , economic_unit_latitude => 0, economic_unit_longitude => 0, economic_unit_description => , economic_unit_street_name => , economic_unit_location_number => , economic_unit_reserve => , economic_unit_phone => , economic_unit_cellphone => , economic_unit_email => , economic_unit_credit_card => , economic_unit_facebook_page => , economic_unit_twitter => , economic_unit_logo => , active => 1, verified => 1, ', '2012-05-07 01:05:15', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (85, 'economic_units_economic_unit_id => 8, economic_unit_categories_economic_unit_category_id => 2, ', '2012-05-07 01:05:15', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (86, 'economic_unit_product_id => 3, economic_unit_id => 8, name => abuelos, price => 1200.56, description => los abuelos del pakillo, ', '2012-05-07 01:05:16', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitProduct');
INSERT INTO `log` VALUES (87, 'economic_unit_id => 9, economic_unit_name => , economic_unit_street_type => , economic_unit_latitude => 0, economic_unit_longitude => 0, economic_unit_description => , economic_unit_street_name => , economic_unit_location_number => , economic_unit_reserve => , economic_unit_phone => , economic_unit_cellphone => , economic_unit_email => , economic_unit_credit_card => , economic_unit_facebook_page => , economic_unit_twitter => , economic_unit_logo => , active => 1, verified => 1, ', '2012-05-07 01:05:10', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (88, 'economic_units_economic_unit_id => 9, economic_unit_categories_economic_unit_category_id => 2, ', '2012-05-07 01:05:10', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (89, 'economic_unit_product_id => 4, economic_unit_id => 9, name => abuelos2, price => 31200.56, description => los abuelos del pakillo2, ', '2012-05-07 01:05:10', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitProduct');
INSERT INTO `log` VALUES (90, 'economic_unit_product_id => 5, economic_unit_id => 9, name => tarahmunara, price => 1123, description => tareas, ', '2012-05-07 01:05:10', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitProduct');
INSERT INTO `log` VALUES (91, 'economic_unit_id => 10, economic_unit_name => , economic_unit_street_type => , economic_unit_latitude => 0, economic_unit_longitude => 0, economic_unit_description => , economic_unit_street_name => , economic_unit_location_number => , economic_unit_reserve => , economic_unit_phone => , economic_unit_cellphone => , economic_unit_email => , economic_unit_credit_card => , economic_unit_facebook_page => , economic_unit_twitter => , economic_unit_logo => , active => 1, verified => 1, ', '2012-05-07 01:05:35', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (92, 'economic_units_economic_unit_id => 10, economic_unit_categories_economic_unit_category_id => 2, ', '2012-05-07 01:05:35', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (93, 'economic_unit_product_id => 6, economic_unit_id => 10, name => abuelos2, price => 31200.56, description => los abuelos del pakillo2, image => bisabuelos_jpg.jpg, ', '2012-05-07 01:05:35', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitProduct');
INSERT INTO `log` VALUES (94, 'economic_unit_product_id => 7, economic_unit_id => 10, name => tarahmunara, price => 1123, description => tareas, image => tarahumaras1_jpg.jpg, ', '2012-05-07 01:05:35', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitProduct');
INSERT INTO `log` VALUES (95, 'economic_unit_id => 11, economic_unit_name => , economic_unit_street_type => , economic_unit_latitude => 0, economic_unit_longitude => 0, economic_unit_description => , economic_unit_street_name => , economic_unit_location_number => , economic_unit_reserve => , economic_unit_phone => , economic_unit_cellphone => , economic_unit_email => , economic_unit_credit_card => , economic_unit_facebook_page => , economic_unit_twitter => , economic_unit_logo => , active => 1, verified => 1, ', '2012-05-07 01:05:24', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnit');
INSERT INTO `log` VALUES (96, 'economic_units_economic_unit_id => 11, economic_unit_categories_economic_unit_category_id => 2, ', '2012-05-07 01:05:24', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitHasCategory');
INSERT INTO `log` VALUES (97, 'economic_unit_product_id => 8, economic_unit_id => 11, name => abuelos2, price => 31200.56, description => los abuelos del pakillo2, image => bisabuelos_jpg.jpg, ', '2012-05-07 01:05:24', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitProduct');
INSERT INTO `log` VALUES (98, 'economic_unit_product_id => 9, economic_unit_id => 11, name => tarahmunara, price => 1123, description => tareas, image => tarahumaras1_jpg.jpg, ', '2012-05-07 01:05:25', 'http://localhost/adminv3/geolocation/add.php', '127.0.0.1', 13, 'INSERT', 'EconomicUnitProduct');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `permission`
-- 

CREATE TABLE `permission` (
  `id_permission` tinyint(3) unsigned NOT NULL auto_increment,
  `id_section` tinyint(3) NOT NULL,
  `name` varchar(30) default NULL,
  PRIMARY KEY  (`id_permission`,`id_section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- 
-- Volcar la base de datos para la tabla `permission`
-- 

INSERT INTO `permission` VALUES (1, 1, 'Agregar Publicidad');
INSERT INTO `permission` VALUES (2, 1, 'Editar Publicidad');
INSERT INTO `permission` VALUES (3, 1, 'Eliminar Publicidad');
INSERT INTO `permission` VALUES (28, 3, 'Agregar Usuario');
INSERT INTO `permission` VALUES (29, 3, 'Editar Usuario');
INSERT INTO `permission` VALUES (30, 3, 'Eliminar Usuario');
INSERT INTO `permission` VALUES (43, 2, 'Agregar Gelocalización');
INSERT INTO `permission` VALUES (44, 2, 'Editar Gelocalización');
INSERT INTO `permission` VALUES (45, 2, 'Eliminar Gelocalización');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `region`
-- 

CREATE TABLE `region` (
  `id_region` smallint(5) unsigned NOT NULL auto_increment COMMENT '	',
  `id_parent` smallint(5) unsigned NOT NULL default '0',
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`id_region`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2486 ;

-- 
-- Volcar la base de datos para la tabla `region`
-- 

INSERT INTO `region` VALUES (1, 0, 'México');
INSERT INTO `region` VALUES (2, 1, 'Aguascalientes');
INSERT INTO `region` VALUES (3, 1, 'Baja California');
INSERT INTO `region` VALUES (4, 1, 'Baja California Sur');
INSERT INTO `region` VALUES (5, 1, 'Campeche');
INSERT INTO `region` VALUES (6, 1, 'Chiapas');
INSERT INTO `region` VALUES (7, 1, 'Chihuahua');
INSERT INTO `region` VALUES (8, 1, 'Coahuila de Zaragoza');
INSERT INTO `region` VALUES (9, 1, 'Colima');
INSERT INTO `region` VALUES (10, 1, 'Distrito Federal');
INSERT INTO `region` VALUES (11, 1, 'Durango');
INSERT INTO `region` VALUES (12, 1, 'Guanajuato');
INSERT INTO `region` VALUES (13, 1, 'Guerrero');
INSERT INTO `region` VALUES (14, 1, 'Hidalgo');
INSERT INTO `region` VALUES (15, 1, 'Jalisco');
INSERT INTO `region` VALUES (16, 1, 'México');
INSERT INTO `region` VALUES (17, 1, 'Michoacán de Ocampo');
INSERT INTO `region` VALUES (18, 1, 'Morelos');
INSERT INTO `region` VALUES (19, 1, 'Nayarit');
INSERT INTO `region` VALUES (20, 1, 'Nuevo León');
INSERT INTO `region` VALUES (21, 1, 'Oaxaca');
INSERT INTO `region` VALUES (22, 1, 'Puebla');
INSERT INTO `region` VALUES (23, 1, 'Querétaro');
INSERT INTO `region` VALUES (24, 1, 'Quintana Roo');
INSERT INTO `region` VALUES (25, 1, 'San Luis Potosí');
INSERT INTO `region` VALUES (26, 1, 'Sinaloa');
INSERT INTO `region` VALUES (27, 1, 'Sonora');
INSERT INTO `region` VALUES (28, 1, 'Tabasco');
INSERT INTO `region` VALUES (29, 1, 'Tamaulipas');
INSERT INTO `region` VALUES (30, 1, 'Tlaxcala');
INSERT INTO `region` VALUES (31, 1, 'Veracruz');
INSERT INTO `region` VALUES (32, 1, 'Yucatán');
INSERT INTO `region` VALUES (33, 1, 'Zacatecas');
INSERT INTO `region` VALUES (34, 2, 'Aguascalientes');
INSERT INTO `region` VALUES (35, 2, 'Asientos');
INSERT INTO `region` VALUES (36, 2, 'Calvillo');
INSERT INTO `region` VALUES (37, 2, 'Cosío');
INSERT INTO `region` VALUES (38, 2, 'El Llano');
INSERT INTO `region` VALUES (39, 2, 'Jesús María');
INSERT INTO `region` VALUES (40, 2, 'Pabellón de Arteaga');
INSERT INTO `region` VALUES (41, 2, 'Rincón de Romos');
INSERT INTO `region` VALUES (42, 2, 'San Francisco de los Romo');
INSERT INTO `region` VALUES (43, 2, 'San José de Gracia');
INSERT INTO `region` VALUES (44, 2, 'Tepezalá');
INSERT INTO `region` VALUES (45, 3, 'Ensenada');
INSERT INTO `region` VALUES (46, 3, 'Mexicali');
INSERT INTO `region` VALUES (47, 3, 'Playas de Rosarito');
INSERT INTO `region` VALUES (48, 3, 'Tecate');
INSERT INTO `region` VALUES (49, 3, 'Tijuana');
INSERT INTO `region` VALUES (50, 4, 'Comondú');
INSERT INTO `region` VALUES (51, 4, 'La Paz');
INSERT INTO `region` VALUES (52, 4, 'Loreto');
INSERT INTO `region` VALUES (53, 4, 'Los Cabos');
INSERT INTO `region` VALUES (54, 4, 'Mulegé');
INSERT INTO `region` VALUES (55, 5, 'Calakmul');
INSERT INTO `region` VALUES (56, 5, 'Calkiní');
INSERT INTO `region` VALUES (57, 5, 'Campeche');
INSERT INTO `region` VALUES (58, 5, 'Candelaria');
INSERT INTO `region` VALUES (59, 5, 'Carmen');
INSERT INTO `region` VALUES (60, 5, 'Champotón');
INSERT INTO `region` VALUES (61, 5, 'Escárcega');
INSERT INTO `region` VALUES (62, 5, 'Hecelchakán');
INSERT INTO `region` VALUES (63, 5, 'Hopelchén');
INSERT INTO `region` VALUES (64, 5, 'Palizada');
INSERT INTO `region` VALUES (65, 5, 'Tenabo');
INSERT INTO `region` VALUES (66, 6, 'Acacoyagua');
INSERT INTO `region` VALUES (67, 6, 'Acala');
INSERT INTO `region` VALUES (68, 6, 'Acapetahua');
INSERT INTO `region` VALUES (69, 6, 'Aldama');
INSERT INTO `region` VALUES (70, 6, 'Altamirano');
INSERT INTO `region` VALUES (71, 6, 'Amatán');
INSERT INTO `region` VALUES (72, 6, 'Amatenango de la Frontera');
INSERT INTO `region` VALUES (73, 6, 'Amatenango del Valle');
INSERT INTO `region` VALUES (74, 6, 'Angel Albino Corzo');
INSERT INTO `region` VALUES (75, 6, 'Arriaga');
INSERT INTO `region` VALUES (76, 6, 'Bejucal de Ocampo');
INSERT INTO `region` VALUES (77, 6, 'Bella Vista');
INSERT INTO `region` VALUES (78, 6, 'Benemérito de las Américas');
INSERT INTO `region` VALUES (79, 6, 'Berriozábal');
INSERT INTO `region` VALUES (80, 6, 'Bochil');
INSERT INTO `region` VALUES (81, 6, 'Cacahoatán');
INSERT INTO `region` VALUES (82, 6, 'Catazajá');
INSERT INTO `region` VALUES (83, 6, 'Chalchihuitán');
INSERT INTO `region` VALUES (84, 6, 'Chamula');
INSERT INTO `region` VALUES (85, 6, 'Chanal');
INSERT INTO `region` VALUES (86, 6, 'Chapultenango');
INSERT INTO `region` VALUES (87, 6, 'Chenalhó');
INSERT INTO `region` VALUES (88, 6, 'Chiapa de Corzo');
INSERT INTO `region` VALUES (89, 6, 'Chiapilla');
INSERT INTO `region` VALUES (90, 6, 'Chicoasén');
INSERT INTO `region` VALUES (91, 6, 'Chicomuselo');
INSERT INTO `region` VALUES (92, 6, 'Chilón');
INSERT INTO `region` VALUES (93, 6, 'Cintalapa');
INSERT INTO `region` VALUES (94, 6, 'Coapilla');
INSERT INTO `region` VALUES (95, 6, 'Comitán de Domínguez');
INSERT INTO `region` VALUES (96, 6, 'Copainalá');
INSERT INTO `region` VALUES (97, 6, 'El Bosque');
INSERT INTO `region` VALUES (98, 6, 'El Porvenir');
INSERT INTO `region` VALUES (99, 6, 'Escuintla');
INSERT INTO `region` VALUES (100, 6, 'Francisco León');
INSERT INTO `region` VALUES (101, 6, 'Frontera Comalapa');
INSERT INTO `region` VALUES (102, 6, 'Frontera Hidalgo');
INSERT INTO `region` VALUES (103, 6, 'Huehuetán');
INSERT INTO `region` VALUES (104, 6, 'Huitiupán');
INSERT INTO `region` VALUES (105, 6, 'Huixtán');
INSERT INTO `region` VALUES (106, 6, 'Huixtla');
INSERT INTO `region` VALUES (107, 6, 'Ixhuatán');
INSERT INTO `region` VALUES (108, 6, 'Ixtacomitán');
INSERT INTO `region` VALUES (109, 6, 'Ixtapa');
INSERT INTO `region` VALUES (110, 6, 'Ixtapangajoya');
INSERT INTO `region` VALUES (111, 6, 'Jiquipilas');
INSERT INTO `region` VALUES (112, 6, 'Jitotol');
INSERT INTO `region` VALUES (113, 6, 'Juárez');
INSERT INTO `region` VALUES (114, 6, 'La Concordia');
INSERT INTO `region` VALUES (115, 6, 'La Grandeza');
INSERT INTO `region` VALUES (116, 6, 'La Independencia');
INSERT INTO `region` VALUES (117, 6, 'La Libertad');
INSERT INTO `region` VALUES (118, 6, 'La Trinitaria');
INSERT INTO `region` VALUES (119, 6, 'Larráinzar');
INSERT INTO `region` VALUES (120, 6, 'Las Margaritas');
INSERT INTO `region` VALUES (121, 6, 'Las Rosas');
INSERT INTO `region` VALUES (122, 6, 'Mapastepec');
INSERT INTO `region` VALUES (123, 6, 'Maravilla Tenejapa');
INSERT INTO `region` VALUES (124, 6, 'Marqués de Comillas');
INSERT INTO `region` VALUES (125, 6, 'Mazapa de Madero');
INSERT INTO `region` VALUES (126, 6, 'Mazatán');
INSERT INTO `region` VALUES (127, 6, 'Metapa');
INSERT INTO `region` VALUES (128, 6, 'Mitontic');
INSERT INTO `region` VALUES (129, 6, 'Montecristo de Guerrero');
INSERT INTO `region` VALUES (130, 6, 'Motozintla');
INSERT INTO `region` VALUES (131, 6, 'Nicolás Ruíz');
INSERT INTO `region` VALUES (132, 6, 'Ocosingo');
INSERT INTO `region` VALUES (133, 6, 'Ocotepec');
INSERT INTO `region` VALUES (134, 6, 'Ocozocoautla de Espinosa');
INSERT INTO `region` VALUES (135, 6, 'Ostuacán');
INSERT INTO `region` VALUES (136, 6, 'Osumacinta');
INSERT INTO `region` VALUES (137, 6, 'Oxchuc');
INSERT INTO `region` VALUES (138, 6, 'Palenque');
INSERT INTO `region` VALUES (139, 6, 'Pantelhó');
INSERT INTO `region` VALUES (140, 6, 'Pantepec');
INSERT INTO `region` VALUES (141, 6, 'Pichucalco');
INSERT INTO `region` VALUES (142, 6, 'Pijijiapan');
INSERT INTO `region` VALUES (143, 6, 'Pueblo Nuevo Solistahuacán');
INSERT INTO `region` VALUES (144, 6, 'Rayón');
INSERT INTO `region` VALUES (145, 6, 'Reforma');
INSERT INTO `region` VALUES (146, 6, 'Sabanilla');
INSERT INTO `region` VALUES (147, 6, 'Salto de Agua');
INSERT INTO `region` VALUES (148, 6, 'San Andrés Duraznal');
INSERT INTO `region` VALUES (149, 6, 'San Cristóbal de las Casas');
INSERT INTO `region` VALUES (150, 6, 'San Fernando');
INSERT INTO `region` VALUES (151, 6, 'San Juan Cancuc');
INSERT INTO `region` VALUES (152, 6, 'San Lucas');
INSERT INTO `region` VALUES (153, 6, 'Santiago el Pinar');
INSERT INTO `region` VALUES (154, 6, 'Siltepec');
INSERT INTO `region` VALUES (155, 6, 'Simojovel');
INSERT INTO `region` VALUES (156, 6, 'Sitalá');
INSERT INTO `region` VALUES (157, 6, 'Socoltenango');
INSERT INTO `region` VALUES (158, 6, 'Solosuchiapa');
INSERT INTO `region` VALUES (159, 6, 'Soyaló');
INSERT INTO `region` VALUES (160, 6, 'Suchiapa');
INSERT INTO `region` VALUES (161, 6, 'Suchiate');
INSERT INTO `region` VALUES (162, 6, 'Sunuapa');
INSERT INTO `region` VALUES (163, 6, 'Tapachula');
INSERT INTO `region` VALUES (164, 6, 'Tapalapa');
INSERT INTO `region` VALUES (165, 6, 'Tapilula');
INSERT INTO `region` VALUES (166, 6, 'Tecpatán');
INSERT INTO `region` VALUES (167, 6, 'Tenejapa');
INSERT INTO `region` VALUES (168, 6, 'Teopisca');
INSERT INTO `region` VALUES (169, 6, 'Tila');
INSERT INTO `region` VALUES (170, 6, 'Tonalá');
INSERT INTO `region` VALUES (171, 6, 'Totolapa');
INSERT INTO `region` VALUES (172, 6, 'Tumbalá');
INSERT INTO `region` VALUES (173, 6, 'Tuxtla Chico');
INSERT INTO `region` VALUES (174, 6, 'Tuxtla Gutiérrez');
INSERT INTO `region` VALUES (175, 6, 'Tuzantán');
INSERT INTO `region` VALUES (176, 6, 'Tzimol');
INSERT INTO `region` VALUES (177, 6, 'Unión Juárez');
INSERT INTO `region` VALUES (178, 6, 'Venustiano Carranza');
INSERT INTO `region` VALUES (179, 6, 'Villa Comaltitlán');
INSERT INTO `region` VALUES (180, 6, 'Villa Corzo');
INSERT INTO `region` VALUES (181, 6, 'Villaflores');
INSERT INTO `region` VALUES (182, 6, 'Yajalón');
INSERT INTO `region` VALUES (183, 6, 'Zinacantán');
INSERT INTO `region` VALUES (184, 7, 'Ahumada');
INSERT INTO `region` VALUES (185, 7, 'Aldama');
INSERT INTO `region` VALUES (186, 7, 'Allende');
INSERT INTO `region` VALUES (187, 7, 'Aquiles Serdán');
INSERT INTO `region` VALUES (188, 7, 'Ascensión');
INSERT INTO `region` VALUES (189, 7, 'Bachíniva');
INSERT INTO `region` VALUES (190, 7, 'Balleza');
INSERT INTO `region` VALUES (191, 7, 'Batopilas');
INSERT INTO `region` VALUES (192, 7, 'Bocoyna');
INSERT INTO `region` VALUES (193, 7, 'Buenaventura');
INSERT INTO `region` VALUES (194, 7, 'Camargo');
INSERT INTO `region` VALUES (195, 7, 'Carichí');
INSERT INTO `region` VALUES (196, 7, 'Casas Grandes');
INSERT INTO `region` VALUES (197, 7, 'Chihuahua');
INSERT INTO `region` VALUES (198, 7, 'Chínipas');
INSERT INTO `region` VALUES (199, 7, 'Coronado');
INSERT INTO `region` VALUES (200, 7, 'Coyame del Sotol');
INSERT INTO `region` VALUES (201, 7, 'Cuauhtémoc');
INSERT INTO `region` VALUES (202, 7, 'Cusihuiriachi');
INSERT INTO `region` VALUES (203, 7, 'Delicias');
INSERT INTO `region` VALUES (204, 7, 'Dr. Belisario Domínguez');
INSERT INTO `region` VALUES (205, 7, 'El Tule');
INSERT INTO `region` VALUES (206, 7, 'Galeana');
INSERT INTO `region` VALUES (207, 7, 'Gómez Farías');
INSERT INTO `region` VALUES (208, 7, 'Gran Morelos');
INSERT INTO `region` VALUES (209, 7, 'Guachochi');
INSERT INTO `region` VALUES (210, 7, 'Guadalupe');
INSERT INTO `region` VALUES (211, 7, 'Guadalupe y Calvo');
INSERT INTO `region` VALUES (212, 7, 'Guazapares');
INSERT INTO `region` VALUES (213, 7, 'Guerrero');
INSERT INTO `region` VALUES (214, 7, 'Hidalgo del Parral');
INSERT INTO `region` VALUES (215, 7, 'Huejotitán');
INSERT INTO `region` VALUES (216, 7, 'Ignacio Zaragoza');
INSERT INTO `region` VALUES (217, 7, 'Janos');
INSERT INTO `region` VALUES (218, 7, 'Jiménez');
INSERT INTO `region` VALUES (219, 7, 'Juárez');
INSERT INTO `region` VALUES (220, 7, 'Julimes');
INSERT INTO `region` VALUES (221, 7, 'La Cruz');
INSERT INTO `region` VALUES (222, 7, 'López');
INSERT INTO `region` VALUES (223, 7, 'Madera');
INSERT INTO `region` VALUES (224, 7, 'Maguarichi');
INSERT INTO `region` VALUES (225, 7, 'Manuel Benavides');
INSERT INTO `region` VALUES (226, 7, 'Matachí');
INSERT INTO `region` VALUES (227, 7, 'Matamoros');
INSERT INTO `region` VALUES (228, 7, 'Meoqui');
INSERT INTO `region` VALUES (229, 7, 'Morelos');
INSERT INTO `region` VALUES (230, 7, 'Moris');
INSERT INTO `region` VALUES (231, 7, 'Namiquipa');
INSERT INTO `region` VALUES (232, 7, 'Nonoava');
INSERT INTO `region` VALUES (233, 7, 'Nuevo Casas Grandes');
INSERT INTO `region` VALUES (234, 7, 'Ocampo');
INSERT INTO `region` VALUES (235, 7, 'Ojinaga');
INSERT INTO `region` VALUES (236, 7, 'Praxedis G. Guerrero');
INSERT INTO `region` VALUES (237, 7, 'Riva Palacio');
INSERT INTO `region` VALUES (238, 7, 'Rosales');
INSERT INTO `region` VALUES (239, 7, 'Rosario');
INSERT INTO `region` VALUES (240, 7, 'San Francisco de Borja');
INSERT INTO `region` VALUES (241, 7, 'San Francisco de Conchos');
INSERT INTO `region` VALUES (242, 7, 'San Francisco del Oro');
INSERT INTO `region` VALUES (243, 7, 'Santa Bárbara');
INSERT INTO `region` VALUES (244, 7, 'Santa Isabel');
INSERT INTO `region` VALUES (245, 7, 'Satevó');
INSERT INTO `region` VALUES (246, 7, 'Saucillo');
INSERT INTO `region` VALUES (247, 7, 'Temósachi');
INSERT INTO `region` VALUES (248, 7, 'Urique');
INSERT INTO `region` VALUES (249, 7, 'Uruachi');
INSERT INTO `region` VALUES (250, 7, 'Valle de Zaragoza');
INSERT INTO `region` VALUES (251, 8, 'Abasolo');
INSERT INTO `region` VALUES (252, 8, 'Acuña');
INSERT INTO `region` VALUES (253, 8, 'Allende');
INSERT INTO `region` VALUES (254, 8, 'Arteaga');
INSERT INTO `region` VALUES (255, 8, 'Candela');
INSERT INTO `region` VALUES (256, 8, 'Castaños');
INSERT INTO `region` VALUES (257, 8, 'Cuatrociénegas');
INSERT INTO `region` VALUES (258, 8, 'Escobedo');
INSERT INTO `region` VALUES (259, 8, 'Francisco I. Madero');
INSERT INTO `region` VALUES (260, 8, 'Frontera');
INSERT INTO `region` VALUES (261, 8, 'General Cepeda');
INSERT INTO `region` VALUES (262, 8, 'Guerrero');
INSERT INTO `region` VALUES (263, 8, 'Hidalgo');
INSERT INTO `region` VALUES (264, 8, 'Jiménez');
INSERT INTO `region` VALUES (265, 8, 'Juárez');
INSERT INTO `region` VALUES (266, 8, 'Lamadrid');
INSERT INTO `region` VALUES (267, 8, 'Matamoros');
INSERT INTO `region` VALUES (268, 8, 'Monclova');
INSERT INTO `region` VALUES (269, 8, 'Morelos');
INSERT INTO `region` VALUES (270, 8, 'Múzquiz');
INSERT INTO `region` VALUES (271, 8, 'Nadadores');
INSERT INTO `region` VALUES (272, 8, 'Nava');
INSERT INTO `region` VALUES (273, 8, 'Ocampo');
INSERT INTO `region` VALUES (274, 8, 'Parras');
INSERT INTO `region` VALUES (275, 8, 'Piedras Negras');
INSERT INTO `region` VALUES (276, 8, 'Progreso');
INSERT INTO `region` VALUES (277, 8, 'Ramos Arizpe');
INSERT INTO `region` VALUES (278, 8, 'Sabinas');
INSERT INTO `region` VALUES (279, 8, 'Sacramento');
INSERT INTO `region` VALUES (280, 8, 'Saltillo');
INSERT INTO `region` VALUES (281, 8, 'San Buenaventura');
INSERT INTO `region` VALUES (282, 8, 'San Juan de Sabinas');
INSERT INTO `region` VALUES (283, 8, 'San Pedro');
INSERT INTO `region` VALUES (284, 8, 'Sierra Mojada');
INSERT INTO `region` VALUES (285, 8, 'Torreón');
INSERT INTO `region` VALUES (286, 8, 'Viesca');
INSERT INTO `region` VALUES (287, 8, 'Villa Unión');
INSERT INTO `region` VALUES (288, 8, 'Zaragoza');
INSERT INTO `region` VALUES (289, 9, 'Armería');
INSERT INTO `region` VALUES (290, 9, 'Colima');
INSERT INTO `region` VALUES (291, 9, 'Comala');
INSERT INTO `region` VALUES (292, 9, 'Coquimatlán');
INSERT INTO `region` VALUES (293, 9, 'Cuauhtémoc');
INSERT INTO `region` VALUES (294, 9, 'Ixtlahuacán');
INSERT INTO `region` VALUES (295, 9, 'Manzanillo');
INSERT INTO `region` VALUES (296, 9, 'Minatitlán');
INSERT INTO `region` VALUES (297, 9, 'Tecomán');
INSERT INTO `region` VALUES (298, 9, 'Villa de Alvarez');
INSERT INTO `region` VALUES (299, 10, 'Alvaro Obregón');
INSERT INTO `region` VALUES (300, 10, 'Azcapotzalco');
INSERT INTO `region` VALUES (301, 10, 'Benito Juárez');
INSERT INTO `region` VALUES (302, 10, 'Coyoacán');
INSERT INTO `region` VALUES (303, 10, 'Cuajimalpa de Morelos');
INSERT INTO `region` VALUES (304, 10, 'Cuauhtémoc');
INSERT INTO `region` VALUES (305, 10, 'Gustavo A. Madero');
INSERT INTO `region` VALUES (306, 10, 'Iztacalco');
INSERT INTO `region` VALUES (307, 10, 'Iztapalapa');
INSERT INTO `region` VALUES (308, 10, 'La Magdalena Contreras');
INSERT INTO `region` VALUES (309, 10, 'Miguel Hidalgo');
INSERT INTO `region` VALUES (310, 10, 'Milpa Alta');
INSERT INTO `region` VALUES (311, 10, 'Tláhuac');
INSERT INTO `region` VALUES (312, 10, 'Tlalpan');
INSERT INTO `region` VALUES (313, 10, 'Venustiano Carranza');
INSERT INTO `region` VALUES (314, 10, 'Xochimilco');
INSERT INTO `region` VALUES (315, 11, 'Canatlán');
INSERT INTO `region` VALUES (316, 11, 'Canelas');
INSERT INTO `region` VALUES (317, 11, 'Coneto de Comonfort');
INSERT INTO `region` VALUES (318, 11, 'Cuencamé');
INSERT INTO `region` VALUES (319, 11, 'Durango');
INSERT INTO `region` VALUES (320, 11, 'El Oro');
INSERT INTO `region` VALUES (321, 11, 'Gómez Palacio');
INSERT INTO `region` VALUES (322, 11, 'Gral. Simón Boívar');
INSERT INTO `region` VALUES (323, 11, 'Guadalupe Victoria');
INSERT INTO `region` VALUES (324, 11, 'Guanaceví');
INSERT INTO `region` VALUES (325, 11, 'Hidalgo');
INSERT INTO `region` VALUES (326, 11, 'Indé');
INSERT INTO `region` VALUES (327, 11, 'Lerdo');
INSERT INTO `region` VALUES (328, 11, 'Mapimí');
INSERT INTO `region` VALUES (329, 11, 'Mezquital');
INSERT INTO `region` VALUES (330, 11, 'Nazas');
INSERT INTO `region` VALUES (331, 11, 'Nombre de Dios');
INSERT INTO `region` VALUES (332, 11, 'Nuevo Ideal');
INSERT INTO `region` VALUES (333, 11, 'Ocampo');
INSERT INTO `region` VALUES (334, 11, 'Otáez');
INSERT INTO `region` VALUES (335, 11, 'Pánuco de Coronado');
INSERT INTO `region` VALUES (336, 11, 'Peñón Blanco');
INSERT INTO `region` VALUES (337, 11, 'Poanas');
INSERT INTO `region` VALUES (338, 11, 'Pueblo Nuevo');
INSERT INTO `region` VALUES (339, 11, 'Rodeo');
INSERT INTO `region` VALUES (340, 11, 'San Bernardo');
INSERT INTO `region` VALUES (341, 11, 'San Dimas');
INSERT INTO `region` VALUES (342, 11, 'San Juan de Guadalupe');
INSERT INTO `region` VALUES (343, 11, 'San Juan del Río');
INSERT INTO `region` VALUES (344, 11, 'San Luis del Cordero');
INSERT INTO `region` VALUES (345, 11, 'San Pedro del Gallo');
INSERT INTO `region` VALUES (346, 11, 'Santa Clara');
INSERT INTO `region` VALUES (347, 11, 'Santiago Papasquiaro');
INSERT INTO `region` VALUES (348, 11, 'Súchil');
INSERT INTO `region` VALUES (349, 11, 'Tamazula');
INSERT INTO `region` VALUES (350, 11, 'Tepehuanes');
INSERT INTO `region` VALUES (351, 11, 'Tlahualilo');
INSERT INTO `region` VALUES (352, 11, 'Topia');
INSERT INTO `region` VALUES (353, 11, 'Vicente Guerrero');
INSERT INTO `region` VALUES (354, 12, 'Abasolo');
INSERT INTO `region` VALUES (355, 12, 'Acámbaro');
INSERT INTO `region` VALUES (356, 12, 'Allende');
INSERT INTO `region` VALUES (357, 12, 'Apaseo el Alto');
INSERT INTO `region` VALUES (358, 12, 'Apaseo el Grande');
INSERT INTO `region` VALUES (359, 12, 'Atarjea');
INSERT INTO `region` VALUES (360, 12, 'Celaya');
INSERT INTO `region` VALUES (361, 12, 'Comonfort');
INSERT INTO `region` VALUES (362, 12, 'Coroneo');
INSERT INTO `region` VALUES (363, 12, 'Cortazar');
INSERT INTO `region` VALUES (364, 12, 'Cuerámaro');
INSERT INTO `region` VALUES (365, 12, 'Doctor Mora');
INSERT INTO `region` VALUES (366, 12, 'Dolores Hidalgo');
INSERT INTO `region` VALUES (367, 12, 'Guanajuato');
INSERT INTO `region` VALUES (368, 12, 'Huanímaro');
INSERT INTO `region` VALUES (369, 12, 'Irapuato');
INSERT INTO `region` VALUES (370, 12, 'Jaral del Progreso');
INSERT INTO `region` VALUES (371, 12, 'Jerécuaro');
INSERT INTO `region` VALUES (372, 12, 'León');
INSERT INTO `region` VALUES (373, 12, 'Manuel Doblado');
INSERT INTO `region` VALUES (374, 12, 'Moroleón');
INSERT INTO `region` VALUES (375, 12, 'Ocampo');
INSERT INTO `region` VALUES (376, 12, 'Pénjamo');
INSERT INTO `region` VALUES (377, 12, 'Pueblo Nuevo');
INSERT INTO `region` VALUES (378, 12, 'Purísima del Rincón');
INSERT INTO `region` VALUES (379, 12, 'Romita');
INSERT INTO `region` VALUES (380, 12, 'Salamanca');
INSERT INTO `region` VALUES (381, 12, 'Salvatierra');
INSERT INTO `region` VALUES (382, 12, 'San Diego de la Unión');
INSERT INTO `region` VALUES (383, 12, 'San Felipe');
INSERT INTO `region` VALUES (384, 12, 'San Francisco del Rincón');
INSERT INTO `region` VALUES (385, 12, 'San José Iturbide');
INSERT INTO `region` VALUES (386, 12, 'San Luis de la Paz');
INSERT INTO `region` VALUES (387, 12, 'Santa Catarina');
INSERT INTO `region` VALUES (388, 12, 'Santa Cruz de Juventino Rosas');
INSERT INTO `region` VALUES (389, 12, 'Santiago Maravatío');
INSERT INTO `region` VALUES (390, 12, 'Silao');
INSERT INTO `region` VALUES (391, 12, 'Tarandacuao');
INSERT INTO `region` VALUES (392, 12, 'Tarimoro');
INSERT INTO `region` VALUES (393, 12, 'Tierra Blanca');
INSERT INTO `region` VALUES (394, 12, 'Uriangato');
INSERT INTO `region` VALUES (395, 12, 'Valle de Santiago');
INSERT INTO `region` VALUES (396, 12, 'Victoria');
INSERT INTO `region` VALUES (397, 12, 'Villagrán');
INSERT INTO `region` VALUES (398, 12, 'Xichú');
INSERT INTO `region` VALUES (399, 12, 'Yuriria');
INSERT INTO `region` VALUES (400, 13, 'Acapulco de Juárez');
INSERT INTO `region` VALUES (401, 13, 'Acatepec');
INSERT INTO `region` VALUES (402, 13, 'Ahuacuotzingo');
INSERT INTO `region` VALUES (403, 13, 'Ajuchitlán del Progreso');
INSERT INTO `region` VALUES (404, 13, 'Alcozauca de Guerrero');
INSERT INTO `region` VALUES (405, 13, 'Alpoyeca');
INSERT INTO `region` VALUES (406, 13, 'Apaxtla');
INSERT INTO `region` VALUES (407, 13, 'Arcelia');
INSERT INTO `region` VALUES (408, 13, 'Atenango del Río');
INSERT INTO `region` VALUES (409, 13, 'Atlamajalcingo del Monte');
INSERT INTO `region` VALUES (410, 13, 'Atlixtac');
INSERT INTO `region` VALUES (411, 13, 'Atoyac de Alvarez');
INSERT INTO `region` VALUES (412, 13, 'Ayutla de los Libres');
INSERT INTO `region` VALUES (413, 13, 'Azoyú');
INSERT INTO `region` VALUES (414, 13, 'Benito Juárez');
INSERT INTO `region` VALUES (415, 13, 'Buenavista de Cuéllar');
INSERT INTO `region` VALUES (416, 13, 'Chilapa de Alvarez');
INSERT INTO `region` VALUES (417, 13, 'Chilpancingo de los Bravo');
INSERT INTO `region` VALUES (418, 13, 'Coahuayutla de José María Izazaga');
INSERT INTO `region` VALUES (419, 13, 'Cochoapa el Grande');
INSERT INTO `region` VALUES (420, 13, 'Cocula');
INSERT INTO `region` VALUES (421, 13, 'Copala');
INSERT INTO `region` VALUES (422, 13, 'Copalillo');
INSERT INTO `region` VALUES (423, 13, 'Copanatoyac');
INSERT INTO `region` VALUES (424, 13, 'Coyuca de Benítez');
INSERT INTO `region` VALUES (425, 13, 'Coyuca de Catalán');
INSERT INTO `region` VALUES (426, 13, 'Cuajinicuilapa');
INSERT INTO `region` VALUES (427, 13, 'Cualác');
INSERT INTO `region` VALUES (428, 13, 'Cuautepec');
INSERT INTO `region` VALUES (429, 13, 'Cuetzala del Progreso');
INSERT INTO `region` VALUES (430, 13, 'Cutzamala de Pinzón');
INSERT INTO `region` VALUES (431, 13, 'Eduardo Neri');
INSERT INTO `region` VALUES (432, 13, 'Florencio Villarreal');
INSERT INTO `region` VALUES (433, 13, 'General Canuto A. Neri');
INSERT INTO `region` VALUES (434, 13, 'General Heliodoro Castillo');
INSERT INTO `region` VALUES (435, 13, 'Huamuxtitlán');
INSERT INTO `region` VALUES (436, 13, 'Huitzuco de los Figueroa');
INSERT INTO `region` VALUES (437, 13, 'Iguala de la Independencia');
INSERT INTO `region` VALUES (438, 13, 'Igualapa');
INSERT INTO `region` VALUES (439, 13, 'Ixcateopan de Cuauhtémoc');
INSERT INTO `region` VALUES (440, 13, 'José Azueta');
INSERT INTO `region` VALUES (441, 13, 'José Joaquin de Herrera');
INSERT INTO `region` VALUES (442, 13, 'Juan R. Escudero');
INSERT INTO `region` VALUES (443, 13, 'La Unión de Isidoro Montes de Oca');
INSERT INTO `region` VALUES (444, 13, 'Leonardo Bravo');
INSERT INTO `region` VALUES (445, 13, 'Malinaltepec');
INSERT INTO `region` VALUES (446, 13, 'Marquelia');
INSERT INTO `region` VALUES (447, 13, 'Mártir de Cuilapan');
INSERT INTO `region` VALUES (448, 13, 'Metlatónoc');
INSERT INTO `region` VALUES (449, 13, 'Mochitlán');
INSERT INTO `region` VALUES (450, 13, 'Olinalá');
INSERT INTO `region` VALUES (451, 13, 'Ometepec');
INSERT INTO `region` VALUES (452, 13, 'Pedro Ascencio Alquisiras');
INSERT INTO `region` VALUES (453, 13, 'Petatlán');
INSERT INTO `region` VALUES (454, 13, 'Pilcaya');
INSERT INTO `region` VALUES (455, 13, 'Pungarabato');
INSERT INTO `region` VALUES (456, 13, 'Quechultenango');
INSERT INTO `region` VALUES (457, 13, 'San Luis Acatlán');
INSERT INTO `region` VALUES (458, 13, 'San Marcos');
INSERT INTO `region` VALUES (459, 13, 'San Miguel Totolapan');
INSERT INTO `region` VALUES (460, 13, 'Taxco de Alarcón');
INSERT INTO `region` VALUES (461, 13, 'Tecoanapa');
INSERT INTO `region` VALUES (462, 13, 'Técpan de Galeana');
INSERT INTO `region` VALUES (463, 13, 'Teloloapan');
INSERT INTO `region` VALUES (464, 13, 'Tepecoacuilco de Trujano');
INSERT INTO `region` VALUES (465, 13, 'Tetipac');
INSERT INTO `region` VALUES (466, 13, 'Tixtla de Guerrero');
INSERT INTO `region` VALUES (467, 13, 'Tlacoachistlahuaca');
INSERT INTO `region` VALUES (468, 13, 'Tlacoapa');
INSERT INTO `region` VALUES (469, 13, 'Tlalchapa');
INSERT INTO `region` VALUES (470, 13, 'Tlalixtaquilla de Maldonado');
INSERT INTO `region` VALUES (471, 13, 'Tlapa de Comonfort');
INSERT INTO `region` VALUES (472, 13, 'Tlapehuala');
INSERT INTO `region` VALUES (473, 13, 'Xalpatláhuac');
INSERT INTO `region` VALUES (474, 13, 'Xochihuehuetlán');
INSERT INTO `region` VALUES (475, 13, 'Xochistlahuaca');
INSERT INTO `region` VALUES (476, 13, 'Zapotitlán Tablas');
INSERT INTO `region` VALUES (477, 13, 'Zirándaro');
INSERT INTO `region` VALUES (478, 13, 'Zitlala');
INSERT INTO `region` VALUES (479, 14, 'Acatlán');
INSERT INTO `region` VALUES (480, 14, 'Acaxochitlán');
INSERT INTO `region` VALUES (481, 14, 'Actopan');
INSERT INTO `region` VALUES (482, 14, 'Agua Blanca de Iturbide');
INSERT INTO `region` VALUES (483, 14, 'Ajacuba');
INSERT INTO `region` VALUES (484, 14, 'Alfajayucan');
INSERT INTO `region` VALUES (485, 14, 'Almoloya');
INSERT INTO `region` VALUES (486, 14, 'Apan');
INSERT INTO `region` VALUES (487, 14, 'Atitalaquia');
INSERT INTO `region` VALUES (488, 14, 'Atlapexco');
INSERT INTO `region` VALUES (489, 14, 'Atotonilco de Tula');
INSERT INTO `region` VALUES (490, 14, 'Atotonilco el Grande');
INSERT INTO `region` VALUES (491, 14, 'Calnali');
INSERT INTO `region` VALUES (492, 14, 'Cardonal');
INSERT INTO `region` VALUES (493, 14, 'Chapantongo');
INSERT INTO `region` VALUES (494, 14, 'Chapulhuacán');
INSERT INTO `region` VALUES (495, 14, 'Chilcuautla');
INSERT INTO `region` VALUES (496, 14, 'Cuautepec de Hinojosa');
INSERT INTO `region` VALUES (497, 14, 'El Arenal');
INSERT INTO `region` VALUES (498, 14, 'Eloxochitlán');
INSERT INTO `region` VALUES (499, 14, 'Emiliano Zapata');
INSERT INTO `region` VALUES (500, 14, 'Epazoyucan');
INSERT INTO `region` VALUES (501, 14, 'Francisco I. Madero');
INSERT INTO `region` VALUES (502, 14, 'Huasca de Ocampo');
INSERT INTO `region` VALUES (503, 14, 'Huautla');
INSERT INTO `region` VALUES (504, 14, 'Huazalingo');
INSERT INTO `region` VALUES (505, 14, 'Huehuetla');
INSERT INTO `region` VALUES (506, 14, 'Huejutla de Reyes');
INSERT INTO `region` VALUES (507, 14, 'Huichapan');
INSERT INTO `region` VALUES (508, 14, 'Ixmiquilpan');
INSERT INTO `region` VALUES (509, 14, 'Jacala de Ledezma');
INSERT INTO `region` VALUES (510, 14, 'Jaltocán');
INSERT INTO `region` VALUES (511, 14, 'Juárez Hidalgo');
INSERT INTO `region` VALUES (512, 14, 'La Misión');
INSERT INTO `region` VALUES (513, 14, 'Lolotla');
INSERT INTO `region` VALUES (514, 14, 'Metepec');
INSERT INTO `region` VALUES (515, 14, 'Metztitlán');
INSERT INTO `region` VALUES (516, 14, 'Mineral de la Reforma');
INSERT INTO `region` VALUES (517, 14, 'Mineral del Chico');
INSERT INTO `region` VALUES (518, 14, 'Mineral del Monte');
INSERT INTO `region` VALUES (519, 14, 'Mixquiahuala de Juárez');
INSERT INTO `region` VALUES (520, 14, 'Molango de Escamilla');
INSERT INTO `region` VALUES (521, 14, 'Nicolás Flores');
INSERT INTO `region` VALUES (522, 14, 'Nopala de Villagrán');
INSERT INTO `region` VALUES (523, 14, 'Omitlán de Juárez');
INSERT INTO `region` VALUES (524, 14, 'Pachuca de Soto');
INSERT INTO `region` VALUES (525, 14, 'Pacula');
INSERT INTO `region` VALUES (526, 14, 'Pisaflores');
INSERT INTO `region` VALUES (527, 14, 'Progreso de Obregón');
INSERT INTO `region` VALUES (528, 14, 'San Agustín Metzquititlán');
INSERT INTO `region` VALUES (529, 14, 'San Agustín Tlaxiaca');
INSERT INTO `region` VALUES (530, 14, 'San Bartolo Tutotepec');
INSERT INTO `region` VALUES (531, 14, 'San Felipe Orizatlán');
INSERT INTO `region` VALUES (532, 14, 'San Salvador');
INSERT INTO `region` VALUES (533, 14, 'Santiago de Anaya');
INSERT INTO `region` VALUES (534, 14, 'Santiago Tulantepec de Lugo Guerre');
INSERT INTO `region` VALUES (535, 14, 'Singuilucan');
INSERT INTO `region` VALUES (536, 14, 'Tasquillo');
INSERT INTO `region` VALUES (537, 14, 'Tecozautla');
INSERT INTO `region` VALUES (538, 14, 'Tenango de Doria');
INSERT INTO `region` VALUES (539, 14, 'Tepeapulco');
INSERT INTO `region` VALUES (540, 14, 'Tepehuacán de Guerrero');
INSERT INTO `region` VALUES (541, 14, 'Tepeji del Río de Ocampo');
INSERT INTO `region` VALUES (542, 14, 'Tepetitlán');
INSERT INTO `region` VALUES (543, 14, 'Tetepango');
INSERT INTO `region` VALUES (544, 14, 'Tezontepec de Aldama');
INSERT INTO `region` VALUES (545, 14, 'Tianguistengo');
INSERT INTO `region` VALUES (546, 14, 'Tizayuca');
INSERT INTO `region` VALUES (547, 14, 'Tlahuelilpan');
INSERT INTO `region` VALUES (548, 14, 'Tlahuiltepa');
INSERT INTO `region` VALUES (549, 14, 'Tlanalapa');
INSERT INTO `region` VALUES (550, 14, 'Tlanchinol');
INSERT INTO `region` VALUES (551, 14, 'Tlaxcoapan');
INSERT INTO `region` VALUES (552, 14, 'Tolcayuca');
INSERT INTO `region` VALUES (553, 14, 'Tula de Allende');
INSERT INTO `region` VALUES (554, 14, 'Tulancingo de Bravo');
INSERT INTO `region` VALUES (555, 14, 'Villa de Tezontepec');
INSERT INTO `region` VALUES (556, 14, 'Xochiatipan');
INSERT INTO `region` VALUES (557, 14, 'Xochicoatlán');
INSERT INTO `region` VALUES (558, 14, 'Yahualica');
INSERT INTO `region` VALUES (559, 14, 'Zacualtipán de Ángeles');
INSERT INTO `region` VALUES (560, 14, 'Zapotlán de Juárez');
INSERT INTO `region` VALUES (561, 14, 'Zempoala');
INSERT INTO `region` VALUES (562, 14, 'Zimapán');
INSERT INTO `region` VALUES (563, 15, 'Acatic');
INSERT INTO `region` VALUES (564, 15, 'Acatlán de Juárez');
INSERT INTO `region` VALUES (565, 15, 'Ahualulco de Mercado');
INSERT INTO `region` VALUES (566, 15, 'Amacueca');
INSERT INTO `region` VALUES (567, 15, 'Amatitán');
INSERT INTO `region` VALUES (568, 15, 'Ameca');
INSERT INTO `region` VALUES (569, 15, 'Arandas');
INSERT INTO `region` VALUES (570, 15, 'Atemajac de Brizuela');
INSERT INTO `region` VALUES (571, 15, 'Atengo');
INSERT INTO `region` VALUES (572, 15, 'Atenguillo');
INSERT INTO `region` VALUES (573, 15, 'Atotonilco el Alto');
INSERT INTO `region` VALUES (574, 15, 'Atoyac');
INSERT INTO `region` VALUES (575, 15, 'Autlán de Navarro');
INSERT INTO `region` VALUES (576, 15, 'Ayotlán');
INSERT INTO `region` VALUES (577, 15, 'Ayutla');
INSERT INTO `region` VALUES (578, 15, 'Bolaños');
INSERT INTO `region` VALUES (579, 15, 'Cabo Corrientes');
INSERT INTO `region` VALUES (580, 15, 'Cañadas de Obregón');
INSERT INTO `region` VALUES (581, 15, 'Casimiro Castillo');
INSERT INTO `region` VALUES (582, 15, 'Chapala');
INSERT INTO `region` VALUES (583, 15, 'Chimaltitán');
INSERT INTO `region` VALUES (584, 15, 'Chiquilistlán');
INSERT INTO `region` VALUES (585, 15, 'Cihuatlán');
INSERT INTO `region` VALUES (586, 15, 'Cocula');
INSERT INTO `region` VALUES (587, 15, 'Colotlán');
INSERT INTO `region` VALUES (588, 15, 'Concepción de Buenos Aires');
INSERT INTO `region` VALUES (589, 15, 'Cuautitlán de García Barragán');
INSERT INTO `region` VALUES (590, 15, 'Cuautla');
INSERT INTO `region` VALUES (591, 15, 'Cuquío');
INSERT INTO `region` VALUES (592, 15, 'Degollado');
INSERT INTO `region` VALUES (593, 15, 'Ejutla');
INSERT INTO `region` VALUES (594, 15, 'EL Arenal');
INSERT INTO `region` VALUES (595, 15, 'El Grullo');
INSERT INTO `region` VALUES (596, 15, 'El Limón');
INSERT INTO `region` VALUES (597, 15, 'El Salto');
INSERT INTO `region` VALUES (598, 15, 'Encarnación de Díaz');
INSERT INTO `region` VALUES (599, 15, 'Etzatlán');
INSERT INTO `region` VALUES (600, 15, 'Gómez Farías');
INSERT INTO `region` VALUES (601, 15, 'Guachinango');
INSERT INTO `region` VALUES (602, 15, 'Guadalajara');
INSERT INTO `region` VALUES (603, 15, 'Hostotipaquillo');
INSERT INTO `region` VALUES (604, 15, 'Huejúcar');
INSERT INTO `region` VALUES (605, 15, 'Huejuquilla el Alto');
INSERT INTO `region` VALUES (606, 15, 'Ixtlahuacán de los Membrillos');
INSERT INTO `region` VALUES (607, 15, 'Ixtlahuacán del Río');
INSERT INTO `region` VALUES (608, 15, 'Jalostotitlán');
INSERT INTO `region` VALUES (609, 15, 'Jamay');
INSERT INTO `region` VALUES (610, 15, 'Jesús María');
INSERT INTO `region` VALUES (611, 15, 'Jilotlán de los Dolores');
INSERT INTO `region` VALUES (612, 15, 'Jocotepec');
INSERT INTO `region` VALUES (613, 15, 'Juanacatlán');
INSERT INTO `region` VALUES (614, 15, 'Juchitlán');
INSERT INTO `region` VALUES (615, 15, 'La Barca');
INSERT INTO `region` VALUES (616, 15, 'La Huerta');
INSERT INTO `region` VALUES (617, 15, 'La Manzanilla de la Paz');
INSERT INTO `region` VALUES (618, 15, 'Lagos de Moreno');
INSERT INTO `region` VALUES (619, 15, 'Magdalena');
INSERT INTO `region` VALUES (620, 15, 'Mascota');
INSERT INTO `region` VALUES (621, 15, 'Mazamitla');
INSERT INTO `region` VALUES (622, 15, 'Mexticacán');
INSERT INTO `region` VALUES (623, 15, 'Mezquitic');
INSERT INTO `region` VALUES (624, 15, 'Mixtlán');
INSERT INTO `region` VALUES (625, 15, 'Ocotlán');
INSERT INTO `region` VALUES (626, 15, 'Ojuelos de Jalisco');
INSERT INTO `region` VALUES (627, 15, 'Pihuamo');
INSERT INTO `region` VALUES (628, 15, 'Poncitlán');
INSERT INTO `region` VALUES (629, 15, 'Puerto Vallarta');
INSERT INTO `region` VALUES (630, 15, 'Quitupan');
INSERT INTO `region` VALUES (631, 15, 'San Cristóbal de la Barranca');
INSERT INTO `region` VALUES (632, 15, 'San Diego de Alejandría');
INSERT INTO `region` VALUES (633, 15, 'San Gabriel');
INSERT INTO `region` VALUES (634, 15, 'San Juan de los Lagos');
INSERT INTO `region` VALUES (635, 15, 'San Juanito de Escobedo');
INSERT INTO `region` VALUES (636, 15, 'San Julián');
INSERT INTO `region` VALUES (637, 15, 'San Marcos');
INSERT INTO `region` VALUES (638, 15, 'San Martín de Bolaños');
INSERT INTO `region` VALUES (639, 15, 'San Martín Hidalgo');
INSERT INTO `region` VALUES (640, 15, 'San Miguel el Alto');
INSERT INTO `region` VALUES (641, 15, 'San Sebastián del Oeste');
INSERT INTO `region` VALUES (642, 15, 'Santa María de los Ángeles');
INSERT INTO `region` VALUES (643, 15, 'Santa María del Oro');
INSERT INTO `region` VALUES (644, 15, 'Sayula');
INSERT INTO `region` VALUES (645, 15, 'Tala');
INSERT INTO `region` VALUES (646, 15, 'Talpa de Allende');
INSERT INTO `region` VALUES (647, 15, 'Tamazula de Gordiano');
INSERT INTO `region` VALUES (648, 15, 'Tapalpa');
INSERT INTO `region` VALUES (649, 15, 'Tecalitlán');
INSERT INTO `region` VALUES (650, 15, 'Techaluta de Montenegro');
INSERT INTO `region` VALUES (651, 15, 'Tecolotlán');
INSERT INTO `region` VALUES (652, 15, 'Tenamaxtlán');
INSERT INTO `region` VALUES (653, 15, 'Teocaltiche');
INSERT INTO `region` VALUES (654, 15, 'Teocuitatlán de Corona');
INSERT INTO `region` VALUES (655, 15, 'Tepatitlán de Morelos');
INSERT INTO `region` VALUES (656, 15, 'Tequila');
INSERT INTO `region` VALUES (657, 15, 'Teuchitlán');
INSERT INTO `region` VALUES (658, 15, 'Tizapán el Alto');
INSERT INTO `region` VALUES (659, 15, 'Tlajomulco de Zúñiga');
INSERT INTO `region` VALUES (660, 15, 'Tlaquepaque');
INSERT INTO `region` VALUES (661, 15, 'Tolimán');
INSERT INTO `region` VALUES (662, 15, 'Tomatlán');
INSERT INTO `region` VALUES (663, 15, 'Tonalá');
INSERT INTO `region` VALUES (664, 15, 'Tonaya');
INSERT INTO `region` VALUES (665, 15, 'Tonila');
INSERT INTO `region` VALUES (666, 15, 'Totatiche');
INSERT INTO `region` VALUES (667, 15, 'Tototlán');
INSERT INTO `region` VALUES (668, 15, 'Tuxcacuesco');
INSERT INTO `region` VALUES (669, 15, 'Tuxcueca');
INSERT INTO `region` VALUES (670, 15, 'Tuxpan');
INSERT INTO `region` VALUES (671, 15, 'Unión de San Antonio');
INSERT INTO `region` VALUES (672, 15, 'Unión de Tula');
INSERT INTO `region` VALUES (673, 15, 'Valle de Guadalupe');
INSERT INTO `region` VALUES (674, 15, 'Valle de Juárez');
INSERT INTO `region` VALUES (675, 15, 'Villa Corona');
INSERT INTO `region` VALUES (676, 15, 'Villa Guerrero');
INSERT INTO `region` VALUES (677, 15, 'Villa Hidalgo');
INSERT INTO `region` VALUES (678, 15, 'Villa Purificación');
INSERT INTO `region` VALUES (679, 15, 'Yahualica de González Gallo');
INSERT INTO `region` VALUES (680, 15, 'Zacoalco de Torres');
INSERT INTO `region` VALUES (681, 15, 'Zapopan');
INSERT INTO `region` VALUES (682, 15, 'Zapotiltic');
INSERT INTO `region` VALUES (683, 15, 'Zapotitlán de Vadillo');
INSERT INTO `region` VALUES (684, 15, 'Zapotlán del Rey');
INSERT INTO `region` VALUES (685, 15, 'Zapotlán el Grande');
INSERT INTO `region` VALUES (686, 15, 'Zapotlanejo');
INSERT INTO `region` VALUES (687, 16, 'Acambay');
INSERT INTO `region` VALUES (688, 16, 'Acolman');
INSERT INTO `region` VALUES (689, 16, 'Aculco');
INSERT INTO `region` VALUES (690, 16, 'Almoloya de Alquisiras');
INSERT INTO `region` VALUES (691, 16, 'Almoloya de Juárez');
INSERT INTO `region` VALUES (692, 16, 'Almoloya del Río');
INSERT INTO `region` VALUES (693, 16, 'Amanalco');
INSERT INTO `region` VALUES (694, 16, 'Amatepec');
INSERT INTO `region` VALUES (695, 16, 'Amecameca');
INSERT INTO `region` VALUES (696, 16, 'Apaxco');
INSERT INTO `region` VALUES (697, 16, 'Atenco');
INSERT INTO `region` VALUES (698, 16, 'Atizapán');
INSERT INTO `region` VALUES (699, 16, 'Atizapán de Zaragoza');
INSERT INTO `region` VALUES (700, 16, 'Atlacomulco');
INSERT INTO `region` VALUES (701, 16, 'Atlautla');
INSERT INTO `region` VALUES (702, 16, 'Axapusco');
INSERT INTO `region` VALUES (703, 16, 'Ayapango');
INSERT INTO `region` VALUES (704, 16, 'Calimaya');
INSERT INTO `region` VALUES (705, 16, 'Capulhuac');
INSERT INTO `region` VALUES (706, 16, 'Chalco');
INSERT INTO `region` VALUES (707, 16, 'Chapa de Mota');
INSERT INTO `region` VALUES (708, 16, 'Chapultepec');
INSERT INTO `region` VALUES (709, 16, 'Chiautla');
INSERT INTO `region` VALUES (710, 16, 'Chicoloapan');
INSERT INTO `region` VALUES (711, 16, 'Chiconcuac');
INSERT INTO `region` VALUES (712, 16, 'Chimalhuacán');
INSERT INTO `region` VALUES (713, 16, 'Coacalco de Berriozábal');
INSERT INTO `region` VALUES (714, 16, 'Coatepec Harinas');
INSERT INTO `region` VALUES (715, 16, 'Cocotitlán');
INSERT INTO `region` VALUES (716, 16, 'Coyotepec');
INSERT INTO `region` VALUES (717, 16, 'Cuautitlán');
INSERT INTO `region` VALUES (718, 16, 'Cuautitlán Izcalli');
INSERT INTO `region` VALUES (719, 16, 'Donato Guerra');
INSERT INTO `region` VALUES (720, 16, 'Ecatepec de Morelos');
INSERT INTO `region` VALUES (721, 16, 'Ecatzingo');
INSERT INTO `region` VALUES (722, 16, 'El Oro');
INSERT INTO `region` VALUES (723, 16, 'Huehuetoca');
INSERT INTO `region` VALUES (724, 16, 'Hueypoxtla');
INSERT INTO `region` VALUES (725, 16, 'Huixquilucan');
INSERT INTO `region` VALUES (726, 16, 'Isidro Fabela');
INSERT INTO `region` VALUES (727, 16, 'Ixtapaluca');
INSERT INTO `region` VALUES (728, 16, 'Ixtapan de la Sal');
INSERT INTO `region` VALUES (729, 16, 'Ixtapan del Oro');
INSERT INTO `region` VALUES (730, 16, 'Ixtlahuaca');
INSERT INTO `region` VALUES (731, 16, 'Jaltenco');
INSERT INTO `region` VALUES (732, 16, 'Jilotepec');
INSERT INTO `region` VALUES (733, 16, 'Jilotzingo');
INSERT INTO `region` VALUES (734, 16, 'Jiquipilco');
INSERT INTO `region` VALUES (735, 16, 'Jocotitlán');
INSERT INTO `region` VALUES (736, 16, 'Joquicingo');
INSERT INTO `region` VALUES (737, 16, 'Juchitepec');
INSERT INTO `region` VALUES (738, 16, 'La Paz');
INSERT INTO `region` VALUES (739, 16, 'Lerma');
INSERT INTO `region` VALUES (740, 16, 'Luvianos');
INSERT INTO `region` VALUES (741, 16, 'Malinalco');
INSERT INTO `region` VALUES (742, 16, 'Melchor Ocampo');
INSERT INTO `region` VALUES (743, 16, 'Metepec');
INSERT INTO `region` VALUES (744, 16, 'Mexicaltzingo');
INSERT INTO `region` VALUES (745, 16, 'Morelos');
INSERT INTO `region` VALUES (746, 16, 'Naucalpan de Juárez');
INSERT INTO `region` VALUES (747, 16, 'Nextlalpan');
INSERT INTO `region` VALUES (748, 16, 'Nezahualcóyotl');
INSERT INTO `region` VALUES (749, 16, 'Nicolás Romero');
INSERT INTO `region` VALUES (750, 16, 'Nopaltepec');
INSERT INTO `region` VALUES (751, 16, 'Ocoyoacac');
INSERT INTO `region` VALUES (752, 16, 'Ocuilan');
INSERT INTO `region` VALUES (753, 16, 'Otumba');
INSERT INTO `region` VALUES (754, 16, 'Otzoloapan');
INSERT INTO `region` VALUES (755, 16, 'Otzolotepec');
INSERT INTO `region` VALUES (756, 16, 'Ozumba');
INSERT INTO `region` VALUES (757, 16, 'Papalotla');
INSERT INTO `region` VALUES (758, 16, 'Polotitlán');
INSERT INTO `region` VALUES (759, 16, 'Rayón');
INSERT INTO `region` VALUES (760, 16, 'San Antonio la Isla');
INSERT INTO `region` VALUES (761, 16, 'San Felipe del Progreso');
INSERT INTO `region` VALUES (762, 16, 'San José del Rincón');
INSERT INTO `region` VALUES (763, 16, 'San Martín de las Pirámides');
INSERT INTO `region` VALUES (764, 16, 'San Mateo Atenco');
INSERT INTO `region` VALUES (765, 16, 'San Simón de Guerrero');
INSERT INTO `region` VALUES (766, 16, 'Santo Tomás');
INSERT INTO `region` VALUES (767, 16, 'Soyaniquilpan de Juárez');
INSERT INTO `region` VALUES (768, 16, 'Sultepec');
INSERT INTO `region` VALUES (769, 16, 'Tecámac');
INSERT INTO `region` VALUES (770, 16, 'Tejupilco');
INSERT INTO `region` VALUES (771, 16, 'Temamatla');
INSERT INTO `region` VALUES (772, 16, 'Temascalapa');
INSERT INTO `region` VALUES (773, 16, 'Temascalcingo');
INSERT INTO `region` VALUES (774, 16, 'Temascaltepec');
INSERT INTO `region` VALUES (775, 16, 'Temoaya');
INSERT INTO `region` VALUES (776, 16, 'Tenancingo');
INSERT INTO `region` VALUES (777, 16, 'Tenango del Aire');
INSERT INTO `region` VALUES (778, 16, 'Tenango del Valle');
INSERT INTO `region` VALUES (779, 16, 'Teoloyucán');
INSERT INTO `region` VALUES (780, 16, 'Teotihuacán');
INSERT INTO `region` VALUES (781, 16, 'Tepetlaoxtoc');
INSERT INTO `region` VALUES (782, 16, 'Tepetlixpa');
INSERT INTO `region` VALUES (783, 16, 'Tepotzotlán');
INSERT INTO `region` VALUES (784, 16, 'Tequixquiac');
INSERT INTO `region` VALUES (785, 16, 'Texcaltitlán');
INSERT INTO `region` VALUES (786, 16, 'Texcalyacac');
INSERT INTO `region` VALUES (787, 16, 'Texcoco');
INSERT INTO `region` VALUES (788, 16, 'Tezoyuca');
INSERT INTO `region` VALUES (789, 16, 'Tianguistenco');
INSERT INTO `region` VALUES (790, 16, 'Timilpan');
INSERT INTO `region` VALUES (791, 16, 'Tlalmanalco');
INSERT INTO `region` VALUES (792, 16, 'Tlalnepantla de Baz');
INSERT INTO `region` VALUES (793, 16, 'Tlatlaya');
INSERT INTO `region` VALUES (794, 16, 'Toluca');
INSERT INTO `region` VALUES (795, 16, 'Tonanitla');
INSERT INTO `region` VALUES (796, 16, 'Tonatico');
INSERT INTO `region` VALUES (797, 16, 'Tultepec');
INSERT INTO `region` VALUES (798, 16, 'Tultitlán');
INSERT INTO `region` VALUES (799, 16, 'Valle de Bravo');
INSERT INTO `region` VALUES (800, 16, 'Valle de Chalco Solidaridad');
INSERT INTO `region` VALUES (801, 16, 'Villa de Allende');
INSERT INTO `region` VALUES (802, 16, 'Villa del Carbón');
INSERT INTO `region` VALUES (803, 16, 'Villa Guerrero');
INSERT INTO `region` VALUES (804, 16, 'Villa Victoria');
INSERT INTO `region` VALUES (805, 16, 'Xalatlaco');
INSERT INTO `region` VALUES (806, 16, 'Xonacatlán');
INSERT INTO `region` VALUES (807, 16, 'Zacazonapan');
INSERT INTO `region` VALUES (808, 16, 'Zacualpan');
INSERT INTO `region` VALUES (809, 16, 'Zinacantepec');
INSERT INTO `region` VALUES (810, 16, 'Zumpahuacán');
INSERT INTO `region` VALUES (811, 16, 'Zumpango');
INSERT INTO `region` VALUES (812, 17, 'Acuitzio');
INSERT INTO `region` VALUES (813, 17, 'Aguililla');
INSERT INTO `region` VALUES (814, 17, 'Alvaro Obregón');
INSERT INTO `region` VALUES (815, 17, 'Angamacutiro');
INSERT INTO `region` VALUES (816, 17, 'Angangueo');
INSERT INTO `region` VALUES (817, 17, 'Apatzingán');
INSERT INTO `region` VALUES (818, 17, 'Aporo');
INSERT INTO `region` VALUES (819, 17, 'Aquila');
INSERT INTO `region` VALUES (820, 17, 'Ario');
INSERT INTO `region` VALUES (821, 17, 'Arteaga');
INSERT INTO `region` VALUES (822, 17, 'Briseñas');
INSERT INTO `region` VALUES (823, 17, 'Buenavista');
INSERT INTO `region` VALUES (824, 17, 'Carácuaro');
INSERT INTO `region` VALUES (825, 17, 'Charapan');
INSERT INTO `region` VALUES (826, 17, 'Charo');
INSERT INTO `region` VALUES (827, 17, 'Chavinda');
INSERT INTO `region` VALUES (828, 17, 'Cherán');
INSERT INTO `region` VALUES (829, 17, 'Chilchota');
INSERT INTO `region` VALUES (830, 17, 'Chinicuila');
INSERT INTO `region` VALUES (831, 17, 'Chucándiro');
INSERT INTO `region` VALUES (832, 17, 'Churintzio');
INSERT INTO `region` VALUES (833, 17, 'Churumuco');
INSERT INTO `region` VALUES (834, 17, 'Coahuayana');
INSERT INTO `region` VALUES (835, 17, 'Coalcomán de Vázquez Pallares');
INSERT INTO `region` VALUES (836, 17, 'Coeneo');
INSERT INTO `region` VALUES (837, 17, 'Cojumatlán de Régules');
INSERT INTO `region` VALUES (838, 17, 'Contepec');
INSERT INTO `region` VALUES (839, 17, 'Copándaro');
INSERT INTO `region` VALUES (840, 17, 'Cotija');
INSERT INTO `region` VALUES (841, 17, 'Cuitzeo');
INSERT INTO `region` VALUES (842, 17, 'Ecuandureo');
INSERT INTO `region` VALUES (843, 17, 'Epitacio Huerta');
INSERT INTO `region` VALUES (844, 17, 'Erongarícuaro');
INSERT INTO `region` VALUES (845, 17, 'Gabriel Zamora');
INSERT INTO `region` VALUES (846, 17, 'Hidalgo');
INSERT INTO `region` VALUES (847, 17, 'Huandacareo');
INSERT INTO `region` VALUES (848, 17, 'Huaniqueo');
INSERT INTO `region` VALUES (849, 17, 'Huetamo');
INSERT INTO `region` VALUES (850, 17, 'Huiramba');
INSERT INTO `region` VALUES (851, 17, 'Indaparapeo');
INSERT INTO `region` VALUES (852, 17, 'Irimbo');
INSERT INTO `region` VALUES (853, 17, 'Ixtlán');
INSERT INTO `region` VALUES (854, 17, 'Jacona');
INSERT INTO `region` VALUES (855, 17, 'Jiménez');
INSERT INTO `region` VALUES (856, 17, 'Jiquilpan');
INSERT INTO `region` VALUES (857, 17, 'José Sixto Verduzco');
INSERT INTO `region` VALUES (858, 17, 'Juárez');
INSERT INTO `region` VALUES (859, 17, 'Jungapeo');
INSERT INTO `region` VALUES (860, 17, 'La Huacana');
INSERT INTO `region` VALUES (861, 17, 'La Piedad');
INSERT INTO `region` VALUES (862, 17, 'Lagunillas');
INSERT INTO `region` VALUES (863, 17, 'Lázaro Cárdenas');
INSERT INTO `region` VALUES (864, 17, 'Los Reyes');
INSERT INTO `region` VALUES (865, 17, 'Madero');
INSERT INTO `region` VALUES (866, 17, 'Maravatío');
INSERT INTO `region` VALUES (867, 17, 'Marcos Castellanos');
INSERT INTO `region` VALUES (868, 17, 'Morelia');
INSERT INTO `region` VALUES (869, 17, 'Morelos');
INSERT INTO `region` VALUES (870, 17, 'Múgica');
INSERT INTO `region` VALUES (871, 17, 'Nahuatzen');
INSERT INTO `region` VALUES (872, 17, 'Nocupétaro');
INSERT INTO `region` VALUES (873, 17, 'Nuevo Parangaricutiro');
INSERT INTO `region` VALUES (874, 17, 'Nuevo Urecho');
INSERT INTO `region` VALUES (875, 17, 'Numarán');
INSERT INTO `region` VALUES (876, 17, 'Ocampo');
INSERT INTO `region` VALUES (877, 17, 'Pajacuarán');
INSERT INTO `region` VALUES (878, 17, 'Panindícuaro');
INSERT INTO `region` VALUES (879, 17, 'Paracho');
INSERT INTO `region` VALUES (880, 17, 'Parácuaro');
INSERT INTO `region` VALUES (881, 17, 'Pátzcuaro');
INSERT INTO `region` VALUES (882, 17, 'Penjamillo');
INSERT INTO `region` VALUES (883, 17, 'Peribán');
INSERT INTO `region` VALUES (884, 17, 'Purépero');
INSERT INTO `region` VALUES (885, 17, 'Puruándiro');
INSERT INTO `region` VALUES (886, 17, 'Queréndaro');
INSERT INTO `region` VALUES (887, 17, 'Quiroga');
INSERT INTO `region` VALUES (888, 17, 'Sahuayo');
INSERT INTO `region` VALUES (889, 17, 'Salvador Escalante');
INSERT INTO `region` VALUES (890, 17, 'San Lucas');
INSERT INTO `region` VALUES (891, 17, 'Santa Ana Maya');
INSERT INTO `region` VALUES (892, 17, 'Senguio');
INSERT INTO `region` VALUES (893, 17, 'Susupuato');
INSERT INTO `region` VALUES (894, 17, 'Tacámbaro');
INSERT INTO `region` VALUES (895, 17, 'Tancítaro');
INSERT INTO `region` VALUES (896, 17, 'Tangamandapio');
INSERT INTO `region` VALUES (897, 17, 'Tangancícuaro');
INSERT INTO `region` VALUES (898, 17, 'Tanhuato');
INSERT INTO `region` VALUES (899, 17, 'Taretan');
INSERT INTO `region` VALUES (900, 17, 'Tarímbaro');
INSERT INTO `region` VALUES (901, 17, 'Tepalcatepec');
INSERT INTO `region` VALUES (902, 17, 'Tingüindín');
INSERT INTO `region` VALUES (903, 17, 'Tingambato');
INSERT INTO `region` VALUES (904, 17, 'Tiquicheo de Nicolás Romero');
INSERT INTO `region` VALUES (905, 17, 'Tlalpujahua');
INSERT INTO `region` VALUES (906, 17, 'Tlazazalca');
INSERT INTO `region` VALUES (907, 17, 'Tocumbo');
INSERT INTO `region` VALUES (908, 17, 'Tumbiscatío');
INSERT INTO `region` VALUES (909, 17, 'Turicato');
INSERT INTO `region` VALUES (910, 17, 'Tuxpan');
INSERT INTO `region` VALUES (911, 17, 'Tuzantla');
INSERT INTO `region` VALUES (912, 17, 'Tzintzuntzan');
INSERT INTO `region` VALUES (913, 17, 'Tzitzio');
INSERT INTO `region` VALUES (914, 17, 'Uruapan');
INSERT INTO `region` VALUES (915, 17, 'Venustiano Carranza');
INSERT INTO `region` VALUES (916, 17, 'Villamar');
INSERT INTO `region` VALUES (917, 17, 'Vista Hermosa');
INSERT INTO `region` VALUES (918, 17, 'Yurécuaro');
INSERT INTO `region` VALUES (919, 17, 'Zacapu');
INSERT INTO `region` VALUES (920, 17, 'Zamora');
INSERT INTO `region` VALUES (921, 17, 'Zináparo');
INSERT INTO `region` VALUES (922, 17, 'Zinapécuaro');
INSERT INTO `region` VALUES (923, 17, 'Ziracuaretiro');
INSERT INTO `region` VALUES (924, 17, 'Zitácuaro');
INSERT INTO `region` VALUES (925, 18, 'Amacuzac');
INSERT INTO `region` VALUES (926, 18, 'Atlatlahucan');
INSERT INTO `region` VALUES (927, 18, 'Axochiapan');
INSERT INTO `region` VALUES (928, 18, 'Ayala');
INSERT INTO `region` VALUES (929, 18, 'Coatlán del Río');
INSERT INTO `region` VALUES (930, 18, 'Cuautla');
INSERT INTO `region` VALUES (931, 18, 'Cuernavaca');
INSERT INTO `region` VALUES (932, 18, 'Emiliano Zapata');
INSERT INTO `region` VALUES (933, 18, 'Huitzilac');
INSERT INTO `region` VALUES (934, 18, 'Jantetelco');
INSERT INTO `region` VALUES (935, 18, 'Jiutepec');
INSERT INTO `region` VALUES (936, 18, 'Jojutla');
INSERT INTO `region` VALUES (937, 18, 'Jonacatepec');
INSERT INTO `region` VALUES (938, 18, 'Mazatepec');
INSERT INTO `region` VALUES (939, 18, 'Miacatlán');
INSERT INTO `region` VALUES (940, 18, 'Ocuituco');
INSERT INTO `region` VALUES (941, 18, 'Puente de Ixtla');
INSERT INTO `region` VALUES (942, 18, 'Temixco');
INSERT INTO `region` VALUES (943, 18, 'Temoac');
INSERT INTO `region` VALUES (944, 18, 'Tepalcingo');
INSERT INTO `region` VALUES (945, 18, 'Tepoztlán');
INSERT INTO `region` VALUES (946, 18, 'Tetecala');
INSERT INTO `region` VALUES (947, 18, 'Tetela del Volcán');
INSERT INTO `region` VALUES (948, 18, 'Tlalnepantla');
INSERT INTO `region` VALUES (949, 18, 'Tlaltizapán');
INSERT INTO `region` VALUES (950, 18, 'Tlaquiltenango');
INSERT INTO `region` VALUES (951, 18, 'Tlayacapan');
INSERT INTO `region` VALUES (952, 18, 'Totolapan');
INSERT INTO `region` VALUES (953, 18, 'Xochitepec');
INSERT INTO `region` VALUES (954, 18, 'Yautepec');
INSERT INTO `region` VALUES (955, 18, 'Yecapixtla');
INSERT INTO `region` VALUES (956, 18, 'Zacatepec de Hidalgo');
INSERT INTO `region` VALUES (957, 18, 'Zacualpan de Amilpas');
INSERT INTO `region` VALUES (958, 19, 'Acaponeta');
INSERT INTO `region` VALUES (959, 19, 'Ahuacatlán');
INSERT INTO `region` VALUES (960, 19, 'Amatlán de Cañas');
INSERT INTO `region` VALUES (961, 19, 'Bahía de Banderas');
INSERT INTO `region` VALUES (962, 19, 'Compostela');
INSERT INTO `region` VALUES (963, 19, 'Del Nayar');
INSERT INTO `region` VALUES (964, 19, 'Huajicori');
INSERT INTO `region` VALUES (965, 19, 'Ixtlán del Río');
INSERT INTO `region` VALUES (966, 19, 'Jala');
INSERT INTO `region` VALUES (967, 19, 'La Yesca');
INSERT INTO `region` VALUES (968, 19, 'Rosamorada');
INSERT INTO `region` VALUES (969, 19, 'Ruíz');
INSERT INTO `region` VALUES (970, 19, 'San Blas');
INSERT INTO `region` VALUES (971, 19, 'San Pedro Lagunillas');
INSERT INTO `region` VALUES (972, 19, 'Santa María del Oro');
INSERT INTO `region` VALUES (973, 19, 'Santiago Ixcuintla');
INSERT INTO `region` VALUES (974, 19, 'Tecuala');
INSERT INTO `region` VALUES (975, 19, 'Tepic');
INSERT INTO `region` VALUES (976, 19, 'Tuxpan');
INSERT INTO `region` VALUES (977, 19, 'Xalisco');
INSERT INTO `region` VALUES (978, 20, 'Abasolo');
INSERT INTO `region` VALUES (979, 20, 'Agualeguas');
INSERT INTO `region` VALUES (980, 20, 'Allende');
INSERT INTO `region` VALUES (981, 20, 'Anáhuac');
INSERT INTO `region` VALUES (982, 20, 'Apodaca');
INSERT INTO `region` VALUES (983, 20, 'Aramberri');
INSERT INTO `region` VALUES (984, 20, 'Bustamante');
INSERT INTO `region` VALUES (985, 20, 'Cadereyta Jiménez');
INSERT INTO `region` VALUES (986, 20, 'Carmen');
INSERT INTO `region` VALUES (987, 20, 'Cerralvo');
INSERT INTO `region` VALUES (988, 20, 'China');
INSERT INTO `region` VALUES (989, 20, 'Ciénega de Flores');
INSERT INTO `region` VALUES (990, 20, 'Dr. Coss');
INSERT INTO `region` VALUES (991, 20, 'Dr. Arroyo');
INSERT INTO `region` VALUES (992, 20, 'Dr. González');
INSERT INTO `region` VALUES (993, 20, 'Galeana');
INSERT INTO `region` VALUES (994, 20, 'García');
INSERT INTO `region` VALUES (995, 20, 'Gral. Escobedo');
INSERT INTO `region` VALUES (996, 20, 'Gral. Terán');
INSERT INTO `region` VALUES (997, 20, 'Gral. Treviño');
INSERT INTO `region` VALUES (998, 20, 'Gral. Zaragoza');
INSERT INTO `region` VALUES (999, 20, 'Gral. Zuazua');
INSERT INTO `region` VALUES (1000, 20, 'Gral. Bravo');
INSERT INTO `region` VALUES (1001, 20, 'Guadalupe');
INSERT INTO `region` VALUES (1002, 20, 'Hidalgo');
INSERT INTO `region` VALUES (1003, 20, 'Higueras');
INSERT INTO `region` VALUES (1004, 20, 'Hualahuises');
INSERT INTO `region` VALUES (1005, 20, 'Iturbide');
INSERT INTO `region` VALUES (1006, 20, 'Juárez');
INSERT INTO `region` VALUES (1007, 20, 'Lampazos de Naranjo');
INSERT INTO `region` VALUES (1008, 20, 'Linares');
INSERT INTO `region` VALUES (1009, 20, 'Los Aldamas');
INSERT INTO `region` VALUES (1010, 20, 'Los Herreras');
INSERT INTO `region` VALUES (1011, 20, 'Los Ramones');
INSERT INTO `region` VALUES (1012, 20, 'Marín');
INSERT INTO `region` VALUES (1013, 20, 'Melchor Ocampo');
INSERT INTO `region` VALUES (1014, 20, 'Mier y Noriega');
INSERT INTO `region` VALUES (1015, 20, 'Mina');
INSERT INTO `region` VALUES (1016, 20, 'Montemorelos');
INSERT INTO `region` VALUES (1017, 20, 'Monterrey');
INSERT INTO `region` VALUES (1018, 20, 'Parás');
INSERT INTO `region` VALUES (1019, 20, 'Pesquería');
INSERT INTO `region` VALUES (1020, 20, 'Rayones');
INSERT INTO `region` VALUES (1021, 20, 'Sabinas Hidalgo');
INSERT INTO `region` VALUES (1022, 20, 'Salinas Victoria');
INSERT INTO `region` VALUES (1023, 20, 'San Nicolás de los Garza');
INSERT INTO `region` VALUES (1024, 20, 'San Pedro Garza García');
INSERT INTO `region` VALUES (1025, 20, 'Santa Catarina');
INSERT INTO `region` VALUES (1026, 20, 'Santiago');
INSERT INTO `region` VALUES (1027, 20, 'Vallecillo');
INSERT INTO `region` VALUES (1028, 20, 'Villaldama');
INSERT INTO `region` VALUES (1029, 21, 'Abejones');
INSERT INTO `region` VALUES (1030, 21, 'Acatlán de Pérez Figueroa');
INSERT INTO `region` VALUES (1031, 21, 'Animas Trujano');
INSERT INTO `region` VALUES (1032, 21, 'Asunción Cacalotepec');
INSERT INTO `region` VALUES (1033, 21, 'Asunción Cuyotepeji');
INSERT INTO `region` VALUES (1034, 21, 'Asunción Ixtaltepec');
INSERT INTO `region` VALUES (1035, 21, 'Asunción Nochixtlán');
INSERT INTO `region` VALUES (1036, 21, 'Asunción Ocotlán');
INSERT INTO `region` VALUES (1037, 21, 'Asunción Tlacolulita');
INSERT INTO `region` VALUES (1038, 21, 'Ayoquezco de Aldama');
INSERT INTO `region` VALUES (1039, 21, 'Ayotzintepec');
INSERT INTO `region` VALUES (1040, 21, 'Calihualá');
INSERT INTO `region` VALUES (1041, 21, 'Candelaria Loxicha');
INSERT INTO `region` VALUES (1042, 21, 'Capulálpam de Méndez');
INSERT INTO `region` VALUES (1043, 21, 'Chahuites');
INSERT INTO `region` VALUES (1044, 21, 'Chalcatongo de Hidalgo');
INSERT INTO `region` VALUES (1045, 21, 'Chiquihuitlán de Benito Juárez');
INSERT INTO `region` VALUES (1046, 21, 'Ciénega de Zimatlán');
INSERT INTO `region` VALUES (1047, 21, 'Ciudad Ixtepec');
INSERT INTO `region` VALUES (1048, 21, 'Coatecas Altas');
INSERT INTO `region` VALUES (1049, 21, 'Coicoyán de las Flores');
INSERT INTO `region` VALUES (1050, 21, 'Concepción Buenavista');
INSERT INTO `region` VALUES (1051, 21, 'Concepción Pápalo');
INSERT INTO `region` VALUES (1052, 21, 'Constancia del Rosario');
INSERT INTO `region` VALUES (1053, 21, 'Cosolapa');
INSERT INTO `region` VALUES (1054, 21, 'Cosoltepec');
INSERT INTO `region` VALUES (1055, 21, 'Cuilápam de Guerrero');
INSERT INTO `region` VALUES (1056, 21, 'Cuyamecalco Villa de Zaragoza');
INSERT INTO `region` VALUES (1057, 21, 'El Barrio de la Soledad');
INSERT INTO `region` VALUES (1058, 21, 'El Espinal');
INSERT INTO `region` VALUES (1059, 21, 'Eloxochitlán de Flores Magón');
INSERT INTO `region` VALUES (1060, 21, 'Fresnillo de Trujano');
INSERT INTO `region` VALUES (1061, 21, 'Guadalupe de Ramírez');
INSERT INTO `region` VALUES (1062, 21, 'Guadalupe Etla');
INSERT INTO `region` VALUES (1063, 21, 'Guelatao de Juárez');
INSERT INTO `region` VALUES (1064, 21, 'Guevea de Humboldt');
INSERT INTO `region` VALUES (1065, 21, 'Heroica Ciudad de Ejutla de Crespo');
INSERT INTO `region` VALUES (1066, 21, 'Heroica Ciudad de Huajuapan de Leó');
INSERT INTO `region` VALUES (1067, 21, 'Heroica Ciudad de Tlaxiaco');
INSERT INTO `region` VALUES (1068, 21, 'Huautepec');
INSERT INTO `region` VALUES (1069, 21, 'Huautla de Jiménez');
INSERT INTO `region` VALUES (1070, 21, 'Ixpantepec Nieves');
INSERT INTO `region` VALUES (1071, 21, 'Ixtlán de Juárez');
INSERT INTO `region` VALUES (1072, 21, 'Juchitán de Zaragoza');
INSERT INTO `region` VALUES (1073, 21, 'La Compañía');
INSERT INTO `region` VALUES (1074, 21, 'La Pe');
INSERT INTO `region` VALUES (1075, 21, 'La Reforma');
INSERT INTO `region` VALUES (1076, 21, 'La Trinidad Vista Hermosa');
INSERT INTO `region` VALUES (1077, 21, 'Loma Bonita');
INSERT INTO `region` VALUES (1078, 21, 'Magdalena Apasco');
INSERT INTO `region` VALUES (1079, 21, 'Magdalena Jaltepec');
INSERT INTO `region` VALUES (1080, 21, 'Magdalena Mixtepec');
INSERT INTO `region` VALUES (1081, 21, 'Magdalena Ocotlán');
INSERT INTO `region` VALUES (1082, 21, 'Magdalena Peñasco');
INSERT INTO `region` VALUES (1083, 21, 'Magdalena Teitipac');
INSERT INTO `region` VALUES (1084, 21, 'Magdalena Tequisistlán');
INSERT INTO `region` VALUES (1085, 21, 'Magdalena Tlacotepec');
INSERT INTO `region` VALUES (1086, 21, 'Magdalena Yodocono de Porfirio Día');
INSERT INTO `region` VALUES (1087, 21, 'Magdalena Zahuatlán');
INSERT INTO `region` VALUES (1088, 21, 'Mariscala de Juárez');
INSERT INTO `region` VALUES (1089, 21, 'Mártires de Tacubaya');
INSERT INTO `region` VALUES (1090, 21, 'Matías Romero Avendaño');
INSERT INTO `region` VALUES (1091, 21, 'Mazatlán Villa de Flores');
INSERT INTO `region` VALUES (1092, 21, 'Mesones Hidalgo');
INSERT INTO `region` VALUES (1093, 21, 'Miahuatlán de Porfirio Díaz');
INSERT INTO `region` VALUES (1094, 21, 'Mixistlán de la Reforma');
INSERT INTO `region` VALUES (1095, 21, 'Monjas');
INSERT INTO `region` VALUES (1096, 21, 'Natividad');
INSERT INTO `region` VALUES (1097, 21, 'Nazareno Etla');
INSERT INTO `region` VALUES (1098, 21, 'Nejapa de Madero');
INSERT INTO `region` VALUES (1099, 21, 'Nuevo Zoquiapam');
INSERT INTO `region` VALUES (1100, 21, 'Oaxaca de Juárez');
INSERT INTO `region` VALUES (1101, 21, 'Ocotlán de Morelos');
INSERT INTO `region` VALUES (1102, 21, 'Pinotepa de Don Luis');
INSERT INTO `region` VALUES (1103, 21, 'Pluma Hidalgo');
INSERT INTO `region` VALUES (1104, 21, 'Putla Villa de Guerrero');
INSERT INTO `region` VALUES (1105, 21, 'Reforma de Pineda');
INSERT INTO `region` VALUES (1106, 21, 'Reyes Etla');
INSERT INTO `region` VALUES (1107, 21, 'Rojas de Cuauhtémoc');
INSERT INTO `region` VALUES (1108, 21, 'Salina Cruz');
INSERT INTO `region` VALUES (1109, 21, 'San Agustín Amatengo');
INSERT INTO `region` VALUES (1110, 21, 'San Agustín Atenango');
INSERT INTO `region` VALUES (1111, 21, 'San Agustín Chayuco');
INSERT INTO `region` VALUES (1112, 21, 'San Agustín de las Juntas');
INSERT INTO `region` VALUES (1113, 21, 'San Agustín Etla');
INSERT INTO `region` VALUES (1114, 21, 'San Agustín Loxicha');
INSERT INTO `region` VALUES (1115, 21, 'San Agustín Tlacotepec');
INSERT INTO `region` VALUES (1116, 21, 'San Agustín Yatareni');
INSERT INTO `region` VALUES (1117, 21, 'San Andrés Cabecera Nueva');
INSERT INTO `region` VALUES (1118, 21, 'San Andrés Dinicuiti');
INSERT INTO `region` VALUES (1119, 21, 'San Andrés Huaxpaltepec');
INSERT INTO `region` VALUES (1120, 21, 'San Andrés Huayapam');
INSERT INTO `region` VALUES (1121, 21, 'San Andrés Ixtlahuaca');
INSERT INTO `region` VALUES (1122, 21, 'San Andrés Lagunas');
INSERT INTO `region` VALUES (1123, 21, 'San Andrés Nuxiño');
INSERT INTO `region` VALUES (1124, 21, 'San Andrés Paxtlán');
INSERT INTO `region` VALUES (1125, 21, 'San Andrés Sinaxtla');
INSERT INTO `region` VALUES (1126, 21, 'San Andrés Solaga');
INSERT INTO `region` VALUES (1127, 21, 'San Andrés Teotilalpam');
INSERT INTO `region` VALUES (1128, 21, 'San Andrés Tepetlapa');
INSERT INTO `region` VALUES (1129, 21, 'San Andrés Yaá');
INSERT INTO `region` VALUES (1130, 21, 'San Andrés Zabache');
INSERT INTO `region` VALUES (1131, 21, 'San Andrés Zautla');
INSERT INTO `region` VALUES (1132, 21, 'San Antonino Castillo Velasco');
INSERT INTO `region` VALUES (1133, 21, 'San Antonino el Alto');
INSERT INTO `region` VALUES (1134, 21, 'San Antonino Monte Verde');
INSERT INTO `region` VALUES (1135, 21, 'San Antonio Acutla');
INSERT INTO `region` VALUES (1136, 21, 'San Antonio de la Cal');
INSERT INTO `region` VALUES (1137, 21, 'San Antonio Huitepec');
INSERT INTO `region` VALUES (1138, 21, 'San Antonio Nanahuatípam');
INSERT INTO `region` VALUES (1139, 21, 'San Antonio Sinicahua');
INSERT INTO `region` VALUES (1140, 21, 'San Antonio Tepetlapa');
INSERT INTO `region` VALUES (1141, 21, 'San Baltazar Chichicápam');
INSERT INTO `region` VALUES (1142, 21, 'San Baltazar Loxicha');
INSERT INTO `region` VALUES (1143, 21, 'San Baltazar Yatzachi el Bajo');
INSERT INTO `region` VALUES (1144, 21, 'San Bartolo Coyotepec');
INSERT INTO `region` VALUES (1145, 21, 'San Bartolo Soyaltepec');
INSERT INTO `region` VALUES (1146, 21, 'San Bartolo Yautepec');
INSERT INTO `region` VALUES (1147, 21, 'San Bartolomé Ayautla');
INSERT INTO `region` VALUES (1148, 21, 'San Bartolomé Loxicha');
INSERT INTO `region` VALUES (1149, 21, 'San Bartolomé Quialana');
INSERT INTO `region` VALUES (1150, 21, 'San Bartolomé Yucuañe');
INSERT INTO `region` VALUES (1151, 21, 'San Bartolomé Zoogocho');
INSERT INTO `region` VALUES (1152, 21, 'San Bernardo Mixtepec');
INSERT INTO `region` VALUES (1153, 21, 'San Blas Atempa');
INSERT INTO `region` VALUES (1154, 21, 'San Carlos Yautepec');
INSERT INTO `region` VALUES (1155, 21, 'San Cristóbal Amatlán');
INSERT INTO `region` VALUES (1156, 21, 'San Cristóbal Amoltepec');
INSERT INTO `region` VALUES (1157, 21, 'San Cristóbal Lachirioag');
INSERT INTO `region` VALUES (1158, 21, 'San Cristóbal Suchixtlahuaca');
INSERT INTO `region` VALUES (1159, 21, 'San Dionisio del Mar');
INSERT INTO `region` VALUES (1160, 21, 'San Dionisio Ocotepec');
INSERT INTO `region` VALUES (1161, 21, 'San Dionisio Ocotlán');
INSERT INTO `region` VALUES (1162, 21, 'San Esteban Atatlahuca');
INSERT INTO `region` VALUES (1163, 21, 'San Felipe Jalapa de Díaz');
INSERT INTO `region` VALUES (1164, 21, 'San Felipe Tejalapam');
INSERT INTO `region` VALUES (1165, 21, 'San Felipe Usila');
INSERT INTO `region` VALUES (1166, 21, 'San Francisco Cahuacuá');
INSERT INTO `region` VALUES (1167, 21, 'San Francisco Cajonos');
INSERT INTO `region` VALUES (1168, 21, 'San Francisco Chapulapa');
INSERT INTO `region` VALUES (1169, 21, 'San Francisco Chindúa');
INSERT INTO `region` VALUES (1170, 21, 'San Francisco del Mar');
INSERT INTO `region` VALUES (1171, 21, 'San Francisco Huehuetlán');
INSERT INTO `region` VALUES (1172, 21, 'San Francisco Ixhuatán');
INSERT INTO `region` VALUES (1173, 21, 'San Francisco Jaltepetongo');
INSERT INTO `region` VALUES (1174, 21, 'San Francisco Lachigoló');
INSERT INTO `region` VALUES (1175, 21, 'San Francisco Logueche');
INSERT INTO `region` VALUES (1176, 21, 'San Francisco Nuxaño');
INSERT INTO `region` VALUES (1177, 21, 'San Francisco Ozolotepec');
INSERT INTO `region` VALUES (1178, 21, 'San Francisco Sola');
INSERT INTO `region` VALUES (1179, 21, 'San Francisco Telixtlahuaca');
INSERT INTO `region` VALUES (1180, 21, 'San Francisco Teopan');
INSERT INTO `region` VALUES (1181, 21, 'San Francisco Tlapancingo');
INSERT INTO `region` VALUES (1182, 21, 'San Gabriel Mixtepec');
INSERT INTO `region` VALUES (1183, 21, 'San Ildefonso Amatlán');
INSERT INTO `region` VALUES (1184, 21, 'San Ildefonso Sola');
INSERT INTO `region` VALUES (1185, 21, 'San Ildefonso Villa Alta');
INSERT INTO `region` VALUES (1186, 21, 'San Jacinto Amilpas');
INSERT INTO `region` VALUES (1187, 21, 'San Jacinto Tlacotepec');
INSERT INTO `region` VALUES (1188, 21, 'San Jerónimo Coatlán');
INSERT INTO `region` VALUES (1189, 21, 'San Jerónimo Silacayoapilla');
INSERT INTO `region` VALUES (1190, 21, 'San Jerónimo Sosola');
INSERT INTO `region` VALUES (1191, 21, 'San Jerónimo Taviche');
INSERT INTO `region` VALUES (1192, 21, 'San Jerónimo Tecoátl');
INSERT INTO `region` VALUES (1193, 21, 'San Jerónimo Tlacochahuaya');
INSERT INTO `region` VALUES (1194, 21, 'San Jorge Nuchita');
INSERT INTO `region` VALUES (1195, 21, 'San José Ayuquila');
INSERT INTO `region` VALUES (1196, 21, 'San José Chiltepec');
INSERT INTO `region` VALUES (1197, 21, 'San José del Peñasco');
INSERT INTO `region` VALUES (1198, 21, 'San José del Progreso');
INSERT INTO `region` VALUES (1199, 21, 'San José Estancia Grande');
INSERT INTO `region` VALUES (1200, 21, 'San José Independencia');
INSERT INTO `region` VALUES (1201, 21, 'San José Lachiguiri');
INSERT INTO `region` VALUES (1202, 21, 'San José Tenango');
INSERT INTO `region` VALUES (1203, 21, 'San Juan Áumí');
INSERT INTO `region` VALUES (1204, 21, 'San Juan Achiutla');
INSERT INTO `region` VALUES (1205, 21, 'San Juan Atepec');
INSERT INTO `region` VALUES (1206, 21, 'San Juan Bautista Atatlahuca');
INSERT INTO `region` VALUES (1207, 21, 'San Juan Bautista Coixtlahuaca');
INSERT INTO `region` VALUES (1208, 21, 'San Juan Bautista Cuicatlán');
INSERT INTO `region` VALUES (1209, 21, 'San Juan Bautista Guelache');
INSERT INTO `region` VALUES (1210, 21, 'San Juan Bautista Jayacatlán');
INSERT INTO `region` VALUES (1211, 21, 'San Juan Bautista Lo de Soto');
INSERT INTO `region` VALUES (1212, 21, 'San Juan Bautista Suchitepec');
INSERT INTO `region` VALUES (1213, 21, 'San Juan Bautista Tlachichilco');
INSERT INTO `region` VALUES (1214, 21, 'San Juan Bautista Tlacoatzintepec');
INSERT INTO `region` VALUES (1215, 21, 'San Juan Bautista Tuxtepec');
INSERT INTO `region` VALUES (1216, 21, 'San Juan Bautista Valle Nacional');
INSERT INTO `region` VALUES (1217, 21, 'San Juan Cacahuatepec');
INSERT INTO `region` VALUES (1218, 21, 'San Juan Chicomezúchil');
INSERT INTO `region` VALUES (1219, 21, 'San Juan Chilateca');
INSERT INTO `region` VALUES (1220, 21, 'San Juan Cieneguilla');
INSERT INTO `region` VALUES (1221, 21, 'San Juan Coatzóspam');
INSERT INTO `region` VALUES (1222, 21, 'San Juan Colorado');
INSERT INTO `region` VALUES (1223, 21, 'San Juan Comaltepec');
INSERT INTO `region` VALUES (1224, 21, 'San Juan Cotzocón');
INSERT INTO `region` VALUES (1225, 21, 'San Juan de los Cués');
INSERT INTO `region` VALUES (1226, 21, 'San Juan del Estado');
INSERT INTO `region` VALUES (1227, 21, 'San Juan del Río');
INSERT INTO `region` VALUES (1228, 21, 'San Juan Diuxi');
INSERT INTO `region` VALUES (1229, 21, 'San Juan Evangelista Analco');
INSERT INTO `region` VALUES (1230, 21, 'San Juan Guelavía');
INSERT INTO `region` VALUES (1231, 21, 'San Juan Guichicovi');
INSERT INTO `region` VALUES (1232, 21, 'San Juan Ihualtepec');
INSERT INTO `region` VALUES (1233, 21, 'San Juan Juquila Mixes');
INSERT INTO `region` VALUES (1234, 21, 'San Juan Juquila Vijanos');
INSERT INTO `region` VALUES (1235, 21, 'San Juan Lachao');
INSERT INTO `region` VALUES (1236, 21, 'San Juan Lachigalla');
INSERT INTO `region` VALUES (1237, 21, 'San Juan Lajarcia');
INSERT INTO `region` VALUES (1238, 21, 'San Juan Lalana');
INSERT INTO `region` VALUES (1239, 21, 'San Juan Mazatlán');
INSERT INTO `region` VALUES (1240, 21, 'San Juan Mixtepec');
INSERT INTO `region` VALUES (1241, 21, 'San Juan Mixtepec');
INSERT INTO `region` VALUES (1242, 21, 'San Juan Ozolotepec');
INSERT INTO `region` VALUES (1243, 21, 'San Juan Petlapa');
INSERT INTO `region` VALUES (1244, 21, 'San Juan Quiahije');
INSERT INTO `region` VALUES (1245, 21, 'San Juan Quiotepec');
INSERT INTO `region` VALUES (1246, 21, 'San Juan Sayultepec');
INSERT INTO `region` VALUES (1247, 21, 'San Juan Tabaá');
INSERT INTO `region` VALUES (1248, 21, 'San Juan Tamazola');
INSERT INTO `region` VALUES (1249, 21, 'San Juan Teita');
INSERT INTO `region` VALUES (1250, 21, 'San Juan Teitipac');
INSERT INTO `region` VALUES (1251, 21, 'San Juan Tepeuxila');
INSERT INTO `region` VALUES (1252, 21, 'San Juan Teposcolula');
INSERT INTO `region` VALUES (1253, 21, 'San Juan Yaeé');
INSERT INTO `region` VALUES (1254, 21, 'San Juan Yatzona');
INSERT INTO `region` VALUES (1255, 21, 'San Juan Yucuita');
INSERT INTO `region` VALUES (1256, 21, 'San Lorenzo');
INSERT INTO `region` VALUES (1257, 21, 'San Lorenzo Albarradas');
INSERT INTO `region` VALUES (1258, 21, 'San Lorenzo Cacaotepec');
INSERT INTO `region` VALUES (1259, 21, 'San Lorenzo Cuaunecuiltitla');
INSERT INTO `region` VALUES (1260, 21, 'San Lorenzo Texmelucan');
INSERT INTO `region` VALUES (1261, 21, 'San Lorenzo Victoria');
INSERT INTO `region` VALUES (1262, 21, 'San Lucas Camotlán');
INSERT INTO `region` VALUES (1263, 21, 'San Lucas Ojitlán');
INSERT INTO `region` VALUES (1264, 21, 'San Lucas Quiaviní');
INSERT INTO `region` VALUES (1265, 21, 'San Lucas Zoquiápam');
INSERT INTO `region` VALUES (1266, 21, 'San Luis Amatlán');
INSERT INTO `region` VALUES (1267, 21, 'San Marcial Ozolotepec');
INSERT INTO `region` VALUES (1268, 21, 'San Marcos Arteaga');
INSERT INTO `region` VALUES (1269, 21, 'San Martín de los Cansecos');
INSERT INTO `region` VALUES (1270, 21, 'San Martín Huamelúlpam');
INSERT INTO `region` VALUES (1271, 21, 'San Martín Itunyoso');
INSERT INTO `region` VALUES (1272, 21, 'San Martín Lachilá');
INSERT INTO `region` VALUES (1273, 21, 'San Martín Peras');
INSERT INTO `region` VALUES (1274, 21, 'San Martín Tilcajete');
INSERT INTO `region` VALUES (1275, 21, 'San Martín Toxpalan');
INSERT INTO `region` VALUES (1276, 21, 'San Martín Zacatepec');
INSERT INTO `region` VALUES (1277, 21, 'San Mateo Cajonos');
INSERT INTO `region` VALUES (1278, 21, 'San Mateo del Mar');
INSERT INTO `region` VALUES (1279, 21, 'San Mateo Etlatongo');
INSERT INTO `region` VALUES (1280, 21, 'San Mateo Nejápam');
INSERT INTO `region` VALUES (1281, 21, 'San Mateo Peñasco');
INSERT INTO `region` VALUES (1282, 21, 'San Mateo Piñas');
INSERT INTO `region` VALUES (1283, 21, 'San Mateo Río Hondo');
INSERT INTO `region` VALUES (1284, 21, 'San Mateo Sindihui');
INSERT INTO `region` VALUES (1285, 21, 'San Mateo Tlapiltepec');
INSERT INTO `region` VALUES (1286, 21, 'San Mateo Yoloxochitlán');
INSERT INTO `region` VALUES (1287, 21, 'San Melchor Betaza');
INSERT INTO `region` VALUES (1288, 21, 'San Miguel Achiutla');
INSERT INTO `region` VALUES (1289, 21, 'San Miguel Ahuehuetitlán');
INSERT INTO `region` VALUES (1290, 21, 'San Miguel Aloápam');
INSERT INTO `region` VALUES (1291, 21, 'San Miguel Amatitlán');
INSERT INTO `region` VALUES (1292, 21, 'San Miguel Amatlán');
INSERT INTO `region` VALUES (1293, 21, 'San Miguel Chicahua');
INSERT INTO `region` VALUES (1294, 21, 'San Miguel Chimalapa');
INSERT INTO `region` VALUES (1295, 21, 'San Miguel Coatlán');
INSERT INTO `region` VALUES (1296, 21, 'San Miguel del Puerto');
INSERT INTO `region` VALUES (1297, 21, 'San Miguel del Río');
INSERT INTO `region` VALUES (1298, 21, 'San Miguel Ejutla');
INSERT INTO `region` VALUES (1299, 21, 'San Miguel el Grande');
INSERT INTO `region` VALUES (1300, 21, 'San Miguel Huautla');
INSERT INTO `region` VALUES (1301, 21, 'San Miguel Mixtepec');
INSERT INTO `region` VALUES (1302, 21, 'San Miguel Panixtlahuaca');
INSERT INTO `region` VALUES (1303, 21, 'San Miguel Peras');
INSERT INTO `region` VALUES (1304, 21, 'San Miguel Piedras');
INSERT INTO `region` VALUES (1305, 21, 'San Miguel Quetzaltepec');
INSERT INTO `region` VALUES (1306, 21, 'San Miguel Santa Flor');
INSERT INTO `region` VALUES (1307, 21, 'San Miguel Soyaltepec');
INSERT INTO `region` VALUES (1308, 21, 'San Miguel Suchixtepec');
INSERT INTO `region` VALUES (1309, 21, 'San Miguel Tecomatlán');
INSERT INTO `region` VALUES (1310, 21, 'San Miguel Tenango');
INSERT INTO `region` VALUES (1311, 21, 'San Miguel Tequixtepec');
INSERT INTO `region` VALUES (1312, 21, 'San Miguel Tilquiápam');
INSERT INTO `region` VALUES (1313, 21, 'San Miguel Tlacamama');
INSERT INTO `region` VALUES (1314, 21, 'San Miguel Tlacotepec');
INSERT INTO `region` VALUES (1315, 21, 'San Miguel Tulancingo');
INSERT INTO `region` VALUES (1316, 21, 'San Miguel Yotao');
INSERT INTO `region` VALUES (1317, 21, 'San Nicolás');
INSERT INTO `region` VALUES (1318, 21, 'San Nicolás Hidalgo');
INSERT INTO `region` VALUES (1319, 21, 'San Pablo Coatlán');
INSERT INTO `region` VALUES (1320, 21, 'San Pablo Cuatro Venados');
INSERT INTO `region` VALUES (1321, 21, 'San Pablo Etla');
INSERT INTO `region` VALUES (1322, 21, 'San Pablo Huitzo');
INSERT INTO `region` VALUES (1323, 21, 'San Pablo Huixtepec');
INSERT INTO `region` VALUES (1324, 21, 'San Pablo Macuiltianguis');
INSERT INTO `region` VALUES (1325, 21, 'San Pablo Tijaltepec');
INSERT INTO `region` VALUES (1326, 21, 'San Pablo Villa de Mitla');
INSERT INTO `region` VALUES (1327, 21, 'San Pablo Yaganiza');
INSERT INTO `region` VALUES (1328, 21, 'San Pedro Amuzgos');
INSERT INTO `region` VALUES (1329, 21, 'San Pedro Apóstol');
INSERT INTO `region` VALUES (1330, 21, 'San Pedro Atoyac');
INSERT INTO `region` VALUES (1331, 21, 'San Pedro Cajonos');
INSERT INTO `region` VALUES (1332, 21, 'San Pedro Comitancillo');
INSERT INTO `region` VALUES (1333, 21, 'San Pedro Coxcaltepec Cántaros');
INSERT INTO `region` VALUES (1334, 21, 'San Pedro el Alto');
INSERT INTO `region` VALUES (1335, 21, 'San Pedro Huamelula');
INSERT INTO `region` VALUES (1336, 21, 'San Pedro Huilotepec');
INSERT INTO `region` VALUES (1337, 21, 'San Pedro Ixcatlán');
INSERT INTO `region` VALUES (1338, 21, 'San Pedro Ixtlahuaca');
INSERT INTO `region` VALUES (1339, 21, 'San Pedro Jaltepetongo');
INSERT INTO `region` VALUES (1340, 21, 'San Pedro Jicayán');
INSERT INTO `region` VALUES (1341, 21, 'San Pedro Jocotipac');
INSERT INTO `region` VALUES (1342, 21, 'San Pedro Juchatengo');
INSERT INTO `region` VALUES (1343, 21, 'San Pedro Mártir');
INSERT INTO `region` VALUES (1344, 21, 'San Pedro Mártir Quiechapa');
INSERT INTO `region` VALUES (1345, 21, 'San Pedro Mártir Yucuxaco');
INSERT INTO `region` VALUES (1346, 21, 'San Pedro Mixtepec');
INSERT INTO `region` VALUES (1347, 21, 'San Pedro Mixtepec');
INSERT INTO `region` VALUES (1348, 21, 'San Pedro Molinos');
INSERT INTO `region` VALUES (1349, 21, 'San Pedro Nopala');
INSERT INTO `region` VALUES (1350, 21, 'San Pedro Ocopetatillo');
INSERT INTO `region` VALUES (1351, 21, 'San Pedro Ocotepec');
INSERT INTO `region` VALUES (1352, 21, 'San Pedro Pochutla');
INSERT INTO `region` VALUES (1353, 21, 'San Pedro Quiatoni');
INSERT INTO `region` VALUES (1354, 21, 'San Pedro Sochiapam');
INSERT INTO `region` VALUES (1355, 21, 'San Pedro Tapanatepec');
INSERT INTO `region` VALUES (1356, 21, 'San Pedro Taviche');
INSERT INTO `region` VALUES (1357, 21, 'San Pedro Teozacoalco');
INSERT INTO `region` VALUES (1358, 21, 'San Pedro Teutila');
INSERT INTO `region` VALUES (1359, 21, 'San Pedro Tidaá');
INSERT INTO `region` VALUES (1360, 21, 'San Pedro Topiltepec');
INSERT INTO `region` VALUES (1361, 21, 'San Pedro Totolapa');
INSERT INTO `region` VALUES (1362, 21, 'San Pedro y San Pablo Ayutla');
INSERT INTO `region` VALUES (1363, 21, 'San Pedro y San Pablo Teposcolula');
INSERT INTO `region` VALUES (1364, 21, 'San Pedro y San Pablo Tequixtepec');
INSERT INTO `region` VALUES (1365, 21, 'San Pedro Yaneri');
INSERT INTO `region` VALUES (1366, 21, 'San Pedro Yólox');
INSERT INTO `region` VALUES (1367, 21, 'San Pedro Yucunama');
INSERT INTO `region` VALUES (1368, 21, 'San Raymundo Jalpan');
INSERT INTO `region` VALUES (1369, 21, 'San Sebastián Abasolo');
INSERT INTO `region` VALUES (1370, 21, 'San Sebastián Coatlán');
INSERT INTO `region` VALUES (1371, 21, 'San Sebastián Ixcapa');
INSERT INTO `region` VALUES (1372, 21, 'San Sebastián Nicananduta');
INSERT INTO `region` VALUES (1373, 21, 'San Sebastián Río Hondo');
INSERT INTO `region` VALUES (1374, 21, 'San Sebastián Tecomaxtlahuaca');
INSERT INTO `region` VALUES (1375, 21, 'San Sebastián Teitipac');
INSERT INTO `region` VALUES (1376, 21, 'San Sebastián Tutla');
INSERT INTO `region` VALUES (1377, 21, 'San Simón Almolongas');
INSERT INTO `region` VALUES (1378, 21, 'San Simón Zahuatlán');
INSERT INTO `region` VALUES (1379, 21, 'San Vicente Coatlán');
INSERT INTO `region` VALUES (1380, 21, 'San Vicente Lachixío');
INSERT INTO `region` VALUES (1381, 21, 'San Vicente Nuñú');
INSERT INTO `region` VALUES (1382, 21, 'Santa Ana');
INSERT INTO `region` VALUES (1383, 21, 'Santa Ana Ateixtlahuaca');
INSERT INTO `region` VALUES (1384, 21, 'Santa Ana Cuauhtémoc');
INSERT INTO `region` VALUES (1385, 21, 'Santa Ana del Valle');
INSERT INTO `region` VALUES (1386, 21, 'Santa Ana Tavela');
INSERT INTO `region` VALUES (1387, 21, 'Santa Ana Tlapacoyan');
INSERT INTO `region` VALUES (1388, 21, 'Santa Ana Yareni');
INSERT INTO `region` VALUES (1389, 21, 'Santa Ana Zegache');
INSERT INTO `region` VALUES (1390, 21, 'Santa Catalina Quierí');
INSERT INTO `region` VALUES (1391, 21, 'Santa Catarina Cuixtla');
INSERT INTO `region` VALUES (1392, 21, 'Santa Catarina Ixtepeji');
INSERT INTO `region` VALUES (1393, 21, 'Santa Catarina Juquila');
INSERT INTO `region` VALUES (1394, 21, 'Santa Catarina Lachatao');
INSERT INTO `region` VALUES (1395, 21, 'Santa Catarina Loxicha');
INSERT INTO `region` VALUES (1396, 21, 'Santa Catarina Mechoacán');
INSERT INTO `region` VALUES (1397, 21, 'Santa Catarina Minas');
INSERT INTO `region` VALUES (1398, 21, 'Santa Catarina Quiané');
INSERT INTO `region` VALUES (1399, 21, 'Santa Catarina Quioquitani');
INSERT INTO `region` VALUES (1400, 21, 'Santa Catarina Tayata');
INSERT INTO `region` VALUES (1401, 21, 'Santa Catarina Ticuá');
INSERT INTO `region` VALUES (1402, 21, 'Santa Catarina Yosonotú');
INSERT INTO `region` VALUES (1403, 21, 'Santa Catarina Zapoquila');
INSERT INTO `region` VALUES (1404, 21, 'Santa Cruz Acatepec');
INSERT INTO `region` VALUES (1405, 21, 'Santa Cruz Amilpas');
INSERT INTO `region` VALUES (1406, 21, 'Santa Cruz de Bravo');
INSERT INTO `region` VALUES (1407, 21, 'Santa Cruz Itundujia');
INSERT INTO `region` VALUES (1408, 21, 'Santa Cruz Mixtepec');
INSERT INTO `region` VALUES (1409, 21, 'Santa Cruz Nundaco');
INSERT INTO `region` VALUES (1410, 21, 'Santa Cruz Papalutla');
INSERT INTO `region` VALUES (1411, 21, 'Santa Cruz Tacache de Mina');
INSERT INTO `region` VALUES (1412, 21, 'Santa Cruz Tacahua');
INSERT INTO `region` VALUES (1413, 21, 'Santa Cruz Tayata');
INSERT INTO `region` VALUES (1414, 21, 'Santa Cruz Xitla');
INSERT INTO `region` VALUES (1415, 21, 'Santa Cruz Xoxocotlán');
INSERT INTO `region` VALUES (1416, 21, 'Santa Cruz Zenzontepec');
INSERT INTO `region` VALUES (1417, 21, 'Santa Gertrudis');
INSERT INTO `region` VALUES (1418, 21, 'Santa Inés de Zaragoza');
INSERT INTO `region` VALUES (1419, 21, 'Santa Inés del Monte');
INSERT INTO `region` VALUES (1420, 21, 'Santa Inés Yatzeche');
INSERT INTO `region` VALUES (1421, 21, 'Santa Lucía del Camino');
INSERT INTO `region` VALUES (1422, 21, 'Santa Lucía Miahuatlán');
INSERT INTO `region` VALUES (1423, 21, 'Santa Lucía Monteverde');
INSERT INTO `region` VALUES (1424, 21, 'Santa Lucía Ocotlán');
INSERT INTO `region` VALUES (1425, 21, 'Santa Magdalena Jicotlán');
INSERT INTO `region` VALUES (1426, 21, 'Santa María Alotepec');
INSERT INTO `region` VALUES (1427, 21, 'Santa María Apazco');
INSERT INTO `region` VALUES (1428, 21, 'Santa María Atzompa');
INSERT INTO `region` VALUES (1429, 21, 'Santa María Camotlán');
INSERT INTO `region` VALUES (1430, 21, 'Santa María Chachoápam');
INSERT INTO `region` VALUES (1431, 21, 'Santa María Chilchotla');
INSERT INTO `region` VALUES (1432, 21, 'Santa María Chimalapa');
INSERT INTO `region` VALUES (1433, 21, 'Santa María Colotepec');
INSERT INTO `region` VALUES (1434, 21, 'Santa María Cortijo');
INSERT INTO `region` VALUES (1435, 21, 'Santa María Coyotepec');
INSERT INTO `region` VALUES (1436, 21, 'Santa María del Rosario');
INSERT INTO `region` VALUES (1437, 21, 'Santa María del Tule');
INSERT INTO `region` VALUES (1438, 21, 'Santa María Ecatepec');
INSERT INTO `region` VALUES (1439, 21, 'Santa María Guelacé');
INSERT INTO `region` VALUES (1440, 21, 'Santa María Guienagati');
INSERT INTO `region` VALUES (1441, 21, 'Santa María Huatulco');
INSERT INTO `region` VALUES (1442, 21, 'Santa María Huazolotitlán');
INSERT INTO `region` VALUES (1443, 21, 'Santa María Ipalapa');
INSERT INTO `region` VALUES (1444, 21, 'Santa María Ixcatlán');
INSERT INTO `region` VALUES (1445, 21, 'Santa María Jacatepec');
INSERT INTO `region` VALUES (1446, 21, 'Santa María Jalapa del Marqués');
INSERT INTO `region` VALUES (1447, 21, 'Santa María Jaltianguis');
INSERT INTO `region` VALUES (1448, 21, 'Santa María la Asunción');
INSERT INTO `region` VALUES (1449, 21, 'Santa María Lachixío');
INSERT INTO `region` VALUES (1450, 21, 'Santa María Mixtequilla');
INSERT INTO `region` VALUES (1451, 21, 'Santa María Nativitas');
INSERT INTO `region` VALUES (1452, 21, 'Santa María Nduayaco');
INSERT INTO `region` VALUES (1453, 21, 'Santa María Ozolotepec');
INSERT INTO `region` VALUES (1454, 21, 'Santa María Pápalo');
INSERT INTO `region` VALUES (1455, 21, 'Santa María Peñoles');
INSERT INTO `region` VALUES (1456, 21, 'Santa María Petapa');
INSERT INTO `region` VALUES (1457, 21, 'Santa María Quiegolani');
INSERT INTO `region` VALUES (1458, 21, 'Santa María Sola');
INSERT INTO `region` VALUES (1459, 21, 'Santa María Tataltepec');
INSERT INTO `region` VALUES (1460, 21, 'Santa María Tecomavaca');
INSERT INTO `region` VALUES (1461, 21, 'Santa María Temaxcalapa');
INSERT INTO `region` VALUES (1462, 21, 'Santa María Temaxcaltepec');
INSERT INTO `region` VALUES (1463, 21, 'Santa María Teopoxco');
INSERT INTO `region` VALUES (1464, 21, 'Santa María Tepantlali');
INSERT INTO `region` VALUES (1465, 21, 'Santa María Texcatitlán');
INSERT INTO `region` VALUES (1466, 21, 'Santa María Tlahuitoltepec');
INSERT INTO `region` VALUES (1467, 21, 'Santa María Tlalixtac');
INSERT INTO `region` VALUES (1468, 21, 'Santa María Tonameca');
INSERT INTO `region` VALUES (1469, 21, 'Santa María Totolapilla');
INSERT INTO `region` VALUES (1470, 21, 'Santa María Xadani');
INSERT INTO `region` VALUES (1471, 21, 'Santa María Yalina');
INSERT INTO `region` VALUES (1472, 21, 'Santa María Yavesía');
INSERT INTO `region` VALUES (1473, 21, 'Santa María Yolotepec');
INSERT INTO `region` VALUES (1474, 21, 'Santa María Yosoyúa');
INSERT INTO `region` VALUES (1475, 21, 'Santa María Yucuhiti');
INSERT INTO `region` VALUES (1476, 21, 'Santa María Zacatepec');
INSERT INTO `region` VALUES (1477, 21, 'Santa María Zaniza');
INSERT INTO `region` VALUES (1478, 21, 'Santa María Zoquitlán');
INSERT INTO `region` VALUES (1479, 21, 'Santiago Amoltepec');
INSERT INTO `region` VALUES (1480, 21, 'Santiago Apoala');
INSERT INTO `region` VALUES (1481, 21, 'Santiago Apóstol');
INSERT INTO `region` VALUES (1482, 21, 'Santiago Astata');
INSERT INTO `region` VALUES (1483, 21, 'Santiago Atitlán');
INSERT INTO `region` VALUES (1484, 21, 'Santiago Ayuquililla');
INSERT INTO `region` VALUES (1485, 21, 'Santiago Cacaloxtepec');
INSERT INTO `region` VALUES (1486, 21, 'Santiago Camotlán');
INSERT INTO `region` VALUES (1487, 21, 'Santiago Chazumba');
INSERT INTO `region` VALUES (1488, 21, 'Santiago Choapam');
INSERT INTO `region` VALUES (1489, 21, 'Santiago Comaltepec');
INSERT INTO `region` VALUES (1490, 21, 'Santiago del Río');
INSERT INTO `region` VALUES (1491, 21, 'Santiago Huajolotitlán');
INSERT INTO `region` VALUES (1492, 21, 'Santiago Huauclilla');
INSERT INTO `region` VALUES (1493, 21, 'Santiago Ihuitlán Plumas');
INSERT INTO `region` VALUES (1494, 21, 'Santiago Ixcuintepec');
INSERT INTO `region` VALUES (1495, 21, 'Santiago Ixtayutla');
INSERT INTO `region` VALUES (1496, 21, 'Santiago Jamiltepec');
INSERT INTO `region` VALUES (1497, 21, 'Santiago Jocotepec');
INSERT INTO `region` VALUES (1498, 21, 'Santiago Juxtlahuaca');
INSERT INTO `region` VALUES (1499, 21, 'Santiago Lachiguiri');
INSERT INTO `region` VALUES (1500, 21, 'Santiago Lalopa');
INSERT INTO `region` VALUES (1501, 21, 'Santiago Laollaga');
INSERT INTO `region` VALUES (1502, 21, 'Santiago Laxopa');
INSERT INTO `region` VALUES (1503, 21, 'Santiago Llano Grande');
INSERT INTO `region` VALUES (1504, 21, 'Santiago Matatlán');
INSERT INTO `region` VALUES (1505, 21, 'Santiago Miltepec');
INSERT INTO `region` VALUES (1506, 21, 'Santiago Minas');
INSERT INTO `region` VALUES (1507, 21, 'Santiago Nacaltepec');
INSERT INTO `region` VALUES (1508, 21, 'Santiago Nejapilla');
INSERT INTO `region` VALUES (1509, 21, 'Santiago Niltepec');
INSERT INTO `region` VALUES (1510, 21, 'Santiago Nundiche');
INSERT INTO `region` VALUES (1511, 21, 'Santiago Nuyoó');
INSERT INTO `region` VALUES (1512, 21, 'Santiago Pinotepa Nacional');
INSERT INTO `region` VALUES (1513, 21, 'Santiago Suchilquitongo');
INSERT INTO `region` VALUES (1514, 21, 'Santiago Tamazola');
INSERT INTO `region` VALUES (1515, 21, 'Santiago Tapextla');
INSERT INTO `region` VALUES (1516, 21, 'Santiago Tenango');
INSERT INTO `region` VALUES (1517, 21, 'Santiago Tepetlapa');
INSERT INTO `region` VALUES (1518, 21, 'Santiago Tetepec');
INSERT INTO `region` VALUES (1519, 21, 'Santiago Texcalcingo');
INSERT INTO `region` VALUES (1520, 21, 'Santiago Textitlán');
INSERT INTO `region` VALUES (1521, 21, 'Santiago Tilantongo');
INSERT INTO `region` VALUES (1522, 21, 'Santiago Tillo');
INSERT INTO `region` VALUES (1523, 21, 'Santiago Tlazoyaltepec');
INSERT INTO `region` VALUES (1524, 21, 'Santiago Xanica');
INSERT INTO `region` VALUES (1525, 21, 'Santiago Xiacuí');
INSERT INTO `region` VALUES (1526, 21, 'Santiago Yaitepec');
INSERT INTO `region` VALUES (1527, 21, 'Santiago Yaveo');
INSERT INTO `region` VALUES (1528, 21, 'Santiago Yolomécatl');
INSERT INTO `region` VALUES (1529, 21, 'Santiago Yosondúa');
INSERT INTO `region` VALUES (1530, 21, 'Santiago Yucuyachi');
INSERT INTO `region` VALUES (1531, 21, 'Santiago Zacatepec');
INSERT INTO `region` VALUES (1532, 21, 'Santiago Zoochila');
INSERT INTO `region` VALUES (1533, 21, 'Santo Domingo Albarradas');
INSERT INTO `region` VALUES (1534, 21, 'Santo Domingo Armenta');
INSERT INTO `region` VALUES (1535, 21, 'Santo Domingo Chihuitán');
INSERT INTO `region` VALUES (1536, 21, 'Santo Domingo de Morelos');
INSERT INTO `region` VALUES (1537, 21, 'Santo Domingo Ingenio');
INSERT INTO `region` VALUES (1538, 21, 'Santo Domingo Ixcatlán');
INSERT INTO `region` VALUES (1539, 21, 'Santo Domingo Nuxaá');
INSERT INTO `region` VALUES (1540, 21, 'Santo Domingo Ozolotepec');
INSERT INTO `region` VALUES (1541, 21, 'Santo Domingo Petapa');
INSERT INTO `region` VALUES (1542, 21, 'Santo Domingo Roayaga');
INSERT INTO `region` VALUES (1543, 21, 'Santo Domingo Tehuantepec');
INSERT INTO `region` VALUES (1544, 21, 'Santo Domingo Teojomulco');
INSERT INTO `region` VALUES (1545, 21, 'Santo Domingo Tepuxtepec');
INSERT INTO `region` VALUES (1546, 21, 'Santo Domingo Tlatayápam');
INSERT INTO `region` VALUES (1547, 21, 'Santo Domingo Tomaltepec');
INSERT INTO `region` VALUES (1548, 21, 'Santo Domingo Tonalá');
INSERT INTO `region` VALUES (1549, 21, 'Santo Domingo Tonaltepec');
INSERT INTO `region` VALUES (1550, 21, 'Santo Domingo Xagacía');
INSERT INTO `region` VALUES (1551, 21, 'Santo Domingo Yanhuitlán');
INSERT INTO `region` VALUES (1552, 21, 'Santo Domingo Yodohino');
INSERT INTO `region` VALUES (1553, 21, 'Santo Domingo Zanatepec');
INSERT INTO `region` VALUES (1554, 21, 'Santo Tomás Jalieza');
INSERT INTO `region` VALUES (1555, 21, 'Santo Tomás Mazaltepec');
INSERT INTO `region` VALUES (1556, 21, 'Santo Tomás Ocotepec');
INSERT INTO `region` VALUES (1557, 21, 'Santo Tomás Tamazulapan');
INSERT INTO `region` VALUES (1558, 21, 'Santos Reyes Nopala');
INSERT INTO `region` VALUES (1559, 21, 'Santos Reyes Pápalo');
INSERT INTO `region` VALUES (1560, 21, 'Santos Reyes Tepejillo');
INSERT INTO `region` VALUES (1561, 21, 'Santos Reyes Yucuná');
INSERT INTO `region` VALUES (1562, 21, 'Silacayoápam');
INSERT INTO `region` VALUES (1563, 21, 'Sitio de Xitlapehua');
INSERT INTO `region` VALUES (1564, 21, 'Soledad Etla');
INSERT INTO `region` VALUES (1565, 21, 'Tamazulapam del Espíritu Santo');
INSERT INTO `region` VALUES (1566, 21, 'Tanetze de Zaragoza');
INSERT INTO `region` VALUES (1567, 21, 'Taniche');
INSERT INTO `region` VALUES (1568, 21, 'Tataltepec de Valdés');
INSERT INTO `region` VALUES (1569, 21, 'Teococuilco de Marcos Pérez');
INSERT INTO `region` VALUES (1570, 21, 'Teotitlán de Flores Magón');
INSERT INTO `region` VALUES (1571, 21, 'Teotitlán del Valle');
INSERT INTO `region` VALUES (1572, 21, 'Teotongo');
INSERT INTO `region` VALUES (1573, 21, 'Tepelmeme Villa de Morelos');
INSERT INTO `region` VALUES (1574, 21, 'Tezoatlán de Segura y Luna');
INSERT INTO `region` VALUES (1575, 21, 'Tlacolula de Matamoros');
INSERT INTO `region` VALUES (1576, 21, 'Tlacotepec Plumas');
INSERT INTO `region` VALUES (1577, 21, 'Tlalixtac de Cabrera');
INSERT INTO `region` VALUES (1578, 21, 'Totontepec Villa de Morelos');
INSERT INTO `region` VALUES (1579, 21, 'Trinidad Zaachila');
INSERT INTO `region` VALUES (1580, 21, 'Unión Hidalgo');
INSERT INTO `region` VALUES (1581, 21, 'Valerio Trujano');
INSERT INTO `region` VALUES (1582, 21, 'Villa de Chilapa de Díaz');
INSERT INTO `region` VALUES (1583, 21, 'Villa de Etla');
INSERT INTO `region` VALUES (1584, 21, 'Villa de Tamazulápam del Progreso');
INSERT INTO `region` VALUES (1585, 21, 'Villa de Tututepec de Melchor Ocam');
INSERT INTO `region` VALUES (1586, 21, 'Villa de Zaachila');
INSERT INTO `region` VALUES (1587, 21, 'Villa Díaz Ordaz');
INSERT INTO `region` VALUES (1588, 21, 'Villa Hidalgo');
INSERT INTO `region` VALUES (1589, 21, 'Villa Sola de Vega');
INSERT INTO `region` VALUES (1590, 21, 'Villa Talea de Castro');
INSERT INTO `region` VALUES (1591, 21, 'Villa Tejúpam de la Unión');
INSERT INTO `region` VALUES (1592, 21, 'Yaxe');
INSERT INTO `region` VALUES (1593, 21, 'Yogana');
INSERT INTO `region` VALUES (1594, 21, 'Yutanduchi de Guerrero');
INSERT INTO `region` VALUES (1595, 21, 'Zapotitlán del Río');
INSERT INTO `region` VALUES (1596, 21, 'Zapotitlán Lagunas');
INSERT INTO `region` VALUES (1597, 21, 'Zapotitlán Palmas');
INSERT INTO `region` VALUES (1598, 21, 'Zimatlán de Alvarez');
INSERT INTO `region` VALUES (1599, 22, 'Acajete');
INSERT INTO `region` VALUES (1600, 22, 'Acateno');
INSERT INTO `region` VALUES (1601, 22, 'Acatlán');
INSERT INTO `region` VALUES (1602, 22, 'Acatzingo');
INSERT INTO `region` VALUES (1603, 22, 'Acteopan');
INSERT INTO `region` VALUES (1604, 22, 'Ahuacatlán');
INSERT INTO `region` VALUES (1605, 22, 'Ahuatlán');
INSERT INTO `region` VALUES (1606, 22, 'Ahuazotepec');
INSERT INTO `region` VALUES (1607, 22, 'Ahuehuetitla');
INSERT INTO `region` VALUES (1608, 22, 'Ajalpan');
INSERT INTO `region` VALUES (1609, 22, 'Albino Zertuche');
INSERT INTO `region` VALUES (1610, 22, 'Aljojuca');
INSERT INTO `region` VALUES (1611, 22, 'Altepexi');
INSERT INTO `region` VALUES (1612, 22, 'Amixtlán');
INSERT INTO `region` VALUES (1613, 22, 'Amozoc');
INSERT INTO `region` VALUES (1614, 22, 'Aquixtla');
INSERT INTO `region` VALUES (1615, 22, 'Atempan');
INSERT INTO `region` VALUES (1616, 22, 'Atexcal');
INSERT INTO `region` VALUES (1617, 22, 'Atlequizayan');
INSERT INTO `region` VALUES (1618, 22, 'Atlixco');
INSERT INTO `region` VALUES (1619, 22, 'Atoyatempan');
INSERT INTO `region` VALUES (1620, 22, 'Atzala');
INSERT INTO `region` VALUES (1621, 22, 'Atzitzihuacán');
INSERT INTO `region` VALUES (1622, 22, 'Atzitzintla');
INSERT INTO `region` VALUES (1623, 22, 'Axutla');
INSERT INTO `region` VALUES (1624, 22, 'Ayotoxco de Guerrero');
INSERT INTO `region` VALUES (1625, 22, 'Calpan');
INSERT INTO `region` VALUES (1626, 22, 'Caltepec');
INSERT INTO `region` VALUES (1627, 22, 'Camocuautla');
INSERT INTO `region` VALUES (1628, 22, 'Cañada Morelos');
INSERT INTO `region` VALUES (1629, 22, 'Caxhuacan');
INSERT INTO `region` VALUES (1630, 22, 'Chalchicomula de Sesma');
INSERT INTO `region` VALUES (1631, 22, 'Chapulco');
INSERT INTO `region` VALUES (1632, 22, 'Chiautla');
INSERT INTO `region` VALUES (1633, 22, 'Chiautzingo');
INSERT INTO `region` VALUES (1634, 22, 'Chichiquila');
INSERT INTO `region` VALUES (1635, 22, 'Chiconcuautla');
INSERT INTO `region` VALUES (1636, 22, 'Chietla');
INSERT INTO `region` VALUES (1637, 22, 'Chigmecatitlán');
INSERT INTO `region` VALUES (1638, 22, 'Chignahuapan');
INSERT INTO `region` VALUES (1639, 22, 'Chignautla');
INSERT INTO `region` VALUES (1640, 22, 'Chila');
INSERT INTO `region` VALUES (1641, 22, 'Chila de la Sal');
INSERT INTO `region` VALUES (1642, 22, 'Chilchotla');
INSERT INTO `region` VALUES (1643, 22, 'Chinantla');
INSERT INTO `region` VALUES (1644, 22, 'Coatepec');
INSERT INTO `region` VALUES (1645, 22, 'Coatzingo');
INSERT INTO `region` VALUES (1646, 22, 'Cohetzala');
INSERT INTO `region` VALUES (1647, 22, 'Cohuecán');
INSERT INTO `region` VALUES (1648, 22, 'Coronango');
INSERT INTO `region` VALUES (1649, 22, 'Coxcatlán');
INSERT INTO `region` VALUES (1650, 22, 'Coyomeapan');
INSERT INTO `region` VALUES (1651, 22, 'Coyotepec');
INSERT INTO `region` VALUES (1652, 22, 'Cuapiaxtla de Madero');
INSERT INTO `region` VALUES (1653, 22, 'Cuautempan');
INSERT INTO `region` VALUES (1654, 22, 'Cuautinchán');
INSERT INTO `region` VALUES (1655, 22, 'Cuautlancingo');
INSERT INTO `region` VALUES (1656, 22, 'Cuayuca de Andrade');
INSERT INTO `region` VALUES (1657, 22, 'Cuetzalan del Progreso');
INSERT INTO `region` VALUES (1658, 22, 'Cuyoaco');
INSERT INTO `region` VALUES (1659, 22, 'Domingo Arenas');
INSERT INTO `region` VALUES (1660, 22, 'Eloxochitlán');
INSERT INTO `region` VALUES (1661, 22, 'Epatlán');
INSERT INTO `region` VALUES (1662, 22, 'Esperanza');
INSERT INTO `region` VALUES (1663, 22, 'Francisco Z. Mena');
INSERT INTO `region` VALUES (1664, 22, 'General Felipe Ángeles');
INSERT INTO `region` VALUES (1665, 22, 'Guadalupe');
INSERT INTO `region` VALUES (1666, 22, 'Guadalupe Victoria');
INSERT INTO `region` VALUES (1667, 22, 'Hermenegildo Galeana');
INSERT INTO `region` VALUES (1668, 22, 'Honey');
INSERT INTO `region` VALUES (1669, 22, 'Huaquechula');
INSERT INTO `region` VALUES (1670, 22, 'Huatlatlauca');
INSERT INTO `region` VALUES (1671, 22, 'Huauchinango');
INSERT INTO `region` VALUES (1672, 22, 'Huehuetla');
INSERT INTO `region` VALUES (1673, 22, 'Huehuetlán el Chico');
INSERT INTO `region` VALUES (1674, 22, 'Huehuetlán el Grande');
INSERT INTO `region` VALUES (1675, 22, 'Huejotzingo');
INSERT INTO `region` VALUES (1676, 22, 'Hueyapan');
INSERT INTO `region` VALUES (1677, 22, 'Hueytamalco');
INSERT INTO `region` VALUES (1678, 22, 'Hueytlalpan');
INSERT INTO `region` VALUES (1679, 22, 'Huitzilan de Serdán');
INSERT INTO `region` VALUES (1680, 22, 'Huitziltepec');
INSERT INTO `region` VALUES (1681, 22, 'Ixcamilpa de Guerrero');
INSERT INTO `region` VALUES (1682, 22, 'Ixcaquixtla');
INSERT INTO `region` VALUES (1683, 22, 'Ixtacamaxtitlán');
INSERT INTO `region` VALUES (1684, 22, 'Ixtepec');
INSERT INTO `region` VALUES (1685, 22, 'Izúcar de Matamoros');
INSERT INTO `region` VALUES (1686, 22, 'Jalpan');
INSERT INTO `region` VALUES (1687, 22, 'Jolalpan');
INSERT INTO `region` VALUES (1688, 22, 'Jonotla');
INSERT INTO `region` VALUES (1689, 22, 'Jopala');
INSERT INTO `region` VALUES (1690, 22, 'Juan C. Bonilla');
INSERT INTO `region` VALUES (1691, 22, 'Juan Galindo');
INSERT INTO `region` VALUES (1692, 22, 'Juan N. Méndez');
INSERT INTO `region` VALUES (1693, 22, 'La Magdalena Tlatlauquitepec');
INSERT INTO `region` VALUES (1694, 22, 'Lafragua');
INSERT INTO `region` VALUES (1695, 22, 'Libres');
INSERT INTO `region` VALUES (1696, 22, 'Los Reyes de Juárez');
INSERT INTO `region` VALUES (1697, 22, 'Mazapiltepec de Juárez');
INSERT INTO `region` VALUES (1698, 22, 'Mixtla');
INSERT INTO `region` VALUES (1699, 22, 'Molcaxac');
INSERT INTO `region` VALUES (1700, 22, 'Naupan');
INSERT INTO `region` VALUES (1701, 22, 'Nauzontla');
INSERT INTO `region` VALUES (1702, 22, 'Nealtican');
INSERT INTO `region` VALUES (1703, 22, 'Nicolás Bravo');
INSERT INTO `region` VALUES (1704, 22, 'Nopalucan');
INSERT INTO `region` VALUES (1705, 22, 'Ocotepec');
INSERT INTO `region` VALUES (1706, 22, 'Ocoyucan');
INSERT INTO `region` VALUES (1707, 22, 'Olintla');
INSERT INTO `region` VALUES (1708, 22, 'Oriental');
INSERT INTO `region` VALUES (1709, 22, 'Pahuatlán');
INSERT INTO `region` VALUES (1710, 22, 'Palmar de Bravo');
INSERT INTO `region` VALUES (1711, 22, 'Pantepec');
INSERT INTO `region` VALUES (1712, 22, 'Petlalcingo');
INSERT INTO `region` VALUES (1713, 22, 'Piaxtla');
INSERT INTO `region` VALUES (1714, 22, 'Puebla');
INSERT INTO `region` VALUES (1715, 22, 'Quecholac');
INSERT INTO `region` VALUES (1716, 22, 'Quimixtlán');
INSERT INTO `region` VALUES (1717, 22, 'Rafael Lara Grajales');
INSERT INTO `region` VALUES (1718, 22, 'San Andrés Cholula');
INSERT INTO `region` VALUES (1719, 22, 'San Antonio Cañada');
INSERT INTO `region` VALUES (1720, 22, 'San Diego la Mesa Tochimiltzingo');
INSERT INTO `region` VALUES (1721, 22, 'San Felipe Teotlalcingo');
INSERT INTO `region` VALUES (1722, 22, 'San Felipe Tepatlán');
INSERT INTO `region` VALUES (1723, 22, 'San Gabriel Chilac');
INSERT INTO `region` VALUES (1724, 22, 'San Gregorio Atzompa');
INSERT INTO `region` VALUES (1725, 22, 'San Jerónimo Tecuanipan');
INSERT INTO `region` VALUES (1726, 22, 'San Jerónimo Xayacatlán');
INSERT INTO `region` VALUES (1727, 22, 'San José Chiapa');
INSERT INTO `region` VALUES (1728, 22, 'San José Miahuatlán');
INSERT INTO `region` VALUES (1729, 22, 'San Juan Atenco');
INSERT INTO `region` VALUES (1730, 22, 'San Juan Atzompa');
INSERT INTO `region` VALUES (1731, 22, 'San Martín Texmelucan');
INSERT INTO `region` VALUES (1732, 22, 'San Martín Totoltepec');
INSERT INTO `region` VALUES (1733, 22, 'San Matías Tlalancaleca');
INSERT INTO `region` VALUES (1734, 22, 'San Miguel Ixitlán');
INSERT INTO `region` VALUES (1735, 22, 'San Miguel Xoxtla');
INSERT INTO `region` VALUES (1736, 22, 'San Nicolás Buenos Aires');
INSERT INTO `region` VALUES (1737, 22, 'San Nicolás de los Ranchos');
INSERT INTO `region` VALUES (1738, 22, 'San Pablo Anicano');
INSERT INTO `region` VALUES (1739, 22, 'San Pedro Cholula');
INSERT INTO `region` VALUES (1740, 22, 'San Pedro Yeloixtlahuaca');
INSERT INTO `region` VALUES (1741, 22, 'San Salvador el Seco');
INSERT INTO `region` VALUES (1742, 22, 'San Salvador el Verde');
INSERT INTO `region` VALUES (1743, 22, 'San Salvador Huixcolotla');
INSERT INTO `region` VALUES (1744, 22, 'San Sebastián Tlacotepec');
INSERT INTO `region` VALUES (1745, 22, 'Santa Catarina Tlaltempan');
INSERT INTO `region` VALUES (1746, 22, 'Santa Inés Ahuatempan');
INSERT INTO `region` VALUES (1747, 22, 'Santa Isabel Cholula');
INSERT INTO `region` VALUES (1748, 22, 'Santiago Miahuatlán');
INSERT INTO `region` VALUES (1749, 22, 'Santo Tomás Hueyotlipan');
INSERT INTO `region` VALUES (1750, 22, 'Soltepec');
INSERT INTO `region` VALUES (1751, 22, 'Tecali de Herrera');
INSERT INTO `region` VALUES (1752, 22, 'Tecamachalco');
INSERT INTO `region` VALUES (1753, 22, 'Tecomatlán');
INSERT INTO `region` VALUES (1754, 22, 'Tehuacán');
INSERT INTO `region` VALUES (1755, 22, 'Tehuitzingo');
INSERT INTO `region` VALUES (1756, 22, 'Tenampulco');
INSERT INTO `region` VALUES (1757, 22, 'Teopantlán');
INSERT INTO `region` VALUES (1758, 22, 'Teotlalco');
INSERT INTO `region` VALUES (1759, 22, 'Tepanco de López');
INSERT INTO `region` VALUES (1760, 22, 'Tepango de Rodríguez');
INSERT INTO `region` VALUES (1761, 22, 'Tepatlaxco de Hidalgo');
INSERT INTO `region` VALUES (1762, 22, 'Tepeaca');
INSERT INTO `region` VALUES (1763, 22, 'Tepemaxalco');
INSERT INTO `region` VALUES (1764, 22, 'Tepeojuma');
INSERT INTO `region` VALUES (1765, 22, 'Tepetzintla');
INSERT INTO `region` VALUES (1766, 22, 'Tepexco');
INSERT INTO `region` VALUES (1767, 22, 'Tepexi de Rodríguez');
INSERT INTO `region` VALUES (1768, 22, 'Tepeyahualco');
INSERT INTO `region` VALUES (1769, 22, 'Tepeyahualco de Cuauhtémoc');
INSERT INTO `region` VALUES (1770, 22, 'Tetela de Ocampo');
INSERT INTO `region` VALUES (1771, 22, 'Teteles de Avila Castillo');
INSERT INTO `region` VALUES (1772, 22, 'Teziutlán');
INSERT INTO `region` VALUES (1773, 22, 'Tianguismanalco');
INSERT INTO `region` VALUES (1774, 22, 'Tilapa');
INSERT INTO `region` VALUES (1775, 22, 'Tlachichuca');
INSERT INTO `region` VALUES (1776, 22, 'Tlacotepec de Benito Juárez');
INSERT INTO `region` VALUES (1777, 22, 'Tlacuilotepec');
INSERT INTO `region` VALUES (1778, 22, 'Tlahuapan');
INSERT INTO `region` VALUES (1779, 22, 'Tlaltenango');
INSERT INTO `region` VALUES (1780, 22, 'Tlanepantla');
INSERT INTO `region` VALUES (1781, 22, 'Tlaola');
INSERT INTO `region` VALUES (1782, 22, 'Tlapacoya');
INSERT INTO `region` VALUES (1783, 22, 'Tlapanalá');
INSERT INTO `region` VALUES (1784, 22, 'Tlatlauquitepec');
INSERT INTO `region` VALUES (1785, 22, 'Tlaxco');
INSERT INTO `region` VALUES (1786, 22, 'Tochimilco');
INSERT INTO `region` VALUES (1787, 22, 'Tochtepec');
INSERT INTO `region` VALUES (1788, 22, 'Totoltepec de Guerrero');
INSERT INTO `region` VALUES (1789, 22, 'Tulcingo');
INSERT INTO `region` VALUES (1790, 22, 'Tuzamapan de Galeana');
INSERT INTO `region` VALUES (1791, 22, 'Tzicatlacoyan');
INSERT INTO `region` VALUES (1792, 22, 'Venustiano Carranza');
INSERT INTO `region` VALUES (1793, 22, 'Vicente Guerrero');
INSERT INTO `region` VALUES (1794, 22, 'Xayacatlán de Bravo');
INSERT INTO `region` VALUES (1795, 22, 'Xicotepec');
INSERT INTO `region` VALUES (1796, 22, 'Xicotlán');
INSERT INTO `region` VALUES (1797, 22, 'Xiutetelco');
INSERT INTO `region` VALUES (1798, 22, 'Xochiapulco');
INSERT INTO `region` VALUES (1799, 22, 'Xochiltepec');
INSERT INTO `region` VALUES (1800, 22, 'Xochitlán de Vicente Suárez');
INSERT INTO `region` VALUES (1801, 22, 'Xochitlán Todos Santos');
INSERT INTO `region` VALUES (1802, 22, 'Yaonáhuac');
INSERT INTO `region` VALUES (1803, 22, 'Yehualtepec');
INSERT INTO `region` VALUES (1804, 22, 'Zacapala');
INSERT INTO `region` VALUES (1805, 22, 'Zacapoaxtla');
INSERT INTO `region` VALUES (1806, 22, 'Zacatlán');
INSERT INTO `region` VALUES (1807, 22, 'Zapotitlán');
INSERT INTO `region` VALUES (1808, 22, 'Zapotitlán de Méndez');
INSERT INTO `region` VALUES (1809, 22, 'Zaragoza');
INSERT INTO `region` VALUES (1810, 22, 'Zautla');
INSERT INTO `region` VALUES (1811, 22, 'Zihuateutla');
INSERT INTO `region` VALUES (1812, 22, 'Zinacatepec');
INSERT INTO `region` VALUES (1813, 22, 'Zongozotla');
INSERT INTO `region` VALUES (1814, 22, 'Zoquiapan');
INSERT INTO `region` VALUES (1815, 22, 'Zoquitlán');
INSERT INTO `region` VALUES (1816, 23, 'Amealco de Bonfil');
INSERT INTO `region` VALUES (1817, 23, 'Arroyo Seco');
INSERT INTO `region` VALUES (1818, 23, 'Cadereyta de Montes');
INSERT INTO `region` VALUES (1819, 23, 'Colón');
INSERT INTO `region` VALUES (1820, 23, 'Corregidora');
INSERT INTO `region` VALUES (1821, 23, 'El Marqués');
INSERT INTO `region` VALUES (1822, 23, 'Ezequiel Montes');
INSERT INTO `region` VALUES (1823, 23, 'Huimilpan');
INSERT INTO `region` VALUES (1824, 23, 'Jalpan de Serra');
INSERT INTO `region` VALUES (1825, 23, 'Landa de Matamoros');
INSERT INTO `region` VALUES (1826, 23, 'Pedro Escobedo');
INSERT INTO `region` VALUES (1827, 23, 'Peñamiller');
INSERT INTO `region` VALUES (1828, 23, 'Pinal de Amoles');
INSERT INTO `region` VALUES (1829, 23, 'Querétaro');
INSERT INTO `region` VALUES (1830, 23, 'San Joaquín');
INSERT INTO `region` VALUES (1831, 23, 'San Juan del Río');
INSERT INTO `region` VALUES (1832, 23, 'Tequisquiapan');
INSERT INTO `region` VALUES (1833, 23, 'Tolimán');
INSERT INTO `region` VALUES (1834, 24, 'Benito Juárez');
INSERT INTO `region` VALUES (1835, 24, 'Cozumel');
INSERT INTO `region` VALUES (1836, 24, 'Felipe Carrillo Puerto');
INSERT INTO `region` VALUES (1837, 24, 'Isla Mujeres');
INSERT INTO `region` VALUES (1838, 24, 'José María Morelos');
INSERT INTO `region` VALUES (1839, 24, 'Lázaro Cárdenas');
INSERT INTO `region` VALUES (1840, 24, 'Othón P. Blanco');
INSERT INTO `region` VALUES (1841, 24, 'Solidaridad');
INSERT INTO `region` VALUES (1842, 25, 'Ahualulco');
INSERT INTO `region` VALUES (1843, 25, 'Alaquines');
INSERT INTO `region` VALUES (1844, 25, 'Aquismón');
INSERT INTO `region` VALUES (1845, 25, 'Armadillo de los Infante');
INSERT INTO `region` VALUES (1846, 25, 'Axtla de Terrazas');
INSERT INTO `region` VALUES (1847, 25, 'Cárdenas');
INSERT INTO `region` VALUES (1848, 25, 'Catorce');
INSERT INTO `region` VALUES (1849, 25, 'Cedral');
INSERT INTO `region` VALUES (1850, 25, 'Cerritos');
INSERT INTO `region` VALUES (1851, 25, 'Cerro de San Pedro');
INSERT INTO `region` VALUES (1852, 25, 'Charcas');
INSERT INTO `region` VALUES (1853, 25, 'Ciudad del Maíz');
INSERT INTO `region` VALUES (1854, 25, 'Ciudad Fernández');
INSERT INTO `region` VALUES (1855, 25, 'Ciudad Valles');
INSERT INTO `region` VALUES (1856, 25, 'Coxcatlán');
INSERT INTO `region` VALUES (1857, 25, 'Ebano');
INSERT INTO `region` VALUES (1858, 25, 'El Naranjo');
INSERT INTO `region` VALUES (1859, 25, 'Guadalcázar');
INSERT INTO `region` VALUES (1860, 25, 'Huehuetlán');
INSERT INTO `region` VALUES (1861, 25, 'Lagunillas');
INSERT INTO `region` VALUES (1862, 25, 'Matehuala');
INSERT INTO `region` VALUES (1863, 25, 'Matlapa');
INSERT INTO `region` VALUES (1864, 25, 'Mexquitic de Carmona');
INSERT INTO `region` VALUES (1865, 25, 'Moctezuma');
INSERT INTO `region` VALUES (1866, 25, 'Rayón');
INSERT INTO `region` VALUES (1867, 25, 'Rioverde');
INSERT INTO `region` VALUES (1868, 25, 'Salinas');
INSERT INTO `region` VALUES (1869, 25, 'San Antonio');
INSERT INTO `region` VALUES (1870, 25, 'San Ciro de Acosta');
INSERT INTO `region` VALUES (1871, 25, 'San Luis Potosí');
INSERT INTO `region` VALUES (1872, 25, 'San Martín Chalchicuautla');
INSERT INTO `region` VALUES (1873, 25, 'San Nicolás Tolentino');
INSERT INTO `region` VALUES (1874, 25, 'San Vicente Tancuayalab');
INSERT INTO `region` VALUES (1875, 25, 'Santa Catarina');
INSERT INTO `region` VALUES (1876, 25, 'Santa María del Río');
INSERT INTO `region` VALUES (1877, 25, 'Santo Domingo');
INSERT INTO `region` VALUES (1878, 25, 'Soledad de Graciano Sánchez');
INSERT INTO `region` VALUES (1879, 25, 'Tamasopo');
INSERT INTO `region` VALUES (1880, 25, 'Tamazunchale');
INSERT INTO `region` VALUES (1881, 25, 'Tampacán');
INSERT INTO `region` VALUES (1882, 25, 'Tampamolón Corona');
INSERT INTO `region` VALUES (1883, 25, 'Tamuín');
INSERT INTO `region` VALUES (1884, 25, 'Tancanhuitz');
INSERT INTO `region` VALUES (1885, 25, 'Tanlajás');
INSERT INTO `region` VALUES (1886, 25, 'Tanquián de Escobedo');
INSERT INTO `region` VALUES (1887, 25, 'Tierra Nueva');
INSERT INTO `region` VALUES (1888, 25, 'Vanegas');
INSERT INTO `region` VALUES (1889, 25, 'Venado');
INSERT INTO `region` VALUES (1890, 25, 'Villa de Arista');
INSERT INTO `region` VALUES (1891, 25, 'Villa de Arriaga');
INSERT INTO `region` VALUES (1892, 25, 'Villa de Guadalupe');
INSERT INTO `region` VALUES (1893, 25, 'Villa de la Paz');
INSERT INTO `region` VALUES (1894, 25, 'Villa de Ramos');
INSERT INTO `region` VALUES (1895, 25, 'Villa de Reyes');
INSERT INTO `region` VALUES (1896, 25, 'Villa Hidalgo');
INSERT INTO `region` VALUES (1897, 25, 'Villa Juárez');
INSERT INTO `region` VALUES (1898, 25, 'Xilitla');
INSERT INTO `region` VALUES (1899, 25, 'Zaragoza');
INSERT INTO `region` VALUES (1900, 26, 'Ahome');
INSERT INTO `region` VALUES (1901, 26, 'Angostura');
INSERT INTO `region` VALUES (1902, 26, 'Badiraguato');
INSERT INTO `region` VALUES (1903, 26, 'Choix');
INSERT INTO `region` VALUES (1904, 26, 'Concordia');
INSERT INTO `region` VALUES (1905, 26, 'Cosalá');
INSERT INTO `region` VALUES (1906, 26, 'Culiacán');
INSERT INTO `region` VALUES (1907, 26, 'El Fuerte');
INSERT INTO `region` VALUES (1908, 26, 'Elota');
INSERT INTO `region` VALUES (1909, 26, 'Escuinapa');
INSERT INTO `region` VALUES (1910, 26, 'Guasave');
INSERT INTO `region` VALUES (1911, 26, 'Mazatlán');
INSERT INTO `region` VALUES (1912, 26, 'Mocorito');
INSERT INTO `region` VALUES (1913, 26, 'Navolato');
INSERT INTO `region` VALUES (1914, 26, 'Rosario');
INSERT INTO `region` VALUES (1915, 26, 'Salvador Alvarado');
INSERT INTO `region` VALUES (1916, 26, 'San Ignacio');
INSERT INTO `region` VALUES (1917, 26, 'Sinaloa');
INSERT INTO `region` VALUES (1918, 27, 'Aconchi');
INSERT INTO `region` VALUES (1919, 27, 'Agua Prieta');
INSERT INTO `region` VALUES (1920, 27, 'Alamos');
INSERT INTO `region` VALUES (1921, 27, 'Altar');
INSERT INTO `region` VALUES (1922, 27, 'Arivechi');
INSERT INTO `region` VALUES (1923, 27, 'Arizpe');
INSERT INTO `region` VALUES (1924, 27, 'Atil');
INSERT INTO `region` VALUES (1925, 27, 'Bacadéhuachi');
INSERT INTO `region` VALUES (1926, 27, 'Bacanora');
INSERT INTO `region` VALUES (1927, 27, 'Bacerac');
INSERT INTO `region` VALUES (1928, 27, 'Bacoachi');
INSERT INTO `region` VALUES (1929, 27, 'Bácum');
INSERT INTO `region` VALUES (1930, 27, 'Banámichi');
INSERT INTO `region` VALUES (1931, 27, 'Baviácora');
INSERT INTO `region` VALUES (1932, 27, 'Bavispe');
INSERT INTO `region` VALUES (1933, 27, 'Benito Juárez');
INSERT INTO `region` VALUES (1934, 27, 'Benjamín Hill');
INSERT INTO `region` VALUES (1935, 27, 'Caborca');
INSERT INTO `region` VALUES (1936, 27, 'Cajeme');
INSERT INTO `region` VALUES (1937, 27, 'Cananea');
INSERT INTO `region` VALUES (1938, 27, 'Carbó');
INSERT INTO `region` VALUES (1939, 27, 'Cucurpe');
INSERT INTO `region` VALUES (1940, 27, 'Cumpas');
INSERT INTO `region` VALUES (1941, 27, 'Divisaderos');
INSERT INTO `region` VALUES (1942, 27, 'Empalme');
INSERT INTO `region` VALUES (1943, 27, 'Etchojoa');
INSERT INTO `region` VALUES (1944, 27, 'Fronteras');
INSERT INTO `region` VALUES (1945, 27, 'General Plutarco Elías Calles');
INSERT INTO `region` VALUES (1946, 27, 'Granados');
INSERT INTO `region` VALUES (1947, 27, 'Guaymas');
INSERT INTO `region` VALUES (1948, 27, 'Hermosillo');
INSERT INTO `region` VALUES (1949, 27, 'Heroica Nogales');
INSERT INTO `region` VALUES (1950, 27, 'Huachinera');
INSERT INTO `region` VALUES (1951, 27, 'Huásabas');
INSERT INTO `region` VALUES (1952, 27, 'Huatabampo');
INSERT INTO `region` VALUES (1953, 27, 'Huépac');
INSERT INTO `region` VALUES (1954, 27, 'Imuris');
INSERT INTO `region` VALUES (1955, 27, 'La Colorada');
INSERT INTO `region` VALUES (1956, 27, 'Magdalena');
INSERT INTO `region` VALUES (1957, 27, 'Mazatán');
INSERT INTO `region` VALUES (1958, 27, 'Moctezuma');
INSERT INTO `region` VALUES (1959, 27, 'Naco');
INSERT INTO `region` VALUES (1960, 27, 'Nácori Chico');
INSERT INTO `region` VALUES (1961, 27, 'Nacozari de García');
INSERT INTO `region` VALUES (1962, 27, 'Navojoa');
INSERT INTO `region` VALUES (1963, 27, 'Onavas');
INSERT INTO `region` VALUES (1964, 27, 'Opodepe');
INSERT INTO `region` VALUES (1965, 27, 'Oquitoa');
INSERT INTO `region` VALUES (1966, 27, 'Pitiquito');
INSERT INTO `region` VALUES (1967, 27, 'Puerto Peñasco');
INSERT INTO `region` VALUES (1968, 27, 'Quiriego');
INSERT INTO `region` VALUES (1969, 27, 'Rayón');
INSERT INTO `region` VALUES (1970, 27, 'Rosario');
INSERT INTO `region` VALUES (1971, 27, 'Sahuaripa');
INSERT INTO `region` VALUES (1972, 27, 'San Felipe de Jesús');
INSERT INTO `region` VALUES (1973, 27, 'San Ignacio Río Muerto');
INSERT INTO `region` VALUES (1974, 27, 'San Javier');
INSERT INTO `region` VALUES (1975, 27, 'San Luis Río Colorado');
INSERT INTO `region` VALUES (1976, 27, 'San Miguel de Horcasitas');
INSERT INTO `region` VALUES (1977, 27, 'San Pedro de la Cueva');
INSERT INTO `region` VALUES (1978, 27, 'Santa Ana');
INSERT INTO `region` VALUES (1979, 27, 'Santa Cruz');
INSERT INTO `region` VALUES (1980, 27, 'Sáric');
INSERT INTO `region` VALUES (1981, 27, 'Soyopa');
INSERT INTO `region` VALUES (1982, 27, 'Suaqui Grande');
INSERT INTO `region` VALUES (1983, 27, 'Tepache');
INSERT INTO `region` VALUES (1984, 27, 'Trincheras');
INSERT INTO `region` VALUES (1985, 27, 'Tubutama');
INSERT INTO `region` VALUES (1986, 27, 'Ures');
INSERT INTO `region` VALUES (1987, 27, 'Villa Hidalgo');
INSERT INTO `region` VALUES (1988, 27, 'Villa Pesqueira');
INSERT INTO `region` VALUES (1989, 27, 'Yécora');
INSERT INTO `region` VALUES (1990, 28, 'Balancán');
INSERT INTO `region` VALUES (1991, 28, 'Cárdenas');
INSERT INTO `region` VALUES (1992, 28, 'Centla');
INSERT INTO `region` VALUES (1993, 28, 'Centro');
INSERT INTO `region` VALUES (1994, 28, 'Comalcalco');
INSERT INTO `region` VALUES (1995, 28, 'Cunduacán');
INSERT INTO `region` VALUES (1996, 28, 'Emiliano Zapata');
INSERT INTO `region` VALUES (1997, 28, 'Huimanguillo');
INSERT INTO `region` VALUES (1998, 28, 'Jalapa');
INSERT INTO `region` VALUES (1999, 28, 'Jalpa de Méndez');
INSERT INTO `region` VALUES (2000, 28, 'Jonuta');
INSERT INTO `region` VALUES (2001, 28, 'Macuspana');
INSERT INTO `region` VALUES (2002, 28, 'Nacajuca');
INSERT INTO `region` VALUES (2003, 28, 'Paraíso');
INSERT INTO `region` VALUES (2004, 28, 'Tacotalpa');
INSERT INTO `region` VALUES (2005, 28, 'Teapa');
INSERT INTO `region` VALUES (2006, 28, 'Tenosique');
INSERT INTO `region` VALUES (2007, 29, 'Abasolo');
INSERT INTO `region` VALUES (2008, 29, 'Aldama');
INSERT INTO `region` VALUES (2009, 29, 'Altamira');
INSERT INTO `region` VALUES (2010, 29, 'Antiguo Morelos');
INSERT INTO `region` VALUES (2011, 29, 'Burgos');
INSERT INTO `region` VALUES (2012, 29, 'Bustamante');
INSERT INTO `region` VALUES (2013, 29, 'Camargo');
INSERT INTO `region` VALUES (2014, 29, 'Casas');
INSERT INTO `region` VALUES (2015, 29, 'Ciudad Madero');
INSERT INTO `region` VALUES (2016, 29, 'Cruillas');
INSERT INTO `region` VALUES (2017, 29, 'El Mante');
INSERT INTO `region` VALUES (2018, 29, 'Gómez');
INSERT INTO `region` VALUES (2019, 29, 'Gómez Farías');
INSERT INTO `region` VALUES (2020, 29, 'González');
INSERT INTO `region` VALUES (2021, 29, 'Guerrero');
INSERT INTO `region` VALUES (2022, 29, 'Gustavo Díaz Ordaz');
INSERT INTO `region` VALUES (2023, 29, 'Hidalgo');
INSERT INTO `region` VALUES (2024, 29, 'Jaumave');
INSERT INTO `region` VALUES (2025, 29, 'Jiménez');
INSERT INTO `region` VALUES (2026, 29, 'Llera');
INSERT INTO `region` VALUES (2027, 29, 'Mainero');
INSERT INTO `region` VALUES (2028, 29, 'Matamoros');
INSERT INTO `region` VALUES (2029, 29, 'Méndez');
INSERT INTO `region` VALUES (2030, 29, 'Mier');
INSERT INTO `region` VALUES (2031, 29, 'Miguel Alemán');
INSERT INTO `region` VALUES (2032, 29, 'Miquihuana');
INSERT INTO `region` VALUES (2033, 29, 'Nuevo Laredo');
INSERT INTO `region` VALUES (2034, 29, 'Nuevo Morelos');
INSERT INTO `region` VALUES (2035, 29, 'Ocampo');
INSERT INTO `region` VALUES (2036, 29, 'Padilla');
INSERT INTO `region` VALUES (2037, 29, 'Palmillas');
INSERT INTO `region` VALUES (2038, 29, 'Reynosa');
INSERT INTO `region` VALUES (2039, 29, 'Río Bravo');
INSERT INTO `region` VALUES (2040, 29, 'San Carlos');
INSERT INTO `region` VALUES (2041, 29, 'San Fernando');
INSERT INTO `region` VALUES (2042, 29, 'San Nicolás');
INSERT INTO `region` VALUES (2043, 29, 'Soto la Marina');
INSERT INTO `region` VALUES (2044, 29, 'Tampico');
INSERT INTO `region` VALUES (2045, 29, 'Tula');
INSERT INTO `region` VALUES (2046, 29, 'Valle Hermoso');
INSERT INTO `region` VALUES (2047, 29, 'Victoria');
INSERT INTO `region` VALUES (2048, 29, 'Villagrán');
INSERT INTO `region` VALUES (2049, 29, 'Xicoténcatl');
INSERT INTO `region` VALUES (2050, 30, 'Acuamanala de Miguel Hidalgo');
INSERT INTO `region` VALUES (2051, 30, 'Altzayanca');
INSERT INTO `region` VALUES (2052, 30, 'Amaxac de Guerrero');
INSERT INTO `region` VALUES (2053, 30, 'Apetatitlán de Antonio Carvajal');
INSERT INTO `region` VALUES (2054, 30, 'Apizaco');
INSERT INTO `region` VALUES (2055, 30, 'Atlangatepec');
INSERT INTO `region` VALUES (2056, 30, 'Benito Juárez');
INSERT INTO `region` VALUES (2057, 30, 'Calpulalpan');
INSERT INTO `region` VALUES (2058, 30, 'Chiautempan');
INSERT INTO `region` VALUES (2059, 30, 'Contla de Juan Cuamatzi');
INSERT INTO `region` VALUES (2060, 30, 'Cuapiaxtla');
INSERT INTO `region` VALUES (2061, 30, 'Cuaxomulco');
INSERT INTO `region` VALUES (2062, 30, 'El Carmen Tequexquitla');
INSERT INTO `region` VALUES (2063, 30, 'Emiliano Zapata');
INSERT INTO `region` VALUES (2064, 30, 'Españita');
INSERT INTO `region` VALUES (2065, 30, 'Huamantla');
INSERT INTO `region` VALUES (2066, 30, 'Hueyotlipan');
INSERT INTO `region` VALUES (2067, 30, 'Ixtacuixtla de Mariano Matamoros');
INSERT INTO `region` VALUES (2068, 30, 'Ixtenco');
INSERT INTO `region` VALUES (2069, 30, 'La Magdalena Tlaltelulco');
INSERT INTO `region` VALUES (2070, 30, 'Lázaro Cárdenas');
INSERT INTO `region` VALUES (2071, 30, 'Mazatecochco de José María Morelos');
INSERT INTO `region` VALUES (2072, 30, 'Muñoz de Domingo Arenas');
INSERT INTO `region` VALUES (2073, 30, 'Nanacamilpa de Mariano Arista');
INSERT INTO `region` VALUES (2074, 30, 'Natívitas');
INSERT INTO `region` VALUES (2075, 30, 'Panotla');
INSERT INTO `region` VALUES (2076, 30, 'Papalotla de Xicohténcatl');
INSERT INTO `region` VALUES (2077, 30, 'San Damián Texoloc');
INSERT INTO `region` VALUES (2078, 30, 'San Francisco Tetlanohcan');
INSERT INTO `region` VALUES (2079, 30, 'San Jerónimo Zacualpan');
INSERT INTO `region` VALUES (2080, 30, 'San José Teacalco');
INSERT INTO `region` VALUES (2081, 30, 'San Juan Huactzinco');
INSERT INTO `region` VALUES (2082, 30, 'San Lorenzo Axocomanitla');
INSERT INTO `region` VALUES (2083, 30, 'San Lucas Tecopilco');
INSERT INTO `region` VALUES (2084, 30, 'San Pablo del Monte');
INSERT INTO `region` VALUES (2085, 30, 'Sanctórum de Lázaro Cárdenas');
INSERT INTO `region` VALUES (2086, 30, 'Santa Ana Nopalucan');
INSERT INTO `region` VALUES (2087, 30, 'Santa Apolonia Teacalco');
INSERT INTO `region` VALUES (2088, 30, 'Santa Catarina Ayometla');
INSERT INTO `region` VALUES (2089, 30, 'Santa Cruz Quilehtla');
INSERT INTO `region` VALUES (2090, 30, 'Santa Cruz Tlaxcala');
INSERT INTO `region` VALUES (2091, 30, 'Santa Isabel Xiloxoxtla');
INSERT INTO `region` VALUES (2092, 30, 'Tenancingo');
INSERT INTO `region` VALUES (2093, 30, 'Teolocholco');
INSERT INTO `region` VALUES (2094, 30, 'Tepetitla de Lardizábal');
INSERT INTO `region` VALUES (2095, 30, 'Tepeyanco');
INSERT INTO `region` VALUES (2096, 30, 'Terrenate');
INSERT INTO `region` VALUES (2097, 30, 'Tetla de la Solidaridad');
INSERT INTO `region` VALUES (2098, 30, 'Tetlatlahuca');
INSERT INTO `region` VALUES (2099, 30, 'Tlaxcala');
INSERT INTO `region` VALUES (2100, 30, 'Tlaxco');
INSERT INTO `region` VALUES (2101, 30, 'Tocatlán');
INSERT INTO `region` VALUES (2102, 30, 'Totolac');
INSERT INTO `region` VALUES (2103, 30, 'Tzompantepec');
INSERT INTO `region` VALUES (2104, 30, 'Xaloztoc');
INSERT INTO `region` VALUES (2105, 30, 'Xaltocan');
INSERT INTO `region` VALUES (2106, 30, 'Xicohtzinco');
INSERT INTO `region` VALUES (2107, 30, 'Yauhquemecan');
INSERT INTO `region` VALUES (2108, 30, 'Zacatelco');
INSERT INTO `region` VALUES (2109, 30, 'Zitlaltepec de Trinidad Sánchez Santos');
INSERT INTO `region` VALUES (2110, 31, 'Acajete');
INSERT INTO `region` VALUES (2111, 31, 'Acatlán');
INSERT INTO `region` VALUES (2112, 31, 'Acayucan');
INSERT INTO `region` VALUES (2113, 31, 'Actopan');
INSERT INTO `region` VALUES (2114, 31, 'Acula');
INSERT INTO `region` VALUES (2115, 31, 'Acultzingo');
INSERT INTO `region` VALUES (2116, 31, 'Agua Dulce');
INSERT INTO `region` VALUES (2117, 31, 'Alpatláhuac');
INSERT INTO `region` VALUES (2118, 31, 'Alto Lucero de Gutiérrez Barrios');
INSERT INTO `region` VALUES (2119, 31, 'Altotonga');
INSERT INTO `region` VALUES (2120, 31, 'Alvarado');
INSERT INTO `region` VALUES (2121, 31, 'Amatitlán');
INSERT INTO `region` VALUES (2122, 31, 'Amatlán de los Reyes');
INSERT INTO `region` VALUES (2123, 31, 'Angel R. Cabada');
INSERT INTO `region` VALUES (2124, 31, 'Apazapan');
INSERT INTO `region` VALUES (2125, 31, 'Aquila');
INSERT INTO `region` VALUES (2126, 31, 'Astacinga');
INSERT INTO `region` VALUES (2127, 31, 'Atlahuilco');
INSERT INTO `region` VALUES (2128, 31, 'Atoyac');
INSERT INTO `region` VALUES (2129, 31, 'Atzacan');
INSERT INTO `region` VALUES (2130, 31, 'Atzalan');
INSERT INTO `region` VALUES (2131, 31, 'Ayahualulco');
INSERT INTO `region` VALUES (2132, 31, 'Banderilla');
INSERT INTO `region` VALUES (2133, 31, 'Benito Juárez');
INSERT INTO `region` VALUES (2134, 31, 'Boca del Río');
INSERT INTO `region` VALUES (2135, 31, 'Calcahualco');
INSERT INTO `region` VALUES (2136, 31, 'Camarón de Tejeda');
INSERT INTO `region` VALUES (2137, 31, 'Camerino Z. Mendoza');
INSERT INTO `region` VALUES (2138, 31, 'Carlos A. Carrillo');
INSERT INTO `region` VALUES (2139, 31, 'Carrillo Puerto');
INSERT INTO `region` VALUES (2140, 31, 'Castillo de Teayo');
INSERT INTO `region` VALUES (2141, 31, 'Catemaco');
INSERT INTO `region` VALUES (2142, 31, 'Cazones');
INSERT INTO `region` VALUES (2143, 31, 'Cerro Azul');
INSERT INTO `region` VALUES (2144, 31, 'Chacaltianguis');
INSERT INTO `region` VALUES (2145, 31, 'Chalma');
INSERT INTO `region` VALUES (2146, 31, 'Chiconamel');
INSERT INTO `region` VALUES (2147, 31, 'Chiconquiaco');
INSERT INTO `region` VALUES (2148, 31, 'Chicontepec');
INSERT INTO `region` VALUES (2149, 31, 'Chinameca');
INSERT INTO `region` VALUES (2150, 31, 'Chinampa de Gorostiza');
INSERT INTO `region` VALUES (2151, 31, 'Chocamán');
INSERT INTO `region` VALUES (2152, 31, 'Chontla');
INSERT INTO `region` VALUES (2153, 31, 'Chumatlán');
INSERT INTO `region` VALUES (2154, 31, 'Citlaltépetl');
INSERT INTO `region` VALUES (2155, 31, 'Coacoatzintla');
INSERT INTO `region` VALUES (2156, 31, 'Coahuitlán');
INSERT INTO `region` VALUES (2157, 31, 'Coatepec');
INSERT INTO `region` VALUES (2158, 31, 'Coatzacoalcos');
INSERT INTO `region` VALUES (2159, 31, 'Coatzintla');
INSERT INTO `region` VALUES (2160, 31, 'Coetzala');
INSERT INTO `region` VALUES (2161, 31, 'Colipa');
INSERT INTO `region` VALUES (2162, 31, 'Comapa');
INSERT INTO `region` VALUES (2163, 31, 'Córdoba');
INSERT INTO `region` VALUES (2164, 31, 'Cosamaloapan de Carpio');
INSERT INTO `region` VALUES (2165, 31, 'Cosautlán de Carvajal');
INSERT INTO `region` VALUES (2166, 31, 'Coscomatepec');
INSERT INTO `region` VALUES (2167, 31, 'Cosoleacaque');
INSERT INTO `region` VALUES (2168, 31, 'Cotaxtla');
INSERT INTO `region` VALUES (2169, 31, 'Coxquihui');
INSERT INTO `region` VALUES (2170, 31, 'Coyutla');
INSERT INTO `region` VALUES (2171, 31, 'Cuichapa');
INSERT INTO `region` VALUES (2172, 31, 'Cuitláhuac');
INSERT INTO `region` VALUES (2173, 31, 'El Higo');
INSERT INTO `region` VALUES (2174, 31, 'Emiliano Zapata');
INSERT INTO `region` VALUES (2175, 31, 'Espinal');
INSERT INTO `region` VALUES (2176, 31, 'Filomeno Mata');
INSERT INTO `region` VALUES (2177, 31, 'Fortín');
INSERT INTO `region` VALUES (2178, 31, 'Gutiérrez Zamora');
INSERT INTO `region` VALUES (2179, 31, 'Hidalgotitlán');
INSERT INTO `region` VALUES (2180, 31, 'Huatusco');
INSERT INTO `region` VALUES (2181, 31, 'Huayacocotla');
INSERT INTO `region` VALUES (2182, 31, 'Hueyapan de Ocampo');
INSERT INTO `region` VALUES (2183, 31, 'Huiloapan');
INSERT INTO `region` VALUES (2184, 31, 'Ignacio de la Llave');
INSERT INTO `region` VALUES (2185, 31, 'Ilamatlán');
INSERT INTO `region` VALUES (2186, 31, 'Isla');
INSERT INTO `region` VALUES (2187, 31, 'Ixcatepec');
INSERT INTO `region` VALUES (2188, 31, 'Ixhuacán de los Reyes');
INSERT INTO `region` VALUES (2189, 31, 'Ixhuatlán de Madero');
INSERT INTO `region` VALUES (2190, 31, 'Ixhuatlán del Café');
INSERT INTO `region` VALUES (2191, 31, 'Ixhuatlán del Sureste');
INSERT INTO `region` VALUES (2192, 31, 'Ixhuatlancillo');
INSERT INTO `region` VALUES (2193, 31, 'Ixmatlahuacan');
INSERT INTO `region` VALUES (2194, 31, 'Ixtaczoquitlán');
INSERT INTO `region` VALUES (2195, 31, 'Jalacingo');
INSERT INTO `region` VALUES (2196, 31, 'Jalcomulco');
INSERT INTO `region` VALUES (2197, 31, 'Jáltipan');
INSERT INTO `region` VALUES (2198, 31, 'Jamapa');
INSERT INTO `region` VALUES (2199, 31, 'Jesús Carranza');
INSERT INTO `region` VALUES (2200, 31, 'Jilotepec');
INSERT INTO `region` VALUES (2201, 31, 'José Azueta');
INSERT INTO `region` VALUES (2202, 31, 'Juan Rodríguez Clara');
INSERT INTO `region` VALUES (2203, 31, 'Juchique de Ferrer');
INSERT INTO `region` VALUES (2204, 31, 'La Antigua');
INSERT INTO `region` VALUES (2205, 31, 'La Perla');
INSERT INTO `region` VALUES (2206, 31, 'Landero y Coss');
INSERT INTO `region` VALUES (2207, 31, 'Las Choapas');
INSERT INTO `region` VALUES (2208, 31, 'Las Minas');
INSERT INTO `region` VALUES (2209, 31, 'Las Vigas de Ramírez');
INSERT INTO `region` VALUES (2210, 31, 'Lerdo de Tejada');
INSERT INTO `region` VALUES (2211, 31, 'Los Reyes');
INSERT INTO `region` VALUES (2212, 31, 'Magdalena');
INSERT INTO `region` VALUES (2213, 31, 'Maltrata');
INSERT INTO `region` VALUES (2214, 31, 'Manlio Fabio Altamirano');
INSERT INTO `region` VALUES (2215, 31, 'Mariano Escobedo');
INSERT INTO `region` VALUES (2216, 31, 'Martínez de la Torre');
INSERT INTO `region` VALUES (2217, 31, 'Mecatlán');
INSERT INTO `region` VALUES (2218, 31, 'Mecayapan');
INSERT INTO `region` VALUES (2219, 31, 'Medellín');
INSERT INTO `region` VALUES (2220, 31, 'Miahuatlán');
INSERT INTO `region` VALUES (2221, 31, 'Minatitlán');
INSERT INTO `region` VALUES (2222, 31, 'Misantla');
INSERT INTO `region` VALUES (2223, 31, 'Mixtla de Altamirano');
INSERT INTO `region` VALUES (2224, 31, 'Moloacán');
INSERT INTO `region` VALUES (2225, 31, 'Nanchital de Lázaro Cárdenas del R');
INSERT INTO `region` VALUES (2226, 31, 'Naolinco');
INSERT INTO `region` VALUES (2227, 31, 'Naranjal');
INSERT INTO `region` VALUES (2228, 31, 'Naranjos Amatlán');
INSERT INTO `region` VALUES (2229, 31, 'Nautla');
INSERT INTO `region` VALUES (2230, 31, 'Nogales');
INSERT INTO `region` VALUES (2231, 31, 'Oluta');
INSERT INTO `region` VALUES (2232, 31, 'Omealca');
INSERT INTO `region` VALUES (2233, 31, 'Orizaba');
INSERT INTO `region` VALUES (2234, 31, 'Otatitlán');
INSERT INTO `region` VALUES (2235, 31, 'Oteapan');
INSERT INTO `region` VALUES (2236, 31, 'Ozuluama de Mascareñas');
INSERT INTO `region` VALUES (2237, 31, 'Pajapan');
INSERT INTO `region` VALUES (2238, 31, 'Pánuco');
INSERT INTO `region` VALUES (2239, 31, 'Papantla');
INSERT INTO `region` VALUES (2240, 31, 'Paso de Ovejas');
INSERT INTO `region` VALUES (2241, 31, 'Paso del Macho');
INSERT INTO `region` VALUES (2242, 31, 'Perote');
INSERT INTO `region` VALUES (2243, 31, 'Platón Sánchez');
INSERT INTO `region` VALUES (2244, 31, 'Playa Vicente');
INSERT INTO `region` VALUES (2245, 31, 'Poza Rica de Hidalgo');
INSERT INTO `region` VALUES (2246, 31, 'Pueblo Viejo');
INSERT INTO `region` VALUES (2247, 31, 'Puente Nacional');
INSERT INTO `region` VALUES (2248, 31, 'Rafael Delgado');
INSERT INTO `region` VALUES (2249, 31, 'Rafael Lucio');
INSERT INTO `region` VALUES (2250, 31, 'Río Blanco');
INSERT INTO `region` VALUES (2251, 31, 'Saltabarranca');
INSERT INTO `region` VALUES (2252, 31, 'San Andrés Tenejapan');
INSERT INTO `region` VALUES (2253, 31, 'San Andrés Tuxtla');
INSERT INTO `region` VALUES (2254, 31, 'San Juan Evangelista');
INSERT INTO `region` VALUES (2255, 31, 'San Rafael');
INSERT INTO `region` VALUES (2256, 31, 'Santiago Sochiapan');
INSERT INTO `region` VALUES (2257, 31, 'Santiago Tuxtla');
INSERT INTO `region` VALUES (2258, 31, 'Sayula de Alemán');
INSERT INTO `region` VALUES (2259, 31, 'Sochiapa');
INSERT INTO `region` VALUES (2260, 31, 'Soconusco');
INSERT INTO `region` VALUES (2261, 31, 'Soledad Atzompa');
INSERT INTO `region` VALUES (2262, 31, 'Soledad de Doblado');
INSERT INTO `region` VALUES (2263, 31, 'Soteapan');
INSERT INTO `region` VALUES (2264, 31, 'Tamalín');
INSERT INTO `region` VALUES (2265, 31, 'Tamiahua');
INSERT INTO `region` VALUES (2266, 31, 'Tampico Alto');
INSERT INTO `region` VALUES (2267, 31, 'Tancoco');
INSERT INTO `region` VALUES (2268, 31, 'Tantima');
INSERT INTO `region` VALUES (2269, 31, 'Tantoyuca');
INSERT INTO `region` VALUES (2270, 31, 'Tatahuicapan de Juárez');
INSERT INTO `region` VALUES (2271, 31, 'Tatatila');
INSERT INTO `region` VALUES (2272, 31, 'Tecolutla');
INSERT INTO `region` VALUES (2273, 31, 'Tehuipango');
INSERT INTO `region` VALUES (2274, 31, 'Temapache');
INSERT INTO `region` VALUES (2275, 31, 'Tempoal');
INSERT INTO `region` VALUES (2276, 31, 'Tenampa');
INSERT INTO `region` VALUES (2277, 31, 'Tenochtitlán');
INSERT INTO `region` VALUES (2278, 31, 'Teocelo');
INSERT INTO `region` VALUES (2279, 31, 'Tepatlaxco');
INSERT INTO `region` VALUES (2280, 31, 'Tepetlán');
INSERT INTO `region` VALUES (2281, 31, 'Tepetzintla');
INSERT INTO `region` VALUES (2282, 31, 'Tequila');
INSERT INTO `region` VALUES (2283, 31, 'Texcatepec');
INSERT INTO `region` VALUES (2284, 31, 'Texhuacán');
INSERT INTO `region` VALUES (2285, 31, 'Texistepec');
INSERT INTO `region` VALUES (2286, 31, 'Tezonapa');
INSERT INTO `region` VALUES (2287, 31, 'Tierra Blanca');
INSERT INTO `region` VALUES (2288, 31, 'Tihuatlán');
INSERT INTO `region` VALUES (2289, 31, 'Tlachichilco');
INSERT INTO `region` VALUES (2290, 31, 'Tlacojalpan');
INSERT INTO `region` VALUES (2291, 31, 'Tlacolulan');
INSERT INTO `region` VALUES (2292, 31, 'Tlacotalpan');
INSERT INTO `region` VALUES (2293, 31, 'Tlacotepec de Mejía');
INSERT INTO `region` VALUES (2294, 31, 'Tlalixcoyan');
INSERT INTO `region` VALUES (2295, 31, 'Tlalnelhuayocan');
INSERT INTO `region` VALUES (2296, 31, 'Tlaltetela');
INSERT INTO `region` VALUES (2297, 31, 'Tlapacoyan');
INSERT INTO `region` VALUES (2298, 31, 'Tlaquilpa');
INSERT INTO `region` VALUES (2299, 31, 'Tlilapan');
INSERT INTO `region` VALUES (2300, 31, 'Tomatlán');
INSERT INTO `region` VALUES (2301, 31, 'Tonayán');
INSERT INTO `region` VALUES (2302, 31, 'Totutla');
INSERT INTO `region` VALUES (2303, 31, 'Tres Valles');
INSERT INTO `region` VALUES (2304, 31, 'Túxpam');
INSERT INTO `region` VALUES (2305, 31, 'Tuxtilla');
INSERT INTO `region` VALUES (2306, 31, 'Ursulo Galván');
INSERT INTO `region` VALUES (2307, 31, 'Uxpanapa');
INSERT INTO `region` VALUES (2308, 31, 'Vega de Alatorre');
INSERT INTO `region` VALUES (2309, 31, 'Veracruz');
INSERT INTO `region` VALUES (2310, 31, 'Villa Aldama');
INSERT INTO `region` VALUES (2311, 31, 'Xalapa');
INSERT INTO `region` VALUES (2312, 31, 'Xico');
INSERT INTO `region` VALUES (2313, 31, 'Xoxocotla');
INSERT INTO `region` VALUES (2314, 31, 'Yanga');
INSERT INTO `region` VALUES (2315, 31, 'Yecuatla');
INSERT INTO `region` VALUES (2316, 31, 'Zacualpan');
INSERT INTO `region` VALUES (2317, 31, 'Zaragoza');
INSERT INTO `region` VALUES (2318, 31, 'Zentla');
INSERT INTO `region` VALUES (2319, 31, 'Zongolica');
INSERT INTO `region` VALUES (2320, 31, 'Zontecomatlán de López y Fuentes');
INSERT INTO `region` VALUES (2321, 31, 'Zozocolco de Hidalgo');
INSERT INTO `region` VALUES (2322, 32, 'Abalá');
INSERT INTO `region` VALUES (2323, 32, 'Acanceh');
INSERT INTO `region` VALUES (2324, 32, 'Akil');
INSERT INTO `region` VALUES (2325, 32, 'Baca');
INSERT INTO `region` VALUES (2326, 32, 'Bokobá');
INSERT INTO `region` VALUES (2327, 32, 'Buctzotz');
INSERT INTO `region` VALUES (2328, 32, 'Cacalchén');
INSERT INTO `region` VALUES (2329, 32, 'Calotmul');
INSERT INTO `region` VALUES (2330, 32, 'Cansahcab');
INSERT INTO `region` VALUES (2331, 32, 'Cantamayec');
INSERT INTO `region` VALUES (2332, 32, 'Celestún');
INSERT INTO `region` VALUES (2333, 32, 'Cenotillo');
INSERT INTO `region` VALUES (2334, 32, 'Chacsinkín');
INSERT INTO `region` VALUES (2335, 32, 'Chankom');
INSERT INTO `region` VALUES (2336, 32, 'Chapab');
INSERT INTO `region` VALUES (2337, 32, 'Chemax');
INSERT INTO `region` VALUES (2338, 32, 'Chichimilá');
INSERT INTO `region` VALUES (2339, 32, 'Chicxulub Pueblo');
INSERT INTO `region` VALUES (2340, 32, 'Chikindzonot');
INSERT INTO `region` VALUES (2341, 32, 'Chocholá');
INSERT INTO `region` VALUES (2342, 32, 'Chumayel');
INSERT INTO `region` VALUES (2343, 32, 'Conkal');
INSERT INTO `region` VALUES (2344, 32, 'Cuncunul');
INSERT INTO `region` VALUES (2345, 32, 'Cuzamá');
INSERT INTO `region` VALUES (2346, 32, 'Dzán');
INSERT INTO `region` VALUES (2347, 32, 'Dzemul');
INSERT INTO `region` VALUES (2348, 32, 'Dzidzantún');
INSERT INTO `region` VALUES (2349, 32, 'Dzilam de Bravo');
INSERT INTO `region` VALUES (2350, 32, 'Dzilam González');
INSERT INTO `region` VALUES (2351, 32, 'Dzitás');
INSERT INTO `region` VALUES (2352, 32, 'Dzoncauich');
INSERT INTO `region` VALUES (2353, 32, 'Espita');
INSERT INTO `region` VALUES (2354, 32, 'Halachó');
INSERT INTO `region` VALUES (2355, 32, 'Hocabá');
INSERT INTO `region` VALUES (2356, 32, 'Hoctún');
INSERT INTO `region` VALUES (2357, 32, 'Homún');
INSERT INTO `region` VALUES (2358, 32, 'Huhí');
INSERT INTO `region` VALUES (2359, 32, 'Hunucmá');
INSERT INTO `region` VALUES (2360, 32, 'Ixil');
INSERT INTO `region` VALUES (2361, 32, 'Izamal');
INSERT INTO `region` VALUES (2362, 32, 'Kanasín');
INSERT INTO `region` VALUES (2363, 32, 'Kantunil');
INSERT INTO `region` VALUES (2364, 32, 'Kaua');
INSERT INTO `region` VALUES (2365, 32, 'Kinchil');
INSERT INTO `region` VALUES (2366, 32, 'Kopomá');
INSERT INTO `region` VALUES (2367, 32, 'Mama');
INSERT INTO `region` VALUES (2368, 32, 'Maní');
INSERT INTO `region` VALUES (2369, 32, 'Maxcanú');
INSERT INTO `region` VALUES (2370, 32, 'Mayapán');
INSERT INTO `region` VALUES (2371, 32, 'Mérida');
INSERT INTO `region` VALUES (2372, 32, 'Mocochá');
INSERT INTO `region` VALUES (2373, 32, 'Motul');
INSERT INTO `region` VALUES (2374, 32, 'Muna');
INSERT INTO `region` VALUES (2375, 32, 'Muxupip');
INSERT INTO `region` VALUES (2376, 32, 'Opichén');
INSERT INTO `region` VALUES (2377, 32, 'Oxkutzcab');
INSERT INTO `region` VALUES (2378, 32, 'Panabá');
INSERT INTO `region` VALUES (2379, 32, 'Peto');
INSERT INTO `region` VALUES (2380, 32, 'Progreso');
INSERT INTO `region` VALUES (2381, 32, 'Quintana Roo');
INSERT INTO `region` VALUES (2382, 32, 'Río Lagartos');
INSERT INTO `region` VALUES (2383, 32, 'Sacalum');
INSERT INTO `region` VALUES (2384, 32, 'Samahil');
INSERT INTO `region` VALUES (2385, 32, 'San Felipe');
INSERT INTO `region` VALUES (2386, 32, 'Sanahcat');
INSERT INTO `region` VALUES (2387, 32, 'Santa Elena');
INSERT INTO `region` VALUES (2388, 32, 'Seyé');
INSERT INTO `region` VALUES (2389, 32, 'Sinanché');
INSERT INTO `region` VALUES (2390, 32, 'Sotuta');
INSERT INTO `region` VALUES (2391, 32, 'Sucilá');
INSERT INTO `region` VALUES (2392, 32, 'Sudzal');
INSERT INTO `region` VALUES (2393, 32, 'Suma');
INSERT INTO `region` VALUES (2394, 32, 'Tahdziú');
INSERT INTO `region` VALUES (2395, 32, 'Tahmek');
INSERT INTO `region` VALUES (2396, 32, 'Teabo');
INSERT INTO `region` VALUES (2397, 32, 'Tecoh');
INSERT INTO `region` VALUES (2398, 32, 'Tekal de Venegas');
INSERT INTO `region` VALUES (2399, 32, 'Tekantó');
INSERT INTO `region` VALUES (2400, 32, 'Tekax');
INSERT INTO `region` VALUES (2401, 32, 'Tekit');
INSERT INTO `region` VALUES (2402, 32, 'Tekom');
INSERT INTO `region` VALUES (2403, 32, 'Telchac Pueblo');
INSERT INTO `region` VALUES (2404, 32, 'Telchac Puerto');
INSERT INTO `region` VALUES (2405, 32, 'Temax');
INSERT INTO `region` VALUES (2406, 32, 'Temozón');
INSERT INTO `region` VALUES (2407, 32, 'Tepakán');
INSERT INTO `region` VALUES (2408, 32, 'Tetiz');
INSERT INTO `region` VALUES (2409, 32, 'Teya');
INSERT INTO `region` VALUES (2410, 32, 'Ticul');
INSERT INTO `region` VALUES (2411, 32, 'Timucuy');
INSERT INTO `region` VALUES (2412, 32, 'Tinum');
INSERT INTO `region` VALUES (2413, 32, 'Tixcacalcupul');
INSERT INTO `region` VALUES (2414, 32, 'Tixkokob');
INSERT INTO `region` VALUES (2415, 32, 'Tixmehuac');
INSERT INTO `region` VALUES (2416, 32, 'Tixpéhual');
INSERT INTO `region` VALUES (2417, 32, 'Tizimín');
INSERT INTO `region` VALUES (2418, 32, 'Tunkás');
INSERT INTO `region` VALUES (2419, 32, 'Tzucacab');
INSERT INTO `region` VALUES (2420, 32, 'Uayma');
INSERT INTO `region` VALUES (2421, 32, 'Ucú');
INSERT INTO `region` VALUES (2422, 32, 'Umán');
INSERT INTO `region` VALUES (2423, 32, 'Valladolid');
INSERT INTO `region` VALUES (2424, 32, 'Xocchel');
INSERT INTO `region` VALUES (2425, 32, 'Yaxcabá');
INSERT INTO `region` VALUES (2426, 32, 'Yaxkukul');
INSERT INTO `region` VALUES (2427, 32, 'Yobaín');
INSERT INTO `region` VALUES (2428, 33, 'Apozol');
INSERT INTO `region` VALUES (2429, 33, 'Apulco');
INSERT INTO `region` VALUES (2430, 33, 'Atolinga');
INSERT INTO `region` VALUES (2431, 33, 'Benito Juárez');
INSERT INTO `region` VALUES (2432, 33, 'Calera');
INSERT INTO `region` VALUES (2433, 33, 'Cañitas de Felipe Pescador');
INSERT INTO `region` VALUES (2434, 33, 'Chalchihuites');
INSERT INTO `region` VALUES (2435, 33, 'Concepción del Oro');
INSERT INTO `region` VALUES (2436, 33, 'Cuauhtémoc');
INSERT INTO `region` VALUES (2437, 33, 'El Plateado de Joaquín Amaro');
INSERT INTO `region` VALUES (2438, 33, 'El Salvador');
INSERT INTO `region` VALUES (2439, 33, 'Fresnillo');
INSERT INTO `region` VALUES (2440, 33, 'Genaro Codina');
INSERT INTO `region` VALUES (2441, 33, 'General Enrique Estrada');
INSERT INTO `region` VALUES (2442, 33, 'General Francisco R. Murguía');
INSERT INTO `region` VALUES (2443, 33, 'General Pánfilo Natera');
INSERT INTO `region` VALUES (2444, 33, 'Guadalupe');
INSERT INTO `region` VALUES (2445, 33, 'Huanusco');
INSERT INTO `region` VALUES (2446, 33, 'Jalpa');
INSERT INTO `region` VALUES (2447, 33, 'Jerez');
INSERT INTO `region` VALUES (2448, 33, 'Jiménez del Teul');
INSERT INTO `region` VALUES (2449, 33, 'Juan Aldama');
INSERT INTO `region` VALUES (2450, 33, 'Juchipila');
INSERT INTO `region` VALUES (2451, 33, 'Loreto');
INSERT INTO `region` VALUES (2452, 33, 'Luis Moya');
INSERT INTO `region` VALUES (2453, 33, 'Mazapil');
INSERT INTO `region` VALUES (2454, 33, 'Melchor Ocampo');
INSERT INTO `region` VALUES (2455, 33, 'Mezquital del Oro');
INSERT INTO `region` VALUES (2456, 33, 'Miguel Auza');
INSERT INTO `region` VALUES (2457, 33, 'Momax');
INSERT INTO `region` VALUES (2458, 33, 'Monte Escobedo');
INSERT INTO `region` VALUES (2459, 33, 'Morelos');
INSERT INTO `region` VALUES (2460, 33, 'Moyahua de Estrada');
INSERT INTO `region` VALUES (2461, 33, 'Nochistlán de Mejía');
INSERT INTO `region` VALUES (2462, 33, 'Noria de Ángeles');
INSERT INTO `region` VALUES (2463, 33, 'Ojocaliente');
INSERT INTO `region` VALUES (2464, 33, 'Pánuco');
INSERT INTO `region` VALUES (2465, 33, 'Pinos');
INSERT INTO `region` VALUES (2466, 33, 'Río Grande');
INSERT INTO `region` VALUES (2467, 33, 'Sain Alto');
INSERT INTO `region` VALUES (2468, 33, 'Santa María de la Paz');
INSERT INTO `region` VALUES (2469, 33, 'Sombrerete');
INSERT INTO `region` VALUES (2470, 33, 'Susticacán');
INSERT INTO `region` VALUES (2471, 33, 'Tabasco');
INSERT INTO `region` VALUES (2472, 33, 'Tepechitlán');
INSERT INTO `region` VALUES (2473, 33, 'Tepetongo');
INSERT INTO `region` VALUES (2474, 33, 'Teul de González Ortega');
INSERT INTO `region` VALUES (2475, 33, 'Tlaltenango de Sánchez Román');
INSERT INTO `region` VALUES (2476, 33, 'Trancoso');
INSERT INTO `region` VALUES (2477, 33, 'Trinidad García de la Cadena');
INSERT INTO `region` VALUES (2478, 33, 'Valparaíso');
INSERT INTO `region` VALUES (2479, 33, 'Vetagrande');
INSERT INTO `region` VALUES (2480, 33, 'Villa de Cos');
INSERT INTO `region` VALUES (2481, 33, 'Villa García');
INSERT INTO `region` VALUES (2482, 33, 'Villa González Ortega');
INSERT INTO `region` VALUES (2483, 33, 'Villa Hidalgo');
INSERT INTO `region` VALUES (2484, 33, 'Villanueva');
INSERT INTO `region` VALUES (2485, 33, 'Zacatecas');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `resource`
-- 

CREATE TABLE `resource` (
  `id_resource` bigint(20) unsigned NOT NULL auto_increment,
  `id_entity` int(10) unsigned NOT NULL,
  `id_section` tinyint(3) unsigned NOT NULL,
  `token` varchar(255) default NULL,
  `url` text,
  `resource_type` char(1) default NULL,
  `description` text,
  `viewed` mediumint(8) unsigned default '0',
  PRIMARY KEY  (`id_resource`,`id_entity`,`id_section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- Volcar la base de datos para la tabla `resource`
-- 

INSERT INTO `resource` VALUES (1, 23, 2, '', 'www.yout.beomc.om', 'e', 'desciricipno del video 1', 0);
INSERT INTO `resource` VALUES (2, 24, 2, '', 'youtube.com', 'e', '', 0);
INSERT INTO `resource` VALUES (3, 25, 2, '', 'youtube.com', 'e', '', 0);
INSERT INTO `resource` VALUES (4, 25, 2, '', '12_jpg.jpg', 'i', '', 0);
INSERT INTO `resource` VALUES (5, 2, 2, '', '28022012_jpg.jpg', 'i', '', 0);
INSERT INTO `resource` VALUES (6, 3, 1, '', '28022012_001_jpg.jpg', 'i', '', 0);
INSERT INTO `resource` VALUES (7, 5, 1, '', '28022012_jpg.jpg', 'i', 'descrip', 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `role`
-- 

CREATE TABLE `role` (
  `id_role` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  PRIMARY KEY  (`id_role`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `role`
-- 

INSERT INTO `role` VALUES (1, 'Administrador General');
INSERT INTO `role` VALUES (3, 'Administrador Geolocalización');
INSERT INTO `role` VALUES (2, 'Administrador Publicidad');
INSERT INTO `role` VALUES (4, 'Administrador Usuarios');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `section`
-- 

CREATE TABLE `section` (
  `id_section` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`id_section`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- 
-- Volcar la base de datos para la tabla `section`
-- 

INSERT INTO `section` VALUES (2, 'Geolocalización');
INSERT INTO `section` VALUES (1, 'Publicidad');
INSERT INTO `section` VALUES (3, 'Usuarios');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `user`
-- 

CREATE TABLE `user` (
  `id_user` int(10) unsigned NOT NULL auto_increment,
  `id_role` tinyint(3) unsigned NOT NULL,
  `email` varchar(80) default NULL,
  `user` varchar(80) default NULL,
  `password` char(64) default NULL,
  `first_name` varchar(80) default NULL,
  `last_name` varchar(45) default NULL,
  `birthday` datetime default NULL,
  `phone` varchar(100) default NULL,
  `cellphone` varchar(45) default NULL,
  `nextel` varchar(100) default NULL,
  `fax` varchar(150) default NULL,
  `address` varchar(250) default NULL,
  `updated_at` datetime default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id_user`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

-- 
-- Volcar la base de datos para la tabla `user`
-- 

INSERT INTO `user` VALUES (13, 1, 'mariano_ea1@hotmail.com', 'm', '872e193178d4f52fc58e4c2c91ba83d9323ad72ce93394703b900c448743d274', 'Mariano', 'Espinosa Alvizouri', '2012-01-02 00:00:00', '2123', '123', '123', '123', 'asd', '2012-01-13 11:35:40', '2012-01-13 11:33:05');
INSERT INTO `user` VALUES (40, 2, 'cedi.moc@gmail.com', NULL, '29c7f472c3b157c4d990eea9f6f32a503a220f8f7e98128c9572e447bbf47276', 'Jorge', 'Cedi Voirol', '2012-03-29 00:00:00', NULL, NULL, NULL, '123123', 'asdasd', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `userpermission`
-- 

CREATE TABLE `userpermission` (
  `id_user` int(10) unsigned NOT NULL,
  `id_permission` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`id_user`,`id_permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `userpermission`
-- 

INSERT INTO `userpermission` VALUES (13, 1);
INSERT INTO `userpermission` VALUES (13, 2);
INSERT INTO `userpermission` VALUES (13, 3);
INSERT INTO `userpermission` VALUES (13, 28);
INSERT INTO `userpermission` VALUES (13, 29);
INSERT INTO `userpermission` VALUES (13, 30);
INSERT INTO `userpermission` VALUES (13, 43);
INSERT INTO `userpermission` VALUES (13, 44);
INSERT INTO `userpermission` VALUES (13, 45);
