-- PostgreSQLdump 8.0.0 Distrib 8.0.17, for Windows(x64)
--
-- Host: localhost    Database: Delta
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
 aid` serial NOT NULL ,
  name text NOT NULL,
  bio text NOT NULL,
  rate integer NOT NULL,
  PRIMARY KEY (aid),
  KEY `fk_manager` (aid)
) ENGINE=InnoDB AUTO_INCREMENT=20002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `sid` serial NOT NULL,
  `song` text NOT NULL,
 `date` text NOT NULL,
`rate` integer NOT NULL,
PRIMARY KEY (sid),
  KEY `fk_manager` (sid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;

/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO public.songs(sid, song, dor, counting, rate) VALUES (?, ?, ?, ?, ?);
UPDATE songs set rate=(rate*counting+?)/(counting+1),counting=counting+1 where sid=?
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claims` (
  `aid` integer NOT NULL,
  `sid` integer NOT NULL,
 CONSTRAINT art_pkey PRIMARY KEY (sid, aid),
    CONSTRAINT art_aid_fkey FOREIGN KEY (aid)
        REFERENCES public.artists (aid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT art_sid_fkey FOREIGN KEY (sid)
        REFERENCES public.songs (sid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
  PRIMARY KEY (`aid`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--
LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
INSERT INTO public.art(sid, aid) VALUES (?, ?);
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;





LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO artists(name, dob, rate,bio)values(?,?,?,?)
UPDATE public.artists SET aid=?, name=?, dob=?, rate=?, bio=? WHERE <condition>;
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    uid integer NOT NULL DEFAULT nextval('users_uid_seq'::regclass),
    uname text COLLATE pg_catalog."default" NOT NULL,
    uemail text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (uid)
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;



-- Dump completed on 2020-07-22 7:40:12
