-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2021 a las 18:27:10
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agendacitas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendamiento`
--

CREATE TABLE `agendamiento` (
  `id_agendamiento` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `apellidos` varchar(55) NOT NULL,
  `especialidad` varchar(55) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `correo` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `pacientes_id_paciente` int(11) NOT NULL,
  `doctores_id_doctores` int(11) NOT NULL,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `id_doctores` int(11) NOT NULL,
  `nombres` varchar(55) NOT NULL,
  `apellidos` varchar(55) NOT NULL,
  `num_documento` varchar(55) NOT NULL,
  `especialidad` varchar(55) NOT NULL,
  `genero` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `telefono` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores_has_especialidades`
--

CREATE TABLE `doctores_has_especialidades` (
  `id` int(11) NOT NULL,
  `doctores_id_doctores` int(11) NOT NULL,
  `especialidades_id_especialidades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidades` int(11) NOT NULL,
  `tipo_especialidad` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidades`, `tipo_especialidad`) VALUES
(1, 'Gastroenterologia'),
(2, 'Cardiologia'),
(3, 'Psicologia'),
(4, 'Neumonia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_clinica`
--

CREATE TABLE `historia_clinica` (
  `id_historia_clinica` int(11) NOT NULL,
  `sede_id_sede` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_pacientes` int(11) NOT NULL,
  `nombres` varchar(55) NOT NULL,
  `apellidos` varchar(55) NOT NULL,
  `num_documento` varchar(55) NOT NULL,
  `genero` varchar(55) NOT NULL,
  `email` int(55) NOT NULL,
  `telefono` varchar(55) NOT NULL,
  `enfermedad` varchar(55) NOT NULL,
  `medicamentos` varchar(55) NOT NULL,
  `alergias` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `accion` varchar(55) NOT NULL,
  `citas_id_citas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL,
  `nombre_sede` varchar(55) NOT NULL,
  `citas_id_citas` int(11) NOT NULL,
  `citas_pacientes_id_pacientes` int(11) NOT NULL,
  `citas_doctores_id_doctores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `descripcion` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Doctor'),
(3, 'Paciente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `apellidos` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(100) NOT NULL,
  `tipo_usuario_id_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellidos`, `email`, `username`, `password`, `tipo_usuario_id_FK`) VALUES
(5, 'Luis', 'Hernandez', 'lusih@gmail.com', 'luish22', '29d48c865079f37ecd2c43a293d610ef', 1),
(6, 'Johan', 'Posada', 'leiderps@gmail.com\r\n 			', 'jhoanps', '3ada65b7bae1aeeca499bfbe2193fd5f', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agendamiento`
--
ALTER TABLE `agendamiento`
  ADD PRIMARY KEY (`id_agendamiento`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `pacientes_id_FK` (`pacientes_id_paciente`),
  ADD KEY `doctores_id_FK` (`doctores_id_doctores`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id_doctores`);

--
-- Indices de la tabla `doctores_has_especialidades`
--
ALTER TABLE `doctores_has_especialidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_doctores_FK` (`doctores_id_doctores`),
  ADD KEY `id_especialidades_FK` (`especialidades_id_especialidades`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidades`);

--
-- Indices de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD PRIMARY KEY (`id_historia_clinica`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_pacientes`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `tipo_usuario_id_FK` (`tipo_usuario_id_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agendamiento`
--
ALTER TABLE `agendamiento`
  MODIFY `id_agendamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id_doctores` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doctores_has_especialidades`
--
ALTER TABLE `doctores_has_especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  MODIFY `id_historia_clinica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_pacientes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `doctores_id_FK` FOREIGN KEY (`doctores_id_doctores`) REFERENCES `doctores` (`id_doctores`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pacientes_id_FK` FOREIGN KEY (`pacientes_id_paciente`) REFERENCES `pacientes` (`id_pacientes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `doctores_has_especialidades`
--
ALTER TABLE `doctores_has_especialidades`
  ADD CONSTRAINT `id_doctores_FK` FOREIGN KEY (`doctores_id_doctores`) REFERENCES `doctores` (`id_doctores`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_especialidades_FK` FOREIGN KEY (`especialidades_id_especialidades`) REFERENCES `especialidades` (`id_especialidades`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `tipo_usuario_id_FK` FOREIGN KEY (`tipo_usuario_id_FK`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
