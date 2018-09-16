
/*DROP AND CREATE TABELA USUARIO*/
DROP TABLE IF EXISTS `slac`.`usuario`;
CREATE TABLE IF NOT EXISTS `slac`.`usuario` (
  `id` INT NOT NULL,
  `login` VARCHAR(30) NOT NULL,
  `senha` VARCHAR(30) NOT NULL,
  `ativo` BIT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB

/*DROP AND CREATE TABELA CHAMADOS*/
DROP TABLE IF EXISTS `slac`.`chamados`;
CREATE TABLE `slac`.`chamados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `local` VARCHAR(50) NOT NULL,
  `prioridade` VARCHAR(30) NOT NULL,
  `data` DATETIME NULL,
  `fotos` LONGBLOB NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id` (`usuario_id` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES usuario (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB