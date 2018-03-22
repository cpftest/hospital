/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.13-MariaDB : Database - mybatis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mybatis` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mybatis`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`id`,`uname`,`money`) values (1,'小明',900),(2,'小红',1100);

/*Table structure for table `dept_tb` */

DROP TABLE IF EXISTS `dept_tb`;

CREATE TABLE `dept_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(30) DEFAULT NULL COMMENT '部门名称',
  `dcode` int(11) DEFAULT NULL COMMENT '部门编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `dept_tb` */

insert  into `dept_tb`(`id`,`dname`,`dcode`) values (1,'JAVA开发',1),(2,'C#开发',2),(3,'销售',3),(4,'u_trg',44),(5,'u_trg',44),(6,'u_trg',44),(7,'u_trg',44);

/*Table structure for table `user_tb` */

DROP TABLE IF EXISTS `user_tb`;

CREATE TABLE `user_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(40) DEFAULT NULL COMMENT '用户名',
  `passwd` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `did` int(11) DEFAULT '1' COMMENT '部门ID',
  PRIMARY KEY (`id`),
  KEY `u_d` (`did`),
  CONSTRAINT `u_d` FOREIGN KEY (`did`) REFERENCES `dept_tb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `user_tb` */

insert  into `user_tb`(`id`,`uname`,`passwd`,`sex`,`age`,`did`) values (21,'admin11:11:26.294',NULL,1,6,1),(22,'admin11:15:09.211',NULL,0,8,2),(23,'admin11:15:09.597',NULL,1,16,2),(24,'admin11:16:11.907',NULL,0,8,1),(25,'admin11:17:46.876',NULL,1,12,3),(26,'admin11:20:24.692',NULL,0,3,1),(27,'admin11:21:21.496',NULL,1,2,3),(28,'admin14:20:41.258',NULL,0,1,1),(30,'admin30','123',1,5,1),(31,'cache11',NULL,2,23,1),(32,'AOP',NULL,1,4,1),(33,'aa','a',1,1,1),(34,'aa','11',1,1,1),(35,'aawww','q',1,1,1);

/* Trigger structure for table `user_tb` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `u_trg` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'::1' */ /*!50003 TRIGGER `u_trg` BEFORE INSERT ON `user_tb` FOR EACH ROW BEGIN
      insert into dept_tb(dname,dcode)  values('u_trg',44);
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
