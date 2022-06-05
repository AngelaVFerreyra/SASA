-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2021 a las 22:06:25
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sasa-fifi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `NOMBRE` varchar(45) NOT NULL,
  `CODIGO` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`NOMBRE`, `CODIGO`) VALUES
('Álgebra', '1'),
('Análisis y Diseño de Sistemas I', '2'),
('Estructura de Datos y Algoritmos', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas_por_pps`
--

CREATE TABLE `asignaturas_por_pps` (
  `ASIGNATURA` varchar(45) NOT NULL,
  `ID_PPS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturas_por_pps`
--

INSERT INTO `asignaturas_por_pps` (`ASIGNATURA`, `ID_PPS`) VALUES
('Análisis y Diseño de Sistemas I', 1),
('Estructura de Datos y Algoritmos', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `TIPO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`TIPO`, `DESCRIPCION`) VALUES
(1, 'Titular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `DURACION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`CODIGO`, `NOMBRE`, `DURACION`) VALUES
(2, 'Analista Programador', 3),
(1, 'Ingeniería en Sistemas', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras_por_pps`
--

CREATE TABLE `carreras_por_pps` (
  `ID_PPS` int(11) NOT NULL,
  `CARRERA` varchar(45) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carreras_por_pps`
--

INSERT INTO `carreras_por_pps` (`ID_PPS`, `CARRERA`) VALUES
(1, 'Ingeniería en Sistemas'),
(2, 'Ingeniería en Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisiones_evalaudoras`
--

CREATE TABLE `comisiones_evalaudoras` (
  `ID_COMISON` int(11) NOT NULL,
  `FECHA_INICIO` date NOT NULL,
  `FECHA_FIN` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comisiones_evalaudoras`
--

INSERT INTO `comisiones_evalaudoras` (`ID_COMISON`, `FECHA_INICIO`, `FECHA_FIN`) VALUES
(1, '2021-11-17', '2021-12-31'),
(2, '2021-11-03', '2021-12-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `LEGAJO` int(11) NOT NULL,
  `DNI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`LEGAJO`, `DNI`) VALUES
(1, 30000000),
(2, 30000001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes_por_asignaturas`
--

CREATE TABLE `docentes_por_asignaturas` (
  `CARGO` int(11) NOT NULL,
  `ASIGNATURAS_NOMBRE` varchar(45) NOT NULL,
  `DNI_DOCENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `docentes_por_asignaturas`
--

INSERT INTO `docentes_por_asignaturas` (`CARGO`, `ASIGNATURAS_NOMBRE`, `DNI_DOCENTE`) VALUES
(1, 'Análisis y Diseño de Sistemas I', 30000001),
(1, 'Estructura de Datos y Algoritmos', 30000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes_por_comision`
--

CREATE TABLE `docentes_por_comision` (
  `ID_COMISION` int(11) NOT NULL,
  `DNI_DOCENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadios_por_pps`
--

CREATE TABLE `estadios_por_pps` (
  `FECHA_INICIO` date NOT NULL,
  `FECHA_FIN` date DEFAULT NULL,
  `TIENE_PRORROGA` tinyint(4) NOT NULL DEFAULT 0,
  `ID_PPS` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estadios_por_pps`
--

INSERT INTO `estadios_por_pps` (`FECHA_INICIO`, `FECHA_FIN`, `TIENE_PRORROGA`, `ID_PPS`, `ID_ESTADO`) VALUES
('2021-08-01', '2021-08-08', 0, 1, 4),
('2021-12-11', '2021-12-10', 0, 2, 1),
('2021-05-27', '2021-06-03', 0, 2, 4),
('2021-06-06', '2021-12-03', 0, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `ID_ESTADO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL,
  `CANTIDAD_DE_DIAS` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`ID_ESTADO`, `DESCRIPCION`, `CANTIDAD_DE_DIAS`) VALUES
(1, 'En corrección', '30'),
(2, 'Finalizado', '0'),
(3, 'Con prórroga', '60'),
(4, 'Pendiente', '7'),
(5, 'En desarrollo', '180');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `LEGAJO` int(11) NOT NULL,
  `DNI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`LEGAJO`, `DNI`) VALUES
(1, 40000000),
(2, 41000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes_por_carrera`
--

CREATE TABLE `estudiantes_por_carrera` (
  `AVAL_EPSA` tinyint(4) NOT NULL DEFAULT 0,
  `FECHA_INSCRIPCION` date NOT NULL,
  `AVAL_CERTIFICADO_SECUNDARIO` tinyint(4) NOT NULL DEFAULT 0,
  `NOMBRE_DE_CARRERA` varchar(45) NOT NULL,
  `DNI_ESTUDIANTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes_por_carrera`
--

INSERT INTO `estudiantes_por_carrera` (`AVAL_EPSA`, `FECHA_INSCRIPCION`, `AVAL_CERTIFICADO_SECUNDARIO`, `NOMBRE_DE_CARRERA`, `DNI_ESTUDIANTE`) VALUES
(1, '2017-12-14', 1, 'Analista Programador', 40000000),
(1, '2017-12-14', 1, 'Ingeniería en Sistemas', 40000000),
(1, '2015-12-03', 1, 'Ingeniería en Sistemas', 41000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes_por_pps`
--

CREATE TABLE `estudiantes_por_pps` (
  `AVAL_SEGURIDAD_HIGIENE` tinyint(4) DEFAULT 0,
  `DNI_ESTUDIANTE` int(11) NOT NULL,
  `ID_PPS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiantes_por_pps`
--

INSERT INTO `estudiantes_por_pps` (`AVAL_SEGURIDAD_HIGIENE`, `DNI_ESTUDIANTE`, `ID_PPS`) VALUES
(0, 40000000, 1),
(0, 41000000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones_ce`
--

CREATE TABLE `evaluaciones_ce` (
  `FECHA` date NOT NULL,
  `NOTA` int(11) NOT NULL,
  `ACTA` int(11) NOT NULL,
  `OBSERVACIONES` longtext NOT NULL,
  `ID_COMISION_EVALUADORA` int(11) NOT NULL,
  `ID_PPS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizaciones`
--

CREATE TABLE `organizaciones` (
  `CUIL` double NOT NULL,
  `NOMBRE` varchar(45) NOT NULL,
  `HAY_CONVENIO` tinyint(4) NOT NULL DEFAULT 0,
  `TIENE_SEGURO` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `organizaciones`
--

INSERT INTO `organizaciones` (`CUIL`, `NOMBRE`, `HAY_CONVENIO`, `TIENE_SEGURO`) VALUES
(20300005005, 'Alambrito', 0, '1'),
(20200000005, 'Tecro', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizaciones_por_pps`
--

CREATE TABLE `organizaciones_por_pps` (
  `ORGANIZACION` varchar(45) NOT NULL,
  `ID_PPS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `organizaciones_por_pps`
--

INSERT INTO `organizaciones_por_pps` (`ORGANIZACION`, `ID_PPS`) VALUES
('Tecro', 1),
('Tecro', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `DNI` int(11) NOT NULL,
  `APELLIDOS` varchar(45) NOT NULL,
  `NOMBRES` varchar(45) NOT NULL,
  `CELULAR` double DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`DNI`, `APELLIDOS`, `NOMBRES`, `CELULAR`, `EMAIL`) VALUES
(30000000, 'Papa', 'Fernanda', NULL, NULL),
(30000001, 'Rivera', 'Belén', NULL, NULL),
(30000002, 'Roldán', 'Marina', NULL, NULL),
(30000005, 'Álvarez', 'Juan', 2302554488, NULL),
(30000006, 'Pitt', 'Mike', NULL, NULL),
(35000000, 'Hernandez', 'Mateo', NULL, NULL),
(40000000, 'Pérez', 'Juan', 2302332244, NULL),
(41000000, 'Diaz', 'Claudio', 2302554499, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_de_estudio`
--

CREATE TABLE `planes_de_estudio` (
  `RESOLUCION` int(11) NOT NULL,
  `TIENE_PPS` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `planes_de_estudio`
--

INSERT INTO `planes_de_estudio` (`RESOLUCION`, `TIENE_PPS`) VALUES
(20151, 0),
(20171, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_de_estudio_por_asignaturas`
--

CREATE TABLE `planes_de_estudio_por_asignaturas` (
  `ASIGNATURA` varchar(45) CHARACTER SET utf8 NOT NULL,
  `PLAN_DE_ESTUDIO` int(11) NOT NULL,
  `AÑO` int(11) NOT NULL,
  `CUATRIMESTRE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `planes_de_estudio_por_asignaturas`
--

INSERT INTO `planes_de_estudio_por_asignaturas` (`ASIGNATURA`, `PLAN_DE_ESTUDIO`, `AÑO`, `CUATRIMESTRE`) VALUES
('Álgebra', 20171, 1, 1),
('Análisis y Diseño de Sistemas I', 20171, 2, 2),
('Estructura de Datos y Algoritmos', 20171, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_de_estudio_por_carrera`
--

CREATE TABLE `planes_de_estudio_por_carrera` (
  `RESOLUCION` int(11) NOT NULL,
  `CARRERA` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `planes_de_estudio_por_carrera`
--

INSERT INTO `planes_de_estudio_por_carrera` (`RESOLUCION`, `CARRERA`) VALUES
(20151, 'Analista Programador'),
(20171, 'Ingeniería en Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes_de_estudio_por_estudiante`
--

CREATE TABLE `planes_de_estudio_por_estudiante` (
  `DNI_ESTUDIANTE` int(11) NOT NULL,
  `RESOLUCION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `planes_de_estudio_por_estudiante`
--

INSERT INTO `planes_de_estudio_por_estudiante` (`DNI_ESTUDIANTE`, `RESOLUCION`) VALUES
(40000000, 20151),
(40000000, 20171),
(41000000, 20171);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ppss`
--

CREATE TABLE `ppss` (
  `ID_PPS` int(11) NOT NULL,
  `TITULO` varchar(45) NOT NULL,
  `DESCRIPCION` text NOT NULL,
  `BIBLIOGRAFIA` text NOT NULL,
  `ETAPAS_Y_OBJETIVOS` text NOT NULL,
  `ES_DE_PARES` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ppss`
--

INSERT INTO `ppss` (`ID_PPS`, `TITULO`, `DESCRIPCION`, `BIBLIOGRAFIA`, `ETAPAS_Y_OBJETIVOS`, `ES_DE_PARES`) VALUES
(1, 'Prueba.', 'Prueba.', 'Prueba.', 'Prueba.', 0),
(2, 'Prueba dos', 'Prueba dos.', 'Prueba dos.', 'Prueba dos.', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_usuario`
--

CREATE TABLE `tipos_de_usuario` (
  `TIPO` int(11) NOT NULL,
  `DESCRIPCION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_de_usuario`
--

INSERT INTO `tipos_de_usuario` (`TIPO`, `DESCRIPCION`) VALUES
(1, 'Administrador'),
(2, 'Comité Evaluador'),
(3, 'Docente'),
(4, 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores_de_organizacion`
--

CREATE TABLE `tutores_de_organizacion` (
  `CARGO` varchar(45) NOT NULL,
  `DNI` int(11) NOT NULL,
  `ORGANIZACION` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tutores_de_organizacion`
--

INSERT INTO `tutores_de_organizacion` (`CARGO`, `DNI`, `ORGANIZACION`) VALUES
('Desarrollador', 30000005, 'Tecro'),
('Desarrollador', 30000006, 'Alambrito'),
('Supervisor', 35000000, 'Tecro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores_de_organizacion_por_pps`
--

CREATE TABLE `tutores_de_organizacion_por_pps` (
  `AVAL_TUTOR_ORGANIZACION` tinyint(4) DEFAULT 0,
  `DNI_TUTOR` int(11) NOT NULL,
  `ORGANIZACION` varchar(45) NOT NULL,
  `ID_PPS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tutores_de_organizacion_por_pps`
--

INSERT INTO `tutores_de_organizacion_por_pps` (`AVAL_TUTOR_ORGANIZACION`, `DNI_TUTOR`, `ORGANIZACION`, `ID_PPS`) VALUES
(0, 30000005, 'Tecro', 1),
(0, 35000000, 'Tecro', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores_docentes_por_pps`
--

CREATE TABLE `tutores_docentes_por_pps` (
  `AVAL_TUTOR_DOCENTE` tinyint(4) NOT NULL DEFAULT 0,
  `DNI_DOCENTE` int(11) NOT NULL,
  `ID_PPS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tutores_docentes_por_pps`
--

INSERT INTO `tutores_docentes_por_pps` (`AVAL_TUTOR_DOCENTE`, `DNI_DOCENTE`, `ID_PPS`) VALUES
(0, 30000000, 1),
(0, 30000001, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `USUARIO` varchar(45) NOT NULL,
  `CONTRASEÑA` varchar(45) NOT NULL,
  `TIPO_DE_USUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`USUARIO`, `CONTRASEÑA`, `TIPO_DE_USUARIO`) VALUES
('administrador', 'administrador', 1),
('alumno', 'alumno', 4),
('comite', 'comite', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_por_personas`
--

CREATE TABLE `usuarios_por_personas` (
  `DNI_PERSONA` int(11) NOT NULL,
  `USUARIO` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_por_personas`
--

INSERT INTO `usuarios_por_personas` (`DNI_PERSONA`, `USUARIO`) VALUES
(40000000, 'alumno');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`NOMBRE`),
  ADD UNIQUE KEY `CODIGO` (`CODIGO`);

--
-- Indices de la tabla `asignaturas_por_pps`
--
ALTER TABLE `asignaturas_por_pps`
  ADD PRIMARY KEY (`ASIGNATURA`,`ID_PPS`),
  ADD KEY `fk_ASIGNATURAS_POR_PPS_PPSS1_idx` (`ID_PPS`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`TIPO`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`NOMBRE`),
  ADD UNIQUE KEY `CODIGO` (`CODIGO`);

--
-- Indices de la tabla `carreras_por_pps`
--
ALTER TABLE `carreras_por_pps`
  ADD PRIMARY KEY (`ID_PPS`,`CARRERA`),
  ADD KEY `CARRERA` (`CARRERA`);

--
-- Indices de la tabla `comisiones_evalaudoras`
--
ALTER TABLE `comisiones_evalaudoras`
  ADD PRIMARY KEY (`ID_COMISON`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`DNI`),
  ADD UNIQUE KEY `LEGAJO` (`LEGAJO`);

--
-- Indices de la tabla `docentes_por_asignaturas`
--
ALTER TABLE `docentes_por_asignaturas`
  ADD PRIMARY KEY (`ASIGNATURAS_NOMBRE`,`DNI_DOCENTE`),
  ADD KEY `fk_DOCENTES_POR_ASIGNATURAS_DOCENTES1_idx` (`DNI_DOCENTE`),
  ADD KEY `fk_CARGO` (`CARGO`);

--
-- Indices de la tabla `docentes_por_comision`
--
ALTER TABLE `docentes_por_comision`
  ADD PRIMARY KEY (`ID_COMISION`,`DNI_DOCENTE`),
  ADD KEY `fk_DOCENTES_POR_COMISION_DOCENTES1_idx` (`DNI_DOCENTE`);

--
-- Indices de la tabla `estadios_por_pps`
--
ALTER TABLE `estadios_por_pps`
  ADD PRIMARY KEY (`ID_PPS`,`ID_ESTADO`),
  ADD KEY `fk_ESTADIOS_POR_PPS_ESTADOS1_idx` (`ID_ESTADO`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`ID_ESTADO`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`DNI`),
  ADD UNIQUE KEY `LEGAJO` (`LEGAJO`) USING BTREE;

--
-- Indices de la tabla `estudiantes_por_carrera`
--
ALTER TABLE `estudiantes_por_carrera`
  ADD PRIMARY KEY (`NOMBRE_DE_CARRERA`,`DNI_ESTUDIANTE`),
  ADD KEY `fk_ESTUDIANTES_POR_CARRERA_ESTUDIANTES1_idx` (`DNI_ESTUDIANTE`);

--
-- Indices de la tabla `estudiantes_por_pps`
--
ALTER TABLE `estudiantes_por_pps`
  ADD PRIMARY KEY (`DNI_ESTUDIANTE`,`ID_PPS`),
  ADD KEY `fk_ESTUDIANTES_POR_PPS_PPSS1_idx` (`ID_PPS`);

--
-- Indices de la tabla `evaluaciones_ce`
--
ALTER TABLE `evaluaciones_ce`
  ADD PRIMARY KEY (`FECHA`,`ID_COMISION_EVALUADORA`,`ID_PPS`),
  ADD KEY `fk_EVALUACIONES_CE_COMISIONES_EVALAUDORAS1_idx` (`ID_COMISION_EVALUADORA`),
  ADD KEY `fk_EVALUACIONES_CE_PPSS1_idx` (`ID_PPS`);

--
-- Indices de la tabla `organizaciones`
--
ALTER TABLE `organizaciones`
  ADD PRIMARY KEY (`NOMBRE`);

--
-- Indices de la tabla `organizaciones_por_pps`
--
ALTER TABLE `organizaciones_por_pps`
  ADD PRIMARY KEY (`ORGANIZACION`,`ID_PPS`),
  ADD KEY `fk_ORGANIZACIONES_POR_PPS_PPSS1_idx` (`ID_PPS`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `planes_de_estudio`
--
ALTER TABLE `planes_de_estudio`
  ADD PRIMARY KEY (`RESOLUCION`),
  ADD UNIQUE KEY `RESOLUCION` (`RESOLUCION`);

--
-- Indices de la tabla `planes_de_estudio_por_asignaturas`
--
ALTER TABLE `planes_de_estudio_por_asignaturas`
  ADD PRIMARY KEY (`ASIGNATURA`,`PLAN_DE_ESTUDIO`),
  ADD UNIQUE KEY `ASIGNATURA` (`ASIGNATURA`,`PLAN_DE_ESTUDIO`),
  ADD KEY `FK_PLAN_2` (`PLAN_DE_ESTUDIO`);

--
-- Indices de la tabla `planes_de_estudio_por_carrera`
--
ALTER TABLE `planes_de_estudio_por_carrera`
  ADD PRIMARY KEY (`RESOLUCION`,`CARRERA`),
  ADD KEY `NOMBRE_CARRERA` (`CARRERA`);

--
-- Indices de la tabla `planes_de_estudio_por_estudiante`
--
ALTER TABLE `planes_de_estudio_por_estudiante`
  ADD PRIMARY KEY (`DNI_ESTUDIANTE`,`RESOLUCION`),
  ADD UNIQUE KEY `DNI_ESTUDIANTE` (`DNI_ESTUDIANTE`,`RESOLUCION`),
  ADD KEY `FK_PLAN` (`RESOLUCION`);

--
-- Indices de la tabla `ppss`
--
ALTER TABLE `ppss`
  ADD PRIMARY KEY (`ID_PPS`);

--
-- Indices de la tabla `tipos_de_usuario`
--
ALTER TABLE `tipos_de_usuario`
  ADD PRIMARY KEY (`TIPO`);

--
-- Indices de la tabla `tutores_de_organizacion`
--
ALTER TABLE `tutores_de_organizacion`
  ADD PRIMARY KEY (`DNI`,`ORGANIZACION`),
  ADD KEY `fk_TUTORES_DE_ORGANIZACION_PERSONAS1_idx` (`DNI`),
  ADD KEY `fk_TUTORES_DE_ORGANIZACION_ORGANIZACIONES1_idx` (`ORGANIZACION`);

--
-- Indices de la tabla `tutores_de_organizacion_por_pps`
--
ALTER TABLE `tutores_de_organizacion_por_pps`
  ADD PRIMARY KEY (`DNI_TUTOR`,`ORGANIZACION`,`ID_PPS`),
  ADD KEY `fk_TUTORES_DE_ORGANIZACION_POR_PPS_PPSS1_idx` (`ID_PPS`);

--
-- Indices de la tabla `tutores_docentes_por_pps`
--
ALTER TABLE `tutores_docentes_por_pps`
  ADD PRIMARY KEY (`DNI_DOCENTE`,`ID_PPS`),
  ADD KEY `fk_TUTORES_DOCENTES_POR_PPS_PPSS1_idx` (`ID_PPS`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USUARIO`),
  ADD KEY `fk_USUARIOS_TIPOS_DE_USUARIO1_idx` (`TIPO_DE_USUARIO`);

--
-- Indices de la tabla `usuarios_por_personas`
--
ALTER TABLE `usuarios_por_personas`
  ADD PRIMARY KEY (`DNI_PERSONA`,`USUARIO`),
  ADD KEY `fk_USUARIOS_POR_PERSONAS_USUARIOS1_idx` (`USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comisiones_evalaudoras`
--
ALTER TABLE `comisiones_evalaudoras`
  MODIFY `ID_COMISON` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `ID_ESTADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ppss`
--
ALTER TABLE `ppss`
  MODIFY `ID_PPS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipos_de_usuario`
--
ALTER TABLE `tipos_de_usuario`
  MODIFY `TIPO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaturas_por_pps`
--
ALTER TABLE `asignaturas_por_pps`
  ADD CONSTRAINT `fk_ASIGNATURAS_POR_PPS_ASIGNATURAS1` FOREIGN KEY (`ASIGNATURA`) REFERENCES `asignaturas` (`NOMBRE`),
  ADD CONSTRAINT `fk_ASIGNATURAS_POR_PPS_PPSS1` FOREIGN KEY (`ID_PPS`) REFERENCES `ppss` (`ID_PPS`);

--
-- Filtros para la tabla `carreras_por_pps`
--
ALTER TABLE `carreras_por_pps`
  ADD CONSTRAINT `CARRERA` FOREIGN KEY (`CARRERA`) REFERENCES `carreras` (`NOMBRE`),
  ADD CONSTRAINT `ID_PPS` FOREIGN KEY (`ID_PPS`) REFERENCES `ppss` (`ID_PPS`);

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `fk_DOCENTES_PERSONAS1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`);

--
-- Filtros para la tabla `docentes_por_asignaturas`
--
ALTER TABLE `docentes_por_asignaturas`
  ADD CONSTRAINT `fk_CARGO` FOREIGN KEY (`CARGO`) REFERENCES `cargos` (`TIPO`),
  ADD CONSTRAINT `fk_DOCENTES_POR_ASIGNATURAS_ASIGNATURAS1` FOREIGN KEY (`ASIGNATURAS_NOMBRE`) REFERENCES `asignaturas` (`NOMBRE`),
  ADD CONSTRAINT `fk_DOCENTES_POR_ASIGNATURAS_DOCENTES1` FOREIGN KEY (`DNI_DOCENTE`) REFERENCES `docentes` (`DNI`);

--
-- Filtros para la tabla `docentes_por_comision`
--
ALTER TABLE `docentes_por_comision`
  ADD CONSTRAINT `fk_DOCENTES_POR_COMISION_COMISIONES_EVALAUDORAS1` FOREIGN KEY (`ID_COMISION`) REFERENCES `comisiones_evalaudoras` (`ID_COMISON`),
  ADD CONSTRAINT `fk_DOCENTES_POR_COMISION_DOCENTES1` FOREIGN KEY (`DNI_DOCENTE`) REFERENCES `docentes` (`DNI`);

--
-- Filtros para la tabla `estadios_por_pps`
--
ALTER TABLE `estadios_por_pps`
  ADD CONSTRAINT `fk_ESTADIOS_POR_PPS_ESTADOS1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADO`),
  ADD CONSTRAINT `fk_ESTADIOS_POR_PPS_PPSS1` FOREIGN KEY (`ID_PPS`) REFERENCES `ppss` (`ID_PPS`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `fk_ESTUDIANTES_PERSONAS1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`);

--
-- Filtros para la tabla `estudiantes_por_carrera`
--
ALTER TABLE `estudiantes_por_carrera`
  ADD CONSTRAINT `fk_ESTUDIANTES_POR_CARRERA_CARRERAS1` FOREIGN KEY (`NOMBRE_DE_CARRERA`) REFERENCES `carreras` (`NOMBRE`),
  ADD CONSTRAINT `fk_ESTUDIANTES_POR_CARRERA_ESTUDIANTES1` FOREIGN KEY (`DNI_ESTUDIANTE`) REFERENCES `estudiantes` (`DNI`);

--
-- Filtros para la tabla `estudiantes_por_pps`
--
ALTER TABLE `estudiantes_por_pps`
  ADD CONSTRAINT `fk_ESTUDIANTES_POR_PPS_ESTUDIANTES1` FOREIGN KEY (`DNI_ESTUDIANTE`) REFERENCES `estudiantes` (`DNI`),
  ADD CONSTRAINT `fk_ESTUDIANTES_POR_PPS_PPSS1` FOREIGN KEY (`ID_PPS`) REFERENCES `ppss` (`ID_PPS`);

--
-- Filtros para la tabla `evaluaciones_ce`
--
ALTER TABLE `evaluaciones_ce`
  ADD CONSTRAINT `fk_EVALUACIONES_CE_COMISIONES_EVALAUDORAS1` FOREIGN KEY (`ID_COMISION_EVALUADORA`) REFERENCES `comisiones_evalaudoras` (`ID_COMISON`),
  ADD CONSTRAINT `fk_EVALUACIONES_CE_PPSS1` FOREIGN KEY (`ID_PPS`) REFERENCES `ppss` (`ID_PPS`);

--
-- Filtros para la tabla `organizaciones_por_pps`
--
ALTER TABLE `organizaciones_por_pps`
  ADD CONSTRAINT `fk_ORGANIZACIONES_POR_PPS_ORGANIZACIONES1` FOREIGN KEY (`ORGANIZACION`) REFERENCES `organizaciones` (`NOMBRE`),
  ADD CONSTRAINT `fk_ORGANIZACIONES_POR_PPS_PPSS1` FOREIGN KEY (`ID_PPS`) REFERENCES `ppss` (`ID_PPS`);

--
-- Filtros para la tabla `planes_de_estudio_por_asignaturas`
--
ALTER TABLE `planes_de_estudio_por_asignaturas`
  ADD CONSTRAINT `FK_ASIGNATURA` FOREIGN KEY (`ASIGNATURA`) REFERENCES `asignaturas` (`NOMBRE`),
  ADD CONSTRAINT `FK_PLAN_2` FOREIGN KEY (`PLAN_DE_ESTUDIO`) REFERENCES `planes_de_estudio` (`RESOLUCION`);

--
-- Filtros para la tabla `planes_de_estudio_por_carrera`
--
ALTER TABLE `planes_de_estudio_por_carrera`
  ADD CONSTRAINT `NOMBRE_CARRERA` FOREIGN KEY (`CARRERA`) REFERENCES `carreras` (`NOMBRE`),
  ADD CONSTRAINT `PLAN_DE_ESTUDIO` FOREIGN KEY (`RESOLUCION`) REFERENCES `planes_de_estudio` (`RESOLUCION`);

--
-- Filtros para la tabla `planes_de_estudio_por_estudiante`
--
ALTER TABLE `planes_de_estudio_por_estudiante`
  ADD CONSTRAINT `DNI` FOREIGN KEY (`DNI_ESTUDIANTE`) REFERENCES `estudiantes` (`DNI`),
  ADD CONSTRAINT `FK_PLAN` FOREIGN KEY (`RESOLUCION`) REFERENCES `planes_de_estudio` (`RESOLUCION`);

--
-- Filtros para la tabla `tutores_de_organizacion`
--
ALTER TABLE `tutores_de_organizacion`
  ADD CONSTRAINT `fk_TUTORES_DE_ORGANIZACION_ORGANIZACIONES1` FOREIGN KEY (`ORGANIZACION`) REFERENCES `organizaciones` (`NOMBRE`),
  ADD CONSTRAINT `fk_TUTORES_DE_ORGANIZACION_PERSONAS1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`);

--
-- Filtros para la tabla `tutores_de_organizacion_por_pps`
--
ALTER TABLE `tutores_de_organizacion_por_pps`
  ADD CONSTRAINT `fk_TUTORES_DE_ORGANIZACION_POR_PPS_PPSS1` FOREIGN KEY (`ID_PPS`) REFERENCES `ppss` (`ID_PPS`),
  ADD CONSTRAINT `fk_TUTORES_DE_ORGANIZACION_POR_PPS_TUTORES_DE_ORGANIZACION1` FOREIGN KEY (`DNI_TUTOR`,`ORGANIZACION`) REFERENCES `tutores_de_organizacion` (`DNI`, `ORGANIZACION`);

--
-- Filtros para la tabla `tutores_docentes_por_pps`
--
ALTER TABLE `tutores_docentes_por_pps`
  ADD CONSTRAINT `fk_TUTORES_DOCENTES_POR_PPS_DOCENTES1` FOREIGN KEY (`DNI_DOCENTE`) REFERENCES `docentes` (`DNI`),
  ADD CONSTRAINT `fk_TUTORES_DOCENTES_POR_PPS_PPSS1` FOREIGN KEY (`ID_PPS`) REFERENCES `ppss` (`ID_PPS`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_USUARIOS_TIPOS_DE_USUARIO1` FOREIGN KEY (`TIPO_DE_USUARIO`) REFERENCES `tipos_de_usuario` (`TIPO`);

--
-- Filtros para la tabla `usuarios_por_personas`
--
ALTER TABLE `usuarios_por_personas`
  ADD CONSTRAINT `fk_USUARIOS_POR_PERSONAS_PERSONAS1` FOREIGN KEY (`DNI_PERSONA`) REFERENCES `personas` (`DNI`),
  ADD CONSTRAINT `fk_USUARIOS_POR_PERSONAS_USUARIOS1` FOREIGN KEY (`USUARIO`) REFERENCES `usuarios` (`USUARIO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
