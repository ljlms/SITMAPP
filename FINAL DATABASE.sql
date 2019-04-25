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

-- -----------------------------------------------------
-- Schema sitmapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sitmapp` DEFAULT CHARACTER SET latin1 ;
USE `sitmapp` ;

-- -----------------------------------------------------
-- Table `sitmapp`.`conductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`conductor` (
  `IdConductor` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `NombreUsuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  `Ubicacion` GEOMETRY NOT NULL,
  PRIMARY KEY (`IdConductor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`empresa` (
  `IdEmpresa` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdEmpresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`ruta` (
  `IdRuta` INT(11) NOT NULL AUTO_INCREMENT,
  `NombreRuta` VARCHAR(45) NOT NULL,
  `PuntoInicio` VARCHAR(45) NOT NULL,
  `PuntoFinal` VARCHAR(45) NOT NULL,
  `empresa_IdEmpresa` INT(11) NOT NULL,
  PRIMARY KEY (`IdRuta`, `empresa_IdEmpresa`),
  INDEX `fk_ruta_empresa_idx` (`empresa_IdEmpresa` ASC),
  CONSTRAINT `fk_ruta_empresa`
    FOREIGN KEY (`empresa_IdEmpresa`)
    REFERENCES `sitmapp`.`empresa` (`IdEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`articulado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`articulado` (
  `IdArticulado` INT(11) NOT NULL AUTO_INCREMENT,
  `Placa` VARCHAR(7) NOT NULL,
  `Ubicacion` GEOMETRY NOT NULL,
  `ruta_IdRuta` INT(11) NOT NULL,
  `ruta_empresa_IdEmpresa` INT(11) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `conductor_IdConductor` INT(11) NOT NULL,
  PRIMARY KEY (`IdArticulado`, `ruta_IdRuta`, `ruta_empresa_IdEmpresa`, `conductor_IdConductor`),
  INDEX `fk_articulado_ruta1_idx` (`ruta_IdRuta` ASC, `ruta_empresa_IdEmpresa` ASC),
  INDEX `fk_articulado_conductor1_idx` (`conductor_IdConductor` ASC),
  CONSTRAINT `fk_articulado_conductor1`
    FOREIGN KEY (`conductor_IdConductor`)
    REFERENCES `sitmapp`.`conductor` (`IdConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulado_ruta1`
    FOREIGN KEY (`ruta_IdRuta` , `ruta_empresa_IdEmpresa`)
    REFERENCES `sitmapp`.`ruta` (`IdRuta` , `empresa_IdEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`historial conductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`historial conductor` (
  `idHistorial conductor` INT(11) NOT NULL,
  `Fecha` TIMESTAMP NULL DEFAULT NULL,
  `articulado_IdArticulado` INT(11) NOT NULL,
  `articulado_ruta_IdRuta` INT(11) NOT NULL,
  `articulado_ruta_empresa_IdEmpresa` INT(11) NOT NULL,
  `articulado_conductor_IdConductor` INT(11) NOT NULL,
  PRIMARY KEY (`idHistorial conductor`, `articulado_IdArticulado`, `articulado_ruta_IdRuta`, `articulado_ruta_empresa_IdEmpresa`, `articulado_conductor_IdConductor`),
  INDEX `fk_Historial conductor_articulado_idx` (`articulado_IdArticulado` ASC, `articulado_ruta_IdRuta` ASC, `articulado_ruta_empresa_IdEmpresa` ASC, `articulado_conductor_IdConductor` ASC),
  CONSTRAINT `fk_Historial conductor_articulado`
    FOREIGN KEY (`articulado_IdArticulado` , `articulado_ruta_IdRuta` , `articulado_ruta_empresa_IdEmpresa` , `articulado_conductor_IdConductor`)
    REFERENCES `sitmapp`.`articulado` (`IdArticulado` , `ruta_IdRuta` , `ruta_empresa_IdEmpresa` , `conductor_IdConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`horario` (
  `IdHorario` INT(11) NOT NULL,
  `Hora_Inicio` TIME NULL DEFAULT NULL,
  `Hora_Final` TIME NULL DEFAULT NULL,
  `TipoHorario` VARCHAR(45) NOT NULL,
  `ruta_IdRuta` INT(11) NOT NULL,
  `ruta_empresa_IdEmpresa` INT(11) NOT NULL,
  PRIMARY KEY (`IdHorario`, `ruta_IdRuta`, `ruta_empresa_IdEmpresa`),
  INDEX `fk_horario_ruta1_idx` (`ruta_IdRuta` ASC, `ruta_empresa_IdEmpresa` ASC),
  CONSTRAINT `fk_horario_ruta1`
    FOREIGN KEY (`ruta_IdRuta` , `ruta_empresa_IdEmpresa`)
    REFERENCES `sitmapp`.`ruta` (`IdRuta` , `empresa_IdEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`usuario` (
  `IdUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `NombreUsuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(320) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  `TipoUsuario` VARCHAR(45) NOT NULL,
  `noticia_IdNoticia` INT(11) NOT NULL,
  PRIMARY KEY (`IdUsuario`, `noticia_IdNoticia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`noticia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`noticia` (
  `IdNoticia` INT(11) NOT NULL,
  `Titulo` VARCHAR(45) NOT NULL,
  `Contenido` TEXT NOT NULL,
  `Fecha` DATE NOT NULL,
  `usuario_IdUsuario` INT(11) NOT NULL,
  `usuario_noticia_IdNoticia` INT(11) NOT NULL,
  PRIMARY KEY (`IdNoticia`, `usuario_IdUsuario`, `usuario_noticia_IdNoticia`),
  INDEX `fk_noticia_usuario1_idx` (`usuario_IdUsuario` ASC, `usuario_noticia_IdNoticia` ASC),
  CONSTRAINT `fk_noticia_usuario1`
    FOREIGN KEY (`usuario_IdUsuario` , `usuario_noticia_IdNoticia`)
    REFERENCES `sitmapp`.`usuario` (`IdUsuario` , `noticia_IdNoticia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`parada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`parada` (
  `IdParada` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ubicacion` GEOMETRY NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdParada`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`ruta_has_parada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`ruta_has_parada` (
  `ruta_IdRuta` INT(11) NOT NULL,
  `ruta_empresa_IdEmpresa` INT(11) NOT NULL,
  `parada_IdParada` INT(11) NOT NULL,
  PRIMARY KEY (`ruta_IdRuta`, `ruta_empresa_IdEmpresa`, `parada_IdParada`),
  INDEX `fk_ruta_has_parada_parada1_idx` (`parada_IdParada` ASC),
  INDEX `fk_ruta_has_parada_ruta1_idx` (`ruta_IdRuta` ASC, `ruta_empresa_IdEmpresa` ASC),
  CONSTRAINT `fk_ruta_has_parada_parada1`
    FOREIGN KEY (`parada_IdParada`)
    REFERENCES `sitmapp`.`parada` (`IdParada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ruta_has_parada_ruta1`
    FOREIGN KEY (`ruta_IdRuta` , `ruta_empresa_IdEmpresa`)
    REFERENCES `sitmapp`.`ruta` (`IdRuta` , `empresa_IdEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
