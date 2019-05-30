-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2019 a las 05:38:18
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sitmapp`
--
CREATE DATABASE IF NOT EXISTS `sitmapp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sitmapp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulado`
--

DROP TABLE IF EXISTS `articulado`;
CREATE TABLE IF NOT EXISTS `articulado` (
  `IdArticulado` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo_Articulado` varchar(45) DEFAULT NULL,
  `Placa` varchar(7) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Id_Empresa` int(11) NOT NULL,
  `Nombre_Empresa` varchar(45) NOT NULL,
  `Ubicacion_Latitud` double DEFAULT NULL,
  `Ubicacion_Longitud` double DEFAULT NULL,
  `Id_Conductor` int(11) NOT NULL,
  `Id_Ruta` int(11) NOT NULL,
  PRIMARY KEY (`IdArticulado`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulado`
--

INSERT INTO `articulado` (`IdArticulado`, `Codigo_Articulado`, `Placa`, `Estado`, `Id_Empresa`, `Nombre_Empresa`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Id_Conductor`, `Id_Ruta`) VALUES(23, '1321312', 'aaaaaa', 'NO ASIGNADO', 12312, 'TransAmbiental', 0, 0, 0, 0);
INSERT INTO `articulado` (`IdArticulado`, `Codigo_Articulado`, `Placa`, `Estado`, `Id_Empresa`, `Nombre_Empresa`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Id_Conductor`, `Id_Ruta`) VALUES(24, '12321321', '123121', 'NO ASIGNADO', 12312, 'TransAmbiental', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `IdEmpresa` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` text NOT NULL,
  PRIMARY KEY (`IdEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`IdEmpresa`, `Nombre`, `Descripcion`) VALUES(12312, 'TransAmbiental', '1231231');
INSERT INTO `empresa` (`IdEmpresa`, `Nombre`, `Descripcion`) VALUES(213112, 'qweq', 'ASDSADa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialconductor`
--

DROP TABLE IF EXISTS `historialconductor`;
CREATE TABLE IF NOT EXISTS `historialconductor` (
  `Fecha` timestamp NULL DEFAULT NULL,
  `articulado_IdArticulado` int(11) NOT NULL,
  PRIMARY KEY (`articulado_IdArticulado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

DROP TABLE IF EXISTS `noticia`;
CREATE TABLE IF NOT EXISTS `noticia` (
  `IdNoticia` int(11) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `Contenido` text NOT NULL,
  `Fecha` date NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`IdNoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parada`
--

DROP TABLE IF EXISTS `parada`;
CREATE TABLE IF NOT EXISTS `parada` (
  `IdParada` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Ubicacion_Latitud` varchar(50) DEFAULT NULL,
  `Ubicacion_Longitud` varchar(50) DEFAULT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`IdParada`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parada`
--

INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(46, 'Patio Portal', '10.396151897578726', '-75.47178268432619', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(47, 'Urbanizacion India Catalina', '10.411035080969858', '-75.44508934020996', 'Paradero');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(48, 'Villa Rosita', '10.398725164670926', '-75.46987831592561', 'Paradero');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(49, 'Altamare', '10.400082756237607', '-75.46672940254213', 'Paradero');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(50, 'Carolina del Mar', '10.400525964042146', '-75.4644548892975', 'Paradero');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(51, 'El Club', '10.398162181813762', '-75.4635751247406', 'Paradero');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(52, 'Frente al Ara', '10.3974329936915', '-75.46306014060976', 'Paradero');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(53, 'Parque Huellas de Alberto Uribe', '10.391401032575503', '-75.44850111007692', 'Paradero');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(54, 'Ciudad Jardin', '10.396255313962516', '-75.45953035354616', 'Paradero');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(55, 'Abastos la buenos aires', '10.386504463639922', '-75.4500460624695', 'Paradero');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(56, 'Castellana', '10.39440911320035', '-75.48647582530977', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(57, 'Los Angeles', '10.395132504504229', '-75.49039721488954', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(58, 'Los ejecutivos', '10.399476510450608', '-75.4936856031418', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(59, 'Los cuatros vientos', '10.406455390875468', '-75.50270318984987', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(61, 'Republica del Libano', '10.407331235425238', '-75.5074989795685', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(62, 'Maria bernarda', '10.395190544738437', '-75.4783594608307', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(63, 'Los ejecutivos', '10.403708072266891', '-75.49742996692659', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(64, 'Maria Auxiliadora', '10.40899691616015', '-75.51587283611299', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(65, 'Barzuto', '10.413998653361904', '-75.52443981170656', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(66, 'Las Delicias', '10.416739550210027', '-75.52800983190538', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(67, 'La Popa', '10.42050131934415', '-75.53109973669054', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(68, 'La Popa', '10.42050131934415', '-75.53109973669054', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(69, 'Lo amador', '10.422368645382813', '-75.53470194339754', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(70, 'Mall Plaza', '10.425908760919214', '-75.54049551486969', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(71, 'Centro', '10.425352158236507', '-75.54625153541565', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(72, 'La matuna', '10.424898961565257', '-75.5467450618744', 'Estacion');
INSERT INTO `parada` (`IdParada`, `Nombre`, `Ubicacion_Latitud`, `Ubicacion_Longitud`, `Tipo`) VALUES(73, 'Bodegita', '10.419743869066481', '-75.55168837308885', 'Estacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

DROP TABLE IF EXISTS `ruta`;
CREATE TABLE IF NOT EXISTS `ruta` (
  `IdRuta` int(11) NOT NULL AUTO_INCREMENT,
  `NombreRuta` varchar(45) NOT NULL,
  `TipoRuta` varchar(45) DEFAULT NULL,
  `HorarioLunes_Viernes` varchar(45) DEFAULT NULL,
  `HorarioSabado` varchar(45) DEFAULT NULL,
  `HorarioDomingo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdRuta`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`IdRuta`, `NombreRuta`, `TipoRuta`, `HorarioLunes_Viernes`, `HorarioSabado`, `HorarioDomingo`) VALUES(34, 'A117 POZON - VILLA ESTRELLA', 'Alimentadora', 'No Opera', 'No Opera', 'No Opera');
INSERT INTO `ruta` (`IdRuta`, `NombreRuta`, `TipoRuta`, `HorarioLunes_Viernes`, `HorarioSabado`, `HorarioDomingo`) VALUES(35, 'A115 Prueba', 'Troncal', 'No Opera', 'No Opera', 'No Opera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta_parada`
--

DROP TABLE IF EXISTS `ruta_parada`;
CREATE TABLE IF NOT EXISTS `ruta_parada` (
  `IdRuta` int(11) NOT NULL,
  `IdParada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ruta_parada`
--

INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(34, 48);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 46);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 48);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 50);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 53);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 56);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 58);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 61);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 62);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 63);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 64);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 67);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 68);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 69);
INSERT INTO `ruta_parada` (`IdRuta`, `IdParada`) VALUES(35, 73);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `NombreUsuario` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL,
  `Correo` varchar(320) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `TipoUsuario` varchar(45) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `Correo_UNIQUE` (`Correo`),
  UNIQUE KEY `Telefono_UNIQUE` (`Telefono`),
  UNIQUE KEY `NombreUsuario_UNIQUE` (`NombreUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellidos`, `NombreUsuario`, `Contraseña`, `Correo`, `Telefono`, `TipoUsuario`) VALUES(35, 'Manuel', 'Ponton', 'm', '123123', 'm@m', '30198789', 'administrador');
INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellidos`, `NombreUsuario`, `Contraseña`, `Correo`, `Telefono`, `TipoUsuario`) VALUES(42, 'masmdasd', 'asdmsa', 'asdasd', 'asdasd', 'm@a', '123123123', 'administrador');
INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellidos`, `NombreUsuario`, `Contraseña`, `Correo`, `Telefono`, `TipoUsuario`) VALUES(43, '34123', '123213', 'manuponton', '123123123', 'aqwe@wqe122124', '12123123', 'administrador');
INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellidos`, `NombreUsuario`, `Contraseña`, `Correo`, `Telefono`, `TipoUsuario`) VALUES(44, 'Conductor', '213213', 'c', 'cccccc', 'c@c', '231231', 'conductor');
INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellidos`, `NombreUsuario`, `Contraseña`, `Correo`, `Telefono`, `TipoUsuario`) VALUES(45, 'usuario', 'usuario', 'u', 'uuuuuu', 'u@u', '321235121', 'usuario');
INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellidos`, `NombreUsuario`, `Contraseña`, `Correo`, `Telefono`, `TipoUsuario`) VALUES(46, 'Moderador', 'Moderador', 'momomo', 'momomo', 'modera@mo', '12312312', 'moderador');
INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellidos`, `NombreUsuario`, `Contraseña`, `Correo`, `Telefono`, `TipoUsuario`) VALUES(47, 'Jon', 'Jovi', 'j', 'jjjjjj', 'j@j', '9', 'conductor');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historialconductor`
--
ALTER TABLE `historialconductor`
  ADD CONSTRAINT `fk_historial conductor_articulado1` FOREIGN KEY (`articulado_IdArticulado`) REFERENCES `articulado` (`IdArticulado`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
