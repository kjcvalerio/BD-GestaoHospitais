SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `grupo_hospitais`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `analise_clinicas`
--

CREATE TABLE `analise_clinicas` (
  `id` int(11) NOT NULL,
  `data_analise` timestamp NOT NULL DEFAULT current_timestamp(),
  `nome` char(20) DEFAULT NULL,
  `tipo` char(20) DEFAULT NULL,
  `resultado` char(20) DEFAULT NULL,
  `id_analista` int(11) NOT NULL,
  `id_doente` int(11) NOT NULL,
  `id_laboratorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `analista_clinico`
--

CREATE TABLE `analista_clinico` (
  `id_analista` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_hospital` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `analista_clinico`
--

INSERT INTO `analista_clinico` (`id_analista`, `id_pessoa`, `id_hospital`) VALUES
(1, 10, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_medico`
--

CREATE TABLE `atendimento_medico` (
  `id_atendimento` int(11) NOT NULL,
  `data_atendimento` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_medico` int(11) NOT NULL,
  `id_doente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `camas`
--

CREATE TABLE `camas` (
  `id_camas` int(11) NOT NULL,
  `num_camas` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nome` char(20) NOT NULL,
  `vencimento` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nome`, `vencimento`) VALUES
(1, 'Enfermeiro', '999.99'),
(2, 'Medico', '999.99'),
(6, 'Farmaceutico', '999.99'),
(7, 'Analista', '999.99'),
(8, 'Limpeza', '999.99');

-- --------------------------------------------------------

--
-- Estrutura da tabela `doente`
--

CREATE TABLE `doente` (
  `id_doente` int(11) NOT NULL,
  `doenca` char(20) DEFAULT NULL,
  `id_pessoa` int(11) NOT NULL,
  `empregado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empregado`
--

CREATE TABLE `empregado` (
  `id_empregado` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_hospital` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `empregado`
--

INSERT INTO `empregado` (`id_empregado`, `id_pessoa`, `id_categoria`, `id_hospital`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id` int(11) NOT NULL,
  `localidade` char(20) DEFAULT NULL,
  `bairro` char(10) DEFAULT NULL,
  `rua` char(20) DEFAULT NULL,
  `numéro_casa` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id`, `localidade`, `bairro`, `rua`, `numéro_casa`) VALUES
(1, 'Luanda', 'Vila-Flor', NULL, NULL),
(2, 'Luanda', 'Camorteiro', NULL, NULL),
(3, 'Luanda', 'Pirão', NULL, NULL),
(4, 'Luanda', 'Kikagil', NULL, NULL),
(5, 'Luanda', 'Bita', NULL, NULL),
(6, 'Luanda', 'Vila-Flor', NULL, NULL),
(7, 'Luanda', 'Camorteiro', NULL, NULL),
(8, 'Luanda', 'Pirão', NULL, NULL),
(9, 'Luanda', 'Kikagil', NULL, NULL),
(10, 'Luanda', 'Bita', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `enfermaria`
--

CREATE TABLE `enfermaria` (
  `id_enfermaria` int(11) NOT NULL,
  `sigla` char(20) NOT NULL,
  `id_empregado` int(11) NOT NULL,
  `id_hospital` int(11) NOT NULL,
  `id_camas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enfermeiro`
--

CREATE TABLE `enfermeiro` (
  `id_enfermeiro` int(11) NOT NULL,
  `id_hospital` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `id_especialidade` int(11) NOT NULL,
  `id_hospital` int(11) NOT NULL,
  `nome` char(20) DEFAULT NULL,
  `míopes` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `especialidade`
--

INSERT INTO `especialidade` (`id_especialidade`, `id_hospital`, `nome`, `míopes`) VALUES
(1, 0, 'Oftamologia', 1),
(2, 0, 'Oftamologia', 1),
(3, 0, 'Oftamologia', 1),
(4, 0, 'Oftamologia', 1),
(5, 0, 'Oftamologia', 1),
(6, 0, 'Oftamologia', 1),
(7, 0, 'Oftamologia', 1),
(8, 0, 'Oftamologia', 1),
(9, 0, 'Oftamologia', 1),
(10, 0, 'Oftamologia', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospital`
--

CREATE TABLE `hospital` (
  `id_hospital` int(11) NOT NULL,
  `nome` char(20) DEFAULT NULL,
  `localidade` char(20) DEFAULT NULL,
  `numéro_hospital` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `hospital`
--

INSERT INTO `hospital` (`id_hospital`, `nome`, `localidade`, `numéro_hospital`) VALUES
(1, 'David Bernardino', 'Luanda', 561),
(2, 'Josina Machel', 'Luanda', 2461),
(3, 'Hospital do Prenda', 'Luanda', 5691),
(4, 'Hospital da Samba', 'Luanda', 1145),
(5, 'Hospital de Viana', 'Luanda', 1745);

-- --------------------------------------------------------

--
-- Estrutura da tabela `laboratorio`
--

CREATE TABLE `laboratorio` (
  `id_laboratorio` int(11) NOT NULL,
  `nome` char(20) DEFAULT NULL,
  `id_hospital` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_doentes_plano`
--

CREATE TABLE `lista_doentes_plano` (
  `id_lista` int(11) NOT NULL,
  `id_doente` int(11) NOT NULL,
  `id_plano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `id_hospital` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_especialidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id_pessoa` int(11) NOT NULL,
  `nome` char(20) DEFAULT NULL,
  `Gênero` char(5) DEFAULT NULL,
  `telefone` int(10) DEFAULT NULL,
  `bilhete_identidade` int(14) DEFAULT NULL,
  `id_endereco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id_pessoa`, `nome`, `Gênero`, `telefone`, `bilhete_identidade`, `id_endereco`) VALUES
(1, 'Pedro', 'M', 98454545, 54545855, 1),
(2, 'Maria', 'F', 98454545, 54545855, 1),
(3, 'Carlos', 'M', 98454545, 54545855, 1),
(4, 'Rosado', 'M', 98454545, 54545855, 1),
(5, 'Francisco', 'M', 98454545, 54545855, 1),
(6, 'Pedro', 'M', 98454545, 54545855, 1),
(7, 'Maria', 'F', 98454545, 54545855, 1),
(8, 'Carlos', 'M', 98454545, 54545855, 1),
(9, 'Rosado', 'M', 98454545, 54545855, 1),
(10, 'Francisco', 'M', 98454545, 54545855, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano_de_saude`
--

CREATE TABLE `plano_de_saude` (
  `id_plano` int(11) NOT NULL,
  `nome` char(20) DEFAULT NULL,
  `telefone` int(9) DEFAULT NULL,
  `id_hospital` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seguranca_social`
--

CREATE TABLE `seguranca_social` (
  `id_instituicao` int(11) NOT NULL,
  `nome` char(20) DEFAULT NULL,
  `morada` char(20) DEFAULT NULL,
  `data_registo` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_pessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `analise_clinicas`
--
ALTER TABLE `analise_clinicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_analista` (`id_analista`),
  ADD KEY `id_laboratorio` (`id_laboratorio`),
  ADD KEY `id_doente` (`id_doente`);

--
-- Índices para tabela `analista_clinico`
--
ALTER TABLE `analista_clinico`
  ADD PRIMARY KEY (`id_analista`),
  ADD KEY `id_pessoa` (`id_pessoa`),
  ADD KEY `id_hospital` (`id_hospital`);

--
-- Índices para tabela `atendimento_medico`
--
ALTER TABLE `atendimento_medico`
  ADD PRIMARY KEY (`id_atendimento`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_doente` (`id_doente`);

--
-- Índices para tabela `camas`
--
ALTER TABLE `camas`
  ADD PRIMARY KEY (`id_camas`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `doente`
--
ALTER TABLE `doente`
  ADD PRIMARY KEY (`id_doente`),
  ADD KEY `id_pessoa` (`id_pessoa`);

--
-- Índices para tabela `empregado`
--
ALTER TABLE `empregado`
  ADD PRIMARY KEY (`id_empregado`),
  ADD KEY `id_pessoa` (`id_pessoa`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_hospital` (`id_hospital`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `enfermaria`
--
ALTER TABLE `enfermaria`
  ADD PRIMARY KEY (`id_enfermaria`),
  ADD UNIQUE KEY `sigla` (`sigla`),
  ADD KEY `id_empregado` (`id_empregado`),
  ADD KEY `id_hospital` (`id_hospital`),
  ADD KEY `id_camas` (`id_camas`);

--
-- Índices para tabela `enfermeiro`
--
ALTER TABLE `enfermeiro`
  ADD PRIMARY KEY (`id_enfermeiro`),
  ADD KEY `id_hospital` (`id_hospital`),
  ADD KEY `id_pessoa` (`id_pessoa`);

--
-- Índices para tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id_especialidade`);

--
-- Índices para tabela `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`id_hospital`),
  ADD UNIQUE KEY `numéro_hospital` (`numéro_hospital`);

--
-- Índices para tabela `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id_laboratorio`),
  ADD KEY `id_hospital` (`id_hospital`);

--
-- Índices para tabela `lista_doentes_plano`
--
ALTER TABLE `lista_doentes_plano`
  ADD PRIMARY KEY (`id_lista`),
  ADD KEY `id_doente` (`id_doente`),
  ADD KEY `id_plano` (`id_plano`);

--
-- Índices para tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD KEY `id_hospital` (`id_hospital`),
  ADD KEY `id_pessoa` (`id_pessoa`),
  ADD KEY `id_especialidade` (`id_especialidade`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id_pessoa`),
  ADD KEY `id_endereco` (`id_endereco`);

--
-- Índices para tabela `plano_de_saude`
--
ALTER TABLE `plano_de_saude`
  ADD PRIMARY KEY (`id_plano`),
  ADD KEY `id_hospital` (`id_hospital`);

--
-- Índices para tabela `seguranca_social`
--
ALTER TABLE `seguranca_social`
  ADD PRIMARY KEY (`id_instituicao`),
  ADD KEY `id_pessoa` (`id_pessoa`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `analise_clinicas`
--
ALTER TABLE `analise_clinicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `analista_clinico`
--
ALTER TABLE `analista_clinico`
  MODIFY `id_analista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `atendimento_medico`
--
ALTER TABLE `atendimento_medico`
  MODIFY `id_atendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `camas`
--
ALTER TABLE `camas`
  MODIFY `id_camas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `doente`
--
ALTER TABLE `doente`
  MODIFY `id_doente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empregado`
--
ALTER TABLE `empregado`
  MODIFY `id_empregado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `enfermaria`
--
ALTER TABLE `enfermaria`
  MODIFY `id_enfermaria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `enfermeiro`
--
ALTER TABLE `enfermeiro`
  MODIFY `id_enfermeiro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `id_especialidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `hospital`
--
ALTER TABLE `hospital`
  MODIFY `id_hospital` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lista_doentes_plano`
--
ALTER TABLE `lista_doentes_plano`
  MODIFY `id_lista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id_pessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `plano_de_saude`
--
ALTER TABLE `plano_de_saude`
  MODIFY `id_plano` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `seguranca_social`
--
ALTER TABLE `seguranca_social`
  MODIFY `id_instituicao` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `analise_clinicas`
--
ALTER TABLE `analise_clinicas`
  ADD CONSTRAINT `analise_clinicas_ibfk_1` FOREIGN KEY (`id_analista`) REFERENCES `analista_clinico` (`id_analista`),
  ADD CONSTRAINT `analise_clinicas_ibfk_2` FOREIGN KEY (`id_laboratorio`) REFERENCES `laboratorio` (`id_laboratorio`),
  ADD CONSTRAINT `analise_clinicas_ibfk_3` FOREIGN KEY (`id_doente`) REFERENCES `doente` (`id_doente`);

--
-- Limitadores para a tabela `analista_clinico`
--
ALTER TABLE `analista_clinico`
  ADD CONSTRAINT `analista_clinico_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`),
  ADD CONSTRAINT `analista_clinico_ibfk_2` FOREIGN KEY (`id_hospital`) REFERENCES `hospital` (`id_hospital`);

--
-- Limitadores para a tabela `atendimento_medico`
--
ALTER TABLE `atendimento_medico`
  ADD CONSTRAINT `atendimento_medico_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `atendimento_medico_ibfk_2` FOREIGN KEY (`id_doente`) REFERENCES `doente` (`id_doente`);

--
-- Limitadores para a tabela `doente`
--
ALTER TABLE `doente`
  ADD CONSTRAINT `doente_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`);

--
-- Limitadores para a tabela `empregado`
--
ALTER TABLE `empregado`
  ADD CONSTRAINT `empregado_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`),
  ADD CONSTRAINT `empregado_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `empregado_ibfk_3` FOREIGN KEY (`id_hospital`) REFERENCES `hospital` (`id_hospital`);

--
-- Limitadores para a tabela `enfermaria`
--
ALTER TABLE `enfermaria`
  ADD CONSTRAINT `enfermaria_ibfk_1` FOREIGN KEY (`id_empregado`) REFERENCES `empregado` (`id_empregado`),
  ADD CONSTRAINT `enfermaria_ibfk_2` FOREIGN KEY (`id_hospital`) REFERENCES `hospital` (`id_hospital`),
  ADD CONSTRAINT `enfermaria_ibfk_3` FOREIGN KEY (`id_camas`) REFERENCES `camas` (`id_camas`);

--
-- Limitadores para a tabela `enfermeiro`
--
ALTER TABLE `enfermeiro`
  ADD CONSTRAINT `enfermeiro_ibfk_1` FOREIGN KEY (`id_hospital`) REFERENCES `hospital` (`id_hospital`),
  ADD CONSTRAINT `enfermeiro_ibfk_2` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`);

--
-- Limitadores para a tabela `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD CONSTRAINT `laboratorio_ibfk_1` FOREIGN KEY (`id_hospital`) REFERENCES `hospital` (`id_hospital`);

--
-- Limitadores para a tabela `lista_doentes_plano`
--
ALTER TABLE `lista_doentes_plano`
  ADD CONSTRAINT `lista_doentes_plano_ibfk_1` FOREIGN KEY (`id_doente`) REFERENCES `doente` (`id_doente`),
  ADD CONSTRAINT `lista_doentes_plano_ibfk_2` FOREIGN KEY (`id_plano`) REFERENCES `plano_de_saude` (`id_plano`);

--
-- Limitadores para a tabela `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_hospital`) REFERENCES `hospital` (`id_hospital`),
  ADD CONSTRAINT `medico_ibfk_2` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`),
  ADD CONSTRAINT `medico_ibfk_3` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);

--
-- Limitadores para a tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id`);

--
-- Limitadores para a tabela `plano_de_saude`
--
ALTER TABLE `plano_de_saude`
  ADD CONSTRAINT `plano_de_saude_ibfk_1` FOREIGN KEY (`id_hospital`) REFERENCES `hospital` (`id_hospital`);

--
-- Limitadores para a tabela `seguranca_social`
--
ALTER TABLE `seguranca_social`
  ADD CONSTRAINT `seguranca_social_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
