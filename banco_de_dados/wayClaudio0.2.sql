-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.27
-- Versão do PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `way`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alteracao_senha`
--

CREATE TABLE IF NOT EXISTS `alteracao_senha` (
  `AS_Token` varchar(45) NOT NULL,
  `AS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `US_ID` int(11) NOT NULL,
  PRIMARY KEY (`AS_ID`),
  UNIQUE KEY `AS_Token` (`AS_Token`),
  KEY `fk_Usuário_AlteraSenha_idx` (`US_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `CA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CA_Cargo` varchar(45) DEFAULT NULL,
  `CA_Salario` float DEFAULT NULL,
  PRIMARY KEY (`CA_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`CA_ID`, `CA_Cargo`, `CA_Salario`) VALUES
(1, 'Gerente', 2000),
(2, 'DBA', 5000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `CAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAT_Nome` varchar(45) DEFAULT NULL,
  `CAT_Descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`CAT_ID`, `CAT_Nome`, `CAT_Descricao`) VALUES
(1, 'CategoriaA', 'DescricaoA'),
(2, 'j', 'j');

-- --------------------------------------------------------

--
-- Estrutura da tabela `custo`
--

CREATE TABLE IF NOT EXISTS `custo` (
  `CT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CT_Inicial` float DEFAULT NULL,
  `CT_Final` float DEFAULT NULL,
  `CT_Adicional` float DEFAULT NULL,
  PRIMARY KEY (`CT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `custo`
--

INSERT INTO `custo` (`CT_ID`, `CT_Inicial`, `CT_Final`, `CT_Adicional`) VALUES
(1, 10, 100, 80),
(2, 22, NULL, NULL),
(3, 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE IF NOT EXISTS `equipe` (
  `EQ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EQ_Nome` varchar(45) DEFAULT NULL,
  `EQ_CustoEquipe` float DEFAULT NULL,
  PRIMARY KEY (`EQ_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Extraindo dados da tabela `equipe`
--

INSERT INTO `equipe` (`EQ_ID`, `EQ_Nome`, `EQ_CustoEquipe`) VALUES
(1, 'A', 10),
(28, 'B', 200);

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

--
-- Extraindo dados da tabela `equipetrabalhaprojeto`
--

INSERT INTO `equipetrabalhaprojeto` (`Projeto_PRJ_ID`, `Equipe_EQ_ID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `etapa`
--

CREATE TABLE IF NOT EXISTS `etapa` (
  `ET_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ET_Nome` varchar(45) DEFAULT NULL,
  `ET_Descricao` varchar(100) DEFAULT NULL,
  `Projeto_PRJ_ID` int(11) NOT NULL,
  PRIMARY KEY (`ET_ID`),
  KEY `fk_Etapa_Projeto1_idx` (`Projeto_PRJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `LO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LO_Login` varchar(45) DEFAULT NULL,
  `LO_Senha` varchar(45) DEFAULT NULL,
  `LO_Time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`LO_ID`, `LO_Login`, `LO_Senha`, `LO_Time`) VALUES
(1, 'stefano', '80980fcaf2ab3f243874695f57b2ed065d8e67e4', '2014-05-17 03:00:00'),
(2, 'h', '27d5482eebd075de44389774fce28c69f45c8a75', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prazo`
--

CREATE TABLE IF NOT EXISTS `prazo` (
  `PRZ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRZ_DataInicial` date DEFAULT NULL,
  `PRZ_DataFinal` date DEFAULT NULL,
  PRIMARY KEY (`PRZ_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `prazo`
--

INSERT INTO `prazo` (`PRZ_ID`, `PRZ_DataInicial`, `PRZ_DataFinal`) VALUES
(1, '2014-05-09', '2014-05-24'),
(2, '2014-05-01', '2014-05-07'),
(3, '2014-05-17', '2014-05-21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE IF NOT EXISTS `projeto` (
  `PRJ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRJ_Nome` varchar(45) DEFAULT NULL,
  `PRJ_Descricao` varchar(150) DEFAULT NULL,
  `Prazo_PRZ_ID` int(11) NOT NULL,
  `Custo_CT_ID` int(11) NOT NULL,
  PRIMARY KEY (`PRJ_ID`),
  KEY `fk_Projeto_Prazo1_idx` (`Prazo_PRZ_ID`),
  KEY `fk_Projeto_Custo1_idx` (`Custo_CT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`PRJ_ID`, `PRJ_Nome`, `PRJ_Descricao`, `Prazo_PRZ_ID`, `Custo_CT_ID`) VALUES
(1, 'padaria', 'sistema de padaria', 1, 1),
(2, 'Açougue', 'sistema de Açougue', 1, 1),
(3, 'a', 'a', 2, 2),
(4, 'b', 'b', 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `recurso`
--

CREATE TABLE IF NOT EXISTS `recurso` (
  `REC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REC_Nome` varchar(45) DEFAULT NULL,
  `REC_Quantidade` int(11) DEFAULT NULL,
  `REC_Valor` float DEFAULT NULL,
  `Projeto_PRJ_ID` int(11) NOT NULL,
  `Categoria_CAT_ID` int(11) NOT NULL,
  PRIMARY KEY (`REC_ID`),
  KEY `fk_Recurso_Projeto1_idx` (`Projeto_PRJ_ID`),
  KEY `fk_Recurso_Categoria1_idx` (`Categoria_CAT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `recurso`
--

INSERT INTO `recurso` (`REC_ID`, `REC_Nome`, `REC_Quantidade`, `REC_Valor`, `Projeto_PRJ_ID`, `Categoria_CAT_ID`) VALUES
(1, 'RecursoA', 1, 10, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `requisito`
--

CREATE TABLE IF NOT EXISTS `requisito` (
  `REQ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REQ_Nome` varchar(45) DEFAULT NULL,
  `REQ_Descricao` varchar(100) DEFAULT NULL,
  `Projeto_PRJ_ID` int(11) NOT NULL,
  PRIMARY KEY (`REQ_ID`),
  KEY `fk_Requisito_Projeto1_idx` (`Projeto_PRJ_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `requisito`
--

INSERT INTO `requisito` (`REQ_ID`, `REQ_Nome`, `REQ_Descricao`, `Projeto_PRJ_ID`) VALUES
(1, 'Requisito', 'AAAA', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `US_ID` int(11) NOT NULL AUTO_INCREMENT,
  `US_Nome` varchar(45) DEFAULT NULL,
  `US_CPF` varchar(45) DEFAULT NULL,
  `Cargo_CA_ID` int(11) NOT NULL,
  `Login_LO_ID` int(11) NOT NULL,
  `US_Email` varchar(45) NOT NULL,
  PRIMARY KEY (`US_ID`),
  UNIQUE KEY `US_Email` (`US_Email`),
  KEY `fk_Usuário_Cargo_idx` (`Cargo_CA_ID`),
  KEY `fk_Usuário_Login1_idx` (`Login_LO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`US_ID`, `US_Nome`, `US_CPF`, `Cargo_CA_ID`, `Login_LO_ID`, `US_Email`) VALUES
(1, 'Stefano', '12345679', 1, 1, 'stefanoazevedo@hotmail.com'),
(2, 'h', 'h', 1, 2, 'h'),
(3, 'marcos', '00', 1, 1, 'as');

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
-- Extraindo dados da tabela `usuariotrabalhaequipe`
--

INSERT INTO `usuariotrabalhaequipe` (`Equipe_EQ_ID`, `Usuário_US_ID`) VALUES
(1, 1),
(28, 1),
(28, 2);

-- --------------------------------------------------------

--
-- Estrutura stand-in para visualizar `vprazototal`
--
CREATE TABLE IF NOT EXISTS `vprazototal` (
`DATEDIFF(PRZ_DataFinal, PRZ_DataInicial)` int(7)
);
-- --------------------------------------------------------

--
-- Estrutura stand-in para visualizar `vprojeto`
--
CREATE TABLE IF NOT EXISTS `vprojeto` (
`PRJ_Nome` varchar(45)
,`PRJ_Descricao` varchar(150)
,`US_Nome` varchar(45)
,`EQ_Nome` varchar(45)
,`REC_Nome` varchar(45)
,`REC_Quantidade` int(11)
,`REQ_Nome` varchar(45)
);
-- --------------------------------------------------------

--
-- Estrutura stand-in para visualizar `vusuariosequipe`
--
CREATE TABLE IF NOT EXISTS `vusuariosequipe` (
`Equipe_EQ_ID` int(11)
,`US_Nome` varchar(45)
);
-- --------------------------------------------------------

--
-- Estrutura para visualizar `vprazototal`
--
DROP TABLE IF EXISTS `vprazototal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprazototal` AS select (to_days(`prazo`.`PRZ_DataFinal`) - to_days(`prazo`.`PRZ_DataInicial`)) AS `DATEDIFF(PRZ_DataFinal, PRZ_DataInicial)` from `prazo`;

-- --------------------------------------------------------

--
-- Estrutura para visualizar `vprojeto`
--
DROP TABLE IF EXISTS `vprojeto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprojeto` AS select `projeto`.`PRJ_Nome` AS `PRJ_Nome`,`projeto`.`PRJ_Descricao` AS `PRJ_Descricao`,`usuario`.`US_Nome` AS `US_Nome`,`equipe`.`EQ_Nome` AS `EQ_Nome`,`recurso`.`REC_Nome` AS `REC_Nome`,`recurso`.`REC_Quantidade` AS `REC_Quantidade`,`requisito`.`REQ_Nome` AS `REQ_Nome` from (((((((`projeto` join `usuario`) join `equipe`) join `recurso`) join `requisito`) join `vprazototal`) join `custo`) join `equipetrabalhaprojeto`);

-- --------------------------------------------------------

--
-- Estrutura para visualizar `vusuariosequipe`
--
DROP TABLE IF EXISTS `vusuariosequipe`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vusuariosequipe` AS select `usuariotrabalhaequipe`.`Equipe_EQ_ID` AS `Equipe_EQ_ID`,`usuario`.`US_Nome` AS `US_Nome` from (`usuario` join `usuariotrabalhaequipe`) where (`usuariotrabalhaequipe`.`Usuário_US_ID` = `usuario`.`US_ID`);

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `equipetrabalhaprojeto`
--
ALTER TABLE `equipetrabalhaprojeto`
  ADD CONSTRAINT `fk_EquipeTrabalhaProjeto_Equipe1` FOREIGN KEY (`Equipe_EQ_ID`) REFERENCES `equipe` (`EQ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EquipeTrabalhaProjeto_Projeto1` FOREIGN KEY (`Projeto_PRJ_ID`) REFERENCES `projeto` (`PRJ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `etapa`
--
ALTER TABLE `etapa`
  ADD CONSTRAINT `fk_Etapa_Projeto1` FOREIGN KEY (`Projeto_PRJ_ID`) REFERENCES `projeto` (`PRJ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `fk_Projeto_Custo1` FOREIGN KEY (`Custo_CT_ID`) REFERENCES `custo` (`CT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Projeto_Prazo1` FOREIGN KEY (`Prazo_PRZ_ID`) REFERENCES `prazo` (`PRZ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `recurso`
--
ALTER TABLE `recurso`
  ADD CONSTRAINT `fk_Recurso_Categoria1` FOREIGN KEY (`Categoria_CAT_ID`) REFERENCES `categoria` (`CAT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Recurso_Projeto1` FOREIGN KEY (`Projeto_PRJ_ID`) REFERENCES `projeto` (`PRJ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `requisito`
--
ALTER TABLE `requisito`
  ADD CONSTRAINT `fk_Requisito_Projeto1` FOREIGN KEY (`Projeto_PRJ_ID`) REFERENCES `projeto` (`PRJ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuário_Cargo` FOREIGN KEY (`Cargo_CA_ID`) REFERENCES `cargo` (`CA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuário_Login1` FOREIGN KEY (`Login_LO_ID`) REFERENCES `login` (`LO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `usuariotrabalhaequipe`
--
ALTER TABLE `usuariotrabalhaequipe`
  ADD CONSTRAINT `fk_UsuarioTrabalhaEquipe_Equipe1` FOREIGN KEY (`Equipe_EQ_ID`) REFERENCES `equipe` (`EQ_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_UsuarioTrabalhaEquipe_Usuário1` FOREIGN KEY (`Usuário_US_ID`) REFERENCES `usuario` (`US_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
