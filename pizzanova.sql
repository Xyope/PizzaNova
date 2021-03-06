-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2019 at 03:38 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizzanova`
--

-- --------------------------------------------------------

--
-- Table structure for table `bitacoras`
--

CREATE TABLE `bitacoras` (
  `id_bitacora` int(10) UNSIGNED NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accion` varchar(50) NOT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `id_Cargo` int(10) UNSIGNED NOT NULL,
  `nombre_Cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`id_Cargo`, `nombre_Cargo`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `foto_categoria` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 es activo 0 es inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion`, `foto_categoria`, `estado`) VALUES
(1, 'Bebidas', 'test', '5d2ce843cb3a3.jpg', 1),
(2, 'Pizzas', 'test', '5d2ce9aa94cad.jpeg', 1),
(3, 'Pupusas', 'test', '5d2ce9b5ec98f.jpeg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detallefactura`
--

CREATE TABLE `detallefactura` (
  `id_detallefac` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_platillo` int(10) UNSIGNED DEFAULT NULL,
  `subtotal` double(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(10) UNSIGNED NOT NULL,
  `nombre_empleado` varchar(20) NOT NULL,
  `apellido_empleado` varchar(20) NOT NULL,
  `dui` varchar(10) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `genero` enum('M','F') DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `id_Cargo` int(10) UNSIGNED DEFAULT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `encabezadofactura`
--

CREATE TABLE `encabezadofactura` (
  `id_EncabezadoFac` int(10) UNSIGNED NOT NULL,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `id_empleado` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `materiasprimas`
--

CREATE TABLE `materiasprimas` (
  `idMateria` int(10) UNSIGNED NOT NULL,
  `nombre_materia` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `id_categoria` int(10) UNSIGNED DEFAULT NULL,
  `id_Medida` int(10) UNSIGNED DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 es activo 0 es inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materiasprimas`
--

INSERT INTO `materiasprimas` (`idMateria`, `nombre_materia`, `descripcion`, `cantidad`, `foto`, `id_categoria`, `id_Medida`, `estado`) VALUES
(1, 'test', 'test', 2, '5d2cefcc97528.jpg', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mesas`
--

CREATE TABLE `mesas` (
  `id_mesa` int(10) UNSIGNED NOT NULL,
  `numero_mesa` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mesas`
--

INSERT INTO `mesas` (`id_mesa`, `numero_mesa`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `platillos`
--

CREATE TABLE `platillos` (
  `id_platillo` int(10) UNSIGNED NOT NULL,
  `nombre_platillo` varchar(50) NOT NULL,
  `precio` double(6,2) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 es activo 0 es inactivo',
  `id_receta` int(10) UNSIGNED DEFAULT NULL,
  `id_categoria` int(10) UNSIGNED DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `platillos`
--

INSERT INTO `platillos` (`id_platillo`, `nombre_platillo`, `precio`, `estado`, `id_receta`, `id_categoria`, `imagen`) VALUES
(3, 'pupusa de frijol', 0.75, 1, 1, 3, '5d2cf44fd3d49.jpg'),
(4, 'coca', 1.00, 1, 1, 1, '5d2cf475811ab.jpg'),
(6, 'Pizza de jamÃ³n', 10.99, 1, 1, 2, '5d2e4c773faa1.jpeg'),
(7, 'Fanta', 0.99, 1, 1, 1, '5d2e4ce5e7a8f.jpg'),
(8, 'Pupusa de queso', 0.65, 1, 1, 3, '5d2e4cfce5170.jpg'),
(9, 'Pupusa revuelta', 1.00, 1, 1, 3, '5d2e4d15a9819.jpg'),
(10, 'Refresco de naranja', 1.25, 1, 1, 1, '5d2e4d3961646.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `pre_pedido`
--

CREATE TABLE `pre_pedido` (
  `id_prepedido` int(10) UNSIGNED NOT NULL,
  `id_mesa` int(10) UNSIGNED NOT NULL,
  `id_platillo` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_pedido`
--

INSERT INTO `pre_pedido` (`id_prepedido`, `id_mesa`, `id_platillo`, `cantidad`) VALUES
(73, 1, 4, 4),
(74, 2, 3, 15),
(75, 3, 6, 4),
(76, 4, 7, 0),
(77, 5, 8, 7),
(79, 7, 10, 7),
(81, 6, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `receta`
--

CREATE TABLE `receta` (
  `id_receta` int(10) UNSIGNED NOT NULL,
  `nombre_receta` varchar(1000) NOT NULL,
  `tiempo` varchar(11) NOT NULL,
  `elaboracion` varchar(350) NOT NULL,
  `id_categoria` int(10) UNSIGNED DEFAULT NULL,
  `idMateria` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receta`
--

INSERT INTO `receta` (`id_receta`, `nombre_receta`, `tiempo`, `elaboracion`, `id_categoria`, `idMateria`) VALUES
(1, 'test', 'test', 'test', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tareas`
--

CREATE TABLE `tareas` (
  `id_tarea` int(11) NOT NULL,
  `mensaje` varchar(120) NOT NULL,
  `importancia` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id_Tipousuario` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 es activo 0 es inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipousuario`
--

INSERT INTO `tipousuario` (`id_Tipousuario`, `tipo`, `descripcion`, `estado`) VALUES
(1, 'admin', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `unidadmedida`
--

CREATE TABLE `unidadmedida` (
  `id_Medida` int(10) UNSIGNED NOT NULL,
  `nombre_medida` varchar(40) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unidadmedida`
--

INSERT INTO `unidadmedida` (`id_Medida`, `nombre_medida`, `descripcion`) VALUES
(1, 'Kilogramo', 'Kg'),
(2, 'Gramo', 'ggggg'),
(3, 'Libra', 'lb');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `alias` varchar(50) NOT NULL,
  `clave_usuario` varchar(60) NOT NULL,
  `foto_usuario` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado_usuario` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 es activo 0 es inactivo',
  `id_Tipousuario` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `alias`, `clave_usuario`, `foto_usuario`, `fecha_creacion`, `estado_usuario`, `id_Tipousuario`) VALUES
(1, 'Gerardo', '$2y$10$rtwGWAepKVUdC/HKCg0y5eAER0/8KjRCidjl.L.u7rRpSHAuQ3JdC', '5d2c9630ac4f2.jpeg', '2019-07-15 15:05:20', 1, 1),
(2, 'Frank', '$2y$10$4Fx8jgFIMgkRsh3oafIK8.dptIDUdw.ckvdxuKJmIIPaDBjVNGIgC', '5d30ee9852a05.jpeg', '2019-07-18 22:11:36', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bitacoras`
--
ALTER TABLE `bitacoras`
  ADD PRIMARY KEY (`id_bitacora`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_Cargo`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`id_detallefac`),
  ADD KEY `id_platillo` (`id_platillo`);

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dui` (`dui`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_Cargo` (`id_Cargo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `encabezadofactura`
--
ALTER TABLE `encabezadofactura`
  ADD PRIMARY KEY (`id_EncabezadoFac`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indexes for table `materiasprimas`
--
ALTER TABLE `materiasprimas`
  ADD PRIMARY KEY (`idMateria`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_Medida` (`id_Medida`);

--
-- Indexes for table `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id_mesa`),
  ADD UNIQUE KEY `numero_mesa` (`numero_mesa`);

--
-- Indexes for table `platillos`
--
ALTER TABLE `platillos`
  ADD PRIMARY KEY (`id_platillo`),
  ADD KEY `id_receta` (`id_receta`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `pre_pedido`
--
ALTER TABLE `pre_pedido`
  ADD PRIMARY KEY (`id_prepedido`),
  ADD KEY `id_mesa` (`id_mesa`),
  ADD KEY `id_platillo` (`id_platillo`);

--
-- Indexes for table `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `idMateria` (`idMateria`);

--
-- Indexes for table `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`);

--
-- Indexes for table `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id_Tipousuario`);

--
-- Indexes for table `unidadmedida`
--
ALTER TABLE `unidadmedida`
  ADD PRIMARY KEY (`id_Medida`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD KEY `id_Tipousuario` (`id_Tipousuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bitacoras`
--
ALTER TABLE `bitacoras`
  MODIFY `id_bitacora` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_Cargo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `id_detallefac` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `encabezadofactura`
--
ALTER TABLE `encabezadofactura`
  MODIFY `id_EncabezadoFac` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materiasprimas`
--
ALTER TABLE `materiasprimas`
  MODIFY `idMateria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id_mesa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `platillos`
--
ALTER TABLE `platillos`
  MODIFY `id_platillo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pre_pedido`
--
ALTER TABLE `pre_pedido`
  MODIFY `id_prepedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `receta`
--
ALTER TABLE `receta`
  MODIFY `id_receta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id_Tipousuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `unidadmedida`
--
ALTER TABLE `unidadmedida`
  MODIFY `id_Medida` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bitacoras`
--
ALTER TABLE `bitacoras`
  ADD CONSTRAINT `bitacoras_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`id_platillo`) REFERENCES `platillos` (`id_platillo`);

--
-- Constraints for table `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_Cargo`) REFERENCES `cargo` (`id_Cargo`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `encabezadofactura`
--
ALTER TABLE `encabezadofactura`
  ADD CONSTRAINT `encabezadofactura_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Constraints for table `materiasprimas`
--
ALTER TABLE `materiasprimas`
  ADD CONSTRAINT `materiasprimas_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `materiasprimas_ibfk_2` FOREIGN KEY (`id_Medida`) REFERENCES `unidadmedida` (`id_Medida`);

--
-- Constraints for table `platillos`
--
ALTER TABLE `platillos`
  ADD CONSTRAINT `platillos_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`),
  ADD CONSTRAINT `platillos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Constraints for table `pre_pedido`
--
ALTER TABLE `pre_pedido`
  ADD CONSTRAINT `pre_pedido_ibfk_1` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`),
  ADD CONSTRAINT `pre_pedido_ibfk_2` FOREIGN KEY (`id_platillo`) REFERENCES `platillos` (`id_platillo`);

--
-- Constraints for table `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `receta_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materiasprimas` (`idMateria`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_Tipousuario`) REFERENCES `tipousuario` (`id_Tipousuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
