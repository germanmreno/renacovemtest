-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2022 a las 20:46:24
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
  `numregistro` varchar(30) NOT NULL,
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
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`guid`, `numregistro`, `nombre`, `rif`, `numalianza`, `direccionfiscal`, `estado`, `municipio`, `parroquia`, `representante`, `telefonorepresentante`, `correorepresentante`, `cedularepresentante`, `rumrepresentante`, `tipoactividad`, `actividadminera`, `descripcionactminera`, `nombreencargado`, `cedulaencargado`, `numempleados`, `nombreempleados`, `cedulaempleados`, `cargoempleados`, `medidacomercio`, `inventario`, `promediooro`, `promedioganancia`, `porcentajecompra`, `createdAt`, `updatedAt`) VALUES
('d4e20437-d6fb-4c32-a03d-418d835210c8', '391831246', 'Comercializadora de Oro', '13213123123', '123', '123', 'Miranda', 'Acevedo', 'Aragüita', '12312', '13123', '123132', '123312', '12313', '\"Compra/Venta,Análisis/Fundición\"', '\"Diamante,Coltán\"', '123', 'sddsa', 'sadsad', '1', 'sasad', 'assadsad', 'asds', '130', '\"Espectómetro,CajaFuerte\"', '123', '123', '213', '2022-05-19', '2022-05-19');

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
('0e13fa3a-aa6a-493c-9b95-1bf4e883c484', 'germancvm', 'usuario', '$2a$10$xKrxtIT03CCNDbE7BfRs..A/4AcymADZ1n9Ikqt.CW6J/.a7yo2Wq', 'german@gmail.com', '04140210028', '2022-05-20', '2022-05-20'),
('91df651e-01d5-44b6-a483-13f30811fcc5', 'germancvm', 'usuario', '$2a$10$.hRiObZ26LHrZek9IsmxcunJXczefTTJyAVooNFud/ZPjVw7ZkFHy', 'german@cvm.com', '04140210028', '2022-05-19', '2022-05-19'),
('a2953845-963e-4675-a8bf-7bca2fca97df', 'yinniercvm', 'usuario', '$2a$10$62Yo2a4.E2b8.DBOjawJg.OkiKYzJbyYok8t7O12Z5Fn1y55IN2he', 'cvm@gmail.com', '02120210028', '2022-05-19', '2022-05-19'),
('d4e20437-d6fb-4c32-a03d-418d835210c8', 'jesuscvm', 'usuario', '$2a$10$Gla1vE9p9w2jJPEAh72CLuHpmlqdRtEU9HSLJPtoUZRQZ48LgFFWm', 'cvm', '12321', '2022-05-19', '2022-05-19');

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
