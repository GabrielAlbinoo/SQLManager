-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Dez-2022 às 16:43
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_tintas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes_fornecedores`
--

CREATE TABLE `clientes_fornecedores` (
  `CPF_CNPJ` varchar(14) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `Tipo` varchar(1) NOT NULL,
  `Tipo_chave` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `clientes_fornecedores`
--

INSERT INTO `clientes_fornecedores` (`CPF_CNPJ`, `Nome`, `Tipo`, `Tipo_chave`) VALUES
('12345678912', 'Cliente 2', 'C', 'CPF'),
('12345678912345', 'Fornecedor 2', 'F', 'CNPJ'),
('12372433428123', 'Cliente 5', 'C', 'CNPJ'),
('12373428123', 'Cliente 4', 'C', 'CPF'),
('12378928743', 'Cliente 3', 'C', 'CPF'),
('12379814284217', 'Fornecedor 3', 'F', 'CNPJ'),
('27483748329', 'Cliente 1', 'C', 'CPF'),
('33129457545', 'Maria Luiza', 'C', 'CPF'),
('37219457561', 'Pedro Matheus', 'C', 'CPF'),
('37219457562', 'Luiz Eduardo Medeiros', 'C', 'CPF'),
('37219459122', 'Luiz Eduardo Torreão', 'C', 'CPF'),
('47381739284723', 'Fornecedor 1', 'F', 'CNPJ'),
('52372194521', 'Ana Luiza', 'C', 'CPF'),
('58334194582', 'João Paulo', 'C', 'CPF'),
('58372192382', 'Pedro Antonino', 'C', 'CPF'),
('58372194582', '6 Cliente', 'C', 'CPF'),
('58372194586', 'João Pedro', 'C', 'CPF');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `ID` int(8) NOT NULL,
  `ID_transacao` int(8) NOT NULL,
  `Produto` int(12) NOT NULL,
  `Quantidade` int(4) NOT NULL,
  `Valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `compras`
--

INSERT INTO `compras` (`ID`, `ID_transacao`, `Produto`, `Quantidade`, `Valor`) VALUES
(1, 1, 1, 2, 0),
(1, 2, 3, 30, 0),
(2, 1, 3, 1, 0),
(2, 2, 5, 10, 0),
(3, 1, 5, 4, 0),
(3, 2, 5, 5, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `id`
--

CREATE TABLE `id` (
  `id_product` int(10) NOT NULL,
  `id_transacoes` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID_Produto` int(12) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Preco` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`ID_Produto`, `Nome`, `Preco`) VALUES
(1, 'TInta guache', 10),
(2, 'Tinta acrilex', 17.5),
(3, 'tinta coral 1L', 70),
(4, 'Tinta coral Azul 5L', 35),
(5, 'tinta PVC', 12),
(6, 'Tinta Coral Laranja 5l', 35),
(7, 'Tinta Coral verde 5l', 35);

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `ID_transacao` int(8) NOT NULL,
  `Comprador_Vendedor` varchar(14) NOT NULL,
  `Tipo` varchar(1) NOT NULL,
  `Valor_total` float NOT NULL,
  `Data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `transacoes`
--

INSERT INTO `transacoes` (`ID_transacao`, `Comprador_Vendedor`, `Tipo`, `Valor_total`, `Data`) VALUES
(1, '27483748329', 'V', 0, '2022-12-01'),
(2, '12345678912345', 'C', 35, '2022-12-07'),
(3, '12345678912345', 'C', 359.9, '2022-02-18'),
(4, '12345678912345', 'C', 359.9, '2022-02-18');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes_fornecedores`
--
ALTER TABLE `clientes_fornecedores`
  ADD PRIMARY KEY (`CPF_CNPJ`);

--
-- Índices para tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`ID`,`ID_transacao`),
  ADD KEY `ID_transacao` (`ID_transacao`),
  ADD KEY `Produto` (`Produto`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID_Produto`);

--
-- Índices para tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`ID_transacao`),
  ADD KEY `Comprador_Vendedor` (`Comprador_Vendedor`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`Produto`) REFERENCES `produtos` (`ID_Produto`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`ID_transacao`) REFERENCES `transacoes` (`ID_transacao`);

--
-- Limitadores para a tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`Comprador_Vendedor`) REFERENCES `clientes_fornecedores` (`CPF_CNPJ`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
