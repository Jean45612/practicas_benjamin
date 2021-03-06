-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2020 a las 02:49:36
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
-- Base de datos: `practicas_benjamin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_materno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modalidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periodo_egreso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesores`
--

CREATE TABLE `asesores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_materno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facultad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `escuela` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuestionario1`
--

CREATE TABLE `cuestionario1` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono_fijo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres_apellidos_encuestado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_graduado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alumno_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuestionario2`
--

CREATE TABLE `cuestionario2` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres_apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distrito` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono_fijo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono_contacto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alumno_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Correo Electrónico', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Contraseña', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Token de Recuerdo', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Creado', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Rol', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Creado', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Nombre', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Creado', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Actualizado', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Nombre a Mostrar', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Rol', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'nombres', 'text', 'Nombres', 1, 1, 1, 1, 1, 1, '{}', 3),
(24, 4, 'apellido_paterno', 'text', 'Apellido Paterno', 1, 1, 1, 1, 1, 1, '{}', 4),
(25, 4, 'apellido_materno', 'text', 'Apellido Materno', 1, 1, 1, 1, 1, 1, '{}', 5),
(26, 4, 'modalidad', 'text', 'Modalidad', 1, 1, 1, 1, 1, 1, '{}', 6),
(27, 4, 'dni', 'text', 'Dni', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"digits:8\"}}', 7),
(28, 4, 'periodo_egreso', 'text', 'Periodo Egreso', 1, 1, 1, 1, 1, 1, '{}', 8),
(29, 4, 'celular', 'text', 'Celular', 1, 1, 1, 1, 1, 1, '{}', 9),
(31, 4, 'user_id', 'text', 'Usuario', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:alumnos\"}}', 2),
(32, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 11),
(33, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(34, 4, 'alumno_belongsto_user_relationship', 'relationship', 'Usuario', 0, 1, 1, 1, 1, 1, '{\"scope\":\"alumno\",\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"alumnos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(35, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 0, '{}', 6),
(46, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(47, 6, 'nombres', 'text', 'Nombres', 1, 1, 1, 1, 1, 1, '{}', 3),
(48, 6, 'apellido_paterno', 'text', 'Apellido Paterno', 1, 1, 1, 1, 1, 1, '{}', 4),
(49, 6, 'apellido_materno', 'text', 'Apellido Materno', 1, 1, 1, 1, 1, 1, '{}', 5),
(50, 6, 'filial', 'text', 'Filial', 1, 1, 1, 1, 1, 1, '{}', 6),
(51, 6, 'facultad', 'text', 'Facultad', 1, 1, 1, 1, 1, 1, '{}', 7),
(52, 6, 'escuela', 'text', 'Escuela', 1, 1, 1, 1, 1, 1, '{}', 8),
(53, 6, 'user_id', 'text', 'Usuario', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:asesores\"}}', 2),
(54, 6, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(55, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(56, 6, 'asesore_belongsto_user_relationship', 'relationship', 'Usuario', 0, 1, 1, 1, 1, 1, '{\"scope\":\"asesor\",\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"alumnos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(57, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(58, 7, 'razon_social', 'text', 'Razón Social', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'direccion', 'text', 'Dirección', 1, 0, 1, 1, 1, 1, '{}', 4),
(60, 7, 'telefono_fijo', 'text', 'Telefono Fijo', 1, 0, 1, 1, 1, 1, '{}', 5),
(61, 7, 'nombres_apellidos_encuestado', 'text', 'Nombres Apellidos Encuestado', 1, 1, 1, 1, 1, 1, '{}', 6),
(62, 7, 'celular', 'text', 'Celular', 1, 0, 1, 1, 1, 1, '{}', 7),
(63, 7, 'correo', 'text', 'Correo', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"email\"}}', 8),
(64, 7, 'cargo', 'text', 'Cargo', 1, 0, 1, 1, 1, 1, '{}', 9),
(65, 7, 'nombre_graduado', 'text', 'Nombre Graduado', 1, 1, 1, 1, 1, 1, '{}', 10),
(66, 7, 'alumno_id', 'text', 'Alumno', 1, 0, 0, 0, 0, 0, '{}', 2),
(67, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 11),
(68, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(69, 7, 'cuestionario1_belongsto_alumno_relationship', 'relationship', 'Alumno', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\Models\\\\Alumno\",\"table\":\"alumnos\",\"type\":\"belongsTo\",\"column\":\"alumno_id\",\"key\":\"id\",\"label\":\"nombres\",\"pivot_table\":\"alumnos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(70, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 8, 'nombres_apellidos', 'text', 'Nombres y apellidos', 1, 1, 1, 1, 1, 1, '{}', 3),
(72, 8, 'dni', 'text', 'DNI', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"digits:8\"}}', 4),
(73, 8, 'fecha_nacimiento', 'date', 'Fecha Nacimiento', 1, 0, 1, 1, 1, 1, '{}', 5),
(74, 8, 'sexo', 'text', 'Sexo', 1, 1, 1, 1, 1, 1, '{}', 6),
(75, 8, 'direccion', 'text', 'Direccion', 1, 0, 1, 1, 1, 1, '{}', 7),
(76, 8, 'distrito', 'text', 'Distrito', 1, 0, 1, 1, 1, 1, '{}', 8),
(77, 8, 'provincia', 'text', 'Provincia', 1, 0, 1, 1, 1, 1, '{}', 9),
(78, 8, 'region', 'text', 'Region', 1, 0, 1, 1, 1, 1, '{}', 10),
(79, 8, 'pais', 'text', 'Pais', 1, 0, 1, 1, 1, 1, '{}', 11),
(80, 8, 'telefono_fijo', 'text', 'Telefono Fijo', 1, 0, 1, 1, 1, 1, '{}', 12),
(81, 8, 'celular', 'text', 'Celular', 1, 0, 1, 1, 1, 1, '{}', 13),
(82, 8, 'telefono_contacto', 'text', 'Telefono Contacto', 1, 0, 1, 1, 1, 1, '{}', 14),
(83, 8, 'correo1', 'text', 'Correo1', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"email\"}}', 15),
(84, 8, 'correo2', 'text', 'Correo2', 1, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"email\"}}', 16),
(85, 8, 'alumno_id', 'text', 'Alumno', 1, 0, 0, 0, 0, 0, '{}', 2),
(86, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 17),
(87, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 18),
(88, 8, 'cuestionario2_belongsto_alumno_relationship', 'relationship', 'Alumno', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\Models\\\\Alumno\",\"table\":\"alumnos\",\"type\":\"belongsTo\",\"column\":\"alumno_id\",\"key\":\"id\",\"label\":\"nombres\",\"pivot_table\":\"alumnos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Usuario', 'Usuarios', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-12-09 22:20:53', '2020-12-09 23:03:30'),
(2, 'menus', 'menus', 'Menú', 'Menús', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-12-09 22:20:53', '2020-12-09 22:20:53'),
(3, 'roles', 'roles', 'Rol', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-12-09 22:20:53', '2020-12-09 22:20:53'),
(4, 'alumnos', 'alumnos', 'Alumno', 'Alumnos', 'voyager-people', 'App\\Models\\Alumno', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-09 22:36:46', '2020-12-09 23:10:37'),
(6, 'asesores', 'asesores', 'Asesor', 'Asesores', 'voyager-archive', 'App\\Models\\Asesor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-09 23:19:42', '2020-12-09 23:24:56'),
(7, 'cuestionario1', 'cuestionario1', 'Cuestionario 1', 'Cuestionarios 1', 'voyager-documentation', 'App\\Models\\Cuestionario1', NULL, '\\App\\Http\\Controllers\\Cuestionario1Controller', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-09 23:34:09', '2020-12-10 01:41:21'),
(8, 'cuestionario2', 'cuestionario2', 'Cuestionario2', 'Cuestionarios 2', 'voyager-book', 'App\\Models\\Cuestionario2', NULL, '\\App\\Http\\Controllers\\Cuestionario2Controller', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-10 00:46:14', '2020-12-10 01:41:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-12-09 22:20:54', '2020-12-09 22:20:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(2, 1, 'Multimedia', '', '_self', 'voyager-images', NULL, NULL, 8, '2020-12-09 22:20:55', '2020-12-10 01:49:10', 'voyager.media.index', NULL),
(3, 1, 'Usuarios', '', '_self', 'voyager-person', NULL, NULL, 2, '2020-12-09 22:20:55', '2020-12-09 23:26:58', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 1, '2020-12-09 22:20:55', '2020-12-09 23:26:58', 'voyager.roles.index', NULL),
(5, 1, 'Herramientas', '', '_self', 'voyager-tools', NULL, NULL, 7, '2020-12-09 22:20:55', '2020-12-10 01:49:10', NULL, NULL),
(6, 1, 'Diseñador de Menús', '', '_self', 'voyager-list', NULL, 5, 1, '2020-12-09 22:20:55', '2020-12-09 23:26:59', 'voyager.menus.index', NULL),
(7, 1, 'Base de Datos', '', '_self', 'voyager-data', NULL, 5, 2, '2020-12-09 22:20:55', '2020-12-09 23:26:59', 'voyager.database.index', NULL),
(8, 1, 'Compás', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-12-09 22:20:55', '2020-12-09 23:26:59', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-12-09 22:20:55', '2020-12-09 23:26:59', 'voyager.bread.index', NULL),
(10, 1, 'Ajustes', '', '_self', 'voyager-settings', '#000000', NULL, 9, '2020-12-09 22:20:55', '2020-12-10 01:49:10', 'voyager.settings.index', 'null'),
(12, 1, 'Alumnos', '', '_self', 'voyager-people', NULL, NULL, 4, '2020-12-09 22:36:46', '2020-12-09 23:27:02', 'voyager.alumnos.index', NULL),
(14, 1, 'Asesores', '', '_self', 'voyager-archive', NULL, NULL, 3, '2020-12-09 23:19:42', '2020-12-09 23:27:01', 'voyager.asesores.index', NULL),
(15, 1, 'Cuestionarios 1', '', '_self', 'voyager-documentation', NULL, NULL, 5, '2020-12-09 23:34:09', '2020-12-10 01:49:08', 'voyager.cuestionario1.index', NULL),
(16, 1, 'Cuestionarios 2', '', '_self', 'voyager-book', NULL, NULL, 6, '2020-12-10 00:46:14', '2020-12-10 01:49:10', 'voyager.cuestionario2.index', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2020_12_09_205535_create_alumnos_table', 1),
(25, '2020_12_09_205558_create_asesores_table', 1),
(26, '2020_12_09_205744_create_cuestionario1_table', 1),
(27, '2020_12_09_205751_create_cuestionario2_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(2, 'browse_bread', NULL, '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(3, 'browse_database', NULL, '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(4, 'browse_media', NULL, '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(5, 'browse_compass', NULL, '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(6, 'browse_menus', 'menus', '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(7, 'read_menus', 'menus', '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(8, 'edit_menus', 'menus', '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(9, 'add_menus', 'menus', '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(10, 'delete_menus', 'menus', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(11, 'browse_roles', 'roles', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(12, 'read_roles', 'roles', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(13, 'edit_roles', 'roles', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(14, 'add_roles', 'roles', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(15, 'delete_roles', 'roles', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(16, 'browse_users', 'users', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(17, 'read_users', 'users', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(18, 'edit_users', 'users', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(19, 'add_users', 'users', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(20, 'delete_users', 'users', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(21, 'browse_settings', 'settings', '2020-12-09 22:20:57', '2020-12-09 22:20:57'),
(22, 'read_settings', 'settings', '2020-12-09 22:20:58', '2020-12-09 22:20:58'),
(23, 'edit_settings', 'settings', '2020-12-09 22:20:58', '2020-12-09 22:20:58'),
(24, 'add_settings', 'settings', '2020-12-09 22:20:58', '2020-12-09 22:20:58'),
(25, 'delete_settings', 'settings', '2020-12-09 22:20:58', '2020-12-09 22:20:58'),
(26, 'browse_hooks', NULL, '2020-12-09 22:21:02', '2020-12-09 22:21:02'),
(27, 'browse_alumnos', 'alumnos', '2020-12-09 22:36:46', '2020-12-09 22:36:46'),
(28, 'read_alumnos', 'alumnos', '2020-12-09 22:36:46', '2020-12-09 22:36:46'),
(29, 'edit_alumnos', 'alumnos', '2020-12-09 22:36:46', '2020-12-09 22:36:46'),
(30, 'add_alumnos', 'alumnos', '2020-12-09 22:36:46', '2020-12-09 22:36:46'),
(31, 'delete_alumnos', 'alumnos', '2020-12-09 22:36:46', '2020-12-09 22:36:46'),
(37, 'browse_asesores', 'asesores', '2020-12-09 23:19:42', '2020-12-09 23:19:42'),
(38, 'read_asesores', 'asesores', '2020-12-09 23:19:42', '2020-12-09 23:19:42'),
(39, 'edit_asesores', 'asesores', '2020-12-09 23:19:42', '2020-12-09 23:19:42'),
(40, 'add_asesores', 'asesores', '2020-12-09 23:19:42', '2020-12-09 23:19:42'),
(41, 'delete_asesores', 'asesores', '2020-12-09 23:19:42', '2020-12-09 23:19:42'),
(42, 'browse_cuestionario1', 'cuestionario1', '2020-12-09 23:34:09', '2020-12-09 23:34:09'),
(43, 'read_cuestionario1', 'cuestionario1', '2020-12-09 23:34:09', '2020-12-09 23:34:09'),
(44, 'edit_cuestionario1', 'cuestionario1', '2020-12-09 23:34:09', '2020-12-09 23:34:09'),
(45, 'add_cuestionario1', 'cuestionario1', '2020-12-09 23:34:09', '2020-12-09 23:34:09'),
(46, 'delete_cuestionario1', 'cuestionario1', '2020-12-09 23:34:09', '2020-12-09 23:34:09'),
(47, 'browse_cuestionario2', 'cuestionario2', '2020-12-10 00:46:14', '2020-12-10 00:46:14'),
(48, 'read_cuestionario2', 'cuestionario2', '2020-12-10 00:46:14', '2020-12-10 00:46:14'),
(49, 'edit_cuestionario2', 'cuestionario2', '2020-12-10 00:46:14', '2020-12-10 00:46:14'),
(50, 'add_cuestionario2', 'cuestionario2', '2020-12-10 00:46:14', '2020-12-10 00:46:14'),
(51, 'delete_cuestionario2', 'cuestionario2', '2020-12-10 00:46:14', '2020-12-10 00:46:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(42, 3),
(42, 4),
(43, 1),
(43, 3),
(43, 4),
(44, 1),
(44, 3),
(44, 4),
(45, 1),
(45, 3),
(45, 4),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(47, 4),
(48, 1),
(48, 3),
(48, 4),
(49, 1),
(49, 3),
(49, 4),
(50, 1),
(50, 3),
(50, 4),
(51, 1),
(51, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrador', '2020-12-09 22:20:56', '2020-12-09 22:20:56'),
(3, 'Alumno', 'Alumno', '2020-12-09 22:49:20', '2020-12-09 22:49:20'),
(4, 'Asesor', 'Asesor', '2020-12-09 22:49:27', '2020-12-09 22:49:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Título del sitio', 'Título del sitio', '', 'text', 1, 'Site'),
(2, 'site.description', 'Descripción del sitio', 'Descripción del sitio', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Logo del sitio', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'ID de rastreo de Google Analytics', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Imagen de fondo del administrador', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Título del administrador', 'Administrador', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Descripción del administrador', 'Bienvenido', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Imagen de carga del administrador', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Ícono del administrador', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'ID de Cliente para Google Analytics (usado para el tablero de administrador)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$LkclMxOUV6hwMmzFCtCs..THuxo7O/jezNUHkrZQwchBoFCu3/Sqi', NULL, NULL, '2020-12-09 22:21:36', '2020-12-09 22:21:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumnos_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `asesores`
--
ALTER TABLE `asesores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asesores_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `cuestionario1`
--
ALTER TABLE `cuestionario1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuestionario1_alumno_id_foreign` (`alumno_id`);

--
-- Indices de la tabla `cuestionario2`
--
ALTER TABLE `cuestionario2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuestionario2_alumno_id_foreign` (`alumno_id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `asesores`
--
ALTER TABLE `asesores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cuestionario1`
--
ALTER TABLE `cuestionario1`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cuestionario2`
--
ALTER TABLE `cuestionario2`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `asesores`
--
ALTER TABLE `asesores`
  ADD CONSTRAINT `asesores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `cuestionario1`
--
ALTER TABLE `cuestionario1`
  ADD CONSTRAINT `cuestionario1_alumno_id_foreign` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`);

--
-- Filtros para la tabla `cuestionario2`
--
ALTER TABLE `cuestionario2`
  ADD CONSTRAINT `cuestionario2_alumno_id_foreign` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`);

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
