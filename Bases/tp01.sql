-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-09-2010 a las 21:34:37
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abogado`
--

DROP TABLE IF EXISTS `abogado`;
CREATE TABLE IF NOT EXISTS `abogado` (
  `cuil` bigint(20) NOT NULL,
  `numero_legajo` bigint(20) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cuil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `abogado`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acargo`
--

DROP TABLE IF EXISTS `acargo`;
CREATE TABLE IF NOT EXISTS `acargo` (
  `id_norma` bigint(20) NOT NULL,
  `id_juzgado` bigint(20) NOT NULL,
  `cuil_abogado` bigint(20) NOT NULL,
  PRIMARY KEY (`id_norma`,`id_juzgado`),
  KEY `id_norma` (`id_norma`),
  KEY `id_juzgado` (`id_juzgado`),
  KEY `cuil_abogado` (`cuil_abogado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `acargo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camara`
--

DROP TABLE IF EXISTS `camara`;
CREATE TABLE IF NOT EXISTS `camara` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `camara`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `causas`
--

DROP TABLE IF EXISTS `causas`;
CREATE TABLE IF NOT EXISTS `causas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_apertura` datetime DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `id_causa_original` bigint(20) DEFAULT NULL,
  `id_secretaria` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_secretaria` (`id_secretaria`),
  KEY `id_causa_original` (`id_causa_original`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `causas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concurso`
--

DROP TABLE IF EXISTS `concurso`;
CREATE TABLE IF NOT EXISTS `concurso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_camara` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_camara` (`id_camara`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `concurso`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `declaraciones`
--

DROP TABLE IF EXISTS `declaraciones`;
CREATE TABLE IF NOT EXISTS `declaraciones` (
  `id_movimiento` bigint(20) NOT NULL,
  `dni` int(11) DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_movimiento` (`id_movimiento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `declaraciones`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
CREATE TABLE IF NOT EXISTS `inscripcion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orden_merito` bigint(20) DEFAULT NULL,
  `nombre_universidad` varchar(50) DEFAULT NULL,
  `promedio` float DEFAULT NULL,
  `fecha_titulo` datetime DEFAULT NULL,
  `id_concurso` bigint(20) NOT NULL,
  `cuil_abogado` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_concurso` (`id_concurso`),
  KEY `cuil_abogado` (`cuil_abogado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `inscripcion`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juzgado`
--

DROP TABLE IF EXISTS `juzgado`;
CREATE TABLE IF NOT EXISTS `juzgado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_sala` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sala` (`id_sala`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `juzgado`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
CREATE TABLE IF NOT EXISTS `movimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `id_causa` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_causa` (`id_causa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `movimiento`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `norma`
--

DROP TABLE IF EXISTS `norma`;
CREATE TABLE IF NOT EXISTS `norma` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_publicacion` datetime DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `norma`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

DROP TABLE IF EXISTS `sala`;
CREATE TABLE IF NOT EXISTS `sala` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_camara` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_camara` (`id_camara`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `sala`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

DROP TABLE IF EXISTS `secretaria`;
CREATE TABLE IF NOT EXISTS `secretaria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_juzgado` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_juzgado` (`id_juzgado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `secretaria`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretario`
--

DROP TABLE IF EXISTS `secretario`;
CREATE TABLE IF NOT EXISTS `secretario` (
  `id_norma` bigint(20) NOT NULL,
  `id_secretaria` bigint(20) NOT NULL,
  `cuil_abogado` bigint(20) NOT NULL,
  PRIMARY KEY (`id_norma`,`id_secretaria`),
  KEY `id_norma` (`id_norma`),
  KEY `id_secretaria` (`id_secretaria`),
  KEY `cuil_abogado` (`cuil_abogado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `secretario`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_c`
--

DROP TABLE IF EXISTS `telefono_c`;
CREATE TABLE IF NOT EXISTS `telefono_c` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_camara` bigint(20) NOT NULL,
  `numero_tel` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_camara`),
  KEY `id_camara` (`id_camara`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `telefono_c`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_j`
--

DROP TABLE IF EXISTS `telefono_j`;
CREATE TABLE IF NOT EXISTS `telefono_j` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_juzgado` bigint(20) NOT NULL,
  `numero_tel` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_juzgado`),
  KEY `id_juzgado` (`id_juzgado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `telefono_j`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_s`
--

DROP TABLE IF EXISTS `telefono_s`;
CREATE TABLE IF NOT EXISTS `telefono_s` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_sala` bigint(20) NOT NULL,
  `numero_tel` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_sala`),
  KEY `id_sala` (`id_sala`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `telefono_s`
--

