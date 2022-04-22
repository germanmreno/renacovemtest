-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2022 a las 21:00:11
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `rif` varchar(25) NOT NULL,
  `numalianza` varchar(25) NOT NULL,
  `direccionfiscal` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `parroquia` varchar(100) NOT NULL,
  `representante` varchar(100) NOT NULL,
  `telefonorepresentante` varchar(100) NOT NULL,
  `correorepresentante` varchar(100) NOT NULL,
  `cedularepresentante` varchar(100) NOT NULL,
  `rumrepresentante` varchar(100) NOT NULL,
  `tipoactividad` varchar(100) NOT NULL,
  `actividadminera` varchar(100) NOT NULL,
  `descripcionactminera` varchar(100) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id`, `nombre`, `rif`, `numalianza`, `direccionfiscal`, `estado`, `municipio`, `parroquia`, `representante`, `telefonorepresentante`, `correorepresentante`, `cedularepresentante`, `rumrepresentante`, `tipoactividad`, `actividadminera`, `descripcionactminera`, `createdAt`, `updatedAt`) VALUES
(1, 'Compañía de Oro', 'V273763690', '1', 'Ruiz Pineda', 'Distrito Capital', 'Libertador', 'Caricuao', 'Germán Moreno', '04140210028', 'grmmrno@gmail.com', '27376369', '12345', 'Compra/Venta', 'Oro', 'Vendemos Oro', '0000-00-00', '0000-00-00'),
(2, 'Compañía de Niquel', 'V28396360', '3', 'Altamira', 'Distrito Capital', 'Libertador', 'Chacao', 'Yinnier Ramirez', '04125422810', 'yinnier@gmail.com', '15000000', '23451', 'Compra/Venta', 'Niquel', 'Vendemos Niquel', '0000-00-00', '0000-00-00'),
(3, 'Compañía de Hierro', 'V18456360', '6', 'El Paraíso', 'Distrito Capital', 'Libertador', 'La Vega', 'Jesús Moya', '04163515590', 'jesus@gmail.com', '24000000', '36531', 'Compra/Venta', 'Hierro', 'Vendemos Hierro', '0000-00-00', '0000-00-00'),
(4, 'Compañía de Calciterita', 'V300010020', '10', 'El Valle', 'Distrito Capital', 'Libertador', 'El Valle', 'Desiree Perez', '04122002020', 'desiree@gmail.com', '24001002', '46859', 'Compra/Venta', 'Calciterita', 'Vendemos Calciterita', '2022-04-22', '2022-04-22');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
