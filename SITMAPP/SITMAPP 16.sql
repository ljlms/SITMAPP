-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sitmapp
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sitmapp` ;

-- -----------------------------------------------------
-- Schema sitmapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sitmapp` DEFAULT CHARACTER SET latin1 ;
USE `sitmapp` ;

-- -----------------------------------------------------
-- Table `sitmapp`.`articulado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`articulado` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`articulado` (
  `IdArticulado` INT(11) NOT NULL AUTO_INCREMENT,
  `Codigo_Articulado` VARCHAR(45) NULL DEFAULT NULL,
  `Placa` VARCHAR(7) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Id_Empresa` INT(11) NOT NULL,
  `Nombre_Empresa` VARCHAR(45) NOT NULL,
  `Ubicacion_Latitud` VARCHAR(50) NULL DEFAULT NULL,
  `Ubicacion_Longitud` VARCHAR(50) NULL DEFAULT NULL,
  `Id_Conductor` INT(11) NOT NULL,
  `Id_Ruta` INT(11) NOT NULL,
  PRIMARY KEY (`IdArticulado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`conductor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`conductor` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`conductor` (
  `IdConductor` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `NombreUsuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  `Ubicacion_Latitud` VARCHAR(50) NULL DEFAULT NULL,
  `Ubicacion_Longitud` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`IdConductor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`empresa` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`empresa` (
  `IdEmpresa` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdEmpresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`historial conductor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`historial conductor` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`historial conductor` (
  `Fecha` TIMESTAMP NULL DEFAULT NULL,
  `articulado_IdArticulado` INT(11) NOT NULL,
  PRIMARY KEY (`articulado_IdArticulado`),
  CONSTRAINT `fk_historial conductor_articulado1`
    FOREIGN KEY (`articulado_IdArticulado`)
    REFERENCES `sitmapp`.`articulado` (`IdArticulado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`horario` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`horario` (
  `IdHorario` INT(11) NOT NULL,
  `Lunes_Viernes` TIME NULL DEFAULT NULL,
  `Sabado` TIME NULL DEFAULT NULL,
  `TipoHorario` VARCHAR(45) NOT NULL,
  `Domingo_Festivo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdHorario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`noticia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`noticia` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`noticia` (
  `IdNoticia` INT(11) NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `Contenido` TEXT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Id_Usuario` INT NOT NULL,
  PRIMARY KEY (`IdNoticia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`parada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`parada` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`parada` (
  `IdParada` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ubicacion_Latitud` VARCHAR(50) NULL DEFAULT NULL,
  `Ubicacion_Longitud` VARCHAR(50) NULL DEFAULT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdParada`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`ruta` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`ruta` (
  `IdRuta` INT(11) NOT NULL AUTO_INCREMENT,
  `NombreRuta` VARCHAR(45) NOT NULL,
  `PuntoInicio` VARCHAR(45) NOT NULL,
  `PuntoFinal` VARCHAR(45) NOT NULL,
  `Tipo ruta` VARCHAR(45) NULL DEFAULT NULL,
  `IdHorario` INT(11) NOT NULL,
  `IdParada` INT NOT NULL,
  PRIMARY KEY (`IdRuta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`usuario` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`usuario` (
  `IdUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `NombreUsuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(320) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  `TipoUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
