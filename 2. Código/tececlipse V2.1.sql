-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2023 a las 01:23:01
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tececlipse`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `iddetalleventa` int(50) NOT NULL,
  `idventa` int(50) NOT NULL,
  `idproducto` int(50) NOT NULL,
  `cantidadproducto` int(50) NOT NULL,
  `precioventa` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`iddetalleventa`, `idventa`, `idproducto`, `cantidadproducto`, `precioventa`) VALUES
(1, 1, 11, 2, 50),
(2, 2, 12, 3, 40),
(3, 3, 12, 3, 40),
(4, 4, 12, 1, 40),
(5, 5, 15, 1, 1000),
(6, 6, 15, 1, 1000),
(7, 7, 15, 1, 1000),
(8, 8, 15, 1, 1000),
(9, 10, 14, 1, 32000),
(10, 11, 15, 1, 1000),
(11, 12, 15, 1, 1000),
(12, 13, 15, 3, 1000),
(13, 14, 12, 1, 40),
(14, 16, 12, 1, 40),
(15, 17, 18, 1, 200),
(16, 18, 14, 1, 32000),
(17, 19, 13, 1, 40),
(18, 20, 5, 1, 3000000),
(19, 21, 15, 1, 1000),
(20, 22, 15, 5, 1000),
(21, 22, 14, 1, 32000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) NOT NULL,
  `nombreproducto` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionproducto` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `unidad` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombreproducto`, `descripcionproducto`, `unidad`, `precio`) VALUES
(3, 'i MAC 27', 'Itntel i7 16GB RAm 3Tb Disco', 'UND', 200),
(5, 'Portatil lenovo', 'e430', 'UND', 3000000),
(6, 'Web Cam Logitech 1080', 'Camra de alta definicion para computador, puerto USB resolucion 1920x1080', 'UND', 230000),
(7, 'Memoria USB 64Gb Kingston', 'Memoria marca Kingston de 64Gb con carcasa metalica', 'UND', 42000),
(8, 'Memoria USB 64Gb Kingston sds', 'Memoria marca Kingston de 64Gb con carcasa metalica', 'UND', 32000),
(9, 'Memoria USB 64Gb HP', 'Memoria marca HP de 64Gb con carcasa metalica', 'UND', 32000),
(10, 'Mouse HYPERX', 'Mouse HYPERX altos DPI gamer', 'UND', 70000),
(11, 'Control PS5', 'Control de consola', '20', 50),
(12, 'Control Xbox ONE', 'Control de consola', '10', 40),
(13, 'Control Xbox ONE', 'Control de consola', '10', 40),
(14, 'Memoria USB 64Gb Kingston', 'Memoria marca Kingston de 64Gb con carcasa metalica', 'UND', 32000),
(15, 'Laptop Asus', 'Ryzen 5 8GB RAM', 'UND', 1000),
(18, 'computador', 'core i 7', 'UND', 200),
(19, 'Mouse Genius 2', 'Mouse Genius altos DPI gamer', 'UND', 70000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) NOT NULL,
  `cedula` int(10) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `rol` enum('Cliente','Proveedor','Empleado') COLLATE utf8_spanish2_ci NOT NULL,
  `estado` enum('Activo','Inactivo') COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `cedula`, `nombre`, `password`, `rol`, `estado`, `direccion`, `telefono`) VALUES
(1, 1725672123, 'Cesar Bravo', '123', 'Cliente', 'Activo', 'Sangolqui', '0981691940'),
(2, 1075212819, 'Michael Gudino', '123', 'Empleado', 'Activo', '', ''),
(11, 1375212819, 'Edmundo Jami', '123', 'Empleado', 'Activo', '', ''),
(12, 1475212819, 'Diego Mantilla', '123', 'Proveedor', 'Activo', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventa` int(50) NOT NULL,
  `numerofactura` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idclienteventa` int(20) NOT NULL,
  `idempleadoventa` int(20) NOT NULL,
  `fechaventa` date NOT NULL,
  `totalventa` double NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idventa`, `numerofactura`, `idclienteventa`, `idempleadoventa`, `fechaventa`, `totalventa`, `estado`) VALUES
(1, '0', 1, 1, '2020-10-21', 100, '1'),
(2, '1', 1, 1, '2020-10-21', 120, '1'),
(3, '2', 1, 1, '2020-10-21', 120, '1'),
(4, '3', 1, 1, '2020-10-21', 40, '1'),
(5, '4', 1, 1, '2020-10-21', 1000, '1'),
(6, '5', 0, 1, '2020-10-21', 1000, '1'),
(7, '6', 1, 1, '2020-10-21', 1000, '1'),
(8, '7', 1, 1, '2020-10-21', 1000, '1'),
(9, '8', 1, 1, '2020-10-21', 0, '1'),
(10, '8', 1, 1, '2020-10-21', 32000, '1'),
(11, '9', 1, 1, '2020-10-21', 1000, '1'),
(12, '10', 1, 1, '2020-10-21', 1000, '1'),
(13, '10', 1, 1, '2020-10-21', 3000, '1'),
(14, '10', 1, 1, '2020-10-21', 40, '1'),
(15, '10', 0, 1, '2020-10-21', 0, '1'),
(16, '10', 1, 1, '2023-02-22', 40, '1'),
(17, '10', 1, 1, '2023-02-21', 200, '1'),
(18, '10', 1, 1, '2023-02-21', 32000, '1'),
(19, '10', 1, 1, '2023-02-21', 40, '1'),
(20, '10', 1, 1, '2023-02-21', 3000000, '1'),
(21, '10', 1, 1, '2023-02-21', 1000, '1'),
(22, '10', 1, 1, '2023-02-21', 37000, '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`iddetalleventa`),
  ADD KEY `venta detalle venta` (`idventa`),
  ADD KEY `detalle producto` (`idproducto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `iddetalleventa` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventa` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalle producto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `venta detalle venta` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
