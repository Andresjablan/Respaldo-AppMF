CREATE DATABASE  IF NOT EXISTS `app_mi_familia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `app_mi_familia`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: app_mi_familia
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `id_articulo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `stock_actual` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id_articulo`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (5,'Mouse Sangsung Gamer','Mouse con luces RGB',75000.00,10,1,'Tecnología',1000),(6,'Mouse Gamer LG','Mouse con luces RGB',75000.00,10,1,'Tecnología',1500),(7,'Teclado LG 75% mecaico','Teclado Mecanico',75000.00,10,1,'Tecnología',2000),(8,'Monitor 24\" Samsung 1080p','Monitor Fhd',75000.00,10,1,'Tecnología',4000),(9,'Teclado Mecánico','Teclado RGB con switches rojos',120000.00,20,1,'Tecnología',1100),(10,'Diadema Corsair HF135','Diadema 7.1',75000.00,10,1,'Tecnología',500),(11,'Monitor Fhd 27 Pulgadas','Monitor Fhd 27 Pulgadas ',500000.00,3,1,'1',10000);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefacturacompra`
--

DROP TABLE IF EXISTS `detallefacturacompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallefacturacompra` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `id_factura_compra` int DEFAULT NULL,
  `id_articulo` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `id_factura_compra` (`id_factura_compra`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `detallefacturacompra_ibfk_1` FOREIGN KEY (`id_factura_compra`) REFERENCES `facturacompra` (`id_factura_compra`),
  CONSTRAINT `detallefacturacompra_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefacturacompra`
--

LOCK TABLES `detallefacturacompra` WRITE;
/*!40000 ALTER TABLE `detallefacturacompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallefacturacompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefacturaventa`
--

DROP TABLE IF EXISTS `detallefacturaventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallefacturaventa` (
  `id_detalle_venta` int NOT NULL AUTO_INCREMENT,
  `id_factura` int DEFAULT NULL,
  `id_articulo` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  KEY `id_factura` (`id_factura`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `detallefacturaventa_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `facturaventa` (`id_factura`),
  CONSTRAINT `detallefacturaventa_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefacturaventa`
--

LOCK TABLES `detallefacturaventa` WRITE;
/*!40000 ALTER TABLE `detallefacturaventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallefacturaventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion_compras`
--

DROP TABLE IF EXISTS `devolucion_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucion_compras` (
  `id_devolucion_compra` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `motivo` text,
  `fecha` datetime DEFAULT NULL,
  `id_factura_compra` int DEFAULT NULL,
  `id_articulo` int DEFAULT NULL,
  PRIMARY KEY (`id_devolucion_compra`),
  KEY `id_factura_compra` (`id_factura_compra`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `devolucion_compras_ibfk_1` FOREIGN KEY (`id_factura_compra`) REFERENCES `facturacompra` (`id_factura_compra`),
  CONSTRAINT `devolucion_compras_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion_compras`
--

LOCK TABLES `devolucion_compras` WRITE;
/*!40000 ALTER TABLE `devolucion_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucion_ventas`
--

DROP TABLE IF EXISTS `devolucion_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucion_ventas` (
  `id_devolucion` int NOT NULL AUTO_INCREMENT,
  `id_factura` int DEFAULT NULL,
  `id_articulo` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `motivo` text,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_devolucion`),
  KEY `id_factura` (`id_factura`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `devolucion_ventas_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `facturaventa` (`id_factura`),
  CONSTRAINT `devolucion_ventas_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucion_ventas`
--

LOCK TABLES `devolucion_ventas` WRITE;
/*!40000 ALTER TABLE `devolucion_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada` (
  `id_entrada` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id_entrada`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `entrada_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_detalle`
--

DROP TABLE IF EXISTS `entrada_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada_detalle` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_entrada` int DEFAULT NULL,
  `id_articulo` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_entrada` (`id_entrada`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `entrada_detalle_ibfk_1` FOREIGN KEY (`id_entrada`) REFERENCES `entrada` (`id_entrada`),
  CONSTRAINT `entrada_detalle_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_detalle`
--

LOCK TABLES `entrada_detalle` WRITE;
/*!40000 ALTER TABLE `entrada_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturacompra`
--

DROP TABLE IF EXISTS `facturacompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacompra` (
  `id_factura_compra` int NOT NULL AUTO_INCREMENT,
  `fecha_compra` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id_factura_compra`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `facturacompra_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacompra`
--

LOCK TABLES `facturacompra` WRITE;
/*!40000 ALTER TABLE `facturacompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturacompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaventa`
--

DROP TABLE IF EXISTS `facturaventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturaventa` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_vendedor` int DEFAULT NULL,
  `metodo_de_pago` varchar(45) DEFAULT NULL,
  `estado` enum('Pagada','Pendiente','Anulada') DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_vendedor` (`id_vendedor`),
  CONSTRAINT `facturaventa_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `facturaventa_ibfk_2` FOREIGN KEY (`id_vendedor`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaventa`
--

LOCK TABLES `facturaventa` WRITE;
/*!40000 ALTER TABLE `facturaventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturaventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `cantidad_disponible` int DEFAULT NULL,
  `id_articulo` int DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `id_articulo` (`id_articulo`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientoinventario`
--

DROP TABLE IF EXISTS `movimientoinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientoinventario` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_inventario` int DEFAULT NULL,
  `id_articulo` int DEFAULT NULL,
  `tipo_movimiento` enum('Entrada','Salida','Devolucion Compra','Devolucion Venta') DEFAULT NULL,
  `fecha_movimiento` date DEFAULT NULL,
  `id_detalle_venta` int DEFAULT NULL,
  `id_detalle_compra` int DEFAULT NULL,
  `motivo` enum('Venta','Compra','Devolucion','Ajuste') DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `id_inventario` (`id_inventario`),
  KEY `id_articulo` (`id_articulo`),
  KEY `id_detalle_venta` (`id_detalle_venta`),
  KEY `id_detalle_compra` (`id_detalle_compra`),
  CONSTRAINT `movimientoinventario_ibfk_1` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`),
  CONSTRAINT `movimientoinventario_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_articulo`),
  CONSTRAINT `movimientoinventario_ibfk_3` FOREIGN KEY (`id_detalle_venta`) REFERENCES `detallefacturaventa` (`id_detalle_venta`),
  CONSTRAINT `movimientoinventario_ibfk_4` FOREIGN KEY (`id_detalle_compra`) REFERENCES `detallefacturacompra` (`id_detalle_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientoinventario`
--

LOCK TABLES `movimientoinventario` WRITE;
/*!40000 ALTER TABLE `movimientoinventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientoinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(100) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Empresa Ejemplo','Juan Pérez','123-456-7890','Calle Falsa 123','juan.perez@ejemplo.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `num_documento` varchar(25) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `rol` enum('Administrador','Vendedor','usuario') NOT NULL,
  `contrasena` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Andres','Blanco','7894566','789456','andre@gmail.com','111111','Administrador','1234'),(2,'admin','Admin','123456','88267626','admin@correo.com','Calle 123','Administrador','1234'),(5,'Yazmin','Leal','78946','78946','Yaz@gamil','cl 17 10 06','Administrador','7894'),(8,'Alis','Rin ','789456','789465','Ali@465','cl 11 1006','Administrador','7984'),(9,'Carlos','Claro','1122334455','3001112233','carlos.perez@correo.com','Calle 10 #15-20','usuario','1234'),(10,'TEST','registro','456789','465789','and@465789','cl 11 5 665','Administrador','7894'),(11,'Test3','Test','7889','789456',NULL,'Calle 17','Administrador','1234'),(12,'Test4','Test','7889','789456',NULL,'Calle 17','Administrador','4567'),(13,'Test5','Test','7889','789456',NULL,'Calle 17','Vendedor','7894'),(14,'Test7','Test','7889','789456',NULL,'Calle 17','Administrador','7895'),(15,'Test8','Test','7889','789456','Test@Test','Calle 17','Administrador','4567'),(16,'Test9','Test','7889','789456','Test@Test','Calle 17','Vendedor','1234'),(17,'Test10','Test','7889','789456','Test@Test','Calle 17','usuario','1234'),(18,'Andres ','Jaimes ','78894561','5781179','andres@hotmail.com','Calle 17','Administrador','1234'),(19,'Prueba ','Video','885522','556644','prueba@gmail','Calle 17','Vendedor','7894'),(20,'Test12','Test','88267626','789456','Test@Test','Calle 17','Administrador','7894'),(21,'Test13','Vi','741258','7894','Test@Test','Calle 17','Administrador','7894');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `num_documento` varchar(255) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Test','4569',NULL,'Calle 17','Test','7889','Usuario','789456'),(2,'Test','7894',NULL,'Calle 17','Test2','7889','Administrador','789456'),(3,'Test','7894',NULL,'Calle 17','Test3','7889','Administrador','789456'),(4,'Test','1234',NULL,'Calle 17','Test3','7889','Administrador','789456');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-04  9:21:44
