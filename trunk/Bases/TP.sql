-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 23, 2010 at 05:57 
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ejercicios`
--

-- --------------------------------------------------------

--
-- Table structure for table `abogado`
--

CREATE TABLE IF NOT EXISTS `abogado` (
  `cuil` bigint(20) NOT NULL,
  `numero_legajo` bigint(20) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cuil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `abogado`
--

INSERT INTO `abogado` (`cuil`, `numero_legajo`, `telefono`, `nombre`, `apellido`) VALUES
(1, 1, 12345, 'nombreA', 'apellidoA'),
(2, 2, 12345, 'nombreB', 'apellidoB'),
(3, 3, 12345, 'nombreC', 'apellidoC'),
(4, 4, 12345, 'nombreD', 'apellidoD'),
(5, 5, 12345, 'nombreE', 'apellidoE'),
(6, 6, 12345, 'nombreF', 'apellidoF'),
(7, 7, 12345, 'nombreG', 'apellidoG'),
(8, 8, 12345, 'nombreH', 'apellidoH'),
(9, 9, 12345, 'nombreI', 'apellidoI');

-- --------------------------------------------------------

--
-- Table structure for table `acargo`
--

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
-- Dumping data for table `acargo`
--

INSERT INTO `acargo` (`id_norma`, `id_juzgado`, `cuil_abogado`) VALUES
(1, 101, 2),
(1, 102, 3),
(2, 111, 4),
(2, 112, 5);

-- --------------------------------------------------------

--
-- Table structure for table `auditoria_concurso`
--

CREATE TABLE IF NOT EXISTS `auditoria_concurso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Ins','Del','Upd') NOT NULL,
  `new_id_camara` bigint(20) DEFAULT NULL,
  `new_id_concurso` bigint(20) DEFAULT NULL,
  `old_id_camara` bigint(20) DEFAULT NULL,
  `old_id_concurso` bigint(20) DEFAULT NULL,
  `old_fecha` date DEFAULT NULL,
  `new_fecha` date DEFAULT NULL,
  `usuario` varchar(40) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auditoria_concurso`
--


-- --------------------------------------------------------

--
-- Table structure for table `auditoria_inscripcion`
--

CREATE TABLE IF NOT EXISTS `auditoria_inscripcion` (
  `id_aud` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Ins','Upd','Del') DEFAULT NULL,
  `old_id` bigint(20) DEFAULT NULL,
  `old_orden_merito` bigint(20) DEFAULT NULL,
  `old_nombre_universidad` varchar(50) DEFAULT NULL,
  `old_promedio` float DEFAULT NULL,
  `old_fecha_titulo` datetime DEFAULT NULL,
  `old_id_concurso` bigint(20) DEFAULT NULL,
  `old_cuil_abogado` int(11) DEFAULT NULL,
  `new_id` bigint(20) DEFAULT NULL,
  `new_orden_merito` bigint(20) DEFAULT NULL,
  `new_nombre_universidad` varchar(50) DEFAULT NULL,
  `new_promedio` float DEFAULT NULL,
  `new_fecha_titulo` datetime DEFAULT NULL,
  `new_id_concurso` bigint(20) DEFAULT NULL,
  `new_cuil_abogado` bigint(20) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_aud`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auditoria_inscripcion`
--


-- --------------------------------------------------------

--
-- Table structure for table `camara`
--

CREATE TABLE IF NOT EXISTS `camara` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `camara`
--

INSERT INTO `camara` (`id`, `nombre`, `direccion`) VALUES
(1, 'Camara1', 'DireccionC 1');

-- --------------------------------------------------------

--
-- Table structure for table `causas`
--

CREATE TABLE IF NOT EXISTS `causas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_apertura` datetime DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `id_causa_original` bigint(20) DEFAULT NULL,
  `id_secretaria` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_secretaria` (`id_secretaria`),
  KEY `id_causa_original` (`id_causa_original`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `causas`
--

INSERT INTO `causas` (`id`, `fecha_apertura`, `descripcion`, `id_causa_original`, `id_secretaria`) VALUES
(1, '2010-09-21 13:54:26', 'Causa1', NULL, 1011),
(2, '2010-09-21 13:55:00', 'Causa2', 1, 1011),
(3, '2010-09-21 13:55:31', 'Causa3', 1, 1011),
(4, '2010-09-22 13:55:59', 'Causa4', NULL, 1011),
(5, '2010-09-01 13:56:48', 'Causa5', NULL, 1021),
(6, '2010-09-21 13:57:40', 'Causa6', NULL, 1021),
(7, '2010-09-21 13:57:59', 'Causa7', NULL, 1021),
(8, '2010-09-21 13:58:16', 'Causa8', 6, 1021),
(9, '2010-09-21 13:58:40', 'Causa9', NULL, 1111),
(10, '2010-09-21 13:59:12', 'Causa10', NULL, 1111),
(11, '2010-09-22 13:59:42', 'Causa11', NULL, 1121),
(12, '2010-09-22 14:00:00', 'Causa12', 11, 1121);

-- --------------------------------------------------------

--
-- Table structure for table `concurso`
--

CREATE TABLE IF NOT EXISTS `concurso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_camara` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_camara` (`id_camara`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `concurso`
--

INSERT INTO `concurso` (`id`, `id_camara`, `fecha`) VALUES
(1, 1, '2010-09-21');

--
-- Triggers `concurso`
--
DROP TRIGGER IF EXISTS `auditoria_concurso_ins`;
DELIMITER //
CREATE TRIGGER `auditoria_concurso_ins` AFTER INSERT ON `concurso`
 FOR EACH ROW INSERT INTO auditoria_concurso(tipo, new_id_camara, new_id_concurso,new_fecha, usuario, fecha)
VALUES ('Ins',NEW.id_camara, NEW.id,NEW.fecha, CURRENT_USER(), NOW())
//
DELIMITER ;
DROP TRIGGER IF EXISTS `auditoria_concurso_upd`;
DELIMITER //
CREATE TRIGGER `auditoria_concurso_upd` AFTER UPDATE ON `concurso`
 FOR EACH ROW INSERT INTO auditoria_concurso(tipo, new_id_camara, new_id_concurso,old_id_camara,old_id_concurso, old_fecha,new_fecha,usuario, fecha)
VALUES ('Upd',NEW.id_camara, NEW.id,OLD.id_camara, OLD.id,OLD.fecha, NEW.fecha, CURRENT_USER(), NOW())
//
DELIMITER ;
DROP TRIGGER IF EXISTS `auditoria_concurso_del`;
DELIMITER //
CREATE TRIGGER `auditoria_concurso_del` AFTER DELETE ON `concurso`
 FOR EACH ROW INSERT INTO auditoria_concurso(tipo, old_id_camara, old_id_concurso,old_fecha,usuario, fecha)
VALUES ('Del',OLD.id_camara, OLD.id,OLD.fecha, CURRENT_USER(), NOW())
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `declaraciones`
--

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
-- Dumping data for table `declaraciones`
--

INSERT INTO `declaraciones` (`id_movimiento`, `dni`, `motivo`, `nombre`, `apellido`) VALUES
(1, 8291380, 'A', 'JuanA', 'PerezA'),
(2, 172837189, 'A', 'JuanB', 'PerezB'),
(7, 218391280, 'F', 'JuanC', 'PerezC'),
(8, 90281980, 'H', 'JuanD', 'PerezD'),
(13, 81293820, 'G', 'JuanE', 'PerezE'),
(16, 2147483647, 'U', 'JuanF', 'PerezF');

-- --------------------------------------------------------

--
-- Table structure for table `inscripcion`
--

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `inscripcion`
--

INSERT INTO `inscripcion` (`id`, `orden_merito`, `nombre_universidad`, `promedio`, `fecha_titulo`, `id_concurso`, `cuil_abogado`) VALUES
(1, 1, 'uniA', 9, '1999-09-21 13:34:07', 1, 1),
(2, 2, 'uniA', 4, '2002-09-17 13:34:47', 1, 2),
(3, 3, 'uniB', 7, '1994-09-04 13:35:31', 1, 3),
(4, 4, 'uniA', 6, '2010-04-01 13:35:56', 1, 4),
(5, 5, 'uniT', 6, '1999-09-02 13:36:20', 1, 5),
(6, 6, 'uniQ', 9, '2009-09-08 13:36:43', 1, 6),
(7, 7, 'uniH', 9, '1992-09-24 13:37:50', 1, 7),
(8, 8, 'uniA', 4, '2000-09-01 13:38:47', 1, 8),
(9, 9, 'UADE', 10, '1993-09-05 13:39:24', 1, 9);

--
-- Triggers `inscripcion`
--
DROP TRIGGER IF EXISTS `auditoria_inscripcion_ins`;
DELIMITER //
CREATE TRIGGER `auditoria_inscripcion_ins` AFTER INSERT ON `inscripcion`
 FOR EACH ROW INSERT INTO auditoria_inscripcion(tipo, new_id, new_orden_merito, new_nombre_universidad, new_promedio, new_fecha_titulo, new_id_concurso, new_cuil_abogado, usuario, fecha)
VALUES ('Ins',NEW.id, NEW.orden_merito, NEW.nombre_universidad, NEW.promedio, NEW.fecha_titulo, NEW.id_concurso, NEW.cuil_abogado, CURRENT_USER() , NOW())
//
DELIMITER ;
DROP TRIGGER IF EXISTS `auditoria_inscripcion_upd`;
DELIMITER //
CREATE TRIGGER `auditoria_inscripcion_upd` AFTER UPDATE ON `inscripcion`
 FOR EACH ROW INSERT INTO auditoria_inscripcion(tipo, old_id, old_orden_merito, old_nombre_universidad, old_promedio, old_fecha_titulo, old_id_concurso, old_cuil_abogado,new_id, new_orden_merito, new_nombre_universidad, new_promedio, new_fecha_titulo, new_id_concurso, new_cuil_abogado, usuario, fecha)
VALUES ('Upd',OLD.id, OLD.orden_merito, OLD.nombre_universidad, OLD.promedio, OLD.fecha_titulo, OLD.id_concurso, OLD.cuil_abogado,NEW.id, NEW.orden_merito, NEW.nombre_universidad, NEW.promedio, NEW.fecha_titulo, NEW.id_concurso, NEW.cuil_abogado, CURRENT_USER() , NOW())
//
DELIMITER ;
DROP TRIGGER IF EXISTS `auditoria_inscripcion_del`;
DELIMITER //
CREATE TRIGGER `auditoria_inscripcion_del` AFTER DELETE ON `inscripcion`
 FOR EACH ROW INSERT INTO auditoria_inscripcion(tipo, old_id, old_orden_merito, old_nombre_universidad, old_promedio, old_fecha_titulo, old_id_concurso, old_cuil_abogado, usuario, fecha)
VALUES ('Del',OLD.id, OLD.orden_merito, OLD.nombre_universidad, OLD.promedio, OLD.fecha_titulo, OLD.id_concurso, OLD.cuil_abogado, CURRENT_USER() , NOW())
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `juzgado`
--

CREATE TABLE IF NOT EXISTS `juzgado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_sala` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sala` (`id_sala`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=113 ;

--
-- Dumping data for table `juzgado`
--

INSERT INTO `juzgado` (`id`, `fecha_creacion`, `direccion`, `id_sala`) VALUES
(101, '2010-09-21 00:48:37', 'DireccionJ 101', 10),
(102, '2008-09-25 00:50:17', 'DireccionJ 102', 10),
(111, '2010-04-21 00:51:08', 'DireccionJ 111', 11),
(112, '2010-01-03 00:51:27', 'DireccionJ 112', 11);

-- --------------------------------------------------------

--
-- Table structure for table `movimiento`
--

CREATE TABLE IF NOT EXISTS `movimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `id_causa` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_causa` (`id_causa`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `movimiento`
--

INSERT INTO `movimiento` (`id`, `descripcion`, `fecha`, `tipo`, `id_causa`) VALUES
(1, 'Mov1', '2010-09-23 14:02:47', 'A', 1),
(2, 'Mov2', '2010-09-23 14:03:09', 'A', 1),
(3, 'Mov3', '2010-09-22 14:07:23', 'A', 1),
(4, 'Mov4', '2010-09-23 14:09:25', 'E', 2),
(5, 'Mov5', '2010-09-23 14:09:40', 'L', 2),
(6, 'Mov6', '2010-09-23 14:10:42', 'Q', 3),
(7, 'Mov7', '2010-09-23 14:11:15', 'W', 3),
(8, 'Mov8', '2010-09-23 14:11:31', 'O', 5),
(9, 'Mov9', '2010-09-23 14:12:02', 'S', 5),
(10, 'Mov10', '2010-09-17 14:13:11', 'K', 6),
(11, 'Mov11', '2010-09-09 14:13:38', 'R', 6),
(12, 'Mov12', '2010-09-23 14:14:07', 'E', 7),
(13, 'Mov13', '2010-09-23 14:14:25', 'U', 8),
(14, 'Mov14', '2010-09-23 14:14:57', 'C', 8),
(15, 'Mov15', '2010-09-23 14:15:19', 'E', 9),
(16, 'Mov16', '2010-09-23 14:15:38', 'Q', 10),
(17, 'Mov17', '2010-09-23 14:16:38', 'H', 10),
(18, 'Mov18', '2010-09-23 14:17:15', 'K', 11),
(19, 'Mov19', '2010-09-23 14:17:33', 'I', 12);

-- --------------------------------------------------------

--
-- Table structure for table `norma`
--

CREATE TABLE IF NOT EXISTS `norma` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_publicacion` datetime DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `norma`
--

INSERT INTO `norma` (`id`, `fecha_publicacion`, `tipo`) VALUES
(1, '2010-09-21 13:52:22', 'A'),
(2, '2010-09-22 13:52:46', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `sala`
--

CREATE TABLE IF NOT EXISTS `sala` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_camara` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_camara` (`id_camara`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `sala`
--

INSERT INTO `sala` (`id`, `nombre`, `direccion`, `id_camara`) VALUES
(10, 'Sala10', 'DireccionS 10', 1),
(11, 'Sala11', 'DireccionS 11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `secretaria`
--

CREATE TABLE IF NOT EXISTS `secretaria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_juzgado` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_juzgado` (`id_juzgado`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1122 ;

--
-- Dumping data for table `secretaria`
--

INSERT INTO `secretaria` (`id`, `id_juzgado`) VALUES
(1011, 101),
(1021, 102),
(1111, 111),
(1121, 112);

-- --------------------------------------------------------

--
-- Table structure for table `secretario`
--

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
-- Dumping data for table `secretario`
--

INSERT INTO `secretario` (`id_norma`, `id_secretaria`, `cuil_abogado`) VALUES
(1, 1011, 6),
(1, 1021, 7),
(2, 1111, 8),
(2, 1121, 9),
(1, 1111, 1);

-- --------------------------------------------------------

--
-- Table structure for table `telefono_c`
--

CREATE TABLE IF NOT EXISTS `telefono_c` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_camara` bigint(20) NOT NULL,
  `numero_tel` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_camara`),
  KEY `id_camara` (`id_camara`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `telefono_c`
--

INSERT INTO `telefono_c` (`id`, `id_camara`, `numero_tel`) VALUES
(1, 1, 12345);

-- --------------------------------------------------------

--
-- Table structure for table `telefono_j`
--

CREATE TABLE IF NOT EXISTS `telefono_j` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_juzgado` bigint(20) NOT NULL,
  `numero_tel` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_juzgado`),
  KEY `id_juzgado` (`id_juzgado`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `telefono_j`
--

INSERT INTO `telefono_j` (`id`, `id_juzgado`, `numero_tel`) VALUES
(1, 101, 12345),
(1, 102, 12345),
(1, 111, 12345),
(1, 112, 12345);

-- --------------------------------------------------------

--
-- Table structure for table `telefono_s`
--

CREATE TABLE IF NOT EXISTS `telefono_s` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_sala` bigint(20) NOT NULL,
  `numero_tel` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_sala`),
  KEY `id_sala` (`id_sala`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `telefono_s`
--

INSERT INTO `telefono_s` (`id`, `id_sala`, `numero_tel`) VALUES
(1, 10, 123456),
(1, 11, 1234567);

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `acomodados`()
begin
SELECT DISTINCT nombre
FROM abogado AS a, concurso AS c, acargo, inscripcion AS i, norma AS n, secretario AS s
WHERE   (a.cuil = acargo.cuil_abogado OR a.cuil = s.cuil_abogado) 
        -- El abogado a fue nombrado juez o secretario
        
        AND a.cuil = i.cuil_abogado 
        -- La inscripcion i corresponde al abogado a
        
        AND c.id = i.id_concurso  
        -- La inscripcion i corresponde al concurso c
        
        AND c.id IN 
        -- El concurso c es el que esta vigente para la norma n.
        -- Es decir, c es el ultimo concurso antes de que se publicara la norma n.
            (
            SELECT id
            FROM concurso AS conc
            WHERE   conc.fecha <= n.fecha_publicacion
                    AND (conc.fecha >= ALL (
                        SELECT fecha
                        FROM concurso conc1
                        WHERE conc1.fecha <= n.fecha_publicacion
                        ))
            )
        AND EXISTS (    
        -- Existe un abogado inscripto en el mismo concurso,  
        -- con menor orden de merito, que
        -- no esta entre los nombrados jueces o secretarios.
            SELECT *
            FROM abogado AS abog, inscripcion AS insc
            WHERE   abog.cuil = insc.cuil_abogado 
                    -- La inscripcion insc corresponde al abogado abog.
                    AND insc.orden_merito < i.orden_merito  
                    -- El orden de merito de la inscripcion insc
                    -- es menor que el de la inscripcion i.
                    AND insc.id_concurso = i.id_concurso    
                    -- Las inscripciones insc e i 
                    -- corresponden al mismo concurso
                    AND NOT EXISTS (    
                    -- No esta nombrado el abogado abog por una norma que 
                    -- corresponda al concurso c.
                        SELECT *
                        FROM norma AS norm, acargo AS acargo2, secretario AS secretario2
                        WHERE  norm.fecha_publicacion <= n.fecha_publicacion 
                               -- La norma norm es anterior a la norma n
                               AND norm.fecha_publicacion >= c.fecha    
                               -- El concurso c ya estaba vigente cuando 
                               -- se hizo la norma norm.
                               AND 
                               -- El abogado aparece nombrado juez o aparece nombrado 
                               -- secretario bajo la norma norm.
                                   (
                                       (acargo2.cuil_abogado = abog.cuil 
                                       -- El abogado abog aparece nombrado juez.
                                       AND norm.id = acargo2.id_norma 
                                       -- El nombramiento corresponde a la norma norm.
                                       ) 
                                    OR 
                                       (secretario2.cuil_abogado = abog.cuil 
                                       -- El abogado abog aparece nombrado secretario.
                                       AND norm.id = secretario2.id_norma 
                                       -- El nombramiento corresponde a la norma norm.
                                       ) 
                                   )
                        )
            )
LIMIT 0 , 30;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ranking`()
begin
SELECT nombre 'Nombre de la Sala', declaraciones 'Cantidad de Declaraciones'
FROM sala, (
	SELECT id_sala, count( * ) declaraciones
	FROM juzgado, (
		SELECT id_juzgado
		FROM secretaria, (
			SELECT id_secretaria
			FROM causas, (
				SELECT *
				FROM movimiento
				WHERE id
				IN (
					SELECT id_movimiento
					FROM declaraciones
				)
				) AS movConDec
			WHERE movConDec.id_causa = causas.id
			)secConDec
		WHERE secConDec.id_secretaria = secretaria.id
		) AS juzConDec
	WHERE juzConDec.id_juzgado = juzgado.id
	GROUP BY id_sala
	) AS salaConDec
WHERE sala.id = salaConDec.id_sala
ORDER BY declaraciones DESC
LIMIT 0 , 30;
end$$

DELIMITER ;
