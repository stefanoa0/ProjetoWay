-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 12-Jun-2014 às 04:08
-- Versão do servidor: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `way`
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
(2, 'Utilitarios', 'Produtos utilitários');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `custo`
--

INSERT INTO `custo` (`CT_ID`, `CT_Inicial`, `CT_Final`, `CT_Adicional`) VALUES
(1, 10, 100, 80),
(2, 0, NULL, NULL),
(3, 1000, NULL, NULL),
(4, 1000, NULL, NULL),
(5, 1000, NULL, NULL),
(6, 1000, NULL, NULL),
(7, 1000, NULL, NULL),
(8, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE IF NOT EXISTS `equipe` (
  `EQ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EQ_Nome` varchar(45) DEFAULT NULL,
  `EQ_CustoEquipe` float DEFAULT NULL,
  PRIMARY KEY (`EQ_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `equipe`
--

INSERT INTO `equipe` (`EQ_ID`, `EQ_Nome`, `EQ_CustoEquipe`) VALUES
(1, 'Alfa', 10),
(2, 'Bravo', 8200),
(3, 'Gama', 1000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipetrabalhaprojeto`
--

CREATE TABLE IF NOT EXISTS `equipetrabalhaprojeto` (
  `EQ_PRJ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Projeto_PRJ_ID` int(11) NOT NULL,
  `Equipe_EQ_ID` int(11) NOT NULL,
  PRIMARY KEY (`EQ_PRJ_ID`),
  KEY `fk_EquipeTrabalhaProjeto_Projeto1_idx` (`Projeto_PRJ_ID`),
  KEY `fk_EquipeTrabalhaProjeto_Equipe1_idx` (`Equipe_EQ_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `equipetrabalhaprojeto`
--

INSERT INTO `equipetrabalhaprojeto` (`EQ_PRJ_ID`, `Projeto_PRJ_ID`, `Equipe_EQ_ID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 1, 3),
(5, 3, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`LO_ID`, `LO_Login`, `LO_Senha`, `LO_Time`) VALUES
(1, 'stefano', '80980fcaf2ab3f243874695f57b2ed065d8e67e4', '2014-05-17 03:00:00'),
(2, 'claudio', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL),
(3, 'raul', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL);

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
(2, '2012-12-01', '2014-12-31'),
(3, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`PRJ_ID`, `PRJ_Nome`, `PRJ_Descricao`, `Prazo_PRZ_ID`, `Custo_CT_ID`) VALUES
(1, 'padaria', 'sistema de padaria', 1, 1),
(2, 'Açougue', 'sistema de Açougue', 1, 1),
(3, 'Livraria', 'Escopo de uma livraria', 2, 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `recurso`
--

INSERT INTO `recurso` (`REC_ID`, `REC_Nome`, `REC_Quantidade`, `REC_Valor`, `Projeto_PRJ_ID`, `Categoria_CAT_ID`) VALUES
(1, 'RecursoA', 1, 10, 1, 1),
(2, 'Mesa', 2, 1000, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `requisito`
--

INSERT INTO `requisito` (`REQ_ID`, `REQ_Nome`, `REQ_Descricao`, `Projeto_PRJ_ID`) VALUES
(1, 'Interface', 'AAAA', 1),
(2, 'Banco de Dados', 'Banco de dados do projeto', 1);

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
(2, 'Claudio', '123456', 2, 2, 'claudio@gmail.com'),
(3, 'Raul Cardoso', '123456', 2, 3, 'raulcardoso@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuariotrabalhaequipe`
--

CREATE TABLE IF NOT EXISTS `usuariotrabalhaequipe` (
  `Equipe_EQ_ID` int(11) NOT NULL,
  `Usuario_US_ID` int(11) NOT NULL,
  PRIMARY KEY (`Equipe_EQ_ID`,`Usuario_US_ID`),
  KEY `fk_UsuarioTrabalhaEquipe_Equipe1_idx` (`Equipe_EQ_ID`),
  KEY `fk_UsuarioTrabalhaEquipe_Usuário1_idx` (`Usuario_US_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuariotrabalhaequipe`
--

INSERT INTO `usuariotrabalhaequipe` (`Equipe_EQ_ID`, `Usuario_US_ID`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(2, 3),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vprazototal`
--
CREATE TABLE IF NOT EXISTS `vprazototal` (
`DATEDIFF(PRZ_DataFinal, PRZ_DataInicial)` int(7)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_equipe_trabalha_projeto`
--
CREATE TABLE IF NOT EXISTS `v_equipe_trabalha_projeto` (
`EQ_ID` int(11)
,`EQ_Nome` varchar(45)
,`PRJ_ID` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_projetototal`
--
CREATE TABLE IF NOT EXISTS `v_projetototal` (
`PRJ_ID` int(11)
,`PRJ_Nome` varchar(45)
,`PRJ_Descricao` varchar(150)
,`PRZ_DataFinal` date
,`CT_Final` float
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_requisitos_projeto`
--
CREATE TABLE IF NOT EXISTS `v_requisitos_projeto` (
`REQ_Nome` varchar(45)
,`PRJ_ID` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_usuario_trabalha_equipe`
--
CREATE TABLE IF NOT EXISTS `v_usuario_trabalha_equipe` (
`US_ID` int(11)
,`US_Nome` varchar(45)
,`Cargo_CA_ID` int(11)
,`CA_Cargo` varchar(45)
,`EQ_ID` int(11)
,`EQ_Nome` varchar(45)
);
-- --------------------------------------------------------

--
-- Structure for view `vprazototal`
--
DROP TABLE IF EXISTS `vprazototal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprazototal` AS select (to_days(`prazo`.`PRZ_DataFinal`) - to_days(`prazo`.`PRZ_DataInicial`)) AS `DATEDIFF(PRZ_DataFinal, PRZ_DataInicial)` from `prazo`;

-- --------------------------------------------------------

--
-- Structure for view `v_equipe_trabalha_projeto`
--
DROP TABLE IF EXISTS `v_equipe_trabalha_projeto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_equipe_trabalha_projeto` AS select `equipe`.`EQ_ID` AS `EQ_ID`,`equipe`.`EQ_Nome` AS `EQ_Nome`,`projeto`.`PRJ_ID` AS `PRJ_ID` from ((`equipe` join `projeto`) join `equipetrabalhaprojeto`) where ((`equipe`.`EQ_ID` = `equipetrabalhaprojeto`.`Equipe_EQ_ID`) and (`equipetrabalhaprojeto`.`Projeto_PRJ_ID` = `projeto`.`PRJ_ID`));

-- --------------------------------------------------------

--
-- Structure for view `v_projetototal`
--
DROP TABLE IF EXISTS `v_projetototal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_projetototal` AS select `projeto`.`PRJ_ID` AS `PRJ_ID`,`projeto`.`PRJ_Nome` AS `PRJ_Nome`,`projeto`.`PRJ_Descricao` AS `PRJ_Descricao`,`prazo`.`PRZ_DataFinal` AS `PRZ_DataFinal`,`custo`.`CT_Final` AS `CT_Final` from ((`projeto` join `prazo`) join `custo`) where ((`projeto`.`Custo_CT_ID` = `custo`.`CT_ID`) and (`projeto`.`Prazo_PRZ_ID` = `prazo`.`PRZ_ID`));

-- --------------------------------------------------------

--
-- Structure for view `v_requisitos_projeto`
--
DROP TABLE IF EXISTS `v_requisitos_projeto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_requisitos_projeto` AS select `requisito`.`REQ_Nome` AS `REQ_Nome`,`projeto`.`PRJ_ID` AS `PRJ_ID` from (`requisito` join `projeto`) where (`requisito`.`Projeto_PRJ_ID` = `projeto`.`PRJ_ID`);

-- --------------------------------------------------------

--
-- Structure for view `v_usuario_trabalha_equipe`
--
DROP TABLE IF EXISTS `v_usuario_trabalha_equipe`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usuario_trabalha_equipe` AS select `usuario`.`US_ID` AS `US_ID`,`usuario`.`US_Nome` AS `US_Nome`,`usuario`.`Cargo_CA_ID` AS `Cargo_CA_ID`,`cargo`.`CA_Cargo` AS `CA_Cargo`,`equipe`.`EQ_ID` AS `EQ_ID`,`equipe`.`EQ_Nome` AS `EQ_Nome` from (((`usuario` join `cargo`) join `equipe`) join `usuariotrabalhaequipe`) where ((`usuario`.`US_ID` = `usuariotrabalhaequipe`.`Usuario_US_ID`) and (`usuario`.`Cargo_CA_ID` = `cargo`.`CA_ID`) and (`usuariotrabalhaequipe`.`Equipe_EQ_ID` = `equipe`.`EQ_ID`));

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
  ADD CONSTRAINT `fk_UsuarioTrabalhaEquipe_Usuário1` FOREIGN KEY (`Usuario_US_ID`) REFERENCES `usuario` (`US_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
