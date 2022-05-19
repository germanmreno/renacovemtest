-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2022 a las 16:57:00
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
  `guid` varchar(36) NOT NULL,
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
  `nombreencargado` varchar(100) NOT NULL,
  `cedulaencargado` varchar(100) NOT NULL,
  `numempleados` varchar(100) NOT NULL,
  `nombreempleados` varchar(100) NOT NULL,
  `cedulaempleados` varchar(25) NOT NULL,
  `cargoempleados` varchar(100) NOT NULL,
  `medidacomercio` varchar(100) NOT NULL,
  `inventario` varchar(100) NOT NULL,
  `promediooro` varchar(300) NOT NULL,
  `promedioganancia` varchar(20) NOT NULL,
  `porcentajecompra` varchar(20) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'enespera',
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `guid` varchar(36) NOT NULL,
  `nombreusuario` varchar(20) NOT NULL,
  `permisos` varchar(15) NOT NULL DEFAULT 'usuario',
  `contraseña` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`guid`, `nombreusuario`, `permisos`, `contraseña`, `correo`, `telefono`, `createdAt`, `updatedAt`) VALUES
('91df651e-01d5-44b6-a483-13f30811fcc5', 'germancvm', 'usuario', '$2a$10$.hRiObZ26LHrZek9IsmxcunJXczefTTJyAVooNFud/ZPjVw7ZkFHy', 'german@cvm.com', '04140210028', '2022-05-19', '2022-05-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`guid`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`guid`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`guid`) REFERENCES `users` (`guid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
