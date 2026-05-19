-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-04-2026 a las 22:48:42
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
-- Base de datos: centro_salud
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Citas
--

CREATE TABLE Citas (
  id_cita int(11) NOT NULL,
  fecha_cita date NOT NULL,
  hora_cita time NOT NULL,
  id_paciente int(11) NOT NULL,
  id_medico int(11) NOT NULL,
  id_consultorio int(11) NOT NULL,
  estado_cita enum('Asignado','Atendido') NOT NULL,
  observaciones_cita text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Consultorios
--

CREATE TABLE Consultorios (
  id_consultorio int(11) NOT NULL,
  nombre_consultorio char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Medico
--

CREATE TABLE Medico (
  id_medico int(11) NOT NULL,
  identificacion_medico char(15) NOT NULL,
  nombre_medico varchar(50) NOT NULL,
  apellido_medico varchar(50) NOT NULL,
  especilidad_medico varchar(50) NOT NULL,
  telefono_medico char(15) NOT NULL,
  coreo_medico varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Paciente
--

CREATE TABLE Paciente (
  id_paciente int(11) NOT NULL,
  pac_identificacion char(15) NOT NULL,
  pac_nombre varchar(50) NOT NULL,
  pac_apellido varchar(50) NOT NULL,
  pac_fecha_nacimiento date NOT NULL,
  pac_sexo enum('Femenino','Masculino','otro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla Usurio
--

CREATE TABLE Usurio (
  id_usuario int(11) NOT NULL,
  login_usuario char(15) NOT NULL,
  password_usuario varchar(60) NOT NULL,
  estado_usuario enum('Activo','Inactivo') NOT NULL,
  tipo_usuario enum('Administrador','Asistente','Medico','Paciente') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla Citas
--
ALTER TABLE Citas
  ADD PRIMARY KEY (id_cita),
  ADD KEY id_paciente (id_paciente),
  ADD KEY id_medico (id_medico),
  ADD KEY id_consultorio (id_consultorio);

--
-- Indices de la tabla Consultorios
--
ALTER TABLE Consultorios
  ADD PRIMARY KEY (id_consultorio);

--
-- Indices de la tabla Medico
--
ALTER TABLE Medico
  ADD PRIMARY KEY (id_medico),
  ADD UNIQUE KEY identificacion_medico (identificacion_medico);

--
-- Indices de la tabla Paciente
--
ALTER TABLE Paciente
  ADD PRIMARY KEY (id_paciente),
  ADD UNIQUE KEY pac_identificacion (pac_identificacion);

--
-- Indices de la tabla Usurio
--
ALTER TABLE Usurio
  ADD PRIMARY KEY (id_usuario),
  ADD UNIQUE KEY login_usuario (login_usuario);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla Citas
--
ALTER TABLE Citas
  ADD CONSTRAINT Citas_ibfk_1 FOREIGN KEY (id_paciente) REFERENCES Paciente (id_paciente) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT Citas_ibfk_2 FOREIGN KEY (id_medico) REFERENCES Medico (id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT Citas_ibfk_3 FOREIGN KEY (id_consultorio) REFERENCES Consultorios (id_consultorio) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;