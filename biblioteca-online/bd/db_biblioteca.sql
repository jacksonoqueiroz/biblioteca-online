-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/12/2025 às 23:48
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alugueis`
--

CREATE TABLE `alugueis` (
  `id` int(11) NOT NULL,
  `leitor_id` int(11) NOT NULL,
  `livro_id` int(11) NOT NULL,
  `livro_nome` varchar(255) DEFAULT NULL,
  `data_aluguel` datetime NOT NULL,
  `data_entrega` date NOT NULL,
  `data_devolucao` date DEFAULT NULL,
  `devolvido` tinyint(4) DEFAULT 0,
  `usuario` varchar(255) DEFAULT NULL,
  `multa` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alugueis`
--

INSERT INTO `alugueis` (`id`, `leitor_id`, `livro_id`, `livro_nome`, `data_aluguel`, `data_entrega`, `data_devolucao`, `devolvido`, `usuario`, `multa`) VALUES
(1, 4, 3, 'A Hora da Estrela', '2025-12-25 10:22:00', '2025-12-25', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(2, 4, 7, 'Vidas Secas', '2025-12-25 10:22:00', '2025-12-25', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(3, 2, 6, 'Dom Casmurro', '2025-12-25 10:22:23', '2025-12-01', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(4, 2, 1, 'Olhos d\'água', '2025-12-25 10:22:23', '2025-12-01', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(5, 3, 5, 'Capitães de Areia', '2025-12-25 10:22:45', '2025-01-09', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(6, 3, 2, 'O Cortiço', '2025-12-25 10:22:45', '2025-01-09', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(7, 1, 2, 'O Cortiço', '2025-12-27 16:28:16', '2026-01-11', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(8, 1, 7, 'Vidas Secas', '2025-12-27 16:28:16', '2026-01-11', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(9, 4, 2, 'O Cortiço', '2025-12-27 16:30:26', '2026-01-11', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(10, 4, 7, 'Vidas Secas', '2025-12-27 16:30:26', '2026-01-11', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(11, 3, 6, 'Dom Casmurro', '2025-12-27 16:30:40', '2026-01-11', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(12, 3, 10, 'Opúsculo Humanitário', '2025-12-27 16:30:40', '2026-01-11', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(13, 2, 6, 'Dom Casmurro', '2025-12-27 16:33:52', '2026-01-11', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(14, 2, 10, 'Opúsculo Humanitário', '2025-12-27 16:33:52', '2026-01-11', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(15, 4, 6, 'Dom Casmurro', '2025-12-27 18:05:36', '2025-12-27', '2025-12-27', 1, 'Jackson Queiroz', 0.00),
(16, 4, 4, 'Macunaima', '2025-12-27 18:05:36', '2025-12-27', '2025-12-27', 1, 'Jackson Queiroz', 0.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `emails_enviados`
--

CREATE TABLE `emails_enviados` (
  `id` int(11) NOT NULL,
  `leitor_id` int(11) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `livro_nome` varchar(255) DEFAULT NULL,
  `assunto` varchar(255) NOT NULL,
  `tipo` enum('AVISO','ATRASO') NOT NULL,
  `data_envio` datetime DEFAULT current_timestamp(),
  `status` enum('ENVIADO','ERRO') DEFAULT 'ENVIADO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emails_enviados`
--

INSERT INTO `emails_enviados` (`id`, `leitor_id`, `email`, `livro_nome`, `assunto`, `tipo`, `data_envio`, `status`) VALUES
(1, 2, 'jackson.oqueiroz@gmail.com', 'Dom Casmurro', 'Livro em atraso', 'ATRASO', '2025-12-25 10:25:54', 'ENVIADO'),
(2, 2, 'jackson.oqueiroz@gmail.com', 'Olhos d\'água', 'Livro em atraso', 'ATRASO', '2025-12-25 10:25:57', 'ENVIADO'),
(3, 3, 'jackson.queiroz.arduino@gmail.com', 'Capitães de Areia', 'Livro em atraso', 'ATRASO', '2025-12-25 10:25:59', 'ENVIADO'),
(4, 3, 'jackson.queiroz.arduino@gmail.com', 'O Cortiço', 'Livro em atraso', 'ATRASO', '2025-12-25 10:26:02', 'ENVIADO'),
(5, 4, 'jackson.queiroz.arduino@gmail.com', 'Dom Casmurro', 'Aviso de devolução', 'AVISO', '2025-12-27 18:08:05', 'ENVIADO'),
(6, 4, 'jackson.queiroz.arduino@gmail.com', 'Macunaima', 'Aviso de devolução', 'AVISO', '2025-12-27 18:08:09', 'ENVIADO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_punicoes`
--

CREATE TABLE `historico_punicoes` (
  `id` int(11) NOT NULL,
  `leitor_id` int(11) NOT NULL,
  `dias_atraso` int(11) NOT NULL,
  `dias_bloqueio` int(11) NOT NULL,
  `data_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico_punicoes`
--

INSERT INTO `historico_punicoes` (`id`, `leitor_id`, `dias_atraso`, `dias_bloqueio`, `data_registro`) VALUES
(1, 3, 352, 180, '2025-12-27 16:27:02'),
(2, 3, 352, 180, '2025-12-27 16:27:04'),
(3, 3, 352, 180, '2025-12-27 16:27:11'),
(4, 3, 352, 180, '2025-12-27 16:27:12'),
(5, 2, 26, 60, '2025-12-27 16:27:19'),
(6, 2, 26, 60, '2025-12-27 16:27:20'),
(7, 2, 26, 60, '2025-12-27 16:27:27'),
(8, 2, 26, 60, '2025-12-27 16:27:28'),
(9, 4, 2, 30, '2025-12-27 16:27:34'),
(10, 4, 2, 30, '2025-12-27 16:27:35'),
(11, 4, 2, 30, '2025-12-27 16:27:41'),
(12, 4, 2, 30, '2025-12-27 16:27:43');

-- --------------------------------------------------------

--
-- Estrutura para tabela `leitores`
--

CREATE TABLE `leitores` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `validade` date DEFAULT NULL,
  `cadastrado_por` varchar(220) NOT NULL,
  `created` date NOT NULL DEFAULT current_timestamp(),
  `bloqueado_ate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `leitores`
--

INSERT INTO `leitores` (`id`, `nome`, `telefone`, `endereco`, `email`, `validade`, `cadastrado_por`, `created`, `bloqueado_ate`) VALUES
(1, 'Vinicius', '(11)3334455566', 'Rua', 'jackson.oqueiroz@gmail.com', '2026-12-06', 'Jackson Queiroz', '2025-12-06', NULL),
(2, 'Jackson', '1122997755', 'Rua', 'jackson.oqueiroz@gmail.com', '2026-12-13', 'Jackson Queiroz', '2025-12-13', NULL),
(3, 'Gabriel', '(11)944556677', 'Rua', 'jackson.queiroz.arduino@gmail.com', '2026-12-14', 'Jackson Queiroz', '2025-12-14', NULL),
(4, 'Elisangela Maria dos Santos', '(11) 94005-9988', 'Rua Porto de Móz, 197', 'jackson.queiroz.arduino@gmail.com', '2026-12-25', 'Jackson Queiroz', '2025-12-24', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `sinopse` text DEFAULT NULL,
  `codigo_localizacao` varchar(20) DEFAULT NULL,
  `capa` varchar(255) DEFAULT 'sem-imagem.jpg',
  `cadastrado_por` varchar(220) DEFAULT NULL,
  `created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id`, `titulo`, `autor`, `categoria`, `sinopse`, `codigo_localizacao`, `capa`, `cadastrado_por`, `created`) VALUES
(1, 'Olhos d\'água', 'Conceição Evaristo', 'Diversos', 'Em Olhos d\'água Conceição Evaristo ajusta o foco de seu interesse na população afro-brasileira abordando, sem meias palavras, a pobreza e a violência urbana que a acometem.', 'D-000-01', 'sem-imagem.jpg', 'Jackson Queiroz', '2025-12-06'),
(2, 'O Cortiço', 'Aloiso Azevedo', 'Diversos', 'O Cortiço é um romance do escritor brasileiro Aluísio Azevedo, publicado em 1890, considerado a principal obra do Naturalismo no Brasil.', 'D-000-05', 'livro_694ec705eedcc.jpg', 'Jackson Queiroz', '2025-12-13'),
(3, 'A Hora da Estrela', 'Clarice Lispector', 'Romance', 'A Hora da Estrela é um romance literário da escritora brasileira Clarice Lispector. O romance narra a história da datilógrafa alagoana, Macabéa, que migra para o Rio de Janeiro, tendo sua rotina narrada por um escritor fictício chamado Rodrigo S.M.', 'R-000-06', 'livro_694dba636ed08.jpg', 'Jackson Queiroz', '2025-12-13'),
(4, 'Macunaima', 'Mario de Andrade', 'Romance', 'Macunaíma, o herói sem nenhum caráter é um livro publicado em 1928 pelo polímata brasileiro Mário de Andrade, considerado a sua obra-prima.', 'R-000-07', 'livro_694dbc7e3732d.jpg', 'Jackson Queiroz', '2025-12-13'),
(5, 'Capitães de Areia', 'Jorge Amado', 'Diversos', 'A obra retrata a vida de um grupo de menores abandonados que vivem nas ruas da cidade de Salvador, abrigando-se em um trapiche e sobrevivendo por meio de pequenos furtos. ', 'D-000-03', 'livro_694dbafcb11ba.jpg', 'Jackson Queiroz', '2025-12-13'),
(6, 'Dom Casmurro', 'Machado de Assis', 'Romance', 'Em Dom Casmurro, o narrador Bento Santiago retoma a infância que passou na Rua de Matacavalos e conta a história do amor e das desventuras que viveu com Capitu, uma das personagens mais enigmáticas e intrigantes da literatura brasileira', 'R-000-08', 'livro_694dbb5a35991.jpg', 'Jackson Queiroz', '2025-12-14'),
(7, 'Vidas Secas', 'Graciliano Ramos', 'Diversos', 'Publicado pela primeira vez em 1938, o aclamado livro retrata a vida miserável de uma familia de retirantes em sua peregrinação pelo sertão nordestino. Se tornando uma das obras-símbolo do modernismo literário brasileiro,  Vidas secas é um retrato atual, emocionante e cruelmente verdadeiro sobre o Brasil.', 'D-000-04', 'sem-imagem.jpg', 'Jackson Queiroz', '2025-12-21'),
(8, 'Memórias Postumas de Braz Cubas', 'Machado de Assis', 'Romance', 'Num primeiro momento, a prosa fragmentária e livre de Memórias póstumas, misturando elegância e abuso, refinamento e humor negro, causou estranheza, inclusive entre a crítica.', 'R-000-09', 'livro_694dbccf80b1a.jpg', 'Jackson Queiroz', '2025-12-25'),
(9, 'Helena', 'Machado de Assis', 'Romance', 'Narrado em terceira pessoa, este romance machadiano ambientado durante o século XIX traduz as surpresas e desgraças de um amor proibido.', 'R-000-10', 'livro_694dbbcf095af.jpg', 'Jackson Queiroz', '2025-12-25'),
(10, 'Opúsculo Humanitário', 'Nísia Floresta', 'Literatura', 'Opúsculo humanitário é um manifesto em defesa da importância da educação feminina. Afinal, para a autora, o desenvolvimento de uma nação estava intrinsecamente ligado ao papel que a mulher ocupava na sociedade.', 'L-000-01', 'sem-imagem.jpg', 'Jackson Queiroz', '2025-12-25'),
(11, 'Nebulosas ', 'Narcisa Amália', 'Literatura', 'Nebulosas, publicado em 1872, apresenta 44 poemas cujos temas transitam entre a mulher, a natureza e a crítica social abolicionista. Recebeu grande destaque à época de seu lançamento pelo fato, incomum naqueles tempos, de sua autora ser uma mulher.\n\nEsta edição traz os textos originais em versão integral, acompanhados de notas da própria autora. Também apresenta notas explicativas da edição para os termos não usuais e foi adequada às normas do Novo Acordo Ortográfico.', 'L-000-02', 'sem-imagem.jpg', 'Jackson Queiroz', '2025-12-25'),
(12, 'Balada de Amor ao Vento', 'Paulina Chiziane', 'Romance', 'Balada de amor ao vento é uma obra pioneira. Não apenas por ser a estreia de Paulina Chiziane na prosa longa e o primeiro romance publicado por uma mulher em Moçambique, mas também por trazer a semente do que a autora viria a construir em Niketche.', 'R-000-11', 'livro_694db7767b940.jpg', 'Jackson Queiroz', '2025-12-25'),
(13, 'Caminhos de Pedra', ' Rachel de Queiroz', 'Diversos', 'Em Caminho de pedras, Rachel de Queiroz nos revela a força de uma mulher que decide seguir seus desejos, mesmo que isso implicasse um divórcio.', 'D-000-05', 'livro_69530470f0cbe.jpg', 'Jackson Queiroz', '2025-12-29');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) NOT NULL,
  `usuario` varchar(220) NOT NULL,
  `senha` varchar(220) NOT NULL,
  `tipo` enum('admin','comum') NOT NULL DEFAULT 'comum',
  `imagem` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `senha`, `tipo`, `imagem`) VALUES
(1, 'Jackson Queiroz', 'jackson.oqueiroz@gmail.com', '$2y$10$f.LrBA08y8t9.ZpVVJVSZOGYWwflwYVBFZ94m5o3DuW/FzAWE9Mle', 'admin', 'semfoto.png'),
(2, '', 'adm', '$2y$10$yn9Bo9DU1zTuyCxSxsN7he/4OUzwF4zqhC.30lcbBSNu3QOpV2T4a', 'admin', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alugueis`
--
ALTER TABLE `alugueis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leitor_id` (`leitor_id`),
  ADD KEY `livro_id` (`livro_id`);

--
-- Índices de tabela `emails_enviados`
--
ALTER TABLE `emails_enviados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `historico_punicoes`
--
ALTER TABLE `historico_punicoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leitor_id` (`leitor_id`);

--
-- Índices de tabela `leitores`
--
ALTER TABLE `leitores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alugueis`
--
ALTER TABLE `alugueis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `emails_enviados`
--
ALTER TABLE `emails_enviados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `historico_punicoes`
--
ALTER TABLE `historico_punicoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `leitores`
--
ALTER TABLE `leitores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alugueis`
--
ALTER TABLE `alugueis`
  ADD CONSTRAINT `alugueis_ibfk_1` FOREIGN KEY (`leitor_id`) REFERENCES `leitores` (`id`),
  ADD CONSTRAINT `alugueis_ibfk_2` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`id`);

--
-- Restrições para tabelas `historico_punicoes`
--
ALTER TABLE `historico_punicoes`
  ADD CONSTRAINT `historico_punicoes_ibfk_1` FOREIGN KEY (`leitor_id`) REFERENCES `leitores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
