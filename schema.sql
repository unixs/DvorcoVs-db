--
-- Table structure for table `ceny`
--

CREATE TABLE `ceny` (
  `datchik_id` int(11) NOT NULL,
  `cena` float NOT NULL,
  `nalichie` tinyint(1) NOT NULL,
  PRIMARY KEY (`datchik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Цены на датчики';

--
-- Table structure for table `datchiki`
--

CREATE TABLE `datchiki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(256) NOT NULL,
  `proizv_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Датчики';

--
-- Table structure for table `datchiki_promo`
--

CREATE TABLE `datchiki_promo` (
  `datchik_id` int(11) NOT NULL,
  `promo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `proizvoditel`
--

CREATE TABLE `proizvoditel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Производитель датчиков';

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(512) NOT NULL,
  `skidka` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Скидки';
