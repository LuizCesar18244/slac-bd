
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema slac
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema slac
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `slac` DEFAULT CHARACTER SET utf8 ;
USE `slac` ;

-- -----------------------------------------------------
-- Table `slac`.`usuario`
-- -----------------------------------------------------
/*DROP AND CREATE TABELA USUARIO*/
DROP TABLE IF EXISTS `slac`.`usuario`;

CREATE TABLE IF NOT EXISTS `slac`.`usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `senha` VARCHAR(30) NOT NULL,
  `ativo` BIT(1) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `administrador` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

/*INSERT INTO TABELA USUARIO*/
INSERT INTO usuario VALUES (default, 'Luiz Cesar Almeida da Silva', 'Luiz','luizcesar@gmail.com', '1234', true, 'FUNCIONARIO', true );

-- -----------------------------------------------------
-- Table `slac`.`chamados`
-- -----------------------------------------------------
/*DROP AND CREATE TABELA CHAMADOS*/
DROP TABLE IF EXISTS `slac`.`chamados`;

CREATE TABLE IF NOT EXISTS `slac`.`chamados` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `local` VARCHAR(50) NOT NULL,
  `prioridade` VARCHAR(30) NOT NULL,
  `data` DATETIME NULL DEFAULT NULL,
  `fotos` LONGBLOB NULL DEFAULT NULL,
  `status` VARCHAR(30) NOT NULL,
  `usuario_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id` (`usuario_id` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `slac`.`usuario` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `slac`.`avaliacao`
-- -----------------------------------------------------
/*DROP AND CREATE TABELA AVALIACAO*/
DROP TABLE IF EXISTS `slac`.`avaliacao`;

CREATE TABLE IF NOT EXISTS `slac`.`avaliacao` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nota` INT(11) NOT NULL,
  `mensagem` VARCHAR(45) NULL DEFAULT NULL,
  `id_chamado` INT(11) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_chamado_idx` (`id_chamado` ASC),
  INDEX `id_usuario_idx` (`id_usuario` ASC),
  CONSTRAINT `id_chamado`
    FOREIGN KEY (`id_chamado`)
    REFERENCES `slac`.`chamados` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `slac`.`usuario` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `slac`.`menu`
-- -----------------------------------------------------
/*DROP AND CREATE TABELA MENU*/
DROP TABLE IF EXISTS `slac`.`menu`;

CREATE TABLE IF NOT EXISTS `slac`.`menu` (
  `id` INT(11) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `icone` VARCHAR(45) NULL DEFAULT NULL,
  `page` VARCHAR(45) NULL DEFAULT NULL,
  `administrador` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

/*INSERT TABELA MENU*/

INSERT INTO menu VALUES (1, 'Cadastrar Usuário', 'person-add', 'NovoUsuarioPage', true);
INSERT INTO menu VALUES (2, 'Consultar Usuário', 'person', 'ConsultaUsuarioPage', true);
INSERT INTO menu VALUES (3, 'Relatórios', 'stats', 'LoginPage', true);
INSERT INTO menu VALUES (4, 'Novo Chamado', 'person-add', 'NovoChamadoPage', false);
INSERT INTO menu VALUES (5, 'Seus chamados', 'person', 'LoginPage', false);
INSERT INTO menu VALUES (6, 'Mensagens', 'text', 'LoginPage', false);
INSERT INTO menu VALUES (7, 'Avaliações', 'trending-up', 'LoginPage', false);
INSERT INTO menu VALUES (8, 'Tutorial', 'bulb', 'LoginPage', false);
INSERT INTO menu VALUES (9, 'A equipe de manutenção', 'construct', 'LoginPage', false);
INSERT INTO menu VALUES (10, 'Sobre', 'help-circle', 'LoginPage', false);
INSERT INTO menu VALUES (11, 'Logout', 'exit', 'LoginPage', false);


-- -----------------------------------------------------
-- Table `slac`.`mensagem`
-- -----------------------------------------------------
/*DROP AND CREATE TABELA MENSAGEM*/
DROP TABLE IF EXISTS `slac`.`mensagem`;

CREATE TABLE IF NOT EXISTS `slac`.`mensagem` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(255) NOT NULL,
  `usuario_id` INT(11) NULL DEFAULT NULL,
  `responsavel_id` INT(11) NULL DEFAULT NULL,
  `data` DATETIME NULL DEFAULT NULL,
  `solicitante` VARCHAR(100) NULL DEFAULT NULL,
  `responsavel` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `slac`.`versao`
-- -----------------------------------------------------
/*DROP AND CREATE TABELA VERSÃO*/
DROP TABLE IF EXISTS `slac`.`versao`;

CREATE TABLE IF NOT EXISTS `slac`.`versao` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `back_end` DOUBLE NOT NULL,
  `front_end` DOUBLE NOT NULL,
  `banco_de_dados` DOUBLE NOT NULL,
  `linguagem_back` VARCHAR(255) NOT NULL,
  `linguagem_front` VARCHAR(255) NOT NULL,
  `linguagem_banco` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

