-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-04-2026 a las 00:25:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `centro_medico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cita`
--

CREATE TABLE `Cita` (
  `id_cita` int(11) NOT NULL,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_consultorio` int(11) NOT NULL,
  `estado_cita` enum('Asignado','Atendido') NOT NULL,
  `observaciones_cita` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Consultorios`
--

CREATE TABLE `Consultorios` (
  `id_consultorio` int(11) NOT NULL,
  `nombre_consultorio` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `Consultorios`
--

INSERT INTO `Consultorios` (`id_consultorio`, `nombre_consultorio`) VALUES
(1, 'C-01'),
(2, 'C-02'),
(3, 'C-03'),
(4, 'C-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medico`
--

CREATE TABLE `Medico` (
  `id_medico` int(11) NOT NULL,
  `identificacion_medico` char(15) NOT NULL,
  `nombre_medico` varchar(50) NOT NULL,
  `apellidos_medico` varchar(50) NOT NULL,
  `especilidad_medico` varchar(50) NOT NULL,
  `telefono_medico` char(15) NOT NULL,
  `coreo_medico` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `Medico`
--

INSERT INTO `Medico` (`id_medico`, `identificacion_medico`, `nombre_medico`, `apellidos_medico`, `especilidad_medico`, `telefono_medico`, `coreo_medico`) VALUES
(1, '4444444444', 'Nicolas Alfonso', 'Cabrera Suares', 'Medico general', '3219876543', 'nicolascabrera@gmail.com'),
(2, '5555555555', 'Juan Fernando', 'Santana Cala', 'Ginecologo', '3214567890', 'juansantana@gmail.com'),
(3, '6666666666', 'Carlos Esteban', 'Galvis Montaña', 'Urologo', '3214567891', 'carlosgalvis@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Paciente`
--

CREATE TABLE `Paciente` (
  `id_paciente` int(11) NOT NULL,
  `identificacion_paciente` char(15) NOT NULL,
  `nombre_paciente` varchar(50) NOT NULL,
  `apellidos_paciente` varchar(50) NOT NULL,
  `fecha_nac_paciente` date NOT NULL,
  `sexo_paciente` enum('Femenino','Masculino','otro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `Paciente`
--

INSERT INTO `Paciente` (`id_paciente`, `identificacion_paciente`, `nombre_paciente`, `apellidos_paciente`, `fecha_nac_paciente`, `sexo_paciente`) VALUES
(1, '1111111111', 'Daniel Felipe', 'Dias Fontecha', '2007-07-21', 'Masculino'),
(2, '2222222222', 'Andres Felipe', 'Castillo Neira', '2009-11-09', 'Masculino'),
(3, '3333333333', 'Eyersson Bercelly', 'Montaña Chaparro', '2008-01-12', 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id_usuario` int(11) NOT NULL,
  `login_usuario` char(50) NOT NULL,
  `password_usuario` varchar(60) NOT NULL,
  `estado_usuario` enum('Activo','Inactivo') NOT NULL,
  `tipo_usuario` enum('Administrador','Asistente','Medico','Paciente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id_usuario`, `login_usuario`, `password_usuario`, `estado_usuario`, `tipo_usuario`) VALUES
(1, 'jhoasnelmendez@colegioguanenta.edu.co', '12345', 'Activo', 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Cita`
--
ALTER TABLE `Cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_consultorio` (`id_consultorio`);

--
-- Indices de la tabla `Consultorios`
--
ALTER TABLE `Consultorios`
  ADD PRIMARY KEY (`id_consultorio`);

--
-- Indices de la tabla `Medico`
--
ALTER TABLE `Medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `identificacion_medico` (`identificacion_medico`);

--
-- Indices de la tabla `Paciente`
--
ALTER TABLE `Paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `pac_identificacion` (`identificacion_paciente`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `login_usuario` (`login_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Cita`
--
ALTER TABLE `Cita`
  ADD CONSTRAINT `Cita_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Cita_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Cita_ibfk_3` FOREIGN KEY (`id_consultorio`) REFERENCES `Consultorios` (`id_consultorio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
