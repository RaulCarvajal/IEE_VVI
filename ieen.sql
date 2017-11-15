-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-11-2017 a las 02:41:43
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ieen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Almacen`
--

CREATE TABLE `Almacen` (
  `idAlmacen` int(11) NOT NULL,
  `Nombre_Alm` varchar(45) DEFAULT NULL,
  `Capacidad_Alm` varchar(45) DEFAULT NULL,
  `Disponibilidad` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Asignacion_Usr`
--

CREATE TABLE `Asignacion_Usr` (
  `idAsignacion_Usr` int(11) NOT NULL,
  `Fecha_Asig` date DEFAULT NULL,
  `Status_Asig` varchar(45) DEFAULT NULL,
  `Obsr_Asig` varchar(180) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Car_Esp`
--

CREATE TABLE `Car_Esp` (
  `idCar_Esp` int(11) NOT NULL,
  `Nombre_Car` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clasificacion`
--

CREATE TABLE `Clasificacion` (
  `idClasificacion` int(11) NOT NULL,
  `Folio_Clas` varchar(45) DEFAULT NULL,
  `Nom_Clas` varchar(45) DEFAULT NULL,
  `Stock_Clas` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Datos_Esp`
--

CREATE TABLE `Datos_Esp` (
  `idDatos_Esp` int(11) NOT NULL,
  `Nombre_Dat` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Estado`
--

CREATE TABLE `Estado` (
  `idEstado` int(11) NOT NULL,
  `Nombre_Est` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoVehicular`
--

CREATE TABLE `estadoVehicular` (
  `idestadoVehicular` int(11) NOT NULL,
  `kmInicial` varchar(45) DEFAULT NULL,
  `kmFinal` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estadoVehicular`
--

INSERT INTO `estadoVehicular` (`idestadoVehicular`, `kmInicial`, `kmFinal`, `descripcion`) VALUES
(7, '20000', '20000', 'BUEN VEHICULO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Fotos`
--

CREATE TABLE `Fotos` (
  `idFotos` int(11) NOT NULL,
  `Fotos_Fot` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes`
--

CREATE TABLE `informes` (
  `idinformes` int(11) NOT NULL,
  `informeActividad` varchar(45) DEFAULT NULL,
  `statusInforme` varchar(45) DEFAULT NULL,
  `fechaInforme` varchar(45) DEFAULT NULL,
  `viaticos_idviaticos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `InformeVehicular`
--

CREATE TABLE `InformeVehicular` (
  `idInforme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informeViatico`
--

CREATE TABLE `informeViatico` (
  `idinformes` int(11) NOT NULL,
  `informeActividad` varchar(45) DEFAULT NULL,
  `fechaInforme` varchar(45) DEFAULT NULL,
  `statusInforme` varchar(45) DEFAULT NULL,
  `viaticos_idviaticos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `idmovimientos` int(11) NOT NULL,
  `fechaMovimiento` varchar(45) DEFAULT NULL,
  `statusMovimiento` varchar(45) DEFAULT NULL,
  `observacionesMov` varchar(45) DEFAULT NULL,
  `viaticos_idviaticos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `idpersonal` int(11) NOT NULL,
  `nombrePersonal` varchar(45) DEFAULT NULL,
  `apellidoPaterno` varchar(45) DEFAULT NULL,
  `apellidoMaterno` varchar(45) DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `codigoPostal` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `nolic` varchar(45) DEFAULT NULL,
  `nocred` varchar(45) DEFAULT NULL,
  `nombreArea` varchar(45) DEFAULT NULL,
  `tipoPuesto` varchar(45) DEFAULT NULL,
  `usuarios_idusuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`idpersonal`, `nombrePersonal`, `apellidoPaterno`, `apellidoMaterno`, `calle`, `colonia`, `codigoPostal`, `telefono`, `fechaNac`, `rfc`, `nolic`, `nocred`, `nombreArea`, `tipoPuesto`, `usuarios_idusuarios`) VALUES
(5, 'Oliver Jasiel', 'Galaviz', 'Arroyo', 'Privada Chapultepec No. 22', 'Bellavista', '63501', '3117407111', '1994-11-19', 'GAAO941119', '654651346816', '651651681651', 'Administracion', 'Empleado', 1),
(6, 'Marlene Yael', 'Alvarez', 'Parra', 'Rio Santiago No. 22', 'Tepic', '63001', '3111407111', '1994-11-19', 'GAAO941119', '654651346816', '651651681651', 'Administracion', 'Empleado', 2),
(7, 'Raul', 'Carvjal', 'Gutierrez', 'lhljfa', 'lksdjflkj', '6315646', '656465468', '1993-11-19', 'asdhjiaojd', 'dgsadf', 'asdfsadf', 'Administracion', 'Empleado', 8),
(8, 'Cesar Rames', 'Espino', 'Serrano', 'asgsafgasf', 'asdfasgfsa', 'sagsafgasf', '3685465654', '1995-02-10', 'GASGAS', 'asfgasfg', 'safgasfg', 'gasfgsafgfas', 'Empleado', 9),
(9, 'fsdfsdaf', 'asffasd', 'flñakslña', 'sdfsadf', 'adfsa6fg54as65d', '321321315', '311154548', '1994-12-25', '321231321', '651451651', '651561561', 'Administración', 'Empleado/Chofer', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `idProductos` int(11) NOT NULL,
  `Nom_Prod` varchar(45) DEFAULT NULL,
  `Des_Prod` varchar(45) DEFAULT NULL,
  `FechaComp` date DEFAULT NULL,
  `Stoc_Prod` int(11) DEFAULT NULL,
  `StockMin_Prod` int(11) DEFAULT NULL,
  `Obs_Prod` varchar(45) DEFAULT NULL,
  `NoFac_Prod` varchar(45) DEFAULT NULL,
  `Asignacion_Usr_idAsignacion_Usr` int(11) NOT NULL,
  `Clasificacion_idClasificacion` int(11) NOT NULL,
  `Estado_idEstado` int(11) NOT NULL,
  `Fotos_idFotos` int(11) NOT NULL,
  `Almacen_idAlmacen` int(11) NOT NULL,
  `Car_Esp_idCar_Esp` int(11) NOT NULL,
  `Datos_Esp_idDatos_Esp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudVehicular`
--

CREATE TABLE `solicitudVehicular` (
  `idSolicitudVehicular` int(11) NOT NULL,
  `folioVehicular` varchar(45) DEFAULT NULL,
  `fechaSolicitudVehicular` date DEFAULT NULL,
  `fechaAprobacionVehicular` date DEFAULT NULL,
  `fechaSalida` date DEFAULT NULL,
  `fechaRetornoVehicular` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `vehiculos_idvehiculos` int(11) NOT NULL,
  `personal_idpersonal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudViatico`
--

CREATE TABLE `solicitudViatico` (
  `idviaticos` int(11) NOT NULL,
  `folioViatico` varchar(45) DEFAULT NULL,
  `fechaSolicitud` datetime DEFAULT NULL,
  `fechaAprobacion` datetime DEFAULT NULL,
  `fechaSalida` date DEFAULT NULL,
  `fechaRetorno` date DEFAULT NULL,
  `destino` varchar(45) DEFAULT NULL,
  `actividadViatico` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `Pernotado` varchar(5) NOT NULL,
  `personal_idpersonal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitudViatico`
--

INSERT INTO `solicitudViatico` (`idviaticos`, `folioViatico`, `fechaSolicitud`, `fechaAprobacion`, `fechaSalida`, `fechaRetorno`, `destino`, `actividadViatico`, `status`, `Pernotado`, `personal_idpersonal`) VALUES
(3, 'AEF54614', '2017-11-12 15:21:14', NULL, '0000-00-00', '0000-00-00', 'Tepic', NULL, 'Pendiente', 'SI', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `nombreUsuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `tipoUsuario` tinyint(1) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `nombreUsuario`, `password`, `tipoUsuario`, `status`) VALUES
(1, 'oliverjga', 'ojga', 4, 'Activo'),
(2, 'yael', 'yael', 5, 'Activo'),
(3, 'yael', 'yael', 5, 'Activo'),
(4, 'usuario', 'usuario', 4, 'Activo'),
(5, 'oliver', 'oliver', 4, 'Activo'),
(8, 'usuario1', '1234', 4, 'Activo'),
(9, 'cholo', 'cholo', 4, 'Activo'),
(10, 'usuario', 'usuario1', 4, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `idvehiculos` int(11) NOT NULL,
  `vehiculo` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `placas` varchar(10) DEFAULT NULL,
  `estadoVehicular_idestadoVehicular` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`idvehiculos`, `vehiculo`, `modelo`, `placas`, `estadoVehicular_idestadoVehicular`) VALUES
(6, 'FOCUS', '2007', 'RGB-07-14', 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Almacen`
--
ALTER TABLE `Almacen`
  ADD PRIMARY KEY (`idAlmacen`);

--
-- Indices de la tabla `Asignacion_Usr`
--
ALTER TABLE `Asignacion_Usr`
  ADD PRIMARY KEY (`idAsignacion_Usr`);

--
-- Indices de la tabla `Car_Esp`
--
ALTER TABLE `Car_Esp`
  ADD PRIMARY KEY (`idCar_Esp`);

--
-- Indices de la tabla `Clasificacion`
--
ALTER TABLE `Clasificacion`
  ADD PRIMARY KEY (`idClasificacion`);

--
-- Indices de la tabla `Datos_Esp`
--
ALTER TABLE `Datos_Esp`
  ADD PRIMARY KEY (`idDatos_Esp`);

--
-- Indices de la tabla `Estado`
--
ALTER TABLE `Estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `estadoVehicular`
--
ALTER TABLE `estadoVehicular`
  ADD PRIMARY KEY (`idestadoVehicular`);

--
-- Indices de la tabla `Fotos`
--
ALTER TABLE `Fotos`
  ADD PRIMARY KEY (`idFotos`);

--
-- Indices de la tabla `informes`
--
ALTER TABLE `informes`
  ADD PRIMARY KEY (`idinformes`);

--
-- Indices de la tabla `InformeVehicular`
--
ALTER TABLE `InformeVehicular`
  ADD PRIMARY KEY (`idInforme`);

--
-- Indices de la tabla `informeViatico`
--
ALTER TABLE `informeViatico`
  ADD PRIMARY KEY (`idinformes`),
  ADD KEY `fk_informes_viaticos1_idx` (`viaticos_idviaticos`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`idmovimientos`),
  ADD KEY `fk_movimientos_viaticos1_idx` (`viaticos_idviaticos`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idpersonal`),
  ADD KEY `fk_personal_usuarios1_idx` (`usuarios_idusuarios`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`idProductos`),
  ADD KEY `fk_Productos_Asignacion_Usr1_idx` (`Asignacion_Usr_idAsignacion_Usr`),
  ADD KEY `fk_Productos_Clasificacion1_idx` (`Clasificacion_idClasificacion`),
  ADD KEY `fk_Productos_Estado1_idx` (`Estado_idEstado`),
  ADD KEY `fk_Productos_Fotos1_idx` (`Fotos_idFotos`),
  ADD KEY `fk_Productos_Almacen1_idx` (`Almacen_idAlmacen`),
  ADD KEY `fk_Productos_Car_Esp1_idx` (`Car_Esp_idCar_Esp`),
  ADD KEY `fk_Productos_Datos_Esp1_idx` (`Datos_Esp_idDatos_Esp`);

--
-- Indices de la tabla `solicitudVehicular`
--
ALTER TABLE `solicitudVehicular`
  ADD PRIMARY KEY (`idSolicitudVehicular`),
  ADD KEY `fk_SolicitudVehicular_vehiculos1_idx` (`vehiculos_idvehiculos`),
  ADD KEY `fk_SolicitudVehicular_personal1_idx` (`personal_idpersonal`);

--
-- Indices de la tabla `solicitudViatico`
--
ALTER TABLE `solicitudViatico`
  ADD PRIMARY KEY (`idviaticos`),
  ADD KEY `fk_viaticos_personal1_idx` (`personal_idpersonal`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`idvehiculos`),
  ADD KEY `fk_vehiculos_estadoVehicular1_idx` (`estadoVehicular_idestadoVehicular`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Almacen`
--
ALTER TABLE `Almacen`
  MODIFY `idAlmacen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Asignacion_Usr`
--
ALTER TABLE `Asignacion_Usr`
  MODIFY `idAsignacion_Usr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Car_Esp`
--
ALTER TABLE `Car_Esp`
  MODIFY `idCar_Esp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Clasificacion`
--
ALTER TABLE `Clasificacion`
  MODIFY `idClasificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Datos_Esp`
--
ALTER TABLE `Datos_Esp`
  MODIFY `idDatos_Esp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Estado`
--
ALTER TABLE `Estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadoVehicular`
--
ALTER TABLE `estadoVehicular`
  MODIFY `idestadoVehicular` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `Fotos`
--
ALTER TABLE `Fotos`
  MODIFY `idFotos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `informes`
--
ALTER TABLE `informes`
  MODIFY `idinformes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `informeViatico`
--
ALTER TABLE `informeViatico`
  MODIFY `idinformes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `idmovimientos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `idpersonal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudVehicular`
--
ALTER TABLE `solicitudVehicular`
  MODIFY `idSolicitudVehicular` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudViatico`
--
ALTER TABLE `solicitudViatico`
  MODIFY `idviaticos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `idvehiculos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `informeViatico`
--
ALTER TABLE `informeViatico`
  ADD CONSTRAINT `fk_informes_viaticos1` FOREIGN KEY (`viaticos_idviaticos`) REFERENCES `solicitudViatico` (`idviaticos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `fk_movimientos_viaticos1` FOREIGN KEY (`viaticos_idviaticos`) REFERENCES `solicitudViatico` (`idviaticos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_usuarios1` FOREIGN KEY (`usuarios_idusuarios`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `fk_Productos_Almacen1` FOREIGN KEY (`Almacen_idAlmacen`) REFERENCES `Almacen` (`idAlmacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Asignacion_Usr1` FOREIGN KEY (`Asignacion_Usr_idAsignacion_Usr`) REFERENCES `Asignacion_Usr` (`idAsignacion_Usr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Car_Esp1` FOREIGN KEY (`Car_Esp_idCar_Esp`) REFERENCES `Car_Esp` (`idCar_Esp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Clasificacion1` FOREIGN KEY (`Clasificacion_idClasificacion`) REFERENCES `Clasificacion` (`idClasificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Datos_Esp1` FOREIGN KEY (`Datos_Esp_idDatos_Esp`) REFERENCES `Datos_Esp` (`idDatos_Esp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Estado1` FOREIGN KEY (`Estado_idEstado`) REFERENCES `Estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Fotos1` FOREIGN KEY (`Fotos_idFotos`) REFERENCES `Fotos` (`idFotos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudVehicular`
--
ALTER TABLE `solicitudVehicular`
  ADD CONSTRAINT `fk_SolicitudVehicular_personal1` FOREIGN KEY (`personal_idpersonal`) REFERENCES `personal` (`idpersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SolicitudVehicular_vehiculos1` FOREIGN KEY (`vehiculos_idvehiculos`) REFERENCES `vehiculos` (`idvehiculos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitudViatico`
--
ALTER TABLE `solicitudViatico`
  ADD CONSTRAINT `fk_viaticos_personal1` FOREIGN KEY (`personal_idpersonal`) REFERENCES `personal` (`idpersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `fk_vehiculos_estadoVehicular1` FOREIGN KEY (`estadoVehicular_idestadoVehicular`) REFERENCES `estadoVehicular` (`idestadoVehicular`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
