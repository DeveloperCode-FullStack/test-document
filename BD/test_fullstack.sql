-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2023 a las 07:03:29
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test_fullstack`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `contrasenia` varchar(100) NOT NULL,
  `estado` bit(1) NOT NULL,
  `persona_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`contrasenia`, `estado`, `persona_id`) VALUES
('1234', b'1', 1),
('5678', b'1', 2),
('1245', b'1', 3),
('34235', b'1', 4),
('34wsdfs', b'1', 5),
('1234', b'1', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id` bigint(20) NOT NULL,
  `estado` bit(1) NOT NULL,
  `numero_cuenta` bigint(20) NOT NULL,
  `saldo_inicial` double NOT NULL,
  `tipo_cuenta` bit(1) NOT NULL,
  `cliente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id`, `estado`, `numero_cuenta`, `saldo_inicial`, `tipo_cuenta`, `cliente_id`) VALUES
(1, b'1', 478758, 21425, b'0', 1),
(2, b'1', 225487, 200, b'1', 2),
(3, b'1', 495878, 0, b'0', 3),
(4, b'1', 496825, 5000, b'0', 2),
(5, b'1', 585545, 1000, b'1', 1),
(6, b'1', 55738456, 0, b'0', 4),
(7, b'1', 113432432, 500, b'0', 5),
(8, b'1', 345644, 2290000, b'1', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `saldo` double NOT NULL,
  `tipo_movimiento` bit(1) NOT NULL,
  `valor` double NOT NULL,
  `cuenta_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id`, `fecha`, `saldo`, `tipo_movimiento`, `valor`, `cuenta_id`) VALUES
(1, '2023-05-10 01:32:47', 1425, b'1', -575, 1),
(2, '2023-05-10 01:33:15', 200, b'0', 100, 2),
(3, '2023-05-10 01:34:01', 0, b'0', 0, 3),
(4, '2023-05-10 01:34:21', 0, b'1', -540, 4),
(5, '2023-05-10 17:56:50', 5000, b'0', 5000, 4),
(6, '2023-05-10 19:15:08', 21425, b'0', 20000, 1),
(7, '2023-05-10 22:07:46', 2000, b'1', -1000, 6),
(8, '2023-05-10 22:08:00', 500, b'1', -1500, 6),
(9, '2023-05-10 22:08:14', 1000, b'0', 500, 6),
(10, '2023-05-10 22:09:04', 0, b'1', -1000, 6),
(11, '2023-05-10 22:17:49', 1000, b'1', -1000, 7),
(12, '2023-05-10 22:18:02', 500, b'1', -500, 7),
(13, '2023-05-10 22:18:19', 2500, b'0', 2000, 7),
(14, '2023-05-10 22:18:28', 7500, b'0', 5000, 7),
(15, '2023-05-10 22:18:46', 500, b'1', -7000, 7),
(16, '2023-05-10 22:58:54', 2300000, b'0', 2000000, 8),
(17, '2023-05-10 22:59:23', 2290000, b'1', -10000, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` bigint(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `edad` tinyint(4) NOT NULL,
  `genero` bit(1) NOT NULL,
  `identificacion` varchar(12) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `direccion`, `edad`, `genero`, `identificacion`, `nombre`, `telefono`) VALUES
(1, 'Otavalo sn y principal', 31, b'1', '1079', 'Jose Lema', '098254785'),
(2, 'Amazonas y NNUU', 20, b'0', '1080', 'Marianela Montalvo', '097548965'),
(3, '13 junio y Equinoccial', 21, b'1', '1256', 'Juan Osorio', '098874587'),
(4, 'Calle', 21, b'0', '7686', 'Sofia', '34234'),
(5, 'Calle', 24, b'1', '10101', 'Jhoan', '3432423'),
(6, '45675', 34, b'1', '23245', 'jhorman', '3247887');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`persona_id`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_pj7ncg765kt4klndu25bwbwe4` (`numero_cuenta`),
  ADD KEY `FK4p224uogyy5hmxvn8fwa2jlug` (`cliente_id`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4ea11fe7p3xa1kwwmdgi9f2fi` (`cuenta_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FKmc52upywn8gona2iiwwwphb92` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `FK4p224uogyy5hmxvn8fwa2jlug` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`persona_id`);

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `FK4ea11fe7p3xa1kwwmdgi9f2fi` FOREIGN KEY (`cuenta_id`) REFERENCES `cuenta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
