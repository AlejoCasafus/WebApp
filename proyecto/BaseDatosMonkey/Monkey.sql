-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2022 a las 07:41:02
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `moneky`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id_Categoria` int(10) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Ubicacion` varchar(15) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Proveedor` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `Id_Compra` int(10) NOT NULL,
  `Fecha_Hora` datetime(6) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Producto` int(10) NOT NULL,
  `Id_Proveedor` int(10) NOT NULL,
  `Id_Movimiento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `Id_DetalleCompra` int(10) NOT NULL,
  `Fecha_Hora` datetime(6) NOT NULL,
  `Detalle` varchar(25) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Producto` int(10) NOT NULL,
  `Id_Proveedor` int(10) NOT NULL,
  `Id_Compra` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_devolucion`
--

CREATE TABLE `detalle_devolucion` (
  `Id_DetalleDevolucion` int(10) NOT NULL,
  `Fecha_Hora` datetime(6) NOT NULL,
  `Detalle` varchar(25) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Producto` int(10) NOT NULL,
  `Id_Proveedor` int(10) NOT NULL,
  `Id_Devolucion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_uso`
--

CREATE TABLE `detalle_uso` (
  `Id_DetalleUso` int(10) NOT NULL,
  `Fecha_Hora` datetime(6) NOT NULL,
  `Detalle` varchar(25) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Producto` int(10) NOT NULL,
  `Id_Seccion` int(10) NOT NULL,
  `Id_Uso` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `Id_Devolucion` int(10) NOT NULL,
  `Fecha_Hora` datetime(6) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Total_Producto` int(11) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Proveedor` int(10) NOT NULL,
  `Id_Producto` int(10) NOT NULL,
  `Id_Movimiento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `Id_Inventario` int(10) NOT NULL,
  `Cantidad` decimal(10,0) NOT NULL,
  `Stock_Minimo` int(11) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Seccion` int(10) NOT NULL,
  `Id_Producto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `Id_Movimiento` int(10) NOT NULL,
  `Fecha_Hora` datetime(6) NOT NULL,
  `Tipo` varchar(10) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `Total_Productos` int(11) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Seccion` int(10) NOT NULL,
  `Id_Proveeedor` int(10) NOT NULL,
  `Id_Inventario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_Producto` int(10) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Imagen` blob NOT NULL,
  `Categoria` varchar(10) NOT NULL,
  `Descripcion` varchar(15) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Proveedor` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Id_Proveedor` int(10) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `NIT` int(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Id_Usuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`Id_Proveedor`, `Nombre`, `NIT`, `Email`, `Telefono`, `Id_Usuario`) VALUES
(10234587, 'Telas CO', 17586495, 'telasco@mail.com', '2778728 ext 302', 0),
(10238745, 'Telas CO', 17589435, 'telasco@gmail.com', '2778728 ext 302', 11274593);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remision`
--

CREATE TABLE `remision` (
  `Id_Remision` int(11) NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  `Producto` varchar(20) NOT NULL,
  `Total` varchar(20) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Seccion` int(10) NOT NULL,
  `Id_Movimiento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `Id_Seccion` int(10) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Id_Usuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uso`
--

CREATE TABLE `uso` (
  `Id_Uso` int(10) NOT NULL,
  `Fecha_Hora` datetime(6) NOT NULL,
  `Total_Productos` int(11) NOT NULL,
  `Id_Usuario` int(10) NOT NULL,
  `Id_Producto` int(10) NOT NULL,
  `Id_Seccion` int(10) NOT NULL,
  `Id_Movimiento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuarios` int(10) NOT NULL,
  `Nombre_Completo` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Clave_Usuario` varchar(20) NOT NULL,
  `Rol` varchar(20) NOT NULL,
  `Id_Seccion` int(10) NOT NULL,
  `Id_Movimiento` int(12) NOT NULL,
  `Id_Proveedores` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Categoria`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Proveedor` (`Id_Proveedor`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`Id_Compra`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Producto` (`Id_Producto`),
  ADD KEY `Id_Proveedor` (`Id_Proveedor`),
  ADD KEY `Id_Movimiento` (`Id_Movimiento`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`Id_DetalleCompra`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Producto` (`Id_Producto`),
  ADD KEY `Id_Proveedor` (`Id_Proveedor`),
  ADD KEY `Id_Compra` (`Id_Compra`);

--
-- Indices de la tabla `detalle_devolucion`
--
ALTER TABLE `detalle_devolucion`
  ADD PRIMARY KEY (`Id_DetalleDevolucion`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Producto` (`Id_Producto`),
  ADD KEY `Id_Proveedor` (`Id_Proveedor`),
  ADD KEY `Id_Devolucion` (`Id_Devolucion`);

--
-- Indices de la tabla `detalle_uso`
--
ALTER TABLE `detalle_uso`
  ADD PRIMARY KEY (`Id_DetalleUso`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Producto` (`Id_Producto`),
  ADD KEY `Id_Seccion` (`Id_Seccion`),
  ADD KEY `Id_Uso` (`Id_Uso`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`Id_Devolucion`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Proveedor` (`Id_Proveedor`),
  ADD KEY `Id_Producto` (`Id_Producto`),
  ADD KEY `Id_Movimiento` (`Id_Movimiento`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`Id_Inventario`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Seccion` (`Id_Seccion`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`Id_Movimiento`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Seccion` (`Id_Seccion`),
  ADD KEY `Id_Proveeedor` (`Id_Proveeedor`),
  ADD KEY `Id_Inventario` (`Id_Inventario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_Producto`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Proveedor` (`Id_Proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Id_Proveedor`),
  ADD KEY `Id_Usuario` (`Id_Usuario`);

--
-- Indices de la tabla `remision`
--
ALTER TABLE `remision`
  ADD PRIMARY KEY (`Id_Remision`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Seccion` (`Id_Seccion`),
  ADD KEY `Id_Movimiento` (`Id_Movimiento`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`Id_Seccion`),
  ADD KEY `Id_Usuario` (`Id_Usuario`);

--
-- Indices de la tabla `uso`
--
ALTER TABLE `uso`
  ADD PRIMARY KEY (`Id_Uso`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Movimiento` (`Id_Movimiento`),
  ADD KEY `Id_Seccion` (`Id_Seccion`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuarios`),
  ADD KEY `Id_Movimiento` (`Id_Movimiento`),
  ADD KEY `Id_Seccion` (`Id_Seccion`),
  ADD KEY `Id_Proveedores` (`Id_Proveedores`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `remision`
--
ALTER TABLE `remision`
  MODIFY `Id_Remision` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Movimiento` int(12) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
