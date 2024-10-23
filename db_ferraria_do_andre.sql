-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Out-2024 às 02:28
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_ferraria_do_andre`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `fk_mov_produto`
--

CREATE TABLE `fk_mov_produto` (
  `quantidade` varchar(45) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_movimentacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fabricante`
--

CREATE TABLE `tb_fabricante` (
  `id_fabricante` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_movimentacao`
--

CREATE TABLE `tb_movimentacao` (
  `id_movimentacao` int(11) NOT NULL,
  `dt_movimento` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `preco` varchar(45) NOT NULL,
  `fabricante` varchar(45) NOT NULL,
  `descricao` text DEFAULT NULL,
  `tipo` varchar(45) NOT NULL,
  `id_fabricante` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `link` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo`
--

CREATE TABLE `tb_tipo` (
  `id_tipo` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `tb_tipo`
--

INSERT INTO `tb_tipo` (`id_tipo`, `descricao`) VALUES
(2, 'Usuário Administrador'),
(1, 'Usuário Normal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `email` varchar(70) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `endereco` varchar(70) NOT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `login`, `nome`, `sobrenome`, `email`, `senha`, `telefone`, `endereco`, `id_tipo`) VALUES
(2, 'Henriqeh', 'Henrique', 'Hack', 'Henriquehack2008@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, 'Beco Walter Krieck', 2),
(3, 'Andre', 'Andre', 'de Astora', 'andredeastora@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2341234562', '', 2),
(11, 'Andresafgdasgads', 'Andredasfggdas', 'de Astoragasdghs\\dfsgdsdf', 'andredeastora@gmail.comfghss\\fhsfh', '7c4a8d09ca3762af61e59520943dc26494f8941b', '23412345626', '', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `fk_mov_produto`
--
ALTER TABLE `fk_mov_produto`
  ADD KEY `fk_fk_mov_produto_tb_produto1_idx` (`id_produto`),
  ADD KEY `fk_fk_mov_produto_tb_movimentacao1_idx` (`id_movimentacao`);

--
-- Índices para tabela `tb_fabricante`
--
ALTER TABLE `tb_fabricante`
  ADD PRIMARY KEY (`id_fabricante`),
  ADD UNIQUE KEY `id_fabricante_UNIQUE` (`id_fabricante`);

--
-- Índices para tabela `tb_movimentacao`
--
ALTER TABLE `tb_movimentacao`
  ADD PRIMARY KEY (`id_movimentacao`),
  ADD UNIQUE KEY `id_movimentacao_UNIQUE` (`id_movimentacao`),
  ADD KEY `fk_tb_movimentacao_tb_ususario1_idx` (`id_usuario`),
  ADD KEY `fk_tb_movimentacao_tb_tipo1_idx` (`id_tipo`);

--
-- Índices para tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD UNIQUE KEY `id_produto_UNIQUE` (`id_produto`),
  ADD KEY `fk_tb_produto_tb_fabricante1_idx` (`id_fabricante`),
  ADD KEY `fk_tb_produto_tb_tipo1_idx` (`id_tipo`);

--
-- Índices para tabela `tb_tipo`
--
ALTER TABLE `tb_tipo`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `id_tipo_UNIQUE` (`id_tipo`),
  ADD UNIQUE KEY `id_descricao_UNIQUE` (`descricao`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD KEY `fk_tb_ususario_tb_tipo1_idx` (`id_tipo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_fabricante`
--
ALTER TABLE `tb_fabricante`
  MODIFY `id_fabricante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_movimentacao`
--
ALTER TABLE `tb_movimentacao`
  MODIFY `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_tipo`
--
ALTER TABLE `tb_tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `fk_mov_produto`
--
ALTER TABLE `fk_mov_produto`
  ADD CONSTRAINT `fk_fk_mov_produto_tb_movimentacao1` FOREIGN KEY (`id_movimentacao`) REFERENCES `tb_movimentacao` (`id_movimentacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fk_mov_produto_tb_produto1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_movimentacao`
--
ALTER TABLE `tb_movimentacao`
  ADD CONSTRAINT `fk_tb_movimentacao_tb_tipo1` FOREIGN KEY (`id_tipo`) REFERENCES `tb_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_movimentacao_tb_ususario1` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD CONSTRAINT `fk_tb_produto_tb_fabricante1` FOREIGN KEY (`id_fabricante`) REFERENCES `tb_fabricante` (`id_fabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_produto_tb_tipo1` FOREIGN KEY (`id_tipo`) REFERENCES `tb_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `fk_tb_ususario_tb_tipo1` FOREIGN KEY (`id_tipo`) REFERENCES `tb_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
