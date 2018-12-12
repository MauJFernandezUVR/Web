SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_muro` int(11) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `path_comentario` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_imagen` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


INSERT INTO `comentario` (`id`, `id_usuario`, `id_muro`, `descripcion`, `path_comentario`, `id_imagen`, `fecha`) VALUES
(1, 4, 1, 'Hola soy una descripcion de la bd', NULL, 1, '0000-00-00'),
(2, 4, 1, 'Hola soy otra descripcion de la bd', NULL, 1, '0000-00-00');


CREATE TABLE `imagen` (
  `id` int(11) NOT NULL,
  `id_publicacion` int(11) NOT NULL,
  `id_muro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `path` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `url` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


INSERT INTO `imagen` (`id`, `id_publicacion`, `id_muro`, `id_usuario`, `path`, `url`, `fecha`) VALUES
(1, 1, 0, 4, NULL, 'https://img.thedailybeast.com/image/upload/c_crop,d_placeholder_euli9k,h_1440,w_2560,x_0,y_0/dpr_2.0/c_limit,w_740/fl_lossy,q_auto/v1531451526/180712-Weill--The-Creator-of-Pepe-hero_uionjj ', '0000-00-00'),
(3, 3, 0, 4, NULL, 'https://i.dailymail.co.uk/i/pix/2017/12/12/21/4743A9B900000578-5172733-image-m-33_1513115818035.jpg ', '0000-00-00'),
(4, 2, 1, 4, NULL, 'http://www.crear-meme.com/public/img/memes_users/meme-english.jpg ', '0000-00-00'),
(5, 0, 0, 4, NULL, 'https://3.bp.blogspot.com/-zPA5onT8vDc/V7TrSEEsalI/AAAAAAAAATk/YY10-F9zjSEAX3qBreJ2o5xFEUU7F1suACLcB/s1600/661b3b2305aada261970d695fffbdce4.jpg', '0000-00-00');

CREATE TABLE `muro` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_publicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `muro` (`id`, `id_usuario`, `id_publicacion`) VALUES
(1, 4, 1),
(2, 4, 2);

CREATE TABLE `publicacion` (
  `id` int(11) NOT NULL,
  `id_muro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_imagen` int(11) NOT NULL,
  `id_comentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


INSERT INTO `publicacion` (`id`, `id_muro`, `id_usuario`, `id_imagen`, `id_comentario`) VALUES
(1, 1, 4, 2, 1),
(2, 1, 4, 1, 1);

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


INSERT INTO `rol` (`id`, `rol`) VALUES
(1, 'admin'),
(2, 'user');

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `mail` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `contrasenia` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `usuario` (`id`, `nombre`, `mail`, `contrasenia`, `id_rol`) VALUES
(1, 'luciana', 'luciana@luciana', '123', 1),
(4, 'pepe', 'pepe@pepe.com', '123', 2),
(6, 'jhon', 'jhon@jhon', '123', 2);

ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_imagen` (`id_imagen`);

ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

ALTER TABLE `muro`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol` (`id_rol`);

ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `imagen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE `muro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `publicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_imagen`) REFERENCES `imagen` (`id`);

ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

ALTER TABLE `usuario`
  ADD CONSTRAINT `rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
