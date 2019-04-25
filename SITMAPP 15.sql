-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

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
-- Table `sitmapp`.`ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`ruta` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`ruta` (
  `IdRuta` INT(11) NOT NULL AUTO_INCREMENT,
  `NombreRuta` VARCHAR(45) NOT NULL,
  `PuntoInicio` VARCHAR(45) NOT NULL,
  `PuntoFinal` VARCHAR(45) NOT NULL,
  `Tipo ruta` VARCHAR(45) NULL DEFAULT NULL,
  `horario_IdHorario` INT(11) NOT NULL,
  PRIMARY KEY (`IdRuta`, `horario_IdHorario`),
  INDEX `fk_ruta_horario1_idx` (`horario_IdHorario` ASC),
  CONSTRAINT `fk_ruta_horario1`
    FOREIGN KEY (`horario_IdHorario`)
    REFERENCES `sitmapp`.`horario` (`IdHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`articulado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`articulado` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`articulado` (
  `IdArticulado` INT(11) NOT NULL AUTO_INCREMENT,
  `Codigo_Articulado` VARCHAR(45) NULL,
  `Placa` VARCHAR(7) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `empresa_IdEmpresa` INT(11) NOT NULL,
  `Nombre_Empresa` VARCHAR(45) NOT NULL,
  `Ubicacion_Latitud` VARCHAR(50) NULL DEFAULT NULL,
  `Ubicacion_Longitud` VARCHAR(50) NULL DEFAULT NULL,
  `conductor_IdConductor` INT(11) NULL,
  `ruta_IdRuta` INT(11) NULL,
  PRIMARY KEY (`IdArticulado`, `empresa_IdEmpresa`, `conductor_IdConductor`, `ruta_IdRuta`),
  INDEX `fk_articulado_conductor1_idx` (`conductor_IdConductor` ASC),
  INDEX `fk_articulado_ruta1_idx` (`ruta_IdRuta` ASC),
  INDEX `fk_articulado_empresa1_idx` (`empresa_IdEmpresa` ASC),
  CONSTRAINT `fk_articulado_conductor1`
    FOREIGN KEY (`conductor_IdConductor`)
    REFERENCES `sitmapp`.`conductor` (`IdConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulado_empresa1`
    FOREIGN KEY (`empresa_IdEmpresa`)
    REFERENCES `sitmapp`.`empresa` (`IdEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulado_ruta1`
    FOREIGN KEY (`ruta_IdRuta`)
    REFERENCES `sitmapp`.`ruta` (`IdRuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`historial conductor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`historial conductor` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`historial conductor` (
  `Fecha` TIMESTAMP NULL DEFAULT NULL,
  `articulado_IdArticulado` INT(11) NOT NULL,
  `articulado_empresa_IdEmpresa` INT(11) NOT NULL,
  `articulado_conductor_IdConductor` INT(11) NOT NULL,
  `articulado_ruta_IdRuta` INT(11) NOT NULL,
  PRIMARY KEY (`articulado_IdArticulado`, `articulado_empresa_IdEmpresa`, `articulado_conductor_IdConductor`, `articulado_ruta_IdRuta`),
  CONSTRAINT `fk_historial conductor_articulado1`
    FOREIGN KEY (`articulado_IdArticulado` , `articulado_empresa_IdEmpresa` , `articulado_conductor_IdConductor` , `articulado_ruta_IdRuta`)
    REFERENCES `sitmapp`.`articulado` (`IdArticulado` , `empresa_IdEmpresa` , `conductor_IdConductor` , `ruta_IdRuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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


-- -----------------------------------------------------
-- Table `sitmapp`.`noticia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`noticia` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`noticia` (
  `IdNoticia` INT(11) NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `Contenido` TEXT NOT NULL,
  `Fecha` DATE NOT NULL,
  `usuario_IdUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`IdNoticia`, `usuario_IdUsuario`),
  INDEX `fk_noticia_usuario1_idx` (`usuario_IdUsuario` ASC),
  CONSTRAINT `fk_noticia_usuario1`
    FOREIGN KEY (`usuario_IdUsuario`)
    REFERENCES `sitmapp`.`usuario` (`IdUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Table `sitmapp`.`ruta_has_parada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sitmapp`.`ruta_has_parada` ;

CREATE TABLE IF NOT EXISTS `sitmapp`.`ruta_has_parada` (
  `ruta_IdRuta` INT(11) NOT NULL,
  `ruta_horario_IdHorario` INT(11) NOT NULL,
  `parada_IdParada` INT(11) NOT NULL,
  PRIMARY KEY (`ruta_IdRuta`, `ruta_horario_IdHorario`, `parada_IdParada`),
  INDEX `fk_ruta_has_parada_parada1_idx` (`parada_IdParada` ASC),
  INDEX `fk_ruta_has_parada_ruta1_idx` (`ruta_IdRuta` ASC, `ruta_horario_IdHorario` ASC),
  CONSTRAINT `fk_ruta_has_parada_parada1`
    FOREIGN KEY (`parada_IdParada`)
    REFERENCES `sitmapp`.`parada` (`IdParada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ruta_has_parada_ruta1`
    FOREIGN KEY (`ruta_IdRuta` , `ruta_horario_IdHorario`)
    REFERENCES `sitmapp`.`ruta` (`IdRuta` , `horario_IdHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
