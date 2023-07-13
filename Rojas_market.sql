-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: base_actualizada
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `dni_cliente` int NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `correo_cliente` varchar(255) NOT NULL,
  `telefono_cliente` varchar(9) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `dni_cliente_UNIQUE` (`dni_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,21494880,'Fany Ascama Hostia','fany.ascama.hostia@gmail.com','971258575'),(4,72198457,'OSMAR PASCUAL ANTONIO HUAMAN  ','osmar@gmail.com','123123213'),(19,75743203,'Cesar Andia Ascama','zarek2807@gmail.com','955632773');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventa` (
  `id_dventa` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_producto` float NOT NULL,
  `sub_total` float NOT NULL,
  `igv` float NOT NULL,
  `total_venta` float NOT NULL,
  PRIMARY KEY (`id_dventa`),
  KEY `id_producto_idx` (`id_producto`),
  KEY `id_Venta_idx` (`id_venta`),
  CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `id_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (8,75,28,3,7,21,3.78,24.78),(9,75,29,2,2.9,5.8,1.04,6.84),(11,76,28,3,7,21,3.78,24.78),(12,76,29,2,2.9,5.8,1.04,6.84);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `cargo` varchar(255) DEFAULT NULL,
  `fulldate_empleado` varchar(255) NOT NULL,
  `edad_empleado` int NOT NULL,
  `correo_empleado` varchar(255) NOT NULL,
  `contrasena_empleado` varchar(255) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (120,'Administrador','Cesar Anthony Andia Ascama',21,'zarek2807@gmail.com','2a78085eb0f5bbe9ba8a623c49c3be49e1a8620607f5e0cc607be389ca9461a1','2023-07-05');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `descripcion_producto` varchar(255) DEFAULT NULL,
  `cantidad_producto` int NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `precio_ingreso_producto` float NOT NULL,
  `precio_salida_producto` float NOT NULL,
  `stock_minimo_producto` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_prov_idx` (`id_proveedor`),
  KEY `cantidad_producto_idx` (`cantidad_producto`),
  KEY `cantidad_product__idx` (`cantidad_producto`),
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (26,1,'Nescafe','Café soluble',1970,'2023-09-21',3.6,4.3,14),(27,1,'KitKat','Chocolates con barquillo',1260,'2023-08-14',7.2,8.6,12),(28,1,'Maggi','Sopa instantanea de pollo',1593,'2023-11-05',5.8,7,13),(29,1,'Nestea','Bebida instantanea de té',1761,'2023-07-28',2.4,2.9,11),(30,1,'Fitness','Cereal integral',1576,'2023-09-11',9.7,11.6,8),(31,2,'Dove','Jabon de baño',1384,'2023-12-09',1.6,1.9,10),(32,2,'Axe','Desodorante masculino',1124,'2023-10-01',8.5,10.2,9),(33,2,'Signal','Pasta dental',1432,'2023-08-30',6.1,7.3,13),(34,2,'Hellmann´s','Mayonesa',1327,'2023-12-19',4.7,5.6,15),(35,2,'Lipton','Té helado',1309,'2023-09-27',10.5,12.6,9),(36,3,'Ariel','detergente liquido para ropa',1832,'2023-07-09',1.2,1.4,14),(37,3,'Pantene','Shampoo y acondicionador para cabello',1203,'2023-11-18',11.4,13.7,8),(38,3,'Mr.Proper','limpiador multiusos',1467,'2023-08-26',2.8,3.4,11),(39,3,'Gillette','maquinillas de afeitar',1995,'2023-10-16',7.9,9.5,12),(40,3,'Head & Shoulder','shampoo anticaspa',1190,'2023-09-13',5.4,6.5,8),(41,4,'Coca-cola','bebida gaseosa',1769,'2023-11-22',3.2,3.8,15),(42,4,'Sprite','bebida gaseosa de lima-limon',1421,'2023-08-05',9.6,11.5,9),(43,4,'Fanta','bebida gaseosa de sabores',1745,'2023-10-07',1.9,2.3,14),(44,4,'Powerade','bebida gaseosa para deportistas',1186,'2023-12-01',8.8,10.6,13),(45,4,'Schweppes','agua tonica',1734,'2023-09-18',6.3,7.6,10),(46,5,'Lay\' s','papas fritas',1938,'2023-07-19',4.5,5.4,8),(47,5,'Gatorade','bebida deportiva',1335,'2023-11-14',10.9,13.1,15),(48,5,'Tropicana','jugo de naranja',1621,'2023-10-28',1.7,2,14),(49,5,'Sabritas','botanas saldas',1357,'2023-12-25',11.2,13.4,12),(50,5,'Ruffles','papas fritas onduladas',1550,'2023-08-07',2.2,2.6,10),(51,6,'Zucaritas','cereal de maiz dulce',1167,'2023-09-30',1.2,1.4,9),(52,6,'Special K','cereal de hojuelas de trigo y arroz',1448,'2023-07-12',4.4,5.3,11),(53,6,'Pringles','papas fritas en forma de disco',1914,'2023-11-10',8.2,9.8,8),(54,6,'All-Bran','cereal de salvado de trigo',1297,'2023-10-21',7.4,8.9,13),(55,6,'Corn Flakes','cereal de hojuelas de maiz',1837,'2023-08-17',6.8,8.2,14),(56,7,'Johnson´s Baby','productos de cuidado para bebes',1619,'2023-12-06',3.1,3.7,15),(57,7,'Neutrogena','productos de cuidado facial y corporal',1123,'2023-09-04',2.7,3.2,9),(58,7,'Listerine','enjuague bucal con sabor a menta',1933,'2023-11-26',9.4,11.3,10),(59,7,'Clean & Clear','limpiador facial para piel sensible',1565,'2023-07-24',1.3,1.6,12),(60,7,'Aveeno','locion hidratante para el cuerpo',1583,'2023-10-03',11.1,13.3,8),(61,8,'M&M´S','dulces de chocolate cubiertos de colores',1782,'2023-12-15',5.1,6.1,11),(62,8,'Snickers','barra de chocolate con caramelo y mani',1247,'2023-08-22',6.5,7.8,14),(63,8,'Twix','barra de galleta, caramelo y chocolate',1215,'2023-09-23',4.9,5.9,15),(64,8,'Skittles','dulces de colores en forma de pastillas',1521,'2023-07-06',8.6,10.3,9),(65,8,'Milky Way','barra de chocolate y caramelo',1556,'2023-11-02',2.6,3.1,13),(66,9,'Scott','Papel Higienico ',1414,'2023-10-13',3.9,4.7,8),(67,9,'Kleenex','Pañuelos faciales',1709,'2023-12-11',10.3,12.4,10),(68,9,'Huggies','pañales para bebes',1391,'2023-08-09',7.7,9.2,12),(69,9,'Cottonelle','Papel Higienico humedo',1569,'2023-09-16',1.4,1.7,14),(70,9,'Kotex','Productos de higiene femenina ',1601,'2023-07-15',9.9,11.9,15),(71,10,'Yogurt Natural','Yogurt natural cremoso y sin aditivos.',1512,'2024-11-05',5.7,6.8,9),(72,10,'Yogurt de Frutas','Yogurt con trozos de frutas frescas y sabores variados.',1355,'2027-04-02',6.9,8.3,11),(73,10,'Yogurt Griego','Yogurt estilo griego, espeso y cremoso.',1587,'2030-09-22',8.3,10,13),(74,10,'Postre de Yogurt','Postre lácteo a base de yogurt, disponible en diferentes sabores.',1967,'2026-07-12',2.3,2.8,8),(75,10,'Leche Entera','Leche entera fresca y nutritiva.',1169,'2024-12-17',4.6,5.5,10),(76,11,'Galletas de Chocolate','Galletas crujientes con chips de chocolate.',1718,'2027-09-15',3.6,4.3,14),(77,11,'Barritas de Cereal','Barritas energéticas de cereal con frutas y frutos secos.',1973,'2029-05-31',7.2,8.6,12),(78,11,'Galletas Saladas','Galletas saladas ideales para picar o acompañar.',1265,'2028-03-19',5.8,7,13),(79,11,'Galletas de Avena','Galletas saludables de avena con pasas y semillas.',1605,'2025-08-27',2.4,2.9,11),(80,11,'Galletas de Vainilla','Galletas de vainilla crujientes y deliciosas.',1767,'2026-06-02',9.7,11.6,8),(81,12,'Salsa de Tomate','Salsa de tomate casera y sabrosa.',1576,'2029-03-27',1.6,1.9,10),(82,12,'Mayonesa','Mayonesa cremosa y suave.',1384,'2025-05-09',8.5,10.2,9),(83,12,'Ketchup','Ketchup clásico para acompañar tus comidas.',1124,'2027-07-23',6.1,7.3,13),(84,12,'Mostaza','Mostaza con un toque de picante.',1432,'2028-12-01',4.7,5.6,15),(85,12,'Salsa Barbacoa','Salsa barbacoa ahumada y deliciosa.',1327,'2026-10-18',10.5,12.6,9),(86,13,'Pasta Dental','Pasta dental con fluoruro para una limpieza profunda.',1309,'2025-04-11',1.2,1.4,14),(87,13,'Enjuague Bucal','Enjuague bucal refrescante y sin alcohol.',1832,'2029-01-15',11.4,13.7,8),(88,13,'Cepillo de Dientes','Cepillo de dientes con cerdas suaves y mango ergonómico.',1203,'2027-02-07',2.8,3.4,11),(89,13,'Hilo Dental','Hilo dental resistente y fácil de usar.',1467,'2028-08-11',7.9,9.5,12),(90,13,'Enjuague Bucal Niños','Enjuague bucal especialmente formulado para niños.',1995,'2024-10-03',5.4,6.5,8),(91,14,'Pimienta Negra','Pimienta negra molida de alta calidad.',1190,'2025-12-25',3.2,3.8,15),(92,14,'Sal de Mar','Sal de mar natural y sin aditivos.',1769,'2026-03-04',9.6,11.5,9),(93,14,'Orégano','Orégano seco y aromático para condimentar tus platos.',1421,'2028-11-28',1.9,2.3,14),(94,14,'Curry','Mezcla de especias curry para dar sabor a tus preparaciones.',1745,'2024-09-09',8.8,10.6,13),(95,14,'Canela','Canela molida de excelente calidad.',1186,'2027-06-08',6.3,7.6,10),(96,15,'Fideos','Fideos de trigo durum ideales para tus recetas de pasta.',1734,'2029-11-30',4.5,5.4,8),(97,15,'Salsa de Tomate','Salsa de tomate casera para acompañar tus platos de pasta.',1938,'2026-05-06',10.9,13.1,15),(98,15,'Salsa Pesto','Salsa pesto tradicional con albahaca fresca y piñones.',1335,'2025-03-14',1.7,2,14),(99,15,'Salsa Bolognesa','Salsa bolognesa casera y sabrosa.',1621,'2024-07-31',11.2,13.4,12),(100,15,'Spaghetti','Spaghetti de trigo durum, pasta de alta calidad.',1357,'2027-01-19',2.2,2.6,10),(101,16,'Chocolate Negro','Tableta de chocolate negro intenso y sabroso.',1550,'2029-08-12',1.3,1.6,9),(102,16,'Chocolate con Leche','Tableta de chocolate con leche suave y cremoso.',1167,'2026-01-22',4.4,5.3,11),(103,16,'Bombones de Avellana','Bombones de avellana cubiertos de chocolate.',1448,'2028-09-04',8.2,9.8,8),(104,16,'Chocolate Blanco','Tableta de chocolate blanco cremoso y dulce.',1914,'2025-06-27',7.4,8.9,13),(105,16,'Chocolate Amargo','Tableta de chocolate amargo para los amantes del sabor intenso.',1297,'2027-10-01',6.8,8.2,14),(106,17,'Cereal de Avena','Cereal de avena integral para un desayuno saludable.',1837,'2024-08-20',3.1,3.7,15),(107,17,'Cereal de Trigo','Cereal de trigo crujiente y nutritivo.',1619,'2029-05-01',2.7,3.2,9),(108,17,'Barra de Granola','Barra de granola con frutos secos y semillas.',1123,'2026-04-09',9.4,11.3,10),(109,17,'Cereal de Maíz','Cereal de maíz con sabor dulce y crujiente.',1933,'2028-12-21',1.3,1.6,12),(110,17,'Cereal de Arroz','Cereal de arroz inflado y ligero.',1565,'2025-10-29',11.1,13.3,8),(111,18,'Limpiador Multiusos','Limpiador multiusos para el hogar, elimina la suciedad.',1583,'2024-06-12',5.1,6.1,11),(112,18,'Detergente para Ropa','Detergente líquido para lavado de ropa, deja las prendas impecables.',1782,'2027-03-06',6.5,7.8,14),(113,18,'Limpia Vidrios','Limpia vidrios que brinda un acabado brillante.',1247,'2029-07-22',4.9,5.9,15),(114,18,'Desinfectante','Desinfectante en aerosol para una limpieza profunda.',1215,'2026-02-09',8.6,10.3,9),(115,18,'Limpiador de Baños','Limpiador de baños que elimina manchas y bacterias.',1521,'2028-10-15',2.6,3.1,13),(116,19,'Conservas de Maíz','Deliciosas conservas de maíz tierno y sabroso.',1556,'2024-11-26',3.9,4.7,8),(117,19,'Conservas de Espárragos','Conservas de espárragos frescos y tiernos.',1414,'2025-02-12',10.3,12.4,10),(118,19,'Conservas de Guisantes','Conservas de guisantes verdes, ideales para ensaladas y platos.',1709,'2027-08-26',7.7,9.2,12),(119,19,'Conservas de Zanahorias','Conservas de zanahorias crujientes y llenas de sabor.',1391,'2029-04-02',1.4,1.7,14),(120,19,'Conservas de Alcachofas','Conservas de alcachofas tiernas y sabrosas.',1569,'2026-01-07',9.9,11.9,15),(121,20,'Leche de Coco','Leche de coco cremosa y sin aditivos.',1601,'2025-12-03',5.7,6.8,9),(122,20,'Aceite de Oliva','Aceite de oliva virgen extra de alta calidad.',1512,'2027-08-18',6.9,8.3,11),(123,20,'Vinagre Balsámico','Vinagre balsámico de Modena, añade sabor a tus platos.',1355,'2024-09-11',8.3,10,13),(124,20,'Salsa de Soja','Salsa de soja tradicional, ideal para marinados y aderezos.',1587,'2026-07-31',2.3,2.8,8),(125,20,'Miel de Abeja','Miel de abeja pura, endulza tus comidas de forma natural.',1967,'2029-06-24',4.6,5.5,10),(126,21,'Queso Cheddar','Queso Cheddar ahumado de sabor intenso y textura suave.',1169,'2028-04-09',3.6,4.3,14),(127,21,'Queso Gouda','Queso Gouda semicurado con un delicado aroma y sabor suave.',1718,'2025-03-01',7.2,8.6,12),(128,21,'Queso Parmesano','Queso Parmesano de origen italiano, con un sabor intenso y notas de nuez.',1973,'2027-12-22',5.8,7,13),(129,21,'Queso Azul','Queso Azul cremoso y con un característico sabor fuerte y picante.',1265,'2024-08-02',2.4,2.9,11),(130,21,'Queso Brie','Queso Brie de corteza blanca y pasta suave y cremosa.',1605,'2026-11-17',9.7,11.6,8),(131,22,'Pan Integral','Pan Integral hecho con harina de trigo integral, rico en fibra.',1767,'2029-01-03',1.6,1.9,10),(132,22,'Pan de Centeno','Pan de Centeno con un sabor ligeramente ácido y una textura densa.',1576,'2028-03-28',8.5,10.2,9),(133,22,'Pan de Molde','Pan de Molde suave y esponjoso, perfecto para hacer sándwiches.',1384,'2025-09-07',6.1,7.3,13),(134,22,'Pan Multicereal','Pan Multicereal con una mezcla de granos y semillas para un sabor único.',1124,'2027-04-15',4.7,5.6,15),(135,22,'Pan de Maíz','Pan de Ajo con un delicioso sabor a ajo y mantequilla.',1432,'2024-11-20',10.5,12.6,9),(136,23,'Aceitunas Verdes','Mermelada de Fresa con trozos de fresa y un sabor dulce y afrutado.',1327,'2026-09-25',1.2,1.4,14),(137,23,'Aceitunas Negras','Mermelada de Durazno con trozos de durazno y un sabor dulce y refrescante.',1309,'2029-07-13',11.4,13.7,8),(138,23,'Aceitunas Rellenas','Mermelada de Frambuesa con trozos de frambuesa y un sabor dulce y ácido.',1832,'2028-05-10',2.8,3.4,11),(139,23,'Aceitunas Kalamata','Mermelada de Naranja con trozos de naranja y un sabor cítrico y refrescante.',1203,'2025-06-02',7.9,9.5,12),(140,23,'Aceitunas Manzanilla','Mermelada de Arándanos con trozos de arándanos y un sabor agridulce.',1467,'2027-01-12',5.4,6.5,8),(141,24,'Mermelada de Fresa','Salsa de Tomate casera y sabrosa, ideal para pastas y pizzas.',1995,'2024-10-19',3.2,3.8,15),(142,24,'Mermelada de Durazno','Salsa BBQ ahumada y ligeramente dulce, perfecta para carnes a la parrilla.',1190,'2026-06-20',9.6,11.5,9),(143,24,'Mermelada de Mora','Salsa de Soja tradicional, ideal para marinados y aderezos.',1769,'2029-03-10',1.9,2.3,14),(144,24,'Mermelada de Frambuesa','Salsa de Curry con una mezcla de especias exóticas para platos con sabor.',1421,'2028-02-02',8.8,10.6,13),(145,24,'Mermelada de Arándanos','Salsa de Mostaza con un toque de picante, ideal para acompañar carnes.',1745,'2025-08-13',6.3,7.6,10),(146,25,'Café en Grano','Aceite de Oliva virgen extra de alta calidad, ideal para aderezos y cocinar.',1186,'2027-06-04',4.5,5.4,8),(147,25,'Café Molido','Aceite de Coco prensado en frío, con un aroma y sabor tropical.',1734,'2024-07-16',10.9,13.1,15),(148,25,'Café Descafeinado','Aceite de Girasol ligero y versátil, perfecto para freír y cocinar.',1938,'2026-03-09',1.7,2,14),(149,25,'Café Instantáneo','Aceite de Sésamo tostado, con un sabor único y aromático.',1335,'2029-05-20',11.2,13.4,12),(150,25,'Café Orgánico','Aceite de Trufa con un intenso sabor a trufa, ideal para realzar platos',1621,'2028-09-01',2.2,2.6,10),(151,26,'Salsa de Chimichurri','Salsa de Chimichurri casera y sabrosa, ideal para acompañar carnes asadas.',1357,'2025-04-21',1.7,2,9),(152,26,'Aceitunas Verdes Rellenas','Aceitunas Verdes Rellenas de anchoas, un clásico aperitivo mediterráneo.',1550,'2027-10-04',4.4,5.3,11),(153,26,'Aceitunas Negras Deshuesadas','Aceitunas Negras Deshuesadas de alta calidad, perfectas para ensaladas y platos gourmet.',1167,'2024-08-30',8.2,9.8,8),(154,26,'Paté de Hígado de Pollo','Paté de Hígado de Pollo suave y cremoso, ideal para untar en tostadas o crackers.',1448,'2026-05-13',7.4,8.9,13),(155,26,'Paté de Champiñones','Paté de Champiñones vegetariano, con un sabor delicioso y textura cremosa.',1914,'2029-01-28',6.8,8.2,14),(156,27,'Salsa de Menta','Salsa de Menta refrescante y versátil, ideal para platos de cordero o ensaladas.',1297,'2028-04-22',3.1,3.7,15),(157,27,'Salsa Tártara','Salsa Tártara clásica, perfecta para acompañar pescados y mariscos.',1837,'2025-11-03',2.7,3.2,9),(158,27,'Salsa de Queso Azul','Salsa de Queso Azul cremosa y llena de sabor, ideal para acompañar carnes y hamburguesas.',1619,'2027-03-15',9.4,11.3,10),(159,27,'Aceite de Coco Virgen','Aceite de Coco Virgen extraído de cocos frescos, perfecto para cocinar y hornear.',1123,'2024-09-29',1.3,1.6,12),(160,27,'Harina de Almendras','Harina de Almendras finamente molida, apta para dietas sin gluten y alta en proteínas.',1933,'2026-07-13',11.1,13.3,8),(161,28,'Galletas de Avena y Pasas','Galletas de Avena y Pasas caseras, ideales para disfrutar como snack saludable.',1565,'2029-06-08',5.1,6.1,11),(162,28,'Pan Integral Multicereales','Pan Integral Multicereales hecho con harina integral y semillas, rico en fibra y nutrientes.',1583,'2028-03-29',6.5,7.8,14),(163,28,'Pasta de Curry Rojo','Pasta de Curry Rojo tailandés, llena de sabor y especias exóticas.',1782,'2025-03-23',4.9,5.9,15),(164,28,'Salsa de Mango y Habanero','Salsa de Mango y Habanero, una combinación dulce y picante que realza tus platos.',1247,'2027-12-10',8.6,10.3,9),(165,28,'Aceite de Sésamo','Aceite de Sésamo tostado, perfecto para darle un toque oriental a tus platos.',1215,'2024-08-22',2.6,3.1,13),(166,29,'Salsa de Caramelo','Salsa de Caramelo casera, ideal para decorar postres o añadir dulzura a tus recetas.',1521,'2026-11-04',3.9,4.7,8),(167,29,'Vinagre de Manzana','Vinagre de Manzana natural, con propiedades beneficiosas para la salud y el paladar.',1556,'2029-01-17',10.3,12.4,10),(168,29,'Mermelada de Fresa','Mermelada de Fresa casera, con trozos de fruta y un sabor dulce y auténtico.',1414,'2028-04-07',7.7,9.2,12),(169,29,'Sirope de Chocolate','Sirope de Chocolate espeso y delicioso, ideal para decorar helados, crepes y postres.',1709,'2025-09-20',1.4,1.7,14),(170,29,'Salsa de Tamarindo','Salsa de Tamarindo agridulce, perfecta para platos asiáticos y marinados de carne.',1391,'2027-04-23',9.9,11.9,15),(171,30,'Mantequilla de Maní','Mantequilla de Maní natural y cremosa, ideal para untar en pan o usar en recetas.',1569,'2024-10-27',5.7,6.8,9),(172,30,'Almendras Tostadas','Almendras Tostadas crujientes y llenas de sabor, perfectas como snack o para agregar a tus platos.',1601,'2026-12-04',6.9,8.3,11),(173,30,'Salsa de Yogurt','Salsa de Yogurt suave y cremosa, ideal para aderezar ensaladas o acompañar platos de carne.',1512,'2025-07-09',8.3,10,13),(174,30,'Salsa Teriyaki','Salsa Teriyaki japonesa, con un equilibrio perfecto entre dulce y salado, ideal para marinados y adobos.',1355,'2027-11-21',2.3,2.8,8),(175,30,'Salsa de Chile Dulce','Salsa de Chile Dulce agridulce, llena de sabor y versátil en la cocina.',1587,'2028-08-12',4.6,5.5,10),(176,31,'Lay\'s Classic','Papas fritas clásicas y crujientes',1967,'2024-09-15',3.6,4.3,14),(177,31,'Lay\'s Sour Cream & Onion','Papas fritas con sabor a crema agria y cebolla',1169,'2026-06-01',7.2,8.6,12),(178,31,'Lay\'s Barbecue','Papas fritas con sabor a barbacoa ahumada',1718,'2025-05-18',5.8,7,13),(179,31,'Lay\'s Salt & Vinegar','Papas fritas con sabor a sal y vinagre',1973,'2027-02-10',2.4,2.9,11),(180,31,'Lay\'s Cheddar & Sour Cream','Papas fritas con sabor a queso cheddar y crema agria',1265,'2029-04-16',9.7,11.6,8),(181,32,'Del Monte Pineapple Chunks','Trozos de piña enlatados',1605,'2028-03-01',1.6,1.9,10),(182,32,'Del Monte Diced Peaches','Duraznos enlatados en cubitos',1767,'2024-08-08',8.5,10.2,9),(183,32,'Del Monte Fruit Cocktail','Mezcla de frutas enlatadas',1576,'2026-11-17',6.1,7.3,13),(184,32,'Del Monte Mandarin Oranges','Mandarinas enlatadas',1384,'2025-12-22',4.7,5.6,15),(185,32,'Del Monte Sliced Pears','Peras enlatadas en rodajas',1124,'2027-06-08',10.5,12.6,9),(186,33,'Bar-S Hot Dogs','Salchichas para perros calientes',1432,'2028-09-19',1.2,1.4,14),(187,33,'Bar-S Bologna','Mortadela de calidad',1327,'2024-07-01',11.4,13.7,8),(188,33,'Bar-S Deli Shaved Ham','Jamón rebanado en el mostrador deli',1309,'2026-03-14',2.8,3.4,11),(189,33,'Bar-S Smoked Sausage','Salchichas ahumadas',1832,'2025-04-10',7.9,9.5,12),(190,33,'Bar-S Beef Franks','Salchichas de res',1203,'2027-10-02',5.4,6.5,8),(191,34,'Panadol','Analgésico y antipirético',1467,'2029-02-14',3.2,3.8,15),(192,34,'Sensodyne','Pasta de dientes',1995,'2028-04-27',9.6,11.5,9),(193,34,'Aquafresh','Pasta de dientes',1190,'2024-09-20',1.9,2.3,14),(194,34,'Voltaren','Analgésico y antiinflamatorio',1769,'2026-06-04',8.8,10.6,13),(195,34,'Theraflu','Medicamento para el resfriado y la gripe',1421,'2025-08-28',6.3,7.6,10),(196,35,'Tic Tac','Mentas con diferentes sabores',1745,'2027-03-13',4.5,5.4,8),(197,35,'Ferrero Rocher','Bombones de chocolate con avellanas',1186,'2028-11-05',10.9,13.1,15),(198,35,'Nutella','Crema de avellanas y chocolate',1734,'2024-08-18',1.7,2,14),(199,35,'Kinder Chocolate','Chocolate con leche y relleno de leche',1938,'2026-11-24',11.2,13.4,12),(200,35,'Kinder Bueno','Barritas de chocolate rellenas de avellanas',1335,'2025-11-09',2.2,2.6,10),(201,36,'Kellogg\'s Corn Flakes','Cereales de maíz crujientes y nutritivos',1621,'2027-06-22',1.5,1.8,9),(202,36,'Kellogg\'s Special K','Cereales bajos en calorías y altos en fibra',1357,'2028-08-04',4.4,5.3,11),(203,36,'Kellogg\'s Rice Krispies','Cereales de arroz inflado para preparar barritas',1550,'2024-07-15',8.2,9.8,8),(204,36,'Kellogg\'s Frosted Flakes','Cereales de maíz azucarados y crujientes',1167,'2026-03-05',7.4,8.9,13),(205,36,'Kellogg\'s Pop-Tarts','Pastelillos de desayuno con diversos sabores',1448,'2025-05-29',6.8,8.2,14),(206,37,'Unilever Foods Ice Cream','Helados de diferentes sabores y presentaciones',1914,'2027-01-26',3.1,3.7,15),(207,37,'Unilever Foods Frozen Meals','Comidas congeladas listas para calentar y comer',1297,'2029-03-06',2.7,3.2,9),(208,37,'Unilever Foods Frozen Pizza','Pizzas congeladas con una variedad de ingredientes',1837,'2028-03-12',9.4,11.3,10),(209,37,'Unilever Foods Frozen Fruits','Frutas congeladas para batidos y postres',1619,'2024-09-26',1.3,1.6,12),(210,37,'Unilever Foods Frozen Desserts','Postres congelados como helados y tartas',1123,'2026-05-21',11.1,13.3,8),(211,38,'Dr. Oetker Pizza','Pizzas con diferentes sabores y coberturas',1933,'2025-09-15',5.1,6.1,11),(212,38,'Dr. Oetker Ristorante','Pizzas gourmet de estilo italiano',1565,'2027-04-09',6.5,7.8,14),(213,38,'Dr. Oetker Mug Cake Mix','Mezclas para preparar pastelitos individuales',1583,'2028-10-11',4.9,5.9,15),(214,38,'Dr. Oetker Baking Powder','Polvo para hornear para preparar diversos postres',1782,'2024-08-26',8.6,10.3,9),(215,38,'Dr. Oetker Pudding Mix','Mezclas para preparar budines y natillas',1247,'2026-11-30',2.6,3.1,13),(216,39,'McCain French Fries','Papas fritas congeladas de alta calidad',1215,'2025-12-03',3.9,4.7,8),(217,39,'McCain Onion Rings','Aros de cebolla rebozados y crujientes',1521,'2027-07-10',10.3,12.4,10),(218,39,'McCain Mozzarella Sticks','Palitos de mozzarella empanizados y dorados',1556,'2028-09-22',7.7,9.2,12),(219,39,'McCain Hash Browns','Tortitas de papa rallada doradas en forma de hash browns',1414,'2024-07-29',1.4,1.7,14),(220,39,'McCain Sweet Potato Fries','Papas fritas de batata dulce con una textura crujiente',1709,'2026-02-14',9.9,11.9,15),(221,40,'Dr Pepper','Bebida carbonatada con sabor a cereza y cola',1391,'2025-03-17',5.7,6.8,9),(222,40,'Snapple Iced Tea','Té helado con diferentes sabores y endulzado',1569,'2027-09-09',6.9,8.3,11),(223,40,'7UP','Refresco carbonatado y refrescante',1601,'2025-06-15',8.3,10,13),(224,40,'Canada Dry Ginger Ale','Bebida carbonatada de jengibre refrescante',1512,'2027-04-30',2.3,2.8,8),(225,40,'A&W Root Beer','Bebida carbonatada con sabor a raíz de regaliz',1355,'2028-11-07',4.6,5.5,10),(226,41,'Estée Lauder Double Wear Foundation','Base de maquillaje de larga duración y cobertura completa.',1587,'2026-03-25',3.6,4.3,14),(227,41,'Estée Lauder Advanced Night Repair','Suero facial reparador y antienvejecimiento.',1967,'2024-10-09',7.2,8.6,12),(228,41,'Estée Lauder Pure Color Envy Lipstick','Barra de labios con colores intensos y acabado cremoso.',1169,'2026-06-16',5.8,7,13),(229,41,'Estée Lauder Revitalizing Supreme+','Crema hidratante y antiarrugas para el rostro.',1718,'2025-08-07',2.4,2.9,11),(230,41,'Estée Lauder Bronze Goddess','Polvo bronceador para un aspecto bronceado natural.',1973,'2027-01-20',9.7,11.6,8),(231,42,'Mars Petcare Pedigree Dog Food','Alimento para perros con ingredientes de calidad.',1265,'2029-02-28',1.6,1.9,10),(232,42,'Mars Petcare Whiskas Cat Food','Alimento para gatos con sabores y nutrientes esenciales.',1605,'2028-04-03',8.5,10.2,9),(233,42,'Mars Petcare Cesar Dog Food','Alimento húmedo para perros con deliciosos sabores.',1767,'2024-09-17',6.1,7.3,13),(234,42,'Mars Petcare IAMS Dog Food','Alimento para perros con ingredientes saludables.',1576,'2026-11-02',4.7,5.6,15),(235,42,'Mars Petcare Temptations Cat Treats','Golosinas para gatos con sabores irresistibles.',1384,'2025-12-14',10.5,12.6,9),(236,43,'Jack Link\'s Original Beef Jerky','Carne de res seca y condimentada, perfecta para snacks.',1124,'2027-06-27',1.2,1.4,14),(237,43,'Jack Link\'s Teriyaki Beef Jerky','Carne de res seca y condimentada con sabor a teriyaki.',1432,'2028-09-02',11.4,13.7,8),(238,43,'Jack Link\'s Peppered Beef Jerky','Carne de res seca y condimentada con pimienta.',1327,'2024-08-23',2.8,3.4,11),(239,43,'Jack Link\'s Sweet & Hot Beef Jerky','Carne de res seca y condimentada con sabor dulce y picante.',1309,'2026-03-10',7.9,9.5,12),(240,43,'Jack Link\'s Turkey Jerky','Carne de pavo seca y condimentada, una alternativa saludable.',1832,'2025-04-24',5.4,6.5,8),(241,44,'Chobani Greek Yogurt','Yogur griego cremoso y rico en proteínas.',1203,'2027-10-17',3.2,3.8,15),(242,44,'Chobani Flip Yogurt','Yogur griego con ingredientes añadidos para mezclar.',1467,'2029-03-30',9.6,11.5,9),(243,44,'Chobani Less Sugar Yogurt','Yogur griego bajo en azúcar y alto en sabor.',1995,'2028-02-16',1.9,2.3,14),(244,44,'Chobani Drinkable Yogurt','Yogur griego en formato líquido para beber.',1190,'2024-09-29',8.8,10.6,13),(245,44,'Chobani Non-Dairy Yogurt','Alternativa láctea de yogur griego sin lácteos.',1769,'2026-06-25',6.3,7.6,10),(246,45,'Lay\'s Classic Potato Chips','Papas fritas clásicas y crujientes.',1421,'2025-08-14',4.5,5.4,8),(247,45,'Lay\'s Sour Cream & Onion Chips','Papas fritas con sabor a crema agria y cebolla.',1745,'2027-03-05',10.9,13.1,15),(248,45,'Lay\'s Barbecue Chips','Papas fritas con sabor a barbacoa ahumada.',1186,'2028-10-18',1.7,2,14),(249,45,'Lay\'s Salt & Vinegar Chips','Papas fritas con sabor a sal y vinagre.',1734,'2024-08-31',11.2,13.4,12),(250,45,'Lay\'s Cheddar & Sour Cream Chips','Papas fritas con sabor a queso cheddar y crema agria.',1938,'2026-11-18',2.2,2.6,10),(251,46,'Bimbo Soft White Bread','Pan blanco suave y esponjoso.',1335,'2025-11-26',2.5,3,9),(252,46,'Bimbo Whole Wheat Bread','Pan de trigo integral, rico en fibra y nutrientes.',1621,'2027-07-12',4.4,5.3,11),(253,46,'Bimbo Hamburger Buns','Panecillos para hamburguesas.',1357,'2028-08-25',8.2,9.8,8),(254,46,'Bimbo Hot Dog Buns','Panecillos para perritos calientes.',1550,'2024-07-05',7.4,8.9,13),(255,46,'Bimbo Cinnamon Raisin Bread','Pan de canela con pasas.',1167,'2026-03-19',6.8,8.2,14),(256,47,'Sara Lee Soft & Smooth Whole Grain White Bread','Pan blanco suave y esponjoso.',1448,'2025-06-09',3.1,3.7,15),(257,47,'Sara Lee Artesano Bread','Pan de alta calidad y sabor artesanal.',1914,'2027-01-30',2.7,3.2,9),(258,47,'Sara Lee 100% Whole Wheat Bread','Pan de trigo integral 100% natural.',1297,'2029-02-04',9.4,11.3,10),(259,47,'Sara Lee Butter Bread','Pan suave y mantecoso.',1837,'2028-03-18',1.3,1.6,12),(260,47,'Sara Lee Deluxe Bagels','Bagels deluxe en diferentes sabores.',1619,'2024-09-07',11.1,13.3,8),(261,48,'Church & Dwight Arm & Hammer Baking Soda','Bicarbonato de sodio multiusos para la limpieza y otros usos domésticos.',1123,'2026-05-30',5.1,6.1,11),(262,48,'Church & Dwight Arm & Hammer Toothpaste','Pasta de dientes para una limpieza fresca y protección contra la caries.',1933,'2025-09-24',6.5,7.8,14),(263,48,'Church & Dwight OxiClean Stain Remover','Quitamanchas potente y efectivo para todo tipo de manchas.',1565,'2027-04-18',4.9,5.9,15),(264,48,'Church & Dwight Trojan Condoms','Condones de alta calidad para una protección segura.',1583,'2028-10-29',8.6,10.3,9),(265,48,'Church & Dwight Nair Hair Remover','Crema depilatoria para una piel suave y libre de vello.',1782,'2024-08-12',2.6,3.1,13),(266,49,'Mars Wrigley Skittles','Deliciosas golosinas con diferentes sabores frutales.',1247,'2026-11-11',3.9,4.7,8),(267,49,'Mars Wrigley M&M\'s','Chocolate con cacahuetes recubierto de una capa de azúcar de colores.',1215,'2025-12-20',10.3,12.4,10),(268,49,'Mars Wrigley Starburst','Caramelos masticables con sabores frutales.',1521,'2027-06-04',7.7,9.2,12),(269,49,'Mars Wrigley Twix','Barritas de chocolate con caramelo y galleta crujiente.',1556,'2028-09-12',1.4,1.7,14),(270,49,'Mars Wrigley Snickers','Barritas de chocolate con cacahuetes y caramelo.',1414,'2024-07-22',9.9,11.9,15),(271,50,'Clorox Disinfecting Wipes','Toallitas desinfectantes para una limpieza efectiva y rápida.',1709,'2026-02-28',5.7,6.8,9),(272,50,'Clorox Bleach','Lejía desinfectante para blanquear y desinfectar superficies.',1391,'2025-03-27',6.9,8.3,11),(273,50,'Clorox Pine-Sol','Limpiador multiusos con aroma a pino.',1569,'2026-08-19',8.3,10,13),(274,50,'Clorox Toilet Bowl Cleaner','Limpiador de inodoros para una limpieza profunda y fresca.',1601,'2027-11-03',2.3,2.8,8),(275,50,'Clorox Green Works All-Purpose Cleaner','Limpiador multiusos ecológico con ingredientes naturales',1512,'2028-06-10',4.6,5.5,10);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promociones` int NOT NULL AUTO_INCREMENT,
  `nombre_promocion` varchar(255) DEFAULT NULL,
  `descripcion_promocion` varchar(255) DEFAULT NULL,
  `fecha_inicio_promocion` date NOT NULL,
  `fecha_fin_promocion` date NOT NULL,
  `id_promocion_producto_almacen` int NOT NULL,
  PRIMARY KEY (`id_promociones`),
  KEY `id_promocion_producto_idx` (`id_promocion_producto_almacen`),
  CONSTRAINT `id_promocion_producto` FOREIGN KEY (`id_promocion_producto_almacen`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `ruc_proveedor` varchar(11) NOT NULL,
  `nombre_proveedor` varchar(255) NOT NULL,
  `descripcion_proveedor` varchar(255) NOT NULL,
  `telefono_proveedor` varchar(9) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'20123456789','Nestle','Alimentos y bebidas','987654321'),(2,'30123456789','Unllever','Productos de cuidado','876543210'),(3,'40123456789','Procter & Gamble','Articulos de limpieza','765432109'),(4,'50123456789','Coca-Cola','Bebidas y refrescos','654321098'),(5,'60123456789','PepsiCo','Snacks y bebidas','543210987'),(6,'70123456789','Kellogg\'s','Cereales y productos','432109876'),(7,'80123456789','Johnson & Johnson','Cuidado Personal','321098765'),(8,'90123456789','Mars Incorporated','Dulces y chocolates','210987654'),(9,'10123456789','Kimberly-Clark','Productos de paple','109876543'),(10,'11123456789','Danone','Productos lacteos','987654322'),(11,'12123456789','Mondelez International','Galletas y snacks','876543211'),(12,'13123456789','Heinz','Salsas y condimentos','765432110'),(13,'14123456789','Colgate - Palmolive','Productos de higiene bucal','654321099'),(14,'15123456789','McCormick & Company','Especias y sazonadores','543210988'),(15,'16123456789','Barilla','Pastas y salsas','432109877'),(16,'17123456789','Ferrero','Chocolates y dulces','321098766'),(17,'18123456789','General Mills','Cereales y snacks','210987655'),(18,'19123456789','S.C. Johnson','Productos de limpieza','109876544'),(19,'20123456780','Bonduelle','Conservas vegetales','987654323'),(20,'30123456781','Hero','Alimentos Infantiles','876543212'),(21,'40123456782','Bimbo','Pan y productos horneados','765432111'),(22,'50123456783','Red Bull','Bebidas energeticas','654321100'),(23,'60123456784','L´Oréal','Productos de belleza','543210989'),(24,'70123456785','Reckitt Benckiser','Productos de limpieza','432109878'),(25,'80123456786','Nestlé Purina','Alimentos para mascotas','321098767'),(26,'90123456787','McCormick ','Especias y condimentos','210987656'),(27,'10123456788','Cadbury','Chocolates y dulces','109876545'),(28,'11123456787','Quaker','Cereales y barras','987654324'),(29,'12123456786','Knorr','Caldos y sazonadores','876543213'),(30,'13123456785','Palmolive','Jabones y detergentes','765432112'),(31,'14123456784','Lay´s','Snacks y papas fritas','654321101'),(32,'15123456783','Del Monte','Frutas enlatadas','543210990'),(33,'16123456782','Bar-S Foods','Embutidos y carnes','432109879'),(34,'17123456781','GlaxoSmithKline','Productos farmaceuticos','321098768'),(35,'18123456780','Ferrara Candy Company','Dulces y caramelos','210987657'),(36,'19123456779','Kellogg','Cereales y barritas','109876546'),(37,'20123456778','Unllever Foods','Alimentos congelados','987654325'),(38,'30123456777','Dr. Oetker','Productos de reposteria','876543214'),(39,'40123456776','McCain','Papas y productos congelados','765432113'),(40,'50123456775','Dr Pepper Snapple','Bebidas y refrescos','654321102'),(41,'60123456774','Estée Lauder','Productos de belleza','543210991'),(42,'70123456773','Mars Petcare','Alimentos para mascotas','432109880'),(43,'80123456772','Jack Link´s','Carnes secas y snacks','321098769'),(44,'90123456771','Chobani','yogures y productos lacteos','210987658'),(45,'10123456770','Frito-Lay','Snacks y papas fritas','109876547'),(46,'11123456769','Grupo Bimbo','Pan y productos horneados','987654326'),(47,'12123456768','Sara Lee','Productos de panaderia','876543215'),(48,'13123456767','Church & Dwight','Cuidado Personal y hogar','765432114'),(49,'14123456766','Mars Wrigley','Chicles y caramelos','654321103'),(50,'15123456765','Clorox','Productos de limpieza','543210992');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` date DEFAULT NULL,
  `id_emp` int NOT NULL,
  `dni_cli` int NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_emp_idx` (`id_emp`),
  KEY `dni_cli_idx` (`dni_cli`),
  CONSTRAINT `dni_cli` FOREIGN KEY (`dni_cli`) REFERENCES `cliente` (`dni_cliente`),
  CONSTRAINT `id_emp` FOREIGN KEY (`id_emp`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (75,'2023-07-08',120,21494880,31.62),(76,'2023-07-08',120,21494880,31.62);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'base_actualizada'
--

--
-- Dumping routines for database 'base_actualizada'
--
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCargo`(In idin int(11))
BEGIN
delete from cargo where id_cargo=idin;
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCliente`(IN idin int(11))
BEGIN
delete from cliente where id_cliente=idin;
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDetalle`(In idin int(11))
BEGIN
delete from detalleventa where id_venta=idin;
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEmpleado`(In idin int(11))
BEGIN
delete from empleado where id_empleado=idin;
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteProducto`(In idin int(11))
BEGIN
delete from producto where id_producto=idin;
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeletePromociones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePromociones`(In idin int(11))
BEGIN
delete from promociones where id_promociones=idin;
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteProveedor`(IN idin int(11))
BEGIN
delete from proveedor where id_proveedor=idin;
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteVenta`(IN idin int)
BEGIN
delete from venta where id_venta=idin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditCliente`(
  IN idIn INT,
  IN dni_clienteIn INT(8),
  IN nombre_clienteIn VARCHAR(100),
  IN correo_clienteIn VARCHAR(100),
  IN telefono_clienteIn VARCHAR(20)
)
BEGIN
  UPDATE cliente
  SET dni_cliente = dni_clienteIn,
      nombre_cliente = nombre_clienteIn,
      correo_cliente = correo_clienteIn,
      telefono_cliente = telefono_clienteIn
  WHERE id_cliente = idIn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditEmpleado`(
  IN idIn INT(100),
  IN cargoIn VARCHAR(25),
  IN fulldate_empleadoIn VARCHAR(100),
  IN edad_empleadoIn INT(2),
  IN correo_empleadoIn VARCHAR(255),
  IN contrasena_empleadoIn VARCHAR(255)
)
BEGIN
  DECLARE hashed_password VARCHAR(255);
  SET hashed_password = SHA2(contrasena_empleadoIn, 256);

  UPDATE empleado
  SET cargo = cargoIn,
      fulldate_empleado = fulldate_empleadoIn,
      edad_empleado = edad_empleadoIn,
      correo_empleado = correo_empleadoIn,
      contrasena_empleado = hashed_password
  WHERE id_empleado = idIn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditProducto`(
    IN idIn INT,
    IN id_proveedorIn INT,
    IN nombre_productoIn VARCHAR(255),
    IN descripcion_productoIn VARCHAR(255),
    IN cantidad_productoIn INT,
    IN fecha_vencimientoIn DATE,
    IN precio_ingreso_productoIn FLOAT,
    IN stock_minimo_producto_In INT
)
BEGIN
    DECLARE precio_salida_producto FLOAT(10, 2);
    SET precio_salida_producto = CEILING(precio_ingreso_productoIn * 1.2 * 10) / 10;

    UPDATE producto
    SET id_proveedor = id_proveedorIn,
        nombre_producto = nombre_productoIn,
        descripcion_producto = descripcion_productoIn,
        cantidad_producto = cantidad_productoIn,
        fecha_vencimiento = fecha_vencimientoIn,
        precio_ingreso_producto = precio_ingreso_productoIn,
        stock_minimo_producto = stock_minimo_producto_In
    WHERE id_producto = idIn;

    SELECT NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditProveedor`(
  IN idIn INT,
  IN ruc_proveedorIn varchar(11),
  IN nombre_proveedorIn VARCHAR(100),
  IN descripcion_proveedorIn VARCHAR(1000),
  IN telefono_proveedorIn VARCHAR(20)
)
BEGIN
  UPDATE proveedor
  SET ruc_proveedor = ruc_proveedorIn,
      nombre_proveedor = nombre_proveedorIn,
      descripcion_proveedor = descripcion_proveedorIn,
      telefono_proveedor = telefono_proveedorIn
  WHERE id_proveedor = idIn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `guardarVentaYDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `guardarVentaYDetalle`(
    IN p_id_emp INT,
    IN p_dni_cli INT,
    IN p_producto_cantidad_list VARCHAR(255),
    IN p_delimiter VARCHAR(1)
)
BEGIN
    DECLARE v_id_venta INT;
    DECLARE v_id_producto INT;
    DECLARE v_cantidad INT;
    DECLARE v_precio_producto DECIMAL(10,2);
    DECLARE v_sub_total DECIMAL(10,2);
    DECLARE v_igv DECIMAL(10,2);
    DECLARE v_total_venta DECIMAL(10,2);

    -- Insertar en la tabla Venta
    INSERT INTO Venta (fecha_venta, id_emp, dni_cli, total)
    VALUES (NOW(), p_id_emp, p_dni_cli, 0);

    -- Obtener el último id_venta generado
    SET v_id_venta = LAST_INSERT_ID();

    -- Separar los valores de producto y cantidad
    DROP TEMPORARY TABLE IF EXISTS temp_productos_cantidad;
    CREATE TEMPORARY TABLE temp_productos_cantidad (
        id_producto INT,
        cantidad INT
    );

    SET @v_producto_cantidad = p_producto_cantidad_list;
    SET @v_delimiter = p_delimiter;

    WHILE CHAR_LENGTH(@v_producto_cantidad) > 0 DO
        SET @v_value = SUBSTRING_INDEX(@v_producto_cantidad, @v_delimiter, 1);
        SET @v_producto_cantidad = TRIM(SUBSTRING(@v_producto_cantidad, CHAR_LENGTH(@v_value) + 2));
        SET @v_id_producto = CAST(SUBSTRING_INDEX(@v_value, ',', 1) AS UNSIGNED);
        SET @v_cantidad = CAST(SUBSTRING_INDEX(@v_value, ',', -1) AS UNSIGNED);

        INSERT INTO temp_productos_cantidad (id_producto, cantidad)
        VALUES (@v_id_producto, @v_cantidad);
    END WHILE;

    -- Insertar en la tabla DetalleVenta
    INSERT INTO DetalleVenta (id_venta, id_producto, cantidad, precio_producto, sub_total, igv, total_venta)
    SELECT v_id_venta, tpc.id_producto, tpc.cantidad, ROUND(p.precio_salida_producto, 2),
           ROUND(tpc.cantidad * p.precio_salida_producto, 2),
           ROUND(tpc.cantidad * p.precio_salida_producto * 0.18, 2) AS igv,
           ROUND(tpc.cantidad * p.precio_salida_producto + tpc.cantidad * p.precio_salida_producto * 0.18, 2) AS total_venta
    FROM temp_productos_cantidad tpc
    INNER JOIN producto p ON tpc.id_producto = p.id_producto;

    -- Calcular el total y redondearlo
    UPDATE Venta v
    SET v.total = ROUND(
        (SELECT SUM(d.total_venta) FROM DetalleVenta d WHERE d.id_venta = v.id_venta), 2
    )
    WHERE v.id_venta = v_id_venta;

    -- Restar la cantidad al producto en el almacén
    UPDATE producto p
    INNER JOIN temp_productos_cantidad tpc ON p.id_producto = tpc.id_producto
    SET p.cantidad_producto = p.cantidad_producto - tpc.cantidad;

    -- Fin del proceso almacenado
    DROP TEMPORARY TABLE IF EXISTS temp_productos_cantidad;
    SELECT NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IDCargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IDCargo`(In idin int(11))
BEGIN
select*from cargo where id_cargo=idin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IDCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IDCliente`(idin int(11))
BEGIN
select*from cliente where id_cliente=idin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IDDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IDDetalle`(In idin int(11))
BEGIN
select*from detalleventa where id_venta=idin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IDEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IDEmpleado`(In idin int(11))
BEGIN
select*from empleado where id_empleado=idin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IDProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IDProducto`(In idin int(11))
BEGIN
select*from producto where id_producto=idin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IDPromociones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IDPromociones`(In idin int(11))
BEGIN
select*from promociones where id_promociones=idin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IDProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IDProveedor`(IN idin int(11))
BEGIN
select*from proveedor where id_proveedor=idin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IDVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IDVenta`(In idin int)
BEGIN
select*from venta where id_venta=idin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaCargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaCargo`()
BEGIN
select*from cargo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaCliente`()
BEGIN
select*from cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaDetalle`()
BEGIN
select*from detalleventa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaEmpleado`()
BEGIN
select*from empleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaProducto`()
BEGIN
select*from producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaPromociones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaPromociones`()
BEGIN
select * from promociones;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaProveedor`()
BEGIN
select*from proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listaVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listaVenta`()
BEGIN
select*from venta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginEmpleado`(
  IN `correo_empleadoIn` varchar(255),
  IN `contrasena_empleadoIn` varchar(255)
)
BEGIN
  DECLARE v_contrasena_empleado VARCHAR(255);
  
  -- Encriptar la contraseña ingresada utilizando SHA2
  DECLARE v_encrypted_password VARCHAR(255);
  SET v_encrypted_password = SHA2(contrasena_empleadoIn, 256);
  
  -- Buscar la contraseña en la tabla "empleado" para el correo proporcionado
  SELECT contrasena_empleado INTO v_contrasena_empleado
  FROM empleado
  WHERE correo_empleado = correo_empleadoIn;
  
  -- Comprobar si la contraseña ingresada coincide con la almacenada
  IF v_contrasena_empleado IS NOT NULL AND v_encrypted_password = v_contrasena_empleado THEN
    SELECT 'true' AS mensaje;
  ELSE
    SELECT 'false' AS mensaje;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveCargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveCargo`( nombre_cargoIn varchar(255))
BEGIN
insert into cargo(nombre_cargo)
values
(nombre_cargoIn);
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveCliente`(dni_clienteIn int(8),nombre_clienteIn varchar(255), correo_clienteIn varchar(255), telefono_clienteIn varchar(9))
BEGIN
insert into cliente(dni_cliente, nombre_cliente, correo_cliente, telefono_cliente)
values
(dni_clienteIn,nombre_clienteIn, correo_clienteIn, telefono_clienteIn);
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveDetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveDetalle`(
IN id_empIn int,
IN id_cliIn int,
    IN id_productoIn INT,
    IN cantidadIn INT
)
BEGIN
    DECLARE precio_producto float(10,2);
    DECLARE sub_total float(10,2);
    DECLARE igv float(10,2);
    DECLARE total_venta float(10,2);

    -- Obtener el precio del producto
    SELECT precio_salida_producto INTO precio_producto
    FROM producto
    WHERE id_producto = id_productoIn;

    -- Calcular el subtotal
    SET sub_total = precio_producto * cantidadIn;

    -- Calcular el IGV (18% del subtotal)
    SET igv = sub_total * 0.18;

    -- Calcular el total de venta (subtotal + IGV)
    SET total_venta = sub_total + igv;

   -- Restar la cantidad al producto en el almacen
UPDATE producto
SET cantidad_producto = cantidad_producto - cantidadIn
WHERE id_producto = id_productoIn;


    -- Insertar el detalle de venta
    INSERT INTO detalleventa (id_emp, id_cli, id_producto, cantidad, precio_producto, sub_total, igv, total_venta)
    VALUES (id_empIn,id_cliIn, id_productoIn, cantidadIn, precio_producto, sub_total, igv, total_venta);

    SELECT NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveProducto`(
    IN id_proveedorIn INT,
    IN nombre_productoIn VARCHAR(255),
    IN descripcion_productoIn varchar(255),
    IN cantidad_productoIn int,
    IN fecha_vencimientoIn date,
    IN precio_ingreso_productoIn float,
    IN stock_minimo_producto_In int
)
BEGIN  
    DECLARE precio_salida_producto float(10,2);
    SET precio_salida_producto = CEILING(precio_ingreso_productoIn * 1.2*10)/10;

    INSERT INTO producto (id_proveedor, nombre_producto, descripcion_producto, cantidad_producto, fecha_vencimiento, precio_ingreso_producto, precio_salida_producto, stock_minimo_producto)
    VALUES (id_proveedorIn, nombre_productoIn, descripcion_productoIn, cantidad_productoIn, fecha_vencimientoIn, precio_ingreso_productoIn, precio_salida_producto, stock_minimo_producto_In);

    SELECT NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `savePromociones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `savePromociones`(IN nombre_promocion varchar(255),iN descripcion_promocion varchar(1000),IN fecha_inicio_promocion date,IN fecha_fin_promocion date,IN id_promocion_producto_almacenIn int(11))
BEGIN
insert into promociones(nombre_promocion, descripcion_promocion, fecha_inicio_promocion, fecha_fin_promocion, id_promocion_producto_almacen)
values
(nombre_promocionIn, descripcion_promocionIn, fecha_inicio_promocionIn, fecha_fin_promocionIn, id_promocion_producto_almacenIn);
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveProveedor`(IN ruc_proveedorIn varchar(11),IN nombre_proveedorIn varchar(255),IN descripcion_proveedorIn varchar(1000),IN telefono_proveedorIn varchar(9))
BEGIN
insert into proveedor( ruc_proveedor, nombre_proveedor, descripcion_proveedor, telefono_proveedor)
values
(ruc_proveedorIn, nombre_proveedorIn, descripcion_proveedorIn, telefono_proveedorIn);
select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveRegistroEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveRegistroEmpleado`(
   IN `cargoIn` varchar(25),
  IN `fulldate_empleadoIn` varchar(255),
  IN `edad_empleadoIn` int(2),
  IN `correo_empleadoIn` varchar(255),
  IN `contrasena_empleadoIn` varchar(255)
  
)
BEGIN
 DECLARE encrypted_password VARCHAR(255);
  SET encrypted_password = SHA2(contrasena_empleadoIn, 256);
  
  INSERT INTO empleado (cargo,fulldate_empleado, edad_empleado, correo_empleado, contrasena_empleado,fecha_registro)
  VALUES (cargoIn,fulldate_empleadoIn, edad_empleadoIn, correo_empleadoIn,encrypted_password, now());
  select null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-08  2:39:52
