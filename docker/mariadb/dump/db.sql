-- MariaDB dump 10.19  Distrib 10.9.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mblog_db
-- ------------------------------------------------------
-- Server version	10.9.8-MariaDB-1:10.9.8+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `article_id` int(16) NOT NULL AUTO_INCREMENT,
  `header` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date` varchar(255) NOT NULL,
  `author_id` int(16) NOT NULL,
  `views` int(11) DEFAULT 0,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES
(1,'Как создать и развернуть веб-приложение с использованием Docker и Docker Compose.','В этой статье мы рассмотрим, как создать и развернуть простое веб-приложение с использованием Docker и Docker Compose. Мы будем использовать PHP в качестве языка программирования и Nginx в качестве веб-сервера.\n\nПрежде всего, необходимо установить Docker и Docker Compose на локальной машине. После установки создадим каталог для нашего проекта и перейдем в него:\n\n\nmkdir myapp\ncd myapp\nЗатем создадим файл index.php в корневом каталоге проекта с простым кодом:\n\n\n<?php\necho \"Hello, World!\";\n?>\nДалее создадим файл Dockerfile в корневом каталоге проекта. В этом файле мы определим образ Docker для нашего веб-приложения:\n\n\nFROM php:7.4-fpm\n\nCOPY . /var/www/html\n\nRUN apt-get update && apt-get install -y \n  libzip-dev \n  && docker-php-ext-install zip \n  && docker-php-ext-enable zip\nВ этом файле мы используем официальный образ PHP 7.4 FPM в качестве базового образа. Затем копируем файлы нашего приложения в каталог /var/www/html в контейнере. Далее устанавливаем необходимое расширение PHP (в этом случае zip) и активируем его.\n\nТеперь создадим файл docker-compose.yml в корневом каталоге проекта. В этом файле мы определим конфигурацию для нашего веб-приложения:\n\n\nversion: \'3\'\n\nservices:\n  app:\n    build: .\n    volumes:\n      - .:/var/www/html\n    environment:\n      - APP_ENV=development\n\n  web:\n    image: nginx:latest\n    ports:\n      - 8080:80\n    volumes:\n      - .:/var/www/html\n      - ./nginx.conf:/etc/nginx/nginx.conf\n    depends_on:\n      - app\nВ этом файле мы определяем два сервиса: app и web. Сервис app использует образ, который мы определили в файле Dockerfile. Мы также определяем volume для связи каталога приложения на хостовой машине с каталогом /var/www/html в контейнере. Кроме того, мы определяем переменную окружения APP_ENV со значением development.\n\nСервис web использует официальный образ Nginx в качестве базового образа. Мы определяем volume для связи каталога приложения на хостовой машине с каталогом /var/www/html в контейнере. Кроме того, мы определяем volume для связи файла nginx.conf на хостовой машине с файлом /etc/nginx/nginx.conf в контейнере. Этот файл содержит конфигурацию Nginx для нашего веб-приложения. Мы также определяем зависимость сервиса web от сервиса app.\n\nНаконец, создадим файл nginx.conf в корневом каталоге проекта. В этом файле мы определим конфигурацию Nginx для нашего веб-приложения:\n\n\nworker_processes 1;\n\nevents { worker_connections 1024; }\n\nhttp {\n\n    sendfile on;\n\n    server {\n        listen 80;\n        server_name localhost;\n\n        root /var/www/html;\n\n        location / {\n            try_files $uri $uri/ /index.php$is_args$args;\n        }\n\n        location ~ .php$ {\n            try_files $uri =404;\n            fastcgi_pass app:9000;\n            fastcgi_index index.php;\n            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;\n            include fastcgi_params;\n        }\n    }\n}\nВ этом файле мы определяем конфигурацию Nginx для нашего веб-приложения. Мы слушаем порт 80 и устанавливаем корневой каталог в /var/www/html. Мы также определяем location для обработки запросов PHP-файлов и передачи их сервису app на порт 9000 с помощью FastCGI.\n\nТеперь мы готовы запустить наше веб-приложение с использованием Docker Compose. Выполним следующую команду в корневом каталоге проекта:\n\n\ndocker-compose up -d\nЭта команда запустит контейнеры в фоновом режиме. Теперь мы можем открыть веб-браузер и перейти по адресу http://localhost:8080. Мы должны увидеть сообщение \"Hello, World!\", которое выводится нашим PHP-приложением.\n\nЭто все, что нужно сделать, чтобы создать и развернуть простое веб-приложение с использованием Docker и Docker Compose. В этом примере мы использовали PHP и Nginx, но вы можете использовать любой другой язык программирования и веб-сервер, которые вам нравятся. Дocker и Docker Compose предоставляют гибкую и мощную среду для разработки и развертывания веб-приложений.','1710020058',1,2),
(2,'Docker и Docker Compose.','В этой статье мы рассмотрим, как создать и развернуть простое веб-приложение с использованием Docker и Docker Compose. Мы будем использовать PHP в качестве языка программирования и Nginx в качестве веб-сервера.\n\nПрежде всего, необходимо установить Docker и Docker Compose на локальной машине. После установки создадим каталог для нашего проекта и перейдем в него:\n\n\nmkdir myapp\ncd myapp\nЗатем создадим файл index.php в корневом каталоге проекта с простым кодом:\n\n\n<?php\necho \"Hello, World!\";\n?>\nДалее создадим файл Dockerfile в корневом каталоге проекта. В этом файле мы определим образ Docker для нашего веб-приложения:\n\n\nFROM php:7.4-fpm\n\nCOPY . /var/www/html\n\nRUN apt-get update && apt-get install -y \n  libzip-dev \n  && docker-php-ext-install zip \n  && docker-php-ext-enable zip\nВ этом файле мы используем официальный образ PHP 7.4 FPM в качестве базового образа. Затем копируем файлы нашего приложения в каталог /var/www/html в контейнере. Далее устанавливаем необходимое расширение PHP (в этом случае zip) и активируем его.\n\nТеперь создадим файл docker-compose.yml в корневом каталоге проекта. В этом файле мы определим конфигурацию для нашего веб-приложения:\n\nЭто все, что нужно сделать, чтобы создать и развернуть простое веб-приложение с использованием Docker и Docker Compose. В этом примере мы использовали PHP и Nginx, но вы можете использовать любой другой язык программирования и веб-сервер, которые вам нравятся. Дocker и Docker Compose предоставляют гибкую и мощную среду для разработки и развертывания веб-приложений.','1710020058',1,4);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` int(16) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(255) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `article_id_comments` int(255) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-09 21:40:51
