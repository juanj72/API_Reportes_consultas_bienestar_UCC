-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2023 a las 10:22:07
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bienestardb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_actividad`
--

CREATE TABLE `api_actividad` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `administrativo_id` bigint(20) DEFAULT NULL,
  `estado_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_actividad`
--

INSERT INTO `api_actividad` (`id`, `nombre`, `descripcion`, `lugar`, `administrativo_id`, `estado_id`) VALUES
(1, 'instrumentos musicales', 'tecnica vocal, guitarra, cuatro, maracas, arpa', 'kiosco', 1, 1),
(2, 'futbol', 'entrenamientos de alto rendimiento para juegos ASCUN', 'cancha de futbol 11', 1, 1),
(3, 'espacios de lectura', 'consejos para una buena lectura y abstraccion de esta', 'Biblioteca', 1, 1),
(4, 'basquetball', 'hacer la mayor cantidad de cestas en una clase', 'polideprotivo pequeño', 1, 1),
(5, 'natacion', 'ir a nadar con los peces para aprender de ellos (datos de prueba)', 'psicina olimpica imder', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_actividaddia`
--

CREATE TABLE `api_actividaddia` (
  `id` bigint(20) NOT NULL,
  `hora_inicio` time(6) NOT NULL,
  `hora_fin` time(6) NOT NULL,
  `actividad_id` bigint(20) DEFAULT NULL,
  `dia_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_actividaddia`
--

INSERT INTO `api_actividaddia` (`id`, `hora_inicio`, `hora_fin`, `actividad_id`, `dia_id`) VALUES
(1, '16:00:00.000000', '19:00:00.000000', 1, 2),
(2, '13:00:00.000000', '16:00:00.000000', 2, 4),
(3, '17:00:00.000000', '20:00:00.000000', 3, 3),
(4, '12:00:00.000000', '14:00:00.000000', 5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_administrativo`
--

CREATE TABLE `api_administrativo` (
  `id` bigint(20) NOT NULL,
  `documento` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `perfil_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_administrativo`
--

INSERT INTO `api_administrativo` (`id`, `documento`, `telefono`, `cargo`, `perfil_id`) VALUES
(1, 56417, 2147483647, 'gerente', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_asistenciaactividad`
--

CREATE TABLE `api_asistenciaactividad` (
  `id` bigint(20) NOT NULL,
  `horas_registradas` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `actividad_id` bigint(20) DEFAULT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_asistenciaactividad`
--

INSERT INTO `api_asistenciaactividad` (`id`, `horas_registradas`, `fecha`, `actividad_id`, `estudiante_id`) VALUES
(1, 2, '2023-05-02 01:43:17.106227', 1, 1),
(2, 4, '2023-05-02 01:43:24.458876', 1, 1),
(3, 4, '2023-05-02 01:43:35.014039', 3, 2),
(4, 4, '2023-05-03 14:15:31.714187', 5, 4),
(5, 4, '2023-05-03 14:15:38.315603', 2, 5),
(6, 6, '2023-05-03 14:15:51.285806', 4, 4),
(7, 8, '2023-05-03 14:16:22.481814', 3, 10),
(8, 4, '2023-05-03 14:16:37.683012', 2, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_asistenciaevento`
--

CREATE TABLE `api_asistenciaevento` (
  `id` bigint(20) NOT NULL,
  `horas_registradas` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL,
  `evento_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_asistenciaevento`
--

INSERT INTO `api_asistenciaevento` (`id`, `horas_registradas`, `fecha`, `estudiante_id`, `evento_id`) VALUES
(1, 2, '2023-05-02 01:24:51.013972', 1, 1),
(2, 1, '2023-05-02 01:24:59.283969', 2, 1),
(3, 4, '2023-05-02 01:28:49.776263', 1, 1),
(4, 4, '2023-05-02 01:29:13.511605', 1, 1),
(5, 4, '2023-05-02 01:29:26.272875', 1, 2),
(6, 2, '2023-05-03 15:01:52.540957', 4, 2),
(7, 2, '2023-05-03 15:06:15.908512', 5, 3),
(8, 4, '2023-05-03 15:06:27.458864', 11, 4),
(9, 2, '2023-05-03 15:07:55.435866', 7, 3),
(10, 3, '2023-05-03 15:08:32.403762', 2, 4),
(11, 2, '2023-05-03 15:08:47.563152', 6, 4),
(12, 2, '2023-05-03 15:09:00.166672', 8, 4),
(13, 3, '2023-05-03 15:09:09.423234', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_dia`
--

CREATE TABLE `api_dia` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_dia`
--

INSERT INTO `api_dia` (`id`, `nombre`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sabado'),
(7, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_estado`
--

CREATE TABLE `api_estado` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_estado`
--

INSERT INTO `api_estado` (`id`, `nombre`) VALUES
(1, 'ALTA'),
(2, 'BAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_estudiante`
--

CREATE TABLE `api_estudiante` (
  `id` bigint(20) NOT NULL,
  `documento` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `perfil_id` bigint(20) DEFAULT NULL,
  `programa_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_estudiante`
--

INSERT INTO `api_estudiante` (`id`, `documento`, `telefono`, `perfil_id`, `programa_id`) VALUES
(1, 1006810369, 232156, 1, 1),
(2, 211903752, 2147483647, 3, 3),
(3, 449449, 2147483647, 4, 4),
(4, 446931, 2541154, 6, 3),
(5, 79891, 1651, 5, 8),
(6, 9841, 1561561, 7, 6),
(7, 2244455, 233541, 8, 3),
(8, 12894, 321454, 9, 1),
(9, 89563, 32546, 10, 7),
(10, 8546, 45784, 11, 8),
(11, 9862, 59845, 12, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_evento`
--

CREATE TABLE `api_evento` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `Estado_id` bigint(20) DEFAULT NULL,
  `administrativo_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_evento`
--

INSERT INTO `api_evento` (`id`, `nombre`, `descripcion`, `lugar`, `fecha_inicio`, `fecha_fin`, `Estado_id`, `administrativo_id`) VALUES
(1, 'feria del emprendimiento', 'exposicion de emprendimientos de tecnología', 'Auditorio', '2023-05-03', '2023-05-07', 1, 1),
(2, 'flisol', 'Exposicion de software libre para todos', 'Universidad de los llanoa', '2023-05-07', '2023-05-08', 1, 1),
(3, 'Jornada masiva', 'actividades recreativas para promover la salud mental', 'cancha de futbol 11', '2023-05-06', '2023-05-06', 1, 1),
(4, 'Conferencia procesamiento de imagenes', 'conferencia de procesamiento de imagenes para la deteccion de cancer', 'auditorio universidad cooperativa sede kirpas', '2023-05-04', '2023-05-04', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_perfil`
--

CREATE TABLE `api_perfil` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `rol_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_perfil`
--

INSERT INTO `api_perfil` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `rol_id`) VALUES
(1, 'pbkdf2_sha256$390000$or1t5AQhrBnjVBXRDgy4sF$sMT7SY2oEKye389HxYFLpFDIcgL7omNwzuc/kRd2zN4=', '2023-05-01 20:24:25.604973', 1, 'juan', 'Juan José', 'Jara Álvarez', 1, 1, '2023-05-01 20:23:51.790956', 'juan.jara@campusucc.edu.co', 2),
(2, 'pbkdf2_sha256$390000$Rq2ebPgxBCGXuzSmO1T5o0$Fy6S1Nv4dP4RaStCPhLVuUF9cbXqJ4LLqpb/SvvuYJ8=', NULL, 0, 'gerente', 'karlos', 'araujo', 0, 1, '2023-05-01 20:34:19.338342', 'karlos.araujo@campusucc.edu.co', 2),
(3, 'pbkdf2_sha256$390000$EBuNdtLxlsCtqPosMqc7FT$7rIE/G4uIadxhc8h/mOSEZDFmap5sH/LLY34YvjoHN8=', NULL, 0, 'danielas', 'Daniela', 'Silva Tejedor', 0, 1, '2023-05-01 23:13:10.627600', 'daniela.silva@campusucc.edu.co', 1),
(4, 'pbkdf2_sha256$390000$60F2cZdb4wDtU3y6ECAQOn$iPxlUNXoeFJ/6tRO61ovaKsuIO9BqOphAJSBe1LedD4=', NULL, 0, 'carlos', 'Carlos', 'Garcia', 0, 1, '2023-05-01 23:14:29.773476', 'carlos.garcia@campusucc.edu.co', 1),
(5, 'pbkdf2_sha256$390000$LuHaY6w2TaYpCqKin7cz4g$NImHfds1J2tbW1hja83oKfw5bXs5UUkANbiCQKA0I5k=', NULL, 0, 'arnoldo', 'arnoldo', 'iguaran', 0, 1, '2023-05-02 20:09:23.458597', 'arnoldo.iguaran@campusucc.edu.co', 1),
(6, 'pbkdf2_sha256$390000$wW4saTKLDMhlivgMyYhzed$x12XEXgSB0wsDFSxiTR6G0xk+tg3ZeZChSL2XpoMrFs=', NULL, 0, 'pedroc', 'pedro', 'coral', 0, 1, '2023-05-02 20:11:49.956499', 'pedro.coral@campusucc.edu.co', 1),
(7, 'pbkdf2_sha256$390000$BgFvWluqciwDRPlrg2GuEz$RfpH8PODHFe3WZwThIYbFOY9LmH99VrXjo0zD/vkxs0=', NULL, 0, 'katherinem', 'katherine', 'morales', 0, 1, '2023-05-02 20:12:54.013397', 'katherine.morales@campusucc.edu.co', 1),
(8, 'pbkdf2_sha256$390000$dK7uUel0vGt32QSoKTNA3o$FPYKqnBrdItc2PU2kUJLHH3nFysagb+4VQVsemMB5vM=', NULL, 0, 'gjara', 'german', 'jara', 0, 1, '2023-05-02 20:17:40.026669', 'gjara@campusucc.edu.co', 1),
(9, 'pbkdf2_sha256$390000$Gcm9kVaIkHxo0HGSPkKqzy$PQPU1ebeup9achrG3Y0LmhgbNSZ8qzJ7Udk9QD5IJnc=', NULL, 0, 'gmurcia', 'geovany', 'murcia', 0, 1, '2023-05-02 20:22:56.157020', 'gmurcia@campusucc.edu.co', 1),
(10, 'pbkdf2_sha256$390000$qtYIPycBVxMlW5bjg3Enom$QpsjU3WE2d67IPWzT6WyOSYdV4KqEmNgoMe//guW91M=', NULL, 0, 'robertob', 'Roberto', 'Baggio', 0, 1, '2023-05-02 20:55:36.444460', 'roberto.baggio@campusucc.edu.co', 1),
(11, 'pbkdf2_sha256$390000$LPCXz1yRpLYLKBpaLUrmNt$F6Rb1Kw6FQJZvqhxRfGol6JNCIap4BoGGStgakjiqbk=', NULL, 0, 'lalop', 'lalo', 'perez', 0, 1, '2023-05-02 20:58:09.454492', 'lalo.perez@campusucc.edu.co', 1),
(12, 'pbkdf2_sha256$390000$nb3UGaEq2YE4HByF9YoboU$ErfR9O3bRDD3u0H64QCruO3wxTGgTTvYniBcimwJH7c=', NULL, 0, 'omarp', 'omar', 'perez', 0, 1, '2023-05-02 21:01:15.923704', 'omar.perez@campusucc.edu.co', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_perfil_groups`
--

CREATE TABLE `api_perfil_groups` (
  `id` bigint(20) NOT NULL,
  `perfil_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_perfil_user_permissions`
--

CREATE TABLE `api_perfil_user_permissions` (
  `id` bigint(20) NOT NULL,
  `perfil_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_programa`
--

CREATE TABLE `api_programa` (
  `id` bigint(20) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_programa`
--

INSERT INTO `api_programa` (`id`, `codigo`, `nombre`) VALUES
(1, '7060', 'Ingeniería de sistemas'),
(2, '7061', 'Ingeniería civil'),
(3, '7062', 'Psicología'),
(4, '7063', 'Medicina'),
(5, '7064', 'Contaduría'),
(6, '7065', 'Medicina Veterinaria'),
(7, '7066', 'Odontología'),
(8, '7067', 'Enfermería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_rol`
--

CREATE TABLE `api_rol` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `api_rol`
--

INSERT INTO `api_rol` (`id`, `descripcion`) VALUES
(1, 'Estudiante'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('dba1cba72f7c7869db61e67009e956a33aaa876e', '2023-05-02 16:55:10.706236', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add administrativo', 6, 'add_administrativo'),
(22, 'Can change administrativo', 6, 'change_administrativo'),
(23, 'Can delete administrativo', 6, 'delete_administrativo'),
(24, 'Can view administrativo', 6, 'view_administrativo'),
(25, 'Can add estado', 7, 'add_estado'),
(26, 'Can change estado', 7, 'change_estado'),
(27, 'Can delete estado', 7, 'delete_estado'),
(28, 'Can view estado', 7, 'view_estado'),
(29, 'Can add programa', 8, 'add_programa'),
(30, 'Can change programa', 8, 'change_programa'),
(31, 'Can delete programa', 8, 'delete_programa'),
(32, 'Can view programa', 8, 'view_programa'),
(33, 'Can add rol', 9, 'add_rol'),
(34, 'Can change rol', 9, 'change_rol'),
(35, 'Can delete rol', 9, 'delete_rol'),
(36, 'Can view rol', 9, 'view_rol'),
(37, 'Can add user', 10, 'add_perfil'),
(38, 'Can change user', 10, 'change_perfil'),
(39, 'Can delete user', 10, 'delete_perfil'),
(40, 'Can view user', 10, 'view_perfil'),
(41, 'Can add evento', 11, 'add_evento'),
(42, 'Can change evento', 11, 'change_evento'),
(43, 'Can delete evento', 11, 'delete_evento'),
(44, 'Can view evento', 11, 'view_evento'),
(45, 'Can add estudiante', 12, 'add_estudiante'),
(46, 'Can change estudiante', 12, 'change_estudiante'),
(47, 'Can delete estudiante', 12, 'delete_estudiante'),
(48, 'Can view estudiante', 12, 'view_estudiante'),
(49, 'Can add actividad', 13, 'add_actividad'),
(50, 'Can change actividad', 13, 'change_actividad'),
(51, 'Can delete actividad', 13, 'delete_actividad'),
(52, 'Can view actividad', 13, 'view_actividad'),
(53, 'Can add dia', 14, 'add_dia'),
(54, 'Can change dia', 14, 'change_dia'),
(55, 'Can delete dia', 14, 'delete_dia'),
(56, 'Can view dia', 14, 'view_dia'),
(57, 'Can add actividad dia', 15, 'add_actividaddia'),
(58, 'Can change actividad dia', 15, 'change_actividaddia'),
(59, 'Can delete actividad dia', 15, 'delete_actividaddia'),
(60, 'Can view actividad dia', 15, 'view_actividaddia'),
(61, 'Can add asistencia evento', 16, 'add_asistenciaevento'),
(62, 'Can change asistencia evento', 16, 'change_asistenciaevento'),
(63, 'Can delete asistencia evento', 16, 'delete_asistenciaevento'),
(64, 'Can view asistencia evento', 16, 'view_asistenciaevento'),
(65, 'Can add asistencia actividad', 17, 'add_asistenciaactividad'),
(66, 'Can change asistencia actividad', 17, 'change_asistenciaactividad'),
(67, 'Can delete asistencia actividad', 17, 'delete_asistenciaactividad'),
(68, 'Can view asistencia actividad', 17, 'view_asistenciaactividad'),
(69, 'Can add Token', 18, 'add_token'),
(70, 'Can change Token', 18, 'change_token'),
(71, 'Can delete Token', 18, 'delete_token'),
(72, 'Can view Token', 18, 'view_token'),
(73, 'Can add token', 19, 'add_tokenproxy'),
(74, 'Can change token', 19, 'change_tokenproxy'),
(75, 'Can delete token', 19, 'delete_tokenproxy'),
(76, 'Can view token', 19, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-05-01 20:25:19.089266', '1', 'juan', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 10, 1),
(2, '2023-05-01 20:25:26.943348', '1', 'juan', 2, '[]', 10, 1),
(3, '2023-05-01 20:27:07.569849', '1', 'Rol object (1)', 1, '[{\"added\": {}}]', 9, 1),
(4, '2023-05-01 20:27:10.442898', '1', 'Rol object (1)', 2, '[]', 9, 1),
(5, '2023-05-01 20:27:18.310059', '2', 'Rol object (2)', 1, '[{\"added\": {}}]', 9, 1),
(6, '2023-05-01 20:27:57.545597', '1', 'juan', 2, '[{\"changed\": {\"fields\": [\"Rol\"]}}]', 10, 1),
(7, '2023-05-01 20:34:19.552023', '2', 'gerente', 1, '[{\"added\": {}}]', 10, 1),
(8, '2023-05-01 20:34:42.160611', '2', 'gerente', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(9, '2023-05-01 20:38:51.885417', '1', 'Estudiante object (1)', 1, '[{\"added\": {}}]', 12, 1),
(10, '2023-05-01 23:13:10.856397', '3', ' ', 1, '[{\"added\": {}}]', 10, 1),
(11, '2023-05-01 23:13:38.508222', '3', 'Daniela Silva Tejedor', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(12, '2023-05-01 23:14:30.018206', '4', ' ', 1, '[{\"added\": {}}]', 10, 1),
(13, '2023-05-01 23:14:47.985522', '4', 'Carlos Garcia', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(14, '2023-05-01 23:59:26.488011', '1', 'Lunes', 1, '[{\"added\": {}}]', 14, 1),
(15, '2023-05-01 23:59:31.319519', '2', 'Martes', 1, '[{\"added\": {}}]', 14, 1),
(16, '2023-05-01 23:59:35.249472', '3', 'Miercoles', 1, '[{\"added\": {}}]', 14, 1),
(17, '2023-05-01 23:59:39.426663', '4', 'Jueves', 1, '[{\"added\": {}}]', 14, 1),
(18, '2023-05-01 23:59:46.703818', '5', 'Viernes', 1, '[{\"added\": {}}]', 14, 1),
(19, '2023-05-01 23:59:53.658766', '6', 'Sabado', 1, '[{\"added\": {}}]', 14, 1),
(20, '2023-05-01 23:59:57.168942', '7', 'Domingo', 1, '[{\"added\": {}}]', 14, 1),
(21, '2023-05-02 00:01:43.288951', '1', 'Actividad object (1)', 1, '[{\"added\": {}}]', 13, 1),
(22, '2023-05-02 00:02:14.154349', '2', 'Actividad object (2)', 1, '[{\"added\": {}}]', 13, 1),
(23, '2023-05-02 00:02:52.247270', '3', 'Actividad object (3)', 1, '[{\"added\": {}}]', 13, 1),
(24, '2023-05-02 00:04:08.157387', '1', 'ActividadDia object (1)', 1, '[{\"added\": {}}]', 15, 1),
(25, '2023-05-02 01:24:51.024876', '1', 'AsistenciaEvento object (1)', 1, '[{\"added\": {}}]', 16, 1),
(26, '2023-05-02 01:24:59.295374', '2', 'AsistenciaEvento object (2)', 1, '[{\"added\": {}}]', 16, 1),
(27, '2023-05-02 01:28:49.777265', '3', 'AsistenciaEvento object (3)', 1, '[{\"added\": {}}]', 16, 1),
(28, '2023-05-02 01:29:13.512585', '4', 'AsistenciaEvento object (4)', 1, '[{\"added\": {}}]', 16, 1),
(29, '2023-05-02 01:29:26.283660', '5', 'AsistenciaEvento object (5)', 1, '[{\"added\": {}}]', 16, 1),
(30, '2023-05-02 01:43:17.118103', '1', 'AsistenciaActividad object (1)', 1, '[{\"added\": {}}]', 17, 1),
(31, '2023-05-02 01:43:24.469503', '2', 'AsistenciaActividad object (2)', 1, '[{\"added\": {}}]', 17, 1),
(32, '2023-05-02 01:43:35.014882', '3', 'AsistenciaActividad object (3)', 1, '[{\"added\": {}}]', 17, 1),
(33, '2023-05-02 20:09:23.701005', '5', ' ', 1, '[{\"added\": {}}]', 10, 1),
(34, '2023-05-02 20:09:56.735945', '5', 'arnoldo iguaran', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(35, '2023-05-02 20:10:14.009207', '5', 'arnoldo iguaran', 1, '[{\"added\": {}}]', 12, 1),
(36, '2023-05-02 20:11:50.172916', '6', ' ', 1, '[{\"added\": {}}]', 10, 1),
(37, '2023-05-02 20:12:13.333187', '6', 'pedro coral', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(38, '2023-05-02 20:12:24.660339', '4', 'pedro coral', 2, '[{\"changed\": {\"fields\": [\"Perfil\"]}}]', 12, 1),
(39, '2023-05-02 20:12:54.243793', '7', ' ', 1, '[{\"added\": {}}]', 10, 1),
(40, '2023-05-02 20:13:15.985857', '7', 'katherine morales', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(41, '2023-05-02 20:13:32.217089', '6', 'katherine morales', 1, '[{\"added\": {}}]', 12, 1),
(42, '2023-05-02 20:17:40.253399', '8', ' ', 1, '[{\"added\": {}}]', 10, 1),
(43, '2023-05-02 20:17:57.559575', '8', 'german jara', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(44, '2023-05-02 20:18:25.026211', '7', 'german jara', 1, '[{\"added\": {}}]', 12, 1),
(45, '2023-05-02 20:22:56.405807', '9', ' ', 1, '[{\"added\": {}}]', 10, 1),
(46, '2023-05-02 20:23:18.820763', '9', 'geovany murcia', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(47, '2023-05-02 20:23:39.291615', '8', 'geovany murcia', 1, '[{\"added\": {}}]', 12, 1),
(48, '2023-05-02 20:55:36.662294', '10', ' ', 1, '[{\"added\": {}}]', 10, 1),
(49, '2023-05-02 20:55:56.313495', '10', 'Roberto Baggio', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(50, '2023-05-02 20:56:46.034141', '9', 'Roberto Baggio', 1, '[{\"added\": {}}]', 12, 1),
(51, '2023-05-02 20:58:09.672004', '11', ' ', 1, '[{\"added\": {}}]', 10, 1),
(52, '2023-05-02 20:58:46.702329', '11', 'lalo perez', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(53, '2023-05-02 20:59:23.585358', '10', 'lalo perez', 1, '[{\"added\": {}}]', 12, 1),
(54, '2023-05-02 21:01:16.140366', '12', ' ', 1, '[{\"added\": {}}]', 10, 1),
(55, '2023-05-02 21:01:36.163192', '12', 'omar perez', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\", \"Rol\"]}}]', 10, 1),
(56, '2023-05-02 21:01:54.285980', '11', 'omar perez', 1, '[{\"added\": {}}]', 12, 1),
(57, '2023-05-03 14:13:25.044351', '4', 'basquetball', 1, '[{\"added\": {}}]', 13, 1),
(58, '2023-05-03 14:14:03.262151', '5', 'natacion', 1, '[{\"added\": {}}]', 13, 1),
(59, '2023-05-03 14:15:31.755362', '4', 'natacion - pedro coral', 1, '[{\"added\": {}}]', 17, 1),
(60, '2023-05-03 14:15:38.322109', '5', 'futbol - arnoldo iguaran', 1, '[{\"added\": {}}]', 17, 1),
(61, '2023-05-03 14:15:51.327077', '6', 'basquetball - pedro coral', 1, '[{\"added\": {}}]', 17, 1),
(62, '2023-05-03 14:16:22.524614', '7', 'espacios de lectura - lalo perez', 1, '[{\"added\": {}}]', 17, 1),
(63, '2023-05-03 14:16:37.731010', '8', 'futbol - Roberto Baggio', 1, '[{\"added\": {}}]', 17, 1),
(64, '2023-05-03 15:01:52.542335', '6', 'flisol - pedro coral', 1, '[{\"added\": {}}]', 16, 1),
(65, '2023-05-03 15:04:17.171875', '3', 'Jornada masiva', 1, '[{\"added\": {}}]', 11, 1),
(66, '2023-05-03 15:06:02.441009', '4', 'Conferencia procesamiento de imagenes', 1, '[{\"added\": {}}]', 11, 1),
(67, '2023-05-03 15:06:15.916972', '7', 'Jornada masiva - arnoldo iguaran', 1, '[{\"added\": {}}]', 16, 1),
(68, '2023-05-03 15:06:27.471298', '8', 'Conferencia procesamiento de imagenes - omar perez', 1, '[{\"added\": {}}]', 16, 1),
(69, '2023-05-03 15:07:55.449512', '9', 'Jornada masiva - german jara', 1, '[{\"added\": {}}]', 16, 1),
(70, '2023-05-03 15:08:32.416596', '10', 'Conferencia procesamiento de imagenes - Daniela Silva Tejedor', 1, '[{\"added\": {}}]', 16, 1),
(71, '2023-05-03 15:08:47.565149', '11', 'Conferencia procesamiento de imagenes - katherine morales', 1, '[{\"added\": {}}]', 16, 1),
(72, '2023-05-03 15:09:00.179446', '12', 'Conferencia procesamiento de imagenes - geovany murcia', 1, '[{\"added\": {}}]', 16, 1),
(73, '2023-05-03 15:09:09.435386', '13', 'feria del emprendimiento - pedro coral', 1, '[{\"added\": {}}]', 16, 1),
(74, '2023-05-04 05:33:53.723321', '2', 'ActividadDia object (2)', 1, '[{\"added\": {}}]', 15, 1),
(75, '2023-05-04 05:34:20.110302', '3', 'ActividadDia object (3)', 1, '[{\"added\": {}}]', 15, 1),
(76, '2023-05-04 05:37:03.567433', '4', 'ActividadDia object (4)', 1, '[{\"added\": {}}]', 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(13, 'API', 'actividad'),
(15, 'API', 'actividaddia'),
(6, 'API', 'administrativo'),
(17, 'API', 'asistenciaactividad'),
(16, 'API', 'asistenciaevento'),
(14, 'API', 'dia'),
(7, 'API', 'estado'),
(12, 'API', 'estudiante'),
(11, 'API', 'evento'),
(10, 'API', 'perfil'),
(8, 'API', 'programa'),
(9, 'API', 'rol'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(18, 'authtoken', 'token'),
(19, 'authtoken', 'tokenproxy'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-05-01 20:20:20.201963'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-05-01 20:20:20.230935'),
(3, 'auth', '0001_initial', '2023-05-01 20:20:20.377258'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-05-01 20:20:20.416028'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-05-01 20:20:20.421013'),
(6, 'auth', '0004_alter_user_username_opts', '2023-05-01 20:20:20.425861'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-05-01 20:20:20.431877'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-05-01 20:20:20.433873'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-05-01 20:20:20.439417'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-05-01 20:20:20.445389'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-05-01 20:20:20.451531'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-05-01 20:20:20.462617'),
(13, 'auth', '0011_update_proxy_permissions', '2023-05-01 20:20:20.469599'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-05-01 20:20:20.475585'),
(15, 'API', '0001_initial', '2023-05-01 20:20:21.008720'),
(16, 'admin', '0001_initial', '2023-05-01 20:20:21.097031'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-05-01 20:20:21.115792'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-01 20:20:21.123216'),
(19, 'sessions', '0001_initial', '2023-05-01 20:20:21.150962'),
(20, 'API', '0002_estudiante_programa', '2023-05-01 23:04:17.247171'),
(21, 'API', '0003_dia_actividaddia', '2023-05-01 23:58:24.766110'),
(22, 'API', '0004_asistenciaevento', '2023-05-02 01:23:41.989425'),
(23, 'API', '0005_asistenciaactividad', '2023-05-02 01:37:58.079386'),
(24, 'authtoken', '0001_initial', '2023-05-02 16:45:58.619417'),
(25, 'authtoken', '0002_auto_20160226_1747', '2023-05-02 16:45:58.653929'),
(26, 'authtoken', '0003_tokenproxy', '2023-05-02 16:45:58.656870');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('m4u9otbbcwyl8icll0777esm7oy2c1zz', '.eJxVjEEOwiAQRe_C2hBKGWBcuvcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnEWgzj9bpHSI7cd8J3abZZpbusyRbkr8qBdXmfOz8vh_h1U6vVbEzNwGUxURRu0I4MbuUBmiMhWa0IyaBxq79FGiAm8Ssk6pOKK8Uq8P_OIN_U:1pta4P:AeR940bCRV14R1lDz_XnkxguLKsNxnJkK8_MXehougM', '2023-05-15 20:24:25.604973');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `api_actividad`
--
ALTER TABLE `api_actividad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `API_actividad_administrativo_id_ef15d619_fk_API_admin` (`administrativo_id`),
  ADD KEY `API_actividad_estado_id_368347cc_fk_API_estado_id` (`estado_id`);

--
-- Indices de la tabla `api_actividaddia`
--
ALTER TABLE `api_actividaddia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `API_actividaddia_actividad_id_c8a573e0_fk_API_actividad_id` (`actividad_id`),
  ADD KEY `API_actividaddia_dia_id_1f1e9ec7_fk_API_dia_id` (`dia_id`);

--
-- Indices de la tabla `api_administrativo`
--
ALTER TABLE `api_administrativo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `API_administrativo_perfil_id_d75d79e4_fk_API_perfil_id` (`perfil_id`);

--
-- Indices de la tabla `api_asistenciaactividad`
--
ALTER TABLE `api_asistenciaactividad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `API_asistenciaactivi_actividad_id_55d3f2a2_fk_API_activ` (`actividad_id`),
  ADD KEY `API_asistenciaactivi_estudiante_id_7a70b038_fk_API_estud` (`estudiante_id`);

--
-- Indices de la tabla `api_asistenciaevento`
--
ALTER TABLE `api_asistenciaevento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `API_asistenciaevento_estudiante_id_bc656be4_fk_API_estudiante_id` (`estudiante_id`),
  ADD KEY `API_asistenciaevento_evento_id_300250e5_fk_API_evento_id` (`evento_id`);

--
-- Indices de la tabla `api_dia`
--
ALTER TABLE `api_dia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_estado`
--
ALTER TABLE `api_estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_estudiante`
--
ALTER TABLE `api_estudiante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `API_estudiante_perfil_id_b8798377_fk_API_perfil_id` (`perfil_id`),
  ADD KEY `API_estudiante_programa_id_269506e2_fk_API_programa_id` (`programa_id`);

--
-- Indices de la tabla `api_evento`
--
ALTER TABLE `api_evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `API_evento_Estado_id_2b7f5cb6_fk_API_estado_id` (`Estado_id`),
  ADD KEY `API_evento_administrativo_id_54cd713c_fk_API_administrativo_id` (`administrativo_id`);

--
-- Indices de la tabla `api_perfil`
--
ALTER TABLE `api_perfil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `API_perfil_rol_id_38606386_fk_API_rol_id` (`rol_id`);

--
-- Indices de la tabla `api_perfil_groups`
--
ALTER TABLE `api_perfil_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `API_perfil_groups_perfil_id_group_id_c7b83a4c_uniq` (`perfil_id`,`group_id`),
  ADD KEY `API_perfil_groups_group_id_07988bda_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `api_perfil_user_permissions`
--
ALTER TABLE `api_perfil_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `API_perfil_user_permissi_perfil_id_permission_id_3859a822_uniq` (`perfil_id`,`permission_id`),
  ADD KEY `API_perfil_user_perm_permission_id_bcc84698_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `api_programa`
--
ALTER TABLE `api_programa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `api_rol`
--
ALTER TABLE `api_rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_API_perfil_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `api_actividad`
--
ALTER TABLE `api_actividad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `api_actividaddia`
--
ALTER TABLE `api_actividaddia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `api_administrativo`
--
ALTER TABLE `api_administrativo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `api_asistenciaactividad`
--
ALTER TABLE `api_asistenciaactividad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `api_asistenciaevento`
--
ALTER TABLE `api_asistenciaevento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `api_dia`
--
ALTER TABLE `api_dia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `api_estado`
--
ALTER TABLE `api_estado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `api_estudiante`
--
ALTER TABLE `api_estudiante`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `api_evento`
--
ALTER TABLE `api_evento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `api_perfil`
--
ALTER TABLE `api_perfil`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `api_perfil_groups`
--
ALTER TABLE `api_perfil_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_perfil_user_permissions`
--
ALTER TABLE `api_perfil_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `api_programa`
--
ALTER TABLE `api_programa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `api_rol`
--
ALTER TABLE `api_rol`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `api_actividad`
--
ALTER TABLE `api_actividad`
  ADD CONSTRAINT `API_actividad_administrativo_id_ef15d619_fk_API_admin` FOREIGN KEY (`administrativo_id`) REFERENCES `api_administrativo` (`id`),
  ADD CONSTRAINT `API_actividad_estado_id_368347cc_fk_API_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `api_estado` (`id`);

--
-- Filtros para la tabla `api_actividaddia`
--
ALTER TABLE `api_actividaddia`
  ADD CONSTRAINT `API_actividaddia_actividad_id_c8a573e0_fk_API_actividad_id` FOREIGN KEY (`actividad_id`) REFERENCES `api_actividad` (`id`),
  ADD CONSTRAINT `API_actividaddia_dia_id_1f1e9ec7_fk_API_dia_id` FOREIGN KEY (`dia_id`) REFERENCES `api_dia` (`id`);

--
-- Filtros para la tabla `api_administrativo`
--
ALTER TABLE `api_administrativo`
  ADD CONSTRAINT `API_administrativo_perfil_id_d75d79e4_fk_API_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `api_perfil` (`id`);

--
-- Filtros para la tabla `api_asistenciaactividad`
--
ALTER TABLE `api_asistenciaactividad`
  ADD CONSTRAINT `API_asistenciaactivi_actividad_id_55d3f2a2_fk_API_activ` FOREIGN KEY (`actividad_id`) REFERENCES `api_actividad` (`id`),
  ADD CONSTRAINT `API_asistenciaactivi_estudiante_id_7a70b038_fk_API_estud` FOREIGN KEY (`estudiante_id`) REFERENCES `api_estudiante` (`id`);

--
-- Filtros para la tabla `api_asistenciaevento`
--
ALTER TABLE `api_asistenciaevento`
  ADD CONSTRAINT `API_asistenciaevento_estudiante_id_bc656be4_fk_API_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `api_estudiante` (`id`),
  ADD CONSTRAINT `API_asistenciaevento_evento_id_300250e5_fk_API_evento_id` FOREIGN KEY (`evento_id`) REFERENCES `api_evento` (`id`);

--
-- Filtros para la tabla `api_estudiante`
--
ALTER TABLE `api_estudiante`
  ADD CONSTRAINT `API_estudiante_perfil_id_b8798377_fk_API_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `api_perfil` (`id`),
  ADD CONSTRAINT `API_estudiante_programa_id_269506e2_fk_API_programa_id` FOREIGN KEY (`programa_id`) REFERENCES `api_programa` (`id`);

--
-- Filtros para la tabla `api_evento`
--
ALTER TABLE `api_evento`
  ADD CONSTRAINT `API_evento_Estado_id_2b7f5cb6_fk_API_estado_id` FOREIGN KEY (`Estado_id`) REFERENCES `api_estado` (`id`),
  ADD CONSTRAINT `API_evento_administrativo_id_54cd713c_fk_API_administrativo_id` FOREIGN KEY (`administrativo_id`) REFERENCES `api_administrativo` (`id`);

--
-- Filtros para la tabla `api_perfil`
--
ALTER TABLE `api_perfil`
  ADD CONSTRAINT `API_perfil_rol_id_38606386_fk_API_rol_id` FOREIGN KEY (`rol_id`) REFERENCES `api_rol` (`id`);

--
-- Filtros para la tabla `api_perfil_groups`
--
ALTER TABLE `api_perfil_groups`
  ADD CONSTRAINT `API_perfil_groups_group_id_07988bda_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `API_perfil_groups_perfil_id_dd4637a6_fk_API_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `api_perfil` (`id`);

--
-- Filtros para la tabla `api_perfil_user_permissions`
--
ALTER TABLE `api_perfil_user_permissions`
  ADD CONSTRAINT `API_perfil_user_perm_permission_id_bcc84698_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `API_perfil_user_permissions_perfil_id_0c8f8a6f_fk_API_perfil_id` FOREIGN KEY (`perfil_id`) REFERENCES `api_perfil` (`id`);

--
-- Filtros para la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_API_perfil_id` FOREIGN KEY (`user_id`) REFERENCES `api_perfil` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_API_perfil_id` FOREIGN KEY (`user_id`) REFERENCES `api_perfil` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
