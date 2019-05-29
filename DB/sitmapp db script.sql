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

-- -----------------------------------------------------
-- Schema sitmapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sitmapp` DEFAULT CHARACTER SET latin1 ;
USE `sitmapp` ;

-- -----------------------------------------------------
-- Table `sitmapp`.`articulado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`articulado` (
  `IdArticulado` INT(11) NOT NULL AUTO_INCREMENT,
  `Codigo_Articulado` VARCHAR(45) NULL DEFAULT NULL,
  `Placa` VARCHAR(7) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Id_Empresa` INT(11) NOT NULL,
  `Nombre_Empresa` VARCHAR(45) NOT NULL,
  `Ubicacion_Latitud` DOUBLE NULL DEFAULT NULL,
  `Ubicacion_Longitud` DOUBLE NULL DEFAULT NULL,
  `Id_Conductor` INT(11) NOT NULL,
  `Id_Ruta` INT(11) NOT NULL,
  PRIMARY KEY (`IdArticulado`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`empresa` (
  `IdEmpresa` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` TEXT NOT NULL,
  PRIMARY KEY (`IdEmpresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`historialconductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`historialconductor` (
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
-- Table `sitmapp`.`noticia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`noticia` (
  `IdNoticia` INT(11) NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NOT NULL,
  `Contenido` TEXT NOT NULL,
  `Fecha` VARCHAR(20) NOT NULL,
  `Id_Usuario` INT(11) NOT NULL,
  PRIMARY KEY (`IdNoticia`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`parada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`parada` (
  `IdParada` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ubicacion_Latitud` VARCHAR(50) NULL DEFAULT NULL,
  `Ubicacion_Longitud` VARCHAR(50) NULL DEFAULT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdParada`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`ruta` (
  `IdRuta` INT(11) NOT NULL AUTO_INCREMENT,
  `NombreRuta` VARCHAR(45) NOT NULL,
  `TipoRuta` VARCHAR(45) NULL DEFAULT NULL,
  `HorarioLunes_Viernes` VARCHAR(45) NULL DEFAULT NULL,
  `HorarioSabado` VARCHAR(45) NULL DEFAULT NULL,
  `HorarioDomingo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdRuta`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sitmapp`.`ruta_parada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitmapp`.`ruta_parada` (
  `IdRuta` INT(11) NOT NULL,
  `IdParada` INT(11) NOT NULL)
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
  PRIMARY KEY (`IdUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = latin1;

USE `sitmapp` ;

-- -----------------------------------------------------
-- procedure sp_create_user
-- -----------------------------------------------------

DELIMITER $$
USE `sitmapp`$$
CREATE DEFINER=`` PROCEDURE `sp_create_user`(in u_nombre varchar(45), u_apellidos varchar(45), u_usuario varchar(45),
u_contraseña varchar(45), u_correo varchar(320), u_telefono varchar(45), u_tipousuario varchar(45))
BEGIN
	INSERT INTO usuario(Nombre, Apellidos, NombreUsuario, Contraseña, Correo, Telefono, TipoUsuario)
    values(u_nombre, u_apellidos, u_usuario, u_contraseña, u_correo, u_telefono, u_tipousuario);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_read_all_rutes
-- -----------------------------------------------------

DELIMITER $$
USE `sitmapp`$$
CREATE DEFINER=`` PROCEDURE `sp_read_all_rutes`()
BEGIN
select * from ruta;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_read_all_users
-- -----------------------------------------------------

DELIMITER $$
USE `sitmapp`$$
CREATE DEFINER=`` PROCEDURE `sp_read_all_users`()
BEGIN
select * from usuario;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_read_specific_user
-- -----------------------------------------------------

DELIMITER $$
USE `sitmapp`$$
CREATE DEFINER=`` PROCEDURE `sp_read_specific_user`(in id_usuario int)
BEGIN
select * from usuario where IdUsuario = id_usuario;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
