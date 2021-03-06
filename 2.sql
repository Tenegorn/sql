DROP DATABASE IF EXISTS `store`;
CREATE DATABASE `store`;

USE `store`;

DROP TABLE IF EXISTS `customers`;
DROP TABLE IF EXISTS `categories`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `orderDetails`;
DROP TABLE IF EXISTS `orders`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;


CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(45),
  `contactName` varchar(45),
  `address` varchar(45),
  `city` varchar(45),
  `postalCode` varchar(45),
  `country` varchar(45),
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `customers` VALUES 
(1,'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2,'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021','Mexico'),
(3,'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4,'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5,'Berglunds snabbköp,', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22','Sweden'),
(6,'Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany'),
(7,'Blondel père et fils', 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', '67000', 'France'),
(8,'Bólido Comidas preparadas', 'Martín Sommer', 'C/ Araquil, 67', 'Madrid', '28023', 'Spain'),
(9,'Bon app', 'Laurence Lebihans', '12, rue des Bouchers', 'Marseille', '13008', 'France'),
(10,'Bottom-Dollar Marketse', 'Elizabeth Lincoln', '23 Tsawassen Blvd.', 'Tsawassen', 'T2F 8M4', 'Canada');
 
 
CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(45),
  `description` varchar(255),
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `categories` VALUES 
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads'),
(4, 'Dairy Products', 'Cheeses'),
(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal'),
(6, 'Meat/Poultry', 'Prepared meats'),
(7, 'Produce', 'Dried fruit and bean curd'),
(8, 'Seafood', 'Seaweed and fish');


CREATE TABLE `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(45),
  `supplierID` int(11),
  `categoryID` int(11),
  `unit` varchar(45),
  `price` decimal(10,2),
  PRIMARY KEY (`productID`),
  KEY `category_id_fk` (`categoryID`),
  CONSTRAINT `category_id_fk` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 

INSERT INTO `products` VALUES 
(1, 'Chais', 1, 1, '10 boxes x 20 bags', 18),
(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19),
(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10),
(4, "hef Anton's Cajun Seasoning", 2, 2, '48 - 6 oz jars', 22),
(5, "Chef Anton's Gumbo Mix", 2, 2, '36 boxes', 21.35),
(6, "Grandma's Boysenberry Spread", 3, 2, '12 - 8 oz jars', 25),
(7, "Uncle Bob's Organic Dried Pears", 3, 7, '12 - 1 lb pkgs.', 30),
(8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40),
(9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97),
(10, 'Ikura', 4, 8, '12 - 200 ml jars', 31 );


CREATE TABLE `orders` (
  `orderID` int(11),
  `customerID` int(11),
  `employeeID` int(11),
  `orderDate` DATE,
  `shipperID` int(11),
  PRIMARY KEY (`orderID`),
   KEY `customers_id_fk` (`customerID`),
  CONSTRAINT `customers_id_fk` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
  
  
INSERT INTO `orders` VALUES
(10248, 1, 5, '1996-07-04', 3),
(10249, 2, 6, '1996-07-05', 1),
(10250, 3, 4, '1996-07-08', 2),
(10251, 4, 3, '1997-07-08', 1),
(10252, 5, 4, '1997-07-09', 2),
(10253, 6, 3, '1997-07-10', 2),
(10254, 7, 5, '1998-07-11', 2),
(10255, 8, 9, '1998-07-12', 3),
(10256, 9, 3, '1998-07-15', 2),
(10257, 10, 4, '1999-07-16', 3);
  



CREATE TABLE `orderDetails` (
  `orderDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11),
  `productID` int(11),
  `quantity` int(11),
  PRIMARY KEY (`orderDetailID`),
  KEY `product_id_fk` (`productID`),
  CONSTRAINT `product_id_fk` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`),
  KEY `order_id_fk` (`orderID`),
  CONSTRAINT `order_id_fk` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 
INSERT INTO `orderDetails` VALUES 
(1 ,10248, 1, 12),
(2 ,10248, 2, 10),
(3 ,10248, 3, 5),
(4 ,10249, 4, 9),
(5 ,10249, 5, 40),
(6 ,10250, 6, 10),
(7 ,10250, 7, 35);




  
 
  
  
 