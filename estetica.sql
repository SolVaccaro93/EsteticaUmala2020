-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2020 a las 05:43:12
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estetica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_principal`
--

CREATE TABLE `categoria_principal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf16_spanish2_ci NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria_principal`
--

INSERT INTO `categoria_principal` (`id`, `nombre`, `descripcion`, `ts_create`) VALUES
(1, 'Uñas', 'Esculpido y esmaltado de uñas', '2020-09-04 00:00:00'),
(2, 'Pestañas', 'Pestañas pelo x pelo 1D, 2D y 3D', '2020-09-04 00:00:00'),
(3, 'Cejas', 'Pefilado y lifting de cejas', '2020-09-04 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf16_spanish2_ci NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(255) COLLATE utf16_spanish2_ci DEFAULT 'images/producto_default.jpg',
  `id_categoria` int(11) NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT 0,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `imagen`, `id_categoria`, `descuento`, `estado`, `ts_create`) VALUES
(1, 'Uñas esculpidas', 'Esculpido de uñas premium', 1600, 'images/esculpido_uñas.jpg', 1, 0, 1, '2020-06-17 10:31:12'),
(2, 'Uñas esmaltadas', 'Esmaltado de uñas de alta calidad', 900, 'images/esmaltado_uñas.jpg', 1, 0, 1, '2020-09-04 21:57:10'),
(3, 'Pestañas  pelo por pelo 1D', 'Extensión de pestañas pelo por pelo', 500, 'images/1d-pestañas.jpg', 2, 0, 1, '2020-09-04 22:56:47'),
(7, 'Lifting de cejas', 'Lifting de cejas', 300, 'images/producto_default.jpg', 3, 20, 0, '2020-09-08 21:35:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testimonio`
--

CREATE TABLE `testimonio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `comentario` text COLLATE utf16_spanish2_ci NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `testimonio`
--

INSERT INTO `testimonio` (`id`, `nombre`, `comentario`, `fecha`) VALUES
(1, 'María', 'Excelente atención 100% recomendable.', '2020-06-29 10:36:35'),
(2, 'Juana', 'Las chicas son geniales! Me dejaron divina!', '2020-06-29 10:36:35'),
(3, 'Tyrion', 'Hacen corte higiénico!', '2020-09-08 22:17:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `dni` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `correo` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `password` varchar(255) COLLATE utf16_spanish2_ci NOT NULL,
  `admin` int(1) NOT NULL,
  `ts_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `nombre`, `apellido`, `dni`, `correo`, `password`, `admin`, `ts_create`) VALUES
(1, 'Solcito', 'Marisol', 'Vaccaro', '37610144', 'vaccaro.marisol93gmail.com', 'tyrion', 1, '2020-09-04 00:00:00'),
(2, 'Tyrion', 'Tyrion', 'Perrito', '1234567', 'tyrion@perrito.com', 'tontito', 0, '2020-09-05 18:39:46');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_principal`
--
ALTER TABLE `categoria_principal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`(191));

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`(191)),
  ADD KEY `fk_producto_categoria` (`id_categoria`);

--
-- Indices de la tabla `testimonio`
--
ALTER TABLE `testimonio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `correo` (`correo`(191));

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_principal`
--
ALTER TABLE `categoria_principal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `testimonio`
--
ALTER TABLE `testimonio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_principal` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
