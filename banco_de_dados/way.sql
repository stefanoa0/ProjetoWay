-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 23-Maio-2014 às 02:21
-- Versão do servidor: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;



--
-- Estrutura da tabela `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `CA_ID` int(11) NOT NULL,
  `CA_Cargo` varchar(45) DEFAULT NULL,
  `CA_Salario` float DEFAULT NULL,
  PRIMARY KEY (`CA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`CA_ID`, `CA_Cargo`, `CA_Salario`) VALUES
(1, 'Gerente', 2000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `CAT_ID` int(11) NOT NULL,
  `CAT_Nome` varchar(45) DEFAULT NULL,
  `CAT_Descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `custo`
--

CREATE TABLE IF NOT EXISTS `custo` (
  `CT_ID` int(11) NOT NULL,
  `CT_Inicial` float DEFAULT NULL,
  `CT_Final` float DEFAULT NULL,
  `CT_Adicional` float DEFAULT NULL,
  PRIMARY KEY (`CT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE IF NOT EXISTS `equipe` (
  `EQ_ID` int(11) NOT NULL,
  `EQ_Nome` varchar(45) DEFAULT NULL,
  `EQ_CustoEquipe` float DEFAULT NULL,
  PRIMARY KEY (`EQ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipetrabalhaprojeto`
--

CREATE TABLE IF NOT EXISTS `equipetrabalhaprojeto` (
  `Projeto_PRJ_ID` int(11) NOT NULL,
  `Equipe_EQ_ID` int(11) NOT NULL,
  PRIMARY KEY (`Projeto_PRJ_ID`,`Equipe_EQ_ID`),
  KEY `fk_EquipeTrabalhaProjeto_Projeto1_idx` (`Projeto_PRJ_ID`),
  KEY `fk_EquipeTrabalhaProjeto_Equipe1_idx` (`Equipe_EQ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `etapa`
--

CREATE TABLE IF NOT EXISTS `etapa` (
  `ET_ID` int(11) NOT NULL,
  `ET_Nome` varchar(45) DEFAULT NULL,
  `ET_Descricao` varchar(100) DEFAULT NULL,
  `Projeto_PRJ_ID` int(11) NOT NULL,
  PRIMARY KEY (`ET_ID`),
  KEY `fk_Etapa_Projeto1_idx` (`Projeto_PRJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `LO_ID` int(11) NOT NULL,
  `LO_Login` varchar(45) DEFAULT NULL,
  `LO_Senha` varchar(45) DEFAULT NULL,
  `LO_Time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`LO_ID`, `LO_Login`, `LO_Senha`, `LO_Time`) VALUES
(1, 'stefano', '80980fcaf2ab3f243874695f57b2ed065d8e67e4', '2014-05-17 03:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prazo`
--

CREATE TABLE IF NOT EXISTS `prazo` (
  `PRZ_ID` int(11) NOT NULL,
  `PRZ_DataInicial` date DEFAULT NULL,
  `PRZ_DataFinal` date DEFAULT NULL,
  PRIMARY KEY (`PRZ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE IF NOT EXISTS `projeto` (
  `PRJ_ID` int(11) NOT NULL,
  `PRJ_Nome` varchar(45) DEFAULT NULL,
  `PRJ_Descricao` varchar(150) DEFAULT NULL,
  `Prazo_PRZ_ID` int(11) NOT NULL,
  `Custo_CT_ID` int(11) NOT NULL,
  PRIMARY KEY (`PRJ_ID`),
  KEY `fk_Projeto_Prazo1_idx` (`Prazo_PRZ_ID`),
  KEY `fk_Projeto_Custo1_idx` (`Custo_CT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `recurso`
--

CREATE TABLE IF NOT EXISTS `recurso` (
  `REC_ID` int(11) NOT NULL,
  `REC_Nome` varchar(45) DEFAULT NULL,
  `REC_Quantidade` int(11) DEFAULT NULL,
  `REC_Valor` float DEFAULT NULL,
  `Projeto_PRJ_ID` int(11) NOT NULL,
  `Categoria_CAT_ID` int(11) NOT NULL,
  PRIMARY KEY (`REC_ID`),
  KEY `fk_Recurso_Projeto1_idx` (`Projeto_PRJ_ID`),
  KEY `fk_Recurso_Categoria1_idx` (`Categoria_CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `requisito`
--

CREATE TABLE IF NOT EXISTS `requisito` (
  `REQ_ID` int(11) NOT NULL,
  `REQ_Nome` varchar(45) DEFAULT NULL,
  `REQ_Descricao` varchar(100) DEFAULT NULL,
  `Projeto_PRJ_ID` int(11) NOT NULL,
  PRIMARY KEY (`REQ_ID`),
  KEY `fk_Requisito_Projeto1_idx` (`Projeto_PRJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `US_ID` int(11) NOT NULL,
  `US_Nome` varchar(45) DEFAULT NULL,
  `US_CPF` varchar(45) DEFAULT NULL,
  `Cargo_CA_ID` int(11) NOT NULL,
  `Login_LO_ID` int(11) NOT NULL,
  `US_Email` varchar(45) NOT NULL,
  PRIMARY KEY (`US_ID`),
  UNIQUE KEY `US_Email` (`US_Email`),
  KEY `fk_Usuário_Cargo_idx` (`Cargo_CA_ID`),
  KEY `fk_Usuário_Login1_idx` (`Login_LO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--
-- --------------------------------------------------------

--
-- Estrutura da tabela `alteracao_senha`
--

CREATE TABLE IF NOT EXISTS `alteracao_senha` (
  `AS_Token` varchar(45) NOT NULL,
  `AS_ID` int(11) NOT NULL,
  `US_ID` int(11) NOT NULL,
  PRIMARY KEY (`AS_ID`),
  UNIQUE KEY `AS_Token` (`AS_Token`),
  KEY `fk_Usuário_AlteraSenha_idx` (`US_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

INSERT INTO `usuario` (`US_ID`, `US_Nome`, `US_CPF`, `Cargo_CA_ID`, `Login_LO_ID`, `US_Email`) VALUES
(1, 'Stefano', '12345679', 1, 1, 'stefanoazevedo@hotmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuariotrabalhaequipe`
--

CREATE TABLE IF NOT EXISTS `usuariotrabalhaequipe` (
  `Equipe_EQ_ID` int(11) NOT NULL,
  `Usuário_US_ID` int(11) NOT NULL,
  PRIMARY KEY (`Equipe_EQ_ID`,`Usuário_US_ID`),
  KEY `fk_UsuarioTrabalhaEquipe_Equipe1_idx` (`Equipe_EQ_ID`),
  KEY `fk_UsuarioTrabalhaEquipe_Usuário1_idx` (`Usuário_US_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `equipetrabalhaprojeto`
--
ALTER TABLE `equipetrabalhaprojeto`
  ADD CONSTRAINT `fk_EquipeTrabalhaProjeto_Equipe1` FOREIGN KEY (`Equipe_EQ_ID`) REFERENCES `equipe` (`EQ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EquipeTrabalhaProjeto_Projeto1` FOREIGN KEY (`Projeto_PRJ_ID`) REFERENCES `projeto` (`PRJ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `etapa`
--
ALTER TABLE `etapa`
  ADD CONSTRAINT `fk_Etapa_Projeto1` FOREIGN KEY (`Projeto_PRJ_ID`) REFERENCES `projeto` (`PRJ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `fk_Projeto_Custo1` FOREIGN KEY (`Custo_CT_ID`) REFERENCES `custo` (`CT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Projeto_Prazo1` FOREIGN KEY (`Prazo_PRZ_ID`) REFERENCES `prazo` (`PRZ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `recurso`
--
ALTER TABLE `recurso`
  ADD CONSTRAINT `fk_Recurso_Categoria1` FOREIGN KEY (`Categoria_CAT_ID`) REFERENCES `categoria` (`CAT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Recurso_Projeto1` FOREIGN KEY (`Projeto_PRJ_ID`) REFERENCES `projeto` (`PRJ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `requisito`
--
ALTER TABLE `requisito`
  ADD CONSTRAINT `fk_Requisito_Projeto1` FOREIGN KEY (`Projeto_PRJ_ID`) REFERENCES `projeto` (`PRJ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuário_Cargo` FOREIGN KEY (`Cargo_CA_ID`) REFERENCES `cargo` (`CA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuário_Login1` FOREIGN KEY (`Login_LO_ID`) REFERENCES `login` (`LO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuariotrabalhaequipe`
--
ALTER TABLE `usuariotrabalhaequipe`
  ADD CONSTRAINT `fk_UsuarioTrabalhaEquipe_Equipe1` FOREIGN KEY (`Equipe_EQ_ID`) REFERENCES `equipe` (`EQ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_UsuarioTrabalhaEquipe_Usuário1` FOREIGN KEY (`Usuário_US_ID`) REFERENCES `usuario` (`US_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;


