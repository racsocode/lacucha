-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-10-2013 a las 09:57:34
-- Versión del servidor: 5.5.31
-- Versión de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `lacucha`
--
CREATE DATABASE IF NOT EXISTS `lacucha` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lacucha`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos_web`
--

CREATE TABLE IF NOT EXISTS `archivos_web` (
  `id_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `archivo_espanol` varchar(71) COLLATE utf8_unicode_ci NOT NULL,
  `archivo_ingles` varchar(71) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_archivo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `archivos_web`
--

INSERT INTO `archivos_web` (`id_archivo`, `archivo_espanol`, `archivo_ingles`) VALUES
(1, 'Presentacion_Llorens_Nacional.pps', 'Presentation Llorens Magazine PERU.pps');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE IF NOT EXISTS `articulos` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `nombre_articulo` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion_articulo` text COLLATE latin1_spanish_ci NOT NULL,
  `imagen_articulo` varchar(71) COLLATE latin1_spanish_ci NOT NULL,
  `thumb_imagen_articulo` varchar(71) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_articulo` date NOT NULL,
  PRIMARY KEY (`id_articulo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atributos`
--

CREATE TABLE IF NOT EXISTS `atributos` (
  `id_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_atributo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_atributo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `atributos`
--

INSERT INTO `atributos` (`id_atributo`, `nombre_atributo`) VALUES
(1, 'Tallas'),
(2, 'Colores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atributos_valores`
--

CREATE TABLE IF NOT EXISTS `atributos_valores` (
  `id_atributo_valor` int(11) NOT NULL AUTO_INCREMENT,
  `id_atributo` int(11) NOT NULL DEFAULT '0',
  `valor_atributo_valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id_atributo_valor`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `atributos_valores`
--

INSERT INTO `atributos_valores` (`id_atributo_valor`, `id_atributo`, `valor_atributo_valor`) VALUES
(1, 1, '40/45'),
(2, 1, '50/55'),
(3, 2, 'Negro'),
(4, 2, 'Marron');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `id_banner` int(11) NOT NULL AUTO_INCREMENT,
  `imagen_banner` varchar(71) NOT NULL,
  PRIMARY KEY (`id_banner`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id_banner`, `imagen_banner`) VALUES
(8, 'banner1.jpg'),
(9, 'banner2.jpg'),
(10, 'banner3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletines`
--

CREATE TABLE IF NOT EXISTS `boletines` (
  `id_boletin` int(11) NOT NULL DEFAULT '0',
  `titulo_boletin` varchar(255) NOT NULL DEFAULT '',
  `contenido_boletin` text NOT NULL,
  `fecha_creacion_boletin` date NOT NULL DEFAULT '0000-00-00',
  `fecha_envio_boletin` date NOT NULL DEFAULT '0000-00-00',
  `veces_enviado_boletin` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletines_enviados`
--

CREATE TABLE IF NOT EXISTS `boletines_enviados` (
  `id_boletin_enviado` int(11) NOT NULL AUTO_INCREMENT,
  `destinos_boletin_enviado` text NOT NULL,
  `asunto_boletin_enviado` varchar(250) NOT NULL DEFAULT '',
  `mensaje_boletin_enviado` text NOT NULL,
  `fecha_boletin_enviado` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id_boletin_enviado`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(200) NOT NULL,
  `imagen_categoria` varchar(71) NOT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `orden_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `imagen_categoria`, `id_parent`, `orden_categoria`) VALUES
(19, 'Transporte', '', 0, 5),
(18, 'Alquiler', '', 0, 4),
(17, 'CumpleaÃ±os', '', 0, 3),
(16, 'Belleza', '', 0, 2),
(15, 'Comida', '', 0, 1),
(20, 'Postres', '', 0, 6),
(21, 'Salud', '', 0, 7),
(22, 'Mascotas', '', 0, 8),
(23, 'InstalaciÃ³n', '', 0, 9),
(24, 'Maestro', '', 0, 10),
(25, 'Alcohol', '', 0, 11),
(26, 'BebÃ©s', '', 0, 12),
(27, 'Flores', '', 0, 13),
(28, 'Lectura', '', 0, 14),
(29, 'Alimentos', '', 0, 15),
(30, 'Eventos', '', 0, 16),
(31, 'Combustible', '', 0, 17),
(32, 'Profesionales', '', 0, 18),
(33, 'Online', '', 0, 19),
(34, 'Lectura', '', 0, 20),
(35, 'Profesionales', '', 0, 21),
(36, 'Limpieza', '', 0, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL DEFAULT '',
  `apellidos_cliente` varchar(50) NOT NULL DEFAULT '',
  `sexo_cliente` char(1) NOT NULL DEFAULT '',
  `email_cliente` varchar(100) NOT NULL DEFAULT '',
  `id_cliente_direccion` int(11) DEFAULT NULL,
  `id_direccion_envio` int(11) NOT NULL,
  `id_direccion_facturacion` int(11) NOT NULL,
  `movil_cliente` varchar(32) NOT NULL DEFAULT '',
  `telefono_cliente` varchar(32) DEFAULT NULL,
  `password_cliente` varchar(80) NOT NULL DEFAULT '',
  `boletin_cliente` char(1) NOT NULL DEFAULT 'N',
  `acceso_manuales_cliente` char(1) NOT NULL DEFAULT 'N',
  `observacion_cliente` text NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `apellidos_cliente`, `sexo_cliente`, `email_cliente`, `id_cliente_direccion`, `id_direccion_envio`, `id_direccion_facturacion`, `movil_cliente`, `telefono_cliente`, `password_cliente`, `boletin_cliente`, `acceso_manuales_cliente`, `observacion_cliente`) VALUES
(11, 'Oscar', 'Rodriguez', '', 'orodriguez@racsocode.com', 34, 34, 34, '946344918', '6509470', '5.82901114108E+12|52omu$5|ekam$w3809245n0t9', 'S', 'N', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_direcciones`
--

CREATE TABLE IF NOT EXISTS `clientes_direcciones` (
  `id_cliente_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL DEFAULT '0',
  `id_pais` int(11) NOT NULL,
  `id_provincia` int(11) NOT NULL,
  `nombre_cliente_direccion` varchar(50) NOT NULL DEFAULT '',
  `apellidos_cliente_direccion` varchar(50) NOT NULL DEFAULT '',
  `empresa_cliente` varchar(40) NOT NULL DEFAULT '',
  `direccion_cliente` varchar(200) NOT NULL,
  `cif_cliente` varchar(15) NOT NULL,
  `nif_cliente` varchar(15) NOT NULL,
  `codigo_postal_cliente` varchar(15) NOT NULL,
  `ciudad_cliente` varchar(70) NOT NULL,
  `estado_cliente` varchar(70) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente_direccion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `clientes_direcciones`
--

INSERT INTO `clientes_direcciones` (`id_cliente_direccion`, `id_cliente`, `id_pais`, `id_provincia`, `nombre_cliente_direccion`, `apellidos_cliente_direccion`, `empresa_cliente`, `direccion_cliente`, `cif_cliente`, `nif_cliente`, `codigo_postal_cliente`, `ciudad_cliente`, `estado_cliente`, `telefono`) VALUES
(34, 11, 0, 0, 'Oscar', 'Rodriguez', '', 'huiracocha 1833 Jesus maria', '', '', '051', 'Lima', '', '6509470');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_informacion`
--

CREATE TABLE IF NOT EXISTS `clientes_informacion` (
  `id_cliente` int(11) NOT NULL DEFAULT '0',
  `ultimo_acceso_cliente` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `numero_accesos_cliente` int(5) NOT NULL DEFAULT '0',
  `fecha_ingreso_cliente` date NOT NULL DEFAULT '0000-00-00',
  `fecha_ultima_modificacion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notificacion_producto_cliente` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes_informacion`
--

INSERT INTO `clientes_informacion` (`id_cliente`, `ultimo_acceso_cliente`, `numero_accesos_cliente`, `fecha_ingreso_cliente`, `fecha_ultima_modificacion`, `notificacion_producto_cliente`) VALUES
(9, '2011-06-09 09:50:06', 8, '2011-06-02', '2011-06-07 00:00:00', 0),
(10, '2011-06-02 18:53:10', 1, '2011-06-02', '2011-06-02 18:53:10', 0),
(11, '2011-12-11 10:27:17', 6, '2011-12-11', '2011-12-11 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos`
--

CREATE TABLE IF NOT EXISTS `codigos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `vacio` varchar(1) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `codigos`
--

INSERT INTO `codigos` (`codigo`, `vacio`) VALUES
(1, ''),
(2, ''),
(3, ''),
(4, ''),
(5, ''),
(6, ''),
(7, ''),
(8, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `comentario` text COLLATE latin1_spanish_ci NOT NULL,
  `id_articulo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_comentario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `usuario`, `email`, `comentario`, `id_articulo`, `fecha`) VALUES
(1, 'Jhonatan Smit Vasquez Urrutia', 'jvasquez@develoweb.net', 'Seria mejor que regrese al peru, para que pueda terminar su carrera en el cienciano del cuzco, club donde salio campeon de la sudamericana.', 3, '2011-05-31'),
(2, 'Milagros Gabriela Yrureta VÃ¡squez', 'gabriela_132@hotmail.com', 'Mejor que se quede por espaÃ±a.', 3, '2011-05-31'),
(3, 'Juan Carlos medina Ruiz', 'jcmedinaruiz@gmail.com', 'Es la tercera vez que magaly mete la pata, pero bien hace en retificarse ya que la pueden demandar de nuevo.', 5, '2011-05-31'),
(11, 'Carlos Ivan Vasquez', 'smit_148@hotmail.com', 'Esto es solo una cortina de humo, nada mas .', 2, '2011-05-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE IF NOT EXISTS `configuracion` (
  `id_configuracion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_configuracion` varchar(40) NOT NULL DEFAULT '',
  `valor_configuracion` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_configuracion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id_configuracion`, `nombre_configuracion`, `valor_configuracion`) VALUES
(1, 'NOMBRE_SITIO', 'Revista Ya es hora de ...'),
(2, 'EMAIL_CONTACTENOS', 'kathycastillo@gmail.com,crea@creatudominio.com,orodriguez@racsocode.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_pedidos`
--

CREATE TABLE IF NOT EXISTS `estados_pedidos` (
  `id_estado_pedido` int(11) NOT NULL DEFAULT '0',
  `id_idioma` int(11) NOT NULL DEFAULT '0',
  `nombre_estado_pedido` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados_pedidos`
--

INSERT INTO `estados_pedidos` (`id_estado_pedido`, `id_idioma`, `nombre_estado_pedido`) VALUES
(1, 1, 'Atendido'),
(2, 1, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE IF NOT EXISTS `idiomas` (
  `id_idioma` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_idioma` varchar(100) NOT NULL,
  `bandera_idioma` varchar(100) NOT NULL,
  `archivo_idioma` varchar(150) NOT NULL,
  PRIMARY KEY (`id_idioma`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id_idioma`, `nombre_idioma`, `bandera_idioma`, `archivo_idioma`) VALUES
(1, 'EspaÒol', 'flg_espa&ntilde;a.png', 'espanol.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informaciones`
--

CREATE TABLE IF NOT EXISTS `informaciones` (
  `id_informacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_informacion` varchar(50) NOT NULL DEFAULT '',
  `descripcion_informacion` text,
  `imagen_informacion` varchar(71) DEFAULT NULL,
  PRIMARY KEY (`id_informacion`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `informaciones`
--

INSERT INTO `informaciones` (`id_informacion`, `nombre_informacion`, `descripcion_informacion`, `imagen_informacion`) VALUES
(1, 'Qui sommes-nous?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\r\n\r\nLorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '110204112438quienes-somos.jpg'),
(3, 'Satisfait ou remboursÃ©', 'Los datos personales solicitados a travÃ©s de las pÃ¡ginas Web u otros medios, serÃ¡n incorporados a los archivos de los que ICQUS, es responsable. Esta informaciÃ³n serÃ¡ utilizada exclusivamente para informar al COMPRADOR sobre ofertas y actualizaciones de productos y no serÃ¡ transferida a terceros sin su previo consentimiento. En cumplimiento de la ley de ProtecciÃ³n de Datos, EL COMPRADOR podrÃ¡ solicitar la modificaciÃ³n o cancelaciÃ³n de sus datos en cualquier momento, contactando con el servicio de atenciÃ³n al cliente a travÃ©s de los medios indicados en la clÃ¡usula 5 de las presentes condiciones generales.\r\nEn el caso de compras realizadas con tarjetas de crÃ©dito, ICQUS, podrÃ¡ solicitar AL COMPRADOR, el envÃ­o por fax de las fotocopias de su documento de identidad y/o de la tarjeta de crÃ©dito.\r\n\r\nPROPIEDAD INTELECTUAL E INDUSTRIAL\r\nLos derechos de propiedad intelectual sobre el diseÃ±o y contenidos de la pÃ¡gina Web de ICQUS corresponden en exclusiva a ICQUS salvo que se indique otra titularidad. La reproducciÃ³n, distribuciÃ³n, o transformaciÃ³n no autorizadas de tales contenidos constituye una infracciÃ³n de los derechos de propiedad intelectual de ICQUS o del titular de los mismos, y podrÃ¡n derivar en las correspondientes acciones judiciales o extrajudiciales para el ejercicio de sus derechos.\r\n\r\nGARANTIA\r\nPara cualquier incidencia con su compra, serÃ¡ necesario ponerse en contacto con el Servicio de AtenciÃ³n al Cliente de ICQUS a travÃ©s de los medios previstos en la clÃ¡usula 5 de estas Condiciones Generales.\r\n\r\nDERECHO AL DESISTIMIENTO DEL COMPRADOR\r\nDe conformidad con el Real Decreto Legislativo 1/2007, de 16 de noviembre, por el que se aprueba el texto refundido de la Ley General para la Defensa de los Consumidores y Usuarios y otras leyes complementarias, el consumidor y usuario dispondrÃ¡ de un plazo de siete dÃ­as hÃ¡biles para ejercer el derecho de desistimiento. Este plazo se computarÃ¡ desde la recepciÃ³n por parte del consumidor y usuario del producto objeto de la compra. Para determinar la observancia del plazo por parte del consumidor y usuario, se tendrÃ¡ en cuenta la fecha de emisiÃ³n de la declaraciÃ³n de desistimiento.\r\nSe entenderÃ¡ realizado el desistimiento por parte del consumidor y usuario cuando, dentro del plazo legalmente establecido de siete dÃ­as hÃ¡biles, se dirija a la vendedora, a travÃ©s de los medios que aparecen en la claÃºsula 5 de las presentes Condiciones Generales de Compra, aportando junto a su declaraciÃ³n, la documentaciÃ³n correspondiente (factura o albaran de compra). El producto objeto de devoluciÃ³n, deberÃ¡ estar en perfectas condiciones, sin golpes, roces, manchas, sin seÃ±ales de uso y con su retractilado original. La devoluciÃ³n deberÃ¡ ser notificada, al personal del departamento comercial o de atenciÃ³n al cliente de la vendedora.\r\nCumplidos los anteriores requisitos, la empresa estarÃ¡ obligada a devolver las sumas abonadas por el consumidor y usuario dentro del plazo mÃ¡ximo de 30 dÃ­as a contar desde la recepciÃ³n de la declaraciÃ³n de desistimiento. La empresa solo devolverÃ¡ el coste del producto junto al importe de IVA correspondiente (si fuera el caso) tal como aparece en la factura o albarÃ¡n del producto comprado. En ningÃºn caso se devolverÃ¡ el importe de los gastos de envÃ­o ni cualquier otro correspondientes a la devoluciÃ³n, que serÃ¡n por cuenta del consumidor o usuario. AsÃ­ mismo, cualquier gasto derivado de dicha devoluciÃ³n, tal como gastos bancarios, tasas de tarjetas de crÃ©dito, gastos de Paypal, etc, deberÃ¡n ser asumidos por el consumidor y usuario.\r\n\r\nConforme al ArtÃ­culo 102 de la Ley General para la defensa de los Consumidores y Usuarios y al artÃ­culo 45 de la Ley 7/1996, de 15 de enero de OrdenaciÃ³n del Comercio Minorista, el derecho de desistimiento tendrÃ¡ las siguientes limitaciones:\r\nSalvo pacto en contrario, no serÃ¡ aplicable a los contratos amparados en el siguiente apartado.\r\n\r\nContratos de suministro de grabaciones sonoras o de vÃ­deo, de discos y de programas informÃ¡ticos que hubiesen sido desprecintados por el consumidor y usuario, asÃ­ como de ficheros informÃ¡ticos, suministrados por vÃ­a electrÃ³nica, susceptibles de ser descargados o reproducidos con carÃ¡cter inmediato para su uso permanente.\r\n\r\nLEY APLICABLE Y JURISDICCION\r\nPara cualquier divergencia surgida del presente contrato, ambas partes se someten expresamente, y con renuncia a su fuero propio, a la decisiÃ³n del asunto o litigio planteado, mediante el arbitraje institucional de ARBITEC, AsociaciÃ³n EspaÃ±ola de Arbitraje TecnolÃ³gico, a la cual encomiendan la administraciÃ³n del arbitraje y la designaciÃ³n de los Ã¡rbitros. El arbitraje se realizarÃ¡ conforme al procedimiento establecido en el Reglamento Arbitral de ARBITEC y en la Ley de Arbitraje, de 23 de diciembre de 2003 y podrÃ¡ realizarse a travÃ©s de Internet o utilizando cualquier otro medio telemÃ¡tico. El laudo arbitral deberÃ¡ dictarse durante los noventa dÃ­as siguientes a la aceptaciÃ³n del cargo por parte de los Ã¡rbitros designados, obligÃ¡ndose ambas partes a aceptar y cumplir la decisiÃ³n contenida en Ã©l. Para el caso de que el arbitraje no llegara a realizarse por mutuo acuerdo o fuese declarado nulo, ambas partes se someten a los Juzgados y Tribunales de la Ciudad de Madrid con renuncia a su propio fuero, si Ã©ste fuese otro..\r\n', ''),
(4, 'Satisfait ou Ã©changÃ©', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', ''),
(8, 'Paiement et expÃ©dition', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', ''),
(9, 'Guide des tailles', '', NULL),
(10, 'Nos points forts', '', NULL),
(11, 'Conditions GÃ©nÃ©rales de Vente', '', NULL),
(12, 'Protection des donnÃ©es', '', NULL),
(13, 'Conseils d''entretien', '', NULL),
(14, 'Mentions lÃ©gales', '', NULL),
(15, 'FAQ', '', NULL),
(16, 'Plan du site', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mailings`
--

CREATE TABLE IF NOT EXISTS `mailings` (
  `id_mailings` int(11) NOT NULL AUTO_INCREMENT,
  `email_mailings` varchar(120) NOT NULL,
  PRIMARY KEY (`id_mailings`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `mailings`
--

INSERT INTO `mailings` (`id_mailings`, `email_mailings`) VALUES
(15, 'jvasquez@develoweb.net'),
(16, 'jaume@llorens.pe'),
(17, 'orodriguez@racsocode.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE IF NOT EXISTS `metodo_pago` (
  `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_metodo_pago` varchar(100) NOT NULL DEFAULT '',
  `porcentaje_metodo_pago` decimal(10,2) NOT NULL DEFAULT '0.00',
  `activo_metodo_pago` char(3) NOT NULL DEFAULT 'S',
  `alias_metodo_pago` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodo_pago`, `nombre_metodo_pago`, `porcentaje_metodo_pago`, `activo_metodo_pago`, `alias_metodo_pago`) VALUES
(1, 'Paypal', '0.00', 'S', 'Paypal'),
(2, 'Transferencia Bancaria', '0.00', 'S', 'Transferencia Bancaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE IF NOT EXISTS `modulos` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_modulo` char(31) NOT NULL,
  PRIMARY KEY (`id_modulo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id_modulo`, `nombre_modulo`) VALUES
(1, 'Inicio'),
(2, 'Administrar'),
(5, 'Reportes'),
(4, 'Herramientas'),
(3, 'Ordenes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(64) NOT NULL DEFAULT '',
  `iso_code_2_pais` char(2) NOT NULL DEFAULT '',
  `iso_code_3_pais` char(3) NOT NULL DEFAULT '',
  `id_address_format` int(11) NOT NULL DEFAULT '0',
  `estado_envio_pais` int(1) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=240 ;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre_pais`, `iso_code_2_pais`, `iso_code_3_pais`, `id_address_format`, `estado_envio_pais`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 1, 0),
(2, 'Albania', 'AL', 'ALB', 1, 0),
(3, 'Algeria', 'DZ', 'DZA', 1, 0),
(4, 'American Samoa', 'AS', 'ASM', 1, 0),
(5, 'Andorra', 'AD', 'AND', 1, 0),
(6, 'Angola', 'AO', 'AGO', 1, 0),
(7, 'Anguilla', 'AI', 'AIA', 1, 0),
(8, 'Antarctica', 'AQ', 'ATA', 1, 0),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 1, 0),
(10, 'Argentina', 'AR', 'ARG', 1, 0),
(11, 'Armenia', 'AM', 'ARM', 1, 0),
(12, 'Aruba', 'AW', 'ABW', 1, 0),
(13, 'Australia', 'AU', 'AUS', 1, 0),
(14, 'Austria', 'AT', 'AUT', 5, 0),
(15, 'Azerbaijan', 'AZ', 'AZE', 1, 0),
(16, 'Bahamas', 'BS', 'BHS', 1, 0),
(17, 'Bahrain', 'BH', 'BHR', 1, 0),
(18, 'Bangladesh', 'BD', 'BGD', 1, 0),
(19, 'Barbados', 'BB', 'BRB', 1, 0),
(20, 'Belarus', 'BY', 'BLR', 1, 0),
(21, 'Belgium', 'BE', 'BEL', 1, 0),
(22, 'Belize', 'BZ', 'BLZ', 1, 0),
(23, 'Benin', 'BJ', 'BEN', 1, 0),
(24, 'Bermuda', 'BM', 'BMU', 1, 0),
(25, 'Bhutan', 'BT', 'BTN', 1, 0),
(26, 'Bolivia', 'BO', 'BOL', 1, 0),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1, 0),
(28, 'Botswana', 'BW', 'BWA', 1, 0),
(29, 'Bouvet Island', 'BV', 'BVT', 1, 0),
(30, 'Brazil', 'BR', 'BRA', 1, 0),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 1, 0),
(32, 'Brunei Darussalam', 'BN', 'BRN', 1, 0),
(33, 'Bulgaria', 'BG', 'BGR', 1, 0),
(34, 'Burkina Faso', 'BF', 'BFA', 1, 0),
(35, 'Burundi', 'BI', 'BDI', 1, 0),
(36, 'Cambodia', 'KH', 'KHM', 1, 0),
(37, 'Cameroon', 'CM', 'CMR', 1, 0),
(38, 'Canada', 'CA', 'CAN', 1, 0),
(39, 'Cape Verde', 'CV', 'CPV', 1, 0),
(40, 'Cayman Islands', 'KY', 'CYM', 1, 0),
(41, 'Central African Republic', 'CF', 'CAF', 1, 0),
(42, 'Chad', 'TD', 'TCD', 1, 0),
(43, 'Chile', 'CL', 'CHL', 1, 0),
(44, 'China', 'CN', 'CHN', 1, 0),
(45, 'Christmas Island', 'CX', 'CXR', 1, 0),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1, 0),
(47, 'Colombia', 'CO', 'COL', 1, 0),
(48, 'Comoros', 'KM', 'COM', 1, 0),
(49, 'Congo', 'CG', 'COG', 1, 0),
(50, 'Cook Islands', 'CK', 'COK', 1, 0),
(51, 'Costa Rica', 'CR', 'CRI', 1, 0),
(52, 'Cote D''Ivoire', 'CI', 'CIV', 1, 0),
(53, 'Croatia', 'HR', 'HRV', 1, 0),
(54, 'Cuba', 'CU', 'CUB', 1, 0),
(55, 'Cyprus', 'CY', 'CYP', 1, 0),
(56, 'Czech Republic', 'CZ', 'CZE', 1, 0),
(57, 'Denmark', 'DK', 'DNK', 1, 0),
(58, 'Djibouti', 'DJ', 'DJI', 1, 0),
(59, 'Dominica', 'DM', 'DMA', 1, 0),
(60, 'Dominican Republic', 'DO', 'DOM', 1, 0),
(61, 'East Timor', 'TP', 'TMP', 1, 0),
(62, 'Ecuador', 'EC', 'ECU', 1, 0),
(63, 'Egypt', 'EG', 'EGY', 1, 0),
(64, 'El Salvador', 'SV', 'SLV', 1, 0),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 1, 0),
(66, 'Eritrea', 'ER', 'ERI', 1, 0),
(67, 'Estonia', 'EE', 'EST', 1, 0),
(68, 'Ethiopia', 'ET', 'ETH', 1, 0),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1, 0),
(70, 'Faroe Islands', 'FO', 'FRO', 1, 0),
(71, 'Fiji', 'FJ', 'FJI', 1, 0),
(72, 'Finland', 'FI', 'FIN', 1, 0),
(73, 'France', 'FR', 'FRA', 1, 0),
(74, 'France, Metropolitan', 'FX', 'FXX', 1, 0),
(75, 'French Guiana', 'GF', 'GUF', 1, 0),
(76, 'French Polynesia', 'PF', 'PYF', 1, 0),
(77, 'French Southern Territories', 'TF', 'ATF', 1, 0),
(78, 'Gabon', 'GA', 'GAB', 1, 0),
(79, 'Gambia', 'GM', 'GMB', 1, 0),
(80, 'Georgia', 'GE', 'GEO', 1, 0),
(81, 'Germany', 'DE', 'DEU', 5, 0),
(82, 'Ghana', 'GH', 'GHA', 1, 0),
(83, 'Gibraltar', 'GI', 'GIB', 1, 0),
(84, 'Greece', 'GR', 'GRC', 1, 0),
(85, 'Greenland', 'GL', 'GRL', 1, 0),
(86, 'Grenada', 'GD', 'GRD', 1, 0),
(87, 'Guadeloupe', 'GP', 'GLP', 1, 0),
(88, 'Guam', 'GU', 'GUM', 1, 0),
(89, 'Guatemala', 'GT', 'GTM', 1, 0),
(90, 'Guinea', 'GN', 'GIN', 1, 0),
(91, 'Guinea-bissau', 'GW', 'GNB', 1, 0),
(92, 'Guyana', 'GY', 'GUY', 1, 0),
(93, 'Haiti', 'HT', 'HTI', 1, 0),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1, 0),
(95, 'Honduras', 'HN', 'HND', 1, 0),
(96, 'Hong Kong', 'HK', 'HKG', 1, 0),
(97, 'Hungary', 'HU', 'HUN', 1, 0),
(98, 'Iceland', 'IS', 'ISL', 1, 0),
(99, 'India', 'IN', 'IND', 1, 0),
(100, 'Indonesia', 'ID', 'IDN', 1, 0),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1, 0),
(102, 'Iraq', 'IQ', 'IRQ', 1, 0),
(103, 'Ireland', 'IE', 'IRL', 1, 0),
(104, 'Israel', 'IL', 'ISR', 1, 0),
(105, 'Italy', 'IT', 'ITA', 1, 0),
(106, 'Jamaica', 'JM', 'JAM', 1, 0),
(107, 'Japan', 'JP', 'JPN', 1, 0),
(108, 'Jordan', 'JO', 'JOR', 1, 0),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1, 0),
(110, 'Kenya', 'KE', 'KEN', 1, 0),
(111, 'Kiribati', 'KI', 'KIR', 1, 0),
(112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1, 0),
(113, 'Korea, Republic of', 'KR', 'KOR', 1, 0),
(114, 'Kuwait', 'KW', 'KWT', 1, 0),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1, 0),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1, 0),
(117, 'Latvia', 'LV', 'LVA', 1, 0),
(118, 'Lebanon', 'LB', 'LBN', 1, 0),
(119, 'Lesotho', 'LS', 'LSO', 1, 0),
(120, 'Liberia', 'LR', 'LBR', 1, 0),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1, 0),
(122, 'Liechtenstein', 'LI', 'LIE', 1, 0),
(123, 'Lithuania', 'LT', 'LTU', 1, 0),
(124, 'Luxembourg', 'LU', 'LUX', 1, 0),
(125, 'Macau', 'MO', 'MAC', 1, 0),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1, 0),
(127, 'Madagascar', 'MG', 'MDG', 1, 0),
(128, 'Malawi', 'MW', 'MWI', 1, 0),
(129, 'Malaysia', 'MY', 'MYS', 1, 0),
(130, 'Maldives', 'MV', 'MDV', 1, 0),
(131, 'Mali', 'ML', 'MLI', 1, 0),
(132, 'Malta', 'MT', 'MLT', 1, 0),
(133, 'Marshall Islands', 'MH', 'MHL', 1, 0),
(134, 'Martinique', 'MQ', 'MTQ', 1, 0),
(135, 'Mauritania', 'MR', 'MRT', 1, 0),
(136, 'Mauritius', 'MU', 'MUS', 1, 0),
(137, 'Mayotte', 'YT', 'MYT', 1, 0),
(138, 'Mexico', 'MX', 'MEX', 1, 0),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', 1, 0),
(140, 'Moldova, Republic of', 'MD', 'MDA', 1, 0),
(141, 'Monaco', 'MC', 'MCO', 1, 0),
(142, 'Mongolia', 'MN', 'MNG', 1, 0),
(143, 'Montserrat', 'MS', 'MSR', 1, 0),
(144, 'Morocco', 'MA', 'MAR', 1, 0),
(145, 'Mozambique', 'MZ', 'MOZ', 1, 0),
(146, 'Myanmar', 'MM', 'MMR', 1, 0),
(147, 'Namibia', 'NA', 'NAM', 1, 0),
(148, 'Nauru', 'NR', 'NRU', 1, 0),
(149, 'Nepal', 'NP', 'NPL', 1, 0),
(150, 'Netherlands', 'NL', 'NLD', 1, 0),
(151, 'Netherlands Antilles', 'AN', 'ANT', 1, 0),
(152, 'New Caledonia', 'NC', 'NCL', 1, 0),
(153, 'New Zealand', 'NZ', 'NZL', 1, 0),
(154, 'Nicaragua', 'NI', 'NIC', 1, 0),
(155, 'Niger', 'NE', 'NER', 1, 0),
(156, 'Nigeria', 'NG', 'NGA', 1, 0),
(157, 'Niue', 'NU', 'NIU', 1, 0),
(158, 'Norfolk Island', 'NF', 'NFK', 1, 0),
(159, 'Northern Mariana Islands', 'MP', 'MNP', 1, 0),
(160, 'Norway', 'NO', 'NOR', 1, 0),
(161, 'Oman', 'OM', 'OMN', 1, 0),
(162, 'Pakistan', 'PK', 'PAK', 1, 0),
(163, 'Palau', 'PW', 'PLW', 1, 0),
(164, 'Panama', 'PA', 'PAN', 1, 0),
(165, 'Papua New Guinea', 'PG', 'PNG', 1, 0),
(166, 'Paraguay', 'PY', 'PRY', 1, 0),
(167, 'Peru', 'PE', 'PER', 1, 1),
(168, 'Philippines', 'PH', 'PHL', 1, 0),
(169, 'Pitcairn', 'PN', 'PCN', 1, 0),
(170, 'Poland', 'PL', 'POL', 1, 0),
(171, 'Portugal', 'PT', 'PRT', 1, 0),
(172, 'Puerto Rico', 'PR', 'PRI', 1, 0),
(173, 'Qatar', 'QA', 'QAT', 1, 0),
(174, 'Reunion', 'RE', 'REU', 1, 0),
(175, 'Romania', 'RO', 'ROM', 1, 0),
(176, 'Russian Federation', 'RU', 'RUS', 1, 0),
(177, 'Rwanda', 'RW', 'RWA', 1, 0),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1, 0),
(179, 'Saint Lucia', 'LC', 'LCA', 1, 0),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1, 0),
(181, 'Samoa', 'WS', 'WSM', 1, 0),
(182, 'San Marino', 'SM', 'SMR', 1, 0),
(183, 'Sao Tome and Principe', 'ST', 'STP', 1, 0),
(184, 'Saudi Arabia', 'SA', 'SAU', 1, 0),
(185, 'Senegal', 'SN', 'SEN', 1, 0),
(186, 'Seychelles', 'SC', 'SYC', 1, 0),
(187, 'Sierra Leone', 'SL', 'SLE', 1, 0),
(188, 'Singapore', 'SG', 'SGP', 4, 0),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1, 0),
(190, 'Slovenia', 'SI', 'SVN', 1, 0),
(191, 'Solomon Islands', 'SB', 'SLB', 1, 0),
(192, 'Somalia', 'SO', 'SOM', 1, 0),
(193, 'South Africa', 'ZA', 'ZAF', 1, 0),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1, 0),
(195, 'Spain', 'ES', 'ESP', 3, 1),
(196, 'Sri Lanka', 'LK', 'LKA', 1, 0),
(197, 'St. Helena', 'SH', 'SHN', 1, 0),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1, 0),
(199, 'Sudan', 'SD', 'SDN', 1, 0),
(200, 'Suriname', 'SR', 'SUR', 1, 0),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1, 0),
(202, 'Swaziland', 'SZ', 'SWZ', 1, 0),
(203, 'Sweden', 'SE', 'SWE', 1, 0),
(204, 'Switzerland', 'CH', 'CHE', 1, 0),
(205, 'Syrian Arab Republic', 'SY', 'SYR', 1, 0),
(206, 'Taiwan', 'TW', 'TWN', 1, 0),
(207, 'Tajikistan', 'TJ', 'TJK', 1, 0),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1, 0),
(209, 'Thailand', 'TH', 'THA', 1, 0),
(210, 'Togo', 'TG', 'TGO', 1, 0),
(211, 'Tokelau', 'TK', 'TKL', 1, 0),
(212, 'Tonga', 'TO', 'TON', 1, 0),
(213, 'Trinidad and Tobago', 'TT', 'TTO', 1, 0),
(214, 'Tunisia', 'TN', 'TUN', 1, 0),
(215, 'Turkey', 'TR', 'TUR', 1, 0),
(216, 'Turkmenistan', 'TM', 'TKM', 1, 0),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', 1, 0),
(218, 'Tuvalu', 'TV', 'TUV', 1, 0),
(219, 'Uganda', 'UG', 'UGA', 1, 0),
(220, 'Ukraine', 'UA', 'UKR', 1, 0),
(221, 'United Arab Emirates', 'AE', 'ARE', 1, 0),
(222, 'United Kingdom', 'GB', 'GBR', 1, 0),
(223, 'United States', 'US', 'USA', 2, 0),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1, 0),
(225, 'Uruguay', 'UY', 'URY', 1, 0),
(226, 'Uzbekistan', 'UZ', 'UZB', 1, 0),
(227, 'Vanuatu', 'VU', 'VUT', 1, 0),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1, 0),
(229, 'Venezuela', 'VE', 'VEN', 1, 0),
(230, 'Viet Nam', 'VN', 'VNM', 1, 0),
(231, 'Virgin Islands (British)', 'VG', 'VGB', 1, 0),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1, 0),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1, 0),
(234, 'Western Sahara', 'EH', 'ESH', 1, 0),
(235, 'Yemen', 'YE', 'YEM', 1, 0),
(236, 'Yugoslavia', 'YU', 'YUG', 1, 0),
(237, 'Zaire', 'ZR', 'ZAR', 1, 0),
(238, 'Zambia', 'ZM', 'ZMB', 1, 0),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL DEFAULT '0',
  `id_moneda` int(11) NOT NULL DEFAULT '0',
  `id_estado_pedido` int(11) NOT NULL DEFAULT '2',
  `id_metodo_pago` int(11) NOT NULL DEFAULT '0',
  `id_metodo_envio` int(11) NOT NULL DEFAULT '0',
  `datos_envio` text NOT NULL,
  `datos_facturacion` text NOT NULL,
  `fecha_pedido` date NOT NULL DEFAULT '0000-00-00',
  `comentario_pedido` text NOT NULL,
  `monto_envio` float NOT NULL,
  `comentarios_pedido` text NOT NULL,
  `codigos_pedido` text NOT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `id_moneda`, `id_estado_pedido`, `id_metodo_pago`, `id_metodo_envio`, `datos_envio`, `datos_facturacion`, `fecha_pedido`, `comentario_pedido`, `monto_envio`, `comentarios_pedido`, `codigos_pedido`) VALUES
(19, 9, 0, 2, 2, 0, 'Jhonatan Smit<br>Vasquez Urrutia<br>La Habana 595  <br> 5174 - Lima, ', 'Jhonatan Smit<br>Vasquez Urrutia<br>La Habana 595  <br> 5174 - Lima, ', '2011-06-01', '', 0, '', '0000006-1'),
(20, 11, 0, 1, 2, 0, 'Oscar<br>Rodriguez<br>huiracocha 1833 Jesus maria  <br> 051 - Lima, ', 'Oscar<br>Rodriguez<br>huiracocha 1833 Jesus maria  <br> 051 - Lima, ', '2011-12-11', '', 0, 'aaaaaaaaaaaaaaaa', '000007-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_productos`
--

CREATE TABLE IF NOT EXISTS `pedidos_productos` (
  `id_pedido_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL DEFAULT '0',
  `id_producto` tinytext NOT NULL,
  `cantidad_pedido_producto` int(11) NOT NULL DEFAULT '0',
  `precio_final_pedido_producto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `imagen` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido_producto`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `pedidos_productos`
--

INSERT INTO `pedidos_productos` (`id_pedido_producto`, `id_pedido`, `id_producto`, `cantidad_pedido_producto`, `precio_final_pedido_producto`, `imagen`, `id_categoria`) VALUES
(19, 19, '15', 1, '1800.00', 'Jellyfish.jpg', 8),
(20, 20, '15', 1, '1800.00', 'loguito.jpg', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_productos_opciones`
--

CREATE TABLE IF NOT EXISTS `pedidos_productos_opciones` (
  `id_pedido_producto_opciones` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido_producto` int(11) NOT NULL DEFAULT '0',
  `producto_opcion` varchar(150) NOT NULL,
  `producto_opcion_valor` varchar(150) NOT NULL,
  `producto_opcion_precio` varchar(150) NOT NULL,
  `prefijo_precio` char(1) NOT NULL,
  PRIMARY KEY (`id_pedido_producto_opciones`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `nombre_producto` varchar(300) NOT NULL,
  `descripcion_producto` text NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `precio_producto` float(10,2) NOT NULL,
  `disponibilidad_producto` int(1) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_categorias1` (`id_categoria`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `id_categoria`, `nombre_producto`, `descripcion_producto`, `cantidad_producto`, `precio_producto`, `disponibilidad_producto`) VALUES
(15, 1, 'Anuncio de 300 x 200 px', 'El anuncio es mostrado en el detalle de los articulos de la pagina', 99999990, 0.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_atributos`
--

CREATE TABLE IF NOT EXISTS `productos_atributos` (
  `id_producto_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL DEFAULT '0',
  `id_atributo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_producto_atributo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_atributos_valores`
--

CREATE TABLE IF NOT EXISTS `productos_atributos_valores` (
  `id_producto_atributo_valor` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto_atributo` int(11) NOT NULL DEFAULT '0',
  `id_atributo_valor` int(11) NOT NULL DEFAULT '0',
  `prefijo_producto_atributo_valor` char(1) NOT NULL,
  `precio_producto_atributo_valor` float(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_producto_atributo_valor`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE IF NOT EXISTS `provincias` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=30 ;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id_provincia`, `provincia`) VALUES
(1, 'Arequipa'),
(2, 'Chiclayo'),
(3, 'Lima'),
(4, 'Piura'),
(5, 'Tacna'),
(6, 'Trujillo'),
(8, 'Ayacucho'),
(9, 'Abancay'),
(10, 'Cajamarca'),
(11, 'Cuzco'),
(12, 'Chimbote'),
(13, 'Hu&aacute;nuco'),
(14, 'Huancayo'),
(15, 'Huaraz'),
(16, 'Ica'),
(17, 'Ilo'),
(18, 'Jaen'),
(19, 'Juliaca'),
(20, 'Nazca'),
(21, 'Pto Maldonado'),
(22, 'Pucallpa'),
(23, 'Tarapoto'),
(24, 'Tumbes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicidad`
--

CREATE TABLE IF NOT EXISTS `publicidad` (
  `id_publicidad` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `imagen` varchar(71) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_publicidad`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos_direcciones`
--

CREATE TABLE IF NOT EXISTS `puntos_direcciones` (
  `id_punto_distribucion` int(11) NOT NULL,
  `direccion` varchar(300) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `puntos_direcciones`
--

INSERT INTO `puntos_direcciones` (`id_punto_distribucion`, `direccion`) VALUES
(8, ''),
(6, ''),
(7, ''),
(9, 'Av. pardo y Aliaga 699 Of 501 - San Isidro'),
(10, 'Av. Benavides 495 - Miraflores'),
(10, 'Av. JosÃ© Pardo 715 - Miraflores'),
(10, 'Av. 2 de Mayo 1410 - San Isidro'),
(10, 'Av. Juan Pezet 1340 - San Isidro'),
(10, 'Av. Libertadores 596 - San Isidro'),
(10, 'Av. Encalada cdra. 5 - Surco'),
(10, 'Av. Javir Prado Oeste 999 - Magdalena'),
(11, 'Av. Santa Cruz 843 - Miraflores '),
(12, 'Av. JosÃ© Pardo 380 - Miraflores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos_distribucion`
--

CREATE TABLE IF NOT EXISTS `puntos_distribucion` (
  `id_punto_distribucion` int(11) NOT NULL AUTO_INCREMENT,
  `id_rubro` int(11) NOT NULL,
  `id_provincia` int(11) NOT NULL,
  `nombre_punto_distribucion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `url_punto_distribucion` varchar(300) COLLATE latin1_spanish_ci DEFAULT NULL,
  `imagen_punto_distribucion` varchar(71) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_punto_distribucion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `puntos_distribucion`
--

INSERT INTO `puntos_distribucion` (`id_punto_distribucion`, `id_rubro`, `id_provincia`, `nombre_punto_distribucion`, `url_punto_distribucion`, `imagen_punto_distribucion`) VALUES
(6, 1, 3, 'Blitz', 'http://www.blitzperu.com', 'blitz.jpg'),
(7, 1, 3, 'Kreox', 'http://www.kreox.com.pe', 'kreox.jpg'),
(8, 1, 3, 'Punto & Cadena', 'http://www.puntoycadena.com', 'Punto__and__Cadena.gif'),
(9, 2, 3, 'Aero Mexico', 'http://www.aeromexico.com', 'aeromexico.jpg'),
(10, 13, 3, 'Vivanda', 'http://www.vivanda.com.pe', 'Vivanda.jpg'),
(11, 2, 3, 'Peruvian Airlines', 'http://www.peruvianairlines.pe', 'peruvianairlineslogo.jpg'),
(12, 2, 3, 'Sky Airline', 'http://www.skyairline.cl', 'SKYLINELOGO.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos_telefonos`
--

CREATE TABLE IF NOT EXISTS `puntos_telefonos` (
  `id_punto_distribucion` int(11) NOT NULL,
  `telefono` varchar(20) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `puntos_telefonos`
--

INSERT INTO `puntos_telefonos` (`id_punto_distribucion`, `telefono`) VALUES
(8, '715-0390'),
(7, '472-5723'),
(6, '444-3839'),
(10, '620-3000'),
(9, '705-1111'),
(11, '716-6000'),
(12, '243-7998 ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE IF NOT EXISTS `recursos` (
  `id_recurso` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_recurso` varchar(150) NOT NULL,
  PRIMARY KEY (`id_recurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revistas`
--

CREATE TABLE IF NOT EXISTS `revistas` (
  `id_revista` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_revista` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion_revista` text COLLATE latin1_spanish_ci NOT NULL,
  `edicion_revista` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_revista` date NOT NULL,
  `portada_revista` varchar(71) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_revista`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `revistas`
--

INSERT INTO `revistas` (`id_revista`, `titulo_revista`, `descripcion_revista`, `edicion_revista`, `fecha_revista`, `portada_revista`) VALUES
(4, 'Revista 1', 'Tenemos la propiedad que Buscas', '1', '2009-10-26', 'portada_portada.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revistas_imagenes`
--

CREATE TABLE IF NOT EXISTS `revistas_imagenes` (
  `id_revista_imagen` int(11) NOT NULL AUTO_INCREMENT,
  `id_revista` int(11) NOT NULL DEFAULT '0',
  `thumb_revista_imagen` varchar(71) NOT NULL,
  `imagen_revista_imagen` varchar(71) NOT NULL,
  `orden_revista_imagen` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_revista_imagen`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=266 ;

--
-- Volcado de datos para la tabla `revistas_imagenes`
--

INSERT INTO `revistas_imagenes` (`id_revista_imagen`, `id_revista`, `thumb_revista_imagen`, `imagen_revista_imagen`, `orden_revista_imagen`) VALUES
(77, 11, '110607103859revista_1.jpg', '110607103859revista_1.jpg', 0),
(63, 11, '110528113746page-002.jpeg', '110528113746page-002.jpeg', 8),
(64, 11, '110528113810page-003.jpeg', '110528113810page-003.jpeg', 10),
(65, 11, '110528113831page-004.jpeg', '110528113831page-004.jpeg', 7),
(66, 11, '110528113847page-005.jpeg', '110528113847page-005.jpeg', 9),
(67, 11, '110528113856page-006.jpeg', '110528113856page-006.jpeg', 1),
(68, 11, '110528113903page-007.jpeg', '110528113903page-007.jpeg', 2),
(69, 11, '110528113910page-008.jpeg', '110528113910page-008.jpeg', 5),
(70, 11, '110528113919page-009.jpeg', '110528113919page-009.jpeg', 6),
(71, 11, '110528113938page-010.jpeg', '110528113938page-010.jpeg', 3),
(72, 11, '110528113956page-011.jpeg', '110528113956page-011.jpeg', 4),
(73, 11, '110528114007page-012.jpeg', '110528114007page-012.jpeg', 11),
(74, 11, '110528114126page-013.jpeg', '110528114126page-013.jpeg', 12),
(75, 11, '110528114252page-014.jpeg', '110528114252page-014.jpeg', 13),
(76, 11, '110528114337page-015.jpeg', '110528114337page-015.jpeg', 14),
(109, 5, '110609150627maqueta 13_800x1100.jpg', '110609150627maqueta 13_800x1100.jpg', 44),
(107, 5, '110609150610maqueta 1_800x1100.jpg', '110609150610maqueta 1_800x1100.jpg', 42),
(108, 5, '110609150619maqueta 12_800x1100.jpg', '110609150619maqueta 12_800x1100.jpg', 43),
(81, 10, '110607123014dscf1224.jpg', '110607123014dscf1224.jpg', 18),
(82, 10, '110607123026110_0647.jpg', '110607123026110_0647.jpg', 19),
(83, 10, '110607123039110_0550.jpg', '110607123039110_0550.jpg', 20),
(84, 10, '110607123051110_0559.jpg', '110607123051110_0559.jpg', 21),
(85, 10, '110607123108110_0505.jpg', '110607123108110_0505.jpg', 22),
(86, 10, '110607123125110_0525.jpg', '110607123125110_0525.jpg', 23),
(87, 10, '110607123139110_0680.jpg', '110607123139110_0680.jpg', 24),
(261, 4, '111209090456pag4.jpg', '111209090456pag4.jpg', 193),
(260, 4, '111209090416pag3.jpg', '111209090416pag3.jpg', 192),
(258, 4, '111209090213pag1.jpg', '111209090213pag1.jpg', 190),
(259, 4, '111209090314pag2.jpg', '111209090314pag2.jpg', 191),
(98, 10, '110609104517prueba.jpg', '110609104517prueba.jpg', 33),
(262, 4, '111209090555pag5.jpg', '111209090555pag5.jpg', 194),
(110, 5, '110609150636maqueta 14_800x1100.jpg', '110609150636maqueta 14_800x1100.jpg', 45),
(111, 5, '110609150647maqueta 15_800x1100.jpg', '110609150647maqueta 15_800x1100.jpg', 46),
(112, 5, '110609150658maqueta 16_800x1100.jpg', '110609150658maqueta 16_800x1100.jpg', 47),
(113, 5, '110609150710maqueta 17_800x1100.jpg', '110609150710maqueta 17_800x1100.jpg', 48),
(114, 5, '110609150721maqueta 18_800x1100.jpg', '110609150721maqueta 18_800x1100.jpg', 49),
(118, 5, '110609150855maqueta 110_800x1100.jpg', '110609150855maqueta 110_800x1100.jpg', 51),
(117, 5, '110609150832maqueta 19_800x1100.jpg', '110609150832maqueta 19_800x1100.jpg', 50),
(119, 5, '110609150907maqueta 111_800x1100.jpg', '110609150907maqueta 111_800x1100.jpg', 52),
(120, 5, '110609151241maqueta 112_800x1100.jpg', '110609151241maqueta 112_800x1100.jpg', 53),
(121, 6, '110609152011revista 3 _pÃ¡gina_01_800x1100.jpg', '110609152011revista 3 _pÃ¡gina_01_800x1100.jpg', 54),
(122, 6, '110609152021revista 3 _pÃ¡gina_02_800x1100.jpg', '110609152021revista 3 _pÃ¡gina_02_800x1100.jpg', 55),
(123, 6, '110609152030revista 3 _pÃ¡gina_03_800x1100.jpg', '110609152030revista 3 _pÃ¡gina_03_800x1100.jpg', 56),
(124, 6, '110609152040revista 3 _pÃ¡gina_04_800x1100.jpg', '110609152040revista 3 _pÃ¡gina_04_800x1100.jpg', 57),
(125, 6, '110609152055revista 3 _pÃ¡gina_05_800x1100.jpg', '110609152055revista 3 _pÃ¡gina_05_800x1100.jpg', 58),
(126, 6, '110609152108revista 3 _pÃ¡gina_06_800x1100.jpg', '110609152108revista 3 _pÃ¡gina_06_800x1100.jpg', 59),
(127, 6, '110609152125revista 3 _pÃ¡gina_07_800x1100.jpg', '110609152125revista 3 _pÃ¡gina_07_800x1100.jpg', 60),
(128, 6, '110609152138revista 3 _pÃ¡gina_08_800x1100.jpg', '110609152138revista 3 _pÃ¡gina_08_800x1100.jpg', 61),
(129, 6, '110609152154revista 3 _pÃ¡gina_09_800x1100.jpg', '110609152154revista 3 _pÃ¡gina_09_800x1100.jpg', 62),
(130, 6, '110609152207revista 3 _pÃ¡gina_10_800x1100.jpg', '110609152207revista 3 _pÃ¡gina_10_800x1100.jpg', 63),
(131, 6, '110609152221revista 3 _pÃ¡gina_11_800x1100.jpg', '110609152221revista 3 _pÃ¡gina_11_800x1100.jpg', 64),
(132, 6, '110609152238revista 3 _pÃ¡gina_12_800x1100.jpg', '110609152238revista 3 _pÃ¡gina_12_800x1100.jpg', 65),
(133, 6, '110609152253revista 3 _pÃ¡gina_13_800x1100.jpg', '110609152253revista 3 _pÃ¡gina_13_800x1100.jpg', 66),
(134, 6, '110609152307revista 3 _pÃ¡gina_14_800x1100.jpg', '110609152307revista 3 _pÃ¡gina_14_800x1100.jpg', 67),
(135, 6, '110609152326revista 3 _pÃ¡gina_15_800x1100.jpg', '110609152326revista 3 _pÃ¡gina_15_800x1100.jpg', 68),
(136, 6, '110609152339revista 3 _pÃ¡gina_16_800x1100.jpg', '110609152339revista 3 _pÃ¡gina_16_800x1100.jpg', 69),
(137, 7, '110609152854revista 4 ok sin marcas_pÃ¡gina_01_800x1100.jpg', '110609152854revista 4 ok sin marcas_pÃ¡gina_01_800x1100.jpg', 70),
(138, 7, '110609152902revista 4 ok sin marcas_pÃ¡gina_02_800x1100.jpg', '110609152902revista 4 ok sin marcas_pÃ¡gina_02_800x1100.jpg', 71),
(139, 7, '110609152914revista 4 ok sin marcas_pÃ¡gina_03_800x1100.jpg', '110609152914revista 4 ok sin marcas_pÃ¡gina_03_800x1100.jpg', 72),
(140, 7, '110609152926revista 4 ok sin marcas_pÃ¡gina_04_800x1100.jpg', '110609152926revista 4 ok sin marcas_pÃ¡gina_04_800x1100.jpg', 73),
(141, 7, '110609152935revista 4 ok sin marcas_pÃ¡gina_05_800x1100.jpg', '110609152935revista 4 ok sin marcas_pÃ¡gina_05_800x1100.jpg', 74),
(142, 7, '110609152945revista 4 ok sin marcas_pÃ¡gina_06_800x1100.jpg', '110609152945revista 4 ok sin marcas_pÃ¡gina_06_800x1100.jpg', 75),
(143, 7, '110609152955revista 4 ok sin marcas_pÃ¡gina_07_800x1100.jpg', '110609152955revista 4 ok sin marcas_pÃ¡gina_07_800x1100.jpg', 76),
(144, 7, '110609153012revista 4 ok sin marcas_pÃ¡gina_08_800x1100.jpg', '110609153012revista 4 ok sin marcas_pÃ¡gina_08_800x1100.jpg', 77),
(145, 7, '110609153029revista 4 ok sin marcas_pÃ¡gina_09_800x1100.jpg', '110609153029revista 4 ok sin marcas_pÃ¡gina_09_800x1100.jpg', 78),
(146, 7, '110609153041revista 4 ok sin marcas_pÃ¡gina_10_800x1100.jpg', '110609153041revista 4 ok sin marcas_pÃ¡gina_10_800x1100.jpg', 79),
(147, 7, '110609153056revista 4 ok sin marcas_pÃ¡gina_11_800x1100.jpg', '110609153056revista 4 ok sin marcas_pÃ¡gina_11_800x1100.jpg', 80),
(148, 7, '110609153122revista 4 ok sin marcas_pÃ¡gina_12_800x1100.jpg', '110609153122revista 4 ok sin marcas_pÃ¡gina_12_800x1100.jpg', 81),
(149, 7, '110609153138revista 4 ok sin marcas_pÃ¡gina_13_800x1100.jpg', '110609153138revista 4 ok sin marcas_pÃ¡gina_13_800x1100.jpg', 82),
(150, 7, '110609153155revista 4 ok sin marcas_pÃ¡gina_14_800x1100.jpg', '110609153155revista 4 ok sin marcas_pÃ¡gina_14_800x1100.jpg', 83),
(151, 7, '110609153205revista 4 ok sin marcas_pÃ¡gina_15_800x1100.jpg', '110609153205revista 4 ok sin marcas_pÃ¡gina_15_800x1100.jpg', 84),
(152, 7, '110609153220revista 4 ok sin marcas_pÃ¡gina_16_800x1100.jpg', '110609153220revista 4 ok sin marcas_pÃ¡gina_16_800x1100.jpg', 85),
(153, 7, '110609153230revista 4 ok sin marcas_pÃ¡gina_17_800x1100.jpg', '110609153230revista 4 ok sin marcas_pÃ¡gina_17_800x1100.jpg', 86),
(154, 7, '110609153242revista 4 ok sin marcas_pÃ¡gina_18_800x1100.jpg', '110609153242revista 4 ok sin marcas_pÃ¡gina_18_800x1100.jpg', 87),
(155, 7, '110609153256revista 4 ok sin marcas_pÃ¡gina_19_800x1100.jpg', '110609153256revista 4 ok sin marcas_pÃ¡gina_19_800x1100.jpg', 88),
(156, 7, '110609153307revista 4 ok sin marcas_pÃ¡gina_20_800x1100.jpg', '110609153307revista 4 ok sin marcas_pÃ¡gina_20_800x1100.jpg', 89),
(157, 8, '110609154300revista 5 ok 1_pÃ¡gina_01_800x1100.jpg', '110609154300revista 5 ok 1_pÃ¡gina_01_800x1100.jpg', 90),
(158, 8, '110609154509revista 5 ok 1_pÃ¡gina_02_800x1100.jpg', '110609154509revista 5 ok 1_pÃ¡gina_02_800x1100.jpg', 91),
(159, 8, '110609154711revista 5 ok 1_pÃ¡gina_03_800x1100.jpg', '110609154711revista 5 ok 1_pÃ¡gina_03_800x1100.jpg', 92),
(160, 8, '110609155527revista 5 ok 1_pÃ¡gina_04_800x1100.jpg', '110609155527revista 5 ok 1_pÃ¡gina_04_800x1100.jpg', 93),
(161, 8, '110609155536revista 5 ok 1_pÃ¡gina_05_800x1100.jpg', '110609155536revista 5 ok 1_pÃ¡gina_05_800x1100.jpg', 94),
(162, 8, '110609155550revista 5 ok 1_pÃ¡gina_06_800x1100.jpg', '110609155550revista 5 ok 1_pÃ¡gina_06_800x1100.jpg', 95),
(163, 8, '110609155603revista 5 ok 1_pÃ¡gina_07_800x1100.jpg', '110609155603revista 5 ok 1_pÃ¡gina_07_800x1100.jpg', 96),
(164, 8, '110609155619revista 5 ok 1_pÃ¡gina_08_800x1100.jpg', '110609155619revista 5 ok 1_pÃ¡gina_08_800x1100.jpg', 97),
(165, 8, '110609155630revista 5 ok 1_pÃ¡gina_09_800x1100.jpg', '110609155630revista 5 ok 1_pÃ¡gina_09_800x1100.jpg', 98),
(166, 8, '110609155647revista 5 ok 1_pÃ¡gina_10_800x1100.jpg', '110609155647revista 5 ok 1_pÃ¡gina_10_800x1100.jpg', 99),
(167, 8, '110609155659revista 5 ok 1_pÃ¡gina_11_800x1100.jpg', '110609155659revista 5 ok 1_pÃ¡gina_11_800x1100.jpg', 100),
(168, 8, '110609155714revista 5 ok 1_pÃ¡gina_12_800x1100.jpg', '110609155714revista 5 ok 1_pÃ¡gina_12_800x1100.jpg', 101),
(169, 8, '110609155729revista 5 ok 1_pÃ¡gina_13_800x1100.jpg', '110609155729revista 5 ok 1_pÃ¡gina_13_800x1100.jpg', 102),
(170, 8, '110609155748revista 5 ok 1_pÃ¡gina_14_800x1100.jpg', '110609155748revista 5 ok 1_pÃ¡gina_14_800x1100.jpg', 103),
(171, 8, '110609155806revista 5 ok 1_pÃ¡gina_15_800x1100.jpg', '110609155806revista 5 ok 1_pÃ¡gina_15_800x1100.jpg', 104),
(172, 8, '110609155823revista 5 ok 1_pÃ¡gina_16_800x1100.jpg', '110609155823revista 5 ok 1_pÃ¡gina_16_800x1100.jpg', 105),
(173, 8, '110609155841revista 5 ok 1_pÃ¡gina_17_800x1100.jpg', '110609155841revista 5 ok 1_pÃ¡gina_17_800x1100.jpg', 106),
(174, 8, '110609155854revista 5 ok 1_pÃ¡gina_18_800x1100.jpg', '110609155854revista 5 ok 1_pÃ¡gina_18_800x1100.jpg', 107),
(175, 8, '110609155905revista 5 ok 1_pÃ¡gina_19_800x1100.jpg', '110609155905revista 5 ok 1_pÃ¡gina_19_800x1100.jpg', 108),
(176, 8, '110609155918revista 5 ok 1_pÃ¡gina_20_800x1100.jpg', '110609155918revista 5 ok 1_pÃ¡gina_20_800x1100.jpg', 109),
(177, 8, '110609155930revista 5 ok 1_pÃ¡gina_21_800x1100.jpg', '110609155930revista 5 ok 1_pÃ¡gina_21_800x1100.jpg', 110),
(178, 8, '110609155945revista 5 ok 1_pÃ¡gina_22_800x1100.jpg', '110609155945revista 5 ok 1_pÃ¡gina_22_800x1100.jpg', 111),
(179, 8, '110609155956revista 5 ok 1_pÃ¡gina_23_800x1100.jpg', '110609155956revista 5 ok 1_pÃ¡gina_23_800x1100.jpg', 112),
(180, 8, '110609160011revista 5 ok 1_pÃ¡gina_24_800x1100.jpg', '110609160011revista 5 ok 1_pÃ¡gina_24_800x1100.jpg', 113),
(181, 12, '110609173210revista 5 ok 1_pÃ¡gina_01_800x1100.jpg', '110609173210revista 5 ok 1_pÃ¡gina_01_800x1100.jpg', 114),
(182, 12, '110609173221revista 5 ok 1_pÃ¡gina_02_800x1100.jpg', '110609173221revista 5 ok 1_pÃ¡gina_02_800x1100.jpg', 115),
(184, 12, '110609173258revista 5 ok 1_pÃ¡gina_03_800x1100.jpg', '110609173258revista 5 ok 1_pÃ¡gina_03_800x1100.jpg', 116),
(185, 12, '110609173314revista 5 ok 1_pÃ¡gina_04_800x1100.jpg', '110609173314revista 5 ok 1_pÃ¡gina_04_800x1100.jpg', 117),
(186, 12, '110609173323revista 5 ok 1_pÃ¡gina_05_800x1100.jpg', '110609173323revista 5 ok 1_pÃ¡gina_05_800x1100.jpg', 118),
(187, 12, '110609173333revista 5 ok 1_pÃ¡gina_06_800x1100.jpg', '110609173333revista 5 ok 1_pÃ¡gina_06_800x1100.jpg', 119),
(188, 12, '110609173346revista 5 ok 1_pÃ¡gina_07_800x1100.jpg', '110609173346revista 5 ok 1_pÃ¡gina_07_800x1100.jpg', 120),
(189, 12, '110609173359revista 5 ok 1_pÃ¡gina_08_800x1100.jpg', '110609173359revista 5 ok 1_pÃ¡gina_08_800x1100.jpg', 121),
(190, 12, '110609173500revista 5 ok 1_pÃ¡gina_09_800x1100.jpg', '110609173500revista 5 ok 1_pÃ¡gina_09_800x1100.jpg', 122),
(191, 12, '110609173523revista 5 ok 1_pÃ¡gina_10_800x1100.jpg', '110609173523revista 5 ok 1_pÃ¡gina_10_800x1100.jpg', 123),
(192, 12, '110609173658revista 5 ok 1_pÃ¡gina_11_800x1100.jpg', '110609173658revista 5 ok 1_pÃ¡gina_11_800x1100.jpg', 124),
(193, 12, '110609173716revista 5 ok 1_pÃ¡gina_12_800x1100.jpg', '110609173716revista 5 ok 1_pÃ¡gina_12_800x1100.jpg', 125),
(194, 12, '110609173731revista 5 ok 1_pÃ¡gina_13_800x1100.jpg', '110609173731revista 5 ok 1_pÃ¡gina_13_800x1100.jpg', 126),
(195, 12, '110609173750revista 5 ok 1_pÃ¡gina_14_800x1100.jpg', '110609173750revista 5 ok 1_pÃ¡gina_14_800x1100.jpg', 127),
(196, 12, '110609173804revista 5 ok 1_pÃ¡gina_15_800x1100.jpg', '110609173804revista 5 ok 1_pÃ¡gina_15_800x1100.jpg', 128),
(197, 12, '110609173818revista 5 ok 1_pÃ¡gina_16_800x1100.jpg', '110609173818revista 5 ok 1_pÃ¡gina_16_800x1100.jpg', 129),
(198, 12, '110609173851revista 5 ok 1_pÃ¡gina_17_800x1100.jpg', '110609173851revista 5 ok 1_pÃ¡gina_17_800x1100.jpg', 130),
(199, 12, '110609173946revista 5 ok 1_pÃ¡gina_18_800x1100.jpg', '110609173946revista 5 ok 1_pÃ¡gina_18_800x1100.jpg', 131),
(200, 12, '110609174007revista 5 ok 1_pÃ¡gina_19_800x1100.jpg', '110609174007revista 5 ok 1_pÃ¡gina_19_800x1100.jpg', 132),
(201, 12, '110609174018revista 5 ok 1_pÃ¡gina_20_800x1100.jpg', '110609174018revista 5 ok 1_pÃ¡gina_20_800x1100.jpg', 133),
(202, 12, '110609174034revista 5 ok 1_pÃ¡gina_21_800x1100.jpg', '110609174034revista 5 ok 1_pÃ¡gina_21_800x1100.jpg', 134),
(203, 12, '110609174045revista 5 ok 1_pÃ¡gina_22_800x1100.jpg', '110609174045revista 5 ok 1_pÃ¡gina_22_800x1100.jpg', 135),
(204, 12, '110609174054revista 5 ok 1_pÃ¡gina_23_800x1100.jpg', '110609174054revista 5 ok 1_pÃ¡gina_23_800x1100.jpg', 136),
(205, 12, '110609174106revista 5 ok 1_pÃ¡gina_24_800x1100.jpg', '110609174106revista 5 ok 1_pÃ¡gina_24_800x1100.jpg', 137),
(206, 13, '110610110526revista 6 _800x1100.jpg', '110610110526revista 6 _800x1100.jpg', 138),
(207, 13, '110610110536revista 6 2_800x1100.jpg', '110610110536revista 6 2_800x1100.jpg', 139),
(208, 13, '110610110548revista 6 3_800x1100.jpg', '110610110548revista 6 3_800x1100.jpg', 140),
(209, 13, '110610110601revista 6 4_800x1100.jpg', '110610110601revista 6 4_800x1100.jpg', 141),
(210, 13, '110610110614revista 6 5_800x1100.jpg', '110610110614revista 6 5_800x1100.jpg', 142),
(211, 13, '110610110624revista 6 6_800x1100.jpg', '110610110624revista 6 6_800x1100.jpg', 143),
(212, 13, '110610110638revista 6 7_800x1100.jpg', '110610110638revista 6 7_800x1100.jpg', 144),
(213, 13, '110610110648revista 6 8_800x1100.jpg', '110610110648revista 6 8_800x1100.jpg', 145),
(214, 13, '110610110701revista 6 9_800x1100.jpg', '110610110701revista 6 9_800x1100.jpg', 146),
(215, 13, '110610110714revista 6 10_800x1100.jpg', '110610110714revista 6 10_800x1100.jpg', 147),
(216, 13, '110610110727revista 6 11_800x1100.jpg', '110610110727revista 6 11_800x1100.jpg', 148),
(217, 13, '110610110813revista 6 12_800x1100.jpg', '110610110813revista 6 12_800x1100.jpg', 149),
(218, 13, '110610110828revista 6 13_800x1100.jpg', '110610110828revista 6 13_800x1100.jpg', 150),
(219, 13, '110610110848revista 6 14_800x1100.jpg', '110610110848revista 6 14_800x1100.jpg', 151),
(220, 13, '110610110859revista 6 15_800x1100.jpg', '110610110859revista 6 15_800x1100.jpg', 152),
(221, 13, '110610110912revista 6 16_800x1100.jpg', '110610110912revista 6 16_800x1100.jpg', 153),
(222, 13, '110610110926revista 6 17_800x1100.jpg', '110610110926revista 6 17_800x1100.jpg', 154),
(223, 13, '110610110936revista 6 18_800x1100.jpg', '110610110936revista 6 18_800x1100.jpg', 155),
(224, 13, '110610110946revista 6 19_800x1100.jpg', '110610110946revista 6 19_800x1100.jpg', 156),
(225, 13, '110610110956revista 6 20_800x1100.jpg', '110610110956revista 6 20_800x1100.jpg', 157),
(226, 13, '110610111006revista 6 21_800x1100.jpg', '110610111006revista 6 21_800x1100.jpg', 158),
(227, 13, '110610111017revista 6 22_800x1100.jpg', '110610111017revista 6 22_800x1100.jpg', 159),
(228, 13, '110610111032revista 6 23_800x1100.jpg', '110610111032revista 6 23_800x1100.jpg', 160),
(229, 13, '110610111045revista 6 24_800x1100.jpg', '110610111045revista 6 24_800x1100.jpg', 161),
(230, 14, '110610114634revista 7_800x1100.jpg', '110610114634revista 7_800x1100.jpg', 162),
(231, 14, '110610114648revista 72_800x1100.jpg', '110610114648revista 72_800x1100.jpg', 163),
(232, 14, '110610114659revista 73_800x1100.jpg', '110610114659revista 73_800x1100.jpg', 164),
(233, 14, '110610114709revista 74_800x1100.jpg', '110610114709revista 74_800x1100.jpg', 165),
(234, 14, '110610114727revista 75_800x1100.jpg', '110610114727revista 75_800x1100.jpg', 166),
(235, 14, '110610114749revista 76_800x1100.jpg', '110610114749revista 76_800x1100.jpg', 167),
(236, 14, '110610114809revista 77_800x1100.jpg', '110610114809revista 77_800x1100.jpg', 168),
(237, 14, '110610114834revista 78_800x1100.jpg', '110610114834revista 78_800x1100.jpg', 169),
(238, 14, '110610114851revista 79_800x1100.jpg', '110610114851revista 79_800x1100.jpg', 170),
(239, 14, '110610114911revista 710_800x1100.jpg', '110610114911revista 710_800x1100.jpg', 171),
(240, 14, '110610114929revista 711_800x1100.jpg', '110610114929revista 711_800x1100.jpg', 172),
(241, 14, '110610114944revista 712_800x1100.jpg', '110610114944revista 712_800x1100.jpg', 173),
(242, 14, '110610115004revista 713_800x1100.jpg', '110610115004revista 713_800x1100.jpg', 174),
(243, 14, '110610115026revista 714_800x1100.jpg', '110610115026revista 714_800x1100.jpg', 175),
(244, 14, '110610115043revista 715_800x1100.jpg', '110610115043revista 715_800x1100.jpg', 176),
(245, 14, '110610115100revista 716_800x1100.jpg', '110610115100revista 716_800x1100.jpg', 177),
(246, 14, '110610115412revista 717_800x1100.jpg', '110610115412revista 717_800x1100.jpg', 178),
(247, 14, '110610115426revista 718_800x1100.jpg', '110610115426revista 718_800x1100.jpg', 179),
(248, 14, '110610115440revista 719_800x1100.jpg', '110610115440revista 719_800x1100.jpg', 180),
(249, 14, '110610115455revista 720_800x1100.jpg', '110610115455revista 720_800x1100.jpg', 181),
(250, 14, '110610115512revista 721_800x1100.jpg', '110610115512revista 721_800x1100.jpg', 182),
(251, 14, '110610115524revista 722_800x1100.jpg', '110610115524revista 722_800x1100.jpg', 183),
(252, 14, '110610115535revista 723_800x1100.jpg', '110610115535revista 723_800x1100.jpg', 184),
(253, 14, '110610115546revista 724_800x1100.jpg', '110610115546revista 724_800x1100.jpg', 185),
(254, 14, '110610115559revista 725_800x1100.jpg', '110610115559revista 725_800x1100.jpg', 186),
(255, 14, '110610115610revista 726_800x1100.jpg', '110610115610revista 726_800x1100.jpg', 187),
(256, 14, '110610115645revista 727_800x1100.jpg', '110610115645revista 727_800x1100.jpg', 188),
(257, 14, '110610115659revista 728_800x1100.jpg', '110610115659revista 728_800x1100.jpg', 189),
(263, 4, '111209090649pag6.jpg', '111209090649pag6.jpg', 195),
(264, 4, '111209090720pag8.jpg', '111209090720pag8.jpg', 196),
(265, 4, '111209090828pag8.jpg', '111209090828pag8.jpg', 197);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(8, 'Super Administrador'),
(9, 'Invitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_recursos`
--

CREATE TABLE IF NOT EXISTS `roles_recursos` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `id_rol` tinyint(3) unsigned NOT NULL,
  `id_recurso` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

CREATE TABLE IF NOT EXISTS `rubros` (
  `id_rubro` int(11) NOT NULL AUTO_INCREMENT,
  `rubro` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_rubro`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `rubros`
--

INSERT INTO `rubros` (`id_rubro`, `rubro`) VALUES
(1, 'Agencia Publicidad'),
(2, 'Aerolineas'),
(13, 'Supermercados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE IF NOT EXISTS `secciones` (
  `id_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_modulo` int(11) NOT NULL,
  `nombre_seccion` varchar(50) NOT NULL,
  `url_seccion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_seccion`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id_seccion`, `id_modulo`, `nombre_seccion`, `url_seccion`) VALUES
(1, 1, 'Inicio', 'index.php'),
(2, 1, 'Configuracion del sitio', 'configuracion.php'),
(3, 1, 'Administracion de usuarios', 'usuarios.php'),
(4, 2, 'Ya es Hora de...', 'productos.php?cat=0'),
(51, 2, 'Banners', 'banners.php'),
(40, 2, 'Clientes', 'clientes.php'),
(45, 4, 'Newsletter', 'boletines.php'),
(56, 2, 'Archivos de Presentaci&oacute;n', 'archivos.php'),
(53, 2, 'Revistas', 'revista.php'),
(46, 5, 'Reporte de Pedidos', 'rpedidos.php'),
(44, 3, 'Pedidos', 'pedidos.php'),
(55, 2, 'Anuncios', 'publicidad.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE IF NOT EXISTS `tarifas` (
  `id_tarifa` int(11) NOT NULL AUTO_INCREMENT,
  `formato` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `medida` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `precio` float(10,2) NOT NULL,
  `id_tipo` char(3) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tarifa`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `tarifas`
--

INSERT INTO `tarifas` (`id_tarifa`, `formato`, `medida`, `precio`, `id_tipo`) VALUES
(1, '01 P&aacute;gina interior', '28 x 20.5', 2500.00, 'NAC'),
(5, '1/2 pÃ¡gina horizontal', '11.5 x 16.5', 1400.00, 'NAC'),
(3, 'Retira contracarÃ¡tula', '28 x 20.5', 3400.00, 'NAC'),
(4, 'Retira carÃ¡tula', '28 x 20.5', 2900.00, 'NAC'),
(6, '1/2 pÃ¡gina vertical', '23.0 x 8.0', 1400.00, 'NAC'),
(7, '1/3 pÃ¡gina horizontal', '7.3 x 16.5', 1200.00, 'NAC'),
(8, 'Retira carÃ¡tula', '28 x 20.5', 1250.00, 'INT'),
(9, 'Retira contracarÃ¡tula', '28 x 20.5', 1450.00, 'INT'),
(10, '1 PÃ¡gina interior ', '28 x 20.5', 1050.00, 'INT'),
(11, '1/2 PÃ¡gina horizontal', '11.5 x 16.5', 600.00, 'INT'),
(12, '1/2 PÃ¡gina vertical', '23.0 x 8.0', 600.00, 'INT'),
(13, 'Publireportaje 1 pÃ¡gina ', '28 x 20.5', 1350.00, 'INT'),
(14, 'Publireportaje 2 pÃ¡ginas', '28 x 41', 1900.00, 'INT'),
(15, '1/4 PÃ¡gina horizontal', '5.12 x 16.5', 950.00, 'NAC'),
(16, '1/4 PÃ¡gina vertical', '11.2 x 8.0', 950.00, 'NAC'),
(17, 'Publireportaje 1 pÃ¡gina ', '28 x 20.5', 3200.00, 'NAC'),
(18, 'Publireportaje 2 pÃ¡ginas', '28 x 41', 4500.00, 'NAC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE IF NOT EXISTS `tipos` (
  `id_tipo` char(3) COLLATE latin1_spanish_ci NOT NULL,
  `tipo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id_tipo`, `tipo`) VALUES
('NAC', 'nacional'),
('INT', 'internacional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL DEFAULT '0',
  `nombre_usuario` varchar(50) NOT NULL DEFAULT '',
  `apellidos_usuario` varchar(50) NOT NULL DEFAULT '',
  `email_usuario` varchar(50) NOT NULL DEFAULT '',
  `login_usuario` varchar(20) NOT NULL DEFAULT '',
  `password_usuario` varchar(100) NOT NULL DEFAULT '',
  `fecha_ingreso_usuario` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `nombre_usuario`, `apellidos_usuario`, `email_usuario`, `login_usuario`, `password_usuario`, `fecha_ingreso_usuario`) VALUES
(1, 1, 'Oscar Javier', 'Rodriguez Villanueva', 'orodriguez@racsocode.com', 'admin', '$2y$14$7PTPp9u0BAqV0587MtV17OmT4hmrANScp8Xpw6nnRsCsH0sLuiOpW', '2009-02-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_secciones`
--

CREATE TABLE IF NOT EXISTS `usuarios_secciones` (
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `id_seccion` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_secciones`
--

INSERT INTO `usuarios_secciones` (`id_usuario`, `id_seccion`) VALUES
(1, 45),
(1, 40),
(1, 55),
(1, 46),
(1, 52),
(1, 53),
(1, 56),
(1, 44),
(1, 51),
(1, 4),
(1, 3),
(1, 2),
(1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
