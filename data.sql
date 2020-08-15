-- MySQL dump 10.13  Distrib 5.7.30-33
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.4-MariaDB-1:10.5.4+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Dumping data for table `ceny`
--

LOCK TABLES `ceny` WRITE;
/*!40000 ALTER TABLE `ceny` DISABLE KEYS */;
INSERT INTO `ceny` VALUES (1,3215,1);
INSERT INTO `ceny` VALUES (2,3215,1);
INSERT INTO `ceny` VALUES (3,1256,1);
INSERT INTO `ceny` VALUES (4,2546,0);
INSERT INTO `ceny` VALUES (5,9856,0);
INSERT INTO `ceny` VALUES (6,6523,1);
INSERT INTO `ceny` VALUES (7,4586,1);
INSERT INTO `ceny` VALUES (8,9732,1);
INSERT INTO `ceny` VALUES (9,4528,0);
INSERT INTO `ceny` VALUES (10,3211,1);
INSERT INTO `ceny` VALUES (11,8563,1);
INSERT INTO `ceny` VALUES (12,5897,1);
INSERT INTO `ceny` VALUES (13,1200,1);
/*!40000 ALTER TABLE `ceny` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`student`@`%`*/ /*!50003 trigger if not exists task_14
    before update on ceny
for each row
begin
    if OLD.cena != NEW.cena THEN
        insert into ceny_log (datchik_id, old_cena, new_cena) values (OLD.datchik_id, OLD.cena, NEW.cena);
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `ceny_log`
--

LOCK TABLES `ceny_log` WRITE;
/*!40000 ALTER TABLE `ceny_log` DISABLE KEYS */;
INSERT INTO `ceny_log` VALUES (2,5900,5897,12);
/*!40000 ALTER TABLE `ceny_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `datchiki`
--

LOCK TABLES `datchiki` WRITE;
/*!40000 ALTER TABLE `datchiki` DISABLE KEYS */;
INSERT INTO `datchiki` VALUES (1,'Датчик 1',1);
INSERT INTO `datchiki` VALUES (2,'Датчик 2',2);
INSERT INTO `datchiki` VALUES (3,'Датчик 3',3);
INSERT INTO `datchiki` VALUES (4,'Датчик 4',4);
INSERT INTO `datchiki` VALUES (5,'Датчик 5',5);
INSERT INTO `datchiki` VALUES (6,'Датчик 6',6);
INSERT INTO `datchiki` VALUES (7,'Датчик 7',7);
INSERT INTO `datchiki` VALUES (8,'Датчик 8',8);
INSERT INTO `datchiki` VALUES (9,'Датчик 9',9);
INSERT INTO `datchiki` VALUES (10,'Датчик 10',10);
INSERT INTO `datchiki` VALUES (11,'Датчик 11',1);
INSERT INTO `datchiki` VALUES (12,'Датчик 12',2);
INSERT INTO `datchiki` VALUES (13,'Датчик 13',11);
/*!40000 ALTER TABLE `datchiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `datchiki_promo`
--

LOCK TABLES `datchiki_promo` WRITE;
/*!40000 ALTER TABLE `datchiki_promo` DISABLE KEYS */;
INSERT INTO `datchiki_promo` VALUES (1,1);
INSERT INTO `datchiki_promo` VALUES (3,3);
INSERT INTO `datchiki_promo` VALUES (4,4);
INSERT INTO `datchiki_promo` VALUES (5,5);
INSERT INTO `datchiki_promo` VALUES (6,6);
INSERT INTO `datchiki_promo` VALUES (7,7);
INSERT INTO `datchiki_promo` VALUES (8,8);
INSERT INTO `datchiki_promo` VALUES (9,9);
INSERT INTO `datchiki_promo` VALUES (10,10);
INSERT INTO `datchiki_promo` VALUES (11,7);
INSERT INTO `datchiki_promo` VALUES (12,6);
INSERT INTO `datchiki_promo` VALUES (12,10);
INSERT INTO `datchiki_promo` VALUES (1,10);
INSERT INTO `datchiki_promo` VALUES (5,9);
INSERT INTO `datchiki_promo` VALUES (7,2);
INSERT INTO `datchiki_promo` VALUES (9,5);
INSERT INTO `datchiki_promo` VALUES (3,4);
/*!40000 ALTER TABLE `datchiki_promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proizvoditel`
--

LOCK TABLES `proizvoditel` WRITE;
/*!40000 ALTER TABLE `proizvoditel` DISABLE KEYS */;
INSERT INTO `proizvoditel` VALUES (1,'Производитель 1');
INSERT INTO `proizvoditel` VALUES (2,'Производитель 2');
INSERT INTO `proizvoditel` VALUES (3,'Производитель 3');
INSERT INTO `proizvoditel` VALUES (4,'Производитель 4');
INSERT INTO `proizvoditel` VALUES (5,'Производитель 5');
INSERT INTO `proizvoditel` VALUES (6,'Производитель 6');
INSERT INTO `proizvoditel` VALUES (7,'Производитель 7');
INSERT INTO `proizvoditel` VALUES (8,'Производитель 8');
INSERT INTO `proizvoditel` VALUES (9,'Производитель 9');
INSERT INTO `proizvoditel` VALUES (10,'Производитель 10');
INSERT INTO `proizvoditel` VALUES (11,'Производитель 11');
/*!40000 ALTER TABLE `proizvoditel` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`student`@`%`*/ /*!50003 trigger if not exists task_13
    before update on proizvoditel
for each row
    update datchiki set proizv_id = NEW.id where proizv_id = OLD.id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `promo`
--

LOCK TABLES `promo` WRITE;
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
INSERT INTO `promo` VALUES (1,'Постоянная',1);
INSERT INTO `promo` VALUES (2,'Акция',5);
INSERT INTO `promo` VALUES (3,'Постоянным',10);
INSERT INTO `promo` VALUES (4,'Пенсионная',3);
INSERT INTO `promo` VALUES (5,'Выходные',2);
INSERT INTO `promo` VALUES (6,'Праздничная',7);
INSERT INTO `promo` VALUES (7,'Дополнительная',5);
INSERT INTO `promo` VALUES (8,'Эксклюзивная',15);
INSERT INTO `promo` VALUES (9,'Распродажа',20);
INSERT INTO `promo` VALUES (10,'Популярно',0);
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-16  1:52:53
