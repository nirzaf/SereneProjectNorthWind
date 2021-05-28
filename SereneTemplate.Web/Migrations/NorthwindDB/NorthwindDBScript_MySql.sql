﻿# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL 5                                         #
# Project name:          Northwind                                       #
# Author:                Valon Hoti                                      #
# Created on:            2010-07-07 20:00                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `Categories` (
    `CategoryID` INTEGER NOT NULL AUTO_INCREMENT,
    `CategoryName` VARCHAR(15) NOT NULL,
    `Description` MEDIUMTEXT,
    `Picture` LONGBLOB,
    CONSTRAINT `PK_Categories` PRIMARY KEY (`CategoryID`)
);

CREATE INDEX `CategoryName` ON `Categories` (`CategoryName`);

CREATE TABLE `CustomerCustomerDemo` (
    `CustomerID` VARCHAR(5) NOT NULL,
    `CustomerTypeID` VARCHAR(10) NOT NULL,
    CONSTRAINT `PK_CustomerCustomerDemo` PRIMARY KEY (`CustomerID`, `CustomerTypeID`)
);

CREATE TABLE `CustomerDemographics` (
    `CustomerTypeID` VARCHAR(10) NOT NULL,
    `CustomerDesc` MEDIUMTEXT,
    CONSTRAINT `PK_CustomerDemographics` PRIMARY KEY (`CustomerTypeID`)
);

CREATE TABLE `Customers` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `CustomerID` VARCHAR(5) NOT NULL,
    `CompanyName` VARCHAR(40) NOT NULL,
    `ContactName` VARCHAR(30),
    `ContactTitle` VARCHAR(30),
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `Region` VARCHAR(15),
    `PostalCode` VARCHAR(10),
    `Country` VARCHAR(15),
    `Phone` VARCHAR(24),
    `Fax` VARCHAR(24),
    CONSTRAINT `PK_Customers` PRIMARY KEY (`ID`)
);

CREATE INDEX `City` ON `Customers` (`City`);
CREATE INDEX `CompanyName` ON `Customers` (`CompanyName`);
CREATE INDEX `PostalCode` ON `Customers` (`PostalCode`);
CREATE INDEX `Region` ON `Customers` (`Region`);

CREATE TABLE `Employees` (
    `EmployeeID` INTEGER NOT NULL AUTO_INCREMENT,
    `LastName` VARCHAR(20) NOT NULL,
    `FirstName` VARCHAR(10) NOT NULL,
    `Title` VARCHAR(30),
    `TitleOfCourtesy` VARCHAR(25),
    `BirthDate` DATETIME,
    `HireDate` DATETIME,
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `Region` VARCHAR(15),
    `PostalCode` VARCHAR(10),
    `Country` VARCHAR(15),
    `HomePhone` VARCHAR(24),
    `Extension` VARCHAR(4),
    `Photo` LONGBLOB,
    `Notes` MEDIUMTEXT NOT NULL,
    `ReportsTo` INTEGER,
    `PhotoPath` VARCHAR(255),
     `Salary` FLOAT,
    CONSTRAINT `PK_Employees` PRIMARY KEY (`EmployeeID`)
);

CREATE INDEX `LastName` ON `Employees` (`LastName`);
CREATE INDEX `PostalCode` ON `Employees` (`PostalCode`);

CREATE TABLE `EmployeeTerritories` (
    `EmployeeID` INTEGER NOT NULL,
    `TerritoryID` VARCHAR(20) NOT NULL,
    CONSTRAINT `PK_EmployeeTerritories` PRIMARY KEY (`EmployeeID`, `TerritoryID`)
);

CREATE TABLE `Order Details` (
    `DetailID` INTEGER NOT NULL AUTO_INCREMENT,
    `OrderID` INTEGER NOT NULL,
    `ProductID` INTEGER NOT NULL,
    `UnitPrice` DECIMAL(10,4) NOT NULL DEFAULT 0,
    `Quantity` SMALLINT(2) NOT NULL DEFAULT 1,
    `Discount` REAL(8,0) NOT NULL DEFAULT 0,
    CONSTRAINT `PK_Order Details` PRIMARY KEY (`DetailID`)
);

CREATE TABLE `Orders` (
    `OrderID` INTEGER NOT NULL AUTO_INCREMENT,
    `CustomerID` VARCHAR(5),
    `EmployeeID` INTEGER,
    `OrderDate` DATETIME,
    `RequiredDate` DATETIME,
    `ShippedDate` DATETIME,
    `ShipVia` INTEGER,
    `Freight` DECIMAL(10,4) DEFAULT 0,
    `ShipName` VARCHAR(40),
    `ShipAddress` VARCHAR(60),
    `ShipCity` VARCHAR(15),
    `ShipRegion` VARCHAR(15),
    `ShipPostalCode` VARCHAR(10),
    `ShipCountry` VARCHAR(15),
    CONSTRAINT `PK_Orders` PRIMARY KEY (`OrderID`)
);

CREATE INDEX `OrderDate` ON `Orders` (`OrderDate`);
CREATE INDEX `ShippedDate` ON `Orders` (`ShippedDate`);
CREATE INDEX `ShipPostalCode` ON `Orders` (`ShipPostalCode`);

CREATE TABLE `Products` (
    `ProductID` INTEGER NOT NULL AUTO_INCREMENT,
    `ProductName` VARCHAR(40) NOT NULL,
    `SupplierID` INTEGER,
    `CategoryID` INTEGER,
    `QuantityPerUnit` VARCHAR(20),
    `UnitPrice` DECIMAL(10,4) DEFAULT 0,
    `UnitsInStock` SMALLINT(2) DEFAULT 0,
    `UnitsOnOrder` SMALLINT(2) DEFAULT 0,
    `ReorderLevel` SMALLINT(2) DEFAULT 0,
    `Discontinued` BIT NOT NULL DEFAULT 0,
    CONSTRAINT `PK_Products` PRIMARY KEY (`ProductID`)
);

CREATE INDEX `ProductName` ON `Products` (`ProductName`);

CREATE TABLE `Region` (
    `RegionID` INTEGER NOT NULL,
    `RegionDescription` VARCHAR(50) NOT NULL,
    CONSTRAINT `PK_Region` PRIMARY KEY (`RegionID`)
);

CREATE TABLE `Shippers` (
    `ShipperID` INTEGER NOT NULL AUTO_INCREMENT,
    `CompanyName` VARCHAR(40) NOT NULL,
    `Phone` VARCHAR(24),
    CONSTRAINT `PK_Shippers` PRIMARY KEY (`ShipperID`)
);

CREATE TABLE `Suppliers` (
    `SupplierID` INTEGER NOT NULL AUTO_INCREMENT,
    `CompanyName` VARCHAR(40) NOT NULL,
    `ContactName` VARCHAR(30),
    `ContactTitle` VARCHAR(30),
    `Address` VARCHAR(60),
    `City` VARCHAR(15),
    `Region` VARCHAR(15),
    `PostalCode` VARCHAR(10),
    `Country` VARCHAR(15),
    `Phone` VARCHAR(24),
    `Fax` VARCHAR(24),
    `HomePage` MEDIUMTEXT,
    CONSTRAINT `PK_Suppliers` PRIMARY KEY (`SupplierID`)
);

CREATE INDEX `CompanyName` ON `Suppliers` (`CompanyName`);
CREATE INDEX `PostalCode` ON `Suppliers` (`PostalCode`);

CREATE TABLE `Territories` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `TerritoryID` VARCHAR(20) NOT NULL,
    `TerritoryDescription` VARCHAR(50) NOT NULL,
    `RegionID` INTEGER NOT NULL,
    CONSTRAINT `PK_Territories` PRIMARY KEY (`ID`)
);

TRUNCATE TABLE Categories;
INSERT INTO Categories VALUES(null,'Beverages','Soft drinks, coffees, teas, beers, and ales', null);
INSERT INTO Categories VALUES(null,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings', null);
INSERT INTO Categories VALUES(null,'Confections','Desserts, candies, and sweet breads', null);
INSERT INTO Categories VALUES(null,'Dairy Products','Cheeses', null);
INSERT INTO Categories VALUES(null,'Grains/Cereals','Breads, crackers, pasta, and cereal', null);
INSERT INTO Categories VALUES(null,'Meat/Poultry','Prepared meats', null);
INSERT INTO Categories VALUES(null,'Produce','Dried fruit and bean curd', null);
INSERT INTO Categories VALUES(null,'Seafood','Seaweed and fish', null);


TRUNCATE TABLE Customers;
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitucin 2222', 'Mxico D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('ANTON', 'Antonio Moreno Taquera', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'Mxico D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('BERGS', 'Berglunds snabbkp', 'Christina Berglund', 'Order Administrator', 'Berguvsvgen  8', 'Lule', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('BLONP', 'Blondesddsl pre et fils', 'Frdrique Citeaux', 'Marketing Manager', '24, place Klber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('BOLID', 'Blido Comidas preparadas', 'Martn Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('BONAP', 'Bon app''', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'Mxico D.F.', NULL, '05022', 'Mexico', '(5) 555-3392', '(5) 555-7293');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Switzerland', '0452-076545', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('COMMI', 'Comrcio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123', '0241-059428');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', '40.67.88.88', '40.67.89.89');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Ors, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('FOLIG', 'Folies gourmandes', 'Martine Ranc', 'Assistant Sales Agent', '184, chausse de Tournai', 'Lille', NULL, '59000', 'France', '20.16.10.16', '20.16.10.17');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('FOLKO', 'Folk och f HB', 'Maria Larsson', 'Owner', 'kergatan 24', 'Brcke', NULL, 'S-844 67', 'Sweden', '0695-34 67 21', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'Mnchen', NULL, '80805', 'Germany', '089-0877310', '089-0877451');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', NULL, '44000', 'France', '40.32.21.21', '40.32.21.20');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', '011-4988260', '011-4988261');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('GALED', 'Galera del gastrnomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Catalua, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('GODOS', 'Godos Cocina Tpica', 'Jos Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('GOURL', 'Gourmet Lanchonetes', 'Andr Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5 Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Pao, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('HILAA', 'HILARION-Abastos', 'Carlos Hernndez', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristbal', 'Tchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('KOENE', 'Kniglich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', '0555-09876', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France', '30.59.84.10', '30.59.85.11');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', '61.77.61.10', '61.77.61.11');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969', '(509) 555-6221');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', '069-0245984', '069-0245874');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('LILAS', 'LILA-Supermercado', 'Carlos Gonzlez', 'Accounting Manager', 'Carrera 52 con Ave. Bolvar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(503) 555-9573', '(503) 555-9646');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', '035-640230', '035-640231');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('MEREP', 'Mre Paillarde', 'Jean Fresnire', 'Marketing Assistant', '43 rue St. Laurent', 'Montral', 'Qubec', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', '0342-023176', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('NORTS', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('OCEAN', 'Ocano Atlntico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', '(907) 555-7584', '(907) 555-2880');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('OTTIK', 'Ottilies Kseladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'Kln', NULL, '50739', 'Germany', '0221-0644327', '0221-0765721');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('PARIS', 'Paris spcialits', 'Marie Bertrand', 'Owner', '265, boulevard Charonne', 'Paris', NULL, '75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('PERIC', 'Pericles Comidas clsicas', 'Guillermo Fernndez', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'Mxico D.F.', NULL, '05033', 'Mexico', '(5) 552-3745', '(5) 545-3745');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', '6562-9722', '6562-9723');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da sade n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('QUEDE', 'Que Delcia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('QUEEN', 'Queen Cozinha', 'Lcia Carvalho', 'Marketing Assistant', 'Alameda dos Canrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', '(11) 555-1189', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'Taucherstrae 10', 'Cunewalde', NULL, '01307', 'Germany', '0372-035188', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('RANCH', 'Rancho grande', 'Sergio Gutirrez', 'Sales Representative', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', '(505) 555-5939', '(505) 555-3620');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', '0522-556721', '0522-556722');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', '(21) 555-3412', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'Genve', NULL, '1203', 'Switzerland', '0897-034214', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran Va, 1', 'Madrid', NULL, '28001', 'Spain', '(91) 745 6200', '(91) 745 6210');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('SANTG', 'Sant Gourmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', '07-98 92 35', '07-98 92 47');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', '(208) 555-8097', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Owner', 'Vinbltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', '31 12 34 56', '31 13 35 57');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('SPECD', 'Spcialits du monde', 'Dominique Perrier', 'Marketing Manager', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', '(307) 555-4680', '(307) 555-6525');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('SUPRD', 'Suprmes dlices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('THEBI', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', '(503) 555-3612', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('THECR', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', '(406) 555-5834', '(406) 555-8083');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('TOMSP', 'Toms Spezialitten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'Mnster', NULL, '44087', 'Germany', '0251-031259', '0251-035695');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'Mxico D.F.', NULL, '05033', 'Mexico', '(5) 555-2933', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('TRADH', 'Tradio Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. Ins de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', '(11) 555-2167', '(11) 555-2168');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('TRAIH', 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', '(206) 555-8257', '(206) 555-2174');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', 'rhus', NULL, '8200', 'Denmark', '86 21 32 43', '86 22 33 44');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('Val2 ', 'IT', 'Val2', 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('VALON', 'IT', 'Valon Hoti', 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', '78.32.54.86', '78.32.54.87');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France', '26.47.15.10', '26.47.15.11');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('WANDK', 'Die Wandernde Kuh', 'Rita Mller', 'Sales Representative', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', '0711-020361', '0711-035428');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', '981-443655', '981-443655');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('WELLI', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', '(14) 555-8122', NULL);
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Owner', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(206) 555-4112', '(206) 555-4115');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', '90-224 8858', '90-224 8858');
INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', '(26) 642-7012', '(26) 642-7012');

TRUNCATE TABLE Employees;
INSERT INTO Employees VALUES(null,'Davolio','Nancy','Sales Representative','Ms.','1948-12-08','1992-05-01','507 - 20th Ave. E.Apt. 2A','Seattle','WA','98122','USA','(206) 555-9857','5467',X'FFD8FFE000104A46494600010200006400640000FFEC00114475636B79000100040000004E0000FFEE002641646F62650064C0000000010300150403060A0D00000DC7000014F800001FC700003018FFDB008400030202020202030202030403020304050303030305050404050404050705060606060507070808090808070B0B0C0C0B0B0C0C0C0C0C0E0E0E0E0E0E0E0E0E0E010303030505050A07070A0F0C0A0C0F120E0E0E0E12110E0E0E0E0E11110E0E0E0E0E0E110E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0EFFC200110800AA00A003011100021101031101FFC400E60000020203010100000000000000000000050604070203080100010002030101000000000000000000000001030204050006100001040202000503040203010000000001000203041105101220213113063022143234350723154041163311000103010505040703090803000000000100020311213141120410516122132071320581A1B14272231491C152D16282B2334373247430E1F192A2531506B334751200010305000301000000000000000000110040012030506021104161121301000202010304020301010100000000010011213141105161718191A120B1F0C1D1E1F130FFDA000C03010002110311000001AD5B446C1B5EC6C4AEECC7412721D247155CD9D4E3D06495374259AD2C0FAF8AB5A19FEF767D1FBBBC122002E2AE0C0C9E013598523A3BB6890E9898B2D956D39A6CCD8B204631D4C4DD8C3076AAF9DD8F1C048F1AEAEABD1CCB6F032BE6553811E355AD9B45D1C61BC71C5BA549605B5F4C3B7C2489B5883D91C7BB3EE3A10A30BDF1EFBB8F2A4790F69A7A360D6D17F9A083531A331516AAC195558A0AF6296B3036B6216AE6784EFE59384173AD79DD2E267ACB7D4D0B673775B8ADBEC5022F46F92E3062ED1BF5A2ECD1DAB841AC5567A1755F4B360BA1B8AC92A204D8F7BA6C251271B3F3356DDA1B4D7C967B1448BD121AAF3885AB6E9F55AA82F66A25ECE3D52C9754967572A415ED4B4197C984E24E381167646C595535493505E6B9239C66ADE615423409B92BB0673FEAF9E1D283E646A8ADBF39A9C8D08B01236BCE31A51F78DD187E8F5CA0F317B6394BC8B6D620F1632D1A1A436F65AF40862AE78BB9E5EBD86E44A1EBE1454585D85C70A5AEBD66887754BEF03D416334BD1CAB51B0D946E11A7A0DB628147D4C2666494A0B670D6965FBDD6064EA14DDF32092F009B96051F484132AEAF61DD397E81F591697D222D562A907AD73CE0DD732FC276CA1016EE01D0CE8135B354B2E1A588091603A6DE9EB1D098FEB148D29B09BD06D896730DD9A71E0C47A9AC2497FB19998E95D18B09D05555CF9E832CDF419ED674643C2A6E0894AFCC7F4E72BB96668341F61496D4ECFFA417157B7354C2DA72231175AD45E1CCD3A89D7EAB25ECA872560243AADD831B176E26890AFA0ADA103E97B0735DCD6D00AE1B449D13CFA6869B9610A0AECA9C8BA994FD1594B54E0F44470D2A743A3AD65665B30057136D8F1D03F1B4DDD58BD9A7529BCDC66CACA825571FA78547DDA35CDECADBDD8F18E3821863DD16ADE031B563E3E92E34B7C6C3AAB41A201B5F47D04797CB728FB28E655C93A587A5889A4FA3B5F70394311DE82355684F33D22CDC8DF295EE1D8B5C41687556ABB99298AD7095144D07A38C74A65774A27D895024A157BC761198ECCF1BCAF40ED8FE9969D53E902A18E04133189D1E49DAF3D16697F767EC1D9F76FE3542B427C94DCCA93FA1B0F6DEE99534AE0F39ECD7C9D07B2E052126609E7FDAC4AAAF66EDEEE9A53ECB8F26B2B558DAD4C0B7F776EE8B73A8922B960C055BE82F33EDA6F0565D9964158C512E67F3AEE79CF0F5C716746A9BF11A3B8918F01393F0ECB832C858C569919A389F4B617A5B6E3052468C084E0315CD3BFE547B90DA25D6507603B4913B87A7B866696CE36DF38E1EAE8D7A823DEF1BB32B6EFFA76971570041D4D6C79EAEF47272EEEA983DD22733117C079ED9C396650E9F9BC0AA0326BAF251ADE27EE17066ECF4467E82EC2D2D467CDDE8FC6C0640883D4B072DF738746D8EE8328D11C7FFFDA00080101000105028E6056C6D0899EA59192A5F70B7D1764DB2E62876B23541BD6B5336CC9CBDD14C8D6424666F572D05C83D770BBAEE177C2BD297BC150C9D4B9FF006D883B18A08E5475F2F531B9A610A9FE3955E18B0E855885E9B85B2ADF8F265765DCA2F28A99FDA44C3850CB92D6031CB41C0EB685872B1F1995CBFF003D66311D3B2C31D791AA42F0C2F93B7E4F74D7C5723B501AD2E5650529EACE694485A50502E5AFD6B310D36E3F020727EA61729754C8D5ED6C6F1B2A93D791B31327E4BEB5AD9B05CAA780ACBBFC7C431F673A75A6AE0CD56A795566142321A1632A58B2ACD5EC36F4FEEDBC0EA96ACCC255AC983A2BB0FB13A0AD7E84D1D8B9DD180AD23B0A8CA1F1D66A87180827AB324310DCED20B136F1B6C83E4B5927597690092310A112B23ECEA49806138F9AD2B4FE3EBE46C423F90C4651F26FC66D7F98D79CD0D9C5705FB0F861B95EE6CE561D1EAE2B37F4FBA5BBA126B7630C9D5416239A29ABFB3261581F61CA8CE139307675184454E56D99E5D5D3A158497F5F1B1F6A84926B67AD0B9CE1232D559649779A3A376968BE0B0D7B3FD9BA50D801C2A73163866C45EDA91B96B9B85A3D3D2B35773AF66BED43FAE9C7DAB3AABFDB769FE4976CD1D17B742AFC462A4E144C0CD5CBEEC7EDA15D8E4C898C5F2AA42FE88A6B8B4EBA6EEA6886651F64C307E332326D6EEF491DBA95F592B6C541D454014746295368B5AAC33ED931D350EFB9C0E1A78B403A2B51F4B0B4D26242E53FE9B1FAF5979FAEB96238EC51B551B118662A84F914E66F50E0E12F50DAB718E9A2DBC14ECBEFFBB055FC99211229A5F2FEC56D076BFCCAD737169D2A954E3FC9D32FF8D58FCCA9B1D6BE0774C2A52969A363ED8E6F2924F292A412BA2D5557286AC5137B00A477592E122BFCFAEC334F528FBD522A2DAF1CB1909DE6A66E4FB7FE7F81D3D5DAB7BF6B28BCED69DABD0355698C6EAD297A9A711B7FDE0749037E4361DFE93773ADA3DB524D6D2B0CA7F2FD9CDAAD37E3DAB126B58F8E1727B41E1C13D803FF00AFE66CF77FB42A472C5A6D339DABA52870660AD74A03B67ABABB0ADFF973AC9F5FEFB4BFDC7B21A71C73BBC99F36BC0CED2B28A3CCCDF273A6AF2CDF35FCEAFB1D9D3756D6CE5D56AD90E503D4764B98E83DF0ED37631EB26C54A22017246430ECEF3F617E37A1C611585853D1EE9FAEB2147ACB2F3A38036BC8D92B3A9EC5AABDC6154EC34A8DCD2B2117B57F64FC8FF12A50B9EF91E49AF40F115F8244305616161755AA7749E5ADEE46FAD82D7D88541B69A355BE427AFF00B8B520D86D6CD1A1B0BF63656E094C32FE457C212610938AF72580D7B71D868281E2ABBACF0C5EE4766B98DE034AF60155AA80A28C307CE3E43FEC6CA8D8E91FA1F8B6BF59461A34223B6F83D6B2361A0DCEA8711C8E8DD56D899A1CA36BE4572F3693F4F209EADDA45EDF61CD2C6E143E4BE5BF23FC1AC4E78F817C77F2E78E2739E22FF0C96AAD7309BD5DBCEB74FB1B32C5AD8E05B8DA7539CAF82DCFC8A32E3A4CCFBBD16C3631D3AD7EE497AD2F8DE8A5DF6C6A3E8D28E6919F812DCD5C17BAEEEAC738D66B61C656B3E37B1D90D6FC4A9EB9D61966087E4361BAD878FEB89CFBD3BB0AD9C12FC9F95ED3DE99004AF8DEAA2D4526CAF1142DBA9FBC9F595B670D2F8CBFE4F6BE32C669BF90D5FEDF69FC5BFF0097F9B7F21C7F5CFEFAD7ADD455EFDEAD7FEF9FE9BEFE075DFF00C361FB9F917ED3FB2BF98FFFDA000801020001050247C7D57558E0F11CD9FA79E3B705159E30BD144FCF84F8BB27397BCBDE5D96503C10BD0B5D9FA04F0E77002EABA22DE03910B19113B0793C958521E421C1088E23394D18527AB0E478E4E472515D7CD98CA94281DE1287127AAEA80594D72714382D2987C9C882D2C77608F07977AACAC22B3C05944A8FCB891AA13829DC4B21098ECA28FA80810BB270584CF07FDF0461C8F130F363F08C9E45041613B862C72537878E0F0F6E42CF20ACA3CE505944AA8E24F251E1EBB780159E005859E1DE94DBE44F9B472E59560A89BE45A79CF2015D1C9CCC2EA9ADCA098DC7808455A67DB51C019AC624E071D90E1DC443C6F6A1828D4C18E13977AF19585D1752833868FA1D78C29C79AC700A1C65307D4B238CF3959E00F1E7C330FB7C50B393C765DBC6EF3E08F044CCFD79061C8F0D098DC0FAD3FA9478819FF0274539043D3E87FFDA000801030001050243C60AEEB2BC90E26871E36F8B1C80835639963C1E31C0F17551C68D65F8EBDB2BA27059595FA839B8F037C4D8D6308B97B857BA83D1F34E620B38330C8E5BE1842011451E1A535CBD54C305C533CC11CB3C30A08A77213576C0973851953859594DE07308E3B04508C14F8F0A36A2380E69520C10861C246F529BC0E583C8E49EA070139A501820F916E50680A5F3E1854EDC84DE2080384D1F5299E8E458F2BDB4C202ECA50B2B2B2B1CFA82820A9BBED9E2EC84472DF4722EC2EE9882990E5A9C3869E1A9AA27F529C103C3DAB082737C9CDCA11F9BB19C2014EDC70E3E49A99C4527DA3CF809C1108041C53A528BD61043D6C3B271E4E767809ABFEE341DE65E091C382017B6117C217E4C41326EC647FDCE761176548FCF8014144EF395A48862FB471204C7E1318D4F604005DBC94E7C71BF864E9F38EAD3F6828AEABB617E423304F932827BB27C6245D82EE155765A46107AC2735158584FF20F6F84B7C545DE6516F1D975057408E0271CA2163C25A88F0553F7F1858E0A9DFC80B08C68B08E4845BC6146DC129AEE4A99FD47007D0C657B7CC672C0870E38523FB143C785D51479ADE8D4DE2CC9C8FA051F0554C4C453BD7E87FFDA0008010202063F02D306246C7F19CD888F4D47A5F9666119D10E95177FFFDA0008010302063F02D30E24B114071DD2CD52A6AEF8E4202D946D0B5C47101A45632D34061377FFDA0008010101063F0246978BBBCAAAB10CC3C366DB0056B5B4F4ABC7D8572B9B6EE3F950A8AF1FF059DAC3FA36ACB73FF0BAC3EB46565ACC7876E980D962AD2ABA8D14ADB95115A382CECE60ADB15EB9A667A68AC687772A64E9F1CC86719D9F9D7FA0AA789B750ACCDFD93AEE1C3B476D02A6FC37A25A8370758AEA9558DA6ABE6E9DB5FC79566310A70A9546D7E090AE4043B06EFEEDEB31B1D70237EE28B1FDC42319C2E3C3B04F0EC6772C9A7157BACCC9AD75BEF3BBD3452810AB79C7AC2F0AB9728B1104647EFC11176FDC8B1D63EE3DF826BC9B1DE2084F1F8D96D9BB1EC1EC18D8793DA80E1ED599056F608C16478E0D424DFF00726BB1C7BD74CDA0FB53983C3876681646DF8EC2EC6C43B45D2B835B89280D2564A580B712516EAA234F131F4C7674CDCEB5A78A6CCDBC5FE9EC50273B1036B5FBFEEB155E68D68ADAB2476B3F1159BA25C382A3A32C5F2D6760ABB72CDAF97A3A41EEE25558DAD2F908FBDC9DA489C0BF729348FB9B6B3E1372E22D08175AC772BBBD64C2F0786D205C51EEA6C01318300844DB22C5074F4B3172B226E4A5EFCADF6DAB9A068A62CA11F68404228D2AB8204D4D5D4B17460D1BDDAAAD7AAF35FBD7D5EA6C23C2C06E2A0F358C787E4CBE9BB665F75D871543FB465BE8DA53B55AF73830BB2303385EB242FCF03866638A1DEA3EE5589B57E0AD7E46836006E084434E19ABAF3EAA47F52422EC458BACD928DA5246FE2DCAAC35A628C6FD96D572AD6E9E9698CB9BF132D1B2A9B26EB0AAB6E28A2A4D37EF2293353F35E1366690C9582B529A1F75531A9ADC1078E53C17312EEF54C111B915995BB1CDDE08F5295BB9C47AF674CDC551537908A6CEDF0F8646EF69BD69F2782402AB9703626D5350D86AA6EA5841C772018EF964EE2BE4F88DCABA8CB9B0CBB74FAA0C6C7A8EA74B4D9685EE88379F391B8AAACD80AF632A6F96919E78F943314229395F96AE63BC5C2ED810DB9F2D1FBC2E7602A8D140A815463610A438E52054D2FB2F5A4D147A8EB49A48FA3334781AF1B9D8AA8F13CAA5EFC4ED042A7E2BBD2A77EA39B5C1DD36549A3585879A9F105E4FD49C03D373E47935CE3A9757827C7A77545F5172AAB6ED99E4395BBCAE9E8D86571B0598F05F2A37B6DA5B460F5A3D79A36FA49F62FA5D36AFADE695148A16BB25379770519D649D49FC64A967D300752F2228C3866F1703C11258E2F71A9277AC8F6E5A5DD98DFC69F62D6F9799323E50268DB767319B47D86B45A497494C9A7CED8D83185D4B7D0E5FF2CDFDB89FA61B5B3A407312A86FD8DAF723A694723B7589B2C5A99A91D7A07378495C9ABD4135CF46CBEF1BEF0A923A479367CF9896FF0095B44D8A16D5F5CD2BD7A141A21EE0EABBD360EDD772EAC4E2C70F0B9A6853619F4ED133A2E8CEFBF316DCF6D6D69DE8E9B43D402CB64770B6C1628A61BAD40A14437AA2AD083C106D5D4575A9D23CD18D152780536ACFBEEE5F845DFD856334E0AC15EE5CDCA38AFA7AD72AA8B900EBD5F6762F4DF2CD2BBF999ED7D308C7E55D297C781ECD0D878AB3B397076CB172DA3662B92327D4A5D6EA888E2636B4AD49380526B354ECD2BCE380DC9B20C0A0738B6D0AA2EEC586ADDCACF16EEC30F1D9C0ECB9556E0BFE3B4C7F9480F39FC4FF00EED818C157B8E5006F29926BA164FAF88897541B19D4BB9BC3137DCAEF46276823E848D3CCE8A18E3657F7761CCE2BAFE587E925F7B4F2D48EF6815202CFAAD3BBA35A7559CCCF56DCCD342ADF1ECE509AD6F3497D97261188550ADDBF49A577F3125951805537EC3E6BAA60E845FF00AE1E0B81907BD945E1BED50C80BE48DCD2DE9006E37BA91D1A2B8927B93DBD32C8A0358A6FA5696378451DAE278951EAF50F668C4D4649F570FF00372EE1C87977A7C6236E9A06D040E8DDF57338624B5D6F61AE8E32C67FB8FB022C76493502D399D6346F29FA385ADCB4B6461D91B4DECE43E8D8763A426E09FA87E37776C6691BCB05F349B9BF9541A2F2F97369F265859A78FA9636F7BCFE10A4D46A22F309B471BACA9A3B54EAEE6DAD6D70B0289DAA9A6D3F9DEA474E0D3C8EB34F8DAD0683D29D0F976A62F35F362FCD23B557405F6FBA2EA7723E69AA6410EBCB840FD467363A95219CA6FEE545D46372422F7B9669586792999D23E81AC59DBA563DE7974D1177FA8AFA39B461BA99AD9661BF86D9A1C051C3D282AECFA18CF2B7F69DFBB6505E99A12DEB6AA46F535718765A666E639BB8594E2A41E61AF8B46C83E6EAD9A5BE2845AC8B35B85FBD4BE7ACF306EAA321ADD2690BA38E2A5F79CF427D6993FF00D934AD779BEAF9216E9F357A723A980A0A0E354D8349A2D54CFD6BB36B678FAA4863AC19492456DC568B47E67A6E93F9B2C324858D89ADB8BDB0E6B5D828D316B7E3FBD796FF000FB13FC23DA86C729FE377B7669FF8ACFD60BCE3FAE83DB12D57FF004DFF00AA57FD6FFAB77FE25A4FE33545FD445FACBF407B4AFFDA0008010103013F21C63B9C60FF00A12965B72CD56D84D50146B88414CB1BBF797FEC66AEBBFF00999AA5BCE0FD8C194B97F91968C4D655F6866439B747D98FB94B147D7B4FDD9DFF00899609D2444A0E6CDD8E2511475EECD35DC0E6D836DA6E4D3CEA66B12CD67BCF8D03612845F54A1E1E60A5CA2A986FDCA8D2B27807D42D375E413EA7CE26500166F2EC3E97CC5A8BCEF95DD19BC7B9D03A25C78B43D26A5A87407ABB9541938A66D2DF6CE3B5F12F41B2AF1DF3106D91766FE238CCF0DC0A51B95671DF995CA26ED7C0B2E42E5467D2E673999FD98847F4A07030891BCEDDF897DF5EEB831AF4650FB328B6C61330D46F3D897E4673937DA1C7B194FA431332D71DA62569B7DC8EE8F62602B5FCF12F1016F18F79D9200E5DE5E443A6DBDEA62D57CF4DBCC1A0D5E53FD94F88F91E2F68A0CCE2D5DCAFA8EE732BAF5E7506B01DBDD19D940AF672837CB32F93368CA1E52BCCA88235308DA835B83767A5D678845D0ABE2DE20218A6117832F0E7C89DD86FD30B859F2C7714F72D436D8C45100D77C9EA4B4F6F6EECCC77BFA97611D12AC6541287668866E491743640A8EC2A1C31A0219AE3F009FDC3AF2510F946BD4F04BA3025B306E05FAF6E908CE31CBEE8A45112B13C04341EB0911B87B331B67819F31259C6AF0C449E2834CEE55925A3D1FF00924BB99E868ECC15692CEF9946D37FFCE5598E9EC8FEE33ACFB92D331994F6CC7C26CA989E151B4F38A1F3368161F318A7B2EFDFDA255DC5BBAF596A2E8AD71C6E94329149EC747BCD8346734BB9451706BD8005D1DEB5898EE81A6AA7C2111C05F1E05AC4C8ADDC76C9BEF896639B5E07E860AA5E1BDDEFFDE8B8BD547C910F9EFAF02D897E85EF29E1F49F4DFB9E49587381E056E3B4282B8F157311B0E0956AC6237C40A5549301D2ADC9DF73701B5CAAE588C863BCC0C7BC42DDFB5D105C29EFB6676AEEEC5DF2434E6100C325BC1F0E20D9564A350AFF001FB9E8A3FA8F54BFDEE67C9381D0008F12A57BC4173C7D128F00B89FAA79466E22D00C389E826A178B63ED349C40F54B2A2FB23078545A14C738D2954D475D432A234F68FB80A3B9999E6F48C611F3950985BBC946CA4AB65A2E502FC74858CDE16183B1BE11A689C9997BD5456C10E58FAB94950E9631F71AA9993E8AFA41E0CD6B3B96BC35792EA568E0DC501CC9922BAC4C9F20FF0050683BD4E383E75AC277C45C6DB18E594454E364CA9F1F1056584E0C2597C47E426F03EF52A0E472747210583E9285B0CF33882AA68146CD2F86E591983BA51392F7981343E195664F9E3561F1304A619E614AB90C09CA5202C9561C037A94A3B18CA00AB0707AC1FDEF43BA7999E90F7BB2843B5C718A5B8CA9489FB0488F0DCBEEC3C6314C5655197F0276FB8E79D9AF94764A0AC52E6BDA0A01B26F6720D060EA004AEE60FE1E1DA4AF44BE892367F6267E33D6A4B4CB4F46D8F22E66D8207385120174253190B7ACEA1CFF00C1DE04C4C6BABB5C7B5DF763DC81C875691BC61F882C3F7439D847DDC0FDA6502B912C368F81029CD15A966383FA44CF283E7FA901E85D291898B95C00EABA61F1598C4784A11524FBA22CA20D8585B017BBC8CDBFD41E90A4778945D6310597B18530FA91DBE48308F77FD607B06DE6FCCB950F6C17341694ED807C4E262B8E6368279CAA54B19C76B5ED11D3EEA6013BF97D11B2CAE7CCC87E7897975CA09A3A1EB16DFF00C999257B842E9317AB7ACFFB988A946365C90709C4C1662396480ED09E212487A07B72BDC9705712F74478981B7658C16346E1C8E4D7D627DD73B4C3175F621C658806E97D80F04EF1D3E9CCCDCC3912EA5882DAD2465980CB9941C8A5C1D728083049D9F0CABFE712D09C93192DD1699414F040AE9CF6949C7068FF00A8B89308DB29404BEF728F99D29A734EE4D82051A94B2177DBBC66C0BCE94A66338DCE18602E5D674F7AEA3A9138706CE8A55606DD1F31F62E16C01CC7DF427A2152885F38FF00B31A29E9B27B427C0DF98311296B2AED605CB670AB429753F51A10894852B6F6446528C409BADA3E5B48039345B86686C216AEC07C2886C9AC726CF617E7A82E0DC6D172861F79DAC999DA04AA5B162DAF6F12CB2DFAC47F7BCF38521857688B7A772B757AAF88E8DDF1EDC3A3F89BDA9650F2E212FB2C8E7DC0262F95DD4B428A384415D381A07306675EA497C7CDD619EDB9C6040A84018C2C0B4E3B47C5C54342B165C31982C05BE26747507F44AF1F8A17BF301B91B6BDA9230002858B34B9EB62B905F06621E676212F55D45D8DBA7C3A1802D6025F79CCBA967145256DB471D00650DF54E16AEC876C6322E1BC2F447B4676CD9C8B7EFA55F8F6C75D99372B2ADD93D654402A9416F4781796FA4FB3FDCFB38FBFFEA7EF7F04BE9CD7F9E27F64FE4BBBF121BF27F0BDF3F80EFD766BFFDA0008010203013F218BF2A8CAE2A372D29330B065F4B97D18F47A10B2907A5319CF4394A74EE5F4BFC8C5849C1132DC4F78F494740BB8947F07F11E8AAF46BD40D40983A7CCBF32A8740E58752BAF12A54D6812729D5E8E205F530E91875328AB0E97973774547F19C541CA22FAB294B04DCB2074C9D87E211688AE0A25D63D2045B2E0CC70C4562B46584C2F79CF40C5312ACD3A5740934C474E95789A85409A10958E8474F3D05F84C6D1C170AF4B368C1D484E99C86A38F40AA8F40F5949CC30CBA4B30E858574197A1E9BC4C1B94612A0F45E9B2158C2E67D28E252A2E1299712693022526D3844017D48B96F43DEA9DC43BE0E2C144BD6FE361644A731F9F430BB0A9B3A2CC408F74B70BF329E7F7053D393FF00834333284D29053224A8437838428899941F81F8314F45123719BE929718B1B8371FC2FF002C372E1164A9625E0DB894425CC4BEA45FE172972E5CB8BD282DD54B6105BADC1E9715125535D0BEB7FAAF4A952BF025C61D01EAB1983E8B195F9D4D1D461D5E65397ABFFC7923D09BF55B4D5FFC7FFFDA0008010303013F21866A5C3F0A61356040A984A8AEC952A54A95087A54BFC150214094E853345A952BA2A6D03F00E945E85CD43B5052896E86A8623AFC36FC0212F801D3A20A59042C59E86984AE8C3D425CB2007E1AFAB21D096CD4953D1EA3F19F431E90F13DE4BE89195B2BA1197F04F4C30A08DD08CD43120560EB8949BC4DEA6163A8BC063AFE028F4AA4509521BDCF5471D00615DAC56E0A5F4CF337DA1D7748C190DC38C55A88DACAF78FE217654D93297229858A8C1CC198AEB5C8846F980CA0AE82C2DE8DA0C446A3D36943D2B18BD45B61926798A215D069D3815285328CA57847A5219DF4A3A1742437375B8837398FABBC1740CF4664D50B04ACAE4A8A3CCAD258B1B206EAA6530E8AEB3DED4232CE691F81F30EE12B5CB16CAB447F0F34608A5A5BE63BDFE92584751793EE52C87C7FD80715EC7FB1CCC26BFC15D78A2A3641AA49809B845E431CE17429D32F4F3F07A5CBEB7389E93D0B47880C7A22CB414D1946BA5F553F2C8837D0A49E519AA94AE2A98A5A27E06C53F0A64B2AFA95514E1FBF509484EBF04B255D04C4B7B4560C1FC03E47F3B1F834401B810EBB788421712DE83A5FE226149A7E078A0E9E25B87515D2FA5F4271349B4771E9A469D4DF18757A109FFFDA000C03010002110311000010498D3166E2D5968B2EE595D3269EFEAC56267A86A4EBAE841541499143A2FA471539C67CF05FF8677A3644FA424CA16A889A4EB3AEE39A122E38709C212AF46DDB76C4AA87F468B46AB07595C97130DFD1ECC92D81C7552E0DE2BC52FEDDC0B2DAE3CEBDA1FB4D83F452831461BF225BDCDB38F3C3745C435E0E56A0F584BA2F66093ABD730C9AD11DE92EC1C4204909F35504C5C83CC3474AF5592E5EAECF13C53BFB27BEFFDA0008010103013F10A01A6D63598A747619B2A15E3707C5A59ACB0207DD46E34695B05EA871C312F267509517E219A611A0B50FF0A0A6F57B0798902A4B0CD2D570210814C01A7D4C09059A155670D1BEE4484637092F0EC12CE6336C593EC51F065E1BB641B1E51CDBBC22EC0A59CE799B77338B12B14AED2E7668B5ABAB612A35CB0A109C2E50775D99A1990B19018E6E98ED991B6EC00D0E72415050D500F40CD608B87C05ABFA960E0D615930C735F465D7B79987859D6270A8C70CCFE63340FB0CFA44A05801A864B29B235265B2081D9537E2EE18F6A8E19597828BE732C710B3632F94EFCC734C789C929423CC6B7BEE554DF6460B06914118280D1B3B1AD579609AB5323505D34F111AB19652961371B047B1A2894F262A219C2F98D78577F333A4BBC4F471307F4B205A620BEE3ED0C341838E0C4B39BA6300E88ED2AADA73EEFB413165B5477881BB06EE5C0DA21A3EBB3CD73DBC8D94A094A614DEB8616F62D39B47ACB51BC06DA883C5CED9A8D6BBBCC45CB5D128AB78030E45CE2BCAD55C1A2A2F0ACB576CF598675D32B2D9D856E057149CAC68D191B65CF06553A817AFFC800FB10DC39CBE6B7F3846B4C43D0F0E7B454805E39E083BCB5DCE4B5A3B575627AC455EC5AC8A942F31AA2FA94286BC587C39825B128A4656AED59AE333FEF0EE20425FDCBD2CC12E63C84B780EEF78DA8058589F0B5757ED3588C58063F7F504D466050958CDF79586C97A20371906B2C7BA412231358442B6391C951368140820BACF6890975168AB7B1851E613A97BC97961DA40FADB51AC0A1EC9FA98211B74D32E2AA676A9BA566B83D1C74B74833F2D7A8905499D8422634771B0367F51C58E5E2690142EF8BD80A989148A6549933DA35CE84F653292C358B33AC4C0BA95865897B2A073D68C0ABCAF88548C62220099AEF2FC9802406EBBBBB4B58C6EF7533901628B0C7A04F521ACA99C50F86777361151161EA1F771491A6895EA593B536B51E0DC4576BC47922D0C2DC66A11281860032EFD628A46D6A036F17369BC195CAB699DC2091612B4AB00370E156A06CA38EF07711AB3A2D81ED2AA11E266AA8BDC106B2C64D6712FC4130DAE2A96D1634F6653BCF825A0F387E650A9CA39C368FD9507FA35A1D2571829E670EF0759FEE4AE1C46405D85E90B6B88C2CBB0594F6D9B83177F5197A8C06135F55425F613CA5FDC226C056CBDA0D8311234AD05BA29B31B9E65B204D0146EA555C48E1716429EE84A90D52B080B77F32AF3B29C8D6A64DCEBC8AA200E1CF9CC7AD650660D1AD8A706C221AA047A942B5BB35021572B2EB6EC1F744B4856A317AC843B225915D20D2CBF03BD30E392C8A33765FA546C1A429B9571FE1652A179A205ACA467235734963C6BF48768CD5EE2975F71ABB501A06F358CC3CCA7883B0381BDC6DAFB72186007456A8E655147D960080504B400607362E498C18BE22AB6227679A7D2385B98B7D45A7ACD1E4F044E5A14AB4F55CC781ED25427922A80A4C2315914FEA39F4456C237BDC229940A0F3E903A34C2FD9FDC70A5D0E7C08D6995B3008318DEF128B1AB818B6B9CEE6956D641E71788B5602FEC07EA3ABDDC1ED77F7090CAB564500D2C0ED8C96A0A6EB1C4A96B2D5AA306E6BA2AD9E28C625F82D3E27A23C9A3FD3CCA2041644E653838869F956112334A30AA806196B114ECB1DF19FDCB20D9DA0C8DB35D90BFA8D3E693C14AAF896FEEB7DD980E4327999C7DDF1102DF309384C6CE02EBC5D4CC408D5AF494864959BCD8DFCF9943590CC475CB5062372880143968BC414D949805001EE172CC69D46940FB90380110AB662DBABEE276490235D2DB97BC0A5CC60570507616C06FA2812C368AC576950B813428D17AB816B95ABA0A6BEE508BCC234B1639F0CA97823D8FF12E62869EC0D5C4AF1088B92534A7B54A8A293892E8899E19745ECC8EC4E21A584A112674CFA42982BC60B1F2EB2CD10474C7C8CAC29730795BC9E2CCCF1E128C9F30C0AEB0BD71CC5D5CC521898670F0B63FB86B26E9750C15B19E224E0B64BB41836EF0198857880A7415ED1A5611AAAC6C0ED11A9171B3EF2FE8C5487228678970746015B8E3DE5B40FD8BCE0A8B01EB1F1FDEED5C47A382186EA786F504A01B52207425FB8CAF8AB530F7C7AD4AB0AB88CDB8D7B431D79BF90FF516129749302CFCE1A2D91CEE8DEEA52327B1DBCD5C42584EC1089E8DB6657454A5744230353B1ADE6242E53D958AC01661CC7F2996C96EB02FC449EFE70162565618CE894D4BB211E10C45E808F916BD20B7BF23D30D225A0E6300352A8920B6E7163512FC09756126606B94D313E11D9DA2C1DE5D7D551390C7F32B1E9772AC8B0F5192A96A1737F5D05870774662448008B14B790335ED041F255ECAB056DE4E2527F5086EC011704565D017B105D5006CBC1F62FBC10AA86188C9E664CA1B8846FDA51E7017E865B7CBEDE64C092C0F99C8E05808336ACCA703570C008AAE1A6B091F3A5C614D79ED0718E439CBAACE480B29520E16EA6B4DB129C62C8A436B60716D7DF68B06E35E78CD0BEEC0E64A136E33C893D4092D77282E9C6D20DFA894A2CAD98DBD012DC9086187FF0052F3163CA0B816386F922A8398F2EEB8986CD9A5F6399840B6F6F6825ECC11561B7EE584A94376B1C8E35DE5E5A612D2A0A6EF4C319DA41CB6847631C9B72E7C4CC02E35F337507AC70C033B388222702BB6C6AEBEA0C1E2944D05B10C091D5D88C772195156B703B11A0D3BDC0FDFA427D4CFE2061AE90095C40181683BE0A9BE0362FC9C59298ED0015A6BF988D0BCCB3BE6A3BD12ACD9AE1FEE040EB05736A5DC6C8531751ECCB135DCABB60AB5014AC5417614071781C047E6920EF7A18EE469BEC0561792EE562E62C447B24A42D4170C11A605EE8166BCC084033B48F882E6231FB9C68173B0F7C43C3D861C080773129758B4BBCE66A26222FA016FD44A9257732735555712A1C338572BFDCBC46EADD15F9B28F3110158A9678CE55688ACFE7C0454B1C1C9C9662F4E21F6179F4BB14096022872290E4C1E51E08C3ED24DCB780A6562E38F58D19464F0DE61A16AF7D0CA7883796FB4BC205A610EEB1140979832D936D4BC367DC2994AD545F62E95B7F48B1466B257D665E2CF0C36358C3CEC82FF00242D602DF038F31FB35595195576ACB118CB8A08231B360A7924BB7A3A0567CB348B556179728E825ADEED65C4159AC9F70C8E14952968B22C232A148CB4A08EB6C6397115015600CAB1413588CEF8DBD8960804FB9D0B358B2091CC95CCA60F08DA32D64BFB8C145572C037E92B00B31EB1F52C7018A99DCCE0F2B800AA65A8E9D289C2B4AFDCDC3E4B7E3262E11107BE884EF38550E14526F9C32C9CA1D0840A7813850A390ECF8DFA05A94094B4098453DC44EECD14E0CB0696CC569141D2CE45A234291A016ABD82374888072856F59A3949A8AA0617609A98682D3015C9516F8F1C083441DA5AEF30DCB0C787016FD0443C63FD416590FBC7FB168CE57C5470A6D6B14CDA2EB6F4560901B570105482B037373CA0E68A8DB3C9EA7C014D89C4B6091CB22BBF270D88990C0A8525D82AB6119158C5C3ABA2B4D20439A58736A1631AAFC8E598C37B3C3F75FD93EC63F93EC9FC8768DB021B67F2BDD3EEBF7357A469E9FEFD2573F92EE84E401FCE76CDB3BFFFDA0008010203013F10BAE891832FA2613DE765052B814B34C4375A4738B0E85C589B74189599DC886A1CD018A887E223CC551B73036F32A74209BB972DD290E8C35D00E61B2744A6B8BD282C296199C1BE9C10BF83815D19C64C32CAF5379053316D444A6589ACCDC805AD9138883CC2E5C76C7ABE5629A8DB26D1DF4194C133C48D4CFF007153172ED2BFB21D378B51D2E5DB63AA9BB154B2DC45F42A971E2516623A21B4A1F73C88DCCC90211BC58B210620660459650E8CD2C6A28798D76CE25C062533CC171C463E33EB08C19844E60C8F4DC32CE32CEE14D588D5A82B643361D3975E09508F78353A985BC41F70AC7736DC7ED35D026A50A1EF6AE6D21A72EE59560CCE0012CAA4D70CA96956C44B770020D88AF310A18C55CB1D83E3A0684A03DE367C930E99DA0054010E12EB50155104A6E52A305E4984B7D0D421C3D264A9B40A9335335732852398C43804CB304DB20E68622025670B291CEBEA1B6AE16D2284205CF333D914200EC9D41AD39377889371CA2902B3D3296040C558954352DAA94E03CEAFFD8AAE50B772D72E20DA2D5231847CD673973F11AAD960E33CF8B96C943F3D1897441B9E21C05C4B412C290822DCA60B518E2D30480D712E4AD66A6254BCC45462F112A1A6B8F7F68B4B6DDDBB3CDF8841F72FCE6885D9312885ACDC64D3F51402B593EB6FA8146DF48DD116A3B32EE5D449B892EC902CD5298EF81B0CEFDA1E8A7DACEDE678465532671C0538328D44DA5A494E40951A969512259398278209967E60E0F88BBDC155328A86C490A2497A095537D0BCA9531095314F10CAE619771017861CC9DE6391930C81B8A988E8A71D50807A5F530AB30A759A0F351790E25E6FA3AC03BFD47370BC3A542ACB8E8827A493217789C4B12E66E3DAE8CC000AE98A52F49D67A248B9677394B5256A6D158A47786037380944CA1150212E54C41F267B4F074D9532FDC7FA8F88B302320BD3A3142E074210DCFE7886BFD879A6EFAC3A3F7BFA9B4DA689FCDA8EE3399CF421D3FFDA0008010303013F10196C0A4CBF05C4EC9576848CE21FF17058B9FE6A6D18F4BD612A99417D11B80ED2A04BBA96BA8D73BB802EAE347246CE2C8AD1C8F1DA3DDB3529C7486060B12A3A3025E451322D425DC621F620B88A3532631FA85B3A859AE215FC204A8C17D572F95706E54B498E1175D4438110975320658E0F089844A83F186B886B32864D262C52E4A58704B993262B29E44BF398EBA0C082D8B52EA399138A582081BA83338299819F08B5177E960218E5751A92A1C316631B2751E431F5DC779F69948097333652A425C806A138165DF0B8AB1C432305E71AF4889B8F309B09B40B4257CA72182AB88ECC17AB4CADC4B02E5D98312B0D206D99475A4836DB14A4D5F3FA4D22CF456CF89BFB32C0F597490BCA6220F58DB97EF99520AFD4DE74E85931D2A8A665DAF6838948A82EF20FEA1E91E677C051C8CA03484E2A097AC4F2508C0445E772D462336BBA5B352B398E844A5951453327986F31E1F30506837E91DCFC4AEC40C22A15890D5228909599A837C2AFAB01C902EFDA0AB67BC73FF92A5D77958982A2C54CF52D00387A2517918622D2A5D32CB5AA80E5B80E7A389CA4F872883FCF32A2ADDD5B02B351316A1C19532AA7799C12E8879BC87EA6555514E1E32F996D6EB9E22824824B1A080E8A67731D19CC17E87EEE680725EBB68E6531A35EF3C9A02265948941328DC77320BC4417CB2F6F93B77F981CF7C7CC64440F3AAE711D438B9942355C8C7156DD997F90B4A7E7FC400680F1BF36F9210CC1D9DFAF78CBBF3351B8E4840B8C6A66534A0368EBEBEF331247078DF985D22AB936D1852DC45A84E72336EA5C7C7A16F533085198ACC4F3436A5A771FA971D6019C301711920312D9A552BE6CDDD19AD422C8338E9A97D33D33C779E832CB78830A132153B68528D1142EA58866DC450D42BBC1254D4EE3B9EB572ADC6A64891180CA08FAFE7F097365F77F538A9572A6A2FC45BBBEA6E33E9D44D319CA8C6211BED703BA92C53286510CA57A5E22AADEFA724B08CBC63311755C4C4044BBA0E8C4C2BCCAFF00188DBEB8EDF1153D713BCB60D147437309A8639E9A985B449A66765660510DCB78A27DDCBAD86C8B3744B3995D0044A88EDD328D77E9236CD3B9B7A19FA5FDCDD349A93CDDCD99BF477D0EA69D1FFFD900','Education includes a BA in psychology from Colorado State University in 1970.  She also completed "The Art of the Cold Call."  Nancy is a member of Toastmasters International.',2
,'http://accweb/emmployees/davolio.bmp','2954.55');
INSERT INTO Employees VALUES(null,'Fuller','Andrew','Vice President, Sales','Dr.','1952-02-19','1992-08-14','908 W. Capital Way','Tacoma','WA','98401','USA','(206) 555-9482','3457',X'FFD8FFE000104A46494600010200006400640000FFEC00114475636B7900010004000000500000FFEE002641646F62650064C0000000010300150403060A0D00000D0E000013E000001EA900003004FFDB0084000202020202020202020203020202030403020203040504040404040506050505050505060607070807070609090A0A09090C0C0C0C0C0C0C0C0C0C0C0C0C0C0C01030303050405090606090D0B090B0D0F0E0E0E0E0F0F0C0C0C0C0C0F0F0C0C0C0C0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC200110800AA00A003011100021101031101FFC400E500000105010101000000000000000000000502030406070801000100020301010100000000000000000000030400010205060710000103030303040105010100000000000100020311040510201221311330221406324142331535233411000103010503090407080203000000000100020311213141120451611310207181912232420530B15223A1C1D172337314F0E1F16282B24324A263344474120000050304030100000000000000000000300111211020314050022260704171130100020201030305000301000000000001001121314110516171819120F0A1B1C130D1F1E1FFDA000C03010002110311000001D0940FD5A7E47EE818CF98F37B8533BAD92E9C71832E498B56D0DCFB9AD91126F73F6D7D5B1E08BAD7B22AAF99D51FB34E548F5AAEF2FB0A13142B6EBE4233AC4FD099D666D85726A795F516D1B8F492B64B556BD96BABE69584AABFA5D580C6999318133346644D020B00F048DB952ADC0BC5A8FCFB7388113875D680E56BDA9F5DF362C35D5A6A0D55CDC9ACAD370A36BFD7A1A06070CF006586120A5CA0B58A975392620BA4FA48CCABF65FB539D462554449E24F6D2D65955A905C3309004C0C0B0DE6E0848316335598DD5E3833ABB1B8BDD374A93EA980C0AEA0C0921A4F6A7459A234B632E932304C8B0B2EDE442A71EB9123A91D1E68E7F9B65681AA970B97ED5E03A59DAB0412D6F97D2D0D576E5B85BA0B8D1B0340C0803099A821D799A7A85EB6902E873751754BE172BABF65F3BC5A4DC9E1354F99D1B1AAF1EB265CAF43193B312F7B4A97F6B390B606B40D2C1345DA401FE66FBD6E6D8E5AEAD52F9CE84F554DAD87E2FA3B58728C31CDC5771A6AD633767A8AE5D9730A7A8E910E81E61ECE4E7B4FF2F5EEB73AC1799D51C9AE73CE3E91D955AF39EF6F43E65D0A111B353A9A370574656C8395D9AB96ECF005D708164535BC68BDAF336CB84B5526EB9D8794CB54970E2FA87B9F767E8A8A6755841F20701864196F1FB5103B26513C3082DE473D9D53B5E4EE1AB7E52B78E7A0DFD2E44AB3A7D427C7EA890B5061F329D0BBB7CDA58DBF33A787AB85AC77688FCDC1EC71EFFD0E45A75722EA36B38782FD9266B35803ACF13BF6EE7375C60EB683A1E96C4C7D3973072851F04BB61267A2886EC79ED235562DDF9222564A3A455BFAA23AD649E63E93ADA3C6AE9F78FBE4D0074E6C6ED93341B5AD013B2E419EFA4F2F7D286FFAD16B8EC9F54C7AB11F3727553765E57F39F59E9A43C9169539AD4239B3DCF49BC43605086D00EE215FED706F999A46ACB5DB5249958DE84CD5CEBA000F45C83C8FA6EB80F3BD20B708E399ADE59AD4663668EE03174B51BBBC392C73EC589A96AC9DC6EA9F9ACB761F2ACD8CFC9DCBFADD144F0AD277CC723AEC7C1B11AEAA27856744E94E426DBDBFA3E5661B9A4AAB4BB926E33541B1A866196197D43B1C4EA7D606C1C0D2F0768CB8A5FB09E863CDCB01C89894D2F4FA47A3F350FAA1772D59922A55EE576F7D209B522AE88B74F9345F4D8333134BB1621A5E531A5DBD0A4619203E9ED86E274B37E26964C64DAC85AB959D45962895D6FC7788B898159FE3D1FD2ABE33B3A133A047D2F0C88B7619237090FA4698F3BD733CD3F0060A31A5C66E5C66FAAA996BAD783D8F585120739CE7B2A18FB716C50088A261BD09332BA24DC3C19CF2FD438F3FA2C5AB74C18CCB7EB254CBE44D08AF1FA7A0B2AE6E17308BF51560FA86EA08273636D2FAB7EDC556E4E1AA7F43C57468D0E87C2D40C1BEBD9ED2FF003BCD3733FFDA0008010100010502D0697B742DA389971E4B96CC15D5EFB229CC0FF73246B9ED92D8892D8C9FF3C51F3DB476E5B25A0A306F9642C65ADA5D5C4B3D99ACD8D9DCA4C74F1B8636408630164D65248618DF6B134072C4D18B8B5A2CA46B80DF9199B1C58CB192DACA3883D0B0E4A4C5C6E0EC4C6D12635957630157B8996551E23C4ADF9467C946D9CEE128EDB4AB2B517994B88FC8D8E300009C9C9C02E213DB54E6857B6E6586D1F33C433DDDBBE078922D78AE29C28307ED91C7A30AE48BAA9CE4E7549E89CEE8743690BD4AC9A0585979596B4545764B21C5CAD0E12973637AEFA49A3BA878D5B42266728FEAF04F141B02C9D7E25B3CC6DB59CCAE882EC9D2757CB40F9681D7345E5715C8E81C15D4A443F5E944B8ED6A81421F336FEC6491626DCC42F64918DBD97291B6EB259C06DF377F1496792F96AEAF9F0B6E73591E6DC96524661AE324F337799C6E5B8E89B05A576029B23989B753490D83DB22BF33B5B97C37D96E5AEC24F028F193CE7EBD88F8B8ECEFCA8E5B83987AC75D7D8E3566F374CB83421BE275B4A031AF40E8502AAB251DCCF7D87865B6B6255C63E3B94EFAFD8D6CB15696AA265197D6AC9A56D8163A264AC4D68AE5DDE38E627E45992E6B102AA8EACB764E9BD2567109EF6A9EE608859DC36EE0FC5972692B4C64B42A2BD644F8AD9D33E0B3FC588A0F55D02B09DB5698D3EF3DF717BC239E67DDCF71659382CDD9EC9566C85D3C174AE16770278EAA4844A8757DAF40D72E4B9AA68D59A8AF7E2FD365BB38D9595B9CCFB1B87B6B2B62F9FDB7F6335CBEDED5D037C655AB24B79EBD66BB642D839175B5557A54A28E8D5CB8B3EAB7A65B9751CFCAB259837EAB9A9DF1FD78B6DA3C4E35B1CB698A8656DF670CF64F7CADE40273BC92D8B47188681108E8C4E67387077ADB1CB81EFF001F211B782B8C9B98C7E46D254D6C721642C2C3EC175351ADEF62F50F50B9208E8C59EBBF858C94FBB0FF00632D6DB4EC9D9C6A2E2C8CE64C6480F8648842D591BB82C6DA1B8F9912B27F5824E9E55E442608A0A26B5ADCB64E6C94F275D313F62BBC5BF1998B2BFB775CC2D125EB1326F23BC8C8DB9ECDBF357B8F88C562E56B251D0C838998046E9807F60D5DD47075CC97C78B71A993B91547A2B7BBB8B47C3F69B9567968EE109DD1B7EC39E65CC585C73AEEE4F4533E89B71456F92A29F25ED7643935D9173531D64C8BE4406F7393D87F5321E2F79AE85382E4A8104D0BEA9908F1D70F82DEE8DE60E7736EEDEEAD1D0DCFBE7B8AA61A895E2B1BDE228CE4BE7659993763AE2270D5C7421513535596427B5C8C1F2A780DCBB9437E6564DF5FC3DEABEFA9E4181EC9AD54B3B797E500763FFB5BF8F18EB1C8C1E19A414716955474A201057371E3970F2639A3C934C2E263048CBA92904FE452B61BA8EFFE836B707EB9FE7CFF00E966BFF05DA9FF0021DA7DA15FFF002E2FF924FF003B11FC98EFF46DBFCD9562D7FFDA0008010200010502D8E3445D5D00D8468D29A7AFA04A24B8AE4B9AE6B92AEC081F41C9AD468BC754615E254D392E49AA8987D03D4BBB00868753A075103540D0EDA68DEEE4D55D4E8515551229BDB6BFB04F726B90D0EA7588E91F6DAFEC9C5355112895C917AAEB168CEDB5FD8854EAF345528008B7408342A046899A0EDB4A63EA89F7393486A3282B9203926510E29C188A677286F3ED7FEAB822D544C6F4EC6AABA47DEB57EF91A8F7680AA9CE099EE43A07F7D289A543D5C37C834E6B92017146AA88843585BD37BDB55280DD005508BEA8155D9132BE94A8209AE0516D17145A02F6EAD141E8B86A1794A2750A2654FA32BA8139A82017154D40518E9E817271AEA59540F15CC2E5A81C437B6FAAA9DDE345B4544D1443A9DEF93A7E8C1BA9B23E8ABB827745FA311DE7403A7E482E61731B1CABED8C847D18868421D555725CD07A957ED8FBBB51BA3ECFEC3B9EEE410D3FFFDA0008010300010502D8C6F241B4F42409DE8815428002805C5715C553572288F41889402F251099791072AAE8884FD1C10DE3A0622740821B084F144687D0726A2A880402036152E8EEFB5BDE89A116EA34086B28D1DDF6B3BA684740100805C1535974777DAC40D157A462A8342F1A0D459454442A14549DB7B7BDC4218A9ED8E8BA3D32DA8885249D427F3A33C89C13FB774778687407B51364A2F2145C9C7A83D2A8E87F16B4361DEC928C4535A9AC253DBC4FEADED445141BC8DED1ADDF0B8A2831358BF11E4694D635001553C5114C2AEE4ABB7C2FE26AE72FD2372797141BA15C972A82A4938B7D068A9BB8F804C29EBCD22F952A6CB33916947A68F353E84668EBA6736208A6C4106D1172E49EA67F16FA38CB7F24A54F02228AA9AFA2E68A2A95372DE327A0C6D55A45E38CE93428B5712B8221156CCA9BB772977F150B47245108F44E6828FB57309CE4C88BD4CF1047BDACA2AFB98FA3AA8E8539AB995409AD09A164855BC571D69B3F72B77738F47E842A2620AF9DEE751A9DD550AE2760A2E1EEE0563DDD0A2D55474E280416424157A0A9A16AA2E282FDCB1FF939053A1DB41A5FFE48F6D1C8A0BFFFDA0008010202063F02DFDBC926B8ABEC4FB4C69D9B7C9F31FFDA0008010302063F02F4A49F14910A336751D8B7339290D645EC190D9BD90975D1B0E35C8EA3030258C4FDBB273FC4A3A10A852562E70A4A5D29639485216956B938D2095E24A27DD67FFFDA0008010101063F02E662E91FF86C68A945CE706906B47774845CF95B2305CF165CAD7B6469AB738B3F82B2D63FF106CAF997CB1F26469A8D8762D3C97010D0EEDDF4A90799B98FF4D1AA38B2FF008DCE277D6C46137B1943D489F1136377576A6FB0716DAFF285C79230E26D0F757E809CF934F5DE2CEBB7ED59A175FE2AFEE0AA59981B246E050A32ADA10F6A70AD8FF038E0429086F8728B7A289DDCAE6A06545FBCA8E28892F36CF2BBB69B827323B69E3936A6FF00C8AA0BC61EC0B736532582969B7604CE2B32388CD92F36ED2B30ED56DAA9942EE8FA15D4DBB178457154A772972CB97336B52D1891B50606D183C8DC56692D3E56A8E94B5DDE1BBD8333FE1E9CD4EF3804D60146A000BBD83B2121EDF0D13812ECC3CA7F82A96891B5A7EC531EDB88E713B1677DB23DC49DDBBD9DD949C6E4E697671B1F8F5E098285B427BAEBC7389069BD39D836C06BEE43673ECE5A1B93A271AD7F0DFB3729B887B81F48C7BF9D253122BDA98D7798DDD2AC356E0392F5E314C79379E6D15458F65C0E23626B9A6A331A6DE71AB33B45ED4E95ADCB93C112756FF315961706BC8B1670F320C42F165070A8438F2BBA2A9C41B0016A2402E7609D648D186505011367326D70A0FA135BA97B687CAFAE6EA4DA58704E8C0A6F0B4D18A55B1B7339B89A73AAD7655FEC558F748E657EEE3D6A47B6E072F6273F4FA63A89E948C5C3B519755EA9C007FF005E2395ADECBD3F89307486E92A4B935A1EE73C5CD015350CF9C45A360DE8C5A6B00B4A7B9B9C3BC81BFB979A6A5BFA7923BEDF8931CE8CE9A56119E3B9455DBDD557D81C6B4098D183473F49A285DC26EA627BF89BC0AA6433538AD273D3A558BE7461DF7AF59B208DB8D171218435EEF3629EA4CE2C2BBB760420299B6D8AB8AD3BABFE66AD29B9B47BDC3A90279FA7D55D240DF96E1D8E0B712AA55E8BA67801A9B331B958EF0A76FB2A8E519C628806EBC72576274937874C0CA06F0146F9CD6490024F4A1CF3A47D9C405CCFAD1E11AB5872F62732BE155CD40991839B31B1A98DF48D508648ADE1CBDE69474FAE0C8668CF7DC0F71DD09874D94371778BEC5C769F9ADF100AB73B11C84386768B4C5F16C4D662DF121CF74DA02EE3C62CC9E2E90B551EB9E5DA98F54FCD5BE8E00AA5DC504665140C7652478CFBD710EA7F5339F36C546D9D29D4CA731AE6AA113A8FA5EE08AA5F1BB62AA7508329B1AD40DE4FB0738DCD153D4BD5D8F3DE90B6703AC83F5261F84D5658CE0BF53A4F55769E6CD4E1389A53AAE51BBD4E6999A8E27CC71398500DBD2A0C9EB0DCCE70CF495A2A3A159EA4EAE7F0C6ECEECB93757153706368D0C67BAED45B21EC59A500118723DFF114D3EC256569998E15E90A17C8690CD5D3CCED81D71ED4F8CDEDF72B42B2C45B23330594E959506BE1B7DC8BD8C0CAE002CB94742162CA2F7FBB900439EF373F53F2E2FACF6276C2A1D2EB5DDE8ACD36A0E23E17A0E1D6158ADAEE46D6AB458AA6F4FD4EA5D9638FE93800A3D5529C619B2ECE51CB7F2BA699CC6451B4BC979A0B119A5A36BF870B4D5AD1FCA8AA14DCD5D469BCCCC40DC84F04C1EDC771DE89CC2BB11F3515765C8BDEE0D005492A9112341A53481BF13B1795A561BC462BCCB4AF172C79B339F21A32260CC6CBEB82F517B7420B7865A739ABA972F723CBC4D34CE85D8D2E3D21535356FF00D8CB47585DC9A396BFCC2AB33E58A08FE27108E834329918FF00FC9D4ED1F0B53181B58A1A3E776C03EDE652AAF57F27163D4C7571A32478367F4A64675CEF95157811B697AD5174DA8682FF0019DB5F72DC6D1CEBB9642F88CC666819074DA893A37455F383459B48FE37F21B0A2DD440F88EF1F5F25EABC9070751A478CD76379C54B48F4DC3E10CAE17E0A7EE4125BE0EBE84E8DF1F0A588D0C7B3772D39DA76699A0C8E6E29AED5EAC318C19A8DBF2FEE4D6FA7373C8077DF27848DE427366E03C37F1A036967DA1712360D33DF73E1BBB2E59B48E6EB19834775DD8570F5113E17FC2E1457A878BE9D13DAD92FD3BAA0762CAFF00D469E5921EF5B65CA70FD64F1D1D52F1B9DD1FB76A84B753FAA8E785A592DC6ADB0828AB16FE74258724AC3649B028BF51AB7CB296E60C1BED2170FD3E310E95DE19BA70EB5047A19449ABBB8EE167DC7D171C6A0E5AFF00B9E9ECBDA76B531EC7CB2B241F2E52681DB9DB0A306B34DC784D8EE252AD3BFED464F4DD63B4E4DF0CBDF03AC5A99F98E4CFCA77F6B96A3EF9FEF62F4DFC97FD5CC1CDEA5E99D0DF729BF2CFF72D7752F53FDB12B57F7FEC52FF00F38F7047F2D9EE5FFFDA0008010103013F218741A8D10C55F4FA441FE9339F74EE0159142DCB8BFD44A1DE10A714EDF2454E58EEE0AC36772205B0C5D8654FEBC7980BCC3FAD457028764F1607F5110A6FB0DDFE350331C0B19C3F1297EF5DB9785DCA9F359EA3A54A84124232B45F98A36F9945629AC7DDC1DDAA945CF631174EF0287E42FE63A753B163BF98D35B09BEE7C4B1A4EF6B81F994254FB4B3DAF312CB08FCCB2AD66EA2791DEC20D867D488AC1DAB33CA97C5CBE0EB63DD8771067B7334E87425465EFD6AD638506D751E0B7857B3C01D8259D76A95CBF30347BBFE44AA863CAF3C777B4A8A2B86D4284E2F657A4768A94A615FF50E990185E070D7980CEFC725EF668F898A80729FF25D6D61CE8E9A8EC269310EB5D496B42E70D0F6EF31886DEC7A4AB81812A2692B39F10CC1B41638943857DCAE2593159F977FD41A0001812DE720AF33460BDBC7D222E0D0B63B12D1BABE41E901B1AAC33112A74954783A74CEE0F0C41689BABB7A91D07615D0F4D3EAD42B8F985F83D3B7D222C18D2B41CFE2585CB6555F261A3FDF6949BE998E9837881B9A625B7E9289708C42CF596036A59B0D8ABB728259BD9BCF678875B8A1454E4BB01FE43F128C8CD2C5FAD46F8DC706F7114BDC40E832FE0AF6FD4B0447B45F7CB8D8046CDB0E4970169A788B9AD5EA16FDC46DA8F7280D61F7843A6FD23062CF7BB4487ABBB9D08EA644A9C9CBE22BBACB4325DA2DCF90658EDA0FFA54D7931C5F198B997AB16EE1660500BCFA46E2EB421F14622C00DD820F77EE5258DB62DE868983B12C6F788595E3353E585D568982C985BA5CBE83C2977252AF9C68B250E230E5A8AD5ED398BA1B3CF64BB19B294ED90AF784DF62CC55E8577CDCC4521A8159CE5329A3CA544397E68E0B980ABBC16F3C0D7AC51757638503B31CC6CEC1FE9339655EE82A9CA2F7C54431A267D25FCF4062EA57691134C1F9080C8A069B67DE51DCFEBD610A056D3F8108EB1EABE97709CD0A59A7ACD4729282144CEC89B8B6A984201556ABF86BF11C16A57B7A41C5B07CB28D2845F11F76650142D81954211066C94B0FB982CFAC0A26C7E61AF33C470D0F4976C652702A7E68C5B0AB6D6A8B8D977FCCCE5B66105C4354CE93999D142AAB985C50550AC3E08FEEF04588AA146065A5DFA661DB48D723AD779C526C2BDFDE23A1A06325A077559A14D1D9B69E2085AB376729D7BC161817965F4501E606A0C6908710C2FE94C8A8151359A4728EC776068780F422A5E25466252348C041A8E0978340A5F90A9C3890486128AE6318288539013F4CC6E61D55C5BD26E50EF45B742E60E40FBD65FDD5A2A2CD8163588060FF00EC4FDD7C1ED048E13CC880A7BB39A0DAFACA2AFB4B740583A2CCA6E4FD2173E7A0BBF670B998C0AA17933BCF531E1F1460C28DF64E5879435C95D836A162995E5722016DEE7BE05178320F7D5BDA15D09056FBDC43B0EF1FB86878E23D066B704A86A03E8227E26676170DD91AD26BD804610CB84E5699426E49430A6CA8799C70EF11945C83C9DD82832E35FBC11639C265B0707FEC55C583FA8A83060E0C04328AE39CC11CABBEFADEAF48A89FFA4D617F4BC6FD3F31CFCDD730C7F844EC036C07BC2871406A29C8CC6582E206C0E3BA601CABA8DAC516BCB8F68E230651E947086509D45EA161C1BF5E25152D1AE1CB77860B5C8406D108FBC3BAE09429FE2F203654FD80B8A5386FCCC8AD320FE22CF1B1C0195809A4F677E81D8F5981BA57A97FD8EA190F31C3338E225693220EA52802D744AC0E823B25C1EECB76CA24C5553DBB7EE64741A768A8A1C25D712CFCD55E8F6182CF661BA8F90F6B84DE89417B8DFE2393ACB86F9A985B8EA3F40F2C647488C2B9F56220568344A30D6E301EBAFBCCCE30969DBC441CB9801FB52AAEB1FEDFA8E6079AB74BF7BFE76982A51623E7EEAFB6E587AAF86042C22371364B732F6F6EF05D5ABEB3B50F0C9CEA192BC1366E95AFE435190A8D60FDB50206E583DB4621BC70686A3E5625817A83604820E535DDEDFF00AC6556E713CBEFD2A0BB6C53D25ACCFDBE6DAFD8CBFE15159738913F1D40E9C7A198D52E77E933B28252F65784216DE0C2B3B07862A38612EF279098A656D6FE6F6A38DD88FE27E6589DEDEBF32CBCA234376C8B5F8DFDF0CAD84B614C737AA82260B0290F0FBCC6ACAD381874D54ABF0E7E652BCFC468B78EC62C7ACAE8CDD36F82A2D59B2E65628AB60FF6C8D7C755C67259D864F883FAB6CDF93B1D30EA894EC18F21C41147417B20FC90C01335768B8F022406C6CADD51FB4FB9773AA8E1B7DACF47FAE6A6B71D751BE9D31F69ECE997DAF9E93FC046B33AFD8C27FFDA0008010203013F21FA2942507A5570D44B3DE50C0953D031FAE83A429250807AA434F43BCC65847E87ABC4E4658CB740A25C94C112ECCA69D07EBC783A74C47A10EB49625089F495D090EF1622C745DC58A2C714229504CFE954750EA60E9652BAD061ED197FE1874FA2AD439E8F24AE343A166532BA071FE0A5DC6B1AC4B373970388D8C16F409C1C26F2E0AFA82C8F8ED2C515F136DF29A4220876E8B3E614C4DE39C18B12FEAD897175A85B2CA26B72A51B8651A47334CC53B43EBB18306CB10C339986FA0370338E84352F67F803ECCC7116C5D4B2625CB39C7D2612BB778753E9CD61D3340A50C432672A254BCDCB96EBA1F5EA659FA06154AF727311A1E636CA94875BFA489896112A0434435B2CE23122C4CFF6E97F4BD09EE3D2DD7460E9B1D19735003D187D55625CEA5E2CD080265D2A7AA4343EABE89E258AD7D06625EE55D458236981FAE096E13D709D7D23D16C58C5698EE09D1847A3054DCF9B0E7A9D0FA1BF0C2A54DCA60D04957025E5292D4671D6BADC7A253DA1775589667995CE54E20E08E8EDF10D7D7A1BB08FF836CF59A7A9F6CD233FFFDA0008010303013F21FA1D40150E8CE60F5E4831087D7726BA5FD4BD426653D2250C3E93A1B65ED11894E80BF42902021AFF0010DD8B3D25FA518E96CB50043EA3734A873D194A259D00810825AE0DCC3EA1B860FA5A83D35D4AEB38667F5A09866B3700352D96C04A1311E84CFD66D0A0BC064C7B882E276506131B821D9868E8388B9832FE8559442F5A83043C944E0623355CB798D4066550F0216E057C7C54AA090A419FAD32DE26507744D65F1D6A5826374E51C4DD141BAFF03F62CE259884C1463995620B8BEDE8C25477CEDADFEBFC0EC76851CCC5705662161AFF00E4066A59CC00D712FF004A8D90B883F7FE02877BFF00A8350997A62CCC2EE30C59E2154398B7FE0A6EE84134152F10A2A6C47EBE258D658E220D3F842BFB2A235F65CAAE96CF43EBB9784CC1C662C74C76C6364B9356371B336984EFF59D509773FD4C652BA2249D00B457309841198E3FC3CAD43272E586E2D6196E6160D044AA29E1D09277FD7D0CBEA2C4A5BABEBB6271E2674DC6F69DE5F018A455CB47AC5BCF5A952A243599C41111C7438B00EE32D928DCBF8E8A8256BCCCA2A540E83A1733F1828E258B93A317089C7580E9BFC489B040E517EEA25332FA15A62B5ED1ECC6B1316355931DEE2C4AE8A9E9C73873E19422A6B89684B2223D9D1F7FBFBE7A7AFA7A759AF13EC61D37E9F7B1D9BD4DD0D4373DF37E9FFFDA000C030100021103110000103875C26779B4B6D6118B605B47D3625621415D1FDB25CEDD99AF0E0877E3A4B4B360F35FC0B0B03C2A9E9FF1CABBB6B31A7DE515CF495B4F02F8DA995E4F0DA513178DA409ACBD00BD74A26A3663ECACBCA3F21821C4B667FE0BC2F265E6F801F05A6E0D5E4E31A15788DFBA9415A0FB134F542F5520D01AEF53E0818FEF76742BB270B13DD6EC5F3A65671136B30D6CF20B5D9FD1482C26C73FC1E83DEC02BDDE26CAF97BFFDA0008010103013F10832B2A1FD8822DEFCC7BBD6F072B1DD4322BC978878A3D211A6A2E9542AC39A476F314A1185A1DAE4D6CBB0EFC56022A05D02CB90270D22DD42ACEE06C76629415E6979308F2912D4066D740437B8E2DBC8ACD0745B5BE2E2CE741E3CCE2A8B39B3307B2DE547329742C6622306469595A56057A67D113D083B33527DB067A37FF0070544147884CB99213596E8DB44489A89434CC72CD230C8902A5302040706551E2B456D9AD3540BACB6DDF10CC2E4F8D1002871461B7BCAD39514DA034ED063DF70D6C3985A85CA161DDD6611FB010539ECAD2CA8E0825A96E08872D56AD29F134C7505AACD9056D4A379C78005041B1634AF2E25986094C285517B5683B445EC9446850C8B72B4F494370530A82EEC94ACCA0442A24BBCA18A9C3D665B9BB042A90DC25F8C61D8A178146D9DB12ED11DDC514666CFCD6731F50EEC3877A63D48D52CDE4A3ABC6739CCC0E215C21AC28C62BFF00213B789941B73BB51B7D08252520DE1AB479CBF3059783A86C342A9BA1A78D3924DCCDF8702B97711445A49B3B85C9BA3CF925D625787532CCA81577080B82870CD7C1EB16003000BA65BAC17605691D011480C3660C6202438078C40A02A50C8976037CCD0267863480AE08158C22317491C212637C84283EF08A840169AA01CFFE21FC780280E54247662CF9E0DD8C3EC4A81529204B768BDA09AB501BA0B664EC8576FB1B472EBF4ADCEADA31EF02EBBBE621ABF48A12E5DDEA102F6EA1D897E901B1895DDDDB3C80F319577501D2DC87AD577227905D2D3AA5FD82F7732BCE673E2367379642D9983CCBB81284BF882BAE309B2D735825F10CE2BB63200115685BB6CC5BC8EED6D479CBF882DEC8E235B750A5DA32C56F99615D2CC440D938A43797FB1050C92E9C3128C4948C12BA53AF092E8D59C4A29375D48592E32C7AF88338F786E1895B9A4815A4A92025BA4C72F13372ED6B11500B0B1E614B06BEF9082D72988741CB502365A16A618160936D6B6A88B0945B4E63F0B1E81AAACB0AACB5A739F512349AD88406E06B3B7528B90B52DA2EE55ADCF837E8CDA0182029792C2F88AB7B994A8568B2DA8429AE0361BC33C9DA1010561776CC03582B1CD4C602BD898476BBFF00952D1F6F6BB79326BB4CB86C60D2C034AD60CFA622061909A02F96D318CE20E51451642F73F82C0DE6AD70A54BED613158A20D2CB07FEC3119068B6A814C79FEC0F06A71B6B915E1FCA61ADD1B06926CD53F8624D480B4E0D35DE0F8385A5759318B6C6544A38005AD0B6AB981CA09BFD421CA5759D432B71671D9349EB0386E8AC418E03177519758A761100DE74371D5D4FA3A8B00725844ED5AED2B07AE9B571237EF716CEDBF26BD62446A66CC66ADA4AE2076A879B8C8314DF695854A246C702EBCA7AD44915EBB00A381B52EDCC682F7A86850077157DA0DAF5747342CC5E2EF8DB00C08C6F75282F1ABDCCA941B8B9BA156B788B0D42D8C30C3AC5A19E8016F431339ED17A8506CB51EF211D05B6D3132F955F30280BB21783DEAFC1CFA661A58F76F8431F1752B2A35BE40256C649141AD14657566E094B10075A6BF72FB1022D1EDAC6263EE0CE00F3763E88C0296C54E1AB4156B1032E3DEAB0E386E58E56F8D388697B6FDA3D413DA4683AB8D7DFD225ADB0CF787A6562FDE1334207117FD12F6AA51B77D19071B12E711A8F72D5731DE813554F77BBEB2E23E097F1037AA0E71C01CF8994521CABDF22B512A370A6A9055E2318BC050AB5C1F0EA2E61BB92CBF88A0377DE62039576B2BF32CC9690561B8DE752DECA42A410AAC2C231F040D170CD8C36163778F72C025D732B01C6A78B1BF986663B905085B709CC173000237604F1306A0AE5D9BCC56E90B660B05DD5B1B43D0967415BAE9C76A848235C69CA5EB913E1815BCA1E4B0401B4BE082BDB5C1BA1E06C654B862D322ED0ED513839710C98F0BA2A2EC39FF0093014038DC45E0A950F67E28FE462B477986F0FAC6BEF2BA85C3337151BCE3E541182F2C5F8B2391BB50BB12B28236436D994821CA6282F7D8D22F50118E8432A521C4DA60D046A6CAC8002B157064772907B29A3BE21983660A821ABAA876AD156516DCB88E168DE632E6CF3FEE11B0335289100D242E9E006F3B8AC2F77CB92FE664CA5DFE6996610A6BBCC3739835752C2625438ACA770BF04B71DE40C500F1546AD261ECE97E2E18629C0BE069BAAD3DE5C2F6A8FD3984F00798C3C68396C10665206562105040DE2F8C5388CDDB1B512200D056B106F0052612C0A2A51A36F64CE4292B18723C5D7110A802D3828DC5489726C4E1EC41649A7762AA1B530012B8546EC858A2102B8899AB99497800E268C80F8B897CE4A0086B02ABDAE575EFB30CC1EDB8981987D9984E8238359C6712CC0C05105DB8E065BAC819618692E08D41DD95CB82E59746ADE8A1D76ED00D662EB38CE1771EA056EE2DBDF509AE1198C38D9F9203FC1FA22ECF199A0304E5B83504709AAF989A9FB521DCD961672936616FE199B95EEB132578C7C7DC963B26601C3E6B388B58E3105E5D9D0D878176D54A28896ABAD98ADF38B8B0152C4F3BAF3718A42CAD6FFF002583CA30FB71981FA8C777CF07BBCF08707F309DBA17F14CDD343E6A5B4B8565752E2C7A5C57FC86D96D444DC53190DAD3B3DAA1CA741BA9C0029705ADFA5C0EC5FC4CBCE4CA2BB1CDAB1EA0E357588FBC0BEE8B572F21983132072E703E25A28103694D9B2BE63562A0000E54059863B97480761780CCD515442581CAD23FB1096B7270DD3DA0EDC46E0CAF2F3FF3714CE1F9E6E13781DE3641A96E42A9CB7F825813C04B55D0042E16F8D32D48631671E261294F3EA30559AA6ADC292A94EA1C00C057A4ECB2DFCE61AE33DE3645CDEB0DB41561F90DC1C13876DB36FAD48035A6B3BDCA0FAC620A6918DB6AFC2621E644FAA12A9346CC40238868401035805F782400280A00E2A1D8B5B6FD22BCBD7FED424298512FD36A3072D12FF1E2F7106B1B29696B80A88F52B2F7F896BBD4537D219ABC8D66B266268C3CE27656802EFDCA340AEAD4532B442299E5290CC1BEDC1C959ED2B5E6A5253B8BD2857A0D129B0EA65A05B01CCC50A684B0300838041EC186D410FF007352B2785B4696BBBD42C3A5BBDD87235586A68C48B37D8BF6181DBE2C15B878B51A5DDAFB635160B2E65BB9247D986FBA4928814AB8A09C459EB6C35946B40E2A9AA51482A2D14AC5CD4D357BD64482EB43333000BE154882F98DDCC4AE46624F7435712C6A162F72807113942E15950B1B3BEBD63A4BA6325940B3979147699A6DDD7AE4958A6471B94309E6DCB6EC286AF32A6913546D4600EC0186A20E001E513E903DF1D97A5D50B3C92CA0552864CE77A8AD8218219CD5686AB9CE22C2E0852B616A870601E4A71694220622A95E5739A1DA00C5535937250C36DD19C8C0732BE15B4BDDDD5A9F994CF893F0C1C3986D2B0087598D7905AA290539C3E261F18F494816F91BED30ABB39F260CC0D37844816BBD0B7465A64328171E7E928650C2E1E18698568A5529420468AACBB923652D50BB15621374B7C95D9061B2FE9190FE80EEF43A6FF78DFB4FC0871E909BA693ECBD3A63FB7774FC797E410FBDF6EB2813FFDA0008010203013F10A8C3A05CC40FFEC25D4CBA495CB99472DC043C2278264598098915FD049513A15CEE563291D8FD4378988603999E48211475965C6D13461954DBABD0CE253A663D564568DC59706A6A1976B9E9A398E4447A62327DA3E8DCDA2D4B972A2460EC1CCB6AD42804ACA6BA442F12897325711FC10892186A5DE632BAC8A47D2E7ACBF894E1362048BC256C35866FF130CC33067A1AB0971D11C32FA55F423D4B598CE1A86E1965711B62C625AE42019218E552B751CA0223A9B29F696329B89D195D2834CA498B4B820DCB714806EEE2D1CC7A0258CB1BA376AA60B34B920AAF449517A5B0ABCC5AD2BC4C6B10DF9650A6FCCA6597E63495518F0E7314BB2118BE333C4A83C4495D183192B7C7ACBF668FEBFD43F03044765DF46A7343CB97E388405276FB082AD012C23D2216266E3C1ACBEBCF88836978203D698FE918E654B972E2501795C7371CEF0C3CCF071E7EF71713D339942EE889A2CB2E1CCB0F588A592AD91F74B62ED2FC47FA44CB83D2E5F4451766ABF27BCD834C44C90EC4C99AE2270E8EDCC165BB8094DCA5A6010B724B57065C3CE3316219E84B65CCC261F24538D48C51A8BA5C48B85D3C0FE60D0DEC8E97C4E423BDC5344CF532F33FA4CA04A984DCD40944B2CFD4A8D426BCC0568DC3DB444AD205107B700D48C5DB20ADC22D67DB8851835F4998A84BA5F6189BBE60CC60E66641F3CC50A5175AFCFAC18B20BA552F83DDF9D4162DF4557E4B9C0D4781B7EC9E2D20C194972E24A8196A2F865CF882AE24CE12A5024419A9323188C3728A133D31FB4730A43A5F41288332FC37846565F8479A6240B8FCC7725C398952121DBFBD037D0F54E9AADB156FA04FD911D508CB0462F3987314E09BFDFEEA54A1121D165EE281329C921558CE177E91F3BE83290228D939DF9984AA897882BF17986BB1B815D5C6A0AC496C0C9ABC6BF93B9594F1C3DA24D1BB79889B84085C20A651C928C468AE2DA6A66C31DE28C3D0E21E812B61CDF3169A4BB7D35F7F6CC6DA3394FB3EFF00043A6CE970F33CC4CB8A3B82B6E9941B63FBDA27732A00BCCC3E49C2601592B80358797BC334217EFCFDFDB00A8CDF31D74ACB2A0E73D04BE8588B148FB22B302FDCA36D36778014512C51067046B26205164D3AD7AA799FA4DFADFF001FBF4B9F913426D36E7A3BE8EA137FF3FB3F05ADEA7E23F6F8EF35FF003538EA6FE9E77346BDA6E4FFDA0008010303013F103AAC1271008202A82A563042C049A122E655372F8D782B1D47421D31DC42230600A198A9944C41634635A8EC7333396D91F34CCE8755D1EDE083B4806750D095339C4B0CEA659562353DD45CE3DE107512BA5C5C45772752A2C5BE80B96DDCB3A99711B06A162D4ED71C9056254A812E5CC81DE3B0341F33021B60FA0309592E6AE38C132E26E10B299108E612AA5CA89715CC23E65CDCA044E262E6502A047112EE309E664B9809198204AEB705996B04BC45AA0DEAA6F0B86AA1BBE232D63123D745ABA660A0C1FA06D75309BF3066A52D4AA546700457004065082B6C9C9A11EC6AE51B416BED2E5EBD40C489049D2CBF4E7FEC3CA2C3F2424E52580ADD9CB302578A3F6ED8810F7D7EEE23336BD8F5FBC4D5C10A12C1DF276BFF00915D6EE513E2CB806B63F88F74E226226674B830CC49535D209E341F31055C1501381FB98869E9A9AB95FBF04BB5C474FDD4B8A0C32C22BD7BC0E933166C8803DD84A895D2A54AE608C1A6C7B9A7DA1C669910C931E6E5BB5A6FFD4B04E250DE18894437D0AD3360868D541EB0744B8E21123310CB913BF2D3F30814DCD060B2B1376EF167E1E7D663DB4165DCB24CA260C91D65603C4D94F6EF0F358FCADC3AA67A6E5C00AD3B1ED31D6C986A8460A99CED52872DD466AA896AD17D05804C5E218B106B3B8743B9EB18F733C1C79F13BCBF3DE0A4B65CA583D19E4407CB021AF81A23444661215C1E4DFCDA8D880F06FD37115BAEEEEF12CF5AC7037E665C1EE3ED9A20786E08AAEA277559504A892A1D162845D257A231B9CA460B20E0E8D7E698B60AE30B2FAA333019DCC65CE1D448D32A54B746183CBF28E1F3F88ED9D2CAE796C8A665CE657C42161346704573243FDC58AFF841FECAE8741CC1874B77FF004FF500A0160EEFFAD4A950B904A8959F9F68370478121A4A35A97BEB1C5986BCBCBEDAFCCD6F61F00FE7461154208115962D9DA997E965FE200506A62B08E63785C2D657DB8885D9D8CFC9BF7CC32C6FC13180ACAA3839F4EC42E514A7BD3F46E3356DCFCF4AE964CE2CBA057D6530374EF3CFB1C4765513412984D2092E3128208B174E83443021CF45C2D5100009C8CD9F609418DF418712C8D20A8C296B0402DFB6601FB7DFDFADBE5053EA4552E2B63F9198BB097AB1A6A10CEE560F9FABEAD7F22359F5EDDF10B28CFC4D4FD932054AE446B88B00B42FB916F07C12B7DB7F7CC524658E2926659860B67F12B6E4E1C27A77F682539771C2537D7148657B38204C369FA8ADCBA7B78F78E02F30D9700D9C71D334729C3D1FB6383F9F7F6D4FB857DF6F33427DEEBDE6BF3E77ED346FEDC4D21B9EB43DFDA7DBFC4FF64FECFD69EA68F59A3D38FECDDFD7FBE26CDFF26BFEA7FFD900','Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.',NULL
,'http://accweb/emmployees/fuller.bmp','2254.49');
INSERT INTO Employees VALUES(null,'Leverling','Janet','Sales Representative','Ms.','1963-08-30','1992-04-01','722 Moss Bay Blvd.','Kirkland','WA','98033','USA','(206) 555-3412','3355',X'FFD8FFE000104A46494600010200006400640000FFEC00114475636B79000100040000004B0000FFEE002641646F62650064C0000000010300150403060A0D00000CE90000126900001C8D00002C3CFFDB00840003020202020203020203050303030505040303040506050505050506080607070707060808090A0A0A09080C0C0C0C0C0C0E0E0E0E0E10101010101010101010010304040606060C08080C120E0C0E1214101010101411101010101011111010101010101110101010101010101010101010101010101010101010101010101010FFC200110800AA00A003011100021101031101FFC400CF00000202030101010000000000000000000506040702030801000901000301010101000000000000000000000203040100050610000104010303030402020203000000000100020304111012052021133114063022322341331507423424253511000103020306040503020700000000000100110221033141121051612213042071813291B1425223723314C105A1628253732415120100000000000000000000000000000080130100020202020104030101010100000001001121311041516171208191A1F0B1C1D1E1F130FFDA000C03010002110311000001E650A36764C06D8FE5D891E948BB5CCCB2BE40318A678C6AFCEE3E8691319964A94BC6292A2EB2B22C94D7B3E6EAF521E35F99F7CAA5829E97482B52BE51B428C4ED609692C0CC87A3EF6B31769DACD6253193292F5F61AB7983EFA32B07D0F8DC37E0FB4552C30A2DB8505CB1B42A52F5B62ACD299A4C86EAD852E98F5B6B5652B968248334953229849C9B27DCF2F8C7CCF4C80E06A547E474F5B463D53C34BA5EC4A74AE2179861646DCB2AF5B2DB351BD3438EA659DCCAAE78F561E465538960DA1361F9758D6F4760314B4492E3CB7CA12C1792CF8C31640C582D9AB56CB5720D927738CCD746A3966BCDF862284BE79B5905B0552AD5B8E733A6194B4398C309333CEC92785AA9D02B8E975F12532CAF3EBB47D6F378AB9C650719836079B6473C967D3C4F35EC2A67CB318D14B525A3D80A1648633763D15B671159DA48329ABE6C7E8D72E489593E65B966C3A95355C2FD08B568B04D7949DEE004298A57AA69C402B856C0B3ED695ED87D9CA5580BA10E10D76079F5CAE3DAC1CF87635615E9918C6292B70DC04D9D16D8B26A4525B090ECF727AD9664CCE5FF00564F4F1AA2A1E61B088B0BF6CCECFB7B36068D2DEBD38DE2CE427AB5A9CBADDE8AF84378EC859BAA1DCFDEA4733349298F9E7DADCA713DDDFBD23B37764660E43D3DA5625D30399BEE6D40D8D0795380F5E6B9C8FE7AF6602C0DDC24FBE7DAF48710DC9DA723BB5E88E20923C59C4E164F0D0E9059CD6CF381704E5B37091B59535E84C4C0E4036C7F36E7002265D2F4FD1D1443F68416ACD4EF61A15094666C4F2CD1E6CB591D9E816C07399B4D7A12E7C45277D9505CC19930FB79F6427EE8C360E9EC23AA69A420CCF50AA4A5DF24A0E39351B849852DA37D48B2EC6592AB1A0BCE764B21D9BC3374AB07C3CDD9D20C19AA4C595B43550AD92E5A8DA26A65E7398EF2D7AD19351CF59593E7FA0CAA6CC20D6CC06F548E617CA628B4B12B63FCF8E9CE7FF43CD9CB64A0D6E92B796298525C8BE92082D84D4C2CB37499E5859B8B333C8E5BA78A7EB0D601FA22A2992A83409A184D44D49A3A6FDAF1881F7E6E4D59D9E8393BA706EEDCB4DE0713E82328251662C0D9AA60DC5A6CD52B024669641B08ED8063D0DE9F9BB737F3EC28170DC692F9A3D2C78D985D8CAEB85EA8F20CE6941E26E551B54598EB04CE21A36EFA10FD1D77B7A3E7FDDD44DCBE56F0FD79CA74A12983BBF86CE4D85718B9ABD87C24A715B87C191DF1310ACE3D2E5EAC0C4B3710DF7B913D99398BC3F56B496CFB3A6014E1EB126B5B51429BE633C591887CC90066B81B3D5F232BFCE747036A8B3CD9A86D7BED4759F9B6731F9BE9E3C3E76EEE1B3A3BDFE2AD15E9771D0E7B91A0603267138310C5F45F34EE587C0B1DE2923FFFDA00080101000105029A1F13DAD9A550CBE0969F89ECE5608EB4C571EDDD0455CC723F0D4F664B5B85505792A569BC22F71BEEA18FF59E326646ABC404F1CC72DFB816A9C47E6899BAAD6AB24D25B8E78D59B1E52D05AAACC589B683D46D254F078C78B706D695F2D37D76BA2195CED0F6CF864C58E2EE7EC8EC7236D70F61CF8DC1484678F0EDD5EC6D335B6DC964E3DFBB077C71E1F49B0F8A3398EC44E78844C2415E4061E3FF0064032ADD26DEA2237453C64B154BDE3878CE4E9C2FA5620B90D1AEC94D890D30D9A42E8982CBEE80D635C152AA006B22628034B1CC1891A18E8AC485ADCE60EC6B771F2BAA697314E46B5547C7E40E8F670B5C57A958C504B2073D363C17536EDF0C884787C151B2C30C2A18D3E2738378F90363A333178F2638DC1556AFF6143815B0D34FC72AE319FB2AC570BF8D81B665BBFF0082584C8EA0E9CD699EC736518746C78315634694772BB83E6CB2BE0AED8DA133628A6ACC5FEC12C938E8D8F55F0C938973BDC5B9BC3057326FB704D343041B4D36BDB0E094C685D97BF7CD01AD048A28A6AF2F1F75CE4C76E576DFB763AD5FB0E8AA9279FA95D9C0D581EE651E3DF2BE3A4D0D655B855531D5866E49CE65198B8572EB91C51B6474A0B071FBA717D96A9BDB6CC6FAF2799B033EEA916E1C8323648FB6C61AB7EBCABE4FC8B1F541DC219EEB4F19CDBDB3CF7990AF3EE6BBB9E1228DC8FEB92BE49F182AAD6F1D8E42AC77626F13144CAB56480C0DEF43F3E6A23E5BB50CCD6F1B1F235B9FE39D4ED46C3108E6919251F6EFB9FE2E3B223DCE326D78F8DEDF23C465D5984A6C4321ABC0D2BDA34A7D7DAA2876AAA763F91E3CD81FE2FEEE36896AF9E43B39085F2791A0CAE14B69A13580C8CEFB0D8FDC1E28BA09239DD22AAD1B400B6A6351ECB192A2F56333567AE09AF96AF9C4FF00FB390B18DAAC129B7E4127163F4D46B8CC47B63472E7546F7AC3EC6B53588353C868F365441CE514472C758F62276CA00EDF26B3EEB9ACB276C35CC2BCC18B8C7DD13D6DAD5636B5BC737EEA91F6ADD83534A2F5392E550460C9F21ABE78ED922972E6375394ABD71B4B8DDCE91D1ECCB442607C0D79E3F96AD03191446273E091B459854DBF647D834ADFA61AA46B57818E5446C919146D420D937CEAE78E80ECD688DEB63230031D2C3518F534FE28EBD8980A0E05B4CFDAD298B706A75D66F63C60BE151CB5D44035F0CD04820904B2FCA2FF00BCE69ECC2AED556B0962AF59C66A3C55CB6A4EEAB863D951C62752983DB19C86BB0A5765A78D864732B069650748A7A3CA4669719C94CFE538DBF0A16CF17C5EE73DD1BB2A2DCD754739CA950E43DBD6A76DCD89997C7B4A8E35017C2EA771B2074A181923256E53896A6F21E2439DED579874C9CFDECF92F2EDB92411F9088BBC7198D5400B782A71C3C536888DCFDCC7D6048631358865A7E192436EDF2FF1C6314338947E4BDAB1E9B42B954B8E8D87E51CC36B27EC95D035C1F0B7F77B0924B1C2F191C96A3608A35F29E31F4ECD63F6B0A6BB09A415C55DFF001BC855E5E3E426F9754771B6E2E6192265D95A196E07A9797878DAB34B2DB9A183726420AE3284A6CDE8E07719F13FD7674F92FC7D9CBF1203A27325C213A6CA84BDF8CB4F88FCA9CDB3C2D7A10B6B46FF0013AD71E18F8EB49E634EA4828707348E6F0CDAEEAB5D80D5AEC9594B86AF59DA547647CF7843C4F2BBD7930596004C9DAA84A246CE7C943839DF19B11E0D6731E1F09AD2464055A7198276CED81999AB478509FB20792540BFDA1FFC81A05FC7C7BFE83BFE9B3F2B1F933F2E57FB19EB1FE757FBE0FEFABE83F083FB17FFDA000801020001050207428A61CE8E59E83EBA14E1A35C9AED02FE494101A158D01D4A08A288D22777074722B1841DA14E58D0ACF41D47651B938A1DD6341A38F5040A1A1D6172282CACEA4F7EB6E851D1AD4E29BDF477A841140E4E35CACE8DD4A2B3D8A6A251E80D59289CA235002CA05128BB4DA8F741A9C3509C135A8B5108E8100B6A1A602C698D24E8283CADEB3A84D722567577449F4422346E874CE9FC27FD3210D4E8515EA9C8FD00BBE33A0D32B0884504E47A8AC1D013D5958D5DF4B0B09BD64277D2CE8342B3A0194114511D19E80163086A515B4E034F4E3E8808E87408687A189C3AB1D0135BDF53D0D3DDCEEF858D469959595FF18FD747B7B1E92B2B3AE74F55B535AB6ADA06A53DBDF4C68ED0A1D31BB280D0A3ACBD327D06FAEAED3FFFDA00080103000105023EBA04ED02C7511A0D084E1D18451D0759D06AF6A3A374CAC6810EA28A1A94F0804753A01A0EA3A0D641A1D31A8F41D65390434739008F6D074EEEA28E834C774741D04AC0432103AF72B09C1041AB2B3A6E4352822F41E81E82E5B938E992B2B0B3A335C2C23185E3406A51620D58D47433EAB90D30B0BF94DFAAED06A34087D13ABBD563508A0875E5047476BFC740FA59D1FD4504D43E9B8F7286A4A3A040F4610585B116E84E99D022513D20F482B7A2ED09E92B3A0E91DC74E7A49EDA37A4A67A396ED309DAE34FE5FE9A34A1D211F4D30B0B088C2DC89595BBA1875CACA6F41E8919859D46B1A1A951FD077A74FF00FFDA0008010202063F025C7FFFDA0008010302063F025C7FFFDA0008010101063F02D3F0437453FA1405DC3175A625F554792A2D18BE28DB3F1434D689F65EEDE679A55085938160BA96FDF152071342B4E12C7CD0BD019F81ED971BCD54CC4556AFA23EE2859BB3A8C4221B0A45D542D0A3022AA8848E69C289074C625CA8F577B03C767F2AD8E4B9EEFD4B1A1C11B130DAB092FC5C911F52367B893DD863B394AD2FE4AE7651B71D4F81FA934A2626D8D35C68874E40BD46498E23155F3A29DCFAA2C07075A5BD5510860E86ECF7A8DCBB3274D630C03EC9D890C453CD4A377E82C57B71CC2D2D4529CF5199C5756D554A271C968B742D8AEA9AB627342EE0FEEE2559843100BFA9528C8734B097152B97A88F49F9B107040E1C363851006AFB934836EDB323D9786B1FD5073928EE47A5115CC21119D4AD5193F05232E6D59ADCA3187B407F82E7A6E4E56A94D8BD10D9A638A6BB539268E07135F07677FF00545FFC555319E9211B40D0AD026D018230BA58B72AE94EA7108C94B561F25D3D3577D4AB9AA1A4B250EF2F563731E1B93BB79A1D2CF13C3C155CD303D576B76D9D43A988FD2B528CC9F341B351E80D53392D55A6E5D4B87546157CD01BD4AD98B415539545FC79FB464BEDE210793C4669A418ECE29A24843AB7356F0AE4C48B894181DE889FA21297B1D42564E9905AFABCD1C02BBDE30990D18472AA9C3EE5184AAD8142118B11845737B58B79ECD31C9F5CF31C0A84AF76ADD5AC5E4A30BD0959990E1F9A2573069663632AE489E58C47D72A2FC5DC5A9CFF00DB7627C8AED2C5BF6DCFCA7D2884EDAD16C28F6FDC0E0EB509638451D03483F0D9AC87E6016AB726D07956A3BCA9040E03090DE0A8DABB767F8CFE206A19486BF78D273A62B4996B8FD273D8014400FBD59976F01AED93AB555D0B776DE9EE4CC56DC348110BB6EDEE5D33780ACB242DC6AB560062B54CF33B843BAD4CB98AC18E6A7AB064D014DFE1C130D80AEA471215394A79D5976D303E83F35F25D329C162BA24BC4AFC21C6E5A6106E2E9E258E68038EF43C6144AD59A65DB5A1942BEA56AC19466FEA8089A47340BB92874E8575226BB82AE6821E1A6CA29180736B988E09C2757AEC70B67447FD2B13196EC96BD78E49E4B576F6DC15A89D2460B4632963B86C1E1647A9923DBF6F133D3EE9014084E271A85D2337933CA1C38AD2AF775334B7127D51948D655280346C148135FA507C96900A3749603175F8F11F02821B68ABB3075CB003C946243F9A3A2222F52C8E9C32567B007F78EA9F9453AD71F8280897A3955F6A68DB60335A584DD7B0086E6410F0697AE4154B2F7A6D485C320C9A33AEE4E15EABC2D7E387A2A2A2D598C90308EA03DCA57213D11CA280182DC5A9B93E4715CA76B2EA4873FDCAB87043A577D0A1A6D890CD90D51E9C379C94BF89DC72C702D52AEF7978F3423CBC667046E48F348B9F54C572AD51C7308F71DBC5C4F15A6D920E65480C40788DFBD011869D9AA059693492D44B04F12E99516E4C4A68A79619BAFE2D8FD8B269FE696FD9A405820DEE56A0D88AA7B786E5A5AA9F6D15DED3BB846E3C1C0907C15CBFFDB23D2BB025ED8F6C82C34C852513883B2A9884F15FF9764D59EF91F24F804236D366A31B8744542D439B7951B71C23B2CDE22930CFE5E1B3DDE513CEDF69C54AE41C44FB5F12A1FDCBB68F25DA5F03E69AC8333C16BBD64C63BC174E0A977174E1FB71CE454EFDCACEE93291F355382FFADEA84E6B96DBCC0C5446DB96E03F2439AD1E21184A863423C0C871F6A95350C7E0A13B510C4513AFE4F6D74C6D4FE9FB24B5F752EAFDB2CBE0BA91801700C061244E00E498055155D2960546E5AA3576E8923DD5A1F83BAE61C2598DB54EEA372381460735FC1BC790FEC9DC7727F8A976F783C67452B172AD9EF0A898169648C6439C26408D841DB63FE4FE9E1879CBE7B2D7EB1F353F5D967F47F543647C5FFFDA0008010103013F214CAB12E2BEA3A7AA9BC1EFF17286BECD0595152CB53DB2333876A534E9996C0AFB19683F27CB19FCA590653A8BB4BA6003C567B313A40EC3C9021B051EE08D6ADDE919B5E4F655C4D9D788B446B99A58725AFE6741143F1319528AE7ED05C483A37AD7A8D9F02DC9FB546AB674CB0C6DD0C4A8B1CB9FDC5AFB6331549E21054564AF04276D42A38FB8353A900E8FE04167C0A59C32C27434F544272D4F943D983EC7982B18B21D113A585B79713BA345C15327FC84C104AB3A6FD4D52A5BB471FAC5F223B28502D944A43204CAB67F52B287B199997346082DC166E0959896AAB46A2AA87DC3E65E83A159F53A98927F08C2DC947930928B3F4ADC55B6EAC5436B4D37D3338A6AF28B1B5BFA809EE8F0BF13256A1FD46242D8AF5AA59BE1B4DC3EB4C05F6780F30F46D432D1F12B65B80502CF981B72C5C64C08CCB3D36BCA4144AD3EE03D46F1DB8FDA16E8B58F9CC3FDCAC75BA9544EEF7F79990E561092E2DAD4BABCC42A5774D35886DA5B1E3B7EE6EF459CFDA08164D4A052D9A4AB987CA28547FB183E607C4EDBFBCC60143B41DCBDB515C9A8805C3A4DABF8450BBD622B9FA0798D9467BF646C83651CC353DBB868354B3C91827BA2507BA8578ADE26851FB44856E0691EE6CD1668FAEDFF00D255157D934D370F0C533F5081B63B667DE20613A8270287255A88AEA47AD8E108029457C442D86A9F963411390EF1E9009A45358C4BF98018CBB76ACB38D56A6344A978D7443B5033F5A86696E6ED4CC133D10DA9B189B9563E228B82945F40844ABF623727818978883AC6D446C81AFC278192550DD33AA361911810F0132B2C26F5A4F4EE0FF4F980751CA02FBB07EE5433A14C316C3A8CD453206435F27516430F843BB304CE590E9BACECCC1D5DF6263A4A4515193E55885136A948363C297542DB312E005A7D603F32FDFE25A050DD1140E5F823A5DAE0AB833DCA9037A872698C8A451F5B6625CD947C4BBEF47E5CCF44BC4130CDD43191F335650A57EEC9338DF16B697A9EC3C0A07865462FC6465897DAB10CBDCB037D6CEA62C78218AD805ACC60B4414BD626E8FA990AE22FD4B4C15BBC31B0E82B1A9D81428464A257812A25B1AF33004432DAF728035056DC3AAA83B25CE883DD43850DB3D070F86C7CE3531BB7C71CB6D96A640AF37C46736D42DC572B3D920368377A49736538BD62B3BF71EB89FE4CC276B6F1506CBFEBF106DE770CF0F4C148C9EA11081DB4A5A03BE52F6B3831244E8B3BB9880169F0BC416D9129E99F297892BD9EBB97792C7C91A7B2B7EF1ADF72D0225C49411C2F072E9B8F31AC91E477A84FBA1E196B6C09BFE2E3F093DD030E03225F53F3DCB300B875A99AEFC87A84964566BD957E67F0FDA6721D329304209836A22BADEA584CEBFB037F698E6640C4CFBC5C87FDE7E735F2CABD06FE9FB990A453CAB72CA582F6DBA1EE28663BA8542E93E2282C93E173032500990EF799797967F03D4C697B3C22F19CB88A727E513667C8CC10203D06584478416B0B52B23C4C613547DAFDC2116650CF70E4A03EEC2FE8289803DACA024B5E708CC7D7C1A9F798E9E1067F1BD4B0E0E431876BB228A7F2678C7E330D6AABE4A94F073637FD4522C2C5859D30FF00C95E307FDDFDC0C5E25851B42D8DBCDCB737357E92988B66E23A85B294A9272CAA53F9D0875B21F0044F2235CA64EC4A534F2567EE590BE0FF0092D21259BA62E1BED2E9DBF697E0A8A6AAEFE267590BF42846FE90FE556C53FB253AEBFE4A3F5206238BF195F2B57F50324B035E0FC42382ECB5FEE1041161FA843E127BB2165339F24A413706A8B64DADEDCC60772E65B2696B4A81D722DD777C3C4D11ACC64E74DCE4F994EB3E82668B327B8BE8337EE8ADE83CC15E70AA62958E15DC0EC50AB5B3BF98D0DAA2367274D771E2A4F48363310A6E1C322038A1BC1B6A75FF0070D31E02055BDFC4ACEF62E67873753005C7C30E0A000E2BA36D5A2E0C030DA83B71420DE30D9C10515180D5255C408FAED35FE653A8F43FD9560364A9E50CC10C3F3E61D051ED3A3FEC43DF720AE6D506D529BB7665ACE1CF1C536F3AE79A1093FAB7DE187695749867932D771FA6322DB6A7BCF966F1B658C8295756187A8169F12869AE996A8F4D04F10787A8635E617AFF004980F7515FFA4B3E5FBEF57A9BA376CA3D43B265F6860A16E88365F00BD937945CD7F11872984D4347D8DF73A70129FBC5BD656DA3FA245C6AEA2888EDFCF3D93064D3A2699B2E0EA1B1267DE1A003F332421506AB50037C8F6CF0EEF1DF2FF19E5347C3FEF21469F9FA311FDBFF0027F6CFEA9AB93FFFDA0008010203013F21B2344164B9A8C38DA664330E1315983C32458D2E78B5458A08C732A38331632C8B2E5B80831C40135B88E03B831067516226E6D0C721A84AC704B951C5D288629A8B457D15BE2F822E05186245E2B24C39465F0978B837C8C5CB18B1D712A313B632916E6C046121C845197C95C4DCA5440F06FC1199AE1001CC17011F197CAB8286169902659923866A65324C329E4541C37867CC60D4B97E381132B11831D90B1B46184C201C3A473988544D4CD4618E37F412E5CBE1925F2D63838DCD6516A6513EBA8475C76866E198EA155369AFFF0090A83873E358591B460391C5F49C0AA66E1B83270DCB4661172DB99228F347D198198CB03E862C0B810461CD40E2B8A54370E2114691D4A5C86FE80E18624CC463036F0F0A412C46BC31631FA24A594C2E5DCAA2A971718128408E5CB9708B297E9AE06231E174BC257D3A6D2CB4DAA5E54BE6C3E5186A5F3BF82A54A81C0D25B8B8C2DC3A455CB980AA86A7D0AA2A571AE0418B8B878B838BB83C0CC3CF4FA09B4EF823F4E467734E3FFFDA0008010303013F2185306A650571ACDA32A540C4BC54C908F108730F0EE06216678459E43C24A94C2A0E1661C62823C09462F810C23C54AE1B701AE05CAF89D4B817F43082572C4823BE55C66E0B95CAA0810254AE520FA1A4099A5637358C60CD170106E3C547973C3A9E485DCC881F4F04520497F0B516079CACC4D782C463598E13321AE4B8AE9740E1E10B347216843150701182110A4A211823B30663A7030972F3023CC3E8A95F4544822867109709B80BE07FF8F7C54DE38E0DCEA5AE6B88FA525734B2570A1A48520CB7EB23858444588478547054C454519589BE26BEA65C5845C788EA6E30DCA8B1145348F2B2F9AE6C815C020E653C02E61C4FD20252111CCA88C20DF01BA813B840E2DFA44949862CBE19E09D4C98A97982072AC193863C318DF04657C95C3E8C898522ACCA32F8612A04F49550BFA356F0B97C3C45A9552A60C32CCAC4CA1C3738B61C12F38BE478841CD3C8E2A6C1AE071B704DBE9348477C1C1C6C8EE75C1C7FFFDA000C0301000211031100001088C3E23A635350DCA8718253E5A7675F226830CDC429EF43F459C6BB434FC8FE36AEE2F7F9B20ECB31985115568FFF00043A2B68971078534B96EBB434EA9153AF350BE4AE3EFB1780BF621B0B9601648464E2DD15586AD88B6F41E6E6C2EE88E5F8333ED2535B640B497F922613D7D5D6C8DD2AC5700F9B3AAB37131879E753A4172C7C3F30622C294ABDC5014D4A47383498B91951F17C77DC6062E6F294675E4C8575426CFFDA0008010103013F10AA2B7714ED29FB92B18AAC14251A3D45A9653414B0BD67A84261E205035E0CB37EA4E0A181F3333B464E7C1682DC8B59966684012FB33DD454D8E5B10B04C47A61A7EB11FB86165290C1410E2C4F531F11016A819F114C5418B442A52EE221B08B10629217B3212CD499D25C64DCE38159BF107D41ACBB1F706FD1048285D441E795EF2BAF52962D4AD36154B7717601BD2D4AF658F4692EE55A9B1B40175880B0F479DC4973542DF3DE48ED7684EDA8672575168BA00B5380EC8FC6E200042A96227DE6CF86E60C2FD987B1CBB1223B60ACBC340665AF2AEC193F06165E5961B47D50A36347B201B6E5BA206AB50C120069B0DB6B88FC2179047CEA3B7718C63C08510B896D87235ACE189B368BB1147D24C2BA0DD01B6229194CAF37A1E5D0B8D305CBB06C0365D95BDC5ABF1B0A4C089E6154F0C52D46FF00528EDC1105517CB4238015300D869F0CB2ADD1D37DE7DC4017802C5A4156EA5BB523244F55618F3307CEC07A556AAE99480E31710428BF347BC42C97C1322E3FD4EB6BB73AC98C8C4AB8DAAC7866FE220BBC4D16C663BFB5114874CA11124BA57018716CC04F63B08A82FE3171611112C4C89827A635B151EA72D790BA8A2078E80893E2E554B760D34EFD8371F5AAA0AB5AB29E88F52A1E12D323A3B2B0CE924065E0C6E1F584B7D67B300FC146240F200732F38B369419AE8F1DB2D9D555C16DBB7F44A73540AD303D0FDC0DEAA5B2FA267F0CDDA0AD6627168C222E3344486D6DBE4A2E3DC49B9047377D9E61E40BB0B2D5E33031C8565997923905CF621791B58A6A51431155DAF1A9990B6BB1F98C89807903C37922971681B4C9DD4274C7C4C3C8AA748A1824D669C1CB57208221A1581014990ADCCED2BB80701150505BD7A330EF97665201FA65F9D87CFF00F971058289C5B359845605BCD7675B232F463BD60FEA55A58E9576ABF441A7191115C37F38FB4C659B58082BB762D10DAF035997B58EA46FA1F388EC2E5AAC382FF70155CE0684BAF564B9C8A1BF6A9F08C358AA36F8994C4C5CB6543CFF005023BA0CF755014263B275417E26385E455042A817182B51354700B02EB57501668F03D89BFDC6923707678A96AB2A4C6594B86CC6A059464FB451436856B0A0A6BE634011D095903A1FFD8E03B8E70847F10EB15DD8A03DDD7DA39C5E41B3AA95483AA13FEC2D2159A37F88984B632006B04F3710644055ABD8367EA38A311AD35EC018ACCCCA82CD5B061FBDC397BC45D472EE5ADD7F72D5C1E9ED553FA853B4C445D74AB2C6662A8581F4B12B5C3E0019A3CCA4C058D96A275EE161041CD9559F7063264C6052BF6982B5C0D4B1E143F700A451C156783BAEEA1B36DB7A3B7DA0C022406D483D2BF71F8B70AA4E9D3549918F2C29D6657F7B8495C6CC8B553E61C0C0A57B4B90E961A3519AA4487A45CDF6A8CDD8F73A2471FEFF00933A6EACADF4FF00B0C8016E6A6DEA2B4242F0F830C482694AB06CA8C5EE6450B775DAFB9FC4C43D0D5BBD247D9842DDF6371D21076B68D52427442DAF6B1FF6325A629818AC96D5CB4A51B18508D0EB153DC40A564D6E40146BE5845CD400C36D7B62C510DBCC06BFA63341F3CF22A8537E9A6589EC951BCE40039B26633A41E3863B194DCB12AE9600BC162630CC008D556253F14441AED75A9B445B312BD220FD5494AA3495534A303C72D921746882F472ADD0061F79DC11A539EE05766130995B2110A0C1586BF33212C8ED1A31AEE6593C01E8C1A23F586440E71FA8D740A02DD0C7BCE21B522B959908E0AD1510D0B4E35DC2EC578BC7EA6943B142C758FCC255D7565D7E6681FDAB328ABF6D27FD80009689845DF89FD2FC0070C854121A3481013085CC9882C8DE29C35D46C1B6D16B4D9A2AE0B3D6B430FF00F216181BBD15083ECD2F67F50D3112C765F794875616CA341F91733E6B8351A6A8B814AD451B9669A02BFC875966803863025470D9796EA301F82635463B9A56977865851502F4BF32810E0843DD998F2CA0CFE630A41EB65CD1D067E48646ACA8F57EA0086F0B2BCAA0105D2E89B456A8DD8E07EF1C3D2E7B4A0B26E0AADD31D3F10A9B36C59DAB456A112B43F95114E2FB3188E8254956FB8CC25DEE395CEBC4B652E97D0FFE4A06A2D835289DA5345DC72AB0A645436F06638F8A3EF399781974CC7E06B4A34FECCAB581545B8DDDF52E9B5AE9973577D329111685D59EB32C209744B6614409C45063A796EEE20000828B064CD0CD436E145D7EE12F1548BF609554F3F8C1FE457B77D432932260EDE5ADF7500B585985ECCFDA02E92D19B34D6DF0623D404020E49936412AAF20A2978731417A1B1E1ECFBC05CDA5AC843F7442EB07FB24FE589B14D59A3385EA1D4072E29D62F0CB95033B9A895A332F14E9A99C801850466B26A17D946CA16D498F232AD3C9F771FD4B1BB6BFA4558C57FAC10CE2155D8F72887EC4B26AD66013A406BC4A2321B09F904C3C12A19F922A8082D35AB465833A00EAD567E7505787DE6347DDFEA6149D1F13B0D019D3F7992A0B762E4D4CD7D81AB5FB4C2EAD65AB9D7B80985797382ACCE1229AD1DB8E1C8AB5DC2D6C4F6237FEC03D21F8A1072C425FEA08FCCB29FAE0A420EB0B72C97058255C1BB1E8FF004219886171FCA54BE5E185A754598BC0502D42D0B9782FD1BEDFF26AA9E1B28D33E5B0014BF32F2C80F7446250092C83C7717564C174CEC803F55B6AC5BE26C5E52F16D5E3ED2FBEC5BA154A74B50E8611E50ECF642F868C9D500D9D4139DC3C2F3006658FC92BD8857B43CF93D426694D8FB19D7C4080A968DC1ED5B08491B41456118F3306FE2E600569AF100B8F0C29AF74097522256EE87B465C2AA76A27DD60A35A2AD1351694F2EA5C02B9A50E05EE61F6255D2C337695800E2E9F30850CA244AB7E5AFDA00036A0AABF740026B51E360B3B0749D93DF80F23F12B0836A83E618D01689712147DC8F1ACF0C520DD3592CDD623217D5859AF89869C12A16E6EBEF1C5E8A8814B55D608AAF12AD8C52E69AFCA3D7A918FCC068DCC4A942A3AEA1CA539E834CC2B2ADCA65FCB702B3B6BDCD2DC68A28E7D622B8AF0FBD4A0D660BFD21B4D681A4F848245664060A0E4A3884D00CD261A51601F315810BA5501E4488B8D93B22E528496B35D9833EA61FF00382AFEEB7D412FC01506F0F699CB544A4DD6206BBC76CB40DEA8796565969440EA9CCC007A3DABDB88B397692D13C3EA7DB842870C0543246B00F8661D2BFF00B0AA3282373519BF0E8351EE9B3D91B9A9153D31D5EC25E19C6F2D8EACB5513D79DC3EE8A3F31F0E2F1516A280EF188156D49B51F1571BA9814A65337876E888B8896AB16FA3AF5052AA58B2DCAEEB1B39F1D9082B0B6CD97DAC494D51A262AECB752974763C5B747E79105B06695DB3A546898942BA1F848D458AA30A89068F89D3B1F9352975C9400D4A2CAA86B724C94C2A67151DB1AD4B1B1AADC7A83A20A57B04627A9F2C36D82EECE58D7880EAC017668346F64D53510D5810C1ED897B989EAAB0A5CD6196CD7F506959460725545842F6374D63F12C01414ABBCD308846353764A7DCA09B04FF00D5691DACEA08118202FEA518446F29788C8ADC48D875668112BA8B9E8B4B2A2F18B6C97C12D6063DFCC522C2C0D14CC5172B045D2634693C9178B969812C7E4CFA6553E113687FC9A60697563AF9F13FA9A23B2F500054B8FB27F901ABC8D3C55AD452DE8AFC11F1BAA4D74C753FAD3F5B1A46E9FEE76E357F0BE38E1FB9FEA7F13DCFE6FB4FD89FE1FE4FE27B4FEC7F735FF1D4FD69BFE5FF0078FFDA0008010203013F10A917DE98E9622C1E21AA98D888B2773B8A8A8B041EA6378557C1F28D0E5DCDE4B9DDDCA00EA1FBE6B93D445B96172D65E254E009015984EA24E1BA542CE0361A81552FDCAEE5A0DC4B0D998C324B32EA684C0751A58958A24038373C9B8ADAEA653A4D08BD70AAE22D135095B1AB853756235EA65A225B8ACBC5B2A1A6E225BC070751AEE25DB10943051488A546D0579DC1EA6918A54B63124E94AC541A2B8ED8B999C2E84077280A889743706A502A037200FA894A8060AF8C7956E2AD4A4A47C3923112E950E615200A929E772C99DBB85054C35C28AA0BDCD469826A5CBD53645C5348C2983A4135C5A8A349A81D0DEE561B842484B962A312B060BDBA22611C4A75329462C55E07B5F13D46DB1EA6A39DC1573C0CD10B65C58961E7FAF89482D91368097297509719B6E2B72C6EE191A8AD0C90C80B9286A5E351968B72E398AA048DE29E2C5B8ED983D401495B08DCA6509F71366E62A95FD01CD26304F8E310163D42ED2854BAD1691182430A653E95F0B504EA246CD3A81DA75055605F50F1A88EA51DE65DC46DDCA3856F873C08E26DA8D29366C1A9AA4AA9E08CDB690ADB1C48099E270FA0A85F73E52FB3C097894270A8532D5B6249EE97BC463BCCA9987D11B289508096562BACA615EE7BA5EA816D1316E0A891802310C4AE254A9D84A3B986E2DE208CB7331C0AD403B846E520B2620545C12E777C344A8D29815C28F00A62B944C592AD98613C2815288C3C14D4B975E38A870262B502256B31B50634CC1F515BC3DC833189332ABA40C6C4A3469D4A7788A34C511AB44B095C520595DC3319E792364CA32CB024B912D8C11CCBB80AA494982A28AB8FE498E8343C59FB84E06264BAE5545C34F0268DC0854B46586CDCC0100704D710C04E74FBA3CEDF531E757F934E2F27FFDA0008010303013F10302CBD728330DCEA5DA3078407514B72D0AF29A38CD82D180886AA75A256E11BCD8371BD102346334DC062EA1B3D4A65E2D2C33B80CD45215E3B8B7D54D818FB8421660D77065416A3869992E0547EA0809C5E21749BD3C2C25C33431B180EE31C4BDDCB964F5804ED619A967042EE36C198FC172D18EE095442F2E8C319D99521422701768B088DA03B8512A34720C4C3710ED886481326668458187944EF34B86A51A975C7972959C2B8B994D202941B9772A6FA47139DFF00D866A0C547328EE18C4D2E3378C46DA512B5B1AC622F6B8700596ABEA3815894A630C30F280CB688960DD4352F3316EEA0EB08DB086E2C5E600E353B48543CC71A86B0818BB8954C2630690335C17CA5F533350F58AAA69046BAE2C4AC5695954511AEE32DDC0EF2EDC43151C04A95298A60086624A171C0DEA509EA3ADC16821B9B92F4CE8105472AB8A812B90835244449522205B732713922DEF9CC3E80CAA5046A517770A4A9724EA2DA89DE19316B13183888F0B8638DEA80C338255CB6619DCAB72965B8180512994B20D41B465CB971CC44431B6711854C63CCA16261D92A054A3E90A752AA45259328C38199AAE308BC6055CC8DC2C966789D086B50D2D84708961425592F2A3E5CEE28CDC134C0B718A8C4CC4B2DCF211A50D46A590766E548F49F8F116364D0662532A054ED27BE1B84A1B972BA8600813A9AB46AB71454361BE0A254313133A940372B35124CA24C21DC01FA81E21278DC7B392571CB95288601B1B815FCA3A1982ECAE083EE378772AEF335B3BB0E9CEFE2852578C353594465342218AC2CF79286C2E6B164163D5915BC3A98AC8C553612C94959482CACC6B744712C964630D544A531672D37CB187EA2FBB876E2781CFD2FBF11C3638FFFD900','Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.',2
,'http://accweb/emmployees/leverling.bmp','3119.15');
INSERT INTO Employees VALUES(null,'Peacock','Margaret','Sales Representative','Mrs.','1937-09-19','1993-05-03','4110 Old Redmond Rd.','Redmond','WA','98052','USA','(206) 555-8122','5176',X'FFD8FFE000104A46494600010200006400640000FFEC00114475636B79000100040000004A0000FFEE002641646F62650064C0000000010300150403060A0D00000D42000013C000001EC400002F56FFDB008400030202020302030303030503030305060403030406070505060505070807070707070708080A0A0B0A0A080C0C0C0C0C0C0E0E0E0E0E11111111111111111111010404040706070D08080D120E0C0E1214111111111411111111111111111111111111111111111111111111111111111111111111111111111111111111111111FFC200110800AA00A003011100021101031101FFC400E40000020203010101000000000000000000040605070003080102090100020301010100000000000000000000020300010405060710000104010304010302060203000000000100020304111012052021130631302214321542233324340743351636171100010301050406070507050000000000010011020321314112041051221320617181324291A15272231405F0B1C1D16230E1823343532492C2E2738312000104020301000000000000000000002120405011000110708031130100020201040104030101010000000001001121314110516171812091A1B1F0C1D130E1F1FFDA000C03010002110311000001A1AB17D49B2A8E19D0C2FE8873C1A13ACB24C9324C9592F5D56B908BBC91680298664C35F3E2584C9BAA7D84EB86E87E266C9012A9103C9324C932564BC9324C9324AC2F3AFEAC9CEFCF6C8C8448CD2FA1F4B770B8A60FB2A752CFB93E6EBDABF65E499264992649E495AEDE7F3772CA52AEE86B1FF492D2DD1086B4EA411526147F443A1AB224DE061A8C8966DD7B7324C90225F2062CB3F2FA3373D3698A195EB40473C2C662F62CCC3AD353E0ABE0AA45647954F043AEBD93EAE65CE36C38588E5AFB1CB79B64029BB98B0637566D360EBCBA641849333E8AF14F746E5B25D9DBDA0685CA0D4B6957A538D7161FB92E1E85977A97323866449E774DA05B825E014789832C69083CEE1A3132B55352DB20CD6BCF85389F260F6474D11D2BA096251CAD32E8D9B94C86532469995345CD120707E8D0E1A72BD314E76A99D48F4A705E7E7955242AEC466E866366F27434A1D53D822EAC768F2BB0EAB67862418F8C5C7D0F84AB8F4E3B0DB98BD01973F3FD3CF3C64B013F076460DCC5631EB7C25454A82D5D8ABB5130502A9591EAC41836768C2FA42CF6B234AF8113CF34649893867EE4DA7A529A73800F0288283B6A88B88ECCC9171734E4BB79DD21DD9595D9AC351D98FCE8531730C41550BA29C4F41AABAE4AD9179B5C55DEB309CD682AAA3295AA1112B508C53737D3B3D9C0764967A4D7CFA99824542061344EE5B43E77A45A0D1A6A8F8320DBFB6A55D8A685398D89262D05F92CE7E23833A88671006A664B0F40BD6DA7C56A451729F9FF004EAC0C87D7964D5B6341DEB717C8531A75CE68C732ECE6082E69F3B176B3021955E7A2C037A2C09393642F13B05E6D165F9DF4B090B4B888657CDE446607999EC88D2FFAB0F8AD338CE120E8E58B709AA3C6BE3E91E71091AA4383D9A4716D9D437A138BDED6506138E0D312F678788DCB26CD77DF4B8696681C5288915E212254C852BFD1FCFE9E76F71F3FDAE5F4BAD6173BF1BB52A55A45D855F061AA82380AEC625FBAFC4E4FEEF2A51CAB239BA7471F5D329434AEA17E8BE7ED2E0F6E97C1D0AF16CBC33EC038FD6218AD68D5E4B31C8358AFA5318744E80E8F0A9DD19A85EE73192C7A6B8DBAB5E79D5391507F42E1B0E2D91BC6EF04B63664D509C6EA112425DEBA9BD8A98130A1D93D4E7DFDA7971EDBE39E9F2E79A0E4ABB0B2B01E36AA0FDE79A0D6D6CE2F781C5B9DD2DACB85D73C0F5ACC8B105C1F02C8ED99BB03ADC8D8E48A67493B254D4B91621834E7BFF1B39BBBFCAD544C983A25F1FBAEA0558F1FA9A706CF81A18E09717DEAE8FEB736C8E8734307FDD5E4B8635D4C1497BF93667479889D0C43E57ED0D2E1E7FD3B10D29737A2B3C3EAE548364D06226FC7D87D6E5EFD19F4234C767D125AB18D4C8D92A2EC79FF003A5CAFFFDA0008010100010502DAB615E32ABC61D2FF00AFE8579AD2FC48BF33A9EC6BDB042C8A3D3958BC6CE4EC7E44F4E2DC8448429B0A6D6DCFF4BE323A1C5472B5C3704CB07C9F4B9FF5E635B4438B638936142155BD7B90F355124752A4FDA5988304C1CE6BB216567AC8047E17867862EE215E9DC1560CB1C846D56B98ED4F9481D63CED2A373636413B712D96A168E7CE0A6CAC53CB33668A7C81F1AC955AE745F3507F3439B050B738562656A9B9EDAFCF5C85915CFCAA91727B13A7639198AFCF2133D868790F291154E76974737DBBBB039D58B8E9A06BD97DB72ADB32EEDB2EE85B2BA4BB598171B6E7AD20B75276B9D004FE4205CAF33296CD149E2E36CC8E8B8FBAEDF1D9C8164B61AD2E75CA0F217AFDB924A3636354F76B355EB9F8B469CF3D94D830D0084E95E9E5EF4F891886DA7F6A8260ABCBDE166F92B81AF95795705CF8A51F20EF3321A566BCDCDF967752A7B5597AFDC2488C5345334A2118D3D8428AF4AC34790DE29C9DEB35CE03E109534A8C053CEF7F1552E3DEABD704589DCC5CE4BCB39F1D9BE25E1EDBDF1EE715BC05F6AF002A5A6E559C6397876B546F603AC49855331BEAC513E588FE9746A763B75CE36279A1C7189C07DBCD5E6C114BCE9317177458142C4E15F9836CD2BEE10F1975B2B1AE72C841A981302E34FF0022AFF58B53C8CBB08C61361CA0173B55CE51F124B0D2E46AC9C15A3660B2D1FBA476C7E7F1D9F1D697CADF69E4DFBDAD41898A9C802E31ED92CCD630F332B3798C14DF6A63F706C4CCA9BC2646D08137882156E31B5E5B9062D430CEF9389964067B15E856B9726B13040A6A0B803FCAB04EE9ED3C3E381C4B647B0FEE0A2E5A169E639061E46BCE7656B0318533E7772505382AC163D86B56AF73919EDBC04245C77AC5E9055E3BD1D8AB4BEABE0FDF383B534E3EEB106EB1C656B8EB7245C8C68DB8B70654910899E463B0291DC7907F8AA71D4457A3CA5DB0FB124BBE763935CB84E3EAF16394E744CECC93BBD7BDAFF6DB3C7DCAD17BD4DFADCC3E4B15772839B96364FF00F8FBE0E620A75A0E3A4B8F8DA5EBD7E9BDE7CDE7B9CC5A7B99235670A37A6B9729C8B9F2CF2E536A4D578269EFC14847345ED28B7ED0EED6226BD1AC73F8913543100B8EA2EB3665E15ACE21BC4D584CDC3C9615A6491BA493060932A356A42E34297967F70987FF00365EAFC431BC7B1DD98F063C04004EAC0A35F03EE74BC2D7AD4A2E4B8E8EFF001FCBC962A5BADC95981FC7FB7D1BD0F3DE8D1C95E0739AE85E0863A20A4A956D7ACFB47253721C651E31CF7732C1578B8CFD9B884EB384DB8C51DA05CDF2CC6B16D7771771F25EAC36C1FEC8F5A75DA1F91FDBF09564F370B9862F72E02299F09EDB331DDE4E37F0F5AA6EA55A1685EEE76411BBEDDFDACBA6F2BEBCA9B04C07E54A196F906C117FAFB8D9DD0597ED8AACFDF976C2399AF6F11D6F6FE6201C37B4B2C2E5FD2A19948E2E70CEEE2706131ECB9CDD1FDCFD7F8E9BCB5B0A3F9253E676F91D86F1B41FCB731C7451C2CB136539D88B95F4404892DD27FE680A85BCAF54E65D658E7268CBB88958D92E43FDE71270CE469FE0FB03FE07C3DE3635CC0DBF6A473BD3FD7FF6EE3CBBED1DDEC70723B02BDC750B51F33E8B49D1F17C759A91F1576DD77397F1D4FF002AEFF91C5FC7BA7FD94ABF86C7E8FF008F88FF00DA21F877C45F143FA2ED2D7E8B1FE63BFA3FFFDA0008010200010502E81F582C7481A91F51BD18D07D666ADD0BD0768741A6163AC1D5A1128AC2CE99D32B7ADE16567AC207508A122DC0E9B8273D650281D7287446539656709C72B6E9959D020741A8D709AEC277741A9C5008BD67A8140EA3A73A14E4D6845A1386A34C20821D4E5BF5C2EE11EEB6ADA831118594350EC74B931159D33AB56E590E58434C2F944F410A308944ACA0B6AC21A6346E9958C750F83D1B9028ACEA34CA3AB227397E2397894918C1E8DAB09C8208F64167A20AD90006891DD89CA28AC2074C20148820BE50E968DA1C54CE413CA7698D03D6514026C6856714E89C3A5C9E549F394EF84EECB3A6356A63B6ADD91F29F5822DC23A14F27749F20297E0E9B741AB0772A37610D25EE9ECC6842F1F7907752EB95B96740A309A138262CA2C694E85399ACA3BA7774750356041BDB184167083B48CE5588F08E92B16116A99BD053028DBA140ACE854213E3DDA14FF00828A9FA589BA14DE88B4FFDA0008010300010502E86FD63D4DFACE6F50FAEED40D03511F588E8082CAC69858585B56C5858FA0D3A94D08C4B611A6D2991ADA88447D11A0098D59D36AC6AE0B1F45A894C6A2506AC751088D0F544328841353C941E720F514EEBAC3B16610D7B6995BD6F4082884753D357E244DD30B1A95B32B696ACF671D4A71E8AF26D323C14D080D0EB8E87EAE723D30FC8E8C22105844229C9CEC22F59D4901091AB70511EE34C9696B9AE5B516A6E8E5F2652023D124B85DCA8DBDF6A6A089413A047785E4728C944A7140614EFCF49EE9AD5137460EE34083917A2ED1C548ECA3395F2B1D0D4C099F099F29AB1A6752329EDCA211EC84AB1A84DF88C76516BBB43A9F829CD4ED22EC8E80A0FED11EC54486B85858D1EED5C884090848B1AC27B2087C0E9794F28272DA9CD584F50C9AC122CA054450E8714F768D442C2C2DAA54D7610D19F28287A5E9DA04EE89B4FFDA0008010202063F02F0C5ED15267026985E5F36C435B89FFFDA0008010302063F02EB7DC41862A2D42C33FAD8C517150DFFDA0008010101063F02DB18C8B47CC7A90AF4DFFC5777120F9BB767CC9F188E48F674CC6571429C3C31F08DB3AF104821AB01B863DCA750869C6661663172C9FA005CE8877350E6993D9B72CBBBF67F31A7F0C7C547F15F86D60153784A9195C6E21D53819E7CB10253189088DCBB6EEC41F0C3F66C55511F009101BEEDB2D6D402A105A8C8DDD66D44585B7E2AC360C13666325965DCB12E5751E85FE950FED4AC7EB45EF73D1CC098937B5C7B46C8F07330CA6EB5528E4CBC238058DD4BF34D729487970518CE1CD846CCC4DAB9B47C71BE3D6BE2FC33B9382BC6ADE25CB956119DD964518E6B310875A053F478B3E6C0C1AEEF50E51C99035D659B9345DBF57D82F0E5F523023F72B496182CD4EEF3477A07C12DD256D6007515C0F3EBB87AD1A742C7F1540B980F166B5427E76B42027675A21FB13137E3D8BDEE8588D231B626C947715C5676AF1046A800549E2700B3CC9E2BB6D8B88EC31C0A6BB2EC09E46CC3A469E4CC2A979C8366013BB4262C9B5CE9CB54860CEEA9699DB31CF54EE8A1800B827917C419C6F09E07A0E2F56B1404AC96C7C3A503098CD02DCA8D962E20627126F6EB52AD216CFC237470459C772910F1A42FBDC7728E4AE67238027D16A8C8D952E9856A0F8ECB0AB934AE4F38BB074C2E3683D2A311E5273BF505CB9DC276F5809AED9702DE1465CB027BD08DA311B3F56002E227B97C2D49CC2FA72BD18D439861BD538C7CEA9024BC636942371677C107E8918BB7A91DCDD17D998076BD13060771B4142A08CA3285A24142A483122D1D6ADF2DCB90EC453B076B7E4A26E946D51CD6485BDA8E9E99CB932E690BDCF4240E2CA60068C62E111BB6991E188F2E3B4C49B772FC5615618C6410E517833E437AA92C19BD2A94AADA63E0AB8F7A10209F665F9AE6D6B1EE8DFC4A7399F14B365EDE8D73806456488CD259EA1CD2C372B0B2B5714B285A79502F1208A9DE6C42D4CF6ACC30BD0300F136486F084EBE60ED75B7DCEB95A5B6BBF1990B9B72CF50973787263DC0DDB799AB3F21A7FEE55F11F7638A6A95E750C6D3299CA3D4B2E9E952A94C0CF20239D835E5ED5AED269694215A8B7C5A5E09EF608AEE55F4F3D4CB38B6866BB27EE5C51CF11C5760B89E09E32796EC501B63016D4ADF7296B2A06B7E1137D89CD412A67C223ECBBB10A73BB317DBF33AA0FABFE93DD0EB08CE750991F6AC65F2F0794AB1CB10F82AF9A89AB29658D198998E4303EB0B55F2CD1D3EA2A4E301808CAD60C8A75CCA72C95079A361469EA21CDFD62C366F0A98711366691B25D77A13A35FE249E54A22DB3059EB472CBCBD698DEA55241A940669CBA90AD2F0F31A23F4AF979B16F88FD670E88FB60AEEA6BD7D4FEAC32C6EA1A79DFC750B131EED9A69E399FD49F7EDB477AB2442CCCF2DE8CCF70518B3BAF978D68E9E5263294B16C1716BE9098F3538999F5629F495E9EAF2039B2969D87D82A509C4C251B251361E81B7ECCB3D4063A7A3F1351506100B4F962290ADA9072477711D95BEA1587113CBD3BF6DA7A56AC82D4E6DD4C9859E57C172A45A57D39EE929D0AA32D5A65A587DCA35E8CDABB7F3370DCB93F53D2C6A983732A30F4AF9AFA54F341B39A24BB8FD2531B378D919183C7710FF009AAFA8A1563A1336A5C760681CC400D7C9951A308B69F43FCBEBEB4F2B97D3B4D1B012F2EE0FB6DD8C118D18E7CBE29DD01DA53C48955F6F008D11751E23EFCD47B17CFE9639B51A6FE6C479A97FC543798842B6714F370F13B7A90D3C84C64019E3C27AC4AD55B5DA439AB526F9CA2301BDB602EE3DA6B7EE5A7D0D28988A12E65433639A6886B4BD8A200B6457D3AA61CCCBFEA086CCB0B5F645CF0CAF084333423744581191368BA2BE6ABF8F572E601BA26E4C8895DB96AE340369B9B2106C03A84A1DA3AB72108CF3EE719A366FC54BE6A8479A48819C318CACB57CC7D364239AFA1E5FE14EC49550118661E9447B2518E112E154A70B6AC07328FBD040FA7B71D8E7630C1194CB050D3FF421C75CFE91F9A8888CA2218264CA757E9F57248FF42A5B13DE8697594CD2A90F0BDD21F727C5BD48CC1F0CA24773AE5CAFA43B1F33975E1920447BCD8E084699BE7727DE020D82D45101A8EABFC8D3EEB7C43D28EC2E3B0A72A30A62D99CB18E24A1CCB7535F8F512FC3BB63A3B859B3257A11AB1DD208CB492969E780F147D6AAD39CFE212FC3BB05F0EAFF00055E21F9ECFB752A7EFA1D9B3E91FF00AFFB76CB6683FED086C3DAA3B4AD47BDF8297BEBFFDA0008010103013F21B42442F91393EE95D8AD88AE2D2B8BC745858EED82D6FDFE9BE8445E3496B0624CD1DAFAD04EB22DF74C63258011652C5E7CCD7996ADC7697B3C33BA461F665ABA396A5CF99DE9D3F305A3B8F7263FABDBF5FF0024129C8EC8A0A8FB65DE8FE2A503455D0A3ED3C7314752C2E8E66660152E7291A84B1713452FCCA11CFF00D81738CBB152A723B2F1E666BAA9DFEB40163847B4288163575CC5D1E195AAC7635A0E5C6499074AF3A42C01C1E9EE6D37D38B7D4F0BEEFEA3C0511CBEA0BBB9A075F8984D9DE1E3FA4B8CA317F8E227D9C6DD9C0F99CE800F571587BFD093CB6BDC590845951CAC196A5BC6799A46F04C743C6A55BAA78A62A5AB90F563F31916F2035ACE3CCA0D4150358CAEE52D2EE5D0D988187909FD9304339730FA47CCD4B57930C05E16811BED0520AC5C7DFF00C874264DFBA8591430B1E0C318EB8B988DAD62C9EE2A9DBBCB8A5B1F0A9660E2E1982E6A2D617B7A12EDF17159561B2C7FA4D70D43BCE58F08E07AFEE3B6B982CFB91D3E0841E051BAFE5A4B08A6BF407FB830A021AE5B073286B4A72117A11C31703FFA1C7956C026A8E116D667F0086BA52356AA1406F071B33158EAF485B93BD39959C57B28E588AF2AECF10709C45A0CD3DCAAB50E3882815AFF0065DE0C488BF13DEAEF11CD55F93FC8EE1ACF317200E1C660350D740D44D4A46A4940D76FDB1C4BBDE53B89B7F2F22FC329EC80328688470E1CADA5F68D47DEF27D9B9DC34CB25D1EB286926AC3853367CC7A97786A050DF26656988140EDD2F6A5B39C5F89A0E9FD45D6F2E20CA1B024039CA306C57610D3FB60C0077152FB272621A1469E4DF7878702505B9B00D7DA3F7C0303E7100088A355AA532EC09470373FDAE2A071B7B8C0A0AA1C94E32F61801EFC4A9CF53712CD133A8510CDF77B768F95CE0E3C8D4754E8515886E2DA87C38238C76B8206334C3F88346E68784DD302ADDDCAC65B081659ED194C2A60932EA6016F671A116ACAA09A1707CD1CCECD42DB1861902AE21B6A6495CD1308693B1D912EF30CAFC621B6C0414B8DC7DE2E18B6271F047DA0FC1DE1D88CD7DB7311AA78727DAA9D70C704EBF1EECCDACEA62EDFD230070024C6B8E1E3CC8076EEC0C86AFD4CBD2C2068A36768AFB36736D4EC040E6D889583A56C735F78001C3CC4FF007152C1CB751D800BE108B475EC2ABC399706A8EBFA7C7DE01B8397CE52F0EBEB29B0EE8779D739E3FD402D7C08B2FB570F330A46A343D9CC65F4348D0997F912C3CDCD7F96DB4041BCA01A4B837A45D62796629791A9549B2673642174A9579212D85197B4A55C767276ED18AD3693E6FEB11D0DC696BDC3F73D94EE3DCF85CC51961815160D7D95DB7A9851B963E8A7DA1CAB5731E461C0DF3078F963AC320D54291079E18978FA5C15B2FC0967686CEDE6D4BC3F709896D9748751319BF5070C7C1BA8DDDC0376FF00C9BBE4D7B035E2D8DB8473B4E024124A383DCC1B98A121E7AD94341CB59BAC4E772971E9AAF883F8092974BC14FCE23B19FC484E44363BD6AE0392F54D9F11BD457646BFB7D45620682353B2C99C86869A45526E06D8B6E1BD1163F30ED8359A4B6B8A1EE411457225B9197829C7F52C56D566F6427858BD9801E03133660174B0C3ABA3DD6B0D1E5CC5B02CBF313FCBFDC0628AB1D867739711725BE5BEF2D26DB3DED36AB83B3F33E4116BBDF8301863C3983CA7C2203B27DE799BC273EB996563A3F03C9CE627C7A1585D3F27E255B910C3D59CA476654283E47A41F3F51623A654DDFF0015FF00B314BC15BCDB2BCEA6DFE6B781831DAF1F9970D6501E183FD64C5CCA47C313BAE83226E0DD93C40196D546EE6F2C57973A79ADCD3026ED273E3BC515511780BCAD271C9B891F4294A2381B80E81030585D766F875371B34637DE7D328C287261845B8D7781362D2A83BA1A426B277959068E18D9D2F9370A0C7AE7CC261429AF705DFDC8BF2CC487A8CF45DE5C86B4733CD7DB93CBE0277FE7BB3BABFDC44ACAFDAF73D07E6657E4DC2F5462DA5B7CBB7ABF11D5CFEB7731D8B86E43CBD841514EF86D3423E5B9DF4D2DA2AA0F19F5714A30AED85A03E76A65E133580AB0029AEF193A81205D017EF53C98AFB332D00C540F85D4D9C7A8EA9E4750177F888BA2B3E65D10314CA66C8F03F125F973823285BC5B55CC28B4DEA6CA3C4471B2D2B1FF0015005DCCFBCB070C76652CE5CE1DA1B7E23092776166E9571EA6190A0DA519EC0E7DC696A53B1B0B85EFB844FF00F4CC3AAA17C99821A9EBDEF0F9313B9F543B0D20AD256DB0D415C4C938E1C4C201CF78371BEB71C4F9D21B4A84C506A5FA3FC65B538AFBC7DD755956F1B1F373797CFCA0D88FBC2FA6C2AEF445ED2F0356330B6613D4B0C21D18344158D546B77276BBFBDB3CA968EE23BEA62F10F99C4AD9FF00CD73BB8B10E83F41F07EBF08EBBDC455ACD60ACFF4CB756EE3EE6A2CADA310A80A1E4705EDFB4A15711DDB063E62F4CA64789637F13B586035E9D9027BD2FE0CBF32D0426EDB1B6B9974C95751F1E11B75D0EDFCE67F99E67E07F6CFDBFDCFC6FD23874FE6BFDCE1D05F864DF3F313F77F6CDD8CFC17F53F03FACFCC7EA7FFDA0008010203013F21E8F419E95FF34821172E5F56A57FD02097D2E5A2623E8FFD14B9704AA85324183AA87A586E67E9A25F58A65D04DD90A4B19842B195665D2E0FD14961888C6E5E3A94BD3B5DE3D04EB3B8BD1A7D187329297D075D4D65DDC62E90C537F42BAB2B742A9467AB61D2A27D10170574AEBA41C419B8D7539928EA50E20CB8A5742E854FD2EA2AA82711654571060A08CE2C6DE01825D4BB8D84BFA1C199B4A4BE8BEAC589331AB88654DA0119ABE8BA39D708CE503A1473D42332C43745E97D5752E649662F310C38CBE8EB135185D752448B658DC058E9304410A224248514B743BE16FA7AAD0510FA16AC66C200DCAED0E84043047287E91A271CCB514C1736B8460B3A0CE6F491311CD4D8C095D18BAF106AECE7A0494CAF4A9B4450374A0C2A1DD7432950D03071D526D17198C024B318CB2368AAA3C42EEE66D3F9E220F28BD172AE8086E3B8BD0430B05CE5ED2E7A29A8566C498F2C768832EFA516E9821A7A3D07AF44144CE30E065F32E43C1CCBF69963EFA334A9B8F43A9E581D73377B986A256600CC66DD2DA6F3586FA10DF54E9DE3D399A4753FFFDA0008010303013F21FA074ACFFC03ABF5D4B9707FE83F553A543A5CBFF80CFD055F5D48744EA423F4DBD0E8661D4AA8DA5BA19175ABFE08CC4A4B2587420F6EB08D4AFA152A27D27454B2007585812113A6C24AA8FD1708CDCB65D383A378755E87D75F55C6A659890779C39CF4B8CF562CB867844FAC83282FA6252862611A44D749A22C74A83E9194D26902FA18A8C371AA1A132E9AE6E0AFA2370A8D2691B987A15309B8C6D0C11CF512BA0ADFACB2E5DCA42FA115417D42A7E8579704D75F779830E47427B631D091E60485BE636EDEACE0455B73D06199B8CD7A0C70C1738F5DA32F433F4C4AB4FA53D27246684D65C52AE8DF07A37B750055A5F77D21D4AA670CCBA18F537A4D094312B1D2512C8F474C267D41B86A1BC421633A1308DE5D0E63A8B4621D74A66874B84553484A8AE822EA628B1833D0D6B895B63E6372C81D2F966333EA2CA95D0B61BE8CBA8C099A12E15C692C979F40EBABD5184C257719D54E97135EB7EB3AC3A713684FFFDA000C0301000211031100001089F52C9219F49E142F2AD82032480B1AC6A90671249209898E29E894292104BCC36B3AEDB942EF9AB55320B4BCC57A3EB558FBA1453874C7029600CC68FA0AEFD10B6D46FE43E477E2AE24F93C0889B407D9F7D687DF7C3D919D27B7A0AB789CC4A602C9D70F0CEE7B761D249692C6E870B224BCEC677F4D102DF1765DDF31DF4A78A5E30ACA245312B39CE55CB14A408A37FD8A72A6C8E8037896CCF392C13B35074E2A50FFDA0008010103013F10570173B798C86484ECBCAA0674E68C4A36D96C0005DCD1728D8F40E07E40E6F46DB1BD57D2812DABC1D29B929298F64AF42B2B79CCB9B739EABB187EA025615BA50112E14698E58852BA549815CEC56C2B61E564C007CC702ADE88B5747C4741020ACCD0CB46580177CDADC0341403E572E21E6E6036FF00B0E8505D3E663FDB4223969576C57CFD083B80001C68FA50000A4C88F0C163B59B28099709E8BBCB3198E2B897740C4B1E5E61E551103C00B4B800371697900C4198525DDD71713A508D19575802F98CF2DA039DA99BB99F4064C66C4C32C2C2DB748B30739D46C0C3A48D6E50DEBBCF0BEB000746B1584478618C4F0B2C2B91075044A9880DA200E5CEB1B65172046EBBC600D604142AC07BF63ED0481DA3906950BF694F80A9AB940B2F7861D6929DCF70D9E633752934050E31BA822DD8AEC759F1882E4A7182FBDD4FC2055FD9204596DAB079A48003E4A993DD03F9897295B3D0168184A61F8AE60F7C019AAABDC12385FD1AFA229E60D5F35701603B44702878A61072400C9C44202C28A86EA73F93972C180885791C8B2E257D2BA2A4E4037EB7282D0417B59A1A1E657F2550A03D83994CDF4B5EEBEED9F9E49474EAC90F0236FC434B2B5013392B312B74D6E7D958340F99B7F170CDA43012E9941F690811E4954896BC239A17DAE50F540E17B2316AA0545C14A67ED082CD16ECA79B96C81E84B042D415DB0A5D8E4429A3A986E7C049837EF23B1F303CC0C95194A153D9267D1BA0D874593F3550C5882C8058A2D2FB0661F590298798D6A5402EB4381638034501F89764443ACE689A9BF12142C760B8E286DA156EFF005062F49A010774BFA47999915214DA9877898E27B0B662F574CE625533AD5273C554AC2A29766158D1C8DD242582A800BA6B30A39A326B02DCC344EC57440B1825ACE47B949F317DA802EFD219CECBB988B99BC988D234B05C1BA0A058360EC003358055D04AC160645E90B42FB10E5174D19D73324C06AE5100AE45BF98D8B9034CBC0546558159F67FB86062D8E8714F8C903ED16AC36B20EC583C64DA1BE2D554C1CA0C2BC19B508EDAC6751B343E3C418D1D2F788474652E54D73163A11C19C97556C6AE20388245E427906AEE31CF54B2380AC61C8BB81DAAA831AD896967EA1663CAD96E3B1EB31870A41CAD3B6B89FA46916D700C7570DB887B20B7E271A32B8ED44B4537CEBC4AB0005D2342B4BF3150D7C0AAE30F0FB80A775B040B8C63C106B0185EEF699E2E817EBA2E44760BB96C6AF2EE9FB532AA8A6C782A2A324C5F9CC78408B51B4B14561DCE2A4901825BCE8BDC3AFCD8D8C5129F032B8F56F06CEB0284546A164B42D72B4CD0F62C28961947638619F12AA01AC52BE60B2A0FCD966AE2ADEF1B3E11DBEE5CCEF6B176EEB2588100294CDD8BC3C8C5EBD83D4AE42AC79E6572152CA0297BE7997D2D46305C3C1D4714A2C6429EEA356D547D96863508D0B19EDC472BC006A0C155016D6562EEF7750DF29428C8B215EF4EA33F64579365D1805DBF02C0AD9937121F898B231E4E615DD35BDCC174A75DB74DE52010534565E4B5B39C4646455B8363AC3965083BAB40ABF12866B6EAAA8D1330B80E1A0BA506CBAF87104B83CE1BC6BBEE12201C0AD66331708C94DC11E056C2C1849B728C95A61EE1DAEF5EA200CF78E540597BBA95E08DDF3F787C8ADD959C3CB154F100D45AA3695811C39388AECDA745381AEFE108D2C8059CAA9C3C8C18428D8E081EEDA788C211C06828AFA0ABF3280E8336400D348CA19369F74E6F3637CCABBD67682B3E0EE41624814C103554F77705D2101885A5CB1C8A762D14F2D843AD8CCA217556F2388E519102FF00F3987B64EFB95924D08BBED5BD42667258B542B8D5D4321E04C69CE3B2F7091ED82F02D1C5B00CA160587CB7FBA94825A42C1D166FB46AA042B2A9B90688868376C47D142144F136979CF1112E49125253C286C6A0636F2CACA2A151D523E7B898C2E8C50658F36C1D94B1ADE16BA76B60368145457A11D374267C9B8AE394BED687E21AF5A6AFCB2FED035D9CAC2CB66ADDCE0E589EAA8E55AEFDE0CACB30673EACA81D32E50B23A39CF9805B6BC891CD1CC7E6858EEEA3B5C283758F3EA35B8F1C2B2CF8C626D6B93680E1620ACE6BB731D3BB2A29D01A5C150A21933E0E6F8E4CD573AE672C8715B5690CBB0CE2B51DD211E6DA032DCCB950616A8BAD5385336EA3C87CACE630DD2F930C32C93B740665876DC470A100E29864ABF1860ADE5FC987F309AD006DAAC1D26AA1825841AF3B2A8BCCDEC8159EEAB6042F32B855B2B37CD24B8FDCC1A8B6FC47866529936DFC41C2A0307899CEECC1EC983F0B9E2B4BAAC647CCBE012AC00663B5F8892D1B7410315959B36B4D45C6A6E50560CC2A8460E4E50959A041C592020656ACC2754C6912D196B0A87653D8B296D9814231CF3297F463341B827842C50897562A805A030A380944C294BF5CCE20DD5E16F6D12740C5598CCADDEB569CB070CA37E25B9E90B6992CA1CF12DB8591951B2DA2ABAD423596C6914EF1C043AB10BB86B31F1A29D4D85E568799532C6A800CD6AA24446956ECC0060A3B92E6FDD111F68AB578EF134854A420DB41C802B22F4435A1840C7CACA08094620A354D1498C558C70BCC05E21B15DE597BB999F804CCE4E6E62A362F9E6627BB10FC426A15B062C25340BFB846669202BE2D86169DAC31B0AC6B1329C5E84A82D2150056864576860CAD05655AB42EEA7865F9A85EA511555A39B0DA17868FF8AFC44715BB5BFB45642063E00231EDBA25C61FDA0A6F72E8860133816057803DCB2AC0E7A22CE8ADB4E72C0D24DA2539016A10298B79431F72A8A5CEC40F2859DAE5A9A39F17072D855FCEE46EDBB75C663AFBC6AECB29C5C655710E23BFC156D3B00DC7E6570104F61B5F4987D9816AA1EE5A1DBCD4608ABEDC17360D2F15A2216CAC08688AC36F7C47463895019502B9CDF642AE6AF9C0A45943B97BDCAE8401411C88EA69A130FEE6F7D19100032EDA6F372DE297DC2034A0BEE9285BEDC50AD380D5702C570FFA83411E17B7F52AFD4262D6FBF1AAF6DA1AF7995F9F440BE55D9DFDA36F6A72F3FE7E62A3920D4C0F38596DE8D845C0ABB9DDCF172D90B4465063168E3095EB9120669DB4F70635556F0DE7F531927BE729865589B6AE202B6281BA2E9690715AD5BE2E369385AC805908B9F718E28500DD675B4A8604352C4C460A3178316BF0BBA1B6AAE212404B4B34215489B22E0489A810F02B82DB84CDA087A7396EAEEF707A073316959C7696B8A532B548657E007DA5376929F31AB60376F1DA55AE5E4FF9165F2152AD4E9AF988B08B6AA058A1419DA6C8E1B16165F63CB339A44E6867C3A28710B4955E431FBA83447CD4979599B98324E96280694D1A0A20C22C5021600C6990EEE3C759EFC2545B540C5051A506588DA9B2A576014199042ADABC6EB822004940C4A189824417C8AA356AC7DD9E289CAC0065C79A136ACE8D54B8C72CAD0A2554A8B56B703952169DF735A260C8C231AAFD454FA4F2DE18D2838B46B52CF8C55B0F39A87894E5BECA084F04B00763055A83C41877C10000BEC1A8A96F61DEF94C786F4EEB07F70F0AAD0341E6D6098013566F214818A03EE846B916F98565AB6858958B860EE5435CBC6215180DD6A16C1159B85BCE4EA00077BCD0B728DAAF015013C029A24512F2AD5E0AF337924715B6BDC71585A1DD1BFB545B04FF001CA989C6C505D7619903910C061A1E9715EED786133E7E868A5F7995438369E2A1B1E894109ECE087CEC0E518BD907E6CCCE94FF0088EDBC17E7F88C6860209C1D791871479A3FE4CE5CB445DF027912158D56F4DD28D7CDA5CEDF1A69DE29A582F0421742DAD2ADD8992FCE6C59A3EBFB9FA70FC2743BD5E9FA742FB7B10DE7F21DA3F77F73F8CF13F98EC4FE5F53F9AEC75FA6CCFE53BBA04FE0FB27FFDA0008010203013F10CCAE8A9DC74A5DFD69702BE8B14B5EA30AB8951EE322806BFE6E9F12CEA72A8238DC437CCEE3048CA8EFA54A7FE00911D16372A2DC40944283A8157033D06A4B918E2110A1987D09169731DBD213486798A150B152E67A6568CE64545A20626A6B705837D2EA2D9672286B94469CCA97355AE654ECC076484D3728C115CCB20C4BA88416A68E892A57417EA5ADEA389282C948198172A2691DE4A245D4A1CC33530C55437159F44C682376A3135BBC0C92A683128E92794444E8AB5149C108AB12B5756A5DB712652BB4B7989888E27317AC84C6646BCCC25B2AC6B287133DCF5D06F5D1231D260DD322711094731F1B6976EA25E61AC80688B610499660A9415CC42C6252AFAA5FA84E18CF7C354884AB2928C33152D477654605CC895C53145998BB8583897165D470D6E00A9285B96B1021BE6600863086014B1A9A974C494C903F54B1B62C6165CA111D4B264D1116E6C5CE3AE09AA99A02CAB872C405E22732E262F710A95781F92215001EA23CDFD7DA1CBE65F45C7223BC570901C8CAA20544B9923ADC2C36D18CA881CDC7635F9E25747F0CB0D418812E62BFE622C3DA73CC47288E5731EA0731AA184C308F047E61D1232A59665A9442A6E2AB941756A1B8D2DDC4788ECBC80312A3657C4BF07F5FBA9A954EE6FA131D192578E606EB2825843B1982C98BA14351C445C061CC1090A0B98902319559ECFF00B31064D91743C1CF817F5704EDFF00DF8E800DB13A155A4763A65C86A3A49531AD25CFA65A6A2B4E6A56AFB539F4AAD78B82118D3CCB1889BFC1FE31042ECAD7F3F152EAF682CF529477688CA06615D54C1898331D84CEC92F84966E033CC5B47B99E4C7EA2A86A66DDFF9DE382A9388A1DA36DD92D22A86017865CDC59699A6042D89F7952733DC436CCA146E2DE95D42ED38961789E807C715FDCA1CAF881942BDC7117BCCAA1EB73D030CB3A966599BB2658E19A88B72A6F297196FA4ADB6F867CFE82756A7A37D2E5EAB7E3A369A3D41B3518D7AF99AF5F13FFFDA0008010303013F10B972E6A02DF4E6FA6FA25CA3AD4885D45FA6821DF1ED96BF4543B7D40164C5A952E05F4638EB5A263509A7D6929E8A98EE5DD6E38C4A89C46AD3352E8892EE33BC44A71F48F46D15AA8B2D08A99E6176626412880764B3503C4B451D28CAEB72E50D305A8411A63EB0736E2EEE4A742836E896B6CBD84B4F48A6E56EE73C7E8DE15D4B84B399626395473E6056CD1131664B961647D332F4358F4BE859BE208A428B172E292F2D61D860A2530C32C963B8E9464898CC122DF5AB8B802393422630E3E609913D2C2D15101DA21C4482B7D1A32DF5154325F3F4302AA13E44FEE0984BD712882371E24060388B8AB6CCC2CD23154AE1DC58DC17245ADF5BC9703E42225542C5C89043359CC98918E5C58970CC38841423BC6A3DD1D4507BC5D854A9ABC8D42A30AA565441B5F4B0858221BD71174089495F5667022A8E111840CCCE2419AE9718023ED0154BB53711897A2A116ABFB8FC0AF895D5CC6D8A8B4CA4130B35E219D98C995938E955A772831065FC0473B439734DCAAE8D2DA0E5DA3BA430C0C6EF2D559D888576319B580F4DE235555C081A655B865B9653AEF3EE591A30F408C62E546E024052103844E2EFFAEA5794C32C62545BB89534144B8AAF100701628DC4EA52DCF111A460D350E2CED15AA10122EA59071999D824F93516A6581545C02CEF324D9053D371AFB7EEBA1DDB11175072371C0AB462A60B010730D8C62C56A11BE7A0061CB2D548BDCFEE58DB26CED19A15FBFE926012502E2E502FEEA04815152B6E6D985105B8E30992A63D212662D9BDB309721E1FDC1B9B2550D6E60BB437505FE6E3C905B2C8D0B30ACAE6A445101512EE739C741BE258747E603B9287300969E6382A56CC063C4F38B98E610CB14312E1258C12EDC329899B564CD04508AF1D4D3FD475F5374DA1AE86713E7366733627AE6F1D73D1B7A3FFD900','Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.',2
,'http://accweb/emmployees/peacock.bmp','1861.08');
INSERT INTO Employees VALUES(null,'Buchanan','Steven','Sales Manager','Mr.','1955-03-04','1993-10-17','14 Garrett Hill','London',NULL,'SW1 8JR','UK','(71) 555-4848','3453',X'FFD8FFE000104A46494600010200006400640000FFEC00114475636B79000100040000004B0000FFEE002641646F62650064C0000000010300150403060A0D00000CF80000147400001F5300002F80FFDB00840003020202020203020203050303030505040303040506050505050506080607070707060808090A0A0A09080C0C0C0C0C0C0E0E0E0E0E10101010101010101010010304040606060C08080C120E0C0E1214101010101411101010101011111010101010101110101010101010101010101010101010101010101010101010101010FFC200110800AA00A003011100021101031101FFC400E8000002020301010100000000000000000005060407020308010009010002030101000000000000000000000002030001040506100001040201030302050402030000000001000203041105102012062131133014223223340740413335501542241611000103010503070A05030305000000000100020311213141120451221310206171913205F081B1C1D14252722314A162823373B2431530F192C253C32406120001030305010000000000000000000021001030406011205070800112130100020201040104020301010000000001001121314110516171812091A1B1F0C130D1E1F140FFDA000C03010002110311000001EA8A9F9E78BA58A36CF5698B45E516027B2AC9A7433832C76E73242D6DCF38D66F672CE6DE6E8CD6BF99AC1A037EA0F067E7C62E96856B909D5AA5F827AE8B7019753DB018E44B3842CE6A3DAF06A7E67ADFC7D68B0391AC1B1593ABE19C338BA09EBD5B93ABDA6E353E139A0C3AB635D130511BAA9B74BEC4B5EACB74F5FCCC2CC41B3B5936272757C339972EBA091BF583A42F4634522883E8C8616767E7D5A13A8C01C96023B5162351D0FD3F3BA52A14B6346956CD23F0CA3B2EBE574EEF56ECC34E8ABD261296D2625631AD3D7A25E6D76E125629CFC59ECDE8F0663798254C69D0BDBAC30A9C6B87B69026068325E9F81D8587B71AB26EB1D669053103E8666398751C5AFBBF8729BCB149634E956DD63CE987A4B793791975C03401527EBCE5326E3D9B63D29A66C6B83A28A2B40D763EBE5D298FB5703B9CF5D2F2C3546D3A95B750F10713D1ED53D9B36E691A7AD1986C3A99E15AE7DCEA96EC62510E8B503C299746EE5A0592A66D5D3FD4F291154CDB9393AB85B85E9658349234BF89C6D02B49D772379D4835CB9976AEEBE6C06E71BA713825EFC2C516A1EF9FD3E9FEAF93848B3FD04FC7386B87E93729E5D4DB98D54CF47252A52E8E2FA2BBB473396766452703A62DACA35635C98CAA85F92D4CCEBF7A3E68666631F453E9CE1FE1FA4F52F36B6DE0FCA82F04E5BE783DFC48EECE5526D3FA31A53A47E7DD6A3B151878EE76E1B0E73A12CDB37A7D6D71070BD2F8A73025D7669CE91A73055B182C0810146A4A9ACC316E1A70C4A6D53C8F4B4F1ABA63670CB526228D875A327570DF9FF51B818D297DC1A928FB3980EA1D1B96552487740CAC5B74673AE042E6F7AB695D33B7873495F49ED57B7387F85EA8BACDAA9966E85D57BF88B04A08AD2661B792DA2D7BEEB710A49B7783275D746E9E46025910E455ECAE29F39EC190498EEC43B3D57D3E034D142030C2D5B0D31582CA68C487E87D0668B34D452E8F332F9578D5FB271A79EF5F6054C2C2A1EA70C11AE7C8C60702AE1DDEAA3DE2C36576AB11D07BB97180802F416209F6AF656475C85E73D8D812569B794ABA716CAB8527B566864BABF6595B21CE07B36BEDE0B61F9E38980071535908BF6EB98FCE7B19E4AA9BA9C28B7354BF6A48ABD926FABC864CABAC36E4B6875D5A39FBA9896E68055680F4C69666964AE78F39EC54F7729574E3175466CB0922D4D1537D590AB1D255FBB1360B9DD471977D93AB2C45E9D161810B333373A79FF562BA5C71A42B743E48C3097E4272D3EC238CDE455A6BC4E02E638BE8F56A9154F24265995505FB2E28A9E8617A2A677004A9D5702501AA8B22A10E0CA0AC53E568A85D83BB33ED67AB6435C881A212C09AED156EABDB7264BF4A8155E03014B58A15D209ACA8CD1755EAAA5DCEE955E9B9566C861BAAB1BB5EABFFDA00080101000105023E82EFEE2B14E2BDF8C20AB9C1ACF54C89EB51930E87D10CE75EEFC4A5196B9BF8E2186F176322E444044F056535576E55384854BBE3737F4A6AF2FA436AB96B77342BDC4FFCBF9A51EDC795539286FF00283F8CAC7AC713957C31413C3974E238E09DB61C257893E31616BB45AF81AACBFB5911FD41CFF28D1036659DA5A4976386BC304B35891F4F5D62C1D678CC8F8EFB6C6BA4D4DC6C9B0F26DBFDB5FBB7B63157D70F2A35684DF354B4A3FCECF6E3F936EEB7ED2692273E34E2BF1295C72D635AA1D93221A9B1BDD96BB78FD877EA672CB3B6D37FDBB6A411B8C3726F8F54F0D56533F333D939CD637CA347B5D9792DCD0EDAAB44A5A3E40577045AE29B5657BA9F656754B4F0CD816CB62087E37F8B4826ABB0A5A71252A15D8F66237D951FE767B2BDB597E26EE7E45F2BE466C7432DD9EDF8D5D86BFF00ECC2E85F950E734C12D7D5608E6B01D6E35E2B73E3B3E45A71B081B7F61A8B34772DB75653F2431FE767B296D4F6503DB1D798166B09BA63657AF25AA9ACD8C9E4BE0ACA55EB4A0AA0F5B7BEE8A08A46C062DA51274F6A2F99BB985D06E7ECADB7C4AEC9621AA33AD8DBFAA3D933F2C8554240F1E63A2B5E5BB9FF00AEDE43BE9E4DA6AF6B05E6F99F8B8D44952DC71C573641F2C93F73595BE66C51CDF0D686C50ADBAD9598F65E3955B534F1B7E3A507ACDC45EC7DEA3727C72BAFE54AAF97C82217AA49E2D77B0EC9F5DD1F9569EEE92DD6ACC92687413976BFC72CF654D252D735B735BE4D73CDDA1DE53A4884B6ADBFB594DD993868EC7054FD0F8EFB79B343B791EBE17A975DF0C5A789FB3A3B3F1CABB7D649FC5BB87883F8D3C9AB48DF02DFC4D97436639F434ABEB686FBE2B3E61E29AD2DD9DD765523FA8383ECCF6A032ED2FE18FCCBFDCD64CC28DFD8A3BF65899B62AB6C6B4AE67B5DA505E86B57BD1599E016B67E355BEDF5362B3A450549227B7D93FD546C2A8C47E4D565ACF2770936B0CD1E58E4D726B9772CAD26CDF1CB7366F6DCFF00E863B2FD63FBEF558DD157C12B1C678AED55301D45E3B37171963656A38E78C5ADC6B554F326AABE45A9B298E0E0A238936DE72DB3B6F2226C55F0FD649736A7D17A95DAB1C067AD2AFDCE920C0D96EE4D7D2D75F7141D952774667A905A53579614D7588956F29F20845BD86DAFAD5EB6DDA9FC6FC377CCB162AD3D5434EC471D41EAB21772F550E5CEA158017AC8A51D974B3C934049A779C535E1E26ACF2B361ABED229933510B9F6F470C10F87BE1D2595357827575D62DD91339B376AC71421EE737F459BBB5F3CFF002617E9BD4B4C3D43348C2C9907B1C835A157733BBC936AC82FD27B27A7E2DE5B059BEA7F97E2AF0B68C74AC7CD1678D756C2D959FB7AEF2492DCAF81C17C8F8D37E19876F62EC76439ED4C9BB4EFAD1B1B4F13BDF3D5B565E36FE2BBE6F906A5C702E415EC3DB6DD7E58668E57A83F4DBB673E59258D1CB4C2C6C8D747D8BECDAE05F2442BD863CB9CD7995FF0A73430EA6EC9AFD30F1C66C6B78DEFEDF8D5FF00B98AE536FE256E2B5141DCFD6C2D77736594313E30A7A41CACD2705481EF30B656E1D5A5C413B6F6AA78CD6B965763AC3ACB1A6D491BA0F15FE39F268F53B1D8F8950BEDF1DD7DED152AA0B96558AD4E8494AD393BE2731EF64EFCE13EB472A7503048C0336A16C89E0C69D6DC16C2771505A95F036073A6FB5FB9F1F8DCE89FE23B93B8F1E63BBA48FF004D9952B239D966BDDB36AEFECE1FF1BBFC70FBD9FC8FF62ACFBCAAFF00B53FDE0FD96ABFC5B8FF006FFC53FB38BF76BFB2DEFF00AEFFDA0008010200010502E0FD01D0CE0F0DE83F482087BA770DFA5858E8EE40F0EE1BCBBA822E5DDD0D0114D3E9C3797F0790B2BB561BD4C3CB79C2C74E51E86A2101D0DE32BE45F22F910917A23D18E01F578585DDCB793CE38CA3C04576958432BB538617F64DE4F2E1C03C6106AEDE72823C8E4F0D5947B4A3E8494CC224AEE5958584D407ABB81D2C4782135A9ACC2C1442EC28E421E8021EE786F0796A3D195959E08CAC6104161613783CB5058EA695947D501F4421F40F039C753467AB3D18FA206501D785843D3E9307D11C0E0F5019FA43969CF5B07F478FA4393FF103AFFFDA0008010300010502E1BD43828F328E83C843E9B8270F4EA6F03A72B3D184475B381D072830AEDC21C353DCE40A78C3BA58D3C0E8C2EF40BB9F6E30A61D4D77A772F640F3DA82C73226925128FA8E8017C6BE25F1A2CC204A0874BC7A44FC2F429D1F4E10E8FEC3087078EE0B28800F7ACE43BF3740E0FB464631E8E6A6B96517A2F5EE8657694E18E0FBF40E1E7D1A32D68734FBB5A14A4A0D19ED6AF40BBD33387FBB9DF87AE4F667B263F09EF011932BBDA5364685F70C4D21C24392E523BD3A072E43DBA31C14C7969EECA29FEFD010E1C9C70B3D4E083501844A3F40A7FBACAC7480814F3E9F41EEC7402B28B56392E081CA3D64E0139EACAEE5DC9D93C650EB91DF473C387016511D0E38FA450E1C30821C1E643F4C7B703DD657BF04FD32BFF169E4F27E91E7FB7F4611F71D5FFFDA0008010202063F02B24A1D6EFFDA0008010302063F02B24233047566434237FC3170BEBD9831A8CF27FF00FFDA0008010101063F02AA95C6F2F713DBFE854223172C87CDCAE67473E761C1EFAF6F3E8A847254F5AB7059B35146C32039F74D08B2BB790F37C42070FEE38B7E579CC3D3CDB392D428F15EB45E304C07BD44F605938C6FB688C8D666756C2EB79FA7D581FBD16527F330FB0ABED0A9CB9F62DD71030086793CCAA0D7A57027DD6BB1C0A650DF46809DE1DA6DDCB4E349D62E0B8FE1AE68941CBC3A667D3D08788E9673F6ED6D658F591B41EA1C351B8F780A3BAF9D069A4987DD46FCFC0169C8E5F4EE75DCC6B079D57B511A7FACF6F75A31F3A063CD04A1CFCD1D008B2D065DEAE6ADEA2835B271329B2953DB54D72678A697F708AC8CF8A9B3A56512E5737DD213746F21ECC46D3EC4E87F573733CE502F256BF5504C3EDDEFAC7256B51D08BE460918DB73C7B3A90AF25CBE9B4D7AFDABEB8CE3E1AFB10608F2F974A2CE27087E5565A0629AF06E5C276C45BAA2C131B763956175978A28E4D9676F34CDAD91EECBEE38A1B97AAC2CCEEF8735119786E86B7B1968AA2FD347248E1865AFA165D431D19F85E08F4F258AD2B336C3B518A1B5A2F7F2061362059648D158DFEA421D502DA775D82E9013641EF0AF6F32B3BCBD05BB6230345D7A1A43DECB9EDC51D26AE06BC116B5D8E29DAFF086968877A586A5D566D1D48727023EF3BD0897DCA8E7E5EB41D0BF37526E7983B2ECB7D09C4C81C311B16A73772376461E8507F18F421CCA2A6D551DD75842834B9AD8E3249F9EE4DD4BAC646DA306D5C22EDE3DD057F98F0F1FFA92BA93C63FB4F3EA2B88E37DC8B9E5582B5F52925AF76E6ED50360B4E50ECA3A2B5475F334430B403BD654BB0A74A0D7C7C313B038B3A4B7DAA2CA28E96419946C38300FC398396A547232A07018091D65678DC537565D6BA8093784DE36F69B5CCE14CDE9A28B4CCDE85E0F025C085C12FDFE9344C6EED48AB6DC13A58DCC686D6A2AA2D4F886B9B0C66B9EB46D079D47E1DE10DE27876888965D5381AC935A03466170AA642306368BC3F48DB582FEB3CDA6CB796D43F899E92BB83B1574F0DBF94FA93B4DAA0594CB94E232F42FF1DAA79AB6D86603798E595F24120C1C1CE07FA50923D4C6ECA28DDF7569B1031914BDED63F1F3D1183551B80B0FD7A56CD82DC51644032B6D027E6A10C00548A8B029E723721A16BBA5EDE6976DE4A20133F89B5ED3CBBB62EFD7AED5BECEC595CEC87F37218676D6FCAEC5A76852691FDD81DBE7685A8D635A736634DB40A236974C38849E9B958554F2D391A9B55F2B1A3D6B2D6876739BA398D58FB19F94AFB2D3EE3A3A3E673856AC22E674A9DCC6E571AD8EECA2E031E417D777AD46CF85A073DAE414CF61A807283F2D88B24150ABA6978D08F75FBD40A9AD83F547EC2A8D9C31DF0C9BBE95569A8DA391AE2E0C0DB4BDD606D31434DE1A69031F98CE47EF1A52A7A362678CE9002F690358CD848B1FD471506AF265861B5F5F886CF3F3C21C3BC5E9D169FF0079E373A2B8AE1CF63C77B93337B117B7E9C9F81EB5499B4E9C166D34AE89C2E2D710B8667AFE67B43917EA662FA7EDB2E6F605963617EDB17DEEBA6FB689E083A7EF3E95B11CB23B88EEE126DF3517166AB58DF7DFD2AA399B50E94F7BAFC074A32BCD495C466EBC7BCB8726EB860BAD6688ACA455A30C16F4797A5B62037FA5AB4EE81EE8E4949CC5F4395831A210F8980D74DBB06A8D95E8736F656B66DE46F1981F96D6D57D8C51FD3651D238DC5334AE6D6ADAE7170A733A557B170EFC97FCDCB56DF83970E5B0EDDAAD55C5583CBA901B36DDDAB45A6A9191B9EA40731B9DD94B9D8DC848D73B24ADC8E7F79F35E0E4BB754DFF00CD6B4E4D5E9FF6333B3678EF02BF10E47707BF4DDAED5F77E2329E2BAFB7F0599EEA924E5EAC39732749EF0B183A4AA9B7A792C2B7C2A3AE4237DB5346BB03EC2ACC3B500E44F6A9DE1C5ACDD88BDA6A28D6D32FE08E72192D2A5ECA64646061B1F627F89698989E1F9E122F196E51EA9D64EDDDD433F36DEA3C914B2DBC2B69814D64317D089C0E6BAD09EC6D8E677DBD7CA00EEB7FAB92856556F5ACF0D87D88B266D8EEC5C3FF00856F23DAAB86DF6856DC2DFF0065F7BA9364FC47C6C63867AE04DF4B56A3581E5C5AE8DAFD30FDB731C6B57118A3E29A3B44ACE2478585324901C82C923DAD51EAF4CECD1C80398E1883C80681BBCF751DD15C5653309350EF74E283B6A0D7599AC1547379D1CBD8AB8DFD8B27997962A87CA8B2117D9EB08C9A435D8D5C2D5B0B1C2E76D47EA88DB6E198DD804FE193C30EA6770C2B4048C13DB5E189248DC23FFB97EFF52FF1FE22E3F69AADC15EEC6F7628F15B96BEF0C14BE1F2CDC6D3D6B0D7BCC388EA59B925F12D5932663B80E1D09FAE9A37471BA803701E644EA58D7B5B6EFB6EA27482C04D40E872CE765BFA793337CA8A987B566F2D85797BAA95F22ABD47CF72713F4AB40F0DEFCC337B965E132C0E7BC8315AC22FFEF571EB5AB81BEEB43DF21C1CCB4C4DC3A936461CAE6EF35C2F045CB4F2CB289A660026736DB7A7A5491BBE254E4E1CADCCDD853F892F074F1F736152F52FF823D4F5FABFE94579BD68FEA5E7F52F33576AF0DFE6FF00CABC4BF9A2FEA7A6FC91AD47CEBC43F97D453FE61FD1CC7F5B7D2BFFDA0008010103013F21422D196659EAD3597187F9DA5C45E8C9B98E22DE7F0896678C6D495ECA655F2622941EF0630C4A1DC87ECFFDE9692A8ADE89624C4CA6F0A64C0F32F9717465D1AA7037530438389EC997CC17F225FC079F1172AEC676917757D1823D9857C90D53AE040E3F7FA1463EE60CC52AC8070C5341B987885ED827998C1DF48871E44C4CD3E6F1187C178F505E20D824D7CCD8B92EDFF9D2C0EF2F17DE3B3AD6DF01E793F04E6B64A01C1B84698F1661F66181C12C881CB65669AD8B62E0FCC6F3BA3CCCAB8C0E0D44B37B1343FEE6293C45A1CA00C8CFB345BA79D4BB560F1822B3EF150F64567A85A0549A6456B5A12F72D37CDF64D7C4ED315386FC13323385C5C3058AD9D4C066DB057E11101A368DBEE997C620482B83A78C812BD692BE3331129ABB3578764B8CD4B489391BB551C37FC5CEE9A03DE99AFDE7EFEBBE2ED2A0F96581255554500E0D4C9F5096D3976FB4A5B86335BBFCA65AC393F7B407E01243E339B9960BC6FC8213CBE39ABF68ECF3DCAB7CC6AA2D92064C697BBCC029026B03CC2E7790BC704B93591F4A9AFDE68F7D6EC7894ABA28BA81404DAADC1C5B51AC5B307E552B70CC1E43DB338D34D588AA30F21FB52341A116CFB6826CB196091B95C57E226818B46623DA624F03B4EE88C75563738A6585A2C55F6CCE0B0FDAB871F64D3D16691ABD1F062079396045B817C4B916C31796625780CE74BF1A956BE0CF81DC0EA6F726B5BCF22614C443C1FDC12BDF4E23734CA9005C77D3F1003321B778850D0E6521D277EE0D67B41EC93DC26896962C01DC86BA0DAF7530038C12D2D4521C36B4972E66D21BC210FC10E8CA0EEDACA3C47BA6CC915DBEE4871E6FB3EE13E301DD999118A3C40EF059F9467698D1C9C7FECBE2D606EB007EDCC25E3134164EEAB410D3DD864223F03F70BBCA45D17646C157BD861ABC43A0B4EECAB2464D5B02190841AC9BE5AA6BB39FB32C63F30827200BEAD413E3F51525570B7C62FBC1F941A3FB90CBA32FF81EE6A20DA6F349F885E2D62C9E15DBC469E5B815101A2D70800DAF72F116F6B3E285DFA061A9E19430D74A8E21817997FB131F56E2E6F61164D9E92A2F06DA8FCA0069B1A513CBC31E6A8E606F3B1E4E676F588FD5C25D3325ECD6A314B3737D516E63A6F72316CE98F2496B5B840DBB583BFD12BF042E49235692AABC5B193DA998734E8FCEA045715EF94FCC350F8BF99BE197EC244C5CC13715BB988B611ED23957F975F8615B56B83F3295AD56132307C58C3CE2ACE19B3B864A2D25F7331A60E8577078481742363430F825860856A4EF3474580D11BA84A77643E91FB8C9BBFEE7FB42947BA69983A81D1440E15FB1E997080ADDA1C3BC7997C97F80C696EE7305D0F6E496D637C47DB4D476A351D9661B9AD417799B312CA81468772F676941842785BF33F6200F242D664EE7CD9AF4CA820F3DFF000F71F1AB1B3F7C3F30D19B4964180CEC3D4B252F045AC528D4C9D02EBF2EE0C44EDF081D8C797B835C9B720C0B9E518A762793024A261D42F265A3C4F78FD164BF62ADEA01770CFEE559D91BFE0FF51859CC866F0E1F247EEDF5B2F4988A9FF3D12CAE2FE52EE5F6D9101F16563F30A855C0CD6C2839BF1048EB5C4E6560C79C47E37380ADD01009D65D8AF73CE56201A1C8C4B99E1328704F49DF3C8BE1A9AB39566F84DDF3FAF04009C4A6FDC6ABE53E4EE7726799368E359F1BFF00B2BBE1C61FEA0211ECFE86A661ADE0D78C4E108924DE8B72637174321E5C02327231DDD36A6E0DD33C66D52D87A978C27D884F3D053A53D724976E5C633972A379A7F09DE21A10ECCA8C47461182C3B3C44CB42AF5E7D3333F973F33480BB430FB8C4C0705F87097118D1D2039C06208C540A5AB47B39364B83754386771173DCCF4E239AFA765C43BA4BA3D95B8860EC039FE55D2665DEE257F90F2A4BF2B9EE1E6129BDDAFCEA736AEFEB717083BD279267481BF09605C2F7C387FB201411D26BFE32A1C3AFF00A2094565514231CA8F6DE6BB64C4A7D92FE60917E03493F6CCAE6200C51343E426626DE57941EE7C4487401BACB22A22714BDC3104B33E0FAB666E2B0FE983900E2FC475F63EF24CA0E30BF51496BC51A5C89660604E5C933DDD36B04767B3F31726B4B9F8FEC86EDD682E40EEFEA11AD98B2E8130DB90535DE1E1C8432865B66BC620BCB37996C13C33C3448BF67FAF301478E4081708FD043476A4D5EFAD7676F3030185E324B6434685AF13DE45B771A611D85BFDA07D8CBDE0FE219765FDD925B5E77EB060B0D9BF77854AA54B85001BB746F1F329386DFACC08A701DAB55ECD7B997463981A0ADD353109916A34CF4AB5DCD47CCE5D5E00A7670621C06B001B767C30FA2DDB65790CA66BCECF300144A8DAEFD985D5ED8603057941C540EF25E609C767145543068023DA9FC406CABBFD1DBD4D7212AEB9C865C272FF00A3F32930B330C18D5157E618BF2A7D0861EA56308CEDB2A041CD1776634B6B566DAE4A8528B89156772D79A798E113C8A65F78D27A8504D5C3473076A2C7C859FDCA873E618C7C26A5CC5901AA47B7F8BB9F9F9A3D7ED3F97EF3543F4BF7D07F4FF4EB4347BFD89F86FD3A7CFE3BB33F37FD4FCFF451E6107473FFDA0008010203013F217EB31EA21D1F43D07475FE03D09798A22636FA1A75631FA58B74B970EA174D3A33065C7E8004122988F4497A28784B25E8BAA3E908C5B9C44350A8CB972DAA9C51FA4E53C655C4E972A6A598351E99C03A06123F41EE96ED2BDA60EA5CE6270823D748CABA1B1097E82ACD3A730A6218712DCF58B81633512E3318B5384E60C7D061B8D165D89B96BE891751AE8765CC962609CCD3E91B66110C31AA9975ACA588A8B99C4D813496D6284D3A318CDE6F0974670F400386591884861AC3B74134EA63D6AE84174904014C6EAE8188C5FE81FA062A07D2348ACF403A574B8B1EAD7A54BFA0898970DB1EAA95F45CFA12542B310A8A41B100874B97D6A58A9415F5574060174632E54AEB72B2FF00C3A747587AB5065F5B9FE238E8E495A31970AEB417FE2F12AE54D662D9D2A5D741DFF852084370448150E8C2547FC0409FCFFC86FF00F848699CF4D2339FA7FFDA0008010303013F21845D4E8756DD0F4D4F53EB674210E8CE22458ED7E87AA845F41012B0891311BF54E8FD0AFA4D319CC0422712896C2184668DE5E10E8F56E49AFA2B08A0728F70A96DC215844656EF99AE0E8F5A0933DC5EA120960046D03A5C2E1D61898A6610E8F4BDA257BCBF79994B294723E9AE12D9D697001B9CF47A009BF4705CB52E531D887A61040E8D19804090937747A73D371433DE71473338D880EB195D01A5EA9A022B5F5AA8A4CD4DDAC975456F912D810F4598042E9AE1105E926895261F41087D1362397172EA22A33139499B52D178F1FDCD4EA6D3461D1E9BC204D63A8597188742745809860C570747E9B49A109B97F45B9974101DBA4C5972FA54A81D4EE46018CA3F414AF12983A5CBFA095BCFD14C032C97E80C14682AE3A54AFA329195C487D0296968C3A089897139972FE8B9AFF0B47A66EA6D826695D695C7FC2F31E23B96BA0B2AA04EB735FE2F3155A54AB2A1AE8A5F424A0B8FD6907A0CC48E09710BBEA1BC41C4B7FC41C4A897F41CCA863FC6CE7E85A7D24FFFDA000C03010002110311000010B28B9521D76CED4E8F24AAB446CDDC59BB4E6039EAE2C3F6DE5CA0ED984C4D50CD65A2771C4F270177FC62705C85945CFD23E3B74872A632F54AF0AC24FC0A9E0A4545C56A5F76179FDBEC5A5952661EA845437D2A39A744A38CF598899E947A33E0C0A3D7844619E7D1D2777B8D307E989F456137B324F8A096A7E8525064F219C751D949661714795FBE2A618CD5A77C7E8EA504F9D9099BEDB8153CF2CDB147D544D691FFDA0008010103013F10506854780CCCB833F9198FBC70A552FE691FD339D88B587128DA47A3EF08351A71B5B9520A085E9BE31114AA031C01779A81A0A133774E3110F2287CBCC426B5D832B6643C7787A3D5331103BD1110EDBFDF4253913EF1A1BA74A5BB5E486A97E144A9881173B8466F12F750ED0004D988FA19163B5BA0377716042B7E77C7BFCCB0AA5D1720732BDCF22684ED33CF69587445608EC26E16A5549569380BC63A7011FA22076A9F984438E8C4BC3558CBE1E825A8687697F7F5EA2AC5D45BEC40D75C002E3EF80E1B42BD8E6081C34A033EE6378C8B35DF88B900152F90AC7B9590C34E40B5BA8A40CEE0185FBA949DDBE32B40CA5E88C38E7266EB0C677B83659CC201C84FD1FDCB82D9FDCA17BF4664B9ECA9332D687C4C1E78D88163E022D53A49857CCAEDBA8A1DEBB9005A0B3BE25E9056C12E2D3F71B4C1D006B8C62556B6DAC6837E7CC5BB28A84B560CD1190F5121A377283525029B16B1B1C1DBBC0F3C41D1BB43B063333343299CA61366B609B8F5E084A46113D53F31E875FF00137ED37E65E1E8C20A6D556C28EC0434C41063616572B1C9365E36208DD12989E05BF8804C640A5AC059ABBAA6565116BAA1B5BC40C738AAA1A03BEF8FBC5BE1C263005217B3106D31AAF1B2A9DC0DEC28D36B225796D0D884A8BB2778E546B6202F1844764DD322664505A2295C76798B2E3846C03FEA3C3F8E222BE9FB9ABA08EBB08DDD4021B2DF6C730EF90D18C5C33AED3B1B574536D12598840355656F300CD372AE04E1B0FDC4889C5170D601454775C3702F257F931135BBB152C378FB61F24B2CE512E861732C2DE96E48AAE624442F0D3C5FEE0F045CAB0B867145473663B17524CB6621F2661339B1B753094A4980320F198F1BFE3115FA9FB831E832782E50D2CB3793E626E82C735A282DF0453561C23D910DD5CD2520B91DC0573288308919CD02EE367AFEE5E058997BC159837069618C59CF136B802A5A2D6F0F364434649EFB7D573057EE1D06C06F5983C825532E5997D54AE5A3588F106286E66A4C3773186142B559C5E34C64B742A5D3F68012869BA076F98D4BFC187A0A85005E8ED40FB42771A5E100FC42F8166EC95CD3A8C930A0B0C14E72BDE00A054D56AA4F7644B5128228692581BB292A59A421AF32C0039293C931CDB02C46DC4B05D82F94312E89790E61FBC0C154A651F9A9502A80C2DED32E8D24E00EF0D5622F868D8D7872CD42DD42D9B458D5E8B35E2300B76DBEBEC8174C4336D2FC18AF25FBA191D2D9DEAFB1078627A0D478DA28FBDC14CA7904E54F73BF12F4DDF639862D7EEC6CE9396AE3B9C0076214B80AA640BB8E6CA98BB045BC538451E8D08200004E595A3EDB823B202BDA90BCE20DDB1B45381F3128D44E5E1B2BA1457FB96733B08272A94516ED0C14F2C2BCA9805B7144B261D2DFB28F0511BE131CE292C52E76C41729ABB004FBC153A57FD4D3A51C62DAF062216798292EBF6E0DC2A0D113488335708DE50F87787439697ADE2AC6FE2E5AF4D62D3821D66E36E5E0D8784D82BC3DE3715D253ADC8113DAA6BB7845E5E5BE25472FE055CA168ECD56616C317105120864621488AA30DFDDEDC1E212F225D5C048A94E28A2DAC3C0D82C214472152E92E8CA908C1C85424B4B83D54365EFFD8F5052CFDD8A4046D1500C2E5F7FD448828022D30F41626C90565D6C547E1254E9D9E700DD23F0CC541F47C6DC5D0CB50969268009342EC3B34993417ECB495EB24AB1D83430538D7B7DA270096A3942D172A4025AE4AD2B0A60CB0D99A80277C6334C33772FD9412295305D146CC5EE1F74E051C06A85EC6085E141F0442B793F61FDC565E863BF170721293C46654107B363FA99E01A14D8033009C16A770EFE61C633B8D118887166D55FB210A46310FBB9FCC3C26737F01FDC7F6C2843C5568F98A99141750AC224A33084604DF0FCE9B23485ED5E555E103B4B93045BAA2B7553364B692D2C9F3BC0950540D101BDA54A314961F372C03D1925DBED656B1AC0969C6770002589F15B7AC4CE159B0C5B821A3CAA327A1DEB8874CE626330032CBF1B2644522A75ABA17CD8AE1F98B7771313D45460D706596D46A4A128AB1200778FF380A55B591B63535780E6005BC908E681A1954BB65515A8AADB31EDABC97F130F425A681966B38FBA6A1BBD001A7D9830D5BE4D88721913B92F7B886B339C28EFF012F1828481EEAE27C38DAE682DCE0D0EFC465A84021E12C8A96430C10516A600B61528206F174699460E4C0797D6822B0145721AAED121E437744B630A6A8CCA672E61E2106CBC97B9E282D09D81467B356CAD45746D5AB0D469D164E0880469EBBBF3385C97AECD79DF30691BCD7CC39EA93994F96E04E5623B83C6736BDCF83C4ED562C179CA0C67AAA016F085881684DD393556015CDAC36FE73EEDC05AEEB884F6F70A8023620EDAF115991A9356EBC165A6C95020634624609CD85A730DDE9B1ECEE2C8D45A0480691C8CC4B976975C27C64177B2D4EE5D1AD614DC2A3C8162EC14717B63086E1B05555C01A22F3D7961A0D2CE25A7E03EE8C5BFF408DC6692EC5F3E7F3142AAA94A9BAEC71ADC4BE4266539A1B5787111265DB5BE1197B2166C0A56BCACE1F27CC5692B4EFC4B9C556D1CB953CB1EB486DED70E89A66C05B6EAE0168B77AAA4D643C1B4F112C2AE04A052C52EB3C401BCC1E10C4B060C09D93B7B97270BD0DA6A2875A0DCAF41FB4B26D2A90F1C9F1002C55918C3FCC4B49BF889A46F9311BA61C58DCBFF0033EA0015828A57E13EA266D1E2571FC32D94611B8B92BE4863AAAB19D6791FE2294F7099AC40EA0D6621188D15314D02CE51225DB22191BA499C8B66FA5834A1D1D3838B9C464D03E159FAC788E569C2E4908858DAA517111A41B379B6E30FFD8E845D9C2C57A0BF88F0A8DB654A89EE3B97D685C9E5E61754095BBD64F1DAAA026F5D414D5B1C76D904E40E16BC361918254322AC6707037D9E26240BBBEF38B896203988DF0EFC12C92464171E3692B925DBACCE0810DBA97F50C40934CB51D8A026A1C8EB8AD0A2ADB547B2614A88015895C9F70E2012C6425C8B29D882CC57486105DF71A6012801744B11323BD0AC844ED018102EAD09F76E2D2EC1764CB8C5157362CDC6B8DFB31C3589785B9FE48545A0F8B33E18608705D851C6B37D3663479186CAB3AC2AC1E1D966A2A78C40C80B2A936307140BE22DF0B1A86952AF082D53601952D62015AEAC6DC04F382AC8F4360E080694E5C4365A58929B30E0FC9290E87DD8940616B2B81EE24F66ACB61F0979F38994370DA39E47A74DEDA85D21582C369A957958065009791334F30638E5165817597B42AEF74208E8B9C8D33B222068430E71B2601A100AAB3B9A5DCAC34A0CEB7B3F69590A198E4008F9A63B806D90120855F0CCB74201CA7977A99F0EB69734B2F1877E63B2CE5484321A536F7330E19E65352A97BBF14F710EF11ED24E8416EDBC66356CB42D54A88F0B603CA3C352B10BA851043DB88F160A6356219FE86323F56B1A25AD17C55CA3C20AE3397D920382A46A059704B44B30BA229BA32A455ACDB28132D359DAC28E4D951D89C800C10E0B0859C11DCA8EFBA5CA2A1AD77C836ADA5572C7602DDD6531075A441EC1A3E2562120FBD380F9CB182C3007308DFA8C2B16B359439F371E2B63696B548EF17078A0DC552A20B60DF7D4B0CB51261547DA99BBC4A289CD9FEA6C2B51A298B8346CDD5D2CE288C0F805492BB284A0AB1CB2DC94779B443DCA10DEAD55BC855FE2516B897B80E42C7D8C0654576356DA50B9F8E83FE4FBFA53F908FCBFD136FAC6FF00CF98FD89E1FC32FD68A135F6004FE6FB23B4DF394FE17B67FFDA0008010203013F10542C35F10F558F41E8AC8F35191C333A74A98EE5CDF43689C4EEE8F448B1666E2A984648C88ED3A6B1DC1D0EE61899415D1E8971186EA88900A42AC6222660D972D6A731754FC918388CA89C4CD2258268673205245E260943736A1BBFF7B94EF8E937D648342F32A0E98960B2EC46E354329AB001862A55732EC98800F8F41B9B7450DC052979943301F68B293980E5FC449C7F9E62CCB2C6226A2E20123306B999B0CC8741B833D0C2E10CE9EE0C6D07602606A0C716C7D4AA38C261659618032F67063A533486E1E82B6C31E252D082AD09C260AD677CFF0038811A8DCF89296A50D5C5359881CE230B0F6B81F63A2AB74AC7409AD9DDEA39507244AD7DA2948C98254CA1A94B6CA71053B25D0EEEA545E21D72743D36AF572A080C463B44ABA772AFB13303117DF71F896A370520E7EE567732E6A6FF0044D2382A3384908EB2415D134EEC96AF8A39D0314580CA625424572CB187794AEC8A6D174BA3A54DA0B58C130E84EE84CD3A6065B5D46FC748ECA1CCC0AE8E28C14C362F48E92A04A8A61850A8EF108C0445E8A96399637174744159C731442447A54DE3BD4017CCA498B32F404948BD2F11FC047118CB2589ACE496F4F4046E6C0A262519B65C491732C61094A054D41A89F4265673AE5AB8EFD08E21CD42D8AEB98891C2641B6574B8C65CB9770DA78FCFC4ABC31FB6E1FEBFD4A96E2002DDC44CF48DC59527135821D2A5C49513A62FF3E62559C11E066D364D622166E05A815D3DCBA30E95292574AB61929C46C4311E12D54D904D26E5E105E632AC0A2BA9D1C30650C3324B9BED162A67799EFEF06304E1825CA198BBC074666E53D6A6A0B8460CFE8F72F1EA15425E278841A964B9E7E9E3A3D1E9F0BF9DE71F5387A3B1EA72FE711E8467FFDA0008010303013F102398212E021D4AC4C2062E18A56662F83A1D0B3D0994618E8BA282A692F10592AFA3B388CB919E843536EB7033096C08335140733C928CA460C3C54F7E860626DD5E2A11BD43C4BA84C5181661CCB7D334AA9530E4179CFE26105DD066ABC46F31D2439EB621899C18E198A9292A73B2C5373B6BEF2C8422A086A34B71A86F311C7ED1BF074137E80B0798080C6591D984C6AA2F033950E0EDF6982095210E60E6311E196610A6442FC9741A9BF4C010D7BFA8DFA57A89B445CA549AE53DC770732AC954C73A0946231E2327CB2748C044A479875B25623BE9AD88B87BD7A8ECB6436E33047517CA3AB813BA953788911B9B88E6BCB30F6B0D459E9B8D616962268547EDA805F7466A60DCB9E4FD9DC964610EE1A6216996946A215144F30C26825CBBAC751E9E6690E8940B6DA6B997017BB3F981A9C9AF3E658065B3D4EE0712D85A435AE22C4372F634C4932E0E0F51FD89E10218EA3D3222CCCFA189F9FDC519BF70C24C2E6FE6168259EBE4D9E9FE13227CA33FB8051FB8FF00D81287B3FBBFE472061F68462A079618EA6DD034BE20CF40DC54FCFEE61E8515C44778C1326E067F670F8654F4185BE67A8203BC7536E828B82E1820B52F1E1FB9774B17162C014DC216E6F07FD8AD6E9092E28803A910A1D2083884B5C471C4C5B862F0C16C8B18E7100676FE220B7C7FA973DD816608CAA5B121822A87E66A0AEF70847C389A485AE195993E6527B9B350CC36F8D4532625036899827A70422C345C452A59EE2E812AA0798457D54ACAF4D430175CB0693D2F40D1D280E8FDCB96441EB7060C1A25CA527CF4ADE751153895E063A122F12EE12B6C3E9A874C97F3FD4B0ACCAF3D0305B0027787C908CC5E98571D4E952AA0F45A8E32E7511566512CE63908C831822B9471C4A1A86A25955892A13734F44E23692059B963789569395F10CA307222A225B145312D29B86A183D2A57469EAA88BB63FBF50CBF9F997843106C1393A0B46070980F30EA4771847AF8EFF9DA1A66937FB9FB23A9CC77D5FFD900','Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses "Successful Telemarketing" and "International Sales Management."  He is fluent in French.',2
,'http://accweb/emmployees/buchanan.bmp','1744.21');
INSERT INTO Employees VALUES(null,'Suyama','Michael','Sales Representative','Mr.','1963-07-02','1993-10-17','Coventry House
Miner Rd.','London',NULL,'EC2 7JR','UK','(71) 555-7773','428',X'FFD8FFE000104A46494600010200006400640000FFEC00114475636B79000100040000004E0000FFEE002641646F62650064C0000000010300150403060A0D00000D540000138500001E2D00002E5DFFDB008400030202020202030202030403020304050303030305050404050404050705060606060507070808090808070B0B0C0C0B0B0C0C0C0C0C0E0E0E0E0E0E0E0E0E0E010303030505050A07070A0F0C0A0C0F120E0E0E0E12110E0E0E0E0E11110E0E0E0E0E0E110E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0EFFC200110800AA00A003011100021101031101FFC400E00000020301010101000000000000000000040503060702010800010002030101000000000000000000000001020003040506100002020103030304010403010000000001020003041112051013063021312022321441422333152434351611000102040206050A040603000000000001000211211203310441517122321310306181A120F091B1425272233314C1D1E1246282B2C24305739334120001050001050100000000000000000021003040011120105060700261130100020201040104030101010000000001001121314110516171812091A1B1F0C1D1F130E1FFDA000C03010002110311000001CAF312961E2C794EA714F41BC6AFBA559E80C849650F56D215EC1568D875F3F4ED382783D93F49E49E49F1064B8E563031C9BB84BAA56514CD78E188403D8609D0907B0DABE4E87D0BAF05EEEC5D03E99E49E49F1561D8602D6594F96AA65A969C6FB3EABAD1A6F0469A8522D9999390EFE57B0FD2D26F77E3EA0FD0FB27827C498F4990CA4E45A155DB46A5CCEDFD17468B96BE74EC9D491230B5DB920BB1DD3836579BF6BC1E28EA19E4EC4F8633B152141F25BE1D5DDF4C713D15CADA2C9AF0906B95D660B025AA05983CB2DDA7169DAB08117A32C863313E1AA14A90A57CEAD66D9F5FD23C9EFDBEECD67D7CF9D9025B2B51E40D6AB3361F55F05F96DFA312F2212AC98D80CF96B3A90614ACAA32CAB6FD09CEEDD66FA07ADEFB55D3A9CD198FBF1EA323CD386A89709B39633D30C02B2C560CB715D295224315A8674ED9CEEED12DA252B78CFB76DD9CBCAB17565616E19AEDD1E4D63174EA9D1E2AEB2989A02CA2B2E738AE9882417F46DAD51D5D529B3C4D04DA1806D37A9E7C0CDA620CC5E89E529D3652B6F251D9473208C0174CEB1E82202A4301B8727D85B8656AE5633C51AC77E42DE8A967DE1D66F47175AEACDBA1C50593C86280675CD33587A92042A1D1B276E3C3D358AFE3C8EEA1601ADDB4C0F553736EBF55555FB7E7535D444CBC09EC90326654B98A4C10B0CC6BB4CC7D7EB1F61769CDD367D058591AAAFCB6DA816E3D353EF79906EA2133F09EC8294CA9498B18AB3346314CC1FDE57A9D06149AAB315DCB1B8BF3C8AD15537663D9E070F5C4E3C83959030CB54F7239ADDF54C703D49373BD113568BC9101773767B4DB8BC502536E47D5E1836D5C3CFD07200362536AD3C00E2B2F91CE33A5B6DDC8F419B06B5B0BAB819E72909A0BEBF3D375F3E9BD0E544E9E99C48BD95465D9FA06A859C8D0680B2EFBE727A345B6DA0E9C603D7EC9A1E6D9A254CF2EA2B5B3929F44A9EFE2CF0F51878C9F1E83509C23D5D2EF95E9336E8F275CE0EDAD3E9AFEA5ADDB54C1B56ADDE9A0BCEAA75F2EB1B355CA8B52EBC2AB565F21AFE37B2E4EA3DA768156A051F3BDFCD5BBB83A679CF411AD8AF4147A65E2B6B7E6CC7D54E25EAB86D70F6B51C3B1055B1E68C4D3673EABCEEC4A02D16AB5BB988A2C1817A9F0C745BB72FA76CE7F4242D4CD14E914D79DF6F9552DB8F64F31EC34FC970E5EB4BB1DB67EA2802CAD8B9CC4FC1539B327EDF9CA2F5BCFCB077217076678C3A86353F40793F7576A64862E5B564B7C80486191B11F954126B9A28C3BD278B82EA7F41EC9399332940B7E7F4376F3DEC9CAD654AE12CA5740260227B2390278AB59A056CBFAFE733CE9E1874F3FD8A4411136BC3BB77F27DC974760F287CA472EB85DFFDA00080101000105020B1122894E3ED94E7299DF0532B94C531F9614CCAE71EAAA9E491913C95695A7C8159F1ADA678EF9163FEAA3ABAFD2A91122571B2DAB4B2EC7A133395D1AFCCB5DEB772C71ACB18F1D95A3E35B59A325A818B9D7F1F7F1F9B8E32782E6F0AFAC7D2A04131DEAAD32AE1BEFE4B16997E48BACE3B8EC9CA95F8BE73AF03E1B677078EE1699DE23837AF2BE19B466E1D98C6AB77A780627EE5426BF42BC578F63F6726EB19802C7C7BC77BAFC6F1F4575D695A8044DC231D63D2B68F29F1FAAE9FE96DC3BBC5B2EFAF92164EE882D1034D60681A062464EE16F15477B2B0294AEAC47695EED36982B9DAF6D844E4A8EF63F239056FF001CBBFE5B72004B793D251CA0329CA0D16E10340D11A7214DB565709A0C9C0FC7136A44B526F4D1F3E9A864F97F198AD8FE5581906AB68CA4F31E17B195E34FB686BE3B163BCA9A791B2B9573226D8B1672F41B31FC7AA37E7FEED1C763E4F9372AC71FC9B9557E339A6CE9CC53776AECCC4C638BE4FC7A2F03998F973C8B17BF8BC2E053834E4F6BBD1C43374DB1522A44A7BB38A2D87CC7254856FDDE73342F13CBDCBE3DC7BE2E6E761A64E2E770CB4D9C7538F59A3029AEC289750F7E2E365F215AD7971A3C3D1609C5E75DC7DD918CB7E66761D2569C2BEE0BC25DBA9A0F7310F731AE4AAA94DF8F03A19A8D32F0D73CF2FA7EEEE84C731A078B1621D0D805992853229C6ED5499BCAD54BD19187D9C1E6314237318979CDC1ED1C0F20637D76325F57238B52E5641C8BF7CDF098D162C11670D7537E3E6B598B68E56E4C0E35EE3394E2933260F19C8E3DB834263A721CFF000986AD755CED4090DC81FF0098C619AF4315A2B453165173D0EF7DB7B63D3FB0332CE678D4E2F91E6F96989C472F62FE8F0F8A2DC5C1F22B3F4E9A6AB350F916772F3D4C33588D2BF78822AC034988E52DA2CAF22ABF82C2B6FA786A2B9878B858C282BB5962E36FB9BF2D7A6B0985A30225729952C0B34995886CC7E3391D8ED8CCD130B218D1C3DBAD18894CC975AC50DBA64FDB90C66E9AC6319E5954AEB94572B59B66C50B9745744CA57C4B787E7D367FBDA006F26A54FF00F50865B996644C53A4E4716AC8B1F7236B358C63C222D7295D22CC6A1AF7CEB07FBEE5D0AB6520B13231ECA9DB2B222DB658785C40CCD4B06C76158E670DEBF1EBA87CFC1DD019B758F5182B262D32BA899571992F014AAAE6F20E2F20F90322ABB155A5D8E25F82866171E03F1552D32D752D453BE799658A780F13CBDD3370F8FB0378FE3591F8DB683FA731F8FBAF6AF8CC5A2535EC8F97DFB6FF00C7C9AA366078FF00939C5AD2FA7290DB5BCCAE2B234C7C9ED5F5F20B31318957CB449E4FCF0E4723C3189A77875B2D7C6B71F3F7AAD78570DC58568AB33B33DB087DB6EE26EA52FAEFADB12FC3E4F270DE8F286B17139CC53398E3933D5F2FF53178AE7B1F07C7B98F21C9E49FBA44F0BD3FD5A6932A916282D8F6D791B86A958BAFD65DAD8D8FF6D5626B19769F28C12991B489A90A59A265DD0E6DAC064DE61666971D8BE389D9E1813A7BCC9A77AA96586D2D2C7D62A8D54693432D0273381FBDC776B2428758498A67B1802CAF5696F0994060A0AF151B4E8DF72B2E87F83F92FE43A5DF9FF189FF00B99FFF0070FC0FF1FF004FF4F15FF5B98FCA98237C096FE7FFDA0008010200010502EA4C3D7481611364DBD15BD4DB00EBBA6B34846BD10FA5B4C02334EE4D759B26D3039115A69147A23A596403E8D7A0F69AC5F44473EC603D749A746822CD7D012CE826BD374DD37741ED07A225B00E866B0C1A99DB314C226FD229D47A0FF102AC3B67F2CBEDEF379E8212354F8FADF5D11E374DB041F044D7A08CBAC1E89FC8C10B41A4164DF184D66BEEA60F4587B9FA0C51098C3A2FA44435F45F78566D9B44023741F1E9B0826B349ED358628F55BE7A859B634107A84EBD774DF37984C595BC1E8B36913DD41E80F53D04A1BEE53B5BAEB359ACD6178EFACA3DD5BD887E81A13D0C2D31FDDB23F3EE1116F9BA6B0986C9B8CD7A63B68D7E3EE854AC1AC1675668263D3B464FE5AF40F37C2DD35EA0C43ECC81A36247C661002A026A4D2CCD550126B2FF00CFD2C77F46CFCBD2ADB43BBEA263DBEA9FF127D3FCFF0057F3F47FFFDA0008010300010502EA8B00E84CDD0D903CEE4EE747AFD0D269166B19E13D349B0C2B01D22B687596A7A0BD0BC2D11099DA9A059DD9BC18503475D26B19BEBD60309E955519A1D7A69349AE93F21B348FE8030CAC7BC6866B359ACD6218F1CFA557CC69A4D20ACCED4ED4F710FB87F8F469F9266A62C2A22E91B4105CB2CF849B374B1369F413D88859E207336FB23E87D9A76C085A7C1552459F3F5E3E9BAEABDD27B09BE131FE5493194CD218966C967CFD622FDC82111521D63D260A488AF0A42350EBA43E8D0FEC3AB4F78C499B48887A3FCFA2AFA45C8DC636B0590DC26F733DC40D07C3FCFA43DA2B6A215D66D8758DD09F63EA57F8CDD37436C2F16187D3092B1F69F69F33B73B4276840B1A5957B9F46B4DC6F1A1ACFB11089B8C06080C69789626E5E9A4DBD748B49312BDB333D8AF52B152345118CB3E31BDEBED068D8DA4D9348B593131A6D5102E9D32D355A6FDB0303D4374669A4B6CD4E28FEDE934D63D50A40BA4262AC3D08D4589A1562B172A25EA66AA6359A0EE28165E5BA638FED98A67CC23A01F4E657E8A0FB7A29F42C4DCBB7EA12BAFDFF8F4841FE5BBE7E8FE9AE7F1F47FFFDA0008010202063F02F49160FA5EEDABF96AEA28450461142164CFC95FFFDA0008010302063F02747991E78B1B08F53C369932F7A07322D7108F857CD355F54D55C530F16208F3A6F59A6F3B17FFDA0008010101063F02E90FBB2609C972402D6E80269BBF36AA63BE116D999763B16EC2A6C9A76A0CB84060D6A0D735A3011613FDCA398B545585EB7BD6CFC5A97372F0F79CCC7C57DB5C8975B32842219DBB107366D381EA5AC640D8D265EB42E3DB33AA24A258480ED6AAD2A3AF4AA57018285C6A2CA7E59102102C24D98C693A8A6D4E80B82AB6F18EC29B94E7379E240604F505F721D914EA1D089C49DD0A9E6736E6922254409685F4491A0ADDB725CCCDF0850A57008A26D4A1C28DABA20E6E114C6B3EA3443BC609F7B3D6F7C06D35638E20F5173923E6526016F71050D29B773022351424A407910722F6B7108444B5ACBDBB2F85A7EE5D6C0EA8F5040D2084EAA6EED4CAB08A14A80C3CA301BC2683234BC70C555002E35B179F0974CCF94F0F9B63169EC4D3A62A92847A22A2E7436AA5EE2760506E0AAB4620E84DCDD9F684084F3ED891D9D115158A99F205C689DB313B1011E19AE6DEC4F08D2BF699734E82705FBBC15319A0E7C9AA37DBCC8681F8A8332C4307BA9999C9BBE5604694DEC2AE66B3CD8E58E838984D38D805B64CDAD76201EA28855194134680FA0EC8A6DE7C3961B109DF636A9B3EC9231EF5CCCC8A5FF126173A234A2D2261739960DCB70810DF192865BFD790E38970002FB836B9775D89B7C2A9770EB43259B0EA69F96FF61D548A7DB6F0B6006C87506EE5C0374B4B4457DE0B66DDE73C3E9EF9A67DC9F961B3D2BF68EA1A253C07EAABCE5F75C860DD0896880D09B563082249805B8E07B57E28B46AD182634FF8E2EA8EA443700D68F0EA2231594D19730B92D8A9BBF503A149D7AD065BC02E4DBF997BB300BEE2E5DF9DA4470EE527C91CADB05CF70D52F4AFB8CB3DCCBAD9CB0EF432B9E672DE64D7FB2572C98B221CDD8F92754F83D91A9875C53EF1C5E63D4B6D5E607F2819C60E1A912251C238E1055366EC3F995575BBCEC4A888B5DFC2872EE1E5FF0014D5770C359289CC5F6CB54D1CC6558E161AF1CBBA453131D09BD8C878ABDF17555DB3029D72F3AA7425D89D69BFE415B3E20B9B62D736DF67E4A2CE5DB6912A869D4ABB99A6362D0EB74B5077FB0CCD65CC81171D1DED6004FB1632A59911BB76FDC6D1553093063B532C59686DAB70000EC5E809EFD6E3D61B383C1AAD6DD5DEBEE069DDB8D3A1C85FB4EB9977C62459716B4ED0846F3E990239AFC141B08E98627BCA14E1A94D02701BC511DBD65BCC5BFAAC1E9017CCFA6FDDBA3FB97CB9E91B1420B7DF258A8A075ABADD4F70F1EAF9978D36E348D25CED411B0C106DB14F78C517B7E9BB11DA85B7BA0061AC28C4454DD05B8629A1D21890804EBD60865F75DB964DA320E7DB3387722D70838620F5301C2388F62FF5D647FE763EDEEE89BD3AF0E1748F61502ABB71537286283A13082ADD80994ECF4D978670E77B436EBA9F5410CE337B336B76EC3170D7E5C062AA7328B7EF3E48DA649BE27B4ACAE647B30737E263A29B98B7BD6EE36A81C08289B3FF0059C7B94C40AED51C42D4A3A107DDFA7ECB3DEDBD89F65DC5987B6D0D91A8FA95E648861186C5CCBB6018E259BA7C15593BD3F72E7E615375B03E1D10B4D9692700BE71376E7BAD935458D6DAB7A69134EB6CFA6CF5F4739B8D9755FCA6450C9E66796D1AD9FA2E6D8787375854669B1D4F18AE6654F3ADEAC1FF00AAA2E1A5C310EC428C7600866735C266C67E68DDBA435A349C17CA3FB7B1BB6E1A4BB172BEF97D48782A4AA7BDA7B14E0E6EA2B82976A060A96883750C154EC550DC13DDACA9E09F61FC0F05A7BD3EC3F8D8EA4AAAC3CB7D5DEA199B6091ED325E08537683A9D25F741EC1987EF5A783A86051B762A7DD2206E3BB752C9333572BBCDB7C0D9BA11945169345807E968EF44683ECA0ED2F7B9DE3D12E21822D52E891DD58C934053E866740DDBDBA7E21D1FC4A11D9EA5C5E9DAA974C68F05127447F151F483E7B5547BA0B2D2DEA63E95158A8E96A97950D6AED81C60556FE26A2E2D2E60E286236A13DB1DAAA1E7A50F5F715E78C943BA3E90A9B7C67018C628DBBEC70BEC30E4D380D65CACDAF7580782868E8234A9F414DDBE4E63E177F4AB9B50F3D0BBFF05E7A82F3F793FF00E567AD66F633FA026F9057FFDA0008010103013F219B5C723B57842B30693C8DF7563A405326CDEA1EBCFD38CC411769D18E67B9980028317CAB999A2D8D8CB9568BCCE10D161F94D9F19EF8A37F099DB1B084EE6588D2E9823D00AD9FD464E8D876812BA27506A0297AE6235C8A82F6DA8F598B84C007F313F513013030CFAB8F937F957B99B91C1E198590ABAE61F0BBE19615D8DEA6502F1EFDE632E0E5DE33B2A3895DF79FD92C71967E03A8A54AE952E4D62641B0A7166650729C2A2F81A2668A8C0A5F6D12FD3C932E2BC75E25E2840231344340C1146CFB4B762B65798571434D47588B1F954761440FF2556223F5D2AA1C8F81D41E953240DC506C1B8BF98FB454ECDC0832B040A94CF04C1BA0A31C4A49A0F07487D2552B25775FE09CC5A264E2EC656522F4BC8D71C6FA297319CC185A56F4C5EBC41E495F6D99454318BA594AA8C7E260F6042F97DA5D9233290B63E4585155739682F0DF0C2AB70F89B3E67FF16568CD7B205871F88C30CC93B712EED3D618B9A895CBCE234DB0AFBCCA8638F99AA6E288E212360032C5D65DD920FF0091049C17DD99429A6E05EF30B0D8FBF65498265898C398E16B12BE8831820659D3CE2FB8F8A7FAC1063472A88BFC4AAFB21E407618E6511CBB06F716821DB925F7EC783D9834C56A2E8BDEA5122B0C40BB1181737B7D98871EDE26C4DA8CD44AB739D02E99B3A0EA5C657AA358BA5A4B51F040CEC97C12DA9916B5160C58A0A8D614E3D269DEF6AE4A83F5129E5E258002CA8C9771D6871A399B3CFB71E5DC27840A1AF7ADCDA846307F50C889B0C63F0CE6707DC1A7E894ACF46B39A6803BD0F1752DB00A30DE41E65C7650CD50E0C4AAAEB01E0D7DDC13BE4E2D5FE206816291363912E9B7B8522F3E3D33E9BE150322952721E2516D1C8616C2BD4674B2BDD077D18E031E65914528B4324C42DC69CE60F8B98E8F686BA5E399F22AEEBB657150B7F3185E5AB856ED0841FF005176F0B156F9748F546A3BAB812F7C2A88BF3A9BE33FD88F572D35FABC11826C9CD7B5E88F42EE8DE3C74B8A8417FDE86E5CC0C8E5450BA86B4B73DAA5ADC6B7ACFF0095296BBCAABF641E5081213ACD03F3296EDEAFEA4C1CA1209D36C145B4ADEB08561CA7EF32452D1D472A6E5F0FA0E537ECFB8CD5EA5D5338FB435DF6AD89F7229ACE5B64F6330919C2AD2B79671A8B04202CA8D8F6A4A8DED3DC9A4645FE72C11FDC366A63250D456B1794FF00AC3E2D9F9E9B86E2C4BDC11D350BD1686439EFEEFB1088D7EF015E61FC364BF83C972B49AD2426DAABEECA76914CDD0F28B2904340474B860F9FD8F0474ED88FCC654EA4BA625616E603A2D6622ECB5C87F243178A2D29807987D3CCB0E7B89CEBEF01ACBD63C621055A8971705CF737F7076CFB0394EA304E18E3153132CC84AC8612BEEE6B2D1AA7973381203968C9F6C22EF357AEE237933DE49BD7DD2AC08FB4C73E16E17753C88349BCCE7EF382C7C2A1AEF0A19F58089D468F3052668314A9AB59BB71492C23BDBB0F726447F42FE62E1B1C467F65BFC4B1498E3508BDBBDB1FD7E467A42EE5F4AC87A8C2B0A0A51A63D937DB0F30E4F3418652E961119A8E4623C02F00CB29958AF83E07301BA0F92077DB5DA1C3FE653A8DB008D31D4B7CFED39FDC5D9DE786E2EAFC8832F43749982E4A72F3DE66408A78F716DAE1FE17124C5979DA7C11B087ED9F467066B09BE6E097C27F3BF12DBF89DFC1E60FB3F04CD80ECBDCB1E0F5B67DED8C29B3808F7B8CD2EBCADABF7155AF786173B3AFE2768E0F7379978EFF00A4B635CB74C68EC1806211B75707C6A375A56321C370391CF72AF8954F4576CA7234DC43266AD00995F8870784FAD7F790E41B2053ABFDC2C3C453F1181FF500808D888FC30250D8C0683170D7E113C7D8B0EED5AA92DDDFEB235A10EAE1BB631E054D8662EF53B0B74391E1CC13B2CD6D72B11EB987F9B11E1577878B3BF10DF68BD74CD7B7F18E529EEAD3F451DE69ECC77F6C5E3FBED3355756DF9FE698C73E3C58D2FA589873777996F30E4AF32B1D390DDC2A3E6224A066FC44FCB8E20481AB802C47478254903D7A2EBC430394FD67F50E60D31E32DFCCD55B8B6F1FEAE16EEEB652FC3ED10B508B78D1CFCCC8FE06F9A163EFF78859CFDC1BFBD7DD015F21E07F9FDCBB9A7FBD9416DE4999DCC3F6E3D4ED36356AFCCB1434567E6669F8F72951A0A8A392E085EFB3B403DB176C87F90C7AA6D5B2E9B232C5ADC396CDF684A005A7872C2641ADF95911EEF15BFBB317CACB556BAF88903B72AAB00D7DC9790812D38B9541F2C3CF6BF427183C099AB7117D8171AADA3B4FD3FD4FC67EE6B0D93F4477F4FD2C9717397F47F4EB931FD7FD4D3A5BB3F93D4FFFDA0008010203013F21972FA8B80F49F46D151B98FF00F0B971255C246A212C256058DA0894D4C39FFC8694C339E8B42E21A9B0974DE0DFD552A54245C4E03A6054B25C612E659991C4FA6BAEB2A85D206A574315534B9AFD15F4A952A3295349CF482592B0B4A7330CCD37EA4BE97D54544BE01CB2BC4B5CB409138D739A5326653A1D465F4B994F1398956A5DC5B186A590336CC880AC0AEA3E962C444CC50560AA199C55012C8B880E6BD4E95D582BA2FA146E012AE251A9E70506C074AE87D58F51A8065101C112733587D352BA830C3A022A83677985C418953543E83A547AD4A58A18D4CA1594E9C907A1D43AB1FA3D44845843A8A690FA6FA3D2A2972F5C3335D178C2D9D91933F48972FA865147E38742A211CA8EB30CF696A7FE0204453DE2050E49DE97D448BA6288EAD0D496C03D14CECCB371EA0077B47AA288371844BE96C0AD1B8D73B8BA1A6390BC47A3D54232D0C0B083CBEF37443CF0C4B98A68A2E65B9E87942274BE8FD38A2BEB62B7F4DFD54ECA9BFA4941706AC4B45B5E95D1FF00C6D4F5D0EAFBEB99FC7686DF433FFFDA0008010303013F21AE84B2012A044931742B01CC29D4BF3095F557493810EEE8BCCCBBD2426845952E28D9FF00900974E13E889B041B13950C6357D57D434DC332C63115A53D045A1086494A9C7D372FA4B32E808094FA1969433066095F4DF418B7D2BC4CE2FA1130DC31C31173D3085E84B97F40C3735478889E1D0B8A16C4EA1B97C4E27D024951952A11C5662B5E8FC1C488E28E1A11AA862B0BEF1ABBEAF47A5CB41A304C3A1E494E21D5435380E8D64112DE62EA7E8B98373725EE3339181B5C4644AD2CDCBFCA05B1C5F115BF43F4AB539E9E62C1704CD640D6CE5946660A3F55F5476450688EE319332CE20389C7FDB8983B7F9F889D0C9FD29F467A3B5CA88B033770A4BA15DCBE9B68CBE972FA90EBAA5C04A90AA5D0DC13663F42CA95D0E9716EA543A14417EA00430F4789625F57E94AA01BA96740E6BA08C344086E76A7DF44E6A543A012A5989C31442C6A241A890594F594CC5B3F227337389147470107995704A10E83A51983A81895738C8E30282667B98408812981174AFA4971DD2CE16CA2DE1F69CBC5B8980B8DB2C2A8C12A53D25534E8B9EB30832AC63D731B95D2AE5451EA3995D5EB71E172F2BA3D42B51F6DCAA044E9AFA5E8747AA7AB7C4E6308C3D669FCB8F47319C4FFDA000C030100021103110000101C5F504E69A489218E081CB42618B2D03C92DD722A7966009225ABCD0784A635DAB70B0A2F20F56A05E68B881FE46F206C31909F5CE8003111B91505670AD9A419B3ECF594AA56A5C9D688391E96BC596E7EF02459066ED416DFEFA764BADBC237465FA6902B8A10190BE321F255755534DE442896D8AE6B82F8C68AC603AF42A44FB6828AC7BD15AF7115D10DAD285AEB52EFB37315C90DD896C01C1F92DFCB142268BEB8FFDA0008010103013F105C041DE0C0EA05200EE25880DD1733000804D171B3D543C03C205C94B03C71027BA0AB4B0A769DC95ECE458F8A1BC8E60DA30B36B27274B0D47547B8AC1360F1AF128B1E3950051B6B1B4A975431443489BBAB6ACDD242DFC565E1AACD9786FC464D360E4B32168B2D460DC81A856984C4B12A03989DA5A81DE18293450A5AAE8F52A6A8B481E600A640A805DA9AECBC15BE47A9C54E04B8CB84838F42B68B58642D107DE0B2F219B5B8B9B2D96143BE619C131C95F11CA6D02D1016EBCB3231D931A6060CBCCB57230A61033C71DF31F84C7C3B76340D8D7037171928B69BA48B67E78FA213888B82C600146251E843602292EAFCCA7A6AA6D6704340ECD4113803C0E1335F98CAFCD0C52DD01715321EDBBBE4E6BD4BBFAB4B607ACD30B5B469DFA39885E3462E86B8966D998D36B58E23B2E15557B39BFC4AD5BF376B755A4CD77259B2CADAB6CD7282B85621100C98A39CF31816CF84F262397115398C1962FB17513B52CC5130F94104B4E10B6DBE6014A40DAAB50B4B0A17953FB87E6180028D9881001D8251502769535E2612A120787BDF861211F9044586AA969ED0AF1908CD084BAF530B756894B4A52AFEC815B999691FA0BE9B8A70C11077C66B350BEAA5C16DD5C6DE8D092EB4298D4AB88A39A1D57988655E01CE5BF99515C41C9E53B62075179D1958C0F371EB63EC4B98291C6B4E1B712A84651164FCC2F4CA94D2D2A5050B8BA78825A89ACAFF0076C4B3076C0FEA60B0336C63D7981DEE85723C2D4DC88F5CFDE35454581A5FD87896074273699598BA7CCA64289CE298953B833E283F44B0AEBD255F251F88705C8670E235E1B8D7EE1949E063EE41348888CBC159820ABCDBB7D9AF980CB28220EE0598266F68A1BE98C4AB43C1A057D9F11F2115E2E2C48BE07881CD06ABC37181FE1977EC989461CDAFDE5C1B8B58800C41F4960D3AA7A69973B03316C32098A3A152A1747CC112355C438A3FECB33A2F947F8DCAE739894BBE74711AEC2D24E5BB312E750942032E91EB6C689DAD140AD76866B31A6E538F6895F2798820B019A8A7D97BB8F21199B08A40A688D5D9702E505317DE56C8153E4C311128377F89466ACE2396A428852191C4275346D5AAA77A8B90B3C1226913647867413C20DE338A94BF86BD54A6A60AC25BA8F05602806AD586921B7C00CB6521EE2E7F2298E66CF26EFCC719F292B3642BCDDCAEB36C42700288EE83E20D7DC1458617030C4F1DB782D7756B0FB9994EDD8D0F09A80050E2011A9837047B43B1895E2762505BEFA34F94C1732490C9453FB9F72A45649520834CB8CBBA95DFC5CAF2C51321B027E08D0036F4384DAE02269883665C1D9EF2E21497BD1B7CC50F6A8816D6CBE60255DAC237E5F9986774BC84F3784F70F02CEF7F17D88B9209AD253B20914BBD5CC796992A043CD4A7780C00DEA01425DA9682118DE96326A41BB23642B6E2805C895815BEE40655A58DC5EF00F8625AA32D92872A795DCC7A80B23AB42A884476B5EA294FDA3C7DEB0641BB379B8DC20B8E28A5A3C5DC7940A56A2A8E131179D3007DAA5BC4255442DD079706CED1E1B77DAC16065E2638DB8E0BF014461CC5265F98A5A99F44283C44A8128948A16025354AB4AEC999B5A7601C8529BAD45150BABBB3A379C3995357C49B652B2E49A02CDB28BD0E7DC573CA05618B011947DA4C774AE5C54DD019A37414C5B588AD42DD5C6C0DD2E2E3BCB679549DBD4E147CB817F3170DF40D1C76969B9DE608DA0AF111519446C95AD2901BA0E1311BEDAA02A541DD17E2516C4BDE158429C10AC85BA692CD40E9A23D374A039686CB2D31CC503F585F1AF244DC015796CD5BF11B001BE2539831521514040CB57730505706714572475BB96B154AABEF50D4D8078A283F2139F78DE33295D3BC6AE6A3B9C4212E2013BC60768886313D27FA53194DA5C6B92DD535E617FCBA3D2EB8DF30A407115A38B8209DB364205B468A98A05C86B2C587FB3C80744E1A480A3ADA87895032666ACCDF2FC99CB177417C220B87338F29C4A8CEE6D3181A8109503A65A090AA99CAD4BAFA90E74EAECD9FF23B2D14070C4D00E60E29AB9A7AAEE767B328779678577CD308B4456B2B7DC837448CDE535CCB578475CB7407CCB77EB5FC2185544AC600445716E22778F6F5281799731EE522C8D98CFF00F2575C0A56E2B2E1AC90BE6417C1055832B6E683168DCB16F2FAB65860739836922C90206FBF3C40FC0BB81ECE16A592470DA3C608A410A0722F003306208DEF57E8E26599468CD2B2BCEBA0136349458CB2468C039C211199E2E08D4A1B9B771589B95DAB1281AE21031982AEA956CFF67446D643D7C582DA56C46A58733E32F7E0167CC07C7C92E8F5CC4D41C2F478F8104453617F06262AD2D477AB71318E76477AAAE2D0CCB05429874F06F72848EB3419ABF045E2E88EB171B1299C93105023C1B77056C8E322F0A8DE4DABF042271E60D7848D1D386A7A085662AA51F3493D809831E5B420CA985C7C6A5D4B2CA1653BCF64463172AF04A317F0CCAC8B400BCE6D4F3F742DC0BB256BB9FECAF92DAEB155AFFEC742A66714C01CDC274DB69563438FCC607039B2B412B4AE1696B0934734FB6257B6F400006B3BB8967B1B279B21CD9B952F20238AC15F9B8ACF9546EF40076E638E9AC2A770B202551CF1CC8BACEFC6C7ADC61E02D1B4C0F3BE26C4DC300BAB2A6B962F8AFB965CAE5831B80C28AB358AB65B92A1BF6D75766A16225A151D52ECDA63285F538DE021913CC54812CAA6AACDD79C47AD2ED9478168F0DF8886E0C3771016399439D53B8A405AFC46FC14E38DBDC48946A0341AE67F6AC54A1D350681528E16746848BAC2D5902C1F3CA31B14AAD62AAB11676239D4B5BB115996F8610C33E2F398D5475063A6EB1B81B841AE5BB4816086722B15A8266651525A098E3895AB926358F3F75978A60E3830E3CA4F71C76163C9B806A2A376616AB0D8CCF93B150865B3017DC38646CCA2D0EE34EF12DE02F92DAD16DB23CC451BCD72E5101DD96FC4BB76F6EA819D0E28E7BB51D8BA810342D59328C7A8117710A1F3DDAEDC014A603E147BC1B169563629CF7735515DD2CC118D608D1461A869B951D4743DC74206FB18C9D3B22A9046214F2B59622AAE1CF6F1DA2B4E6D5A67883E8270C2F95C79810C64B3BABC43E07156F6840CDB6FA865866A0099E4DE6BE2217CE45E0057DFA7DE5B5A61434391659703D4A9A12CB8920CDDD595414B02C18A748F0709878E3EF21D8715CA36A8818034E17C32297115B19A839BC220D30E286ED342D96B6E730DA11C4A5285AF2C00C5118BC5964B25A762FF00B0B3DCB5D082D2A0F57B3271AAD463515595E08F74B0797657C445B15C1BACB1185D4807C6255197065C410327C2F79BF05470174B97033DD7DD0C0A2C2C2800AE03257030410158B2DBCC8C0593E721545B590E31F78D2C5C503B28FBDCB33B746685182B3BF8884F2AACA9A56591549157AC151BA3BE6338B63E761F17CB9145D5602383407E99C3137DBCD8BE0BBC4535BBC39A601E60781F1F318621BAEA39FC0764D3EFA2D1FCED9FCE76EAD4FE11FB74C3F545D21FF33DFD08EFE99FDFFDCFDDFDF49F927E93FFDA0008010203013F10B8C3D1AB871E9AC998E62EAA2BDE18C33EF4168C11254AFA2EE208C593354B821A092A5CAF6C02C66FC77DC947A417BD1FA5B952A08C622ED3431A72C70CC46F336288D65033398D2EEA315CCFD0C6080414A2D1D600E5CDC2E90095E80CDB6622F744BDC0A952A54484212886E341137122207704F4D4E5A0AE0D32ACB85BA36968408F04CE1062A393A3F344799C0224D0986CD4A65E636D097154074045892861C52070EFE01495B72B0302B612AC7B214F04233A78953CA7A89D45CA5DC054CBC2B7059D914E8082292DEF48E0A30CA0C40DB895A9CEA630D4AE825C224A883863D14A08150406529632884ADD4E3D4BB88258C2C057C4340952A3865A984AE86CAE263B4456C009828332A5ACC3AA69882AE076104C75C44E8BB942574554C6547A54D94883880D84AA848C113D4B56C5E8B601A4A82808ACB5D15D1CC198454A950DA62345565D50F11CA5A20BF1DE196344A4BFEE82CE2F7F10FDA166A1A0F1D17D54082E608B50AA8D8A7996328E2E03664F329CB1072DCA8C4C8839BA25810D412A357D0A8FD1724790C4B622710AC76E08E58717BE22C22863A17702FA16395D3803616F8986F3118731170A711E08CDC674EA3CC2E0DD3F8947238952BAC84C5B970DB768AB6F5315B6474C14A605802C96CC597ED3C070FBCE342D9044C4B964218728D61F7772D4C02F084D9500C40786E29A63D54C9B580B73888C60D67ED03BE9915701E482D9D222D61DC2DB544B9DC5B9583CC598FB3BC6054CA371CB0EF10599974663606A160B5006DCBF18AAA8BA23770FDA2399ACC67A188A671299ED1802DCEC78C8DA77331B85F0727B87C28113C845FB8DA375CF9EA394BD0860334CF1C400DC58C4352D970A65A96EF11074565C137CC3BCA788B0DCBE71065B119CC62FE823A9AD4C6155E7C413DF5A22021BF667E399E1E06F37DAA5C9EAAC4BD5FD46A71346F67A9E669A8F430D7FBFD4DBE4F0FF0091F4DBFF003E67E07D1B4FFFDA0008010303013F1080CC171567500C4EF83DB10C663C1AE580F27E631C311781CC7576222A77F519F55C2821784C186A5882BA0C77517A48BE07641D6E1966DB940AC97F480CB82D87685D2DC0728B846AEC2726960B83A757C54C7C7844486E08D4BCDB2FE82B2B2F66844C0E60C65F1310C11DB4B372F2A86A4CC8CCBD702AC62BE854BC618DB403600622B72A620892176E0994A70C58081F7C728D1B95D7696C6188AE222C45C61E96F74CD291E44B6D0AE42A53644A5CA1E96252522532D82D4B098DE2061352F97680882C8C689DBC8CD27ED3CC47A62CF99632A6D39E9502E52096E82AD11C580A761B8CA61E218A288FC6443984587CCAAA278DCB0B8799710CF694F184B39FF915B65B7AED16A09A8258764952EE70315B8205B8BB0600F296493CA200C8C130C641DE65C09B5BCBD5352E2CBE8690E1B3DC74BDD10595A99A66B4A25447B4D0CB155E238A17042E0335DE50652D8FB2AA1C5581F796AF4B8F4DF5B98181F695513372CB7897EA31CAFC43696CF318A17345E5001BA8352B0C48ADABEFF41D4731652A0F42EF4CAEA16EB980126980230C2E826CCCDADFEF07D6BD2303CEAA0E6EC717BF9E632179FC461B4650EF17ABD4A8415288E227BD11AE8C24A20A3C98FBF79431BF44656B6FE3ED18CAE1D932C371168B3D171444B2BA08224AC4BAD0B1E658CEE390B34598E751DD451A9F9D36972E2E251D0B815045B992A8EDF3D839958D5FDFE62B59A81F12D65886D82935E4C4BDA0055687DDC29494C6D2D8AC78958950E8301887068FDEE520EE0446E13E629516C63096A8E626968FD40314857947166185BA0DBAB35219AC12AFCEC979ED082B9D47C180F442CA00288DA8360CF7F11BDE0A3E668791FE40E80FDBA42B9210BD184217AC28334005DBD19B364C0D7DFB426DB20CB9E411DDD2C86B839811AC25574D959B9ABC51DA5FC98EF02A22E040C98882A0B1A865B438801427FDCD30C11ECE22315273C7C4C1BDA0AB4F6E6588815AAE27DF9F99847598D59034C0C53B83884EF14A18ECCF8CC561D2A08E65867A1F30581B9436AB3EE5068CCC7695B529074DC502A1039AC1F116307C4B1B3A612D637050E62C01CB55C7785A0AC741DD43282263EA6936F89FBDEFE7C4FC97FD43D3ADAFF3F33F34D6FF00ECD9BE3FEBC4D5FC3AB784FF00FFD900','Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses "Multi-Cultural Selling" and "Time Management for the Sales Professional."  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.',5
,'http://accweb/emmployees/davolio.bmp','2004.07');
INSERT INTO Employees VALUES(null,'King','Robert','Sales Representative','Mr.','1960-05-29','1994-01-02','Edgeham Hollow
Winchester Way','London',NULL,'RG1 9SP','UK','(71) 555-5598','465',X'FFD8FFE000104A46494600010200006400640000FFEC00114475636B7900010004000000500000FFEE002641646F62650064C0000000010300150403060A0D00000D060000148800001EFD00002E78FFDB0084000202020202020202020203020202030403020203040504040404040506050505050505060607070807070609090A0A09090C0C0C0C0C0C0C0C0C0C0C0C0C0C0C01030303050405090606090D0B090B0D0F0E0E0E0E0F0F0C0C0C0C0C0F0F0C0C0C0C0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC200110800AA00A003011100021101031101FFC400E500000105000301000000000000000000000600040507080102030901000301010101000000000000000000000003040201050610000103030304010304030101000000000100020311040510201221311306223032144134150723333542241100010302030505050604030900000000010002031104213112415171221310206132058191422314A1B1D1627233C1E15282303415A2B24353732444740612000104010403010000000000000000001130405021010010603120704161130100020201030402030101010000000001001121314110516120718191A1B1F0C1D130E1F1FFDA000C03010002110311000001F1F95699AB5A4BD449F7B3CE7420415648ECF72D35270AEF788976603BC9F46E43079AFB74ACDCDE9CA635E10601F967CE679AD3D54977AA2E9D3850933F342288F5D434BD8BF7A30C40F350D589979F45136DE635A1A6378FD1C1D9BCC1FF00374183D3AAFD1C4AD9D4032ADE1F9AE9E8BD2359E80256D87723DBCD7EC4D7F4CAD748F2D27B6336E40EFA6FEAC535E82F1278941C532699B3AE9DA415E2DD46C1EA1F4B642AD802870DF39C73822646B598C16C349ACFD2F36E3F3F5BBEF9AE3F5518EBC479AB93A33D2CFA6FA82B84D21B0FAC47C647AF55FC8F01575B73912647C21F23E5E2B5B2377B9368D08D37ECCD8EFE7E8B61D8BAFD8573A170ACD15F58BD27DC2096F009DF5BA3B19CE3201AE7224CBA5E7C7AAADEFF003F5CBE6D95EC4F803E70D2959757AE73D3C31B044D3C45E8016B813964CA5E272BC431C8E018C6234C38C73CFAA09B61D6F5CBAF7D69F217898BCAB2CBBF6BA0BCD6AE6BC53DAD536E59E1219DD948AEB65804E9074510C8D9B46E15C9694C7BCEF92E2F493E2AE7AEFBCE841169A0363F47D300DEB58C33C93C3EFC4F730B258FAE71C569C23471E755DB6B9574BF423DB8A628C204081042A688087D015CB2B39AC803452C4414EDC6D579648FD0E715232B6E5972C73AF1D51BEBDEF24BA99F8C9CE84083CB3A8086F81C554745E93AD66EBBBCECD3E6FA3973B0F933B3DDE3F528AE4731626C1653BC7E93E79047C848542E88100EC3755B2FA945CB7DDD52091D3657F32CA9F92403C2ECF5CA71388C8CB1DB4BD9F2EF6F47CF40DD43868810201187D1C9907B1EED5DC15606E57E7F98A85B1B31961A2A72A989B0B276F7777D2F81CF441D567660810750AC7CFF004EB78BD3A875B32A781C8767DECC31A8FC3B9398EA78237FDD059574F2EDC2040C503E788380C98A6C1CBEA5E33B20B344352EAAE7C5258C55F44736AE9123A442BE9E7B9E53BDF102041522021772677CE8DC7C9A83D3FA0D2FA45E2454688AA8A233AAC85344CFDB4AF3EE37E5B2681BE64081020CD3CC449ABC7D145531D38BBCDF737229EF7B3C6EB95D25F50AB95CE531E279337074FA37EE798810204083373130B8DDD97A69C8ABC85E5FB9B2D74CC6D356AB61D9CD702EB9D4CCC576C3FE8B591E80BA44081020419534A20672CCAB145CEDCAB07A76FC3EC595DE5209650AE93A9865D5F5E688E6EFD58F4FC833A96810204083316D33ADCE4DE332D2B77E3B32D1FA45FE5FB607CC826D5E3CCF4E721F68B0F31D83C4DCEDE6B4B94FDBC408107CEEDA33FE183E173B06FA2F67F72CFCE7D31AA5E37BC4332761579F38444D3F62B3A20C68E166A1BD579DB84083E74391198D0B85D6FE516AD69CB33833C1F7EE6459DE894BAEF040A6D464DA74BDC2F7B24126BD1D63BF46FD79F9D883FFDA0008010100010502B5F888E45871FE3D99DF606591BBB4730E4AFADC2932E2492EAFE2318BC4CBD8D8D9AFF946C89CD67ACFB65EE19D88CE63B350681B4308ABF14DE30684868CDFB4DCDA89BD81F0A6DBDFDE29B15D65C2706BF1E68F81EC4C9F82E5CC7E6BA082D6E035DEB79216F7C3B202A71F6FE4B8B46708B4CA5C786DF2AD96E67C4E061B765CC5464AC08C6D70B8B38A971661CA7C67516CF899787CF1DA1E471775F8F2E3E6FC9B44C62C475B887FD7A654B9D2B31959E7B7F129612E13DB14D610646FC6686AA48118398BAC531D0430BADA7838193D2B206F314A362C34245D37EDD2FC379DAC679CCCE4DE2DE376D1578E249A87D14817643E4DCADA7036330919FD75F1099335605BCA4D6F64315CC718ACA035A5955908CB0CBDEA9E54AE55519EB7CD6B995F04BFD6F7ACFE455BDC75F5A3C869248D89B7B0F99B1B45BC794CCF8145EDD6357E42D2FC4F0558450CC9FD51098AE5C38D1BF91FD798831E450F569187058E7DA47A6643CE34B43EDE22C0B239065B8BFC8E2E79B12CB67AAB8584B703C7779C8224CCE5ABCC57504E8355D0E2EF0791DE9111661D706ECBD9590DA59CAF9E2965157626DA539FC35C1C87AF5ADDFE6E67F11968D8E1FC8B9BDB08E66CF8E9DECB4B095F6E5FC6EED269062AD99249611C1159EDC8DA8BEB2B38BC56F9106074F917C723A37DC9C6625A64F6E3C659DC209EC5914B1C960F92E1B04B1BACBC3C1E64BBBAB86C85982C7C98BC46D78E4C8BB5FC6D7B6E2DA16BAC6DE29E586386DE1F6D787DCDDC7D638E85BCCA8E22E16AF13BA3B9FC65E92C390CEE8E790ED97F2189BEC199B7C5C308BEC89C75A436CDBA90D95AE6247492DE465C2DBE463A30174B29B0608DD7519907A0610E2B0DA39B53B323F7E5C7E47B06032B6791BA96B1ABDC944EB6F61BB640F9328F78B69446EF234B20782F987821F4DC71BECA6F2401FCAD965565AC99F9171EAB15E4181BACABADBD82D645746270E30B535ECE50F289B8E98C93FAA6321FE1ACEC6CF1F1EB1B8BCEBFD8DEDEEC5DBFF5CC0E8F013C7E48E367176571F1DC32EB377E2DB233433C977666EDF69630DB9B9700DF5DC6CB7B75042CB78365BFB0357F3B6C1457E266DC5D8821F65B8BAF61CFE32D598DC735C1C2F5C227DE5E97C17B3554EF7720107517CA67FA2FAD9C5DAEDB5B60AD9FF9B9384AF7BBD7DAE1BD120FCBCE48FEAD7F895E06CE2EFF00F9A2BB8FC91BE95AD5715E9B88191CC6EBB97F1AD70D118540BDF62F2D87A64E2CEFDEF45E08BECC0B196FB250DDC4EBAA4534D473270D5E67C87FAF30FF008188DD3FF99D8F8BE51F45EDF9DC232E64F5DCFD964ADF3A248E0BBF2C5ECF33791B873CB9F305F37AA2B3883A4F5F9592E27770E86E6CF116BEC7FDA3733AB88AE5EFF56CC65E0BCF68B7FE3EEB1993E76594E5707C2D8D70E49CD0D0646B4E2AD5C24C8E6EEAD21F58F7BB970B7B982EE3D992F6FC8C4B24CCD65E4871327972986E381F51A09FD96DA33EB386BCFF000CDF24F894CFE0BF0AFEE15BD841665B212AFC831629D1C71C79CBCB097D67DCA1CC6CB8573FEBB4FDC64BFE0FAB7EF337FF00030DA5A7EFEE3F7051FBA359350FDACFB303FF00435FFFDA0008010200010502D234363DDA86AE2A8A8A8AABB26495D42A28C6CAE85CB9AE6B920E45B5D38D51D187A26841A9835768E722AAAAAAB92122E754CE89C8AB7AD134209BB1E88446EAA12752EE415BBB5614379DF1B910A1FBB4621A947576F0828BEED23D49A277608AA270446D2820A1EA506A8DBACBF6FE829A508D0E8188C4516D346E96FA701B24EC0FC4A6A2FD1D44C62A23545382669101C76C82A023AD149DD87A5573555226E91338B769D1DA040297BB557576910F9EF9138AA263688F40E434E49CEAE95503753B64EE9BA3D52ABC68E8504D67276A76BFAA7261451D3AE85395BB3E2D606EC1B1C8AA69FA209AFE28BC9D0F54D141B06802A5172D48D29B6266E6B537E454A7A3B5AA3B5BD4EE3D033497B3BBE95D28A8A9A42DDE53747F54E8CD08D69B0A88FC7785CB4054AC5540ECA555289A1732D4D7076DEDAD13511D1E35E284689D027201364D8ED023D99DCF691051774ED0A6EAE4DEDA7FFFDA00080103000105021BDADFA3DD114D876F1544235E35E35C116FD127604026B29A534A2E28C68B289C10D1DA1450D426040A1B8845AB8D0A78D48D8D410D06F9068FD5DB1BA03A0DE5393B4AEC68AA6773D50554DDE5393B4A6CB7FBFF00F5425502F8A08228C945E45CB428A7EE8855D20A39A895E147A00E7274CBBAE8A9440A79D1DBA27F07486A46AF29BD9E3AF15E25D932A9EA26A95DC9DB4777288AA22288D491F691A9405152A65E8CDF08AA89AB927390F913A52AB8AA53460570FA9DF0F61D8E8DEEF345CD34A3A7EB23B8B7E8449A57747E2A81C9CC5C5043B02A47752E27E83426F6AE8D2BC4B814E8EA800112BB23F43BAF192A9A34E9E445EAAABA3DDB89D62EF1E850434AA2747741B823A44A3EDA71D2A9C5040295DD7704746A649D41D6BA51534777FA14D627A08854D49A273EBA52BF4C1EAC774D0B93A544D76D360D874851537DBF4FFFDA0008010202063F02614CEA2C710CB4A9B30F4804C22522CC343014FED3F8AFFFDA0008010302063F02F4861A6359DAF7E9629FE6C7461C238863E271AEF8F897FFDA0008010101063F02037209A7C3BBF4769F3AF5F8380C74577AFAAB90D6BB325CEA2F96EA7B6A98C73C363AE340A48A291CE8A423AD5D38D32C900DE468C1795F28F888A0C7DC9ADB7E415C6B9946E22F94F69E67BB663B950B19716D33BE650531F0426B39DAE77FC580E0F61DC5BDC8C7884DE1DA49C866A564223B50DC0CAFE67FB005AE2ADCDEDC790E9AE908BEE0C83579AA7EDDB8A2D6B08AF99E4F35117D164B1690B3A21A28D5D1B81A1F71B73141960A94662310DF29E215BBE360D1311150E7CD8535786CEE45C53476E96BB4C92E0386D53B43F0D66AF3F82134B57CCFC89D816400ECA6C39AAE8470D34556ADB86D51EA3A648F01B8FE08301F9ADF2B86DF04D2F617C7260E8FC767DAA09E94123416D73ED604DED2D0681ACA7BD0E7D5CD575136992E1D851ED2C2334699D16939EA1A4F8AA169D3A6BC2BFCD089EED525A3B413E1DBABC10ED989C5C6B40AAF6D10F0EC777A8992347152326A8ABA9AF8AF54656BCED70F68ED27B8C85C2A27796EAF655728E5ED3DE08022A8ED6E45BBC2BCB4EA57AB6E1ED6BB3E53FCFB29555DFDBADD965EFC14AF70E6CDA80268D68C1690D01BFD5992831D3D1C33690B5452B5C1CB5F785551C36ABEF5270E58E06C4CFD4FC4FD83B2A2AB9BB6EBA62B2340730788702817E05F4D54F146399BD4747835F4FB698A93CBD169D2F9E5341ABFA5BBD3E96D6F76EAF99BCAEF61A02BAB625CC0F3A3A6E3E57EE3C54E4FC07141DB76A2284D36AC496F1546BB139767151D0639A2F779A599DF6507665DC9E5930631B52A07114606EB1FDD929295D40FF0085FDBB836F62D4592BB9DB8E634952C8191471E2D63606B8000E7B4E3C53F4B0C7035BAAE243E5D0DC71F1DC9DA6F3E9C5CB43C36588EDDE59A9359777ADFA0CE692D9C1CE207C2D07227C4278B3F4AB46DAB7F6DD70CEB3C8FCC64AE2A92FA75AB8EE8C748FF00B242FF00B195F69203FB52BB532BBB56047B56891BA5F19D2E6F051C8E2D82220E82EF33BF4B76FDCAD21EB089951D6BA98D0515BC76CF12C0D6F248DC43BC7BD716A5DA44CDA6A4D8BFE5B432A7F2E0BEA3CCD384AD38F020782AC32D43B753F82A9AD5CA68751A4ADA5D115A6926B43C5168C83700AF75335B666B7450D310A621DCD24658E0EC4D1C8CB210FD54D54E5CB821AF134A178DBBAA84B700BE76C6C2C8CF95C721ABD8A42F7173EB4515ADAB7AB777123628A2DE4E0AC6C667F526823F9CF196A389A7BFBCE6EF08F81C51E089F29FEA4D8FEA1DFDA8322F2ED5CB8A6C9BB070F0283A37693BD61B36A74927EC45FBD26E1F894F9460D929A5BB80D9EC5717741C87946F764BD3E67455E80966977021BA41F79ED03BADD39BDC07BD5657739C9BB715AE4F9113B207CDEE418D34D7E771CD3DE5D81C19ED41CF38A246CD8B0D9982BFCB87F125007067C3137068F6294641A6B4E2AED908AB46007B712A39E78F4DE5EF3BAB9867C23F8F6B7BB6DE12B495EA37173CD1FA6C35B78FF338D014EB66CBA2EDA2A2DDF8175376F58FB57D3F51BAAB565547ABCDA71684E1D302BE283B76610737169C8A68F15777018E735879C8196C15510922EADB31A5F39D9E00F13FE0124D00CCA99F632F5459CDD290FE66E2A6980FF391697A984558AEDB492D2E1B839AE1E2BE83D5AE9B25EB1CD65AF54734D5C33DEAB3C125B3711D46E2C25AA9D527C4AC66038A018F0E2772E93F6E21337028BEE226CBFEA753331E2A0B3200D574ACAD996D1ED6B053B95D9DC77A7DA3F4CB20F9AEDBC11BB93F73D426748E2770C0270CCEC437A12B0F4AE233AA395B81077A8BD36E2265CC10BF51764F77356878A9E48EC445566989BB01FEA4C38441834E96FDE9BA5BC4A2FF008F26F156F690FEE5C3B45770CDC7D8A1B78C52381818C1E0D14EED34E0B998420E6C64039554934868D8DA5C549D1E712CBA211C55958B32B689ACF6EDEC69AD11D2781CD48E2E692E3CBBD119F8F68DC325FEA176CA5E5D37E530E71C7F8BBBC4D3009CCA7CAB7CC209F1C674BAE3949F042E24C45BD5C38A0AA7CAECFC163EF4F60F8455BED5D40453B281536956D191AE284F5AE0ECD2DFC7BF268F39C963FBB39D5220A1DF5387B1491BB95DAE8878E4A8BA52F936109E192875762315472D562AA56E1B97D6CADA4FEA1CC3C231E5F7E7DF6D472B507F659FA45CDEB59772BA876B63D430EA1D8A4BC82CFEA2DFCFD481CD7E1C3351F351E33424AF15D407DAA8305848EF7AE635EC6572A85641A7F6A311B86ED3DFA2375EA170CB689B8973CFDC9F6BFF00CF33E9A2C8DFBC739FD2362FAAB97BA592E0EA74AEC493E2AD34752E6D5A34DCB1DF0B7782997F6234D95D62F60F85FB5715F9762F1EDF139051DCDC61A718E2FE2546EB795CCA3B0D2689917A9FCF88E1D61E61F8A12DBCAD9633F137BBD2F4DF4F0D79FF00C8979A9C02EBFA95CC9707E169F2B7804D696ED51CC1BCD01C4F82D07DCBD5A8CAB843AC7F69AA0DD5C47662B486389390A2C84209C3567EE5A89EB4FB5E7B1AD76D2BC026CB613988FC5B8F109B6978CFA7BEF848F249C37777D850575FA3B3D57FF524FF00751415B7EA4FE28F128F641C4A282B7FFA8CFBFB9FFFDA0008010103013F21F7F1FDC1C3965FE261E800471507979788812048ACEDA28F885950D8D3DD653FB942256FA9E731EAE94D9EADABE3EE007688E52B58A65F554305F75A816C71522218B75F5514ACD02D7E4B189804E63C9DFC5C14670AEE8AC9D5CEB117BE7EE9A570EAE5D0DA8FB6DBB4FAD7F7333269E185AEF9DCC5FEB0051F896A5808C1659D19EFCC2B5A55D90951D5A807305BA4EE4669B774FF004CDB692CED7DEBB330417A3577472372DAE48D9F67AA59AE43D21546B25F2F758ED321D10F10C2EB36089DBAB6EC5EAEB92256C0C9B4C5995B7DE1267E4B7FE8C12A04680F100AD62627BD08AA01C29B8356CC2F7FB96AC1B704B0616C6B4C5D6833FCB4F6839B1BC2C32A849180F0D5C8F242D80F1C1DDF3D37307741CC15EC7579350AC672CB08CE5B4B1BBA3BC0C1D409ABDF64BAF60DCB97BE2025CCBAD95E65778B8764820295C12E950FD1A3B9543ADD15BE104CDD916D591F9E9B8804643221A1F1D6AE349B8E215F700C6FE268D19269ADC200519FB25A24CC4288591942EF2A8F92A2E54155DC331FEA0A7754AFCE60FE936BBF7D1850E61A3B2BD084B34323847DC97A6C6135FF00B16DE30CE1731A8E5FDCB0AE39A108161E639CFB08083685205FEE9FEE3AF97282783D87D3E413F3F7562B413E4A87DB0F89993418FD4C1A513DA799517C4DE0C1F313DA10ABE58A8CD9A7B40A3A2C7F72D6FE23C6202D3B70F3DA26C69FC32D386905D5389F7980DC4F8A1F7E8554CA12D3D7E368211AF6980F251C9CEAFB41A85D925B5817A633B962232BA5346D9E236E20A9C7DEFC894EC72B182FC4F0EFDE5646E9F0971B567B304A813B0D74C09E0068F79A26D706B33B9B45358A5206888365608FEBA78FF500345756D6C55FC4BC02DDB6CFE908428538933FBA2D5B3801F14C18304470706CB72A67796CF835BA35EE712DB55E5C1DA29F510EC56B84557AB686A32E6AA30E67E7015BC80F045AD4E1347885C6199F23459E289DD81C973B63833245392BE2CD3BB5E51FD788C4F2D9AD62A16388A3B8B18CBEA5BD721C523FD4636DA20A5065F328CC4ED43226F6BFFC9874DC295F021844C76218144BED84D5E81DAD9C6EA7682587DB18D653A799DBEE4C14FCCE3937ADAD14606B88A64B2DEB763BEBBC484E822E2C46702EB9C7994206B7C500715C11A8553EFE18F3092D46C1D3F01A1EA70B6C1F301CFA3E131966C9EE7FF62DD11B435F3DA070177CAA67442DAED576AC26BA43BBA5E77F84BB0EC3B4ECDDDCFEA5BF9908F80EFA00FD5C126E7664A0FB09B196ACF82426C591955E161EBA617E9A41C0FCA540384DC9C0C736C17985EF0F66A15240E513BB08C680CB71F288EDBE65276CB1552AEC2C4B1B53A447D08FE652B938363C0E7CEE68C10E0233287F913B72F8A7F10553EAFF006EA48ECFA6E85E3E0116EECFC493C1A8538E32A6CF8BC4D3155A456AA1175AE3339AD0839829AF41B357365CF94410F46E1C8C4545BE12921C25345B303C6EC0DC0000014180EAEC3D0098769A020722A368FD4A6526A077F77137B30BDB6351507E3138A8174D31595B9AA672630C54CE702B8F78E57D0A31AE5021FD4BD64BD3DBBC644C86FC0C0F35181A76C267E62D646F247CBB7D0D5E98F4608C63C1E12F53BFC7F852D431FEF0B1C07F719C5F753F04A6524125CCB572305D6A2A16DB55BF110015EE3C976B370165BB7E66DF52F3BA07F651F38F8199EDE20E03F5E9B3F3C58D5B27599CA1C5FF00C9E33F80A81D622F7756A54B0E2B9065F72C7F0937702FF31DF80E1569947500600BBA98403C5A62B65A6B8985CFF13301B2172739EDB1F18EFEAC96DB2E0B1C9FD47CCB4014711B9A287696CD07D6B97AFA94C1689C5E4E18B0D9A0ECA8768155802A10E2B2F999D66A254781CC08CF28ECD87CA8F59D861AF94B1BDFB7FB1303C23537023BAD4D86043096ADD2FCA616B2A676F66BAF72797B8E63E521A65BEDE2330B3147E8E61F839FECA1C46AEF4DF2BFA7ADDFE6D3CF13CE2EABDE688F15826C82C9459AF8F9539206DF503060A0EC4C2663763F3C4603B7C223F609B82E07CA2B5AAEF0CE019BCA3E6092B39E428FC7AF1AB39B8734F04CD6872FB459CCB887DDF1EF73085816AB6553CC55CCB966915A4ED197F9185DB76B84594A6C7199745B4B3C2163170D99D4C5A1EB6F4395F880055783FC311E660A7FBD47DF1A97FF0034D77952FE138F4E33A5F70EC6251D1CE27E048E419E5A87825F7AD1D931A62885740C885BF114B404D87105319599AF03B4B662B92CFB4C17160B7FB7DCBACF89FB10D6A25355EFC4B509861E7BA19F0A61881D5D6C1FB3C7A7FC6F13F8FDE7E2FF00AE9FF0BDD34F7463F8BE19F909BFF1667E54DD9FC0F69FB5FA9FB9D203475FFFDA0008010203013F217A0D4D3D16E0E95D129194B0ACA473B83DF0FA80E8B45C5A4ACC3BE93A76741ADCC97018CB0BE89CBD72C468964C3A84915CA42B43CC313CF5D28860EBCC5C4A7A29E8BE862331126EEBC935EAE08EE3A9C43E96338A55A9FAFA0DCDA69D57137FF899BCC898FBFA133874ADD2C20B963D035E97583E1F50EE8BBB2885AE3A45BDCD204B3A46EA10617502BAAA72C11CC332F9B60E0CB9CC68F41AEE50F42C00DBD56E4D6A18B020B5055260465943A943DE6B2EDA98AE97E836540A86E6A64D4ABA2B8870620EA0476C0C54C23D07A1D4E3977A07D238E250E3A0730A4DBDFF00AEA7D3AA5E597E996A594041121994AA20575D8F4BB4198833681196BC4F6446B333CC388393CFEA689E8C9BF42CC18CD531461CC15CF5135986F44A6F4AF1B22B282E0455CC5874AF1292A3D352BCFD72F861288A11E8DBADEA2BF59C4D4218D517AD3AACA54ACF2F5E7042030EA813998F4B971C341FF0C2317299C90F41772EA5CB4263343C92098F4B177D3599C3B4A584209956E71119B7454CA31F6FF899B26F358F67A6D1E8D231E8D1D7FFDA0008010303013F2131F5599EB72FA5B2EE532B947EA0F5010844E9658A25D44ED2E8E8E48FA21EA65D0A03A2A32CDD13A91053D4E69D75946659154BF4574052A3D166BE8FAAE9FF0001E96F4D3FE08D12E65CCE27A2FA6504D7A10B7D55D1308518CAC52FA31E8F46FE8ABAD737F3113208E540CCCCB5053368BA4AB0B7A3DBD4A23A004CD4310ED67226C3F4859EF0794AF44805D4B5E7D553DB323338188BE83A5CA98F465AFB733B25194161EA7418F3D02F36A2C882A39A57699984A9D1BBFF00E1CA9C9026A239958EB12E125F7EB53300D1D4F4EC8307412B93087419145847BC7FC4D130443680DB5DE02C304E624E67845546591F5E26E7FE18AD0E0C2071D040DB4C796076662498E5D2E2B6FD4662D4329A04C0A8E2590C4B12F8DA3172EC7AC707417191702098C516E34E85CDBF5E4C7D16638352A3CA62BA8B3D0BA9DBFE43A8640448E08DE24CBA347FC0B9B874D4E7412E85225CAA830B0BD04AF485CD4B971639177430087C4583A0C58FAC2690DCD27CA7B9E823D4F47FFFDA000C0301000211031100001082D005F5A168340AFA1748F7E7A070A480541ED5A9CB02180D444354C5F8F080643F2272F905305BD92218B4F8D205C32FC9B2A60950A9836476E250A80062E6D6C756000027870EB71120C0031EFB31B01406800B79DBB5F58000004C998D74EC04001233B188CC00E04B1E43137900075B487889F1000010303EF7A980000BDEFE0B45080000C8B417B90E000004B7D051A3C260007ACB8F6CD146A009D2CD18D6EC2CC0FFDA0008010103013F10BB7B43F298079803E632B8301343D0899034C38C28A75049B13EBDB305DE82FB409D2135C5811053127DE90217565E1A5C5D46B52C6C4DA4F72237C08CE800394A14B08F75264D764654364876C66356BE7A11AD90F052853DDCA4580A1497BD464DF8BFA15F375DB6D10EDAD1C7E09570D53D73A6DC4082E327C25770A1FC435D2C199DA016EA21F721C5A2A0108D384550C70D9CB45A9020BECDDA2473A5596A1B58416A1E7579A344592D4B4A9D351B00A576EB3618B1E2F3C4D8586FDCA0AE6B6919B9B5347DBF31FEF8019AD5E077136748405EF446CD912853530B0571C0099AE21E09318B054BC050EFB31622870445867B0ECC887656D42D77D070A1CB043B0305EA06DEE3B7559788F68180EE587CCA9AC303636D644A3A428BBCF9673C72350A8D2A4D68D78D452D380C675932E93B31562E928B18FD4211B872C8775ECE2A56656030ADEAB35FA96E024D5B180CBF882A54922099A6AD34D7D2E5AB96A815AC572569E3B72BB80642A69D088B56042AAD02E9564E98C4D6255C5ADF662536AA8F526C94A06C4A64DF7861C2D188DD79C1CB6788336A96E5B2CABACD0131ABF208E71C7994D439B40FA1614AA301C94BB228F3867BE65192C51482C183C543A54593163670E983D25EDD2B784AC15003DCD5416C9F0DD3DFDA3711DAECD52A7668A4AF3AC11DE6CAF9BE8E9451149A0C192DC4E28A1675CFE238A60383783983B73C7CBD9A57046BD60AB67B7F9333C2829A5D3F1005E0518A46BEE177FDB6ED84AAB3B3B471833A9570120AF946E9B29E1978D7038C1587377A8759D1A51592B01397985BBD8C518C29D59AE94219E21C57497F30283A3F5E60139C715DC942E478AE654E17A7F6E16F86E0920362FF003CC7ABE3F12F5B2D85F0DF1DB105C316BF13CD1C46615E23D10C4D5DCA7CA0BF786380408236027D3338F2C3C06ACA4184784B82664D85142AB6D1ED5E7A326846D4EE5B3AC869DD868E8064EAD013DA7B813169A0C2E961D8E6618500857818DF7ED1EED26B8AB0769E511031CCAA83741DB454A8AB4988B2F7D989529B0C6D0A18F6857D45ED16D71ED5332CAF328505A4513B83F50D694306F42D76B2361023B6DCF64C42E76220D01365FC11D17D855E6FF70CAA9A86B8D1D52819EB2F2F647B25CD5EB14A99B5D2DA61E110D35550AC8B645D51996DDE24B8A425F16099780959B597A098AA4772F01BD88E4C534AD328E6B554CDC2CCE9B208E3225058F75C06E58839BF5D6356DF6958A8B2865F602528EAC4DFB410A957DA3E422B7DE80650D7022817AE325A410D438E31DDAD9EFD15CAFF00087D10EC15D402E9E468FC923F9422BDCB7EF63BC221402AAB6FF528CA6781AB2545A8B3371DECC44E445AC962DC6311C28E9235D94B72BE466E34159C2DD7B0E73F379B1762D8808C1B285AC051961D70A3A362DE82A0EB6B75864390F88E874B036C3E0B7840660B4D8144E8479B862D3DF3D56A2996B319626527B499497B001F9A96D291E0A9BAAF569DFA941B334D45AF785473B30011C6170061A35A5B4A5AC06546CB68AE084DE7D549DD1ABF798AE057758036EB7A864B2B2930F4676ABB30001DBB88003B109169119EDED079317DE0D5505A300BA415846A34B5D80275A6FA5FB9DC3392D62F91D589C3FC8374BC28A310149D43861218136D6EAE00500280C1440418CBB48C8E3BAE148B035E428E4E42FA59E84569BF59084ADB65AEC360B332F609F02387DE91286FC10DD94BD98A6516D00376850572C1BD787B5B965772BC60027B6BF1046EE8C9A4E9CBC9F300EE223E96EA82CF105D75430166B6A31F10D3AD74DD6825606D2F35445FB8855A1E06047E639A4E63096965AB45755032286E472C69BCF5D1356F1BB87A1CE822ED74F66F6436156F180C395A0ACC1FAE5A56B65B0271BB5E4847ACD066C4716E8854089C215186BF739B1C3822DE1AA0984105CDD36BF5150664C50E30889BE18C0B191EBEEEED191999AE51784AD2AD72B0040EF615003831A993913D6121DAD11A9F0F155C85D0D8E697AEB58BBFF35FE7A48C416F14AF3F241F1E18206B66AEF57177022806489771CC974DD54E482A5132FBD710E7118D9B086A6AAA98D4952B2D8BABD175DE65A42A40ABAA2E5A3515652BB3FB80843E253E2019350DEEE0742DA92E07076E33193A5A96973AD057398098E08A00C0075477DBAF43B043F405AABA0269F39A0068655617998A0321A550AE85AC7E23F546A8D46BA9EE73962896BED86C674A8DDFBCC9CD0057C25CB420E3B467AD42609AA460F12F8FDB49FEE9090295AAEB0996DE2D76ADA0BC62FEE50069D6CB41F75712DE8AC9309007CE2909FA8EF6E0E2D6BD00B50D10C5F6EAA05AD073082B4EE8D1C879964B5A339297C228584809152AC7C1BA94358E9AA530A96A4A8AB694A555A8DCC2F8B03662C2BB68C32F611EA50145960254F1A6D216ED3233072E1C8E5CBC83C105E579E5E50A3C5AC629544A5A860E0ABC12C45B9B2E1AACD65E918191E00B72DE182F0840CFB5840A2AAE96B868FED0F6BE7405624D4A96E9B9703735C01E28F477B42A387DD4C6900E68113B35B894F2CF541132631B771AF5C597016B5E0A2E145705691BCE7BC56987889616692A93A402DB5B547B7E214169949196D57629C87A934F65605529A608708AD414E7716ACC2361C03406289C99CFD607E6A181A146CC2DFB3330077DA6D9E133A5F053A7E2080D5C8D9716F0FCAEC496D1C3B2B894BD5EEA156DCD563FF633403A4B9D976916A1D0B261F8B95E71AC6F5EFEB34B5006D45633F132C0047617CBA182B6E804DC1312C006FDA3365CE380681C8A54A6D019B23C4B402D29C955A9718A6866068285A0E48606025542AD38DA6A5DD932D6E4D9CD05A8D356DA3774F2B32A4E839F754AB34AE3973CECCA315842ED3BC588767D61BD29BD63951C73117B95FD961C3E08124DE261EEE101780D006F968886DF14041A6CA2F1A4B9E1A1EC40D3E263B077D0D02BC1550CC66CC823769ED0A9736D27E0C44DB94965FDB18A76DEE28C4BF30B7282F3600FB66139861A0938C04F5949B9946DD11670401565B1560031DA5A29661B00ED678112252929A12B977850E681C0CE98142F172A0A6E3C0CE0D1062ADD5D9C1912FEE5957226AC190C77CCFBB8697E1022D82BCA6BED5AC0E6651EDBA011AE1EDE41E2B7B3E65F0DE28E0DBC4A2470B0FDD78BCE7B3023AE068FC85E12FD2AD3CB1522E91879615B0362078C45EC5C63D0C5154376CC2C2282D5E5ACE3CC2D99B5691D622584B8C6E3560167E65A218B807429E62DB80CB36DFC863B10B6E23D99F88902CA315AD84A5738FD4B0639C82E0F68F78E5843CBA655A2EE13CF011B75B8259050D26F3C7EE4AC875D54EE72B5BEF8EDE8E3F13741F99FD27F11DE77FB9FAE87BC9DBF4CD7D9D2CFE6FB4FE03BA7E53F6CFCC9FC8F13F83FA27E57ECCFE33B67E21D7FFFDA0008010203013F10C88953008687A0B2B1CFF8444E25DD111DCD0A815A8C5699936451A66C549DE1E08ECDEFDBBF50A46CD4C878828E86CB44C8DDC064E881A6E5388AB07CB35A50B8DB77266E40953175E485188D6E8FBE96901484750B9F7F6998BA2328912C415C5954485B99655918E760F0CBCC32C1E23E3A10973E8B932CC232971728977D06BA2E370F30EA768D588859EE7F6741A97FA1311F30AA61B941A7302511C4CB2EBA05330AA5CBCA3B7FC71D3952E382BA12C8C46542262578829E845E957046915BA61E344FEFFAE984194D0E8173ED164C5A3105438D8965DCA0BE8A8D906650665E5AEE0BF6E3FDE89510815D0B71B11FC901EE37512A39ECC55A15DAD7E230EE8C2A4B22EB01C4DC466531331CE029F8DFEFA010CD1D416EAA307E60998414693E658CFF003EF30AB8D57D4781F71B8866902A080B8526132FE7D4B095277F1701103B9CBCFABD9D813C12A228D41DF31D87387DBA12D230DCADB97199E35D9E3DA5E117C22AB44D8880F6DAFCFF00E7E7A05F45BF7103084312F463C0FE7EE08A221730FE114811192B41F4C7CD0AB0EEEE6FEB3D559A7A2E15FC62986DFC4B3332F98B65E1D40ADBB80448CE650FF4C434E897A4062C2053381FC777F5D6F4AF4FE411CB815298961C4C1054C266E3EA67A95905A8989F039F68000D1D5E0F48D87133FCCA15FC779903572DC744CDAB3ED0761515A928CF72C0EF5F87FEFE8961417F7F6E7D17BDE86A1DBB87692E8419D349CC588E889CD04B595EF0DCB3201A8C3CCD4323415FCF7F4BD09C826E71330E26C834992FA39659A54B8E4624E666E26095B445CAEBDBBFA9AAE32DEA015169EF0D2450A2A54CC40542596554DE6391A1CFB40AF57B94E66DDCD25C7DE26CEE7E630C7536A622E629E2118209A966F7FA7ADD8BD4E6984232CCE0AD3B31AEE583312E4033048D230CE399603263D758CCA1CC7AA31FB8D9882CCF7218F13C4BF1006E2E180981A8867760A86335F0F3F12F0FE393D2D19DC5ED01634BC369A94BBEA3DA7EA167001C12B2DA42B88965D3DE3A34BAFF005FEFA3486BFC9BFA097B13FF00A373FF0097FA8EF9F511DE6A4FC03F5D7FFFDA0008010303013F10A098C5CC7D0F93500D114E6263660D30ABC4744A3510287D453C750262437D42DA9EF2350732F0E250DC0AD4322C64A6591883B830D9053D3474AE2FAE6B8950800C05898E30D97435328464B63C4D2128747327A031505287489662318861A54BCA5D1C4BEF28A39E99F4428AEA2D210A13065B7348B16FAE51940798BDE69F7E824447A812CE26758D0255221D1E948B531532A6647A572F7513BBFCCC151DA1691122F4726A566523AE8A299C3A2BA3065D704A86CFCA53C0DD5F8D4000D1792FCCB463E2561798E43CFD4CB2805C25507661F3971D456C781D107D1B925FFEFE2098F69495FCDCB55C5F0FDC61BFB37FE4C716747FEC0191E57F483280A418444FAEFF00110DB82E997C8712C21689A05B32EB4F6F5602BB7EF107C9CFDCE6AC437489C6A0D17C38F2CC8AED8AF8C0B916B0E20382DCB1903C9B76AEDE6FE261425AD219F89A0C5C7B74AF41B1C244A792369839027B625750BEECE04ED148764B939439C2F298BBAC0A4F7F996C1C4218EE8EA64F4825D02E582F0748586D10286CDCA184AD70C58D315BFC081566FA115E5997BFD79FAEA2BD3F8B04F162A2873127BCA160C4C2595AC4721D59A97C3749748D2C1155B7A87A573F331BB906AD5FB3C900B163638F7255417F3D0593814E431521CC8CC95FDA316D5F468EAB501E07128F993B52D87A4723B3BC5EC4FA26A03FDC42DAA62199812AEB822B2E7D2C5D1AC0404062147B0AE86A43BDC76A994B5132896CB3B97EBA3D5C131FBC5836768948B08ADA4C92CCCA90A2D710CA643DBAF599DDF1D2892110C60C3AA4B14E6203728659D4CF305D7EDEB744578E88EE648E18E26488B5976A57D0C09B9ED334F7FF0081B52ADCD4B2C72A382E20A8275D15054CBACC4982629518DC554FA4E04D2139B528801954916E1EF33F64D6852D7A1A0844BA739EA136E8689A7737FEBAE95F986A1E809B7C477D7FFFD900','Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled "Selling in Europe," he was transferred to the London office in March 1993.',5
,'http://accweb/emmployees/davolio.bmp','1991.55');
INSERT INTO Employees VALUES(null,'Callahan','Laura','Inside Sales Coordinator','Ms.','1958-01-09','1994-03-05','4726 - 11th Ave. N.E.','Seattle','WA','98105','USA','(206) 555-1189','2344',X'FFD8FFE000104A46494600010200006400640000FFEC00114475636B79000100040000004B0000FFEE002641646F62650064C0000000010300150403060A0D00000DFB0000139900001E3F00002EAAFFDB00840003020202020203020203050303030505040303040506050505050506080607070707060808090A0A0A09080C0C0C0C0C0C0E0E0E0E0E10101010101010101010010304040606060C08080C120E0C0E1214101010101411101010101011111010101010101110101010101010101010101010101010101010101010101010101010FFC200110800AA00A003011100021101031101FFC400D500000202030101000000000000000000000506040701020308000100020301010000000000000000000000030401020500061000010401040103030402030000000000010002030411102112053120130630223241231415243433253511000102050106050206010501000000000100021121311203411020512213046171813242A11491B1C15272230530823343731512000103050101000000000000000000002140011100103050602061130100020201040105010101010100000001001121314110516171812091A1B1C1F0D1E130F1FFDA000C03010002110311000001F41675ABD5DBDBA0D941646807799D622BAC5D3F3E2EEAC3AB75E996B9D65F4E196904EB9258ED198F90E1779AE84A7A4D9496827DA78D5C1613C0CF4A179DD7A306EA4EAA52E384DE1FF0B62B7DFC610D031D1CAF422AB58B54A2873A0B5EAD6774A9333C4481B21C5C2E3BD5461EE573AC0BCE8214B36B9430558F5DEE67AD3E972B8C43896F5820BB50CC069CBD1F469B3BB50BF5A1B9959B981AFE3BF5AAEEBDB2B4E0DE108C0976D0157D52DD5F6EE5ED1554D9C59013E2470185B3D6F676631A049F5B9C185CE06C47457AE7075DCDB522AC784330551C5C55D585CA85A5400E249DB986733B4D6B5B1B9CD33D1EC5C77BAC76679B9A5D82D4119AE4C685F00DC4771AB32195716D66A252F4E6B88534A037F37A56E19DCDE95BF3B53D718CE4AB462DD3980358E7415C9311B2E48802C2118022FAC05C082BA66805799003D0CEE56AAFE964B2E5E9AAEB64FAEB034E65BBA4F73A716B46C12D79CDDDA544128E5445273AD8880FDD13A598A29859535F2648AEBDA090F613E571FAD3CF6A4DBF74E9076192A5A296A34A56354AA39BAEACC88AD8524058212803DF151A9EA20E992C53FEBFCCCA09A0B0A7AE7375E4DBB798974E0C715888C8B474081434F65ED47606EDA19FE74713DD4759107D51D045301A73AF55FAAF32C19BAB0D805CA2DAED3DDFBBA4C34541710B3740D9133B5D354D063BABF12AA54647C7740DABBD11C03AF89081D0425059D2F7651EAE6637EEEBDCFA25AF4A667D58A932F747D6D63B281A2AC29769317794A6D5A6C2510A09C0BF0256508C3DA50DF6C739AEBDD9EE9315BE320448EAD1D47A508B6372AF074D3D3D34E83A9984A5A696DC028B97A8D9D2D502FE31BEF47CED53901B4049E8AB4D30BB5359F5227A415768B0E4D906A837138F402D2C2DA5E50A98982AB68ABEAE1916F349E7FB229517A843871446ACD3DB8136777F3C656890B36BE510B209A5171598A8C308536AC632859785DD04A6D69EA1656A132BDC92A8FD30A64A3A7A95399B9778B96D9A36C7AE84D82B88BAB0E808ABDB906D2C25C4795C130568475C4388B22D730AFB1E734BD94CFCA0E243313F6F12CFF3DA41E0A863602DEB0EDDDA2EA6EAE15C462997E56E9412453806B59B3EB470CDF6FCBAAE001DDC9282C4CF18E3EC2C182C2885946644B6E2E15C4C5B48F3BD3B0CF8E9FA6BCEC2D08A1581B0E6FB6E735B2D3A3E254175B341D50C16837315E909148A216EF9E934B82655FBA768BE3A33DDA4D08486670CC66FB5D26B70E6D4E2574CAB3CCA2B0EEB070388A6BAEB20C7036D2C64C2C896F3F598C4D7EE8E9DC76B491312B37D96935BA326C494BA7F1E79C0D1489171725CA88694E6E9F11651DCF3C0EE2C4C67A731C5220BF578DAB2F33D8EB35B9B1CE455B28C96C0691F8054AA9DF7970543D72D0C2389C1DEF32953D8EEDE2DDAA4212029351F6A7FFFDA0008010100010502ED4FEC04EF1D1FFB034CE17C83E515A8AED3B512289C6691B2BFDDBB5E46D7998E6BB759DE271647D55CE0EBD69864648EB3518D918BB3B41E82778E94E24694F78637B7EE5BC3BAEC9B59BFC5B37DC7AEB55E08E1B2D9BB36971EDF69A10F7B9ED786FB9C4B97BAF91D0D97851D8041717109DE3AA6B9D3B06DD85B351767DB34C74FA9B1DF5FA9D1D2A105BE9E2953BA8629FDB07B5EBC34C1FB6A593F9088CAAC65334C4D5B2D9036486ED76DBE38413BC74508F6F3856A99ECE56FC76B5BEE7AAEA60EA6B39AA46ED2B36EDA909DF76BF0A4FADC66BB106D78B72F89D5E6B760CEE40A7A09FE3AF97D8EBAB424B3668ACC16FE4AE4E4F2A7DD588B99EC2AE549071B5DB1E4DAA3FC8EC1B80F58FB7051765045506B1D055CB1B62589D72B5586A46E4EF12298A92D18E6B0F6867616CC762D8F75BD77FB9D8C8E9258A5F6DD3C3ED86CCE0014D4F542D16B9B7B9196C5486BC176B5B6B948709DBA9F736AB92AB452F2ECA9C4F55D814314705CB0C7491085C65EE3D8863032814D2B1953DFAD5C75D6A3732F76D5FAF86BDCAD15A6586CB07617D95DB63E61D83A58FE41DC3CB3B5ED53ED0995C797CD520FE4DDEF23CF69D55593B0569AD8EECCF749234F12D4D44AECAAB833A7E33C5D8753176763E5262B35FE0F2587F4DDF5C7F3A727D8C9A48847F21879761D832EBA47CAD5D5D9F684CF31760DFF00ACEA1CF2E7881D2B1073535ED5C839472363553FC6BB1576A9FAC7DB3638D1A13C4D9E7FEB2095B5BB01D475DD875F3BAD7570C92C8E6B82124B59D19362C7C8E4228AEBA70C53C0D32FF6C876C876EBFB62E5D496DD9DCD686B1802EF2D82E8072963A71B94DD7CED16BABBAF23AA7446E451BE3B658D6D57607653FF0035952080A10C58733F732B92E684ABE2571ADEDA7B62213CEE860ECAC73757B8E69EBF8CAC2CE2AC3F02D380334E057EC1DF6C530E10D37F0929FED9867E7603430EB9556C3EAD99EDCB65FF0021BD2D6864ED8BE592FF00B51F40F962649678B6D5ADEE5824589F1059FDC1D6471F391D3DDB7245ED16CC58E95D4E690E9D7F47D9F6669FC2BAFAECB5D77491BEAC750D5FE4C5619DEFC6EACF341D4C35D72F611EC19621B7670AD4D94F712A67A823FDA82C185DCC2BF74B975BF1BED6DB4AEA2A9BBD93E5AF55AF7CD28ECA76B64EA2F8AB6A783FED2EF53F23E735DEDEAB26F91B5863EE8CF24752DD88ACC6F639CAC6C7DC731B5238ED502E9314FDA12747DCD47D52BAAB868762C31C8BBAEEA7ACBFBC92790D5EC2D425F27B2FECE1805EEC5F689A75E57C31D781099AC82E49EE4B2B94A7918F12BE9FBB5A5BCC6B4B5F8547B3B1591D3E23DA7F329F7949D3BA7E9A1A6CE96F5B8628E338B95415660E2E932C4D7E0CDD8FD92D8DDF3A2ECA077F7DFC5F21231B86E013A7C5DF345D8D91EE452568AF365EB58C4DB50B9B6A7E4ADCCD60B3718A6BEA4BC9F61CE4092B2B2B28951B793F0B3A7C562562CCD1A83B4E128B0D70B71A96C4D2D296BF63624B5D13FD96D67367B7D69891610815C965656540DC00165657C6DBC6AD82AE7E55FB39E054E39E6AD3F5D9577FB4A0BFB78A64E632C3641CA09C0475CA602E731BB01859595D0BBFC2B2EDAC9C9E9FABFE6C96EE5F62AFD94171B2C0245DD7575E66C0CB15448EC1ECA27432EA06544DE022FC5F26FA743FE9DAF13F9E97FF00126FC9FF00FACDFC7B3F16BC4DE7BAFF008B58BF351FFC727E7FFFDA00080102000105027EA3D0F9535AB1A35DB83A95235342F051F4044E1492E546DCA0405C82C84C2A245058D3088F500A6710BCA6EC9C34CE91BD39018D1D8C3771845870756A2516991CD67DC1B8D4E8C3BF2D9877281C86371A9D73811B17843779D4A282CED127F88FD613364F239B5B807428A2804C6E53149F8C41109A563D01672765C91D4A3A35C9C89CB5BE73B43927D1825670B256EB29C500B885808A6F871C3613F64878A67E207A0A61446FFA731A0457145A506AC2902032DFC9D85CB1A715C56116AC6C5613B6016535F85EE052698051D8571F7295A9A565656565724E40279DFD194135394438A7B8AC943D45C89DB46AC23AC68845C83D6426FA8F972E0805FA93A81BB765215B000AC201C06B95EE6EEC22564844FA00D004E28B73A46C4ED0A7380592B3A145AB884235EDE341A35613B676C8A63F43A124AF6D7138075E489CE8D4104764EC14C3A11A94E4C9113B047D1C5008375E280F4B93B4DD651D0041883106FD272250F464212207283FE9B91D70B0860AF6CA070BF243E93BCE802CE984C7908E0A679C7D2779D3F4287845350F3F43FFDA00080103000105026EA7D0C891D9674E3B11E86393B51A9D638D38A3BAE250051F1226A216750741A9D18DCA0DC27205674C27B1351DF4693976C5724353A35DC4193ED2ECEA104516A78D9A88C17BB3A8D71BB8E87666810434C293C33CC88FA8A29A0F1273A84163471C2728FF00294A6BB09C172F4158C2DD71D0681028A21613460BC646379761E8CE1610016015C776B7D034FD651BB374EFC9C727D0F081D879F6DD97657E8B9204699411D8F804EFC723D384173C26FDCE413E3E4BD921334F0BC99BF15114E62E2B8AE2B8A70C208951B742B92CAC68504FDD3581710B1E978D83501921613D6500869220500B8A014A7D40614402CE8E41A80D0A7268D068482742E0173250692B75C7086E868068743A03A4D2A6E84EC01286134278C807ED12B16422E0107E5028E8E44A1B824A09CDD0E8C6041CD45EDD3865706A21BA9453B4013C7A5E146E4F6E5637281F465128BB5CA28FA0A6A0EC2C85C501A145C8C88C9EA3E828045AB09A50F2414589C083C110B2B2B2B3A1F41434C681C8B97B8139B95BB51FA450D09580B08145B94149E397D31A1FC86A1391F1F43FFFDA0008010202063F02F70CB4ADF95088A48A2B66C6D3A666D48D39C2149E4070DFFFDA0008010302063F02F72EB42E9E122F151A677E64E586C833C702786FFFDA0008010101063F02DA4EE1ED713A2F35709A738C0926305D48411B440FEE58CE406E7C3EB3463E8A22814D5BEE07E89C1FA43E8B23633298EBE0FC7C93D419A996E387B5C4F82B1BB4EC2E3A4D43017738834094D1C38B18EA1F7E5333E485ADF128C4409D535E636DC10CDF1039608B59284118709ABB4421EA83BB6779840C7986A8B0BAB0FA21FBA7729EEB8E59E3344C6B298D741BEC1CD91FA21870B3CDDA94795110566495B21E68BE1E6542355FD82D0D934230A3537163ABC809C04E1241E38CD078A10770E4D9D3C861859C2A4ACFFE33B9CA7A5805ED0D9120F8A38B08F71893B97CE5FB502E374E11F02B9A9E154E77056E8EAA0784D0308437AFD7457643125705DC77780C7163686B9DC5DC376D6D4AE832767E68BCE89CDFA2682AF754EC8FD1486E745FAAE8BBE34F2471F72E8321CA3C511868F376EDCDA0D538B66AE2AFC73D50742E851BC53E3FEE853C94611142131EDF6BC5C22A0372D5065409943B8EE5B36D48112AEEDF2078F0DD30D57DA38FF12754E0E1CDAA7768F9384F1B93DD99F6FED1A98A2CC342EA6A50C3F2260B1F6B88DC5800BB727456621E655CE308D027BFBC23A6E94E935F77FE27B80DB6ADBEE611C137337E4145CE822CEDF05C2328A31EDAE8D2455D9BB2E4D609B9B10B6DF746504EC8E95D357698EB0595B8A70E09F88085822E7700ACC7F13545EE31F151DB35D4C42210E2D401C5D57E2E62CB880E4D3D8761F6FDC35965C45B67942AB333BA88E8BF92EE104E634A710DBF27C42EA64EF31C47C18C2E8784426B5D91AE6EA5A55B8DF6307FC61945FDA6E851E9CE1C6303C745D57F345D71F55DDF731B4F747D6D1A22FE28B98262A372011C79072945D8FDA4D13BB803DF205472E488F25D36D4D53DCE4D6E17F4C0887B0FC8F9A7761F681CDB4863F1526350B2773100BA126348121C174C4599346BE41DE49D8DE274215D58542BDC24B162D1AD01ADFD7610E94289DD2FC37398AC4C06A66831B40A254340AF46527551FB779870AAD3F02864C862E1A239FE7F32882A2049935135D3D543332EBBDB382936D87A95F9EEE1C7C62A2A2EAEA8AB61215281064A4A07665F21F9AF34D6704ECD9B9455838F8AC591BC68A390438A74F9CD3771F70CAE37072EDDAD12CF02D7688B4B0F9C15A488F8945AC1CCE4C192AE0091B08460BA5C4C4FA6C393350506A7C974BB71CA3DC49FCD7423EDF71E251BB99A6B15D463A92B4ED1F6D84DBFBCC820FF00F2190E57EAC6C82E8BBB583788AAC0DED0DCDC27963545AD9C24E69D175AC8478201ADA20E655B451067A8D908ECB539CDF742B4804D0251D517391C3869A95D66E12319A13B3B7ED808DEE98F0418D16812028AE27A4CFAAC8DBAFF00E4289B8FA97332543AA0A6E4EB1C38F2B6170A07A7747B96E6C6D9C63FA20EEE3B688718031F4471F7188B08AEAADED417FA14323C5A48261E0141DB02238AEE271CF879D8CE2DD54C941CFA26638090D983BA1F074FC91CC67183B194EE5240F927BDE231355FFD0C5DB9E9B08B5E9B92DBC3808B78146D73F1794D58E04B4522AF7620E26A4A835A0780929FED476961946855F6C6156F11428D9EDF89D9C8E96DFB7CA79FB7E5F36AE9E39077B9E7443230723B42B176FEEC594B840E8A0B99A09506B40D97BCAB41DDB6E30E1156C77464C7EDA3C7151022B1E2CD4C712E1C535F85B0B0DC020586AB968893B2AA47FD33917F5D382E66C095147276EEB4EA0D0ABF1641236BB94C884475011C4845E7B9E68484174BB9F42AEC7EDDFBB7228ECB6A17DCF76D01AFF6631587129DD1365D582713FDB886ADAFE0B9CF905F922C356EF41406E0DAEEE3372E0C5AF177041D839C0FFAE925293C49CC3221457B219051C2AAC708E91423A95E0777C5454368DA3FF477E88A67F1417A23E6BD421B8373FFDA0008010103013F210B430407E0478E8816EA1C21B201EB9898120CB9F26271019799AD88F779D1339C254D7A3C405D0AE1A88B2770C4B2CDA01B58BA0CBF32E8F6FDAC7E201E966778AC137609A00C13F88EEF1C1260F7CDCCB98C410403DEE4B89A4B2AF8866DE3AC2DB58E3EFC0FF422E4E9C86293C13D7B0712AA1416B8E7EF379814EE4D1F12B91B37DB51E35F82127872FC5FE52A8C64E2CF24B711055436558ABB1FD87B4A684E7CCB441E930AD1510103C3344324CCE039EEBA9AEF607576C041605DB225C1B1B8611576C66BD40AEC3BA38CC80396CC3332A96C35A396651F0021A998F73DC6540EAEAD6A3C956DB86CA6A333B0DBDCC01A8FBD4BA87A560F2C44326EE3B8E2E13ED86C12AFC2F32BAEA73BC1F699A651F994284301BE8946FCF92511B0018B4C44EFBA362CD4069996CBC84770B04C6B0554BC451803A045DFA7DD964F9F2BB711C4F0A5830FB450730A01512DF32507B8E2D2EDD61FFCCC0031A3BB7C4B52B1C7F50DD06FED385F5105967CCA6073CC5CFC944BFD2F89B180C1E625A5BB9E784ACD84B1A5423F60FB8DB986512DCA1CEA3CED2F65E2E70EEC3DFCC04163B8CA9FDA569DF9F711C33CDAD0F64B556857C8C016FC21752C7556A668A3C6226DF4DCA2CCC26AD85AAC1EFEA57D2DDB50E71349840AE2661147885FBC06D81758766298E35DC3329E47AF9A952C96819381DA50869AED4AB940F556A2F610D07FEC6744CFD2432D5C986C0F679F98D84B249558E3315D8B2EA2C8877626A3A250273B945D41C72BDA24F3A24F79494F41FC22725E4B0CB186ED7EC73034B3C3DC33CF78E5C6E7314AAE08648C26FC368812F13DF51D427945A1C44DCBCE0D3986DC3B0CC178E231DA6EAB00038AD5CD299850BBD809F30F5B139441ACC5A872FC4DDEDF11EE32DAC93F27346A1680FF0036398BEFED2079610E28C1CD779899B6A5B2BEC8C332E5ECA1011605610A03DB98C4DAB8E59CA1C92A983764EEC96AC2E197435154B9DE1708D72006F108D01BAA43AD536C5B0A4BDD1E605A9822298BA3C7696BBC0CCA8B4CF9731C37907541450ED3C1322D7970C1A805AB67B9411B2CE489B10E2F56E8977E8AFBE2D408EE896BBC1C545D88D5E652FF00F21FFAA56D8E63BACD64A8C0D050461D110A7B24A825E724B17703CC0E06D7C238C3EED1FCA826B82BAA8E82C63B86B30CDC5563CE200E4CD78712B071BFF9446D3C2958F998C7CD66CAE263174816F89683829514C48358F3DEA5D5B75285E65D38BE21F74BA9B3BACE23BE882BCCDAD21AC1A2FF008278E40F6C2E11FE14B05AE7C9FF00040DDDAC9D3FF252EA2818A66AF395F02DFEA08CBE8516883E98A4FC98E6A0505851B0929E9A550FDA0A801DB2BE22181D81C0F2711043EFB4EFC61D67269E3482E3B6A0FC05E5FB08B818B0941DDA3D108B9361F83C132A8147B3BFB879296A3AF4F3D0CB423DE37E595A2F780BFB8444354A95893C3AAC33A653E3C88BC930CBC5A82501AB858578593E106D2A7CDDA0591B788E690E77887B4713E6CE9567E660056BB6D258B4CE58AE42C1FE883CB1C2BE816956CD532C0DE1A9863C13C602BB7A372E48E4D0F91155821182E1899C39D65DBEE63F29656EF8C1866AA3015BE1EE6BD3C1232E23A03F5169842CE4A88E018AD73337B964B8D2D2E5FABF8B998ACF988B4A25DCF460BA38229F6618988612CD597644C8CDA0DC681CB5262E3B4B676F12C8BE9B38B30DAE2AEF4F552D732EEAAA711F73CDA42472F1D22E704A675A84A350468842BC40FE574DDCD47635DCAB0F817C8CDA9C1F031DD4C2394D5F4ACDB8AB27669F88EABBEEB1FECADA59E5AE7DCDACC79D701562A7CDBA8B869E9B539B2874352FBCFBC2137F32E7736A51694D3637654E2A165786316E80B2DDDF85308AFB79F111DF907C107B01079AE25E53F4F72D3F72343F7E6315BC170B3C3E23B793ED12BB99C669D37E9A191E11858794CEEE2F908DB97A79A43C9DCACBDB3FAD4A8F88B9368377BDCEF005A51298F8021732929681C333BDAE18CE653D57A578F9D4B331860BCE0E99669E664CD5AB9A6E0B3F21FA952C15671F98505B0E99E7FE236F1A1E759A56B3E0CE0859965656E5CBE93465078A528CB247A0FD4AD7CCB59741DC3EF0FF00628736555BC1EF3C17D6D76A62D6DC1FE9F01FE9160AD8703CCEFC067DC46FAE2CB631151CC3BDDB7099A110633F4FF5367CCDFD3EFD2EAC347B74AD70FD5FA43B3A5B27FFDA0008010203013F21E8228745A8EBF963B312215D10574A8333B7314E09431DF43A2862E5DC6BA2065CC68992A6998C2235328450272CD47A12A628AD3AE8C1888CC91505BE9E53832E6E3C415C6C7411D082E09338D208FB254F31224134F465BA3F7C0953E89D64CD62A5C50211D351F47A8F338A6F14BCD43A5C5BE84165316C8AA2C40C5F5894A60D3D2A09792DC3C44C3A1147520573B947A1890412EA39A8B8FCC72A8AA09CA583E7E8BA86EEA3A08231A6C999D1C3963DD8F7A1A82A301DE542E1E515DD9511EA2C9C0C723584C74928CD4C98267A218886580E25ACC4CB7B6C285442A7E920C65AC5BCCD5E822B660D8880BE27994669CB1BD2CD45ACFD0291E81CBFA089D1948CB2F4DA80DBA4B1D6E5C7A4E43D047AD5920CCCF70EE89911851899BE3E94C46E11B2D52D61D9D1584B3A06AA205B8B331BCA03F42485722588C5847562BB84581D20E9649B12A53965931F4114F04FBFDCC1A832798BEFA0AEA3542831C20805892ECC08BC1AA7A6928BB8845D40ECEA63A659C425C30C4E814410CC17187493E845330630D3D18820C230EA4A8CA5FD46B0592AEA50808BE9E408F4A9503E979E829718D4A4863A822E32530654A952BEA59E83A6B7153D494457302CFF00E918742D16308C70707FF34C21FF00CD99FA3FFFDA0008010303013F21FADC10443661771824CF12E1613B9D1B26A1FA41728DC4818AA588309E302B137308855C5ACE0897F505ACCCEA4903AB15153313F131073D10D364A5FD070268B71A9DD2E41831470E264E8F6A8B74BDD07E86539689B9823B8420E95506E394E28645170CAC4A6075C1B99E602C455987D06B0E9B321DA592C4AC1350FA0262CC2CE2288410FA32E8405EE6825E0C290EB5113916F44418525F1C6882F683D55708E33866353A40F51A6721D1679CDC1990B8151730DC5730AEA6ECA245969B874A952A03D3BC0709B11D4C25CB1E8AFCF4CC5C1D57A70CEC7D3F4BAAA88B88A1DD00C22A543A71CE7400C4684AEB52E72FE9868E8C265D63162639C8C4A13B93047E860066D4ACB2667D06A652A995C413CCBE47A6E23A902C331B8B28C199423994B08A2C7095B50AE815BCC6556E8A079663ED1E1938B4FD4ED2BAADE52241D1CA264F79577291388C16546F5294D68F68E60661C80CA389D9F40E95143388C7446A0C7A734C59826CDF4D7FF0CD70E850747A1B22A664D7306DC55F4822E89C460AF4B9717E96B0598A613B90764B51D37281094B2290FA12FA997F4688A0D1D1F0CB211A85B4EA563D2E5CBEB72FE82BC10AE2CE8845886DCB574BE951FA78FA839FA38FAD9FFFDA000C0301000211031100001067F9AF6EF42D8FE0DBBDC75891A42B9B68FBF35AA4EFDB8B42A616FF009D78541737614C9563A81470C8A552A2EFFC04D4B6CF7153EC9396BCA0638011EEC51336A42771163C9BCE318BE201C9781E4CA0B97FBD48510505FDC4512FA08387FAA210366B785DDDD4074D3DAF4716330824F2E084923C5B46D6CDB3A26DF4FBF1C3F026E5A2F1A992770603CE074A9C1733580FFF007F5210F2B8B4DA2DEC414A5797B1302F112EFFDA0008010103013F10CD1CA344C9287286F17F32F9BC470E032AE00202992041BB174E32FDB32BE8102ADF0A51AF11B305D228B440579E7D12A1646D45AC8410BADF10FE50D2A96D40C088BBD545765E9396FD4F2F12B2D679CC46CB9AF1973329B0F29E34D9CCA8CAECA842ACE1B401F70D42A0D023C45D0217600B158E3873E2E0653049698900145FA6675A0E47397043BC74B8387041189A6A1CB42DA963B472172A99C3A944BE5CD0C11ACAD19EF099290EC253C10BAC0085AD5A15BAB8CBDC5AD90F705971F861E718E7051431062C948D77A3C8B1786951792F733C5C31DBB94ABED507A299A3C5EDEA2BA9A02C95C877169801583A5D9E77A8519AF7C9518CDD38FEABAADA36771847CCB9D6F3C4D1306C7D2E73EDE20B7622F6374244A47960E02AC328A0439727606D0A7BD778CF021C4652AD6211050B4C22E7923EF3D8A5159C2D8C8871CEF576AA6EE2132EFD639BEF9FE4002A00ADF01BA22951098A7093AB5371AA56E7C0547DE51CD010082AEAAE0064765E51FB9A65E900EAED02BB26532DA806605F266578CA421C880132C0FA53F507C71069AD9400AA2BD1B866E39975858EC370223619A2D33E3F28EAA99C14A3F7427A5264FBC73AC095C309A018EC44331A7BA43C8BA96A4A4B650500F9959ABD4DE010A2A2B9A003841B2E0284C0F61BAF75292B1672F2B2ADAE99DC95C47B10B12F5294412A25E6A2FEF02559BAE01C9F7B82DA15AB80F981362ED34C8E43286597032232EF5CC6BA2ADFBCA76F96C9FF00B2CDCB9792DAF8E11A8B1A6589951F70C70BD8B56F97837093C15FE502A2816668FDDAC512B0D8D1031B8AE40AC3DA65591C2C6862D3C46D134F0633702B5C945B3B31C926B79B6F8D41AB59C38D8D5DB52ACCC600A93B0628895512CC114E62B2E81BF12BDC5BFAF3DDAE5A90B0B9B24569B152EEC5C12A006B1CD9EDE0180B5423E4D0DC420A3B0A7A4E688E6FAE11A93C3E609CD76962646BC908546CA2C3B4B66D08A5D6638C50F23070DC407B00A1C57CAC0F934361BD5F95C4D894AE7D86922BD895049430339650B6F657E25C404F0A38ED3BC47980BB0BA81BC40141DA6EBCCB4B06D360C3DC6B4EA58BA5D39F44C5079E264422DE030AEFE635ED68D3419718B83A1CC6CF6B8E32AEFB874ED7446634406CD7A8E588507CA41C53F32B0AE8578C779788858A556B019E65A3FAD9A96E5878523F80B0D045A59DA3C40A0E6D550EF88E18C218282D1122B0CB0EFC96217F700179698F573454429BA52755CC6888AF0D26432E0B29283A65283DF6894F40B1E002BB45ABE0E2B55A2735F1007D00B62C96DBBC4420B8D881442216DB7E4A88D18805CCA5D7C53B730903A9147377983DDECE50F6122D7AAF4B0A04F0290B0DD6B5A924828CA34EB220ACEC0390BC5C2A80026017454CCDA2BA9E9CAD04D98048E954929EA54C1AF817461F998D4939038B6BE561883F5F0780E16662A86DCA64CD0B61C9CF92A04FB371F430E8907E0457C4C0C731CC3CAB40BC8A7A8A419FDA041EBEF111D85A0486FAE834D63F5986041406C57FE99A2A1081929ED834000AEB2EBC5CE2302190837416D15128103CD9631921E04499D419CADC8BF511C87B8D58E2CE4B2E6200AD30C2631A7EE211466911BA4AB7B3B7CC4E0E048A6103A943C2B120ED09EA52094AD08B672E6EA570A28D1B128CBBF5EE58E3895FDA2745D2CBA08AB80D03D81AF883F2FB21398635035A6BF7193E16098709472065D4142985C01511810363AFCCA048E04ABBF7B61BC8CECA2DD117AF6399B9B2240628D7F4BFD9949ADD9CB396F81DA5E06ECA8594C85B8C32B818CCB7C15DEA8B95746AC2DAB50D4BA6926020AEDCDD9DFD47A10D31DE235F88FEE35A917B043DE2C5CABC9452F30EC0C7BC580F1DE27CC0F33BA832307C4BB9BA0CCBC76943FD51C682B0AE99738CC0A7360CBDE7E63F67302D97702B34470A0F71732E98F117C2DB039BC915EC86BB86627AA5A77610FD4392EE5BE6D6088DA3206CEF18B6C556EC0476BBE5965CA8A576D838CAA941D721601A4314EC94654688159B450626188525A38132BDCFDC8AA821E190565A2AA19218A73C09658EC88945C3016BB3B8178345976287308C981B5D64C7B8C32DC4C441ADC68F659C059C5F6258FB6D56DAF02DC6770CDC820BED6B2F0D7E42EA55C9A6605B463DB0B7158430A95A0AC1464176936955D80FDE3A079AFA668BA1C334C12361D9C06EF398D9762C3E05233CE1BF8941484B0D69616F965D5A822EEBC2CC830BEAD3625F3517C048657C227EE28388C115E6E8086CF70B18ADB6911534E9EF943C98C3B29959798D5E8596EA8E5F13030F8721E7DDC756DBBB3182916A76C952A5E85872443BB68AE2E3F4A5636E642AFB4475394BCB977185D127273FD188E05887D4730C1FE85B4B6FE2882F3C7169AC05B1681853D0A70E5F31300D8569365AE38A63A8C593043563A94DAD01D0684B061C938ADB72D5A2B92BBC42B210EE22E11BA97B25C29BBB8BD311612F568A8EC49856D2FB378968A37558B3B7E25E657DB0FE18DB56A118AB0BEC768E1AF421402E2AAA943BC20C9652E935AB88A8E517A4943D6800535DAC8D8A3D7B66DFE195D97E01C49C5D5661BC128A072864FB46477CEDC390EF1E6EC4AEC188DA2B3C450D33CAA6200BA6A1E900B69560959AB825FCCD422A8C936F733B1CDE2A54DA4028FC19F98FD880F2240957D971AB89D35B9DD135EA5BDD3445597B4849FA8805186959CC434BDBB7EE4ECD8F920F4E222092A680B8ABA1459CA6C455F330C532F9F4DABC6D76253230033514BB2D919A9641DF4012B24318800C63ED075B219DCC5ED2E50A011A5AED31534464BC7925FE53DBBBD888D4948B67F1886B0AB6A4A6137278B9949CF10BDB8263621B17DCBA87D2A82D8B2D3EF9967CA14752EE85D0811687AF6710ED538F2D81AF3B2260B80B154BAB45E584603B565CFB26A05F270695C96D2698EE7B6DAC621CA156CA0A15B08EF022D8617159CCB8281B0343D66341381568CEC2FBE5885972E52E1012DB8975CA0F8BB7D10EE9D64F5D6792F4D4DA96A664AE1E20D99A8DC15CF32FF00E2A9F5994715734872870F9253F6F02BD02A0E9FA4071F62B5DAABAE799688C9820BA4BB4EF03D8B82DB56304139A644A339898155B9A7A8B4DC2ECC31B5CAC59D9FB8BD2BB9385DFB84989728FEA2A8526DE710F2FEEFA7CB2D190015C72317C7DD2D4A06EAB80A055D19C453CD407271CED77B421D9C53938C9FF0061952B44E6BBF32C055E0ED0E7CCA80A7491594C7098F31B73391573E083A0008023B9E699B7281DC48AF1FA4B1C4439B116556F7C67B0F70686853343A0AECBC3175965943DAC9E9D3195C25715FDB8E88229ED165A51E062F3D39486AD9117D47C20023B60FE2058712EF9A8EB6439A0BCC1019541E581FF00C6D4EFF36FF254CEA709BCFC697E37E93F47F44FF17B47F8BC13F37FB9F8C7EA7FB1DE7FB3CCFF0063B4FCFF00DA3CC37399FB3FA7A3D5E9FDB3FD3D4FFFDA0008010203013F10DFAA848ACE822D8DBE5FF88965732956E10CB18688C150AE4CCAD5E203A57F66B7946AE312CC6C398F96CB9D3697997914AE22509290B270445995F5A8F65174CC9E4B2F9E8C201EF14D3731371A2862976876012655F1B22BE82651084B956A16C23C3B3FA9B0656A8384F662D05C5BD44A5AD770A55ED802D22E031C3BFF0091146619E1228F55ECC03CCA92AEC450BCA645CA974A6046D93989AE049ADDCB49DE503B88ACEF090EFD012A33AB08DC40CAB0A4D04D0B205C48E3CC736E7039868B28492DA3447996DD4A56597BA2849A18D6E2D7923EA435DAE36EFCC6AC712D146D6214B7398B888DC6EAF98275F1FF00660AE939969A2D5463714BE820B60F8A6E0A870772BD10B788D30CB099A254BBBE2302B114AD1C2111BEFD80EF0EED83E0805C6AE0C2825FF7C458306245C672A8354EA2FA2EE3E3180B66482DABE995B1058BCCA80979CA0913537B1E3BC4A9DF108C0A82C81022D12BA930AD30F7198F4234A5880CF349A961918F30FDA3F4DB11D97C4401EC4C0F145478AA083812C261E95202009AEDC072DC29393629DF3B8A98EEF730C07CC070FD4D60F86CF704B0468350141CCB9776FF00F9D100F282075B5804B1A87004B96E89653998FA946A5D399C24A91A84150AB4B94A89E077F133D406F171BB2DDFC12FF0B972E5BA1A370C991ED8ED9980CA18B1518583CF4D974FFC8E19DE5EC76F6C43B74B615C083C087D1722220FA12A39198BE08E94524BE0B6663B4768F1B7F539B0E8FEC4D7BD41056195037DA1D2F1886672F8834638F341702A22596267D4B0CBC96740C9CD2C23ABFBCA8AE25F41069F1CB4ADF4D2A61B6CC9AFF6F8982834F08D8363BC0BAE81F98CBE07696386A0F90C7B154AB1920A745C41189C07897CF1FF0025CC11F08C18D840E9B85845BC4A6DC0877150B84177089EC9EA0ACDEA63B047B2DCACF48C128197019ADCA55EFCEA2217B96CBA1D3D1C3A671F5D41BAE4A7119893B932831446B8EF430C4D26C217006E0E225C3A01F29C04F5AA3A6B52A62678658AC5789DFE880095D14E868EA1D1B8C51B954CC21A60A0DE3ED0B605618AC7DF4A8900B1B4AC608AEB5D3362CCDA04136416A5E0BB79D7DE3C497722F32E65CC43A54A8E20461D1E5378332C2E26E59719E950071C8EA236460A40195D565DF4A8426F9B4DE7EE9A4DDFDD475D1B1D2EDEBE913886A7FFDA0008010303013F10DBA3D232E1997707B41B44F092E8202ED8073A8E19622EE98FB9FE4BC4E1116C46FED896C5508C318EA88AAC164047EA00CEE0C378876459AD88E13550C5B533951D67DC1077965ACCD2831D1E8656689329DE316DD4A75013313289052E09A9640AAD426EB5151CAA8D5E4D41BC9C7E48FA338A2B06E16E5386708E5D83A17CC90929990452FC4A1332EC2C17D91092591C6E1E8C691C4328D04B5776249650C5D0B54A96CA96F336A64A30460DADCC17299906704025448DA1C4381E6521B616EC8486E0CC388068C0F305788731017B54669C1FEA990AB1E20EC68C144495122AE25AD8C23C332EC78CCB3315388A883101704D3076F8884EA251AAFCC1C53370A9B232D112542D821DDD8B2E485AB6AA1186C8A8138422DB071DE2A6454A8E4768AF9D448B14CA0ED22A2B72A6E3D2A1961234788CCEC101CD5C62B52FF3AD50B309AA12830C18663B279E9F7E62A7265B92FF006654BCBC5F41716A00F387D116B3A214ACA26CB9A71E182EC6A31808FE3E25B55052C9B6989804AB9B5710555FD3F62C6DABB961474BD48C7B84B84031021C6A5C4A1EA57CBC47946D7CD4C215FB99C7823152A31F1897E1E1D1D110C4B80DA66C40D419947B4C02E2E60C071196F68656F2A412BA8B2A3D768868F7C4ADABA88106C25AC0A9809C90D605962D7D398261704472352966EA6DD36A8851A3BB2F39622834A4CF3F7944DA02A2036E9181D1BA5388685E600774A0B96DBFB632153680CB825F37B8BD07F09606ADE228BAB34916A2C35DE291773C54BD69D432D6A0BFE4C419DC62328463888E40C87FBEF308AA8519845614065A62005A39F333DF796B2AA8048C05CBA4E7BC543039A221BAAC502828973117532C1582EAE62B75029AEA9DA2CADA7300BEDDA3AC237048E1EF0EE21A58ABCC710F32810E0CC9B60CC5D55CBC9925C598B09465FE7112CEC7FEC5702FBCBAB94EE6082423980D318C462D838E973F12F8F3D162F40CCCB22DA45D0B86A157300204645C7D4DF93A014732996978F41E65C518CAA086AA399CB6257C1305B6F50150CBBA0F831971719717A59CA39E8C3030432E5E322CBC137CC471AE81175934C58183DC54BA160A3051563A2C631D26B19B3D13846729AF46EFA1C4E23BEAFFD900','Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.',2
,'http://accweb/emmployees/davolio.bmp','2100.50');
INSERT INTO Employees VALUES(null,'Dodsworth','Anne','Sales Representative','Ms.','1966-01-27','1994-11-15','7 Houndstooth Rd.','London',NULL,'WG2 7LT','UK','(71) 555-4444','452',X'FFD8FFE000104A46494600010200006400640000FFEC00114475636B7900010004000000480000FFEE002641646F62650064C0000000010300150403060A0D00000E270000133200001E3500002FA8FFDB008400040303030303040303040503030305060504040506070606060606070907080808080709090B0B0C0B0B090C0C0C0C0C0C101010101012121212121212121212010404040707070E09090E140E0D0E1414121212121412121212121212121212121212121212121212121212121212121212121212121212121212121212121212FFC200110800AA00A003011100021101031101FFC400D400000301000301010000000000000000000405060301020700080100030101010100000000000000000000020304050100061000020202010401040202030003000000010200031104121021310513204122323314230630421524343511000103020305050704030100000000000100110221033141121051812232206171421391A1B1C152230430627233D143531412000102070101000000000000000000001130210010204050600131701301000202010401040301010000000000010011213141105161718191A1B1C120F0D1E1F1FFDA000C03010002110311000001ED29902650B34064A05732C665DEB253F0246FDEB69E993BA0673D40905545A0FE6A32F29A796EADC43A89229BED04FB89A35D737CACF5B17513E7CF5CC37F76017E2048412E2E209CAA32D3459E6683658B6740C7431A0A857224226E9B0B9E4D74CDD9E0BA7A09B43D063A693929853906AD7A1D3BD91E55E27A33DF63ED1A836AC8DFE8FCF41D72F29AA5D3ACB0FD411E8C56A62B84597B069D38ADD7613DB210C512C4FDEE600DF19EDF9C9A6C676A77CE75595AD992966D44BCAF9E13C93420B67E7AEB3B62D27735F2DA946C1B290C49269FBBCCC4E79177875155766E8EDE4CF3C37D1F9A4F3EBF7552C54E7F2D11DA79AE81F693B5A794D0E22DA829B3EE4AFBDEE9C3194DFCF2DD2B2CBD2CBA277912BA79132C63F8748C5986E5627E6A2EB54F0CEA59B2662731868D8D620386F33B8FBC64365CC6E17A2ADC906ACF48DE3B92D0DC8DF9D49405AC5A2C7C0FBC933C02F1B4DC8DABA3925EA2D721B80F9D7AB194FA794E2ED9BE743DA7BF3EF65F4F15C47A2F916341629B33C3B33AF57C2E0D5DD457B562F9BF3546B72FBC77A845BC476ABA2608B9CD78CB5773296E158A61C205BEF4095ED4A52FA0C8E7CF9D9C0B7D02BC1C78588B4825239EB87975A569197BF3E926256C1E4B96595AE134267422F4882DA4E4F42FCCD4813AAE4435DDD985DC97DC87A012692DFCF94DEC67B34E4EBA99563E55B5C9559DA3E8B8DB7E73B19D5D3554AB1A4284934497B44811B6AB10407EA6BEFCE4BA2BF07BFBEA787B0ADA904F93F5C896C8F1625E45A0391D54D5D128E8F88C7BEF3CAFAC07BE92103329E6D5A0EFD241B7BE79CD4A09C93D51E1D5625E55547C7BA33A725355BC1A6ED4E7C2181797116A435DE8F360E6A32963E5D7493EAD37731980682A8806A93571BDCFD50E9938F759F196F0DF4E09977B523FD5E9E3D64A08D3481982ADBF9FF56203DDA5CDD9C18A19B2700D9BD3CB653D15599AC2B9515AF87EA38BF4558AE76F183D6107D6A5337F47BF150BDA3C7B4603D14359EA709EC5E8679A8B3EE12EA2515F3DD636E798FD1FCB9AB7FA0656D54CF453825E3A121B3F1EE460D5E46F6FC1E5944FA0FB0A61D27A066016B7E25E3E7A8762446A92DF9A42DB471DF7F068DC2C193259B3F78DD226CF616B28ED6C406891CA98643A49AB87706328F4457251E8663ECDD50698837A8859B3552F515B943A1ADCE366AC959B34B66F4F226EDCE7007518FBB1BAB8AC66B8D9EB594CA1BA6AACED49AD1CCE38452DC470FB7B80351C81398F437F732354CE8667268D3BC719BAB33A594DE3B494DCB6A80A4D2D26B30352EAA4296EDC58BDD206E49687B98F40B125744B31A590D97C56D5BB87411DB0B053C99ED04A76434D0C3A0A8D2B6B94E455CB16B9D286E41A87BC8749925CA6B82375B1A86720181FFFDA00080101000105020860AE2A438137F6F338C38CD4789BB4B604D652C86DC25299BBFB440FED58C7436ED59F2072C9961DD696C883A666D6DE2043637F49F1768DBC752B0D62503157AB0B3FF1F03FF01955BD0B3CDAF556EB97D7E269B9A99A569B12B20CA3F513E49F24BF638A9334D512ADCD86B9EBACE75B5C31D5AC895AC0938415C6A11C7B1F4A8C97D1651B1A2AF5526D0175F690BF2060AE37145BECE44372766E1EB9ACE274D5EE3AD471954AE01166262309FECDA46AB92EFEA36920642966BCAFDBFC4DCA6D5A736FEBA957E62A3F1F03CFD7A77412B112083A99ED3597675762D228F5AE4D1B162BEA7F5B30D865AFF9589CCA2FF9341D3687B1A169D8D0FD6A891562883A98E32BED2BFF00E77AC503535A94D845D7E12CC2A5D664D3DD1072AF52DFCF737976E691FC682028DCD7589BBAF12FA5E022663ED5554FEF54D17611A7B850BECFD6372A57606956FEDECB0DFF00E44B2BC26AFF00F5B57702CDEBB5F9B29B36EA1F1AD6CF64AADD1AA3A5162262B9AD6F30DE368D68EBED6AAA6B7B3D7DB3FEC0BC3D9695CC53D8D28D5A6B72DB450A761070D57089B15709A296D735ECAAE98EDB2360A8F537F1F49A6E945C2D69EB1CF33DE6F699B767D6FAC6A80FF5FE3B5FEC1ACE37A8D11C1B65D2DA369393760D6BACD74E53675C7C9B806A68E919AE061756BB426958B12961364FE1ABF86C4B691704A1D271C4F6B48BB4B577AAD9D2DE236D6AFCC920CB2DAC4F5DBD5D765BA449F6949BF5FD75BDF59FB50F15F30CD8F15FF2839026219B8D8D6AB35B521EDBEFD25D2D94ED1F1C9D7134BDADDAE3FC362DB47F5B6F59FF001A5E56F0BCB76C6CDFA8839A8FC6EB5AA8978785A7B9BBE3F5FA6AEEFAB4534CBAA4D9F60ADA3B55ED6B288E040253B469AEEBC9B754E6AA2CC4AAC9B37FE256DD7B75BD85B5D95FB35B2712EBF236A5FF002647FB4DFF001FAFD73C557746BD6765AAA8A622E41BF10642B39966668FF02031338B9914D96E94D63EADDC5FEBF5459EEB5AA5FEC27B1A75C114FF00B6DD9BB46BFEC1B3D65BA2529D7D917AB2963C61EF2AAC1A5FD7B2B7B04E13D3ECF3AE93DD14327B3D14DB1A9559AB284D4B12A5D5A50D06FB788542401EE367FB9BBABB4FACD67B06B65747CA0ECBBC71CD2E57E5A3B675CB6D5564F6D58E1ADB075B635F612C1AD7623FE4CFAA5A534EED5026FBCA28F8A59E3DCFB11AF55BE757552C4AB449B7D96E6B68A4E05632ABC6A51A00F558DC37752FADA96D4DB7D73ABBEAF2AD90D28E2F11567110F69EE7DAA692586CBCDB462B5D87A636DB9957F96DFB35ACB2BDDF952E06569522FF0065AAB7717E601488ACCB357D85A934BDA2CA3711E7F6567B4F7756954D6DBB5755FA93CE6D028CA67E9AAE878D8788A0298F88F7607260F5FE54BB547A20C4AD88946C5AB2CF606B4B2E6D8B6A181A67B2606C7BA0AB62779B4F88BC3E27FC9A8002DA3E48EB86B12534AFFE3D7A76593E3E05566313E5E31ED67293C5742F0A36DD85DB96FCCFA4BCAF6B2BE4F67E218F2AECC2FC8480DDCAE5511FFA4A5A9AC7E65463A59D2BFD9FF5AC37C1B3CA5BFCBAEBC75B8996F8FBD717F55FDEC94FF16C7E94F9E9674AFCC3FC77FF0023FF0028FF00F344FFDA0008010200010502EB9E99EAA5634C43384F8C465FA10FD599CA0611A6672999CE7C903CCC61184310F7EA7A3794584C63F4E2627899ECC7A2F9E84F55FDB11CE213F5995998CC780C10F5B1A03DF3D9BFE1300EF67959CA37407A30C4A8E43FFC2629FC5FC980C680433EEC2226237D39E9CA72999F6680667C533DC18DE5AB880C07B74C198FA7818441E184485BB388A6379432D68463A2E22B88F887AAB609B04E66661681632C2662344695F767FA4F52263A18EB8959C47EC2012DAA0694B60D83E93F4986130F8E795304063D59E81B20FD42667284CFBD9884CFFA904447826614CC45EC7E8F30ACCFD150CB3CE398064E7A274C411BCF5C19DFA9E94CB3B4F933391117A084F7174A4CB97BF456C42DF41E958C074CCF8E667183B4532DAF3024A0C65C823AE66667A18A208EF0BCAEBCF4CC10399E60FC4AB663A661598E804C74033D15A15CC15CC740B1ABC458C4CE19159C74C464857A7280667807A2741E7304782049887C807A1E844E331886590F8D7862C3E44783B4114C63FE4364CFD00433EEDE57C56311A080746138CC4CC27F2F27C751D1A087CA45F07A0821E9F65862C783A0E8DD47813FED3FFFDA000801030001050298988040B31D595A28998077E7058629E87B42332D5C7D2AB3138C64313A002769859C04290AC530451897AF69999883A2896340B152621309999CA07303E663BE3A5A3B4C445804FBBF652D2B19E863743D443DC41184748220E952C61DB1DD3A1861FA6B318F61E0CE32B19331D03CB17053A184C30FD00C2B963D1A52B18C1E3EC8D0B0316198850C2A663A0AC99F119C2570C782C8A3B32C4F0964723247E5D18CE5331C41018CC262219987BCE3F956F1BC278759421110E618F99652C227210471DA30CA8A984C289577E84C5695ACE588B1D3BDA78A55E0C267C82334410F88AF885C4CCA9B050F296A6457DE010912ABB1312E4CAD0DDA3084744EA666089E42740983D184AEE999C78B43184C40311A1F2AB986B804594E619F704347486622BE23BF71D08807534CCE27EC3118E057E19B13381C7A3C10B4689E3E8338BB4FEBCE1C63F9B3C567215310AC6CF551F89D7EF7CD77C884CC030510A308C18CECA33DE59DE23E20B232CE50F78C2536719F209B03B23F120E7A081A330332B1DF3074695D7D956596E2098861413183FB2B0C4AECC457CF4318CCF41DA11197B0B311AF9CA085A25D98E228027C98370CF40625B0106324F8E71C45EE474B3A1F18EC624319E660FD491D0410319CE72C95954FBEC798D07832B11BBC6118451FE21599882626616CC13EC9E1E58D983A3374569CBB6611147E1E079EADD16183C591BC8E8DD1609F77823F8AE1E8DD17ABF933ED3FFFDA0008010202063F02D2C6FE571D93EA03E1BFFFDA0008010302063F02B13C49EA6C5140E14D014366C80879B54D7A173C9365BDB078F63D87ED66C8D6CB99BD072452182FFFDA0008010101063F02EC1B30E2766F4ED446EDBE7B5D5467AA790C0AB9A308823DC4A12FA6A113E51EF2B56FC934B029C06284863DB36E18E69973697CA264C9CFDA6FF9CB52F4AEF2CBC930BEE0137A6A54FEB7520309A3A7CD4E0843209A1171BD5633B92DFA999565A4F797475113F76CEF07B040C577A37A689D46B843061DE9C120A1593AC7C7B2D2089B1CB25A2E3E2BD48F4363FE57AD1C3CC1063496D75DC1377AD5F4934DE4D02FAA47155A442C3F421F9301CA4D50B78D9BD1D51E28E768CA5EF4243A41A1E29AE61B348D9EA4B0C22AED8356E788DEC1737521DDFA372043D28A3025AE5945B0841CFF0022A301599C7E2B987B765735180CD088E9B50250FF00B443C3F705CAFA6551DDBC2F1FD1211B78312FE0A51CE6E7E4133E9904D3E644A75EA1CA0A7A7AC865A22744E21ED1FDE3FCA1298D374758F9A75CD45D4B16E0B9640EDE72CB95CA63CAAE9C194E72A3547F1011BB2A199A384FA7D853450DEEAEBFFAE2ECBEED6370F8206D83EA6523434F8A6FA8D5782FB8744534F43FEE2B5C6DCB4FD50AAF52DCB5410CDF63CCEA96355C92B65B1029F15E9F9B726C44EDC65F247F1C757E41D3E11CD42DEF93A94052D809D6A8658A909613EAF02BD138DA2C3BD19CDE9BF2467E9812C04C67C1385F6B139EE40932D7206BB8E4A27F25EC5FB5097DE8CCF3C9E943DCA575B4DD8FF6C474C81C24168396C91EA303C142C7E4017AC4273909480333ABCB45FF00A2C1F400938864AD5D90FB738697F0285DB7C97460A77AFF002CA1CB18F7237246A7109D538A07CB38B21290D5002A7BC263D7759F8A6C9326216024AA045969408CCECC58A6D41B65DDF08EA8F8840C6938D0F71449E5BD67DE111B0B54AF4AF7F5C8D25B9424FAAD4F13BD4A4DA8C082B8F6878F66EFF097C17AD627A44B18A8D1F515A6D4FAC381B34EC8465CF6A8E0A3506321F152D1D13AF143B12B303C96A92237A6DDB04B119EDFC897EC23DA84327AA78B6B635EF2A65DC588C627C5961E8DC8E4B5C0EB8FC1315A4705A09E93F14244B890AA89EE4366919A9DCB785CC5032AD72405A1A89C91D78C97A77BA27D13CB669CEECC040719295CEA9E108AD313CF78EB9CBBF648794AA2077A6DE83E4A1E1B1D34CB2695C8FB573CE1C5389C6B946AB5185CD233644FA5285BCB506E214357535559B19446A420ECB5DA9FAD6CE20AFE9B7AB7D4262139555BE3318A898D60ECB7307F6AF4CF543610AA48943064232D176317C47326B9F8BAC935217D8FC56B9FC7E6535CC751221945D691805E0AE5C1D2ED1F009E356427070E2A14AF47543B82E754AAD2B4CEB0508DB6237A9CBBA284FCB8142512E0A6D8F1C57DB5D71B7E017D5238C8EC36607EEDCF704F932D72F7216B5698E3291C95BB1F89A6721D5E1B1E1CC366284AD973B9107A998AD12C42A5607108189E1B01EC691CD7E5D3146733AA72C5537260582C54AECB01B394B32D331CE3CCBBD56B25F6CE192F5063B1C165CC7505D49DD62A875DE97443E651BD7A5AE72A9289DD2D872AEC1F55C2FB5D394C0556ACD6B382A7639664273324A3724B823B9D4AD9E0A206245501992C84079518CB1288180433DE8461866996A52BBE629C609BB44A1F548B95EB0A0409C50395B06478233359144F72754C53E1B2B45280E9ED84C139E0A314595DBB9CDA11F9F6386C082978047B43645414BC55BFE6767FFFDA0008010103013F216CEF4025094105BF14A99DCB29045620AA32CD69F2CC0C9C3980A8078F788D51867D4315C30ABF35FA9F5BDAF88F10C2B2B003EB29EBEDD1FA8790846C0C363FF23A254DC3A06630D64532ED2B2B6B7EE2586DE7DF29750D8438D1F9CDC30AECEEBB5FFB118E64A67E6A26D6D07D5364775E37D254C8548E11405FAEA5AAD19E27FB3414D602F144A21D34AB264CC3082B1DF100AE7B79264A052BC4132FC678986D6D7D657780D5F7771E34E9FC8A7DA57D0596D221541BB4B20E397941031D20302B24AE14603C3F3598D9ED8539BAECCB456B2DA8F0ED2A3F78709B87A5585F780313B912971196B77DE30777D84AB79CBED5FB2627BA4F779974F14412583F308554CBA420222022391989C73FEE57D88E70E441130D0F14C46760FC1169B0639E8CE784981356CB10FED3B95B1AF95A0C0DD7B586206054BC8C54C6A3E92E5F40A2AB7DA706A39CEA925DFBA97F5ED0FF00143E05B16CC13B451DCDDCA17824CC03846FDA707591C3CA7B8E6A379CAF2FA7ED0A05C41B2E1CF5930E87982D724B4A615F77986DE67D549858B7241E70E6263A0885A8608EAD9F7089E99F74C474FC360E7E3B23B80071D98A7E1895583820F552B2C6AB27C0B2AD2D7B4A5CE74D58D55AF5716D1FB314C89EFA8BFC37F6D3074C50ED11918D088DE764A2483A76115E9A225CB7FC60A0C9B7D99B995CC4A5B278F52E7091B57E9758F694E777D1CB0879A44BD69E20E667D8C734EE241F4BFC435793EE600D3F2972F3DC22507B9742B922CFA8B828ADDF7ECA9641B11EF58473A8093767E989CD34C7782BF70C076AF530265C317EF476EF351D879E37ECC64267D9AB6A0CAA11AD07CC26D2BD28BE783EA0B1AC26F0D3FE113AA31695EC972BFD451BEF6AB58388035E0607FEB2867CCDC200EF1F16688A8CE4CE31294DEE7282CB19BCCA45D55BF86F111A50EC5E880EC98E925C289471E1FEC7D52DA3ED2A9D92D5D367C406417A9C0EE2E950F21A7EB2E9AF816D5BF697FBF211E68556A52257188AE03C5C200EECDC52AD6A2E2144BA06592DF6BE936C7D2A0F685696EFACCA913D1C843F4CB135CE4289A370DDDC232508F6962FEB2FF8C045F50685D935540F382B10AFF54C0F5339EE5488A9BBBC3A788A1F5D6C6125D1216F21ED431E190E6F731C8D93384B8B23BC492C712DBDA34DE66F9258E701F6584F984FC34BB1724F9C09AA60B8759650672065ED8249B558CC5202065A3EE09632D8175C4F784CC6731F1063009CB800992415EEBFCC60ECA1AA7CA9B528C95AC0F29769DEF1827A9548017E19E528B0198771B27237DA37196FB1655ED06397D66AF15E589DAD290D131952795E1F30830DE31E0CC33F1793F51825A7602F2C61CDAF6B2CEE698734A63A565984166B6BDA086D6A868B0A17332DA429C4ADF0253AA4B6D9D80F194AA785A7E66A64C25DFA47276E6C25B19DB5C7164033508CF5948F2C3DC7CCA6FD4D78E6C66701D86CF8217A18DC492ADE105894943866B7A7A45B861FAE2127FC882086FC29F8CC315F64A6633F055F77FE4CF032212D65392929A6E193AA48AB6CD44BD40454B8326714F91E884F39E9D2769802E4732C266CA2656555AEA5C6E9A43466730DC8F115B01D3C3A65C8605BF192127C13B30CE456AFA4C32B61A633F851AD03B337C077B3EF0CB97CF0C5505ED2A69DDCCCE8825B5783699D4B218BF13E70D981CFCCB14BD5E60BBAD8464A7982342FCCA3D2E7BAA1A474BC9E7E18A469EA67A810BF66946F3CC000E254E276A022CF9F04F2C4489B4C20A66398566614E7185711F57EB029ACC9AC1A866A3CFB970BF29832D37DA08FBDC3E605056FF110C951CB48E4958313F32F1783C4A6E5986E89EE38A8687DFF00011F92ED7E08B1327D89528280801B10F76E713878B1F5C4B1A270176D30C2BA65C182B983427BA7BC33308B46E0BDD2ADC44571438881F518A060D6A30B6BABED051EEA206F0C1ED6F94276A2858E90F980F4C84218324BA6B48E9DD62153572436EC9594F986B22955D818FF00697B8E6B29314258654971360EEC319BA84BDA6421F10454563092C0FB043D92C45DFEEE56ADE84277203396D5312C9ED2CC9B9BCE5C730B6F76EBDF332FDEA5ACDB1308EBA6EA7DEC0FA53802DA12E534CA780D4BA7088F1BFD2372B37FAE8E3D07DC13F7CFEEBB741BA3B8EBA79E8399F87F89F60CFBD4FECFBF47FFDA0008010203013F218B2E3067A1B8C46CCC54C2E971518994667C4A867106B12DEAC631AF4FFEE8F164B4532F2D2C4EF422D95333E90952A2E8D68420EAABD2A543A6314709632B350D40CBE911D41725E07504204A9504D91CDDA6D2E978A2C37380984FF1A4210E8CC1B9F5D05460F4AA2128B65E2FBC75FC5010207561C4AAD15C2A60315B5D2DEA5D784C7713AD5096422E523D1EC8732D54C79985A679AE5DAE250F12A9DC40834B44831810939B8629CF68A9BE95266A9CD2F2E038226108F945C6F5D0EFA6E2388D54C2A545F8961447D74AAC55F129313E8A6DD2E530B8BADB072A1B8AE59F0C442E2C44A6C983A1E78F41FE01C425752E289521F5932CC0D4261A65233E2E095065C4E8311A43A434881119929DE69F513996DCEE972E7C89BC4EB60E80E55CD4BE99930BAA7A53A5AAE95B612FF84742A025F58DB1DE231713B980A817D0E4D824B2510F5C4CB972FF008228CA9B8551CA45681B9B24437338743522743AA3A2D7A546A62B89758C6DB8920258332D1A17021E3D412952D4109960C1C70A8EE0B2D623C4447726A4B88871C835D0CE354741899C499482E66C4CB12E6012A634EA144830BCC151E609C934E8EE97D2624598F9477D3D08242FD6A53D47724C2529AC1899E2625B306690CB10B38D7417D6FF0004E6C51B84BE9D26BD19D67F5DE6DD63F85CC3A5AC36E9FFDA0008010303013F21A6107F004084DC352E234311DB4B9112FDF4E6E92B5E23D081D22FD343B7A8335F54A20BAC678A29EEC537322687409D7BE10C2D88B1FA4FF04D814E7EE58CE142799738908B6510CD22C92A8D930C7517A2E5C5151C8964D3A4704AC958996D2D641EDFC488C7A13357794FA4D50B1BEFA06A36A2567D40ABE9063D62FE019532B8823A8DA941D03DA55A99208A828E85F4C28C54D04AB7164FC51731513C134E504DB3BBCCF6915965CF24F69963A3B4C539301B5D1CF138210086EC41ACABD2642033E82E02BDCE71709F0F4235D1CE4C24808A065396139E85E3320B96A7CC7514F4859921B9A892AE3AC4722643920B7445095B536E95643D5C3A1D44CFF03AA50DF8ED05B8391B83588B9A94C402169995A60C1D026B4588E0B1957406270CD214AF10EF3D2AEA764AF4CC0ED163AD54AA658E277E64C46AC233633007D6548E9ED856698E0A2FA56AEA2C20C0D608F125BB209EFA0E810A09A417315A2D47CC361C090D7C4C0F68B324AF509E538C453860D83EB2EDBA3B47D65E5905132F05236A2E0EA59A99CCCCC11644B9A4A20D989F1D65C17D22D932D4D18A15D403152F0249DD312422E3A89191BE82274CF8C4E2165506229A946B6EFD01FCCB61E841288DCFF0C08DE0D91E239260CB984AE1D1091130CB0DC77688E822E99A11CA8311620E9D67C4C3299B02A1D094339FA0746B074631BA0E24D5E2462E4DE2E7A432A99C19CC1D1332202BF89AE25D83A3A5A75B379A43F9107F80C3A3BF57FFDA000C030100021103110000107C2EB2954834D3A1215E385E0D4FE6B5728AFF00C85C9C12AB29EDFA0EFA8B1E599834416C91A3D45713D599789725B83CE1E1889358543F63E44646AD67BFFDCBD0357B3193247A619DD8F23C1A8BB8A1E7EC57C192A0C4830C929A52B2FA1C68C0EA7433CA1D61BF6BEF39A4EA2118B8236953657933D44D4A2848F766FCC16DA83A2B3DC58700289C730CC6CFE79A463C26123F78AC49C726A931480C9C42A56A9D04D409FFDA0008010103013F105325462ADA948AC4B7B198EE5C00583B0B7983CBDCD390B9B60BC3FE43320A6C09F1080B92D84094D2E58B38DF35719F2E256336D5A2E415D82A2EE5D55EE1699C0A617E97DAC62718705E76C5F736192D726B5DA64DF46637E7222B48526EC5798BDB5629C0DD2A3D9C2E8ECF243D3354F84C47B8337089416BC446B506F278298F0329AE6D3839CBDA302AE09318A4A0F6BFA47059802FBCBC4466DA966BC86B2DE3E10B9889506028E0E1FF00D8E973C5ABDE1C4667514DDA32E74C6D45E1D8B5A19E7C472AD73A975B718E226092F22FB1B572E3C464156ACF28F23D12BA3284EAAA1C32A832A42AC21A72988E850146D93612E8B2C587642A205A6E3DF5F98946C2CD11D2DEBE9330EBCDB767BCDDA9F76985EF05DD7996E026A906AFA6763B4666C044F2B59FAC089316E0A6ECAFEF30456A14156790D32920355607B85DB100A30917406242A264D0F66079268FD86B1EE5BED452EB8159AE1A6524A899D8387C2FB4CBDBE634D638D2B1452C9D58E3C8C30BB1E606D4E2BD83CCB5D48CF96F3CD407B660ADD997E910102C1D90F45AFC11F6A8602F23DCAC7FCF280571DFE91118C1AD39F3F5948003B437CC2D3B1000A80A404A1AC71052A154CB95AA9A41C7B12D60F5D008C6B6224A30BF8129A659C0C359073BA7273EA1134D4283CF1DAA041B623BC047237C7E2240CAC1F87FD99D27EB40BFC5EE2EA415289293CE1C7303B6AD73E04F6542C0005050B56FB95A1B2A222A27B04BC399DC62A3A45554F2890CB39744513E622250110036D9A52F5B16628838140F1ED097181568CCBDB04690968357EAE213603CB2ACAB4A7DE3F5119052F00CDBF48420F1A5A0E55E6A199489344D65E09DF7517119306D1896256794A6C164EEB87ED0C818E3F331A601A8825CA92F51912DC4A7F49CAD67D48EC9C1EB9571791522F757DE0C081C0DFD20BF13046EEB37D98BA86198B656309308C80395755081FB42B08E526DEC81F994C2EB2D93DA7B338E61F50D80609A53063FD1335D05B625C590370855A0480346C9C51FF20647FB451103442B4E7D12A0EE80D2D634D4A58730033866AC8BA17E112923943ED5B9D8A06397B1FCCA4D065E104F632BD2D8B462ADFC7B968A1C82A6C546BC4CF1BB76269BC403914BA453E8F88C6300E315A3F2B345E3906B47DD5CCB0551440BBEAE98B8011680506DCE10CB2F761C0C3118B77EE338124077AD7D582C446EFBCAAAAF061ED164D10C86342C34A2B45083697004117A645E58BAECF883828323F282A3144E46CA09DE69A2B467D4075AC5ED61015F1507871071D5961F8661911BBA87D08E009A640C34555FFD4173989B2F382A1A66668D0800F764A22A086511E1B854AE89762B0F8DFA991ECADB0EF81B31AF11768785AE710549CA588691B1A2FB462AEC10FA395F1AE0DE411AEF2CD42DC294F4E5B9625FD1DD2125ED8A4A4624C6B13B49E222303CE04142EA9EEC663F4AD859CE7752B4582A0EF5C906D5859227A819E61D2253BABB1284BD7AA690AB21A43E278697E316E3B46E3240FB2F9F95EF09E10B6C3251DDD5C382B2C26D683C56D96EBA7D5E08324C540A5B1751FA5A2C84298E108AF144AC1057B6131162A3815165806880AA8556B17462C89CBAB42AAFB7CCAA0270A50D6CA26011D0557B8B931D2DDE779FCCB2C39686046CBDC628646FB2E22E06808C2521BBBB57E6128F7D5F66016AD3B6A1D37BE2C3AFD6AA3D09B44FB479CF7E603026F80398EE6C99E0B2C63018EFCC685056698786CD5553E60868EE755AAF43BE25060285204C6071490804474C95ED51236E2A1ABA421AA392AFDA52FF00D590CAB16164CE31970E48D7DA1BCA06FE603F8045C439ACC5471371F0FA145A04E619CD1A7C41E248760072F863B2201D8552AF8E26197FF30CDC96DE4C473860D89829D4A81A6D818BB392276F2AE554F854CF0CA22D6F06AAE0761E65393B8F52C05ED08480C1620073899804018179781CCCC120EF9FCC428E43101391E60689F32BFA9D1A6BEAC31B8BDA2FAE6BF98A3A61192CD55F170D74BBB1FC01B8ACA5E1DC0F642AC0D5F167095BB88D41CCD0E7C31AC554C3FF0063696FB2D3E18390B6BC1C2BACB6799FD9F611BC66380A80DCBDF8283DF102BA5778554596130EF15514F6D666D3B9DE180390252CC5420C1E896099BEDF314BB24B0BAAEE9DE66462AD9C76BF28C48D896269880C52B92B7FC40170852AD7BBC9302648AEA1780A8DE96832501F83D4B56A4366E2A94CC2F3EA1AE5A85F26DAFB4B73C819155D4B19202DBA01B7F107881FDAB5F56210C10FD09CC370A7B2BBF96A555496A11C732983ED4C4FA2E668CF322FD809705A102D6A8BFDD88A9E835DB28E5ED052A19523B80A4C3B9705456CE62838BE7968BF88C9A6A25A410A74CE0132989CAD0FB3334DE8AE68672A5F7C4B26DB03379EE7682B7A5648D060DBCB54C20C836390C7A945CC6B74BCAFFD8E90115159B0FD05891F0E79E0C425C244BA8913BAA7EA33D8CAECF934FCCAD6816EDE194A2FCA5F9E9B1C290196CC73455F02CA0772111042B47305A39C1C42B80AD145151D00CA7006597F116DE47DD370E9BF90ABECC2874C7E09761DE573086FEACA53884D557A6B350C8842CA6EFE92C29F6097FA97FD542F16A3171B20BA6EC14784E25C300C98EE3BD5EA28B6AD4C3BBE92B66A888FB1A995552D9677FBC2A0D586554A5BC91F6C64B4EC94D8EAA3A3B84B4F5095BC67376C68F13C7AB1D93C82C14AAD35014B430F2E5633162C17474463000428D2FDEB309049529A0B45E5802AAAADD8BCCADB07CF9C7F9183DB5C8F24A682D382738B8828EA1F267C244607C6C2BBB925B29556A8E47B309D882ED7B2659655DA8784995445504BD76831914D258D559101A5AC518F503C83E202BDA7154FB9089E208CF8796B7759D112330B5E4A73EA155B6156E5E2660B76B1B6F9B4F7119D36B1AF38EC788D80B78872C4294F351D501AF4F0D371E7B9C8C61C667341936E4688FD5BA7B154826275A01C3D9F0CA1223C407C8629FB4AFD666C0869195FA0CB584C9B370C0238991C55E605472143F7519DA841787813FC9DA1BDB06C0D01A08FC1463C09418015B8D3BC91CD30499D19CCAAA33A9BA387D2983B640724CC3A63B591DA97D1F588CC02AD1CD25456BE5EF149A8EC12BE2BB458CC2138A6566A79E189A7460C118055DC6A53F4260B1F7B89F51412CFC544A2DAB1682D199DF385F7533028DF93314E171762CCB5F30E11AD39CB5A9F7E34101F980BE0808801DC6088032D04EDBF518C9AA0ACD35B8ECC9D0E29D452EF6D300131255D352A03095EDC403B01E790FBC460091C2F7559970B669808C7137A6753996A55E2F10087151F58B8E5D7E232AD02EC347E20F6A2D3B43328C3C4392A6B6BE5781F227333100A2DD5F6FF004C666663D84A11A4DBF3B835D97676C102D6A639130AC976C11C478D15674C58B07C945948ED1559C44986B8DC0BB77252E952B2EAEA19BBACA65D5251D8A010E6B898037658D09C3E980415840DF371B35825ECDC3B36B5846A616461549F7AFC746FFD389A7DBF99FD9779AFF4E27F47DD3F3E7E07E19A3A3B308FBF21A4FEAF9CFEA7B3D25FD9F7747FFFDA0008010203013F10B2047A4C96CC30448B8EF1730807A47F24EE841330FD44A0ACB09C1EE1F58B08E968ED7F129676418B1451AC0102EBEB570CF7F4A8C6CF7180386A6F266163697C4389980CDA6103D5C0CC3F04CD8547833EBA28C2266A9B61A903C7CC00ADFF007717C4065DC21BF412E232B7242DE316EE1FAB1CAF8E8314CF2DB304CC0471E2600DCB1EB10A108E850A7262583C953121EF880F3B81172825CDC7383B5B957C362115A23EFD1E97D4B82620E25C93516BE5A872B3028E806CE806CD6D546DDAEBFBEE2D2ECC445FF18AA12A096A86D1948BE0884787BF0A31DE35AF95CAF94E7FBE229871C3336541C61D22A94A806E0BA88713383BCC6098B66255FDD89B0372E5EA1C872C655073B7CBFF003640F2D4729A0990058740A997A8AB389342C4F916C15E2FBC64F094DF9669442E8140E3F3068E933E1E6260E7F2FEE1A5DF4C77B857C23898082E84A989808030BB4988EFC4622B963CAE330E60834BCC11E92E6A5CCEE33AE5455152BF697BCD7E10C7305C4B27C72E62E618A8100D245F30D5799574C31ABDFEE97996B8DCBA8787B87894A2A921EDC32A1EA1CC197C75D0CB047D38937AF3077A34C4BADEE2B22FBA5123570171D4A0B8F1A65759995F7BFBA64E8AA32A65E625CD08B20CB2645E63074F118628FC913E514284E244790EE1BF754A51C20AE82A04001E20D5906428CCA61C6505F02C16AF7A256F0E7FE41B13809998D4B063302EE021DA072515F8856E3773745E81750E2189EEE090EC2146E133F82A26020D45B8A9630AA260B1214A0DC5098475014C353639596C9A60E8CE646AAE64DE602B56C5EA6BD04976C2C9FF0092CA7C63521CD7C79812A4DA4AB03DD41D70DC6A9DD8753848C53D0629012ECB3B9A47F14EC951CADA3D7BFF0026AD8187CC0969DA1E18311C389B020E87710D350EA73F686F9868A4ACC260C086F1111A25939D76C1392520F331A9302933CB1DA0DAB445FB1029198EED12B18E733853291D41CF169884DE9ED0DC951354363C13630CAED710EACDC4B171028830B981DC3BC16031E6496352B4A582589586A05116611961A2DCC0AFA5CC258AA210BDA38BEF32D3C45CDA21F514E22CBB99C036CBEE191EE0D0688EB6602207DD426012E04B01E222A595A771C09A8E2A4A27B9AA8E153286E2CC16C4D2CA5B72A63B880E48D5BE62BED332944FEAB73F04F54373DD37FCFB9C751AB7F134E671DCDA6D19A436FE9FFB396FFBFA9FD49ABFA7C789F77CFEBC477CCFFFDA0008010303013F101A3F42D84666506F7986882C8B1B022A1A54B8388015707DE297F68A200D4B628668F67799536D410209630F98FE845867E97FB88CBEA5F4C1AA9973059DA15D0C519713D04B1913DC2417DD62C6C44F0E2014ECCCD01C414D84C4007418EB7EBB7B8C6F31AB98019953D05916F110B1806B0829D6184138231ECC637D3B50051A262794FECB72C5733B6100236A3AE928C0A28D9100D85C490E1D4A1383C456B12C6672358F00D13C6199E70CA0622C4543D4D2074576E854AD39847993F51CE200B1D100C65681401A11076199D34E4FF2257469D6547ACC2F989C53BF5B822541569AFD40552DC92E1E1341B497AD3147BFFB2BA2AB8ED2927846C5B82659311A2E1D631025E10AB3308A2D11848A75D434AD3C66580F067DCA18EACE0B8417CDEA04636C71FF001985E96E60416D94F6410984362185C630D8860886A144D751C55BF13472589C9A99D5AA8D6E0F6483939DFA6366DA43CDC1146BCF12C2BB85DC1AB660602B9ACCB5A9E6632783FC975A3652BED4D5EE5E5C0778310DF310133B3EF1C61999781ED0F860B600A350049A4FBC3E8B19F92064DA94D351F4F8B2D46EC56165DE1A128DC67573336FACA382392733397B3B42A9883A04A8C421EF2CAE5A7B302EDFDE2068B4CC043B304B894C6B863CA50A0AE856C193B47DF9B5197752EF47645C9CC35A8B6A838E4A800CEE375DCFCF3FC03CF0FCB2B8D89977C457994CA93E25A9B9CC4E1025CFED294E0431B20A5A59F29E28996E44B831D4B26D732CC9CC32504B5E2500D483964A597636D131CDA5C12B30CB918AAD732D43642351C7BA298BB600178A9A6710F515B70267AE980B079C4170D9F586B05ED116A9ED0B633B7FD8CAB51D8FFD99304152266CCEDD2561C89B99102C9AC687E6643BE8100C2867C261208A2AF2666800F72D815F3FA9BA78AEE7D76824B6C0BF998D344C66D2842590979AB77E20866696598520520AC84B3C443E0C20989520A867298617CA69E8ED2AB10F03366BA2C500BEF02A297B7882D5EAE364EC80649AB6232A1D2EEA39DC47FC768361804C4482452309516EF8995C3807B224AC27611326E0F6AAA2D04114BDCCD72A085FE218A6E21B88ACC41E3282CBCC452D5426F6E0EF12CE1114F9FB4702A1D0A83BCD44C44C5620171500A05B3CEA66E609AE95DA391861B99945896218FCCAD0F78765280085EA640712B4ED15B5001DB1D838E605528A8D937FF62B7C4174F45A1D142A5752E95DA3DEDADC37193999F102CCA457B441B846C332D6189A8C1736A35FE88309B5C5875D2350E48D690B2632A6A56D5363F12A6ECDBA9E9D4D89ABBD7C4D9D3F19A741362684D6699B7DC35F709FFFD900','Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.',5
,'http://accweb/emmployees/davolio.bmp','2333.33');

TRUNCATE TABLE EmployeeTerritories;
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(1, '06897');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(1, '19713');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(2, '01581');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(2, '01730');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(2, '01833');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(2, '02116');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(2, '02139');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(2, '02184');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(2, '40222');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(3, '30346');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(3, '31406');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(3, '32859');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(3, '33607');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(4, '20852');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(4, '27403');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(4, '27511');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(5, '02903');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(5, '07960');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(5, '08837');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(5, '10019');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(5, '10038');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(5, '11747');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(5, '14450');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(6, '85014');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(6, '85251');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(6, '98004');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(6, '98052');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(6, '98104');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '60179');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '60601');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '80202');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '80909');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '90405');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '94025');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '94105');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '95008');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '95054');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(7, '95060');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(8, '19428');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(8, '44122');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(8, '45839');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(8, '53404');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(9, '03049');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(9, '03801');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(9, '48075');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(9, '48084');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(9, '48304');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(9, '55113');
INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES(9, '55439');

TRUNCATE TABLE Orders;
INSERT INTO Orders  Values ('10248','VINET',5,'1996-07-04 00:00:00.000','1996-08-01 00:00:00.000','1996-07-16 00:00:00.000',3,32.38,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO Orders  Values ('10249','TOMSP',6,'1996-07-05 00:00:00.000','1996-08-16 00:00:00.000','1996-07-10 00:00:00.000',1,11.61,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO Orders  Values ('10250','HANAR',4,'1996-07-08 00:00:00.000','1996-08-05 00:00:00.000','1996-07-12 00:00:00.000',2,65.83,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10251','VICTE',3,'1996-07-08 00:00:00.000','1996-08-05 00:00:00.000','1996-07-15 00:00:00.000',1,41.34,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10252','SUPRD',4,'1996-07-09 00:00:00.000','1996-08-06 00:00:00.000','1996-07-11 00:00:00.000',2,51.3,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10253','HANAR',3,'1996-07-10 00:00:00.000','1996-07-24 00:00:00.000','1996-07-16 00:00:00.000',2,58.17,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10254','CHOPS',5,'1996-07-11 00:00:00.000','1996-08-08 00:00:00.000','1996-07-23 00:00:00.000',2,22.98,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO Orders  Values ('10255','RICSU',9,'1996-07-12 00:00:00.000','1996-08-09 00:00:00.000','1996-07-15 00:00:00.000',3,148.33,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('10256','WELLI',3,'1996-07-15 00:00:00.000','1996-08-12 00:00:00.000','1996-07-17 00:00:00.000',2,13.97,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Orders  Values ('10257','HILAA',4,'1996-07-16 00:00:00.000','1996-08-13 00:00:00.000','1996-07-22 00:00:00.000',3,81.91,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10258','ERNSH',1,'1996-07-17 00:00:00.000','1996-08-14 00:00:00.000','1996-07-23 00:00:00.000',1,140.51,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10259','CENTC',4,'1996-07-18 00:00:00.000','1996-08-15 00:00:00.000','1996-07-25 00:00:00.000',3,3.25,'Centro comercial Moctezuma','Sierras de Granada 9993','Mxico D.F.',NULL,'5022','Mexico');
INSERT INTO Orders  Values ('10260','OTTIK',4,'1996-07-19 00:00:00.000','1996-08-16 00:00:00.000','1996-07-29 00:00:00.000',1,55.09,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('10261','QUEDE',4,'1996-07-19 00:00:00.000','1996-08-16 00:00:00.000','1996-07-30 00:00:00.000',2,3.05,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Orders  Values ('10262','RATTC',8,'1996-07-22 00:00:00.000','1996-08-19 00:00:00.000','1996-07-25 00:00:00.000',3,48.29,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10263','ERNSH',9,'1996-07-23 00:00:00.000','1996-08-20 00:00:00.000','1996-07-31 00:00:00.000',3,146.06,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10264','FOLKO',6,'1996-07-24 00:00:00.000','1996-08-21 00:00:00.000','1996-08-23 00:00:00.000',3,3.67,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10265','BLONP',2,'1996-07-25 00:00:00.000','1996-08-22 00:00:00.000','1996-08-12 00:00:00.000',1,55.28,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10266','WARTH',3,'1996-07-26 00:00:00.000','1996-09-06 00:00:00.000','1996-07-31 00:00:00.000',3,25.73,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10267','FRANK',4,'1996-07-29 00:00:00.000','1996-08-26 00:00:00.000','1996-08-06 00:00:00.000',1,208.58,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10268','GROSR',8,'1996-07-30 00:00:00.000','1996-08-27 00:00:00.000','1996-08-02 00:00:00.000',3,66.29,'GROSELLA-Restaurante','5 Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela');
INSERT INTO Orders  Values ('10269','WHITC',5,'1996-07-31 00:00:00.000','1996-08-14 00:00:00.000','1996-08-09 00:00:00.000',1,4.56,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10270','WARTH',1,'1996-08-01 00:00:00.000','1996-08-29 00:00:00.000','1996-08-02 00:00:00.000',1,136.54,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10271','SPLIR',6,'1996-08-01 00:00:00.000','1996-08-29 00:00:00.000','1996-08-30 00:00:00.000',2,4.54,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Orders  Values ('10272','RATTC',6,'1996-08-02 00:00:00.000','1996-08-30 00:00:00.000','1996-08-06 00:00:00.000',2,98.03,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10273','QUICK',3,'1996-08-05 00:00:00.000','1996-09-02 00:00:00.000','1996-08-12 00:00:00.000',3,76.07,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10274','VINET',6,'1996-08-06 00:00:00.000','1996-09-03 00:00:00.000','1996-08-16 00:00:00.000',1,6.01,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO Orders  Values ('10275','MAGAA',1,'1996-08-07 00:00:00.000','1996-09-04 00:00:00.000','1996-08-09 00:00:00.000',1,26.93,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10276','TORTU',8,'1996-08-08 00:00:00.000','1996-08-22 00:00:00.000','1996-08-14 00:00:00.000',3,13.84,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10277','MORGK',2,'1996-08-09 00:00:00.000','1996-09-06 00:00:00.000','1996-08-13 00:00:00.000',3,125.77,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'4179','Germany');
INSERT INTO Orders  Values ('10278','BERGS',8,'1996-08-12 00:00:00.000','1996-09-09 00:00:00.000','1996-08-16 00:00:00.000',2,92.69,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10279','LEHMS',8,'1996-08-13 00:00:00.000','1996-09-10 00:00:00.000','1996-08-16 00:00:00.000',2,25.83,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10280','BERGS',2,'1996-08-14 00:00:00.000','1996-09-11 00:00:00.000','1996-09-12 00:00:00.000',1,8.98,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10281','ROMEY',4,'1996-08-14 00:00:00.000','1996-08-28 00:00:00.000','1996-08-21 00:00:00.000',1,2.94,'Romero y tomillo','Gran Va, 1','Madrid',NULL,'28001','Spain');
INSERT INTO Orders  Values ('10282','ROMEY',4,'1996-08-15 00:00:00.000','1996-09-12 00:00:00.000','1996-08-21 00:00:00.000',1,12.69,'Romero y tomillo','Gran Va, 1','Madrid',NULL,'28001','Spain');
INSERT INTO Orders  Values ('10283','LILAS',3,'1996-08-16 00:00:00.000','1996-09-13 00:00:00.000','1996-08-23 00:00:00.000',3,84.81,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10284','LEHMS',4,'1996-08-19 00:00:00.000','1996-09-16 00:00:00.000','1996-08-27 00:00:00.000',1,76.56,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10285','QUICK',1,'1996-08-20 00:00:00.000','1996-09-17 00:00:00.000','1996-08-26 00:00:00.000',2,76.83,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10286','QUICK',8,'1996-08-21 00:00:00.000','1996-09-18 00:00:00.000','1996-08-30 00:00:00.000',3,229.24,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10287','RICAR',8,'1996-08-22 00:00:00.000','1996-09-19 00:00:00.000','1996-08-28 00:00:00.000',3,12.76,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10288','REGGC',4,'1996-08-23 00:00:00.000','1996-09-20 00:00:00.000','1996-09-03 00:00:00.000',1,7.45,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10289','BSBEV',7,'1996-08-26 00:00:00.000','1996-09-23 00:00:00.000','1996-08-28 00:00:00.000',3,22.77,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('10290','COMMI',8,'1996-08-27 00:00:00.000','1996-09-24 00:00:00.000','1996-09-03 00:00:00.000',1,79.7,'Comrcio Mineiro','Av. dos Lusadas, 23','Sao Paulo','SP','05432-043','Brazil');
INSERT INTO Orders  Values ('10291','QUEDE',6,'1996-08-27 00:00:00.000','1996-09-24 00:00:00.000','1996-09-04 00:00:00.000',2,6.4,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Orders  Values ('10292','TRADH',1,'1996-08-28 00:00:00.000','1996-09-25 00:00:00.000','1996-09-02 00:00:00.000',2,1.35,'Tradiao Hipermercados','Av. Ins de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
INSERT INTO Orders  Values ('10293','TORTU',1,'1996-08-29 00:00:00.000','1996-09-26 00:00:00.000','1996-09-11 00:00:00.000',3,21.18,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10294','RATTC',4,'1996-08-30 00:00:00.000','1996-09-27 00:00:00.000','1996-09-05 00:00:00.000',2,147.26,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10295','VINET',2,'1996-09-02 00:00:00.000','1996-09-30 00:00:00.000','1996-09-10 00:00:00.000',2,1.15,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO Orders  Values ('10296','LILAS',6,'1996-09-03 00:00:00.000','1996-10-01 00:00:00.000','1996-09-11 00:00:00.000',1,0.12,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10297','BLONP',5,'1996-09-04 00:00:00.000','1996-10-16 00:00:00.000','1996-09-10 00:00:00.000',2,5.74,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10298','HUNGO',6,'1996-09-05 00:00:00.000','1996-10-03 00:00:00.000','1996-09-11 00:00:00.000',2,168.22,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10299','RICAR',4,'1996-09-06 00:00:00.000','1996-10-04 00:00:00.000','1996-09-13 00:00:00.000',2,29.76,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10300','MAGAA',2,'1996-09-09 00:00:00.000','1996-10-07 00:00:00.000','1996-09-18 00:00:00.000',2,17.68,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10301','WANDK',8,'1996-09-09 00:00:00.000','1996-10-07 00:00:00.000','1996-09-17 00:00:00.000',2,45.08,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('10302','SUPRD',4,'1996-09-10 00:00:00.000','1996-10-08 00:00:00.000','1996-10-09 00:00:00.000',2,6.27,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10303','GODOS',7,'1996-09-11 00:00:00.000','1996-10-09 00:00:00.000','1996-09-18 00:00:00.000',2,107.83,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('10304','TORTU',1,'1996-09-12 00:00:00.000','1996-10-10 00:00:00.000','1996-09-17 00:00:00.000',2,63.79,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10305','OLDWO',8,'1996-09-13 00:00:00.000','1996-10-11 00:00:00.000','1996-10-09 00:00:00.000',3,257.62,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('10306','ROMEY',1,'1996-09-16 00:00:00.000','1996-10-14 00:00:00.000','1996-09-23 00:00:00.000',3,7.56,'Romero y tomillo','Gran Va, 1','Madrid',NULL,'28001','Spain');
INSERT INTO Orders  Values ('10307','LONEP',2,'1996-09-17 00:00:00.000','1996-10-15 00:00:00.000','1996-09-25 00:00:00.000',2,0.56,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Orders  Values ('10308','ANATR',7,'1996-09-18 00:00:00.000','1996-10-16 00:00:00.000','1996-09-24 00:00:00.000',3,1.61,'Ana Trujillo Emparedados y helados','Avda. de la Constitucin 2222','Mxico D.F.',NULL,'5021','Mexico');
INSERT INTO Orders  Values ('10309','HUNGO',3,'1996-09-19 00:00:00.000','1996-10-17 00:00:00.000','1996-10-23 00:00:00.000',1,47.3,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10310','THEBI',8,'1996-09-20 00:00:00.000','1996-10-18 00:00:00.000','1996-09-27 00:00:00.000',2,17.52,'The Big Cheese','89 Jefferson Way Suite 2','Portland','OR','97201','USA');
INSERT INTO Orders  Values ('10311','DUMON',1,'1996-09-20 00:00:00.000','1996-10-04 00:00:00.000','1996-09-26 00:00:00.000',3,24.69,'Du monde entier','67, rue des Cinquante Otages','Nantes',NULL,'44000','France');
INSERT INTO Orders  Values ('10312','WANDK',2,'1996-09-23 00:00:00.000','1996-10-21 00:00:00.000','1996-10-03 00:00:00.000',2,40.26,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('10313','QUICK',2,'1996-09-24 00:00:00.000','1996-10-22 00:00:00.000','1996-10-04 00:00:00.000',2,1.96,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10314','RATTC',1,'1996-09-25 00:00:00.000','1996-10-23 00:00:00.000','1996-10-04 00:00:00.000',2,74.16,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10315','ISLAT',4,'1996-09-26 00:00:00.000','1996-10-24 00:00:00.000','1996-10-03 00:00:00.000',2,41.76,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10316','RATTC',1,'1996-09-27 00:00:00.000','1996-10-25 00:00:00.000','1996-10-08 00:00:00.000',3,150.15,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10317','LONEP',6,'1996-09-30 00:00:00.000','1996-10-28 00:00:00.000','1996-10-10 00:00:00.000',1,12.69,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Orders  Values ('10318','ISLAT',8,'1996-10-01 00:00:00.000','1996-10-29 00:00:00.000','1996-10-04 00:00:00.000',2,4.73,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10319','TORTU',7,'1996-10-02 00:00:00.000','1996-10-30 00:00:00.000','1996-10-11 00:00:00.000',3,64.5,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10320','WARTH',5,'1996-10-03 00:00:00.000','1996-10-17 00:00:00.000','1996-10-18 00:00:00.000',3,34.57,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10321','ISLAT',3,'1996-10-03 00:00:00.000','1996-10-31 00:00:00.000','1996-10-11 00:00:00.000',2,3.43,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10322','PERIC',7,'1996-10-04 00:00:00.000','1996-11-01 00:00:00.000','1996-10-23 00:00:00.000',3,0.4,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10323','KOENE',4,'1996-10-07 00:00:00.000','1996-11-04 00:00:00.000','1996-10-14 00:00:00.000',1,4.88,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10324','SAVEA',9,'1996-10-08 00:00:00.000','1996-11-05 00:00:00.000','1996-10-10 00:00:00.000',1,214.27,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10325','KOENE',1,'1996-10-09 00:00:00.000','1996-10-23 00:00:00.000','1996-10-14 00:00:00.000',3,64.86,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10326','BOLID',4,'1996-10-10 00:00:00.000','1996-11-07 00:00:00.000','1996-10-14 00:00:00.000',2,77.92,'Blido Comidas preparadas','C/ Araquil, 67','Madrid',NULL,'28023','Spain');
INSERT INTO Orders  Values ('10327','FOLKO',2,'1996-10-11 00:00:00.000','1996-11-08 00:00:00.000','1996-10-14 00:00:00.000',1,63.36,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10328','FURIB',4,'1996-10-14 00:00:00.000','1996-11-11 00:00:00.000','1996-10-17 00:00:00.000',3,87.03,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO Orders  Values ('10329','SPLIR',4,'1996-10-15 00:00:00.000','1996-11-26 00:00:00.000','1996-10-23 00:00:00.000',2,191.67,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Orders  Values ('10330','LILAS',3,'1996-10-16 00:00:00.000','1996-11-13 00:00:00.000','1996-10-28 00:00:00.000',1,12.75,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10331','BONAP',9,'1996-10-16 00:00:00.000','1996-11-27 00:00:00.000','1996-10-21 00:00:00.000',1,10.19,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10332','MEREP',3,'1996-10-17 00:00:00.000','1996-11-28 00:00:00.000','1996-10-21 00:00:00.000',2,52.84,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10333','WARTH',5,'1996-10-18 00:00:00.000','1996-11-15 00:00:00.000','1996-10-25 00:00:00.000',3,0.59,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10334','VICTE',8,'1996-10-21 00:00:00.000','1996-11-18 00:00:00.000','1996-10-28 00:00:00.000',2,8.56,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10335','HUNGO',7,'1996-10-22 00:00:00.000','1996-11-19 00:00:00.000','1996-10-24 00:00:00.000',2,42.11,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10336','PRINI',7,'1996-10-23 00:00:00.000','1996-11-20 00:00:00.000','1996-10-25 00:00:00.000',2,15.51,'Princesa Isabel Vinhos','Estrada da sade n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO Orders  Values ('10337','FRANK',4,'1996-10-24 00:00:00.000','1996-11-21 00:00:00.000','1996-10-29 00:00:00.000',3,108.26,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10338','OLDWO',4,'1996-10-25 00:00:00.000','1996-11-22 00:00:00.000','1996-10-29 00:00:00.000',3,84.21,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('10339','MEREP',2,'1996-10-28 00:00:00.000','1996-11-25 00:00:00.000','1996-11-04 00:00:00.000',2,15.66,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10340','BONAP',1,'1996-10-29 00:00:00.000','1996-11-26 00:00:00.000','1996-11-08 00:00:00.000',3,166.31,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10341','SIMOB',7,'1996-10-29 00:00:00.000','1996-11-26 00:00:00.000','1996-11-05 00:00:00.000',3,26.78,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO Orders  Values ('10342','FRANK',4,'1996-10-30 00:00:00.000','1996-11-13 00:00:00.000','1996-11-04 00:00:00.000',2,54.83,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10343','LEHMS',4,'1996-10-31 00:00:00.000','1996-11-28 00:00:00.000','1996-11-06 00:00:00.000',1,110.37,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10344','WHITC',4,'1996-11-01 00:00:00.000','1996-11-29 00:00:00.000','1996-11-05 00:00:00.000',2,23.29,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10345','QUICK',2,'1996-11-04 00:00:00.000','1996-12-02 00:00:00.000','1996-11-11 00:00:00.000',2,249.06,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10346','RATTC',3,'1996-11-05 00:00:00.000','1996-12-17 00:00:00.000','1996-11-08 00:00:00.000',3,142.08,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10347','FAMIA',4,'1996-11-06 00:00:00.000','1996-12-04 00:00:00.000','1996-11-08 00:00:00.000',3,3.1,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO Orders  Values ('10348','WANDK',4,'1996-11-07 00:00:00.000','1996-12-05 00:00:00.000','1996-11-15 00:00:00.000',2,0.78,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('10349','SPLIR',7,'1996-11-08 00:00:00.000','1996-12-06 00:00:00.000','1996-11-15 00:00:00.000',1,8.63,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Orders  Values ('10350','LAMAI',6,'1996-11-11 00:00:00.000','1996-12-09 00:00:00.000','1996-12-03 00:00:00.000',2,64.19,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10351','ERNSH',1,'1996-11-11 00:00:00.000','1996-12-09 00:00:00.000','1996-11-20 00:00:00.000',1,162.33,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10352','FURIB',3,'1996-11-12 00:00:00.000','1996-11-26 00:00:00.000','1996-11-18 00:00:00.000',3,1.3,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO Orders  Values ('10353','PICCO',7,'1996-11-13 00:00:00.000','1996-12-11 00:00:00.000','1996-11-25 00:00:00.000',3,360.63,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('10354','PERIC',8,'1996-11-14 00:00:00.000','1996-12-12 00:00:00.000','1996-11-20 00:00:00.000',3,53.8,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10355','AROUT',6,'1996-11-15 00:00:00.000','1996-12-13 00:00:00.000','1996-11-20 00:00:00.000',1,41.95,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10356','WANDK',6,'1996-11-18 00:00:00.000','1996-12-16 00:00:00.000','1996-11-27 00:00:00.000',2,36.71,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('10357','LILAS',1,'1996-11-19 00:00:00.000','1996-12-17 00:00:00.000','1996-12-02 00:00:00.000',3,34.88,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10358','LAMAI',5,'1996-11-20 00:00:00.000','1996-12-18 00:00:00.000','1996-11-27 00:00:00.000',1,19.64,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10359','SEVES',5,'1996-11-21 00:00:00.000','1996-12-19 00:00:00.000','1996-11-26 00:00:00.000',3,288.43,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO Orders  Values ('10360','BLONP',4,'1996-11-22 00:00:00.000','1996-12-20 00:00:00.000','1996-12-02 00:00:00.000',3,131.7,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10361','QUICK',1,'1996-11-22 00:00:00.000','1996-12-20 00:00:00.000','1996-12-03 00:00:00.000',2,183.17,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10362','BONAP',3,'1996-11-25 00:00:00.000','1996-12-23 00:00:00.000','1996-11-28 00:00:00.000',1,96.04,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10363','DRACD',4,'1996-11-26 00:00:00.000','1996-12-24 00:00:00.000','1996-12-04 00:00:00.000',3,30.54,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
INSERT INTO Orders  Values ('10364','EASTC',1,'1996-11-26 00:00:00.000','1997-01-07 00:00:00.000','1996-12-04 00:00:00.000',1,71.97,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO Orders  Values ('10365','ANTON',3,'1996-11-27 00:00:00.000','1996-12-25 00:00:00.000','1996-12-02 00:00:00.000',2,22,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO Orders  Values ('10366','GALED',8,'1996-11-28 00:00:00.000','1997-01-09 00:00:00.000','1996-12-30 00:00:00.000',2,10.14,'Galera del gastronmo','Rambla de Catalua, 23','Barcelona',NULL,'8022','Spain');
INSERT INTO Orders  Values ('10367','VAFFE',7,'1996-11-28 00:00:00.000','1996-12-26 00:00:00.000','1996-12-02 00:00:00.000',3,13.55,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10368','ERNSH',2,'1996-11-29 00:00:00.000','1996-12-27 00:00:00.000','1996-12-02 00:00:00.000',2,101.95,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10369','SPLIR',8,'1996-12-02 00:00:00.000','1996-12-30 00:00:00.000','1996-12-09 00:00:00.000',2,195.68,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Orders  Values ('10370','CHOPS',6,'1996-12-03 00:00:00.000','1996-12-31 00:00:00.000','1996-12-27 00:00:00.000',2,1.17,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO Orders  Values ('10371','LAMAI',1,'1996-12-03 00:00:00.000','1996-12-31 00:00:00.000','1996-12-24 00:00:00.000',1,0.45,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10372','QUEEN',5,'1996-12-04 00:00:00.000','1997-01-01 00:00:00.000','1996-12-09 00:00:00.000',2,890.78,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10373','HUNGO',4,'1996-12-05 00:00:00.000','1997-01-02 00:00:00.000','1996-12-11 00:00:00.000',3,124.12,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10374','WOLZA',1,'1996-12-05 00:00:00.000','1997-01-02 00:00:00.000','1996-12-09 00:00:00.000',3,3.94,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO Orders  Values ('10375','HUNGC',3,'1996-12-06 00:00:00.000','1997-01-03 00:00:00.000','1996-12-09 00:00:00.000',2,20.12,'Hungry Coyote Import Store','City Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO Orders  Values ('10376','MEREP',1,'1996-12-09 00:00:00.000','1997-01-06 00:00:00.000','1996-12-13 00:00:00.000',2,20.39,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10377','SEVES',1,'1996-12-09 00:00:00.000','1997-01-06 00:00:00.000','1996-12-13 00:00:00.000',3,22.21,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO Orders  Values ('10378','FOLKO',5,'1996-12-10 00:00:00.000','1997-01-07 00:00:00.000','1996-12-19 00:00:00.000',3,5.44,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10379','QUEDE',2,'1996-12-11 00:00:00.000','1997-01-08 00:00:00.000','1996-12-13 00:00:00.000',1,45.03,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Orders  Values ('10380','HUNGO',8,'1996-12-12 00:00:00.000','1997-01-09 00:00:00.000','1997-01-16 00:00:00.000',3,35.03,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10381','LILAS',3,'1996-12-12 00:00:00.000','1997-01-09 00:00:00.000','1996-12-13 00:00:00.000',3,7.99,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10382','ERNSH',4,'1996-12-13 00:00:00.000','1997-01-10 00:00:00.000','1996-12-16 00:00:00.000',1,94.77,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10383','AROUT',8,'1996-12-16 00:00:00.000','1997-01-13 00:00:00.000','1996-12-18 00:00:00.000',3,34.24,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10384','BERGS',3,'1996-12-16 00:00:00.000','1997-01-13 00:00:00.000','1996-12-20 00:00:00.000',3,168.64,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10385','SPLIR',1,'1996-12-17 00:00:00.000','1997-01-14 00:00:00.000','1996-12-23 00:00:00.000',2,30.96,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Orders  Values ('10386','FAMIA',9,'1996-12-18 00:00:00.000','1997-01-01 00:00:00.000','1996-12-25 00:00:00.000',3,13.99,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO Orders  Values ('10387','SANTG',1,'1996-12-18 00:00:00.000','1997-01-15 00:00:00.000','1996-12-20 00:00:00.000',2,93.63,'Sant Gourmet','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway');
INSERT INTO Orders  Values ('10388','SEVES',2,'1996-12-19 00:00:00.000','1997-01-16 00:00:00.000','1996-12-20 00:00:00.000',1,34.86,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO Orders  Values ('10389','BOTTM',4,'1996-12-20 00:00:00.000','1997-01-17 00:00:00.000','1996-12-24 00:00:00.000',2,47.42,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10390','ERNSH',6,'1996-12-23 00:00:00.000','1997-01-20 00:00:00.000','1996-12-26 00:00:00.000',1,126.38,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10391','DRACD',3,'1996-12-23 00:00:00.000','1997-01-20 00:00:00.000','1996-12-31 00:00:00.000',3,5.45,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
INSERT INTO Orders  Values ('10392','PICCO',2,'1996-12-24 00:00:00.000','1997-01-21 00:00:00.000','1997-01-01 00:00:00.000',3,122.46,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('10393','SAVEA',1,'1996-12-25 00:00:00.000','1997-01-22 00:00:00.000','1997-01-03 00:00:00.000',3,126.56,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10394','HUNGC',1,'1996-12-25 00:00:00.000','1997-01-22 00:00:00.000','1997-01-03 00:00:00.000',3,30.34,'Hungry Coyote Import Store','City Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO Orders  Values ('10395','HILAA',6,'1996-12-26 00:00:00.000','1997-01-23 00:00:00.000','1997-01-03 00:00:00.000',1,184.41,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10396','FRANK',1,'1996-12-27 00:00:00.000','1997-01-10 00:00:00.000','1997-01-06 00:00:00.000',3,135.35,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10397','PRINI',5,'1996-12-27 00:00:00.000','1997-01-24 00:00:00.000','1997-01-02 00:00:00.000',1,60.26,'Princesa Isabel Vinhos','Estrada da sade n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO Orders  Values ('10398','SAVEA',2,'1996-12-30 00:00:00.000','1997-01-27 00:00:00.000','1997-01-09 00:00:00.000',3,89.16,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10399','VAFFE',8,'1996-12-31 00:00:00.000','1997-01-14 00:00:00.000','1997-01-08 00:00:00.000',3,27.36,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10400','EASTC',1,'1997-01-01 00:00:00.000','1997-01-29 00:00:00.000','1997-01-16 00:00:00.000',3,83.93,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO Orders  Values ('10401','RATTC',1,'1997-01-01 00:00:00.000','1997-01-29 00:00:00.000','1997-01-10 00:00:00.000',1,12.51,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10402','ERNSH',8,'1997-01-02 00:00:00.000','1997-02-13 00:00:00.000','1997-01-10 00:00:00.000',2,67.88,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10403','ERNSH',4,'1997-01-03 00:00:00.000','1997-01-31 00:00:00.000','1997-01-09 00:00:00.000',3,73.79,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10404','MAGAA',2,'1997-01-03 00:00:00.000','1997-01-31 00:00:00.000','1997-01-08 00:00:00.000',1,155.97,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10405','LINOD',1,'1997-01-06 00:00:00.000','1997-02-03 00:00:00.000','1997-01-22 00:00:00.000',1,34.82,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10406','QUEEN',7,'1997-01-07 00:00:00.000','1997-02-18 00:00:00.000','1997-01-13 00:00:00.000',1,108.04,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10407','OTTIK',2,'1997-01-07 00:00:00.000','1997-02-04 00:00:00.000','1997-01-30 00:00:00.000',2,91.48,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('10408','FOLIG',8,'1997-01-08 00:00:00.000','1997-02-05 00:00:00.000','1997-01-14 00:00:00.000',1,11.26,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO Orders  Values ('10409','OCEAN',3,'1997-01-09 00:00:00.000','1997-02-06 00:00:00.000','1997-01-14 00:00:00.000',1,29.83,'Ocano Atlntico Ltda.','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10410','BOTTM',3,'1997-01-10 00:00:00.000','1997-02-07 00:00:00.000','1997-01-15 00:00:00.000',3,2.4,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10411','BOTTM',9,'1997-01-10 00:00:00.000','1997-02-07 00:00:00.000','1997-01-21 00:00:00.000',3,23.65,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10412','WARTH',8,'1997-01-13 00:00:00.000','1997-02-10 00:00:00.000','1997-01-15 00:00:00.000',2,3.77,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10413','LAMAI',3,'1997-01-14 00:00:00.000','1997-02-11 00:00:00.000','1997-01-16 00:00:00.000',2,95.66,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10414','FAMIA',2,'1997-01-14 00:00:00.000','1997-02-11 00:00:00.000','1997-01-17 00:00:00.000',3,21.48,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO Orders  Values ('10415','HUNGC',3,'1997-01-15 00:00:00.000','1997-02-12 00:00:00.000','1997-01-24 00:00:00.000',1,0.2,'Hungry Coyote Import Store','City Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO Orders  Values ('10416','WARTH',8,'1997-01-16 00:00:00.000','1997-02-13 00:00:00.000','1997-01-27 00:00:00.000',3,22.72,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10417','SIMOB',4,'1997-01-16 00:00:00.000','1997-02-13 00:00:00.000','1997-01-28 00:00:00.000',3,70.29,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO Orders  Values ('10418','QUICK',4,'1997-01-17 00:00:00.000','1997-02-14 00:00:00.000','1997-01-24 00:00:00.000',1,17.55,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10419','RICSU',4,'1997-01-20 00:00:00.000','1997-02-17 00:00:00.000','1997-01-30 00:00:00.000',2,137.35,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('10420','WELLI',3,'1997-01-21 00:00:00.000','1997-02-18 00:00:00.000','1997-01-27 00:00:00.000',1,44.12,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Orders  Values ('10421','QUEDE',8,'1997-01-21 00:00:00.000','1997-03-04 00:00:00.000','1997-01-27 00:00:00.000',1,99.23,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Orders  Values ('10422','FRANS',2,'1997-01-22 00:00:00.000','1997-02-19 00:00:00.000','1997-01-31 00:00:00.000',1,3.02,'Franchi S.p.A.','Via Monte Bianco 34','Torino',NULL,'10100','Italy');
INSERT INTO Orders  Values ('10423','GOURL',6,'1997-01-23 00:00:00.000','1997-02-06 00:00:00.000','1997-02-24 00:00:00.000',3,24.5,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO Orders  Values ('10424','MEREP',7,'1997-01-23 00:00:00.000','1997-02-20 00:00:00.000','1997-01-27 00:00:00.000',2,370.61,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10425','LAMAI',6,'1997-01-24 00:00:00.000','1997-02-21 00:00:00.000','1997-02-14 00:00:00.000',2,7.93,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10426','GALED',4,'1997-01-27 00:00:00.000','1997-02-24 00:00:00.000','1997-02-06 00:00:00.000',1,18.69,'Galera del gastronmo','Rambla de Catalua, 23','Barcelona',NULL,'8022','Spain');
INSERT INTO Orders  Values ('10427','PICCO',4,'1997-01-27 00:00:00.000','1997-02-24 00:00:00.000','1997-03-03 00:00:00.000',2,31.29,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('10428','REGGC',7,'1997-01-28 00:00:00.000','1997-02-25 00:00:00.000','1997-02-04 00:00:00.000',1,11.09,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10429','HUNGO',3,'1997-01-29 00:00:00.000','1997-03-12 00:00:00.000','1997-02-07 00:00:00.000',2,56.63,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10430','ERNSH',4,'1997-01-30 00:00:00.000','1997-02-13 00:00:00.000','1997-02-03 00:00:00.000',1,458.78,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10431','BOTTM',4,'1997-01-30 00:00:00.000','1997-02-13 00:00:00.000','1997-02-07 00:00:00.000',2,44.17,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10432','SPLIR',3,'1997-01-31 00:00:00.000','1997-02-14 00:00:00.000','1997-02-07 00:00:00.000',2,4.34,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Orders  Values ('10433','PRINI',3,'1997-02-03 00:00:00.000','1997-03-03 00:00:00.000','1997-03-04 00:00:00.000',3,73.83,'Princesa Isabel Vinhos','Estrada da sade n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO Orders  Values ('10434','FOLKO',3,'1997-02-03 00:00:00.000','1997-03-03 00:00:00.000','1997-02-13 00:00:00.000',2,17.92,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10435','CONSH',8,'1997-02-04 00:00:00.000','1997-03-18 00:00:00.000','1997-02-07 00:00:00.000',2,9.21,'Consolidated Holdings','Berkeley Gardens 12 Brewery','London',NULL,'WX1 6LT','UK');
INSERT INTO Orders  Values ('10436','BLONP',3,'1997-02-05 00:00:00.000','1997-03-05 00:00:00.000','1997-02-11 00:00:00.000',2,156.66,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10437','WARTH',8,'1997-02-05 00:00:00.000','1997-03-05 00:00:00.000','1997-02-12 00:00:00.000',1,19.97,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10438','TOMSP',3,'1997-02-06 00:00:00.000','1997-03-06 00:00:00.000','1997-02-14 00:00:00.000',2,8.24,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO Orders  Values ('10439','MEREP',6,'1997-02-07 00:00:00.000','1997-03-07 00:00:00.000','1997-02-10 00:00:00.000',3,4.07,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10440','SAVEA',4,'1997-02-10 00:00:00.000','1997-03-10 00:00:00.000','1997-02-28 00:00:00.000',2,86.53,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10441','OLDWO',3,'1997-02-10 00:00:00.000','1997-03-24 00:00:00.000','1997-03-14 00:00:00.000',2,73.02,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('10442','ERNSH',3,'1997-02-11 00:00:00.000','1997-03-11 00:00:00.000','1997-02-18 00:00:00.000',2,47.94,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10443','REGGC',8,'1997-02-12 00:00:00.000','1997-03-12 00:00:00.000','1997-02-14 00:00:00.000',1,13.95,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10444','BERGS',3,'1997-02-12 00:00:00.000','1997-03-12 00:00:00.000','1997-02-21 00:00:00.000',3,3.5,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10445','BERGS',3,'1997-02-13 00:00:00.000','1997-03-13 00:00:00.000','1997-02-20 00:00:00.000',1,9.3,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10446','TOMSP',6,'1997-02-14 00:00:00.000','1997-03-14 00:00:00.000','1997-02-19 00:00:00.000',1,14.68,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO Orders  Values ('10447','RICAR',4,'1997-02-14 00:00:00.000','1997-03-14 00:00:00.000','1997-03-07 00:00:00.000',2,68.66,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10448','RANCH',4,'1997-02-17 00:00:00.000','1997-03-17 00:00:00.000','1997-02-24 00:00:00.000',2,38.82,'Rancho grande','Av. del Libertador 900','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10449','BLONP',3,'1997-02-18 00:00:00.000','1997-03-18 00:00:00.000','1997-02-27 00:00:00.000',2,53.3,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10450','VICTE',8,'1997-02-19 00:00:00.000','1997-03-19 00:00:00.000','1997-03-11 00:00:00.000',2,7.23,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10451','QUICK',4,'1997-02-19 00:00:00.000','1997-03-05 00:00:00.000','1997-03-12 00:00:00.000',3,189.09,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10452','SAVEA',8,'1997-02-20 00:00:00.000','1997-03-20 00:00:00.000','1997-02-26 00:00:00.000',1,140.26,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10453','AROUT',1,'1997-02-21 00:00:00.000','1997-03-21 00:00:00.000','1997-02-26 00:00:00.000',2,25.36,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10454','LAMAI',4,'1997-02-21 00:00:00.000','1997-03-21 00:00:00.000','1997-02-25 00:00:00.000',3,2.74,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10455','WARTH',8,'1997-02-24 00:00:00.000','1997-04-07 00:00:00.000','1997-03-03 00:00:00.000',2,180.45,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10456','KOENE',8,'1997-02-25 00:00:00.000','1997-04-08 00:00:00.000','1997-02-28 00:00:00.000',2,8.12,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10457','KOENE',2,'1997-02-25 00:00:00.000','1997-03-25 00:00:00.000','1997-03-03 00:00:00.000',1,11.57,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10458','SUPRD',7,'1997-02-26 00:00:00.000','1997-03-26 00:00:00.000','1997-03-04 00:00:00.000',3,147.06,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10459','VICTE',4,'1997-02-27 00:00:00.000','1997-03-27 00:00:00.000','1997-02-28 00:00:00.000',2,25.09,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10460','FOLKO',8,'1997-02-28 00:00:00.000','1997-03-28 00:00:00.000','1997-03-03 00:00:00.000',1,16.27,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10461','LILAS',1,'1997-02-28 00:00:00.000','1997-03-28 00:00:00.000','1997-03-05 00:00:00.000',3,148.61,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10462','CONSH',2,'1997-03-03 00:00:00.000','1997-03-31 00:00:00.000','1997-03-18 00:00:00.000',1,6.17,'Consolidated Holdings','Berkeley Gardens 12 Brewery','London',NULL,'WX1 6LT','UK');
INSERT INTO Orders  Values ('10463','SUPRD',5,'1997-03-04 00:00:00.000','1997-04-01 00:00:00.000','1997-03-06 00:00:00.000',3,14.78,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10464','FURIB',4,'1997-03-04 00:00:00.000','1997-04-01 00:00:00.000','1997-03-14 00:00:00.000',2,89,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO Orders  Values ('10465','VAFFE',1,'1997-03-05 00:00:00.000','1997-04-02 00:00:00.000','1997-03-14 00:00:00.000',3,145.04,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10466','COMMI',4,'1997-03-06 00:00:00.000','1997-04-03 00:00:00.000','1997-03-13 00:00:00.000',1,11.93,'Comrcio Mineiro','Av. dos Lusadas, 23','Sao Paulo','SP','05432-043','Brazil');
INSERT INTO Orders  Values ('10467','MAGAA',8,'1997-03-06 00:00:00.000','1997-04-03 00:00:00.000','1997-03-11 00:00:00.000',2,4.93,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10468','KOENE',3,'1997-03-07 00:00:00.000','1997-04-04 00:00:00.000','1997-03-12 00:00:00.000',3,44.12,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10469','WHITC',1,'1997-03-10 00:00:00.000','1997-04-07 00:00:00.000','1997-03-14 00:00:00.000',1,60.18,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10470','BONAP',4,'1997-03-11 00:00:00.000','1997-04-08 00:00:00.000','1997-03-14 00:00:00.000',2,64.56,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10471','BSBEV',2,'1997-03-11 00:00:00.000','1997-04-08 00:00:00.000','1997-03-18 00:00:00.000',3,45.59,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('10472','SEVES',8,'1997-03-12 00:00:00.000','1997-04-09 00:00:00.000','1997-03-19 00:00:00.000',1,4.2,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO Orders  Values ('10473','ISLAT',1,'1997-03-13 00:00:00.000','1997-03-27 00:00:00.000','1997-03-21 00:00:00.000',3,16.37,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10474','PERIC',5,'1997-03-13 00:00:00.000','1997-04-10 00:00:00.000','1997-03-21 00:00:00.000',2,83.49,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10475','SUPRD',9,'1997-03-14 00:00:00.000','1997-04-11 00:00:00.000','1997-04-04 00:00:00.000',1,68.52,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10476','HILAA',8,'1997-03-17 00:00:00.000','1997-04-14 00:00:00.000','1997-03-24 00:00:00.000',3,4.41,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10477','PRINI',5,'1997-03-17 00:00:00.000','1997-04-14 00:00:00.000','1997-03-25 00:00:00.000',2,13.02,'Princesa Isabel Vinhos','Estrada da sade n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO Orders  Values ('10478','VICTE',2,'1997-03-18 00:00:00.000','1997-04-01 00:00:00.000','1997-03-26 00:00:00.000',3,4.81,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10479','RATTC',3,'1997-03-19 00:00:00.000','1997-04-16 00:00:00.000','1997-03-21 00:00:00.000',3,708.95,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10480','FOLIG',6,'1997-03-20 00:00:00.000','1997-04-17 00:00:00.000','1997-03-24 00:00:00.000',2,1.35,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO Orders  Values ('10481','RICAR',8,'1997-03-20 00:00:00.000','1997-04-17 00:00:00.000','1997-03-25 00:00:00.000',2,64.33,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10482','LAZYK',1,'1997-03-21 00:00:00.000','1997-04-18 00:00:00.000','1997-04-10 00:00:00.000',3,7.48,'Lazy K Kountry Store','12 Orchestra Terrace','Walla Walla','WA','99362','USA');
INSERT INTO Orders  Values ('10483','WHITC',7,'1997-03-24 00:00:00.000','1997-04-21 00:00:00.000','1997-04-25 00:00:00.000',2,15.28,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10484','BSBEV',3,'1997-03-24 00:00:00.000','1997-04-21 00:00:00.000','1997-04-01 00:00:00.000',3,6.88,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('10485','LINOD',4,'1997-03-25 00:00:00.000','1997-04-08 00:00:00.000','1997-03-31 00:00:00.000',2,64.45,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10486','HILAA',1,'1997-03-26 00:00:00.000','1997-04-23 00:00:00.000','1997-04-02 00:00:00.000',2,30.53,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10487','QUEEN',2,'1997-03-26 00:00:00.000','1997-04-23 00:00:00.000','1997-03-28 00:00:00.000',2,71.07,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10488','FRANK',8,'1997-03-27 00:00:00.000','1997-04-24 00:00:00.000','1997-04-02 00:00:00.000',2,4.93,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10489','PICCO',6,'1997-03-28 00:00:00.000','1997-04-25 00:00:00.000','1997-04-09 00:00:00.000',2,5.29,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('10490','HILAA',7,'1997-03-31 00:00:00.000','1997-04-28 00:00:00.000','1997-04-03 00:00:00.000',2,210.19,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10491','FURIB',8,'1997-03-31 00:00:00.000','1997-04-28 00:00:00.000','1997-04-08 00:00:00.000',3,16.96,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO Orders  Values ('10492','BOTTM',3,'1997-04-01 00:00:00.000','1997-04-29 00:00:00.000','1997-04-11 00:00:00.000',1,62.89,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10493','LAMAI',4,'1997-04-02 00:00:00.000','1997-04-30 00:00:00.000','1997-04-10 00:00:00.000',3,10.64,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10494','COMMI',4,'1997-04-02 00:00:00.000','1997-04-30 00:00:00.000','1997-04-09 00:00:00.000',2,65.99,'Comrcio Mineiro','Av. dos Lusadas, 23','Sao Paulo','SP','05432-043','Brazil');
INSERT INTO Orders  Values ('10495','LAUGB',3,'1997-04-03 00:00:00.000','1997-05-01 00:00:00.000','1997-04-11 00:00:00.000',3,4.65,'Laughing Bacchus Wine Cellars','2319 Elm St.','Vancouver','BC','V3F 2K1','Canada');
INSERT INTO Orders  Values ('10496','TRADH',7,'1997-04-04 00:00:00.000','1997-05-02 00:00:00.000','1997-04-07 00:00:00.000',2,46.77,'Tradiao Hipermercados','Av. Ins de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
INSERT INTO Orders  Values ('10497','LEHMS',7,'1997-04-04 00:00:00.000','1997-05-02 00:00:00.000','1997-04-07 00:00:00.000',1,36.21,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10498','HILAA',8,'1997-04-07 00:00:00.000','1997-05-05 00:00:00.000','1997-04-11 00:00:00.000',2,29.75,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10499','LILAS',4,'1997-04-08 00:00:00.000','1997-05-06 00:00:00.000','1997-04-16 00:00:00.000',2,102.02,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10500','LAMAI',6,'1997-04-09 00:00:00.000','1997-05-07 00:00:00.000','1997-04-17 00:00:00.000',1,42.68,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10501','BLAUS',9,'1997-04-09 00:00:00.000','1997-05-07 00:00:00.000','1997-04-16 00:00:00.000',3,8.85,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO Orders  Values ('10502','PERIC',2,'1997-04-10 00:00:00.000','1997-05-08 00:00:00.000','1997-04-29 00:00:00.000',1,69.32,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10503','HUNGO',6,'1997-04-11 00:00:00.000','1997-05-09 00:00:00.000','1997-04-16 00:00:00.000',2,16.74,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10504','WHITC',4,'1997-04-11 00:00:00.000','1997-05-09 00:00:00.000','1997-04-18 00:00:00.000',3,59.13,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10505','MEREP',3,'1997-04-14 00:00:00.000','1997-05-12 00:00:00.000','1997-04-21 00:00:00.000',3,7.13,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10506','KOENE',9,'1997-04-15 00:00:00.000','1997-05-13 00:00:00.000','1997-05-02 00:00:00.000',2,21.19,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10507','ANTON',7,'1997-04-15 00:00:00.000','1997-05-13 00:00:00.000','1997-04-22 00:00:00.000',1,47.45,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO Orders  Values ('10508','OTTIK',1,'1997-04-16 00:00:00.000','1997-05-14 00:00:00.000','1997-05-13 00:00:00.000',2,4.99,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('10509','BLAUS',4,'1997-04-17 00:00:00.000','1997-05-15 00:00:00.000','1997-04-29 00:00:00.000',1,0.15,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO Orders  Values ('10510','SAVEA',6,'1997-04-18 00:00:00.000','1997-05-16 00:00:00.000','1997-04-28 00:00:00.000',3,367.63,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10511','BONAP',4,'1997-04-18 00:00:00.000','1997-05-16 00:00:00.000','1997-04-21 00:00:00.000',3,350.64,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10512','FAMIA',7,'1997-04-21 00:00:00.000','1997-05-19 00:00:00.000','1997-04-24 00:00:00.000',2,3.53,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO Orders  Values ('10513','WANDK',7,'1997-04-22 00:00:00.000','1997-06-03 00:00:00.000','1997-04-28 00:00:00.000',1,105.65,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('10514','ERNSH',3,'1997-04-22 00:00:00.000','1997-05-20 00:00:00.000','1997-05-16 00:00:00.000',2,789.95,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10515','QUICK',2,'1997-04-23 00:00:00.000','1997-05-07 00:00:00.000','1997-05-23 00:00:00.000',1,204.47,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10516','HUNGO',2,'1997-04-24 00:00:00.000','1997-05-22 00:00:00.000','1997-05-01 00:00:00.000',3,62.78,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10517','NORTS',3,'1997-04-24 00:00:00.000','1997-05-22 00:00:00.000','1997-04-29 00:00:00.000',3,32.07,'North/South','South House 300 Queensbridge','London',NULL,'SW7 1RZ','UK');
INSERT INTO Orders  Values ('10518','TORTU',4,'1997-04-25 00:00:00.000','1997-05-09 00:00:00.000','1997-05-05 00:00:00.000',2,218.15,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10519','CHOPS',6,'1997-04-28 00:00:00.000','1997-05-26 00:00:00.000','1997-05-01 00:00:00.000',3,91.76,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO Orders  Values ('10520','SANTG',7,'1997-04-29 00:00:00.000','1997-05-27 00:00:00.000','1997-05-01 00:00:00.000',1,13.37,'Sant Gourmet','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway');
INSERT INTO Orders  Values ('10521','CACTU',8,'1997-04-29 00:00:00.000','1997-05-27 00:00:00.000','1997-05-02 00:00:00.000',2,17.22,'Cactus Comidas para llevar','Cerrito 333','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10522','LEHMS',4,'1997-04-30 00:00:00.000','1997-05-28 00:00:00.000','1997-05-06 00:00:00.000',1,45.33,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10523','SEVES',7,'1997-05-01 00:00:00.000','1997-05-29 00:00:00.000','1997-05-30 00:00:00.000',2,77.63,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO Orders  Values ('10524','BERGS',1,'1997-05-01 00:00:00.000','1997-05-29 00:00:00.000','1997-05-07 00:00:00.000',2,244.79,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10525','BONAP',1,'1997-05-02 00:00:00.000','1997-05-30 00:00:00.000','1997-05-23 00:00:00.000',2,11.06,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10526','WARTH',4,'1997-05-05 00:00:00.000','1997-06-02 00:00:00.000','1997-05-15 00:00:00.000',2,58.59,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10527','QUICK',7,'1997-05-05 00:00:00.000','1997-06-02 00:00:00.000','1997-05-07 00:00:00.000',1,41.9,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10528','GREAL',6,'1997-05-06 00:00:00.000','1997-05-20 00:00:00.000','1997-05-09 00:00:00.000',2,3.35,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('10529','MAISD',5,'1997-05-07 00:00:00.000','1997-06-04 00:00:00.000','1997-05-09 00:00:00.000',2,66.69,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO Orders  Values ('10530','PICCO',3,'1997-05-08 00:00:00.000','1997-06-05 00:00:00.000','1997-05-12 00:00:00.000',2,339.22,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('10531','OCEAN',7,'1997-05-08 00:00:00.000','1997-06-05 00:00:00.000','1997-05-19 00:00:00.000',1,8.12,'Ocano Atlntico Ltda.','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10532','EASTC',7,'1997-05-09 00:00:00.000','1997-06-06 00:00:00.000','1997-05-12 00:00:00.000',3,74.46,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO Orders  Values ('10533','FOLKO',8,'1997-05-12 00:00:00.000','1997-06-09 00:00:00.000','1997-05-22 00:00:00.000',1,188.04,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10534','LEHMS',8,'1997-05-12 00:00:00.000','1997-06-09 00:00:00.000','1997-05-14 00:00:00.000',2,27.94,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10535','ANTON',4,'1997-05-13 00:00:00.000','1997-06-10 00:00:00.000','1997-05-21 00:00:00.000',1,15.64,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO Orders  Values ('10536','LEHMS',3,'1997-05-14 00:00:00.000','1997-06-11 00:00:00.000','1997-06-06 00:00:00.000',2,58.88,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10537','RICSU',1,'1997-05-14 00:00:00.000','1997-05-28 00:00:00.000','1997-05-19 00:00:00.000',1,78.85,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('10538','BSBEV',9,'1997-05-15 00:00:00.000','1997-06-12 00:00:00.000','1997-05-16 00:00:00.000',3,4.87,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('10539','BSBEV',6,'1997-05-16 00:00:00.000','1997-06-13 00:00:00.000','1997-05-23 00:00:00.000',3,12.36,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('10540','QUICK',3,'1997-05-19 00:00:00.000','1997-06-16 00:00:00.000','1997-06-13 00:00:00.000',3,1007.64,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10541','HANAR',2,'1997-05-19 00:00:00.000','1997-06-16 00:00:00.000','1997-05-29 00:00:00.000',1,68.65,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10542','KOENE',1,'1997-05-20 00:00:00.000','1997-06-17 00:00:00.000','1997-05-26 00:00:00.000',3,10.95,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10543','LILAS',8,'1997-05-21 00:00:00.000','1997-06-18 00:00:00.000','1997-05-23 00:00:00.000',2,48.17,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10544','LONEP',4,'1997-05-21 00:00:00.000','1997-06-18 00:00:00.000','1997-05-30 00:00:00.000',1,24.91,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Orders  Values ('10545','LAZYK',8,'1997-05-22 00:00:00.000','1997-06-19 00:00:00.000','1997-06-26 00:00:00.000',2,11.92,'Lazy K Kountry Store','12 Orchestra Terrace','Walla Walla','WA','99362','USA');
INSERT INTO Orders  Values ('10546','VICTE',1,'1997-05-23 00:00:00.000','1997-06-20 00:00:00.000','1997-05-27 00:00:00.000',3,194.72,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10547','SEVES',3,'1997-05-23 00:00:00.000','1997-06-20 00:00:00.000','1997-06-02 00:00:00.000',2,178.43,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO Orders  Values ('10548','TOMSP',3,'1997-05-26 00:00:00.000','1997-06-23 00:00:00.000','1997-06-02 00:00:00.000',2,1.43,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO Orders  Values ('10549','QUICK',5,'1997-05-27 00:00:00.000','1997-06-10 00:00:00.000','1997-05-30 00:00:00.000',1,171.24,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10550','GODOS',7,'1997-05-28 00:00:00.000','1997-06-25 00:00:00.000','1997-06-06 00:00:00.000',3,4.32,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('10551','FURIB',4,'1997-05-28 00:00:00.000','1997-07-09 00:00:00.000','1997-06-06 00:00:00.000',3,72.95,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO Orders  Values ('10552','HILAA',2,'1997-05-29 00:00:00.000','1997-06-26 00:00:00.000','1997-06-05 00:00:00.000',1,83.22,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10553','WARTH',2,'1997-05-30 00:00:00.000','1997-06-27 00:00:00.000','1997-06-03 00:00:00.000',2,149.49,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10554','OTTIK',4,'1997-05-30 00:00:00.000','1997-06-27 00:00:00.000','1997-06-05 00:00:00.000',3,120.97,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('10555','SAVEA',6,'1997-06-02 00:00:00.000','1997-06-30 00:00:00.000','1997-06-04 00:00:00.000',3,252.49,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10556','SIMOB',2,'1997-06-03 00:00:00.000','1997-07-15 00:00:00.000','1997-06-13 00:00:00.000',1,9.8,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO Orders  Values ('10557','LEHMS',9,'1997-06-03 00:00:00.000','1997-06-17 00:00:00.000','1997-06-06 00:00:00.000',2,96.72,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10558','AROUT',1,'1997-06-04 00:00:00.000','1997-07-02 00:00:00.000','1997-06-10 00:00:00.000',2,72.97,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10559','BLONP',6,'1997-06-05 00:00:00.000','1997-07-03 00:00:00.000','1997-06-13 00:00:00.000',1,8.05,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10560','FRANK',8,'1997-06-06 00:00:00.000','1997-07-04 00:00:00.000','1997-06-09 00:00:00.000',1,36.65,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10561','FOLKO',2,'1997-06-06 00:00:00.000','1997-07-04 00:00:00.000','1997-06-09 00:00:00.000',2,242.21,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10562','REGGC',1,'1997-06-09 00:00:00.000','1997-07-07 00:00:00.000','1997-06-12 00:00:00.000',1,22.95,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10563','RICAR',2,'1997-06-10 00:00:00.000','1997-07-22 00:00:00.000','1997-06-24 00:00:00.000',2,60.43,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10564','RATTC',4,'1997-06-10 00:00:00.000','1997-07-08 00:00:00.000','1997-06-16 00:00:00.000',3,13.75,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10565','MEREP',8,'1997-06-11 00:00:00.000','1997-07-09 00:00:00.000','1997-06-18 00:00:00.000',2,7.15,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10566','BLONP',9,'1997-06-12 00:00:00.000','1997-07-10 00:00:00.000','1997-06-18 00:00:00.000',1,88.4,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10567','HUNGO',1,'1997-06-12 00:00:00.000','1997-07-10 00:00:00.000','1997-06-17 00:00:00.000',1,33.97,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10568','GALED',3,'1997-06-13 00:00:00.000','1997-07-11 00:00:00.000','1997-07-09 00:00:00.000',3,6.54,'Galera del gastronmo','Rambla de Catalua, 23','Barcelona',NULL,'8022','Spain');
INSERT INTO Orders  Values ('10569','RATTC',5,'1997-06-16 00:00:00.000','1997-07-14 00:00:00.000','1997-07-11 00:00:00.000',1,58.98,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10570','MEREP',3,'1997-06-17 00:00:00.000','1997-07-15 00:00:00.000','1997-06-19 00:00:00.000',3,188.99,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10571','ERNSH',8,'1997-06-17 00:00:00.000','1997-07-29 00:00:00.000','1997-07-04 00:00:00.000',3,26.06,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10572','BERGS',3,'1997-06-18 00:00:00.000','1997-07-16 00:00:00.000','1997-06-25 00:00:00.000',2,116.43,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10573','ANTON',7,'1997-06-19 00:00:00.000','1997-07-17 00:00:00.000','1997-06-20 00:00:00.000',3,84.84,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO Orders  Values ('10574','TRAIH',4,'1997-06-19 00:00:00.000','1997-07-17 00:00:00.000','1997-06-30 00:00:00.000',2,37.6,'Trail-s Head Gourmet Provisioners','722 DaVinci Blvd.','Kirkland','WA','98034','USA');
INSERT INTO Orders  Values ('10575','MORGK',5,'1997-06-20 00:00:00.000','1997-07-04 00:00:00.000','1997-06-30 00:00:00.000',1,127.34,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'4179','Germany');
INSERT INTO Orders  Values ('10576','TORTU',3,'1997-06-23 00:00:00.000','1997-07-07 00:00:00.000','1997-06-30 00:00:00.000',3,18.56,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10577','TRAIH',9,'1997-06-23 00:00:00.000','1997-08-04 00:00:00.000','1997-06-30 00:00:00.000',2,25.41,'Trail-s Head Gourmet Provisioners','722 DaVinci Blvd.','Kirkland','WA','98034','USA');
INSERT INTO Orders  Values ('10578','BSBEV',4,'1997-06-24 00:00:00.000','1997-07-22 00:00:00.000','1997-07-25 00:00:00.000',3,29.6,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('10579','LETSS',1,'1997-06-25 00:00:00.000','1997-07-23 00:00:00.000','1997-07-04 00:00:00.000',2,13.73,'Let-s Stop N Shop','87 Polk St. Suite 5','San Francisco','CA','94117','USA');
INSERT INTO Orders  Values ('10580','OTTIK',4,'1997-06-26 00:00:00.000','1997-07-24 00:00:00.000','1997-07-01 00:00:00.000',3,75.89,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('10581','FAMIA',3,'1997-06-26 00:00:00.000','1997-07-24 00:00:00.000','1997-07-02 00:00:00.000',1,3.01,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO Orders  Values ('10582','BLAUS',3,'1997-06-27 00:00:00.000','1997-07-25 00:00:00.000','1997-07-14 00:00:00.000',2,27.71,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO Orders  Values ('10583','WARTH',2,'1997-06-30 00:00:00.000','1997-07-28 00:00:00.000','1997-07-04 00:00:00.000',2,7.28,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10584','BLONP',4,'1997-06-30 00:00:00.000','1997-07-28 00:00:00.000','1997-07-04 00:00:00.000',1,59.14,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10585','WELLI',7,'1997-07-01 00:00:00.000','1997-07-29 00:00:00.000','1997-07-10 00:00:00.000',1,13.41,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Orders  Values ('10586','REGGC',9,'1997-07-02 00:00:00.000','1997-07-30 00:00:00.000','1997-07-09 00:00:00.000',1,0.48,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10587','QUEDE',1,'1997-07-02 00:00:00.000','1997-07-30 00:00:00.000','1997-07-09 00:00:00.000',1,62.52,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Orders  Values ('10588','QUICK',2,'1997-07-03 00:00:00.000','1997-07-31 00:00:00.000','1997-07-10 00:00:00.000',3,194.67,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10589','GREAL',8,'1997-07-04 00:00:00.000','1997-08-01 00:00:00.000','1997-07-14 00:00:00.000',2,4.42,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('10590','MEREP',4,'1997-07-07 00:00:00.000','1997-08-04 00:00:00.000','1997-07-14 00:00:00.000',3,44.77,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10591','VAFFE',1,'1997-07-07 00:00:00.000','1997-07-21 00:00:00.000','1997-07-16 00:00:00.000',1,55.92,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10592','LEHMS',3,'1997-07-08 00:00:00.000','1997-08-05 00:00:00.000','1997-07-16 00:00:00.000',1,32.1,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10593','LEHMS',7,'1997-07-09 00:00:00.000','1997-08-06 00:00:00.000','1997-08-13 00:00:00.000',2,174.2,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10594','OLDWO',3,'1997-07-09 00:00:00.000','1997-08-06 00:00:00.000','1997-07-16 00:00:00.000',2,5.24,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('10595','ERNSH',2,'1997-07-10 00:00:00.000','1997-08-07 00:00:00.000','1997-07-14 00:00:00.000',1,96.78,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10596','WHITC',8,'1997-07-11 00:00:00.000','1997-08-08 00:00:00.000','1997-08-12 00:00:00.000',1,16.34,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10597','PICCO',7,'1997-07-11 00:00:00.000','1997-08-08 00:00:00.000','1997-07-18 00:00:00.000',3,35.12,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('10598','RATTC',1,'1997-07-14 00:00:00.000','1997-08-11 00:00:00.000','1997-07-18 00:00:00.000',3,44.42,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10599','BSBEV',6,'1997-07-15 00:00:00.000','1997-08-26 00:00:00.000','1997-07-21 00:00:00.000',3,29.98,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('10600','HUNGC',4,'1997-07-16 00:00:00.000','1997-08-13 00:00:00.000','1997-07-21 00:00:00.000',1,45.13,'Hungry Coyote Import Store','City Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO Orders  Values ('10601','HILAA',7,'1997-07-16 00:00:00.000','1997-08-27 00:00:00.000','1997-07-22 00:00:00.000',1,58.3,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10602','VAFFE',8,'1997-07-17 00:00:00.000','1997-08-14 00:00:00.000','1997-07-22 00:00:00.000',2,2.92,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10603','SAVEA',8,'1997-07-18 00:00:00.000','1997-08-15 00:00:00.000','1997-08-08 00:00:00.000',2,48.77,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10604','FURIB',1,'1997-07-18 00:00:00.000','1997-08-15 00:00:00.000','1997-07-29 00:00:00.000',1,7.46,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO Orders  Values ('10605','MEREP',1,'1997-07-21 00:00:00.000','1997-08-18 00:00:00.000','1997-07-29 00:00:00.000',2,379.13,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10606','TRADH',4,'1997-07-22 00:00:00.000','1997-08-19 00:00:00.000','1997-07-31 00:00:00.000',3,79.4,'Tradiao Hipermercados','Av. Ins de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
INSERT INTO Orders  Values ('10607','SAVEA',5,'1997-07-22 00:00:00.000','1997-08-19 00:00:00.000','1997-07-25 00:00:00.000',1,200.24,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10608','TOMSP',4,'1997-07-23 00:00:00.000','1997-08-20 00:00:00.000','1997-08-01 00:00:00.000',2,27.79,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO Orders  Values ('10609','DUMON',7,'1997-07-24 00:00:00.000','1997-08-21 00:00:00.000','1997-07-30 00:00:00.000',2,1.85,'Du monde entier','67, rue des Cinquante Otages','Nantes',NULL,'44000','France');
INSERT INTO Orders  Values ('10610','LAMAI',8,'1997-07-25 00:00:00.000','1997-08-22 00:00:00.000','1997-08-06 00:00:00.000',1,26.78,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10611','WOLZA',6,'1997-07-25 00:00:00.000','1997-08-22 00:00:00.000','1997-08-01 00:00:00.000',2,80.65,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO Orders  Values ('10612','SAVEA',1,'1997-07-28 00:00:00.000','1997-08-25 00:00:00.000','1997-08-01 00:00:00.000',2,544.08,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10613','HILAA',4,'1997-07-29 00:00:00.000','1997-08-26 00:00:00.000','1997-08-01 00:00:00.000',2,8.11,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10614','BLAUS',8,'1997-07-29 00:00:00.000','1997-08-26 00:00:00.000','1997-08-01 00:00:00.000',3,1.93,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO Orders  Values ('10615','WILMK',2,'1997-07-30 00:00:00.000','1997-08-27 00:00:00.000','1997-08-06 00:00:00.000',3,0.75,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO Orders  Values ('10616','GREAL',1,'1997-07-31 00:00:00.000','1997-08-28 00:00:00.000','1997-08-05 00:00:00.000',2,116.53,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('10617','GREAL',4,'1997-07-31 00:00:00.000','1997-08-28 00:00:00.000','1997-08-04 00:00:00.000',2,18.53,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('10618','MEREP',1,'1997-08-01 00:00:00.000','1997-09-12 00:00:00.000','1997-08-08 00:00:00.000',1,154.68,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10619','MEREP',3,'1997-08-04 00:00:00.000','1997-09-01 00:00:00.000','1997-08-07 00:00:00.000',3,91.05,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10620','LAUGB',2,'1997-08-05 00:00:00.000','1997-09-02 00:00:00.000','1997-08-14 00:00:00.000',3,0.94,'Laughing Bacchus Wine Cellars','2319 Elm St.','Vancouver','BC','V3F 2K1','Canada');
INSERT INTO Orders  Values ('10621','ISLAT',4,'1997-08-05 00:00:00.000','1997-09-02 00:00:00.000','1997-08-11 00:00:00.000',2,23.73,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10622','RICAR',4,'1997-08-06 00:00:00.000','1997-09-03 00:00:00.000','1997-08-11 00:00:00.000',3,50.97,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10623','FRANK',8,'1997-08-07 00:00:00.000','1997-09-04 00:00:00.000','1997-08-12 00:00:00.000',2,97.18,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10624','THECR',4,'1997-08-07 00:00:00.000','1997-09-04 00:00:00.000','1997-08-19 00:00:00.000',2,94.8,'The Cracker Box','55 Grizzly Peak Rd.','Butte','MT','59801','USA');
INSERT INTO Orders  Values ('10625','ANATR',3,'1997-08-08 00:00:00.000','1997-09-05 00:00:00.000','1997-08-14 00:00:00.000',1,43.9,'Ana Trujillo Emparedados y helados','Avda. de la Constitucin 2222','Mxico D.F.',NULL,'5021','Mexico');
INSERT INTO Orders  Values ('10626','BERGS',1,'1997-08-11 00:00:00.000','1997-09-08 00:00:00.000','1997-08-20 00:00:00.000',2,138.69,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10627','SAVEA',8,'1997-08-11 00:00:00.000','1997-09-22 00:00:00.000','1997-08-21 00:00:00.000',3,107.46,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10628','BLONP',4,'1997-08-12 00:00:00.000','1997-09-09 00:00:00.000','1997-08-20 00:00:00.000',3,30.36,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10629','GODOS',4,'1997-08-12 00:00:00.000','1997-09-09 00:00:00.000','1997-08-20 00:00:00.000',3,85.46,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('10630','KOENE',1,'1997-08-13 00:00:00.000','1997-09-10 00:00:00.000','1997-08-19 00:00:00.000',2,32.35,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10631','LAMAI',8,'1997-08-14 00:00:00.000','1997-09-11 00:00:00.000','1997-08-15 00:00:00.000',1,0.87,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10632','WANDK',8,'1997-08-14 00:00:00.000','1997-09-11 00:00:00.000','1997-08-19 00:00:00.000',1,41.38,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('10633','ERNSH',7,'1997-08-15 00:00:00.000','1997-09-12 00:00:00.000','1997-08-18 00:00:00.000',3,477.9,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10634','FOLIG',4,'1997-08-15 00:00:00.000','1997-09-12 00:00:00.000','1997-08-21 00:00:00.000',3,487.38,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO Orders  Values ('10635','MAGAA',8,'1997-08-18 00:00:00.000','1997-09-15 00:00:00.000','1997-08-21 00:00:00.000',3,47.46,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10636','WARTH',4,'1997-08-19 00:00:00.000','1997-09-16 00:00:00.000','1997-08-26 00:00:00.000',1,1.15,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10637','QUEEN',6,'1997-08-19 00:00:00.000','1997-09-16 00:00:00.000','1997-08-26 00:00:00.000',1,201.29,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10638','LINOD',3,'1997-08-20 00:00:00.000','1997-09-17 00:00:00.000','1997-09-01 00:00:00.000',1,158.44,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10639','SANTG',7,'1997-08-20 00:00:00.000','1997-09-17 00:00:00.000','1997-08-27 00:00:00.000',3,38.64,'Sant Gourmet','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway');
INSERT INTO Orders  Values ('10640','WANDK',4,'1997-08-21 00:00:00.000','1997-09-18 00:00:00.000','1997-08-28 00:00:00.000',1,23.55,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('10641','HILAA',4,'1997-08-22 00:00:00.000','1997-09-19 00:00:00.000','1997-08-26 00:00:00.000',2,179.61,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10642','SIMOB',7,'1997-08-22 00:00:00.000','1997-09-19 00:00:00.000','1997-09-05 00:00:00.000',3,41.89,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO Orders  Values ('10643','ALFKI',6,'1997-08-25 00:00:00.000','1997-09-22 00:00:00.000','1997-09-02 00:00:00.000',1,29.46,'Alfreds Futterkiste','Obere Str. 57','Berlin',NULL,'12209','Germany');
INSERT INTO Orders  Values ('10644','WELLI',3,'1997-08-25 00:00:00.000','1997-09-22 00:00:00.000','1997-09-01 00:00:00.000',2,0.14,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Orders  Values ('10645','HANAR',4,'1997-08-26 00:00:00.000','1997-09-23 00:00:00.000','1997-09-02 00:00:00.000',1,12.41,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10646','HUNGO',9,'1997-08-27 00:00:00.000','1997-10-08 00:00:00.000','1997-09-03 00:00:00.000',3,142.33,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10647','QUEDE',4,'1997-08-27 00:00:00.000','1997-09-10 00:00:00.000','1997-09-03 00:00:00.000',2,45.54,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Orders  Values ('10648','RICAR',5,'1997-08-28 00:00:00.000','1997-10-09 00:00:00.000','1997-09-09 00:00:00.000',2,14.25,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10649','MAISD',5,'1997-08-28 00:00:00.000','1997-09-25 00:00:00.000','1997-08-29 00:00:00.000',3,6.2,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO Orders  Values ('10650','FAMIA',5,'1997-08-29 00:00:00.000','1997-09-26 00:00:00.000','1997-09-03 00:00:00.000',3,176.81,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO Orders  Values ('10651','WANDK',8,'1997-09-01 00:00:00.000','1997-09-29 00:00:00.000','1997-09-11 00:00:00.000',2,20.6,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('10652','GOURL',4,'1997-09-01 00:00:00.000','1997-09-29 00:00:00.000','1997-09-08 00:00:00.000',2,7.14,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO Orders  Values ('10653','FRANK',1,'1997-09-02 00:00:00.000','1997-09-30 00:00:00.000','1997-09-19 00:00:00.000',1,93.25,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10654','BERGS',5,'1997-09-02 00:00:00.000','1997-09-30 00:00:00.000','1997-09-11 00:00:00.000',1,55.26,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10655','REGGC',1,'1997-09-03 00:00:00.000','1997-10-01 00:00:00.000','1997-09-11 00:00:00.000',2,4.41,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10656','GREAL',6,'1997-09-04 00:00:00.000','1997-10-02 00:00:00.000','1997-09-10 00:00:00.000',1,57.15,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('10657','SAVEA',2,'1997-09-04 00:00:00.000','1997-10-02 00:00:00.000','1997-09-15 00:00:00.000',2,352.69,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10658','QUICK',4,'1997-09-05 00:00:00.000','1997-10-03 00:00:00.000','1997-09-08 00:00:00.000',1,364.15,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10659','QUEEN',7,'1997-09-05 00:00:00.000','1997-10-03 00:00:00.000','1997-09-10 00:00:00.000',2,105.81,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10660','HUNGC',8,'1997-09-08 00:00:00.000','1997-10-06 00:00:00.000','1997-10-15 00:00:00.000',1,111.29,'Hungry Coyote Import Store','City Center Plaza 516 Main St.','Elgin','OR','97827','USA');
INSERT INTO Orders  Values ('10661','HUNGO',7,'1997-09-09 00:00:00.000','1997-10-07 00:00:00.000','1997-09-15 00:00:00.000',3,17.55,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10662','LONEP',3,'1997-09-09 00:00:00.000','1997-10-07 00:00:00.000','1997-09-18 00:00:00.000',2,1.28,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Orders  Values ('10663','BONAP',2,'1997-09-10 00:00:00.000','1997-09-24 00:00:00.000','1997-10-03 00:00:00.000',2,113.15,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10664','FURIB',1,'1997-09-10 00:00:00.000','1997-10-08 00:00:00.000','1997-09-19 00:00:00.000',3,1.27,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO Orders  Values ('10665','LONEP',1,'1997-09-11 00:00:00.000','1997-10-09 00:00:00.000','1997-09-17 00:00:00.000',2,26.31,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Orders  Values ('10666','RICSU',7,'1997-09-12 00:00:00.000','1997-10-10 00:00:00.000','1997-09-22 00:00:00.000',2,232.42,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('10667','ERNSH',7,'1997-09-12 00:00:00.000','1997-10-10 00:00:00.000','1997-09-19 00:00:00.000',1,78.09,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10668','WANDK',1,'1997-09-15 00:00:00.000','1997-10-13 00:00:00.000','1997-09-23 00:00:00.000',2,47.22,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('10669','SIMOB',2,'1997-09-15 00:00:00.000','1997-10-13 00:00:00.000','1997-09-22 00:00:00.000',1,24.39,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO Orders  Values ('10670','FRANK',4,'1997-09-16 00:00:00.000','1997-10-14 00:00:00.000','1997-09-18 00:00:00.000',1,203.48,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10671','FRANR',1,'1997-09-17 00:00:00.000','1997-10-15 00:00:00.000','1997-09-24 00:00:00.000',1,30.34,'France restauration','54, rue Royale','Nantes',NULL,'44000','France');
INSERT INTO Orders  Values ('10672','BERGS',9,'1997-09-17 00:00:00.000','1997-10-01 00:00:00.000','1997-09-26 00:00:00.000',2,95.75,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10673','WILMK',2,'1997-09-18 00:00:00.000','1997-10-16 00:00:00.000','1997-09-19 00:00:00.000',1,22.76,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO Orders  Values ('10674','ISLAT',4,'1997-09-18 00:00:00.000','1997-10-16 00:00:00.000','1997-09-30 00:00:00.000',2,0.9,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10675','FRANK',5,'1997-09-19 00:00:00.000','1997-10-17 00:00:00.000','1997-09-23 00:00:00.000',2,31.85,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10676','TORTU',2,'1997-09-22 00:00:00.000','1997-10-20 00:00:00.000','1997-09-29 00:00:00.000',2,2.01,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10677','ANTON',1,'1997-09-22 00:00:00.000','1997-10-20 00:00:00.000','1997-09-26 00:00:00.000',3,4.03,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO Orders  Values ('10678','SAVEA',7,'1997-09-23 00:00:00.000','1997-10-21 00:00:00.000','1997-10-16 00:00:00.000',3,388.98,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10679','BLONP',8,'1997-09-23 00:00:00.000','1997-10-21 00:00:00.000','1997-09-30 00:00:00.000',3,27.94,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10680','OLDWO',1,'1997-09-24 00:00:00.000','1997-10-22 00:00:00.000','1997-09-26 00:00:00.000',1,26.61,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('10681','GREAL',3,'1997-09-25 00:00:00.000','1997-10-23 00:00:00.000','1997-09-30 00:00:00.000',3,76.13,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('10682','ANTON',3,'1997-09-25 00:00:00.000','1997-10-23 00:00:00.000','1997-10-01 00:00:00.000',2,36.13,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO Orders  Values ('10683','DUMON',2,'1997-09-26 00:00:00.000','1997-10-24 00:00:00.000','1997-10-01 00:00:00.000',1,4.4,'Du monde entier','67, rue des Cinquante Otages','Nantes',NULL,'44000','France');
INSERT INTO Orders  Values ('10684','OTTIK',3,'1997-09-26 00:00:00.000','1997-10-24 00:00:00.000','1997-09-30 00:00:00.000',1,145.63,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('10685','GOURL',4,'1997-09-29 00:00:00.000','1997-10-13 00:00:00.000','1997-10-03 00:00:00.000',2,33.75,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO Orders  Values ('10686','PICCO',2,'1997-09-30 00:00:00.000','1997-10-28 00:00:00.000','1997-10-08 00:00:00.000',1,96.5,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('10687','HUNGO',9,'1997-09-30 00:00:00.000','1997-10-28 00:00:00.000','1997-10-30 00:00:00.000',2,296.43,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10688','VAFFE',4,'1997-10-01 00:00:00.000','1997-10-15 00:00:00.000','1997-10-07 00:00:00.000',2,299.09,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10689','BERGS',1,'1997-10-01 00:00:00.000','1997-10-29 00:00:00.000','1997-10-07 00:00:00.000',2,13.42,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10690','HANAR',1,'1997-10-02 00:00:00.000','1997-10-30 00:00:00.000','1997-10-03 00:00:00.000',1,15.8,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10691','QUICK',2,'1997-10-03 00:00:00.000','1997-11-14 00:00:00.000','1997-10-22 00:00:00.000',2,810.05,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10692','ALFKI',4,'1997-10-03 00:00:00.000','1997-10-31 00:00:00.000','1997-10-13 00:00:00.000',2,61.02,'Alfred-s Futterkiste','Obere Str. 57','Berlin',NULL,'12209','Germany');
INSERT INTO Orders  Values ('10693','WHITC',3,'1997-10-06 00:00:00.000','1997-10-20 00:00:00.000','1997-10-10 00:00:00.000',3,139.34,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10694','QUICK',8,'1997-10-06 00:00:00.000','1997-11-03 00:00:00.000','1997-10-09 00:00:00.000',3,398.36,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10695','WILMK',7,'1997-10-07 00:00:00.000','1997-11-18 00:00:00.000','1997-10-14 00:00:00.000',1,16.72,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO Orders  Values ('10696','WHITC',8,'1997-10-08 00:00:00.000','1997-11-19 00:00:00.000','1997-10-14 00:00:00.000',3,102.55,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10697','LINOD',3,'1997-10-08 00:00:00.000','1997-11-05 00:00:00.000','1997-10-14 00:00:00.000',1,45.52,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10698','ERNSH',4,'1997-10-09 00:00:00.000','1997-11-06 00:00:00.000','1997-10-17 00:00:00.000',1,272.47,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10699','MORGK',3,'1997-10-09 00:00:00.000','1997-11-06 00:00:00.000','1997-10-13 00:00:00.000',3,0.58,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'4179','Germany');
INSERT INTO Orders  Values ('10700','SAVEA',3,'1997-10-10 00:00:00.000','1997-11-07 00:00:00.000','1997-10-16 00:00:00.000',1,65.1,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10701','HUNGO',6,'1997-10-13 00:00:00.000','1997-10-27 00:00:00.000','1997-10-15 00:00:00.000',3,220.31,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10702','ALFKI',4,'1997-10-13 00:00:00.000','1997-11-24 00:00:00.000','1997-10-21 00:00:00.000',1,23.94,'Alfred-s Futterkiste','Obere Str. 57','Berlin',NULL,'12209','Germany');
INSERT INTO Orders  Values ('10703','FOLKO',6,'1997-10-14 00:00:00.000','1997-11-11 00:00:00.000','1997-10-20 00:00:00.000',2,152.3,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10704','QUEEN',6,'1997-10-14 00:00:00.000','1997-11-11 00:00:00.000','1997-11-07 00:00:00.000',1,4.78,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10705','HILAA',9,'1997-10-15 00:00:00.000','1997-11-12 00:00:00.000','1997-11-18 00:00:00.000',2,3.52,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10706','OLDWO',8,'1997-10-16 00:00:00.000','1997-11-13 00:00:00.000','1997-10-21 00:00:00.000',3,135.63,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('10707','AROUT',4,'1997-10-16 00:00:00.000','1997-10-30 00:00:00.000','1997-10-23 00:00:00.000',3,21.74,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10708','THEBI',6,'1997-10-17 00:00:00.000','1997-11-28 00:00:00.000','1997-11-05 00:00:00.000',2,2.96,'The Big Cheese','89 Jefferson Way Suite 2','Portland','OR','97201','USA');
INSERT INTO Orders  Values ('10709','GOURL',1,'1997-10-17 00:00:00.000','1997-11-14 00:00:00.000','1997-11-20 00:00:00.000',3,210.8,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO Orders  Values ('10710','FRANS',1,'1997-10-20 00:00:00.000','1997-11-17 00:00:00.000','1997-10-23 00:00:00.000',1,4.98,'Franchi S.p.A.','Via Monte Bianco 34','Torino',NULL,'10100','Italy');
INSERT INTO Orders  Values ('10711','SAVEA',5,'1997-10-21 00:00:00.000','1997-12-02 00:00:00.000','1997-10-29 00:00:00.000',2,52.41,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10712','HUNGO',3,'1997-10-21 00:00:00.000','1997-11-18 00:00:00.000','1997-10-31 00:00:00.000',1,89.93,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10713','SAVEA',1,'1997-10-22 00:00:00.000','1997-11-19 00:00:00.000','1997-10-24 00:00:00.000',1,167.05,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10714','SAVEA',5,'1997-10-22 00:00:00.000','1997-11-19 00:00:00.000','1997-10-27 00:00:00.000',3,24.49,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10715','BONAP',3,'1997-10-23 00:00:00.000','1997-11-06 00:00:00.000','1997-10-29 00:00:00.000',1,63.2,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10716','RANCH',4,'1997-10-24 00:00:00.000','1997-11-21 00:00:00.000','1997-10-27 00:00:00.000',2,22.57,'Rancho grande','Av. del Libertador 900','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10717','FRANK',1,'1997-10-24 00:00:00.000','1997-11-21 00:00:00.000','1997-10-29 00:00:00.000',2,59.25,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10718','KOENE',1,'1997-10-27 00:00:00.000','1997-11-24 00:00:00.000','1997-10-29 00:00:00.000',3,170.88,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10719','LETSS',8,'1997-10-27 00:00:00.000','1997-11-24 00:00:00.000','1997-11-05 00:00:00.000',2,51.44,'Let-s Stop N Shop','87 Polk St. Suite 5','San Francisco','CA','94117','USA');
INSERT INTO Orders  Values ('10720','QUEDE',8,'1997-10-28 00:00:00.000','1997-11-11 00:00:00.000','1997-11-05 00:00:00.000',2,9.53,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Orders  Values ('10721','QUICK',5,'1997-10-29 00:00:00.000','1997-11-26 00:00:00.000','1997-10-31 00:00:00.000',3,48.92,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10722','SAVEA',8,'1997-10-29 00:00:00.000','1997-12-10 00:00:00.000','1997-11-04 00:00:00.000',1,74.58,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10723','WHITC',3,'1997-10-30 00:00:00.000','1997-11-27 00:00:00.000','1997-11-25 00:00:00.000',1,21.72,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10724','MEREP',8,'1997-10-30 00:00:00.000','1997-12-11 00:00:00.000','1997-11-05 00:00:00.000',2,57.75,'Mre Paillarde','43 rue St. Laurent','Montral','Qubec','H1J 1C3','Canada');
INSERT INTO Orders  Values ('10725','FAMIA',4,'1997-10-31 00:00:00.000','1997-11-28 00:00:00.000','1997-11-05 00:00:00.000',3,10.83,'Familia Arquibaldo','Rua Ors, 92','Sao Paulo','SP','05442-030','Brazil');
INSERT INTO Orders  Values ('10726','EASTC',4,'1997-11-03 00:00:00.000','1997-11-17 00:00:00.000','1997-12-05 00:00:00.000',1,16.56,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO Orders  Values ('10727','REGGC',2,'1997-11-03 00:00:00.000','1997-12-01 00:00:00.000','1997-12-05 00:00:00.000',1,89.9,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10728','QUEEN',4,'1997-11-04 00:00:00.000','1997-12-02 00:00:00.000','1997-11-11 00:00:00.000',2,58.33,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10729','LINOD',8,'1997-11-04 00:00:00.000','1997-12-16 00:00:00.000','1997-11-14 00:00:00.000',3,141.06,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10730','BONAP',5,'1997-11-05 00:00:00.000','1997-12-03 00:00:00.000','1997-11-14 00:00:00.000',1,20.12,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10731','CHOPS',7,'1997-11-06 00:00:00.000','1997-12-04 00:00:00.000','1997-11-14 00:00:00.000',1,96.65,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO Orders  Values ('10732','BONAP',3,'1997-11-06 00:00:00.000','1997-12-04 00:00:00.000','1997-11-07 00:00:00.000',1,16.97,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10733','BERGS',1,'1997-11-07 00:00:00.000','1997-12-05 00:00:00.000','1997-11-10 00:00:00.000',3,110.11,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10734','GOURL',2,'1997-11-07 00:00:00.000','1997-12-05 00:00:00.000','1997-11-12 00:00:00.000',3,1.63,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO Orders  Values ('10735','LETSS',6,'1997-11-10 00:00:00.000','1997-12-08 00:00:00.000','1997-11-21 00:00:00.000',2,45.97,'Let-s Stop N Shop','87 Polk St. Suite 5','San Francisco','CA','94117','USA');
INSERT INTO Orders  Values ('10736','HUNGO',9,'1997-11-11 00:00:00.000','1997-12-09 00:00:00.000','1997-11-21 00:00:00.000',2,44.1,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10737','VINET',2,'1997-11-11 00:00:00.000','1997-12-09 00:00:00.000','1997-11-18 00:00:00.000',2,7.79,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO Orders  Values ('10738','SPECD',2,'1997-11-12 00:00:00.000','1997-12-10 00:00:00.000','1997-11-18 00:00:00.000',1,2.91,'Spcialits du monde','25, rue Lauriston','Paris',NULL,'75016','France');
INSERT INTO Orders  Values ('10739','VINET',3,'1997-11-12 00:00:00.000','1997-12-10 00:00:00.000','1997-11-17 00:00:00.000',3,11.08,'Vins et alcools Chevalier','59 rue de l-Abbaye','Reims',NULL,'51100','France');
INSERT INTO Orders  Values ('10740','WHITC',4,'1997-11-13 00:00:00.000','1997-12-11 00:00:00.000','1997-11-25 00:00:00.000',2,81.88,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10741','AROUT',4,'1997-11-14 00:00:00.000','1997-11-28 00:00:00.000','1997-11-18 00:00:00.000',3,10.96,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10742','BOTTM',3,'1997-11-14 00:00:00.000','1997-12-12 00:00:00.000','1997-11-18 00:00:00.000',3,243.73,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10743','AROUT',1,'1997-11-17 00:00:00.000','1997-12-15 00:00:00.000','1997-11-21 00:00:00.000',2,23.72,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10744','VAFFE',6,'1997-11-17 00:00:00.000','1997-12-15 00:00:00.000','1997-11-24 00:00:00.000',1,69.19,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10745','QUICK',9,'1997-11-18 00:00:00.000','1997-12-16 00:00:00.000','1997-11-27 00:00:00.000',1,3.52,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10746','CHOPS',1,'1997-11-19 00:00:00.000','1997-12-17 00:00:00.000','1997-11-21 00:00:00.000',3,31.43,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO Orders  Values ('10747','PICCO',6,'1997-11-19 00:00:00.000','1997-12-17 00:00:00.000','1997-11-26 00:00:00.000',1,117.33,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('10748','SAVEA',3,'1997-11-20 00:00:00.000','1997-12-18 00:00:00.000','1997-11-28 00:00:00.000',1,232.55,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10749','ISLAT',4,'1997-11-20 00:00:00.000','1997-12-18 00:00:00.000','1997-12-19 00:00:00.000',2,61.53,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10750','WARTH',9,'1997-11-21 00:00:00.000','1997-12-19 00:00:00.000','1997-11-24 00:00:00.000',1,79.3,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10751','RICSU',3,'1997-11-24 00:00:00.000','1997-12-22 00:00:00.000','1997-12-03 00:00:00.000',3,130.79,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('10752','NORTS',2,'1997-11-24 00:00:00.000','1997-12-22 00:00:00.000','1997-11-28 00:00:00.000',3,1.39,'North/South','South House 300 Queensbridge','London',NULL,'SW7 1RZ','UK');
INSERT INTO Orders  Values ('10753','FRANS',3,'1997-11-25 00:00:00.000','1997-12-23 00:00:00.000','1997-11-27 00:00:00.000',1,7.7,'Franchi S.p.A.','Via Monte Bianco 34','Torino',NULL,'10100','Italy');
INSERT INTO Orders  Values ('10754','MAGAA',6,'1997-11-25 00:00:00.000','1997-12-23 00:00:00.000','1997-11-27 00:00:00.000',3,2.38,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10755','BONAP',4,'1997-11-26 00:00:00.000','1997-12-24 00:00:00.000','1997-11-28 00:00:00.000',2,16.71,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10756','SPLIR',8,'1997-11-27 00:00:00.000','1997-12-25 00:00:00.000','1997-12-02 00:00:00.000',2,73.21,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Orders  Values ('10757','SAVEA',6,'1997-11-27 00:00:00.000','1997-12-25 00:00:00.000','1997-12-15 00:00:00.000',1,8.19,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10758','RICSU',3,'1997-11-28 00:00:00.000','1997-12-26 00:00:00.000','1997-12-04 00:00:00.000',3,138.17,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('10759','ANATR',3,'1997-11-28 00:00:00.000','1997-12-26 00:00:00.000','1997-12-12 00:00:00.000',3,11.99,'Ana Trujillo Emparedados y helados','Avda. de la Constitucin 2222','Mxico D.F.',NULL,'5021','Mexico');
INSERT INTO Orders  Values ('10760','MAISD',4,'1997-12-01 00:00:00.000','1997-12-29 00:00:00.000','1997-12-10 00:00:00.000',1,155.64,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO Orders  Values ('10761','RATTC',5,'1997-12-02 00:00:00.000','1997-12-30 00:00:00.000','1997-12-08 00:00:00.000',2,18.66,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10762','FOLKO',3,'1997-12-02 00:00:00.000','1997-12-30 00:00:00.000','1997-12-09 00:00:00.000',1,328.74,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10763','FOLIG',3,'1997-12-03 00:00:00.000','1997-12-31 00:00:00.000','1997-12-08 00:00:00.000',3,37.35,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO Orders  Values ('10764','ERNSH',6,'1997-12-03 00:00:00.000','1997-12-31 00:00:00.000','1997-12-08 00:00:00.000',3,145.45,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10765','QUICK',3,'1997-12-04 00:00:00.000','1998-01-01 00:00:00.000','1997-12-09 00:00:00.000',3,42.74,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10766','OTTIK',4,'1997-12-05 00:00:00.000','1998-01-02 00:00:00.000','1997-12-09 00:00:00.000',1,157.55,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('10767','SUPRD',4,'1997-12-05 00:00:00.000','1998-01-02 00:00:00.000','1997-12-15 00:00:00.000',3,1.59,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10768','AROUT',3,'1997-12-08 00:00:00.000','1998-01-05 00:00:00.000','1997-12-15 00:00:00.000',2,146.32,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10769','VAFFE',3,'1997-12-08 00:00:00.000','1998-01-05 00:00:00.000','1997-12-12 00:00:00.000',1,65.06,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10770','HANAR',8,'1997-12-09 00:00:00.000','1998-01-06 00:00:00.000','1997-12-17 00:00:00.000',3,5.32,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10771','ERNSH',9,'1997-12-10 00:00:00.000','1998-01-07 00:00:00.000','1998-01-02 00:00:00.000',2,11.19,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10772','LEHMS',3,'1997-12-10 00:00:00.000','1998-01-07 00:00:00.000','1997-12-19 00:00:00.000',2,91.28,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10773','ERNSH',1,'1997-12-11 00:00:00.000','1998-01-08 00:00:00.000','1997-12-16 00:00:00.000',3,96.43,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10774','FOLKO',4,'1997-12-11 00:00:00.000','1997-12-25 00:00:00.000','1997-12-12 00:00:00.000',1,48.2,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10775','THECR',7,'1997-12-12 00:00:00.000','1998-01-09 00:00:00.000','1997-12-26 00:00:00.000',1,20.25,'The Cracker Box','55 Grizzly Peak Rd.','Butte','MT','59801','USA');
INSERT INTO Orders  Values ('10776','ERNSH',1,'1997-12-15 00:00:00.000','1998-01-12 00:00:00.000','1997-12-18 00:00:00.000',3,351.53,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10777','GOURL',7,'1997-12-15 00:00:00.000','1997-12-29 00:00:00.000','1998-01-21 00:00:00.000',2,3.01,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO Orders  Values ('10778','BERGS',3,'1997-12-16 00:00:00.000','1998-01-13 00:00:00.000','1997-12-24 00:00:00.000',1,6.79,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10779','MORGK',3,'1997-12-16 00:00:00.000','1998-01-13 00:00:00.000','1998-01-14 00:00:00.000',2,58.13,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'4179','Germany');
INSERT INTO Orders  Values ('10780','LILAS',2,'1997-12-16 00:00:00.000','1997-12-30 00:00:00.000','1997-12-25 00:00:00.000',1,42.13,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10781','WARTH',2,'1997-12-17 00:00:00.000','1998-01-14 00:00:00.000','1997-12-19 00:00:00.000',3,73.16,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('10782','CACTU',9,'1997-12-17 00:00:00.000','1998-01-14 00:00:00.000','1997-12-22 00:00:00.000',3,1.1,'Cactus Comidas para llevar','Cerrito 333','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10783','HANAR',4,'1997-12-18 00:00:00.000','1998-01-15 00:00:00.000','1997-12-19 00:00:00.000',2,124.98,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10784','MAGAA',4,'1997-12-18 00:00:00.000','1998-01-15 00:00:00.000','1997-12-22 00:00:00.000',3,70.09,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10785','GROSR',1,'1997-12-18 00:00:00.000','1998-01-15 00:00:00.000','1997-12-24 00:00:00.000',3,1.51,'GROSELLA-Restaurante','5 Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela');
INSERT INTO Orders  Values ('10786','QUEEN',8,'1997-12-19 00:00:00.000','1998-01-16 00:00:00.000','1997-12-23 00:00:00.000',1,110.87,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10787','LAMAI',2,'1997-12-19 00:00:00.000','1998-01-02 00:00:00.000','1997-12-26 00:00:00.000',1,249.93,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10788','QUICK',1,'1997-12-22 00:00:00.000','1998-01-19 00:00:00.000','1998-01-19 00:00:00.000',2,42.7,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10789','FOLIG',1,'1997-12-22 00:00:00.000','1998-01-19 00:00:00.000','1997-12-31 00:00:00.000',2,100.6,'Folies gourmandes','184, chausse de Tournai','Lille',NULL,'59000','France');
INSERT INTO Orders  Values ('10790','GOURL',6,'1997-12-22 00:00:00.000','1998-01-19 00:00:00.000','1997-12-26 00:00:00.000',1,28.23,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO Orders  Values ('10791','FRANK',6,'1997-12-23 00:00:00.000','1998-01-20 00:00:00.000','1998-01-01 00:00:00.000',2,16.85,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10792','WOLZA',1,'1997-12-23 00:00:00.000','1998-01-20 00:00:00.000','1997-12-31 00:00:00.000',3,23.79,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO Orders  Values ('10793','AROUT',3,'1997-12-24 00:00:00.000','1998-01-21 00:00:00.000','1998-01-08 00:00:00.000',3,4.52,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10794','QUEDE',6,'1997-12-24 00:00:00.000','1998-01-21 00:00:00.000','1998-01-02 00:00:00.000',1,21.49,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Orders  Values ('10795','ERNSH',8,'1997-12-24 00:00:00.000','1998-01-21 00:00:00.000','1998-01-20 00:00:00.000',2,126.66,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10796','HILAA',3,'1997-12-25 00:00:00.000','1998-01-22 00:00:00.000','1998-01-14 00:00:00.000',1,26.52,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10797','DRACD',7,'1997-12-25 00:00:00.000','1998-01-22 00:00:00.000','1998-01-05 00:00:00.000',2,33.35,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
INSERT INTO Orders  Values ('10798','ISLAT',2,'1997-12-26 00:00:00.000','1998-01-23 00:00:00.000','1998-01-05 00:00:00.000',1,2.33,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10799','KOENE',9,'1997-12-26 00:00:00.000','1998-02-06 00:00:00.000','1998-01-05 00:00:00.000',3,30.76,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10800','SEVES',1,'1997-12-26 00:00:00.000','1998-01-23 00:00:00.000','1998-01-05 00:00:00.000',3,137.44,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO Orders  Values ('10801','BOLID',4,'1997-12-29 00:00:00.000','1998-01-26 00:00:00.000','1997-12-31 00:00:00.000',2,97.09,'Blido Comidas preparadas','C/ Araquil, 67','Madrid',NULL,'28023','Spain');
INSERT INTO Orders  Values ('10802','SIMOB',4,'1997-12-29 00:00:00.000','1998-01-26 00:00:00.000','1998-01-02 00:00:00.000',2,257.26,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO Orders  Values ('10803','WELLI',4,'1997-12-30 00:00:00.000','1998-01-27 00:00:00.000','1998-01-06 00:00:00.000',1,55.23,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Orders  Values ('10804','SEVES',6,'1997-12-30 00:00:00.000','1998-01-27 00:00:00.000','1998-01-07 00:00:00.000',2,27.33,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO Orders  Values ('10805','THEBI',2,'1997-12-30 00:00:00.000','1998-01-27 00:00:00.000','1998-01-09 00:00:00.000',3,237.34,'The Big Cheese','89 Jefferson Way Suite 2','Portland','OR','97201','USA');
INSERT INTO Orders  Values ('10806','VICTE',3,'1997-12-31 00:00:00.000','1998-01-28 00:00:00.000','1998-01-05 00:00:00.000',2,22.11,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10807','FRANS',4,'1997-12-31 00:00:00.000','1998-01-28 00:00:00.000','1998-01-30 00:00:00.000',1,1.36,'Franchi S.p.A.','Via Monte Bianco 34','Torino',NULL,'10100','Italy');
INSERT INTO Orders  Values ('10808','OLDWO',2,'1998-01-01 00:00:00.000','1998-01-29 00:00:00.000','1998-01-09 00:00:00.000',3,45.53,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('10809','WELLI',7,'1998-01-01 00:00:00.000','1998-01-29 00:00:00.000','1998-01-07 00:00:00.000',1,4.87,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Orders  Values ('10810','LAUGB',2,'1998-01-01 00:00:00.000','1998-01-29 00:00:00.000','1998-01-07 00:00:00.000',3,4.33,'Laughing Bacchus Wine Cellars','2319 Elm St.','Vancouver','BC','V3F 2K1','Canada');
INSERT INTO Orders  Values ('10811','LINOD',8,'1998-01-02 00:00:00.000','1998-01-30 00:00:00.000','1998-01-08 00:00:00.000',1,31.22,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10812','REGGC',5,'1998-01-02 00:00:00.000','1998-01-30 00:00:00.000','1998-01-12 00:00:00.000',1,59.78,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10813','RICAR',1,'1998-01-05 00:00:00.000','1998-02-02 00:00:00.000','1998-01-09 00:00:00.000',1,47.38,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10814','VICTE',3,'1998-01-05 00:00:00.000','1998-02-02 00:00:00.000','1998-01-14 00:00:00.000',3,130.94,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10815','SAVEA',2,'1998-01-05 00:00:00.000','1998-02-02 00:00:00.000','1998-01-14 00:00:00.000',3,14.62,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10816','GREAL',4,'1998-01-06 00:00:00.000','1998-02-03 00:00:00.000','1998-02-04 00:00:00.000',2,719.78,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('10817','KOENE',3,'1998-01-06 00:00:00.000','1998-01-20 00:00:00.000','1998-01-13 00:00:00.000',2,306.07,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10818','MAGAA',7,'1998-01-07 00:00:00.000','1998-02-04 00:00:00.000','1998-01-12 00:00:00.000',3,65.48,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10819','CACTU',2,'1998-01-07 00:00:00.000','1998-02-04 00:00:00.000','1998-01-16 00:00:00.000',3,19.76,'Cactus Comidas para llevar','Cerrito 333','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10820','RATTC',3,'1998-01-07 00:00:00.000','1998-02-04 00:00:00.000','1998-01-13 00:00:00.000',2,37.52,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10821','SPLIR',1,'1998-01-08 00:00:00.000','1998-02-05 00:00:00.000','1998-01-15 00:00:00.000',1,36.68,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Orders  Values ('10822','TRAIH',6,'1998-01-08 00:00:00.000','1998-02-05 00:00:00.000','1998-01-16 00:00:00.000',3,7,'Trail-s Head Gourmet Provisioners','722 DaVinci Blvd.','Kirkland','WA','98034','USA');
INSERT INTO Orders  Values ('10823','LILAS',5,'1998-01-09 00:00:00.000','1998-02-06 00:00:00.000','1998-01-13 00:00:00.000',2,163.97,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10824','FOLKO',8,'1998-01-09 00:00:00.000','1998-02-06 00:00:00.000','1998-01-30 00:00:00.000',1,1.23,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10825','DRACD',1,'1998-01-09 00:00:00.000','1998-02-06 00:00:00.000','1998-01-14 00:00:00.000',1,79.25,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
INSERT INTO Orders  Values ('10826','BLONP',6,'1998-01-12 00:00:00.000','1998-02-09 00:00:00.000','1998-02-06 00:00:00.000',1,7.09,'Blondel pre et fils','24, place Klber','Strasbourg',NULL,'67000','France');
INSERT INTO Orders  Values ('10827','BONAP',1,'1998-01-12 00:00:00.000','1998-01-26 00:00:00.000','1998-02-06 00:00:00.000',2,63.54,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10828','RANCH',9,'1998-01-13 00:00:00.000','1998-01-27 00:00:00.000','1998-02-04 00:00:00.000',1,90.85,'Rancho grande','Av. del Libertador 900','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10829','ISLAT',9,'1998-01-13 00:00:00.000','1998-02-10 00:00:00.000','1998-01-23 00:00:00.000',1,154.72,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10830','TRADH',4,'1998-01-13 00:00:00.000','1998-02-24 00:00:00.000','1998-01-21 00:00:00.000',2,81.83,'Tradiao Hipermercados','Av. Ins de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
INSERT INTO Orders  Values ('10831','SANTG',3,'1998-01-14 00:00:00.000','1998-02-11 00:00:00.000','1998-01-23 00:00:00.000',2,72.19,'Sant Gourmet','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway');
INSERT INTO Orders  Values ('10832','LAMAI',2,'1998-01-14 00:00:00.000','1998-02-11 00:00:00.000','1998-01-19 00:00:00.000',2,43.26,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10833','OTTIK',6,'1998-01-15 00:00:00.000','1998-02-12 00:00:00.000','1998-01-23 00:00:00.000',2,71.49,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('10834','TRADH',1,'1998-01-15 00:00:00.000','1998-02-12 00:00:00.000','1998-01-19 00:00:00.000',3,29.78,'Tradiao Hipermercados','Av. Ins de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
INSERT INTO Orders  Values ('10835','ALFKI',1,'1998-01-15 00:00:00.000','1998-02-12 00:00:00.000','1998-01-21 00:00:00.000',3,69.53,'Alfred-s Futterkiste','Obere Str. 57','Berlin',NULL,'12209','Germany');
INSERT INTO Orders  Values ('10836','ERNSH',7,'1998-01-16 00:00:00.000','1998-02-13 00:00:00.000','1998-01-21 00:00:00.000',1,411.88,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10837','BERGS',9,'1998-01-16 00:00:00.000','1998-02-13 00:00:00.000','1998-01-23 00:00:00.000',3,13.32,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10838','LINOD',3,'1998-01-19 00:00:00.000','1998-02-16 00:00:00.000','1998-01-23 00:00:00.000',3,59.28,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10839','TRADH',3,'1998-01-19 00:00:00.000','1998-02-16 00:00:00.000','1998-01-22 00:00:00.000',3,35.43,'Tradiao Hipermercados','Av. Ins de Castro, 414','Sao Paulo','SP','05634-030','Brazil');
INSERT INTO Orders  Values ('10840','LINOD',4,'1998-01-19 00:00:00.000','1998-03-02 00:00:00.000','1998-02-16 00:00:00.000',2,2.71,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10841','SUPRD',5,'1998-01-20 00:00:00.000','1998-02-17 00:00:00.000','1998-01-29 00:00:00.000',2,424.3,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10842','TORTU',1,'1998-01-20 00:00:00.000','1998-02-17 00:00:00.000','1998-01-29 00:00:00.000',3,54.42,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10843','VICTE',4,'1998-01-21 00:00:00.000','1998-02-18 00:00:00.000','1998-01-26 00:00:00.000',2,9.26,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10844','PICCO',8,'1998-01-21 00:00:00.000','1998-02-18 00:00:00.000','1998-01-26 00:00:00.000',2,25.22,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('10845','QUICK',8,'1998-01-21 00:00:00.000','1998-02-04 00:00:00.000','1998-01-30 00:00:00.000',1,212.98,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10846','SUPRD',2,'1998-01-22 00:00:00.000','1998-03-05 00:00:00.000','1998-01-23 00:00:00.000',3,56.46,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10847','SAVEA',4,'1998-01-22 00:00:00.000','1998-02-05 00:00:00.000','1998-02-10 00:00:00.000',3,487.57,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10848','CONSH',7,'1998-01-23 00:00:00.000','1998-02-20 00:00:00.000','1998-01-29 00:00:00.000',2,38.24,'Consolidated Holdings','Berkeley Gardens 12 Brewery','London',NULL,'WX1 6LT','UK');
INSERT INTO Orders  Values ('10849','KOENE',9,'1998-01-23 00:00:00.000','1998-02-20 00:00:00.000','1998-01-30 00:00:00.000',2,0.56,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10850','VICTE',1,'1998-01-23 00:00:00.000','1998-03-06 00:00:00.000','1998-01-30 00:00:00.000',1,49.19,'Victuailles en stock','2, rue du Commerce','Lyon',NULL,'69004','France');
INSERT INTO Orders  Values ('10851','RICAR',5,'1998-01-26 00:00:00.000','1998-02-23 00:00:00.000','1998-02-02 00:00:00.000',1,160.55,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10852','RATTC',8,'1998-01-26 00:00:00.000','1998-02-09 00:00:00.000','1998-01-30 00:00:00.000',1,174.05,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10853','BLAUS',9,'1998-01-27 00:00:00.000','1998-02-24 00:00:00.000','1998-02-03 00:00:00.000',2,53.83,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO Orders  Values ('10854','ERNSH',3,'1998-01-27 00:00:00.000','1998-02-24 00:00:00.000','1998-02-05 00:00:00.000',2,100.22,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10855','OLDWO',3,'1998-01-27 00:00:00.000','1998-02-24 00:00:00.000','1998-02-04 00:00:00.000',1,170.97,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('10856','ANTON',3,'1998-01-28 00:00:00.000','1998-02-25 00:00:00.000','1998-02-10 00:00:00.000',2,58.43,'Antonio Moreno Taquera','Mataderos 2312','Mxico D.F.',NULL,'5023','Mexico');
INSERT INTO Orders  Values ('10857','BERGS',8,'1998-01-28 00:00:00.000','1998-02-25 00:00:00.000','1998-02-06 00:00:00.000',2,188.85,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10858','LACOR',2,'1998-01-29 00:00:00.000','1998-02-26 00:00:00.000','1998-02-03 00:00:00.000',1,52.51,'La corne d-abondance','67, avenue de l-Europe','Versailles',NULL,'78000','France');
INSERT INTO Orders  Values ('10859','FRANK',1,'1998-01-29 00:00:00.000','1998-02-26 00:00:00.000','1998-02-02 00:00:00.000',2,76.1,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10860','FRANR',3,'1998-01-29 00:00:00.000','1998-02-26 00:00:00.000','1998-02-04 00:00:00.000',3,19.26,'France restauration','54, rue Royale','Nantes',NULL,'44000','France');
INSERT INTO Orders  Values ('10861','WHITC',4,'1998-01-30 00:00:00.000','1998-02-27 00:00:00.000','1998-02-17 00:00:00.000',2,14.93,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10862','LEHMS',8,'1998-01-30 00:00:00.000','1998-03-13 00:00:00.000','1998-02-02 00:00:00.000',2,53.23,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10863','HILAA',4,'1998-02-02 00:00:00.000','1998-03-02 00:00:00.000','1998-02-17 00:00:00.000',2,30.26,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10864','AROUT',4,'1998-02-02 00:00:00.000','1998-03-02 00:00:00.000','1998-02-09 00:00:00.000',2,3.04,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10865','QUICK',2,'1998-02-02 00:00:00.000','1998-02-16 00:00:00.000','1998-02-12 00:00:00.000',1,348.14,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10866','BERGS',5,'1998-02-03 00:00:00.000','1998-03-03 00:00:00.000','1998-02-12 00:00:00.000',1,109.11,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10867','LONEP',6,'1998-02-03 00:00:00.000','1998-03-17 00:00:00.000','1998-02-11 00:00:00.000',1,1.93,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Orders  Values ('10868','QUEEN',7,'1998-02-04 00:00:00.000','1998-03-04 00:00:00.000','1998-02-23 00:00:00.000',2,191.27,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10869','SEVES',5,'1998-02-04 00:00:00.000','1998-03-04 00:00:00.000','1998-02-09 00:00:00.000',1,143.28,'Seven Seas Imports','90 Wadhurst Rd.','London',NULL,'OX15 4NB','UK');
INSERT INTO Orders  Values ('10870','WOLZA',5,'1998-02-04 00:00:00.000','1998-03-04 00:00:00.000','1998-02-13 00:00:00.000',3,12.04,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO Orders  Values ('10871','BONAP',9,'1998-02-05 00:00:00.000','1998-03-05 00:00:00.000','1998-02-10 00:00:00.000',2,112.27,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10872','GODOS',5,'1998-02-05 00:00:00.000','1998-03-05 00:00:00.000','1998-02-09 00:00:00.000',2,175.32,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('10873','WILMK',4,'1998-02-06 00:00:00.000','1998-03-06 00:00:00.000','1998-02-09 00:00:00.000',1,0.82,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO Orders  Values ('10874','GODOS',5,'1998-02-06 00:00:00.000','1998-03-06 00:00:00.000','1998-02-11 00:00:00.000',2,19.58,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('10875','BERGS',4,'1998-02-06 00:00:00.000','1998-03-06 00:00:00.000','1998-03-03 00:00:00.000',2,32.37,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10876','BONAP',7,'1998-02-09 00:00:00.000','1998-03-09 00:00:00.000','1998-02-12 00:00:00.000',3,60.42,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10877','RICAR',1,'1998-02-09 00:00:00.000','1998-03-09 00:00:00.000','1998-02-19 00:00:00.000',1,38.06,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('10878','QUICK',4,'1998-02-10 00:00:00.000','1998-03-10 00:00:00.000','1998-02-12 00:00:00.000',1,46.69,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10879','WILMK',3,'1998-02-10 00:00:00.000','1998-03-10 00:00:00.000','1998-02-12 00:00:00.000',3,8.5,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO Orders  Values ('10880','FOLKO',7,'1998-02-10 00:00:00.000','1998-03-24 00:00:00.000','1998-02-18 00:00:00.000',1,88.01,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10881','CACTU',4,'1998-02-11 00:00:00.000','1998-03-11 00:00:00.000','1998-02-18 00:00:00.000',1,2.84,'Cactus Comidas para llevar','Cerrito 333','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10882','SAVEA',4,'1998-02-11 00:00:00.000','1998-03-11 00:00:00.000','1998-02-20 00:00:00.000',3,23.1,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10883','LONEP',8,'1998-02-12 00:00:00.000','1998-03-12 00:00:00.000','1998-02-20 00:00:00.000',3,0.53,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Orders  Values ('10884','LETSS',4,'1998-02-12 00:00:00.000','1998-03-12 00:00:00.000','1998-02-13 00:00:00.000',2,90.97,'Let-s Stop N Shop','87 Polk St. Suite 5','San Francisco','CA','94117','USA');
INSERT INTO Orders  Values ('10885','SUPRD',6,'1998-02-12 00:00:00.000','1998-03-12 00:00:00.000','1998-02-18 00:00:00.000',3,5.64,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10886','HANAR',1,'1998-02-13 00:00:00.000','1998-03-13 00:00:00.000','1998-03-02 00:00:00.000',1,4.99,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10887','GALED',8,'1998-02-13 00:00:00.000','1998-03-13 00:00:00.000','1998-02-16 00:00:00.000',3,1.25,'Galera del gastronmo','Rambla de Catalua, 23','Barcelona',NULL,'8022','Spain');
INSERT INTO Orders  Values ('10888','GODOS',1,'1998-02-16 00:00:00.000','1998-03-16 00:00:00.000','1998-02-23 00:00:00.000',2,51.87,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('10889','RATTC',9,'1998-02-16 00:00:00.000','1998-03-16 00:00:00.000','1998-02-23 00:00:00.000',3,280.61,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10890','DUMON',7,'1998-02-16 00:00:00.000','1998-03-16 00:00:00.000','1998-02-18 00:00:00.000',1,32.76,'Du monde entier','67, rue des Cinquante Otages','Nantes',NULL,'44000','France');
INSERT INTO Orders  Values ('10891','LEHMS',7,'1998-02-17 00:00:00.000','1998-03-17 00:00:00.000','1998-02-19 00:00:00.000',2,20.37,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10892','MAISD',4,'1998-02-17 00:00:00.000','1998-03-17 00:00:00.000','1998-02-19 00:00:00.000',2,120.27,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO Orders  Values ('10893','KOENE',9,'1998-02-18 00:00:00.000','1998-03-18 00:00:00.000','1998-02-20 00:00:00.000',2,77.78,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('10894','SAVEA',1,'1998-02-18 00:00:00.000','1998-03-18 00:00:00.000','1998-02-20 00:00:00.000',1,116.13,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10895','ERNSH',3,'1998-02-18 00:00:00.000','1998-03-18 00:00:00.000','1998-02-23 00:00:00.000',1,162.75,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10896','MAISD',7,'1998-02-19 00:00:00.000','1998-03-19 00:00:00.000','1998-02-27 00:00:00.000',3,32.45,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO Orders  Values ('10897','HUNGO',3,'1998-02-19 00:00:00.000','1998-03-19 00:00:00.000','1998-02-25 00:00:00.000',2,603.54,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10898','OCEAN',4,'1998-02-20 00:00:00.000','1998-03-20 00:00:00.000','1998-03-06 00:00:00.000',2,1.27,'Ocano Atlntico Ltda.','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10899','LILAS',5,'1998-02-20 00:00:00.000','1998-03-20 00:00:00.000','1998-02-26 00:00:00.000',3,1.21,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10900','WELLI',1,'1998-02-20 00:00:00.000','1998-03-20 00:00:00.000','1998-03-04 00:00:00.000',2,1.66,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Orders  Values ('10901','HILAA',4,'1998-02-23 00:00:00.000','1998-03-23 00:00:00.000','1998-02-26 00:00:00.000',1,62.09,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10902','FOLKO',1,'1998-02-23 00:00:00.000','1998-03-23 00:00:00.000','1998-03-03 00:00:00.000',1,44.15,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10903','HANAR',3,'1998-02-24 00:00:00.000','1998-03-24 00:00:00.000','1998-03-04 00:00:00.000',3,36.71,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10904','WHITC',3,'1998-02-24 00:00:00.000','1998-03-24 00:00:00.000','1998-02-27 00:00:00.000',3,162.95,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('10905','WELLI',9,'1998-02-24 00:00:00.000','1998-03-24 00:00:00.000','1998-03-06 00:00:00.000',2,13.72,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Orders  Values ('10906','WOLZA',4,'1998-02-25 00:00:00.000','1998-03-11 00:00:00.000','1998-03-03 00:00:00.000',3,26.29,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO Orders  Values ('10907','SPECD',6,'1998-02-25 00:00:00.000','1998-03-25 00:00:00.000','1998-02-27 00:00:00.000',3,9.19,'Spcialits du monde','25, rue Lauriston','Paris',NULL,'75016','France');
INSERT INTO Orders  Values ('10908','REGGC',4,'1998-02-26 00:00:00.000','1998-03-26 00:00:00.000','1998-03-06 00:00:00.000',2,32.96,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10909','SANTG',1,'1998-02-26 00:00:00.000','1998-03-26 00:00:00.000','1998-03-10 00:00:00.000',2,53.05,'Sant Gourmet','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway');
INSERT INTO Orders  Values ('10910','WILMK',1,'1998-02-26 00:00:00.000','1998-03-26 00:00:00.000','1998-03-04 00:00:00.000',3,38.11,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO Orders  Values ('10911','GODOS',3,'1998-02-26 00:00:00.000','1998-03-26 00:00:00.000','1998-03-05 00:00:00.000',1,38.19,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('10912','HUNGO',2,'1998-02-26 00:00:00.000','1998-03-26 00:00:00.000','1998-03-18 00:00:00.000',2,580.91,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10913','QUEEN',4,'1998-02-26 00:00:00.000','1998-03-26 00:00:00.000','1998-03-04 00:00:00.000',1,33.05,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10914','QUEEN',6,'1998-02-27 00:00:00.000','1998-03-27 00:00:00.000','1998-03-02 00:00:00.000',1,21.19,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10915','TORTU',2,'1998-02-27 00:00:00.000','1998-03-27 00:00:00.000','1998-03-02 00:00:00.000',2,3.51,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10916','RANCH',1,'1998-02-27 00:00:00.000','1998-03-27 00:00:00.000','1998-03-09 00:00:00.000',2,63.77,'Rancho grande','Av. del Libertador 900','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10917','ROMEY',4,'1998-03-02 00:00:00.000','1998-03-30 00:00:00.000','1998-03-11 00:00:00.000',2,8.29,'Romero y tomillo','Gran Va, 1','Madrid',NULL,'28001','Spain');
INSERT INTO Orders  Values ('10918','BOTTM',3,'1998-03-02 00:00:00.000','1998-03-30 00:00:00.000','1998-03-11 00:00:00.000',3,48.83,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10919','LINOD',2,'1998-03-02 00:00:00.000','1998-03-30 00:00:00.000','1998-03-04 00:00:00.000',2,19.8,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10920','AROUT',4,'1998-03-03 00:00:00.000','1998-03-31 00:00:00.000','1998-03-09 00:00:00.000',2,29.61,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10921','VAFFE',1,'1998-03-03 00:00:00.000','1998-04-14 00:00:00.000','1998-03-09 00:00:00.000',1,176.48,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10922','HANAR',5,'1998-03-03 00:00:00.000','1998-03-31 00:00:00.000','1998-03-05 00:00:00.000',3,62.74,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10923','LAMAI',7,'1998-03-03 00:00:00.000','1998-04-14 00:00:00.000','1998-03-13 00:00:00.000',3,68.26,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('10924','BERGS',3,'1998-03-04 00:00:00.000','1998-04-01 00:00:00.000','1998-04-08 00:00:00.000',2,151.52,'Berglunds snabbkp','Berguvsvgen 8','Lule',NULL,'S-958 22','Sweden');
INSERT INTO Orders  Values ('10925','HANAR',3,'1998-03-04 00:00:00.000','1998-04-01 00:00:00.000','1998-03-13 00:00:00.000',1,2.27,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10926','ANATR',4,'1998-03-04 00:00:00.000','1998-04-01 00:00:00.000','1998-03-11 00:00:00.000',3,39.92,'Ana Trujillo Emparedados y helados','Avda. de la Constitucin 2222','Mxico D.F.',NULL,'5021','Mexico');
INSERT INTO Orders  Values ('10927','LACOR',4,'1998-03-05 00:00:00.000','1998-04-02 00:00:00.000','1998-04-08 00:00:00.000',1,19.79,'La corne d-abondance','67, avenue de l-Europe','Versailles',NULL,'78000','France');
INSERT INTO Orders  Values ('10928','GALED',1,'1998-03-05 00:00:00.000','1998-04-02 00:00:00.000','1998-03-18 00:00:00.000',1,1.36,'Galera del gastronmo','Rambla de Catalua, 23','Barcelona',NULL,'8022','Spain');
INSERT INTO Orders  Values ('10929','FRANK',6,'1998-03-05 00:00:00.000','1998-04-02 00:00:00.000','1998-03-12 00:00:00.000',1,33.93,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('10930','SUPRD',4,'1998-03-06 00:00:00.000','1998-04-17 00:00:00.000','1998-03-18 00:00:00.000',3,15.55,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('10931','RICSU',4,'1998-03-06 00:00:00.000','1998-03-20 00:00:00.000','1998-03-19 00:00:00.000',2,13.6,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('10932','BONAP',8,'1998-03-06 00:00:00.000','1998-04-03 00:00:00.000','1998-03-24 00:00:00.000',1,134.64,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10933','ISLAT',6,'1998-03-06 00:00:00.000','1998-04-03 00:00:00.000','1998-03-16 00:00:00.000',3,54.15,'Island Trading','Garden House Crowther Way','Cowes','Isle of Wight','PO31 7PJ','UK');
INSERT INTO Orders  Values ('10934','LEHMS',3,'1998-03-09 00:00:00.000','1998-04-06 00:00:00.000','1998-03-12 00:00:00.000',3,32.01,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('10935','WELLI',4,'1998-03-09 00:00:00.000','1998-04-06 00:00:00.000','1998-03-18 00:00:00.000',3,47.59,'Wellington Importadora','Rua do Mercado, 12','Resende','SP','08737-363','Brazil');
INSERT INTO Orders  Values ('10936','GREAL',3,'1998-03-09 00:00:00.000','1998-04-06 00:00:00.000','1998-03-18 00:00:00.000',2,33.68,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('10937','CACTU',7,'1998-03-10 00:00:00.000','1998-03-24 00:00:00.000','1998-03-13 00:00:00.000',3,31.51,'Cactus Comidas para llevar','Cerrito 333','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10938','QUICK',3,'1998-03-10 00:00:00.000','1998-04-07 00:00:00.000','1998-03-16 00:00:00.000',2,31.89,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10939','MAGAA',2,'1998-03-10 00:00:00.000','1998-04-07 00:00:00.000','1998-03-13 00:00:00.000',2,76.33,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10940','BONAP',8,'1998-03-11 00:00:00.000','1998-04-08 00:00:00.000','1998-03-23 00:00:00.000',3,19.77,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('10941','SAVEA',7,'1998-03-11 00:00:00.000','1998-04-08 00:00:00.000','1998-03-20 00:00:00.000',2,400.81,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10942','REGGC',9,'1998-03-11 00:00:00.000','1998-04-08 00:00:00.000','1998-03-18 00:00:00.000',3,17.95,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('10943','BSBEV',4,'1998-03-11 00:00:00.000','1998-04-08 00:00:00.000','1998-03-19 00:00:00.000',2,2.17,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('10944','BOTTM',6,'1998-03-12 00:00:00.000','1998-03-26 00:00:00.000','1998-03-13 00:00:00.000',3,52.92,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10945','MORGK',4,'1998-03-12 00:00:00.000','1998-04-09 00:00:00.000','1998-03-18 00:00:00.000',1,10.22,'Morgenstern Gesundkost','Heerstr. 22','Leipzig',NULL,'4179','Germany');
INSERT INTO Orders  Values ('10946','VAFFE',1,'1998-03-12 00:00:00.000','1998-04-09 00:00:00.000','1998-03-19 00:00:00.000',2,27.2,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10947','BSBEV',3,'1998-03-13 00:00:00.000','1998-04-10 00:00:00.000','1998-03-16 00:00:00.000',2,3.26,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('10948','GODOS',3,'1998-03-13 00:00:00.000','1998-04-10 00:00:00.000','1998-03-19 00:00:00.000',3,23.39,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('10949','BOTTM',2,'1998-03-13 00:00:00.000','1998-04-10 00:00:00.000','1998-03-17 00:00:00.000',3,74.44,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10950','MAGAA',1,'1998-03-16 00:00:00.000','1998-04-13 00:00:00.000','1998-03-23 00:00:00.000',2,2.5,'Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo',NULL,'24100','Italy');
INSERT INTO Orders  Values ('10951','RICSU',9,'1998-03-16 00:00:00.000','1998-04-27 00:00:00.000','1998-04-07 00:00:00.000',2,30.85,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('10952','ALFKI',1,'1998-03-16 00:00:00.000','1998-04-27 00:00:00.000','1998-03-24 00:00:00.000',1,40.42,'Alfred-s Futterkiste','Obere Str. 57','Berlin',NULL,'12209','Germany');
INSERT INTO Orders  Values ('10953','AROUT',9,'1998-03-16 00:00:00.000','1998-03-30 00:00:00.000','1998-03-25 00:00:00.000',2,23.72,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('10954','LINOD',5,'1998-03-17 00:00:00.000','1998-04-28 00:00:00.000','1998-03-20 00:00:00.000',1,27.91,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('10955','FOLKO',8,'1998-03-17 00:00:00.000','1998-04-14 00:00:00.000','1998-03-20 00:00:00.000',2,3.26,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10956','BLAUS',6,'1998-03-17 00:00:00.000','1998-04-28 00:00:00.000','1998-03-20 00:00:00.000',2,44.65,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO Orders  Values ('10957','HILAA',8,'1998-03-18 00:00:00.000','1998-04-15 00:00:00.000','1998-03-27 00:00:00.000',3,105.36,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10958','OCEAN',7,'1998-03-18 00:00:00.000','1998-04-15 00:00:00.000','1998-03-27 00:00:00.000',2,49.56,'Ocano Atlntico Ltda.','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10959','GOURL',6,'1998-03-18 00:00:00.000','1998-04-29 00:00:00.000','1998-03-23 00:00:00.000',2,4.98,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO Orders  Values ('10960','HILAA',3,'1998-03-19 00:00:00.000','1998-04-02 00:00:00.000','1998-04-08 00:00:00.000',1,2.08,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10961','QUEEN',8,'1998-03-19 00:00:00.000','1998-04-16 00:00:00.000','1998-03-30 00:00:00.000',1,104.47,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('10962','QUICK',8,'1998-03-19 00:00:00.000','1998-04-16 00:00:00.000','1998-03-23 00:00:00.000',2,275.79,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10963','FURIB',9,'1998-03-19 00:00:00.000','1998-04-16 00:00:00.000','1998-03-26 00:00:00.000',3,2.7,'Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa',NULL,'1675','Portugal');
INSERT INTO Orders  Values ('10964','SPECD',3,'1998-03-20 00:00:00.000','1998-04-17 00:00:00.000','1998-03-24 00:00:00.000',2,87.38,'Spcialits du monde','25, rue Lauriston','Paris',NULL,'75016','France');
INSERT INTO Orders  Values ('10965','OLDWO',6,'1998-03-20 00:00:00.000','1998-04-17 00:00:00.000','1998-03-30 00:00:00.000',3,144.38,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('10966','CHOPS',4,'1998-03-20 00:00:00.000','1998-04-17 00:00:00.000','1998-04-08 00:00:00.000',1,27.19,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO Orders  Values ('10967','TOMSP',2,'1998-03-23 00:00:00.000','1998-04-20 00:00:00.000','1998-04-02 00:00:00.000',2,62.22,'Toms Spezialitten','Luisenstr. 48','Mnster',NULL,'44087','Germany');
INSERT INTO Orders  Values ('10968','ERNSH',1,'1998-03-23 00:00:00.000','1998-04-20 00:00:00.000','1998-04-01 00:00:00.000',3,74.6,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10969','COMMI',1,'1998-03-23 00:00:00.000','1998-04-20 00:00:00.000','1998-03-30 00:00:00.000',2,0.21,'Comrcio Mineiro','Av. dos Lusadas, 23','Sao Paulo','SP','05432-043','Brazil');
INSERT INTO Orders  Values ('10970','BOLID',9,'1998-03-24 00:00:00.000','1998-04-07 00:00:00.000','1998-04-24 00:00:00.000',1,16.16,'Blido Comidas preparadas','C/ Araquil, 67','Madrid',NULL,'28023','Spain');
INSERT INTO Orders  Values ('10971','FRANR',2,'1998-03-24 00:00:00.000','1998-04-21 00:00:00.000','1998-04-02 00:00:00.000',2,121.82,'France restauration','54, rue Royale','Nantes',NULL,'44000','France');
INSERT INTO Orders  Values ('10972','LACOR',4,'1998-03-24 00:00:00.000','1998-04-21 00:00:00.000','1998-03-26 00:00:00.000',2,0.02,'La corne d-abondance','67, avenue de l-Europe','Versailles',NULL,'78000','France');
INSERT INTO Orders  Values ('10973','LACOR',6,'1998-03-24 00:00:00.000','1998-04-21 00:00:00.000','1998-03-27 00:00:00.000',2,15.17,'La corne d-abondance','67, avenue de l-Europe','Versailles',NULL,'78000','France');
INSERT INTO Orders  Values ('10974','SPLIR',3,'1998-03-25 00:00:00.000','1998-04-08 00:00:00.000','1998-04-03 00:00:00.000',3,12.96,'Split Rail Beer & Ale','P.O. Box 555','Lander','WY','82520','USA');
INSERT INTO Orders  Values ('10975','BOTTM',1,'1998-03-25 00:00:00.000','1998-04-22 00:00:00.000','1998-03-27 00:00:00.000',3,32.27,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10976','HILAA',1,'1998-03-25 00:00:00.000','1998-05-06 00:00:00.000','1998-04-03 00:00:00.000',1,37.97,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('10977','FOLKO',8,'1998-03-26 00:00:00.000','1998-04-23 00:00:00.000','1998-04-10 00:00:00.000',3,208.5,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10978','MAISD',9,'1998-03-26 00:00:00.000','1998-04-23 00:00:00.000','1998-04-23 00:00:00.000',2,32.82,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO Orders  Values ('10979','ERNSH',8,'1998-03-26 00:00:00.000','1998-04-23 00:00:00.000','1998-03-31 00:00:00.000',2,353.07,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10980','FOLKO',4,'1998-03-27 00:00:00.000','1998-05-08 00:00:00.000','1998-04-17 00:00:00.000',1,1.26,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10981','HANAR',1,'1998-03-27 00:00:00.000','1998-04-24 00:00:00.000','1998-04-02 00:00:00.000',2,193.37,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('10982','BOTTM',2,'1998-03-27 00:00:00.000','1998-04-24 00:00:00.000','1998-04-08 00:00:00.000',1,14.01,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('10983','SAVEA',2,'1998-03-27 00:00:00.000','1998-04-24 00:00:00.000','1998-04-06 00:00:00.000',2,657.54,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10984','SAVEA',1,'1998-03-30 00:00:00.000','1998-04-27 00:00:00.000','1998-04-03 00:00:00.000',3,211.22,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('10985','HUNGO',2,'1998-03-30 00:00:00.000','1998-04-27 00:00:00.000','1998-04-02 00:00:00.000',1,91.51,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('10986','OCEAN',8,'1998-03-30 00:00:00.000','1998-04-27 00:00:00.000','1998-04-21 00:00:00.000',2,217.86,'Ocano Atlntico Ltda.','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('10987','EASTC',8,'1998-03-31 00:00:00.000','1998-04-28 00:00:00.000','1998-04-06 00:00:00.000',1,185.48,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO Orders  Values ('10988','RATTC',3,'1998-03-31 00:00:00.000','1998-04-28 00:00:00.000','1998-04-10 00:00:00.000',2,61.14,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('10989','QUEDE',2,'1998-03-31 00:00:00.000','1998-04-28 00:00:00.000','1998-04-02 00:00:00.000',1,34.76,'Que Delcia','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brazil');
INSERT INTO Orders  Values ('10990','ERNSH',2,'1998-04-01 00:00:00.000','1998-05-13 00:00:00.000','1998-04-07 00:00:00.000',3,117.61,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('10991','QUICK',1,'1998-04-01 00:00:00.000','1998-04-29 00:00:00.000','1998-04-07 00:00:00.000',1,38.51,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10992','THEBI',1,'1998-04-01 00:00:00.000','1998-04-29 00:00:00.000','1998-04-03 00:00:00.000',3,4.27,'The Big Cheese','89 Jefferson Way Suite 2','Portland','OR','97201','USA');
INSERT INTO Orders  Values ('10993','FOLKO',7,'1998-04-01 00:00:00.000','1998-04-29 00:00:00.000','1998-04-10 00:00:00.000',3,8.81,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('10994','VAFFE',2,'1998-04-02 00:00:00.000','1998-04-16 00:00:00.000','1998-04-09 00:00:00.000',3,65.53,'Vaffeljernet','Smagsloget 45','rhus',NULL,'8200','Denmark');
INSERT INTO Orders  Values ('10995','PERIC',1,'1998-04-02 00:00:00.000','1998-04-30 00:00:00.000','1998-04-06 00:00:00.000',3,46,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('10996','QUICK',4,'1998-04-02 00:00:00.000','1998-04-30 00:00:00.000','1998-04-10 00:00:00.000',2,1.12,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('10997','LILAS',8,'1998-04-03 00:00:00.000','1998-05-15 00:00:00.000','1998-04-13 00:00:00.000',2,73.91,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('10998','WOLZA',8,'1998-04-03 00:00:00.000','1998-04-17 00:00:00.000','1998-04-17 00:00:00.000',2,20.31,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO Orders  Values ('10999','OTTIK',6,'1998-04-03 00:00:00.000','1998-05-01 00:00:00.000','1998-04-10 00:00:00.000',2,96.35,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('11000','RATTC',2,'1998-04-06 00:00:00.000','1998-05-04 00:00:00.000','1998-04-14 00:00:00.000',3,55.12,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');
INSERT INTO Orders  Values ('11001','FOLKO',2,'1998-04-06 00:00:00.000','1998-05-04 00:00:00.000','1998-04-14 00:00:00.000',2,197.3,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('11002','SAVEA',4,'1998-04-06 00:00:00.000','1998-05-04 00:00:00.000','1998-04-16 00:00:00.000',1,141.16,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('11003','THECR',3,'1998-04-06 00:00:00.000','1998-05-04 00:00:00.000','1998-04-08 00:00:00.000',3,14.91,'The Cracker Box','55 Grizzly Peak Rd.','Butte','MT','59801','USA');
INSERT INTO Orders  Values ('11004','MAISD',3,'1998-04-07 00:00:00.000','1998-05-05 00:00:00.000','1998-04-20 00:00:00.000',1,44.84,'Maison Dewey','Rue Joseph-Bens 532','Bruxelles',NULL,'B-1180','Belgium');
INSERT INTO Orders  Values ('11005','WILMK',2,'1998-04-07 00:00:00.000','1998-05-05 00:00:00.000','1998-04-10 00:00:00.000',1,0.75,'Wilman Kala','Keskuskatu 45','Helsinki',NULL,'21240','Finland');
INSERT INTO Orders  Values ('11006','GREAL',3,'1998-04-07 00:00:00.000','1998-05-05 00:00:00.000','1998-04-15 00:00:00.000',2,25.19,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('11007','PRINI',8,'1998-04-08 00:00:00.000','1998-05-06 00:00:00.000','1998-04-13 00:00:00.000',2,202.24,'Princesa Isabel Vinhos','Estrada da sade n. 58','Lisboa',NULL,'1756','Portugal');
INSERT INTO Orders  Values ('11008','ERNSH',7,'1998-04-08 00:00:00.000','1998-05-06 00:00:00.000',NULL,3,79.46,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('11009','GODOS',2,'1998-04-08 00:00:00.000','1998-05-06 00:00:00.000','1998-04-10 00:00:00.000',1,59.11,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('11010','REGGC',2,'1998-04-09 00:00:00.000','1998-05-07 00:00:00.000','1998-04-21 00:00:00.000',2,28.71,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('11011','ALFKI',3,'1998-04-09 00:00:00.000','1998-05-07 00:00:00.000','1998-04-13 00:00:00.000',1,1.21,'Alfred-s Futterkiste','Obere Str. 57','Berlin',NULL,'12209','Germany');
INSERT INTO Orders  Values ('11012','FRANK',1,'1998-04-09 00:00:00.000','1998-04-23 00:00:00.000','1998-04-17 00:00:00.000',3,242.95,'Frankenversand','Berliner Platz 43','Mnchen',NULL,'80805','Germany');
INSERT INTO Orders  Values ('11013','ROMEY',2,'1998-04-09 00:00:00.000','1998-05-07 00:00:00.000','1998-04-10 00:00:00.000',1,32.99,'Romero y tomillo','Gran Va, 1','Madrid',NULL,'28001','Spain');
INSERT INTO Orders  Values ('11014','LINOD',2,'1998-04-10 00:00:00.000','1998-05-08 00:00:00.000','1998-04-15 00:00:00.000',3,23.6,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('11015','SANTG',2,'1998-04-10 00:00:00.000','1998-04-24 00:00:00.000','1998-04-20 00:00:00.000',2,4.62,'Sant Gourmet','Erling Skakkes gate 78','Stavern',NULL,'4110','Norway');
INSERT INTO Orders  Values ('11016','AROUT',9,'1998-04-10 00:00:00.000','1998-05-08 00:00:00.000','1998-04-13 00:00:00.000',2,33.8,'Around the Horn','Brook Farm Stratford St. Mary','Colchester','Essex','CO7 6JX','UK');
INSERT INTO Orders  Values ('11017','ERNSH',9,'1998-04-13 00:00:00.000','1998-05-11 00:00:00.000','1998-04-20 00:00:00.000',2,754.26,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('11018','LONEP',4,'1998-04-13 00:00:00.000','1998-05-11 00:00:00.000','1998-04-16 00:00:00.000',2,11.65,'Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','OR','97219','USA');
INSERT INTO Orders  Values ('11019','RANCH',6,'1998-04-13 00:00:00.000','1998-05-11 00:00:00.000',NULL,3,3.17,'Rancho grande','Av. del Libertador 900','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('11020','OTTIK',2,'1998-04-14 00:00:00.000','1998-05-12 00:00:00.000','1998-04-16 00:00:00.000',2,43.3,'Ottilies Kseladen','Mehrheimerstr. 369','Kln',NULL,'50739','Germany');
INSERT INTO Orders  Values ('11021','QUICK',3,'1998-04-14 00:00:00.000','1998-05-12 00:00:00.000','1998-04-21 00:00:00.000',1,297.18,'QUICK-Stop','Taucherstrae 10','Cunewalde',NULL,'1307','Germany');
INSERT INTO Orders  Values ('11022','HANAR',9,'1998-04-14 00:00:00.000','1998-05-12 00:00:00.000','1998-05-04 00:00:00.000',2,6.27,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('11023','BSBEV',1,'1998-04-14 00:00:00.000','1998-04-28 00:00:00.000','1998-04-24 00:00:00.000',2,123.83,'B-s Beverages','Fauntleroy Circus','London',NULL,'EC2 5NT','UK');
INSERT INTO Orders  Values ('11024','EASTC',4,'1998-04-15 00:00:00.000','1998-05-13 00:00:00.000','1998-04-20 00:00:00.000',1,74.36,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO Orders  Values ('11025','WARTH',6,'1998-04-15 00:00:00.000','1998-05-13 00:00:00.000','1998-04-24 00:00:00.000',3,29.17,'Wartian Herkku','Torikatu 38','Oulu',NULL,'90110','Finland');
INSERT INTO Orders  Values ('11026','FRANS',4,'1998-04-15 00:00:00.000','1998-05-13 00:00:00.000','1998-04-28 00:00:00.000',1,47.09,'Franchi S.p.A.','Via Monte Bianco 34','Torino',NULL,'10100','Italy');
INSERT INTO Orders  Values ('11027','BOTTM',1,'1998-04-16 00:00:00.000','1998-05-14 00:00:00.000','1998-04-20 00:00:00.000',1,52.52,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('11028','KOENE',2,'1998-04-16 00:00:00.000','1998-05-14 00:00:00.000','1998-04-22 00:00:00.000',1,29.59,'Kniglich Essen','Maubelstr. 90','Brandenburg',NULL,'14776','Germany');
INSERT INTO Orders  Values ('11029','CHOPS',4,'1998-04-16 00:00:00.000','1998-05-14 00:00:00.000','1998-04-27 00:00:00.000',1,47.84,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO Orders  Values ('11030','SAVEA',7,'1998-04-17 00:00:00.000','1998-05-15 00:00:00.000','1998-04-27 00:00:00.000',2,830.75,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('11031','SAVEA',6,'1998-04-17 00:00:00.000','1998-05-15 00:00:00.000','1998-04-24 00:00:00.000',2,227.22,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('11032','WHITC',2,'1998-04-17 00:00:00.000','1998-05-15 00:00:00.000','1998-04-23 00:00:00.000',3,606.19,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('11033','RICSU',7,'1998-04-17 00:00:00.000','1998-05-15 00:00:00.000','1998-04-23 00:00:00.000',3,84.74,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('11034','OLDWO',8,'1998-04-20 00:00:00.000','1998-06-01 00:00:00.000','1998-04-27 00:00:00.000',1,40.32,'Old World Delicatessen','2743 Bering St.','Anchorage','AK','99508','USA');
INSERT INTO Orders  Values ('11035','SUPRD',2,'1998-04-20 00:00:00.000','1998-05-18 00:00:00.000','1998-04-24 00:00:00.000',2,0.17,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('11036','DRACD',8,'1998-04-20 00:00:00.000','1998-05-18 00:00:00.000','1998-04-22 00:00:00.000',3,149.47,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
INSERT INTO Orders  Values ('11037','GODOS',7,'1998-04-21 00:00:00.000','1998-05-19 00:00:00.000','1998-04-27 00:00:00.000',1,3.2,'Godos Cocina Tpica','C/ Romero, 33','Sevilla',NULL,'41101','Spain');
INSERT INTO Orders  Values ('11038','SUPRD',1,'1998-04-21 00:00:00.000','1998-05-19 00:00:00.000','1998-04-30 00:00:00.000',2,29.59,'Suprmes dlices','Boulevard Tirou, 255','Charleroi',NULL,'B-6000','Belgium');
INSERT INTO Orders  Values ('11039','LINOD',1,'1998-04-21 00:00:00.000','1998-05-19 00:00:00.000',NULL,2,65,'LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela');
INSERT INTO Orders  Values ('11040','GREAL',4,'1998-04-22 00:00:00.000','1998-05-20 00:00:00.000',NULL,3,18.84,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('11041','CHOPS',3,'1998-04-22 00:00:00.000','1998-05-20 00:00:00.000','1998-04-28 00:00:00.000',2,48.22,'Chop-suey Chinese','Hauptstr. 31','Bern',NULL,'3012','Switzerland');
INSERT INTO Orders  Values ('11042','COMMI',2,'1998-04-22 00:00:00.000','1998-05-06 00:00:00.000','1998-05-01 00:00:00.000',1,29.99,'Comrcio Mineiro','Av. dos Lusadas, 23','Sao Paulo','SP','05432-043','Brazil');
INSERT INTO Orders  Values ('11043','SPECD',5,'1998-04-22 00:00:00.000','1998-05-20 00:00:00.000','1998-04-29 00:00:00.000',2,8.8,'Spcialits du monde','25, rue Lauriston','Paris',NULL,'75016','France');
INSERT INTO Orders  Values ('11044','WOLZA',4,'1998-04-23 00:00:00.000','1998-05-21 00:00:00.000','1998-05-01 00:00:00.000',1,8.72,'Wolski Zajazd','ul. Filtrowa 68','Warszawa',NULL,'01-012','Poland');
INSERT INTO Orders  Values ('11045','BOTTM',6,'1998-04-23 00:00:00.000','1998-05-21 00:00:00.000',NULL,2,70.58,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('11046','WANDK',8,'1998-04-23 00:00:00.000','1998-05-21 00:00:00.000','1998-04-24 00:00:00.000',2,71.64,'Die Wandernde Kuh','Adenauerallee 900','Stuttgart',NULL,'70563','Germany');
INSERT INTO Orders  Values ('11047','EASTC',7,'1998-04-24 00:00:00.000','1998-05-22 00:00:00.000','1998-05-01 00:00:00.000',3,46.62,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO Orders  Values ('11048','BOTTM',7,'1998-04-24 00:00:00.000','1998-05-22 00:00:00.000','1998-04-30 00:00:00.000',3,24.12,'Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canada');
INSERT INTO Orders  Values ('11049','GOURL',3,'1998-04-24 00:00:00.000','1998-05-22 00:00:00.000','1998-05-04 00:00:00.000',1,8.34,'Gourmet Lanchonetes','Av. Brasil, 442','Campinas','SP','04876-786','Brazil');
INSERT INTO Orders  Values ('11050','FOLKO',8,'1998-04-27 00:00:00.000','1998-05-25 00:00:00.000','1998-05-05 00:00:00.000',2,59.41,'Folk och f HB','kergatan 24','Brcke',NULL,'S-844 67','Sweden');
INSERT INTO Orders  Values ('11051','LAMAI',7,'1998-04-27 00:00:00.000','1998-05-25 00:00:00.000',NULL,3,2.79,'La maison d-Asie','1 rue Alsace-Lorraine','Toulouse',NULL,'31000','France');
INSERT INTO Orders  Values ('11052','HANAR',3,'1998-04-27 00:00:00.000','1998-05-25 00:00:00.000','1998-05-01 00:00:00.000',1,67.26,'Hanari Carnes','Rua do Pao, 67','Rio de Janeiro','RJ','05454-876','Brazil');
INSERT INTO Orders  Values ('11053','PICCO',2,'1998-04-27 00:00:00.000','1998-05-25 00:00:00.000','1998-04-29 00:00:00.000',2,53.05,'Piccolo und mehr','Geislweg 14','Salzburg',NULL,'5020','Austria');
INSERT INTO Orders  Values ('11054','CACTU',8,'1998-04-28 00:00:00.000','1998-05-26 00:00:00.000',NULL,1,0.33,'Cactus Comidas para llevar','Cerrito 333','Buenos Aires',NULL,'1010','Argentina');
INSERT INTO Orders  Values ('11055','HILAA',7,'1998-04-28 00:00:00.000','1998-05-26 00:00:00.000','1998-05-05 00:00:00.000',2,120.92,'HILARION-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristbal','Tchira','5022','Venezuela');
INSERT INTO Orders  Values ('11056','EASTC',8,'1998-04-28 00:00:00.000','1998-05-12 00:00:00.000','1998-05-01 00:00:00.000',2,278.96,'Eastern Connection','35 King George','London',NULL,'WX3 6FW','UK');
INSERT INTO Orders  Values ('11057','NORTS',3,'1998-04-29 00:00:00.000','1998-05-27 00:00:00.000','1998-05-01 00:00:00.000',3,4.13,'North/South','South House 300 Queensbridge','London',NULL,'SW7 1RZ','UK');
INSERT INTO Orders  Values ('11058','BLAUS',9,'1998-04-29 00:00:00.000','1998-05-27 00:00:00.000',NULL,3,31.14,'Blauer See Delikatessen','Forsterstr. 57','Mannheim',NULL,'68306','Germany');
INSERT INTO Orders  Values ('11059','RICAR',2,'1998-04-29 00:00:00.000','1998-06-10 00:00:00.000',NULL,2,85.8,'Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brazil');
INSERT INTO Orders  Values ('11060','FRANS',2,'1998-04-30 00:00:00.000','1998-05-28 00:00:00.000','1998-05-04 00:00:00.000',2,10.98,'Franchi S.p.A.','Via Monte Bianco 34','Torino',NULL,'10100','Italy');
INSERT INTO Orders  Values ('11061','GREAL',4,'1998-04-30 00:00:00.000','1998-06-11 00:00:00.000',NULL,3,14.01,'Great Lakes Food Market','2732 Baker Blvd.','Eugene','OR','97403','USA');
INSERT INTO Orders  Values ('11062','REGGC',4,'1998-04-30 00:00:00.000','1998-05-28 00:00:00.000',NULL,2,29.93,'Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia',NULL,'42100','Italy');
INSERT INTO Orders  Values ('11063','HUNGO',3,'1998-04-30 00:00:00.000','1998-05-28 00:00:00.000','1998-05-06 00:00:00.000',2,81.73,'Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','Co. Cork',NULL,'Ireland');
INSERT INTO Orders  Values ('11064','SAVEA',1,'1998-05-01 00:00:00.000','1998-05-29 00:00:00.000','1998-05-04 00:00:00.000',1,30.09,'Save-a-lot Markets','187 Suffolk Ln.','Boise','ID','83720','USA');
INSERT INTO Orders  Values ('11065','LILAS',8,'1998-05-01 00:00:00.000','1998-05-29 00:00:00.000',NULL,1,12.91,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('11066','WHITC',7,'1998-05-01 00:00:00.000','1998-05-29 00:00:00.000','1998-05-04 00:00:00.000',2,44.72,'White Clover Markets','1029 - 12th Ave. S.','Seattle','WA','98124','USA');
INSERT INTO Orders  Values ('11067','DRACD',1,'1998-05-04 00:00:00.000','1998-05-18 00:00:00.000','1998-05-06 00:00:00.000',2,7.98,'Drachenblut Delikatessen','Walserweg 21','Aachen',NULL,'52066','Germany');
INSERT INTO Orders  Values ('11068','QUEEN',8,'1998-05-04 00:00:00.000','1998-06-01 00:00:00.000',NULL,2,81.75,'Queen Cozinha','Alameda dos Canrios, 891','Sao Paulo','SP','05487-020','Brazil');
INSERT INTO Orders  Values ('11069','TORTU',1,'1998-05-04 00:00:00.000','1998-06-01 00:00:00.000','1998-05-06 00:00:00.000',2,15.67,'Tortuga Restaurante','Avda. Azteca 123','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('11070','LEHMS',2,'1998-05-05 00:00:00.000','1998-06-02 00:00:00.000',NULL,1,136,'Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M.',NULL,'60528','Germany');
INSERT INTO Orders  Values ('11071','LILAS',1,'1998-05-05 00:00:00.000','1998-06-02 00:00:00.000',NULL,1,0.93,'LILA-Supermercado','Carrera 52 con Ave. Bolvar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela');
INSERT INTO Orders  Values ('11072','ERNSH',4,'1998-05-05 00:00:00.000','1998-06-02 00:00:00.000',NULL,2,258.64,'Ernst Handel','Kirchgasse 6','Graz',NULL,'8010','Austria');
INSERT INTO Orders  Values ('11073','PERIC',2,'1998-05-05 00:00:00.000','1998-06-02 00:00:00.000',NULL,2,24.95,'Pericles Comidas clsicas','Calle Dr. Jorge Cash 321','Mxico D.F.',NULL,'5033','Mexico');
INSERT INTO Orders  Values ('11074','SIMOB',7,'1998-05-06 00:00:00.000','1998-06-03 00:00:00.000',NULL,2,18.44,'Simons bistro','Vinbltet 34','Kobenhavn',NULL,'1734','Denmark');
INSERT INTO Orders  Values ('11075','RICSU',8,'1998-05-06 00:00:00.000','1998-06-03 00:00:00.000',NULL,2,6.19,'Richter Supermarkt','Starenweg 5','Genve',NULL,'1204','Switzerland');
INSERT INTO Orders  Values ('11076','BONAP',4,'1998-05-06 00:00:00.000','1998-06-03 00:00:00.000',NULL,2,38.28,'Bon app-','12, rue des Bouchers','Marseille',NULL,'13008','France');
INSERT INTO Orders  Values ('11077','RATTC',1,'1998-05-06 00:00:00.000','1998-06-03 00:00:00.000',NULL,2,8.53,'Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','NM','87110','USA');

TRUNCATE TABLE `Order Details`;
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10248, 11, 14, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10248, 42, 9.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10248, 72, 34.8, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10249, 14, 18.6, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10249, 51, 42.4, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10250, 41, 7.7, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10250, 51, 42.4, 35, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10250, 65, 16.8, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10251, 22, 16.8, 6, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10251, 57, 15.6, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10251, 65, 16.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10252, 20, 64.8, 40, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10252, 33, 2, 25, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10252, 60, 27.2, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10253, 31, 10, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10253, 39, 14.4, 42, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10253, 49, 16, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10254, 24, 3.6, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10254, 55, 19.2, 21, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10254, 74, 8, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10255, 2, 15.2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10255, 16, 13.9, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10255, 36, 15.2, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10255, 59, 44, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10256, 53, 26.2, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10256, 77, 10.4, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10257, 27, 35.1, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10257, 39, 14.4, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10257, 77, 10.4, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10258, 2, 15.2, 50, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10258, 5, 17, 65, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10258, 32, 25.6, 6, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10259, 21, 8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10259, 37, 20.8, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10260, 41, 7.7, 16, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10260, 57, 15.6, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10260, 62, 39.4, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10260, 70, 12, 21, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10261, 21, 8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10261, 35, 14.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10262, 5, 17, 12, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10262, 7, 24, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10262, 56, 30.4, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10263, 16, 13.9, 60, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10263, 24, 3.6, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10263, 30, 20.7, 60, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10263, 74, 8, 36, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10264, 2, 15.2, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10264, 41, 7.7, 25, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10265, 17, 31.2, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10265, 70, 12, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10266, 12, 30.4, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10267, 40, 14.7, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10267, 59, 44, 70, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10267, 76, 14.4, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10268, 29, 99, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10268, 72, 27.8, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10269, 33, 2, 60, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10269, 72, 27.8, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10270, 36, 15.2, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10270, 43, 36.8, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10271, 33, 2, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10272, 20, 64.8, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10272, 31, 10, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10272, 72, 27.8, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10273, 10, 24.8, 24, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10273, 31, 10, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10273, 33, 2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10273, 40, 14.7, 60, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10273, 76, 14.4, 33, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10274, 71, 17.2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10274, 72, 27.8, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10275, 24, 3.6, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10275, 59, 44, 6, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10276, 10, 24.8, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10276, 13, 4.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10277, 28, 36.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10277, 62, 39.4, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10278, 44, 15.5, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10278, 59, 44, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10278, 63, 35.1, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10278, 73, 12, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10279, 17, 31.2, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10280, 24, 3.6, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10280, 55, 19.2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10280, 75, 6.2, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10281, 19, 7.3, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10281, 24, 3.6, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10281, 35, 14.4, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10282, 30, 20.7, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10282, 57, 15.6, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10283, 15, 12.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10283, 19, 7.3, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10283, 60, 27.2, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10283, 72, 27.8, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10284, 27, 35.1, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10284, 44, 15.5, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10284, 60, 27.2, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10284, 67, 11.2, 5, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10285, 1, 14.4, 45, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10285, 40, 14.7, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10285, 53, 26.2, 36, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10286, 35, 14.4, 100, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10286, 62, 39.4, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10287, 16, 13.9, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10287, 34, 11.2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10287, 46, 9.6, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10288, 54, 5.9, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10288, 68, 10, 3, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10289, 3, 8, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10289, 64, 26.6, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10290, 5, 17, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10290, 29, 99, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10290, 49, 16, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10290, 77, 10.4, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10291, 13, 4.8, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10291, 44, 15.5, 24, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10291, 51, 42.4, 2, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10292, 20, 64.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10293, 18, 50, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10293, 24, 3.6, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10293, 63, 35.1, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10293, 75, 6.2, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10294, 1, 14.4, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10294, 17, 31.2, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10294, 43, 36.8, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10294, 60, 27.2, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10294, 75, 6.2, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10295, 56, 30.4, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10296, 11, 16.8, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10296, 16, 13.9, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10296, 69, 28.8, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10297, 39, 14.4, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10297, 72, 27.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10298, 2, 15.2, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10298, 36, 15.2, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10298, 59, 44, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10298, 62, 39.4, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10299, 19, 7.3, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10299, 70, 12, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10300, 66, 13.6, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10300, 68, 10, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10301, 40, 14.7, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10301, 56, 30.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10302, 17, 31.2, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10302, 28, 36.4, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10302, 43, 36.8, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10303, 40, 14.7, 40, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10303, 65, 16.8, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10303, 68, 10, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10304, 49, 16, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10304, 59, 44, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10304, 71, 17.2, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10305, 18, 50, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10305, 29, 99, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10305, 39, 14.4, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10306, 30, 20.7, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10306, 53, 26.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10306, 54, 5.9, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10307, 62, 39.4, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10307, 68, 10, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10308, 69, 28.8, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10308, 70, 12, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10309, 4, 17.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10309, 6, 20, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10309, 42, 11.2, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10309, 43, 36.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10309, 71, 17.2, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10310, 16, 13.9, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10310, 62, 39.4, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10311, 42, 11.2, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10311, 69, 28.8, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10312, 28, 36.4, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10312, 43, 36.8, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10312, 53, 26.2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10312, 75, 6.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10313, 36, 15.2, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10314, 32, 25.6, 40, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10314, 58, 10.6, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10314, 62, 39.4, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10315, 34, 11.2, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10315, 70, 12, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10316, 41, 7.7, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10316, 62, 39.4, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10317, 1, 14.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10318, 41, 7.7, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10318, 76, 14.4, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10319, 17, 31.2, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10319, 28, 36.4, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10319, 76, 14.4, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10320, 71, 17.2, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10321, 35, 14.4, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10322, 52, 5.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10323, 15, 12.4, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10323, 25, 11.2, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10323, 39, 14.4, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10324, 16, 13.9, 21, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10324, 35, 14.4, 70, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10324, 46, 9.6, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10324, 59, 44, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10324, 63, 35.1, 80, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10325, 6, 20, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10325, 13, 4.8, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10325, 14, 18.6, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10325, 31, 10, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10325, 72, 27.8, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10326, 4, 17.6, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10326, 57, 15.6, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10326, 75, 6.2, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10327, 2, 15.2, 25, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10327, 11, 16.8, 50, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10327, 30, 20.7, 35, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10327, 58, 10.6, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10328, 59, 44, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10328, 65, 16.8, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10328, 68, 10, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10329, 19, 7.3, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10329, 30, 20.7, 8, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10329, 38, 210.8, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10329, 56, 30.4, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10330, 26, 24.9, 50, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10330, 72, 27.8, 25, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10331, 54, 5.9, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10332, 18, 50, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10332, 42, 11.2, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10332, 47, 7.6, 16, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10333, 14, 18.6, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10333, 21, 8, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10333, 71, 17.2, 40, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10334, 52, 5.6, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10334, 68, 10, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10335, 2, 15.2, 7, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10335, 31, 10, 25, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10335, 32, 25.6, 6, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10335, 51, 42.4, 48, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10336, 4, 17.6, 18, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10337, 23, 7.2, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10337, 26, 24.9, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10337, 36, 15.2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10337, 37, 20.8, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10337, 72, 27.8, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10338, 17, 31.2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10338, 30, 20.7, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10339, 4, 17.6, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10339, 17, 31.2, 70, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10339, 62, 39.4, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10340, 18, 50, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10340, 41, 7.7, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10340, 43, 36.8, 40, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10341, 33, 2, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10341, 59, 44, 9, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10342, 2, 15.2, 24, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10342, 31, 10, 56, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10342, 36, 15.2, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10342, 55, 19.2, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10343, 64, 26.6, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10343, 68, 10, 4, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10343, 76, 14.4, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10344, 4, 17.6, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10344, 8, 32, 70, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10345, 8, 32, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10345, 19, 7.3, 80, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10345, 42, 11.2, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10346, 17, 31.2, 36, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10346, 56, 30.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10347, 25, 11.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10347, 39, 14.4, 50, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10347, 40, 14.7, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10347, 75, 6.2, 6, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10348, 1, 14.4, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10348, 23, 7.2, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10349, 54, 5.9, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10350, 50, 13, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10350, 69, 28.8, 18, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10351, 38, 210.8, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10351, 41, 7.7, 13, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10351, 44, 15.5, 77, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10351, 65, 16.8, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10352, 24, 3.6, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10352, 54, 5.9, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10353, 11, 16.8, 12, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10353, 38, 210.8, 50, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10354, 1, 14.4, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10354, 29, 99, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10355, 24, 3.6, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10355, 57, 15.6, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10356, 31, 10, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10356, 55, 19.2, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10356, 69, 28.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10357, 10, 24.8, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10357, 26, 24.9, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10357, 60, 27.2, 8, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10358, 24, 3.6, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10358, 34, 11.2, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10358, 36, 15.2, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10359, 16, 13.9, 56, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10359, 31, 10, 70, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10359, 60, 27.2, 80, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10360, 28, 36.4, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10360, 29, 99, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10360, 38, 210.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10360, 49, 16, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10360, 54, 5.9, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10361, 39, 14.4, 54, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10361, 60, 27.2, 55, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10362, 25, 11.2, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10362, 51, 42.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10362, 54, 5.9, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10363, 31, 10, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10363, 75, 6.2, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10363, 76, 14.4, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10364, 69, 28.8, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10364, 71, 17.2, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10365, 11, 16.8, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10366, 65, 16.8, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10366, 77, 10.4, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10367, 34, 11.2, 36, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10367, 54, 5.9, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10367, 65, 16.8, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10367, 77, 10.4, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10368, 21, 8, 5, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10368, 28, 36.4, 13, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10368, 57, 15.6, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10368, 64, 26.6, 35, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10369, 29, 99, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10369, 56, 30.4, 18, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10370, 1, 14.4, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10370, 64, 26.6, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10370, 74, 8, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10371, 36, 15.2, 6, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10372, 20, 64.8, 12, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10372, 38, 210.8, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10372, 60, 27.2, 70, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10372, 72, 27.8, 42, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10373, 58, 10.6, 80, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10373, 71, 17.2, 50, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10374, 31, 10, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10374, 58, 10.6, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10375, 14, 18.6, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10375, 54, 5.9, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10376, 31, 10, 42, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10377, 28, 36.4, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10377, 39, 14.4, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10378, 71, 17.2, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10379, 41, 7.7, 8, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10379, 63, 35.1, 16, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10379, 65, 16.8, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10380, 30, 20.7, 18, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10380, 53, 26.2, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10380, 60, 27.2, 6, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10380, 70, 12, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10381, 74, 8, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10382, 5, 17, 32, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10382, 18, 50, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10382, 29, 99, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10382, 33, 2, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10382, 74, 8, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10383, 13, 4.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10383, 50, 13, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10383, 56, 30.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10384, 20, 64.8, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10384, 60, 27.2, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10385, 7, 24, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10385, 60, 27.2, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10385, 68, 10, 8, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10386, 24, 3.6, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10386, 34, 11.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10387, 24, 3.6, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10387, 28, 36.4, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10387, 59, 44, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10387, 71, 17.2, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10388, 45, 7.6, 15, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10388, 52, 5.6, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10388, 53, 26.2, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10389, 10, 24.8, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10389, 55, 19.2, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10389, 62, 39.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10389, 70, 12, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10390, 31, 10, 60, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10390, 35, 14.4, 40, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10390, 46, 9.6, 45, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10390, 72, 27.8, 24, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10391, 13, 4.8, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10392, 69, 28.8, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10393, 2, 15.2, 25, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10393, 14, 18.6, 42, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10393, 25, 11.2, 7, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10393, 26, 24.9, 70, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10393, 31, 10, 32, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10394, 13, 4.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10394, 62, 39.4, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10395, 46, 9.6, 28, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10395, 53, 26.2, 70, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10395, 69, 28.8, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10396, 23, 7.2, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10396, 71, 17.2, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10396, 72, 27.8, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10397, 21, 8, 10, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10397, 51, 42.4, 18, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10398, 35, 14.4, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10398, 55, 19.2, 120, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10399, 68, 10, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10399, 71, 17.2, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10399, 76, 14.4, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10399, 77, 10.4, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10400, 29, 99, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10400, 35, 14.4, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10400, 49, 16, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10401, 30, 20.7, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10401, 56, 30.4, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10401, 65, 16.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10401, 71, 17.2, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10402, 23, 7.2, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10402, 63, 35.1, 65, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10403, 16, 13.9, 21, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10403, 48, 10.2, 70, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10404, 26, 24.9, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10404, 42, 11.2, 40, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10404, 49, 16, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10405, 3, 8, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10406, 1, 14.4, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10406, 21, 8, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10406, 28, 36.4, 42, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10406, 36, 15.2, 5, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10406, 40, 14.7, 2, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10407, 11, 16.8, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10407, 69, 28.8, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10407, 71, 17.2, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10408, 37, 20.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10408, 54, 5.9, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10408, 62, 39.4, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10409, 14, 18.6, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10409, 21, 8, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10410, 33, 2, 49, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10410, 59, 44, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10411, 41, 7.7, 25, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10411, 44, 15.5, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10411, 59, 44, 9, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10412, 14, 18.6, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10413, 1, 14.4, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10413, 62, 39.4, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10413, 76, 14.4, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10414, 19, 7.3, 18, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10414, 33, 2, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10415, 17, 31.2, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10415, 33, 2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10416, 19, 7.3, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10416, 53, 26.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10416, 57, 15.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10417, 38, 210.8, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10417, 46, 9.6, 2, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10417, 68, 10, 36, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10417, 77, 10.4, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10418, 2, 15.2, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10418, 47, 7.6, 55, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10418, 61, 22.8, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10418, 74, 8, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10419, 60, 27.2, 60, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10419, 69, 28.8, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10420, 9, 77.6, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10420, 13, 4.8, 2, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10420, 70, 12, 8, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10420, 73, 12, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10421, 19, 7.3, 4, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10421, 26, 24.9, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10421, 53, 26.2, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10421, 77, 10.4, 10, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10422, 26, 24.9, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10423, 31, 10, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10423, 59, 44, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10424, 35, 14.4, 60, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10424, 38, 210.8, 49, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10424, 68, 10, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10425, 55, 19.2, 10, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10425, 76, 14.4, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10426, 56, 30.4, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10426, 64, 26.6, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10427, 14, 18.6, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10428, 46, 9.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10429, 50, 13, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10429, 63, 35.1, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10430, 17, 31.2, 45, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10430, 21, 8, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10430, 56, 30.4, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10430, 59, 44, 70, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10431, 17, 31.2, 50, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10431, 40, 14.7, 50, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10431, 47, 7.6, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10432, 26, 24.9, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10432, 54, 5.9, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10433, 56, 30.4, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10434, 11, 16.8, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10434, 76, 14.4, 18, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10435, 2, 15.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10435, 22, 16.8, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10435, 72, 27.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10436, 46, 9.6, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10436, 56, 30.4, 40, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10436, 64, 26.6, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10436, 75, 6.2, 24, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10437, 53, 26.2, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10438, 19, 7.3, 15, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10438, 34, 11.2, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10438, 57, 15.6, 15, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10439, 12, 30.4, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10439, 16, 13.9, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10439, 64, 26.6, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10439, 74, 8, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10440, 2, 15.2, 45, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10440, 16, 13.9, 49, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10440, 29, 99, 24, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10440, 61, 22.8, 90, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10441, 27, 35.1, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10442, 11, 16.8, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10442, 54, 5.9, 80, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10442, 66, 13.6, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10443, 11, 16.8, 6, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10443, 28, 36.4, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10444, 17, 31.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10444, 26, 24.9, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10444, 35, 14.4, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10444, 41, 7.7, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10445, 39, 14.4, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10445, 54, 5.9, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10446, 19, 7.3, 12, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10446, 24, 3.6, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10446, 31, 10, 3, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10446, 52, 5.6, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10447, 19, 7.3, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10447, 65, 16.8, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10447, 71, 17.2, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10448, 26, 24.9, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10448, 40, 14.7, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10449, 10, 24.8, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10449, 52, 5.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10449, 62, 39.4, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10450, 10, 24.8, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10450, 54, 5.9, 6, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10451, 55, 19.2, 120, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10451, 64, 26.6, 35, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10451, 65, 16.8, 28, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10451, 77, 10.4, 55, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10452, 28, 36.4, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10452, 44, 15.5, 100, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10453, 48, 10.2, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10453, 70, 12, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10454, 16, 13.9, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10454, 33, 2, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10454, 46, 9.6, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10455, 39, 14.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10455, 53, 26.2, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10455, 61, 22.8, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10455, 71, 17.2, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10456, 21, 8, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10456, 49, 16, 21, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10457, 59, 44, 36, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10458, 26, 24.9, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10458, 28, 36.4, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10458, 43, 36.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10458, 56, 30.4, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10458, 71, 17.2, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10459, 7, 24, 16, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10459, 46, 9.6, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10459, 72, 27.8, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10460, 68, 10, 21, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10460, 75, 6.2, 4, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10461, 21, 8, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10461, 30, 20.7, 28, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10461, 55, 19.2, 60, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10462, 13, 4.8, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10462, 23, 7.2, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10463, 19, 7.3, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10463, 42, 11.2, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10464, 4, 17.6, 16, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10464, 43, 36.8, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10464, 56, 30.4, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10464, 60, 27.2, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10465, 24, 3.6, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10465, 29, 99, 18, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10465, 40, 14.7, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10465, 45, 7.6, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10465, 50, 13, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10466, 11, 16.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10466, 46, 9.6, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10467, 24, 3.6, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10467, 25, 11.2, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10468, 30, 20.7, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10468, 43, 36.8, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10469, 2, 15.2, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10469, 16, 13.9, 35, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10469, 44, 15.5, 2, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10470, 18, 50, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10470, 23, 7.2, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10470, 64, 26.6, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10471, 7, 24, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10471, 56, 30.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10472, 24, 3.6, 80, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10472, 51, 42.4, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10473, 33, 2, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10473, 71, 17.2, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10474, 14, 18.6, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10474, 28, 36.4, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10474, 40, 14.7, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10474, 75, 6.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10475, 31, 10, 35, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10475, 66, 13.6, 60, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10475, 76, 14.4, 42, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10476, 55, 19.2, 2, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10476, 70, 12, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10477, 1, 14.4, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10477, 21, 8, 21, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10477, 39, 14.4, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10478, 10, 24.8, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10479, 38, 210.8, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10479, 53, 26.2, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10479, 59, 44, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10479, 64, 26.6, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10480, 47, 7.6, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10480, 59, 44, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10481, 49, 16, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10481, 60, 27.2, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10482, 40, 14.7, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10483, 34, 11.2, 35, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10483, 77, 10.4, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10484, 21, 8, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10484, 40, 14.7, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10484, 51, 42.4, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10485, 2, 15.2, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10485, 3, 8, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10485, 55, 19.2, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10485, 70, 12, 60, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10486, 11, 16.8, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10486, 51, 42.4, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10486, 74, 8, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10487, 19, 7.3, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10487, 26, 24.9, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10487, 54, 5.9, 24, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10488, 59, 44, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10488, 73, 12, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10489, 11, 16.8, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10489, 16, 13.9, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10490, 59, 44, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10490, 68, 10, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10490, 75, 6.2, 36, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10491, 44, 15.5, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10491, 77, 10.4, 7, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10492, 25, 11.2, 60, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10492, 42, 11.2, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10493, 65, 16.8, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10493, 66, 13.6, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10493, 69, 28.8, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10494, 56, 30.4, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10495, 23, 7.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10495, 41, 7.7, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10495, 77, 10.4, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10496, 31, 10, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10497, 56, 30.4, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10497, 72, 27.8, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10497, 77, 10.4, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10498, 24, 4.5, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10498, 40, 18.4, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10498, 42, 14, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10499, 28, 45.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10499, 49, 20, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10500, 15, 15.5, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10500, 28, 45.6, 8, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10501, 54, 7.45, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10502, 45, 9.5, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10502, 53, 32.8, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10502, 67, 14, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10503, 14, 23.25, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10503, 65, 21.05, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10504, 2, 19, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10504, 21, 10, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10504, 53, 32.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10504, 61, 28.5, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10505, 62, 49.3, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10506, 25, 14, 18, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10506, 70, 15, 14, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10507, 43, 46, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10507, 48, 12.75, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10508, 13, 6, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10508, 39, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10509, 28, 45.6, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10510, 29, 123.79, 36, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10510, 75, 7.75, 36, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10511, 4, 22, 50, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10511, 7, 30, 50, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10511, 8, 40, 10, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10512, 24, 4.5, 10, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10512, 46, 12, 9, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10512, 47, 9.5, 6, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10512, 60, 34, 12, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10513, 21, 10, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10513, 32, 32, 50, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10513, 61, 28.5, 15, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10514, 20, 81, 39, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10514, 28, 45.6, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10514, 56, 38, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10514, 65, 21.05, 39, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10514, 75, 7.75, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10515, 9, 97, 16, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10515, 16, 17.45, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10515, 27, 43.9, 120, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10515, 33, 2.5, 16, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10515, 60, 34, 84, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10516, 18, 62.5, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10516, 41, 9.65, 80, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10516, 42, 14, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10517, 52, 7, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10517, 59, 55, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10517, 70, 15, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10518, 24, 4.5, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10518, 38, 263.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10518, 44, 19.45, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10519, 10, 31, 16, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10519, 56, 38, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10519, 60, 34, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10520, 24, 4.5, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10520, 53, 32.8, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10521, 35, 18, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10521, 41, 9.65, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10521, 68, 12.5, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10522, 1, 18, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10522, 8, 40, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10522, 30, 25.89, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10522, 40, 18.4, 25, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10523, 17, 39, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10523, 20, 81, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10523, 37, 26, 18, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10523, 41, 9.65, 6, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10524, 10, 31, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10524, 30, 25.89, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10524, 43, 46, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10524, 54, 7.45, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10525, 36, 19, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10525, 40, 18.4, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10526, 1, 18, 8, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10526, 13, 6, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10526, 56, 38, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10527, 4, 22, 50, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10527, 36, 19, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10528, 11, 21, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10528, 33, 2.5, 8, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10528, 72, 34.8, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10529, 55, 24, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10529, 68, 12.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10529, 69, 36, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10530, 17, 39, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10530, 43, 46, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10530, 61, 28.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10530, 76, 18, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10531, 59, 55, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10532, 30, 25.89, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10532, 66, 17, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10533, 4, 22, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10533, 72, 34.8, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10533, 73, 15, 24, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10534, 30, 25.89, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10534, 40, 18.4, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10534, 54, 7.45, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10535, 11, 21, 50, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10535, 40, 18.4, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10535, 57, 19.5, 5, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10535, 59, 55, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10536, 12, 38, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10536, 31, 12.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10536, 33, 2.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10536, 60, 34, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10537, 31, 12.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10537, 51, 53, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10537, 58, 13.25, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10537, 72, 34.8, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10537, 73, 15, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10538, 70, 15, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10538, 72, 34.8, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10539, 13, 6, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10539, 21, 10, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10539, 33, 2.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10539, 49, 20, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10540, 3, 10, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10540, 26, 31.23, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10540, 38, 263.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10540, 68, 12.5, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10541, 24, 4.5, 35, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10541, 38, 263.5, 4, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10541, 65, 21.05, 36, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10541, 71, 21.5, 9, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10542, 11, 21, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10542, 54, 7.45, 24, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10543, 12, 38, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10543, 23, 9, 70, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10544, 28, 45.6, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10544, 67, 14, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10545, 11, 21, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10546, 7, 30, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10546, 35, 18, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10546, 62, 49.3, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10547, 32, 32, 24, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10547, 36, 19, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10548, 34, 14, 10, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10548, 41, 9.65, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10549, 31, 12.5, 55, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10549, 45, 9.5, 100, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10549, 51, 53, 48, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10550, 17, 39, 8, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10550, 19, 9.2, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10550, 21, 10, 6, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10550, 61, 28.5, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10551, 16, 17.45, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10551, 35, 18, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10551, 44, 19.45, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10552, 69, 36, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10552, 75, 7.75, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10553, 11, 21, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10553, 16, 17.45, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10553, 22, 21, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10553, 31, 12.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10553, 35, 18, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10554, 16, 17.45, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10554, 23, 9, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10554, 62, 49.3, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10554, 77, 13, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10555, 14, 23.25, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10555, 19, 9.2, 35, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10555, 24, 4.5, 18, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10555, 51, 53, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10555, 56, 38, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10556, 72, 34.8, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10557, 64, 33.25, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10557, 75, 7.75, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10558, 47, 9.5, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10558, 51, 53, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10558, 52, 7, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10558, 53, 32.8, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10558, 73, 15, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10559, 41, 9.65, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10559, 55, 24, 18, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10560, 30, 25.89, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10560, 62, 49.3, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10561, 44, 19.45, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10561, 51, 53, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10562, 33, 2.5, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10562, 62, 49.3, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10563, 36, 19, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10563, 52, 7, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10564, 17, 39, 16, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10564, 31, 12.5, 6, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10564, 55, 24, 25, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10565, 24, 4.5, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10565, 64, 33.25, 18, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10566, 11, 21, 35, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10566, 18, 62.5, 18, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10566, 76, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10567, 31, 12.5, 60, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10567, 51, 53, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10567, 59, 55, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10568, 10, 31, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10569, 31, 12.5, 35, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10569, 76, 18, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10570, 11, 21, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10570, 56, 38, 60, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10571, 14, 23.25, 11, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10571, 42, 14, 28, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10572, 16, 17.45, 12, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10572, 32, 32, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10572, 40, 18.4, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10572, 75, 7.75, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10573, 17, 39, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10573, 34, 14, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10573, 53, 32.8, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10574, 33, 2.5, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10574, 40, 18.4, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10574, 62, 49.3, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10574, 64, 33.25, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10575, 59, 55, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10575, 63, 43.9, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10575, 72, 34.8, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10575, 76, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10576, 1, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10576, 31, 12.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10576, 44, 19.45, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10577, 39, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10577, 75, 7.75, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10577, 77, 13, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10578, 35, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10578, 57, 19.5, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10579, 15, 15.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10579, 75, 7.75, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10580, 14, 23.25, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10580, 41, 9.65, 9, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10580, 65, 21.05, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10581, 75, 7.75, 50, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10582, 57, 19.5, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10582, 76, 18, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10583, 29, 123.79, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10583, 60, 34, 24, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10583, 69, 36, 10, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10584, 31, 12.5, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10585, 47, 9.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10586, 52, 7, 4, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10587, 26, 31.23, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10587, 35, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10587, 77, 13, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10588, 18, 62.5, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10588, 42, 14, 100, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10589, 35, 18, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10590, 1, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10590, 77, 13, 60, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10591, 3, 10, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10591, 7, 30, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10591, 54, 7.45, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10592, 15, 15.5, 25, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10592, 26, 31.23, 5, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10593, 20, 81, 21, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10593, 69, 36, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10593, 76, 18, 4, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10594, 52, 7, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10594, 58, 13.25, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10595, 35, 18, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10595, 61, 28.5, 120, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10595, 69, 36, 65, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10596, 56, 38, 5, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10596, 63, 43.9, 24, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10596, 75, 7.75, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10597, 24, 4.5, 35, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10597, 57, 19.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10597, 65, 21.05, 12, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10598, 27, 43.9, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10598, 71, 21.5, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10599, 62, 49.3, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10600, 54, 7.45, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10600, 73, 15, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10601, 13, 6, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10601, 59, 55, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10602, 77, 13, 5, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10603, 22, 21, 48, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10603, 49, 20, 25, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10604, 48, 12.75, 6, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10604, 76, 18, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10605, 16, 17.45, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10605, 59, 55, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10605, 60, 34, 70, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10605, 71, 21.5, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10606, 4, 22, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10606, 55, 24, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10606, 62, 49.3, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10607, 7, 30, 45, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10607, 17, 39, 100, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10607, 33, 2.5, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10607, 40, 18.4, 42, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10607, 72, 34.8, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10608, 56, 38, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10609, 1, 18, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10609, 10, 31, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10609, 21, 10, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10610, 36, 19, 21, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10611, 1, 18, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10611, 2, 19, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10611, 60, 34, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10612, 10, 31, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10612, 36, 19, 55, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10612, 49, 20, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10612, 60, 34, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10612, 76, 18, 80, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10613, 13, 6, 8, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10613, 75, 7.75, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10614, 11, 21, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10614, 21, 10, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10614, 39, 18, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10615, 55, 24, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10616, 38, 263.5, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10616, 56, 38, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10616, 70, 15, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10616, 71, 21.5, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10617, 59, 55, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10618, 6, 25, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10618, 56, 38, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10618, 68, 12.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10619, 21, 10, 42, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10619, 22, 21, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10620, 24, 4.5, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10620, 52, 7, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10621, 19, 9.2, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10621, 23, 9, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10621, 70, 15, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10621, 71, 21.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10622, 2, 19, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10622, 68, 12.5, 18, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10623, 14, 23.25, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10623, 19, 9.2, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10623, 21, 10, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10623, 24, 4.5, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10623, 35, 18, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10624, 28, 45.6, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10624, 29, 123.79, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10624, 44, 19.45, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10625, 14, 23.25, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10625, 42, 14, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10625, 60, 34, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10626, 53, 32.8, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10626, 60, 34, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10626, 71, 21.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10627, 62, 49.3, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10627, 73, 15, 35, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10628, 1, 18, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10629, 29, 123.79, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10629, 64, 33.25, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10630, 55, 24, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10630, 76, 18, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10631, 75, 7.75, 8, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10632, 2, 19, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10632, 33, 2.5, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10633, 12, 38, 36, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10633, 13, 6, 13, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10633, 26, 31.23, 35, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10633, 62, 49.3, 80, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10634, 7, 30, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10634, 18, 62.5, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10634, 51, 53, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10634, 75, 7.75, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10635, 4, 22, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10635, 5, 21.35, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10635, 22, 21, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10636, 4, 22, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10636, 58, 13.25, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10637, 11, 21, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10637, 50, 16.25, 25, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10637, 56, 38, 60, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10638, 45, 9.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10638, 65, 21.05, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10638, 72, 34.8, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10639, 18, 62.5, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10640, 69, 36, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10640, 70, 15, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10641, 2, 19, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10641, 40, 18.4, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10642, 21, 10, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10642, 61, 28.5, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10643, 28, 45.6, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10643, 39, 18, 21, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10643, 46, 12, 2, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10644, 18, 62.5, 4, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10644, 43, 46, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10644, 46, 12, 21, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10645, 18, 62.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10645, 36, 19, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10646, 1, 18, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10646, 10, 31, 18, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10646, 71, 21.5, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10646, 77, 13, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10647, 19, 9.2, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10647, 39, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10648, 22, 21, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10648, 24, 4.5, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10649, 28, 45.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10649, 72, 34.8, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10650, 30, 25.89, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10650, 53, 32.8, 25, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10650, 54, 7.45, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10651, 19, 9.2, 12, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10651, 22, 21, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10652, 30, 25.89, 2, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10652, 42, 14, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10653, 16, 17.45, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10653, 60, 34, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10654, 4, 22, 12, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10654, 39, 18, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10654, 54, 7.45, 6, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10655, 41, 9.65, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10656, 14, 23.25, 3, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10656, 44, 19.45, 28, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10656, 47, 9.5, 6, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10657, 15, 15.5, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10657, 41, 9.65, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10657, 46, 12, 45, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10657, 47, 9.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10657, 56, 38, 45, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10657, 60, 34, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10658, 21, 10, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10658, 40, 18.4, 70, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10658, 60, 34, 55, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10658, 77, 13, 70, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10659, 31, 12.5, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10659, 40, 18.4, 24, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10659, 70, 15, 40, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10660, 20, 81, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10661, 39, 18, 3, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10661, 58, 13.25, 49, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10662, 68, 12.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10663, 40, 18.4, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10663, 42, 14, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10663, 51, 53, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10664, 10, 31, 24, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10664, 56, 38, 12, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10664, 65, 21.05, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10665, 51, 53, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10665, 59, 55, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10665, 76, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10666, 29, 123.79, 36, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10666, 65, 21.05, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10667, 69, 36, 45, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10667, 71, 21.5, 14, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10668, 31, 12.5, 8, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10668, 55, 24, 4, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10668, 64, 33.25, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10669, 36, 19, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10670, 23, 9, 32, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10670, 46, 12, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10670, 67, 14, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10670, 73, 15, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10670, 75, 7.75, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10671, 16, 17.45, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10671, 62, 49.3, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10671, 65, 21.05, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10672, 38, 263.5, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10672, 71, 21.5, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10673, 16, 17.45, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10673, 42, 14, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10673, 43, 46, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10674, 23, 9, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10675, 14, 23.25, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10675, 53, 32.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10675, 58, 13.25, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10676, 10, 31, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10676, 19, 9.2, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10676, 44, 19.45, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10677, 26, 31.23, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10677, 33, 2.5, 8, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10678, 12, 38, 100, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10678, 33, 2.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10678, 41, 9.65, 120, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10678, 54, 7.45, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10679, 59, 55, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10680, 16, 17.45, 50, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10680, 31, 12.5, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10680, 42, 14, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10681, 19, 9.2, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10681, 21, 10, 12, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10681, 64, 33.25, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10682, 33, 2.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10682, 66, 17, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10682, 75, 7.75, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10683, 52, 7, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10684, 40, 18.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10684, 47, 9.5, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10684, 60, 34, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10685, 10, 31, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10685, 41, 9.65, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10685, 47, 9.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10686, 17, 39, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10686, 26, 31.23, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10687, 9, 97, 50, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10687, 29, 123.79, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10687, 36, 19, 6, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10688, 10, 31, 18, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10688, 28, 45.6, 60, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10688, 34, 14, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10689, 1, 18, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10690, 56, 38, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10690, 77, 13, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10691, 1, 18, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10691, 29, 123.79, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10691, 43, 46, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10691, 44, 19.45, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10691, 62, 49.3, 48, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10692, 63, 43.9, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10693, 9, 97, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10693, 54, 7.45, 60, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10693, 69, 36, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10693, 73, 15, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10694, 7, 30, 90, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10694, 59, 55, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10694, 70, 15, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10695, 8, 40, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10695, 12, 38, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10695, 24, 4.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10696, 17, 39, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10696, 46, 12, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10697, 19, 9.2, 7, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10697, 35, 18, 9, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10697, 58, 13.25, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10697, 70, 15, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10698, 11, 21, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10698, 17, 39, 8, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10698, 29, 123.79, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10698, 65, 21.05, 65, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10698, 70, 15, 8, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10699, 47, 9.5, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10700, 1, 18, 5, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10700, 34, 14, 12, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10700, 68, 12.5, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10700, 71, 21.5, 60, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10701, 59, 55, 42, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10701, 71, 21.5, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10701, 76, 18, 35, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10702, 3, 10, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10702, 76, 18, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10703, 2, 19, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10703, 59, 55, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10703, 73, 15, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10704, 4, 22, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10704, 24, 4.5, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10704, 48, 12.75, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10705, 31, 12.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10705, 32, 32, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10706, 16, 17.45, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10706, 43, 46, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10706, 59, 55, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10707, 55, 24, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10707, 57, 19.5, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10707, 70, 15, 28, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10708, 5, 21.35, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10708, 36, 19, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10709, 8, 40, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10709, 51, 53, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10709, 60, 34, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10710, 19, 9.2, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10710, 47, 9.5, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10711, 19, 9.2, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10711, 41, 9.65, 42, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10711, 53, 32.8, 120, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10712, 53, 32.8, 3, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10712, 56, 38, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10713, 10, 31, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10713, 26, 31.23, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10713, 45, 9.5, 110, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10713, 46, 12, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10714, 2, 19, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10714, 17, 39, 27, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10714, 47, 9.5, 50, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10714, 56, 38, 18, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10714, 58, 13.25, 12, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10715, 10, 31, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10715, 71, 21.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10716, 21, 10, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10716, 51, 53, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10716, 61, 28.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10717, 21, 10, 32, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10717, 54, 7.45, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10717, 69, 36, 25, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10718, 12, 38, 36, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10718, 16, 17.45, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10718, 36, 19, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10718, 62, 49.3, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10719, 18, 62.5, 12, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10719, 30, 25.89, 3, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10719, 54, 7.45, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10720, 35, 18, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10720, 71, 21.5, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10721, 44, 19.45, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10722, 2, 19, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10722, 31, 12.5, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10722, 68, 12.5, 45, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10722, 75, 7.75, 42, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10723, 26, 31.23, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10724, 10, 31, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10724, 61, 28.5, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10725, 41, 9.65, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10725, 52, 7, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10725, 55, 24, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10726, 4, 22, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10726, 11, 21, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10727, 17, 39, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10727, 56, 38, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10727, 59, 55, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10728, 30, 25.89, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10728, 40, 18.4, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10728, 55, 24, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10728, 60, 34, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10729, 1, 18, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10729, 21, 10, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10729, 50, 16.25, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10730, 16, 17.45, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10730, 31, 12.5, 3, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10730, 65, 21.05, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10731, 21, 10, 40, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10731, 51, 53, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10732, 76, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10733, 14, 23.25, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10733, 28, 45.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10733, 52, 7, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10734, 6, 25, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10734, 30, 25.89, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10734, 76, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10735, 61, 28.5, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10735, 77, 13, 2, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10736, 65, 21.05, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10736, 75, 7.75, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10737, 13, 6, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10737, 41, 9.65, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10738, 16, 17.45, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10739, 36, 19, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10739, 52, 7, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10740, 28, 45.6, 5, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10740, 35, 18, 35, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10740, 45, 9.5, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10740, 56, 38, 14, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10741, 2, 19, 15, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10742, 3, 10, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10742, 60, 34, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10742, 72, 34.8, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10743, 46, 12, 28, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10744, 40, 18.4, 50, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10745, 18, 62.5, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10745, 44, 19.45, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10745, 59, 55, 45, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10745, 72, 34.8, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10746, 13, 6, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10746, 42, 14, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10746, 62, 49.3, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10746, 69, 36, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10747, 31, 12.5, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10747, 41, 9.65, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10747, 63, 43.9, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10747, 69, 36, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10748, 23, 9, 44, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10748, 40, 18.4, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10748, 56, 38, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10749, 56, 38, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10749, 59, 55, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10749, 76, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10750, 14, 23.25, 5, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10750, 45, 9.5, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10750, 59, 55, 25, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10751, 26, 31.23, 12, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10751, 30, 25.89, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10751, 50, 16.25, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10751, 73, 15, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10752, 1, 18, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10752, 69, 36, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10753, 45, 9.5, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10753, 74, 10, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10754, 40, 18.4, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10755, 47, 9.5, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10755, 56, 38, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10755, 57, 19.5, 14, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10755, 69, 36, 25, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10756, 18, 62.5, 21, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10756, 36, 19, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10756, 68, 12.5, 6, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10756, 69, 36, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10757, 34, 14, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10757, 59, 55, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10757, 62, 49.3, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10757, 64, 33.25, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10758, 26, 31.23, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10758, 52, 7, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10758, 70, 15, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10759, 32, 32, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10760, 25, 14, 12, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10760, 27, 43.9, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10760, 43, 46, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10761, 25, 14, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10761, 75, 7.75, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10762, 39, 18, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10762, 47, 9.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10762, 51, 53, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10762, 56, 38, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10763, 21, 10, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10763, 22, 21, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10763, 24, 4.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10764, 3, 10, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10764, 39, 18, 130, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10765, 65, 21.05, 80, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10766, 2, 19, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10766, 7, 30, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10766, 68, 12.5, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10767, 42, 14, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10768, 22, 21, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10768, 31, 12.5, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10768, 60, 34, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10768, 71, 21.5, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10769, 41, 9.65, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10769, 52, 7, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10769, 61, 28.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10769, 62, 49.3, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10770, 11, 21, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10771, 71, 21.5, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10772, 29, 123.79, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10772, 59, 55, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10773, 17, 39, 33, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10773, 31, 12.5, 70, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10773, 75, 7.75, 7, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10774, 31, 12.5, 2, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10774, 66, 17, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10775, 10, 31, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10775, 67, 14, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10776, 31, 12.5, 16, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10776, 42, 14, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10776, 45, 9.5, 27, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10776, 51, 53, 120, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10777, 42, 14, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10778, 41, 9.65, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10779, 16, 17.45, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10779, 62, 49.3, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10780, 70, 15, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10780, 77, 13, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10781, 54, 7.45, 3, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10781, 56, 38, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10781, 74, 10, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10782, 31, 12.5, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10783, 31, 12.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10783, 38, 263.5, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10784, 36, 19, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10784, 39, 18, 2, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10784, 72, 34.8, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10785, 10, 31, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10785, 75, 7.75, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10786, 8, 40, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10786, 30, 25.89, 15, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10786, 75, 7.75, 42, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10787, 2, 19, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10787, 29, 123.79, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10788, 19, 9.2, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10788, 75, 7.75, 40, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10789, 18, 62.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10789, 35, 18, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10789, 63, 43.9, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10789, 68, 12.5, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10790, 7, 30, 3, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10790, 56, 38, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10791, 29, 123.79, 14, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10791, 41, 9.65, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10792, 2, 19, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10792, 54, 7.45, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10792, 68, 12.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10793, 41, 9.65, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10793, 52, 7, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10794, 14, 23.25, 15, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10794, 54, 7.45, 6, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10795, 16, 17.45, 65, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10795, 17, 39, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10796, 26, 31.23, 21, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10796, 44, 19.45, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10796, 64, 33.25, 35, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10796, 69, 36, 24, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10797, 11, 21, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10798, 62, 49.3, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10798, 72, 34.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10799, 13, 6, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10799, 24, 4.5, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10799, 59, 55, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10800, 11, 21, 50, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10800, 51, 53, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10800, 54, 7.45, 7, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10801, 17, 39, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10801, 29, 123.79, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10802, 30, 25.89, 25, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10802, 51, 53, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10802, 55, 24, 60, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10802, 62, 49.3, 5, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10803, 19, 9.2, 24, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10803, 25, 14, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10803, 59, 55, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10804, 10, 31, 36, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10804, 28, 45.6, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10804, 49, 20, 4, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10805, 34, 14, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10805, 38, 263.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10806, 2, 19, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10806, 65, 21.05, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10806, 74, 10, 15, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10807, 40, 18.4, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10808, 56, 38, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10808, 76, 18, 50, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10809, 52, 7, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10810, 13, 6, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10810, 25, 14, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10810, 70, 15, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10811, 19, 9.2, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10811, 23, 9, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10811, 40, 18.4, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10812, 31, 12.5, 16, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10812, 72, 34.8, 40, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10812, 77, 13, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10813, 2, 19, 12, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10813, 46, 12, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10814, 41, 9.65, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10814, 43, 46, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10814, 48, 12.75, 8, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10814, 61, 28.5, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10815, 33, 2.5, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10816, 38, 263.5, 30, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10816, 62, 49.3, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10817, 26, 31.23, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10817, 38, 263.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10817, 40, 18.4, 60, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10817, 62, 49.3, 25, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10818, 32, 32, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10818, 41, 9.65, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10819, 43, 46, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10819, 75, 7.75, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10820, 56, 38, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10821, 35, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10821, 51, 53, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10822, 62, 49.3, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10822, 70, 15, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10823, 11, 21, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10823, 57, 19.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10823, 59, 55, 40, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10823, 77, 13, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10824, 41, 9.65, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10824, 70, 15, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10825, 26, 31.23, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10825, 53, 32.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10826, 31, 12.5, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10826, 57, 19.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10827, 10, 31, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10827, 39, 18, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10828, 20, 81, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10828, 38, 263.5, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10829, 2, 19, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10829, 8, 40, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10829, 13, 6, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10829, 60, 34, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10830, 6, 25, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10830, 39, 18, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10830, 60, 34, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10830, 68, 12.5, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10831, 19, 9.2, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10831, 35, 18, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10831, 38, 263.5, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10831, 43, 46, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10832, 13, 6, 3, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10832, 25, 14, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10832, 44, 19.45, 16, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10832, 64, 33.25, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10833, 7, 30, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10833, 31, 12.5, 9, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10833, 53, 32.8, 9, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10834, 29, 123.79, 8, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10834, 30, 25.89, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10835, 59, 55, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10835, 77, 13, 2, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10836, 22, 21, 52, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10836, 35, 18, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10836, 57, 19.5, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10836, 60, 34, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10836, 64, 33.25, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10837, 13, 6, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10837, 40, 18.4, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10837, 47, 9.5, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10837, 76, 18, 21, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10838, 1, 18, 4, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10838, 18, 62.5, 25, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10838, 36, 19, 50, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10839, 58, 13.25, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10839, 72, 34.8, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10840, 25, 14, 6, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10840, 39, 18, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10841, 10, 31, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10841, 56, 38, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10841, 59, 55, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10841, 77, 13, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10842, 11, 21, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10842, 43, 46, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10842, 68, 12.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10842, 70, 15, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10843, 51, 53, 4, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10844, 22, 21, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10845, 23, 9, 70, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10845, 35, 18, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10845, 42, 14, 42, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10845, 58, 13.25, 60, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10845, 64, 33.25, 48, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10846, 4, 22, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10846, 70, 15, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10846, 74, 10, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10847, 1, 18, 80, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10847, 19, 9.2, 12, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10847, 37, 26, 60, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10847, 45, 9.5, 36, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10847, 60, 34, 45, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10847, 71, 21.5, 55, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10848, 5, 21.35, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10848, 9, 97, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10849, 3, 10, 49, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10849, 26, 31.23, 18, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10850, 25, 14, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10850, 33, 2.5, 4, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10850, 70, 15, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10851, 2, 19, 5, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10851, 25, 14, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10851, 57, 19.5, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10851, 59, 55, 42, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10852, 2, 19, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10852, 17, 39, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10852, 62, 49.3, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10853, 18, 62.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10854, 10, 31, 100, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10854, 13, 6, 65, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10855, 16, 17.45, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10855, 31, 12.5, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10855, 56, 38, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10855, 65, 21.05, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10856, 2, 19, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10856, 42, 14, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10857, 3, 10, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10857, 26, 31.23, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10857, 29, 123.79, 10, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10858, 7, 30, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10858, 27, 43.9, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10858, 70, 15, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10859, 24, 4.5, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10859, 54, 7.45, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10859, 64, 33.25, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10860, 51, 53, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10860, 76, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10861, 17, 39, 42, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10861, 18, 62.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10861, 21, 10, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10861, 33, 2.5, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10861, 62, 49.3, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10862, 11, 21, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10862, 52, 7, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10863, 1, 18, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10863, 58, 13.25, 12, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10864, 35, 18, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10864, 67, 14, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10865, 38, 263.5, 60, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10865, 39, 18, 80, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10866, 2, 19, 21, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10866, 24, 4.5, 6, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10866, 30, 25.89, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10867, 53, 32.8, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10868, 26, 31.23, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10868, 35, 18, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10868, 49, 20, 42, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10869, 1, 18, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10869, 11, 21, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10869, 23, 9, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10869, 68, 12.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10870, 35, 18, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10870, 51, 53, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10871, 6, 25, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10871, 16, 17.45, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10871, 17, 39, 16, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10872, 55, 24, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10872, 62, 49.3, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10872, 64, 33.25, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10872, 65, 21.05, 21, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10873, 21, 10, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10873, 28, 45.6, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10874, 10, 31, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10875, 19, 9.2, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10875, 47, 9.5, 21, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10875, 49, 20, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10876, 46, 12, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10876, 64, 33.25, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10877, 16, 17.45, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10877, 18, 62.5, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10878, 20, 81, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10879, 40, 18.4, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10879, 65, 21.05, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10879, 76, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10880, 23, 9, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10880, 61, 28.5, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10880, 70, 15, 50, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10881, 73, 15, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10882, 42, 14, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10882, 49, 20, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10882, 54, 7.45, 32, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10883, 24, 4.5, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10884, 21, 10, 40, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10884, 56, 38, 21, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10884, 65, 21.05, 12, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10885, 2, 19, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10885, 24, 4.5, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10885, 70, 15, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10885, 77, 13, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10886, 10, 31, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10886, 31, 12.5, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10886, 77, 13, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10887, 25, 14, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10888, 2, 19, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10888, 68, 12.5, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10889, 11, 21, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10889, 38, 263.5, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10890, 17, 39, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10890, 34, 14, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10890, 41, 9.65, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10891, 30, 25.89, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10892, 59, 55, 40, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10893, 8, 40, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10893, 24, 4.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10893, 29, 123.79, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10893, 30, 25.89, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10893, 36, 19, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10894, 13, 6, 28, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10894, 69, 36, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10894, 75, 7.75, 120, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10895, 24, 4.5, 110, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10895, 39, 18, 45, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10895, 40, 18.4, 91, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10895, 60, 34, 100, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10896, 45, 9.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10896, 56, 38, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10897, 29, 123.79, 80, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10897, 30, 25.89, 36, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10898, 13, 6, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10899, 39, 18, 8, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10900, 70, 15, 3, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10901, 41, 9.65, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10901, 71, 21.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10902, 55, 24, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10902, 62, 49.3, 6, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10903, 13, 6, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10903, 65, 21.05, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10903, 68, 12.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10904, 58, 13.25, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10904, 62, 49.3, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10905, 1, 18, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10906, 61, 28.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10907, 75, 7.75, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10908, 7, 30, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10908, 52, 7, 14, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10909, 7, 30, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10909, 16, 17.45, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10909, 41, 9.65, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10910, 19, 9.2, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10910, 49, 20, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10910, 61, 28.5, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10911, 1, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10911, 17, 39, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10911, 67, 14, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10912, 11, 21, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10912, 29, 123.79, 60, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10913, 4, 22, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10913, 33, 2.5, 40, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10913, 58, 13.25, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10914, 71, 21.5, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10915, 17, 39, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10915, 33, 2.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10915, 54, 7.45, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10916, 16, 17.45, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10916, 32, 32, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10916, 57, 19.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10917, 30, 25.89, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10917, 60, 34, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10918, 1, 18, 60, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10918, 60, 34, 25, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10919, 16, 17.45, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10919, 25, 14, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10919, 40, 18.4, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10920, 50, 16.25, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10921, 35, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10921, 63, 43.9, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10922, 17, 39, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10922, 24, 4.5, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10923, 42, 14, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10923, 43, 46, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10923, 67, 14, 24, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10924, 10, 31, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10924, 28, 45.6, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10924, 75, 7.75, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10925, 36, 19, 25, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10925, 52, 7, 12, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10926, 11, 21, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10926, 13, 6, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10926, 19, 9.2, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10926, 72, 34.8, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10927, 20, 81, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10927, 52, 7, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10927, 76, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10928, 47, 9.5, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10928, 76, 18, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10929, 21, 10, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10929, 75, 7.75, 49, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10929, 77, 13, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10930, 21, 10, 36, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10930, 27, 43.9, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10930, 55, 24, 25, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10930, 58, 13.25, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10931, 13, 6, 42, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10931, 57, 19.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10932, 16, 17.45, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10932, 62, 49.3, 14, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10932, 72, 34.8, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10932, 75, 7.75, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10933, 53, 32.8, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10933, 61, 28.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10934, 6, 25, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10935, 1, 18, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10935, 18, 62.5, 4, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10935, 23, 9, 8, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10936, 36, 19, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10937, 28, 45.6, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10937, 34, 14, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10938, 13, 6, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10938, 43, 46, 24, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10938, 60, 34, 49, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10938, 71, 21.5, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10939, 2, 19, 10, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10939, 67, 14, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10940, 7, 30, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10940, 13, 6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10941, 31, 12.5, 44, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10941, 62, 49.3, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10941, 68, 12.5, 80, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10941, 72, 34.8, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10942, 49, 20, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10943, 13, 6, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10943, 22, 21, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10943, 46, 12, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10944, 11, 21, 5, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10944, 44, 19.45, 18, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10944, 56, 38, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10945, 13, 6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10945, 31, 12.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10946, 10, 31, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10946, 24, 4.5, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10946, 77, 13, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10947, 59, 55, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10948, 50, 16.25, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10948, 51, 53, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10948, 55, 24, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10949, 6, 25, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10949, 10, 31, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10949, 17, 39, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10949, 62, 49.3, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10950, 4, 22, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10951, 33, 2.5, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10951, 41, 9.65, 6, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10951, 75, 7.75, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10952, 6, 25, 16, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10952, 28, 45.6, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10953, 20, 81, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10953, 31, 12.5, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10954, 16, 17.45, 28, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10954, 31, 12.5, 25, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10954, 45, 9.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10954, 60, 34, 24, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10955, 75, 7.75, 12, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10956, 21, 10, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10956, 47, 9.5, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10956, 51, 53, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10957, 30, 25.89, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10957, 35, 18, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10957, 64, 33.25, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10958, 5, 21.35, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10958, 7, 30, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10958, 72, 34.8, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10959, 75, 7.75, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10960, 24, 4.5, 10, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10960, 41, 9.65, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10961, 52, 7, 6, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10961, 76, 18, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10962, 7, 30, 45, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10962, 13, 6, 77, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10962, 53, 32.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10962, 69, 36, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10962, 76, 18, 44, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10963, 60, 34, 2, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10964, 18, 62.5, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10964, 38, 263.5, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10964, 69, 36, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10965, 51, 53, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10966, 37, 26, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10966, 56, 38, 12, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10966, 62, 49.3, 12, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10967, 19, 9.2, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10967, 49, 20, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10968, 12, 38, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10968, 24, 4.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10968, 64, 33.25, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10969, 46, 12, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10970, 52, 7, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10971, 29, 123.79, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10972, 17, 39, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10972, 33, 2.5, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10973, 26, 31.23, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10973, 41, 9.65, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10973, 75, 7.75, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10974, 63, 43.9, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10975, 8, 40, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10975, 75, 7.75, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10976, 28, 45.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10977, 39, 18, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10977, 47, 9.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10977, 51, 53, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10977, 63, 43.9, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10978, 8, 40, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10978, 21, 10, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10978, 40, 18.4, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10978, 44, 19.45, 6, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10979, 7, 30, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10979, 12, 38, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10979, 24, 4.5, 80, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10979, 27, 43.9, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10979, 31, 12.5, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10979, 63, 43.9, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10980, 75, 7.75, 40, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10981, 38, 263.5, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10982, 7, 30, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10982, 43, 46, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10983, 13, 6, 84, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10983, 57, 19.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10984, 16, 17.45, 55, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10984, 24, 4.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10984, 36, 19, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10985, 16, 17.45, 36, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10985, 18, 62.5, 8, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10985, 32, 32, 35, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10986, 11, 21, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10986, 20, 81, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10986, 76, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10986, 77, 13, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10987, 7, 30, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10987, 43, 46, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10987, 72, 34.8, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10988, 7, 30, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10988, 62, 49.3, 40, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10989, 6, 25, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10989, 11, 21, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10989, 41, 9.65, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10990, 21, 10, 65, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10990, 34, 14, 60, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10990, 55, 24, 65, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10990, 61, 28.5, 66, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10991, 2, 19, 50, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10991, 70, 15, 20, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10991, 76, 18, 90, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10992, 72, 34.8, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10993, 29, 123.79, 50, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10993, 41, 9.65, 35, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10994, 59, 55, 18, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10995, 51, 53, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10995, 60, 34, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10996, 42, 14, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10997, 32, 32, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10997, 46, 12, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10997, 52, 7, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10998, 24, 4.5, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10998, 61, 28.5, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10998, 74, 10, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10998, 75, 7.75, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10999, 41, 9.65, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10999, 51, 53, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (10999, 77, 13, 21, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11000, 4, 22, 25, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11000, 24, 4.5, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11000, 77, 13, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11001, 7, 30, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11001, 22, 21, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11001, 46, 12, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11001, 55, 24, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11002, 13, 6, 56, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11002, 35, 18, 15, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11002, 42, 14, 24, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11002, 55, 24, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11003, 1, 18, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11003, 40, 18.4, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11003, 52, 7, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11004, 26, 31.23, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11004, 76, 18, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11005, 1, 18, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11005, 59, 55, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11006, 1, 18, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11006, 29, 123.79, 2, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11007, 8, 40, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11007, 29, 123.79, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11007, 42, 14, 14, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11008, 28, 45.6, 70, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11008, 34, 14, 90, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11008, 71, 21.5, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11009, 24, 4.5, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11009, 36, 19, 18, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11009, 60, 34, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11010, 7, 30, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11010, 24, 4.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11011, 58, 13.25, 40, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11011, 71, 21.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11012, 19, 9.2, 50, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11012, 60, 34, 36, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11012, 71, 21.5, 60, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11013, 23, 9, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11013, 42, 14, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11013, 45, 9.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11013, 68, 12.5, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11014, 41, 9.65, 28, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11015, 30, 25.89, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11015, 77, 13, 18, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11016, 31, 12.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11016, 36, 19, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11017, 3, 10, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11017, 59, 55, 110, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11017, 70, 15, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11018, 12, 38, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11018, 18, 62.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11018, 56, 38, 5, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11019, 46, 12, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11019, 49, 20, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11020, 10, 31, 24, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11021, 2, 19, 11, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11021, 20, 81, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11021, 26, 31.23, 63, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11021, 51, 53, 44, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11021, 72, 34.8, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11022, 19, 9.2, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11022, 69, 36, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11023, 7, 30, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11023, 43, 46, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11024, 26, 31.23, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11024, 33, 2.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11024, 65, 21.05, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11024, 71, 21.5, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11025, 1, 18, 10, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11025, 13, 6, 20, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11026, 18, 62.5, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11026, 51, 53, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11027, 24, 4.5, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11027, 62, 49.3, 21, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11028, 55, 24, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11028, 59, 55, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11029, 56, 38, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11029, 63, 43.9, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11030, 2, 19, 100, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11030, 5, 21.35, 70, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11030, 29, 123.79, 60, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11030, 59, 55, 100, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11031, 1, 18, 45, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11031, 13, 6, 80, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11031, 24, 4.5, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11031, 64, 33.25, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11031, 71, 21.5, 16, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11032, 36, 19, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11032, 38, 263.5, 25, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11032, 59, 55, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11033, 53, 32.8, 70, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11033, 69, 36, 36, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11034, 21, 10, 15, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11034, 44, 19.45, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11034, 61, 28.5, 6, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11035, 1, 18, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11035, 35, 18, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11035, 42, 14, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11035, 54, 7.45, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11036, 13, 6, 7, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11036, 59, 55, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11037, 70, 15, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11038, 40, 18.4, 5, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11038, 52, 7, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11038, 71, 21.5, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11039, 28, 45.6, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11039, 35, 18, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11039, 49, 20, 60, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11039, 57, 19.5, 28, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11040, 21, 10, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11041, 2, 19, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11041, 63, 43.9, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11042, 44, 19.45, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11042, 61, 28.5, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11043, 11, 21, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11044, 62, 49.3, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11045, 33, 2.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11045, 51, 53, 24, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11046, 12, 38, 20, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11046, 32, 32, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11046, 35, 18, 18, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11047, 1, 18, 25, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11047, 5, 21.35, 30, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11048, 68, 12.5, 42, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11049, 2, 19, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11049, 12, 38, 4, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11050, 76, 18, 50, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11051, 24, 4.5, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11052, 43, 46, 30, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11052, 61, 28.5, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11053, 18, 62.5, 35, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11053, 32, 32, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11053, 64, 33.25, 25, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11054, 33, 2.5, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11054, 67, 14, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11055, 24, 4.5, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11055, 25, 14, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11055, 51, 53, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11055, 57, 19.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11056, 7, 30, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11056, 55, 24, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11056, 60, 34, 50, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11057, 70, 15, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11058, 21, 10, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11058, 60, 34, 21, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11058, 61, 28.5, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11059, 13, 6, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11059, 17, 39, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11059, 60, 34, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11060, 60, 34, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11060, 77, 13, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11061, 60, 34, 15, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11062, 53, 32.8, 10, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11062, 70, 15, 12, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11063, 34, 14, 30, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11063, 40, 18.4, 40, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11063, 41, 9.65, 30, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11064, 17, 39, 77, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11064, 41, 9.65, 12, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11064, 53, 32.8, 25, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11064, 55, 24, 4, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11064, 68, 12.5, 55, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11065, 30, 25.89, 4, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11065, 54, 7.45, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11066, 16, 17.45, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11066, 19, 9.2, 42, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11066, 34, 14, 35, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11067, 41, 9.65, 9, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11068, 28, 45.6, 8, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11068, 43, 46, 36, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11068, 77, 13, 28, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11069, 39, 18, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11070, 1, 18, 40, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11070, 2, 19, 20, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11070, 16, 17.45, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11070, 31, 12.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11071, 7, 30, 15, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11071, 13, 6, 10, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11072, 2, 19, 8, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11072, 41, 9.65, 40, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11072, 50, 16.25, 22, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11072, 64, 33.25, 130, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11073, 11, 21, 10, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11073, 24, 4.5, 20, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11074, 16, 17.45, 14, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11075, 2, 19, 10, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11075, 46, 12, 30, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11075, 76, 18, 2, 0.15);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11076, 6, 25, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11076, 14, 23.25, 20, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11076, 19, 9.2, 10, 0.25);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 2, 19, 24, 0.2);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 3, 10, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 4, 22, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 6, 25, 1, 0.02);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 7, 30, 1, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 8, 40, 2, 0.1);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 10, 31, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 12, 38, 2, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 13, 6, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 14, 23.25, 1, 0.03);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 16, 17.45, 2, 0.03);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 20, 81, 1, 0.04);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 23, 9, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 32, 32, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 39, 18, 2, 0.05);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 41, 9.65, 3, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 46, 12, 3, 0.02);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 52, 7, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 55, 24, 2, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 60, 34, 2, 0.06);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 64, 33.25, 2, 0.03);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 66, 17, 1, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 73, 15, 2, 0.01);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 75, 7.75, 4, 0.0);
INSERT INTO `Order Details` (OrderID, ProductID, UnitPrice, Quantity, Discount) Values (11077, 77, 13, 2, 0.0);

TRUNCATE TABLE Products;
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(1, 'Chai', 1, 1, '10 boxes x 20 bags', 18, 39, 0, 10, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35, 0, 0, 0, 1);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30, 15, 0, 10, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40, 6, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, 1);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(10, 'Ikura', 4, 8, '12 - 200 ml jars', 31, 31, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 30, 30, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38, 86, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(13, 'Konbu', 6, 8, '2 kg box', 6, 24, 0, 5, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(14, 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(15, 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 15.5, 39, 0, 5, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(16, 'Pavlova', 7, 3, '32 - 500 g boxes', 17.45, 29, 0, 10, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(17, 'Alice Mutton', 7, 6, '20 - 1 kg tins', 39, 0, 0, 0, 1);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(18, 'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.5, 42, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.2, 25, 0, 5, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(20, 'Sir Rodney''s Marmalade', 8, 3, '30 gift boxes', 81, 40, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(21, 'Sir Rodney''s Scones', 8, 3, '24 pkgs. x 4 pieces', 10, 3, 40, 5, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(22, 'Gustaf''s Knckebrd', 9, 5, '24 - 500 g pkgs.', 21, 104, 0, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(23, 'Tunnbrd', 9, 5, '12 - 250 g pkgs.', 9, 61, 0, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(24, 'Guaran Fantstica', 10, 1, '12 - 355 ml cans', 4.5, 20, 0, 0, 1);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(25, 'NuNuCa Nu-Nougat-Creme', 11, 3, '20 - 450 g glasses', 14, 76, 0, 30, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(26, 'Gumbr Gummibrchen', 11, 3, '100 - 250 g bags', 31.23, 15, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(27, 'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.9, 49, 0, 30, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(28, 'Rssle Sauerkraut', 12, 7, '25 - 825 g cans', 45.6, 26, 0, 0, 1);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(29, 'Thringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.79, 0, 0, 0, 1);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(30, 'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.89, 10, 0, 15, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(31, 'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.5, 0, 70, 20, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(32, 'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32, 9, 40, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(33, 'Geitost', 15, 4, '500 g', 2.5, 112, 0, 20, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(34, 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14, 111, 0, 15, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(35, 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18, 20, 0, 15, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(36, 'Inlagd Sill', 17, 8, '24 - 250 g  jars', 19, 112, 0, 20, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(37, 'Gravad lax', 17, 8, '12 - 500 g pkgs.', 26, 11, 50, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(38, 'Cte de Blaye', 18, 1, '12 - 75 cl bottles', 263.5, 17, 0, 15, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(39, 'Chartreuse verte', 18, 1, '750 cc per bottle', 18, 69, 0, 5, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(40, 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.4, 123, 0, 30, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(41, 'Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.65, 85, 0, 10, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14, 26, 0, 0, 1);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(43, 'Ipoh Coffee', 20, 1, '16 - 500 g tins', 46, 17, 10, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(44, 'Gula Malacca', 20, 2, '20 - 2 kg bags', 19.45, 27, 0, 15, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(45, 'Rogede sild', 21, 8, '1k pkg.', 9.5, 5, 70, 15, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(46, 'Spegesild', 21, 8, '4 - 450 g glasses', 12, 95, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(47, 'Zaanse koeken', 22, 3, '10 - 4 oz boxes', 9.5, 36, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(48, 'Chocolade', 22, 3, '10 pkgs.', 12.75, 15, 70, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(49, 'Maxilaku', 23, 3, '24 - 50 g pkgs.', 20, 10, 60, 15, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(50, 'Valkoinen suklaa', 23, 3, '12 - 100 g bars', 16.25, 65, 0, 30, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(51, 'Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', 53, 20, 0, 10, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(52, 'Filo Mix', 24, 5, '16 - 2 kg boxes', 7, 38, 0, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(53, 'Perth Pasties', 24, 6, '48 pieces', 32.8, 0, 0, 0, 1);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(54, 'Tourtire', 25, 6, '16 pies', 7.45, 21, 0, 10, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(55, 'Pt chinois', 25, 6, '24 boxes x 2 pies', 24, 115, 0, 20, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(56, 'Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', 38, 21, 10, 30, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(57, 'Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', 19.5, 36, 0, 20, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(58, 'Escargots de Bourgogne', 27, 8, '24 pieces', 13.25, 62, 0, 20, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(59, 'Raclette Courdavault', 28, 4, '5 kg pkg.', 55, 79, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(60, 'Camembert Pierrot', 28, 4, '15 - 300 g rounds', 34, 19, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(61, 'Sirop d''rable', 29, 2, '24 - 500 ml bottles', 28.5, 113, 0, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(62, 'Tarte au sucre', 29, 3, '48 pies', 49.3, 17, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(63, 'Vegie-spread', 7, 2, '15 - 625 g jars', 43.9, 24, 0, 5, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(64, 'Wimmers gute Semmelkndel', 12, 5, '20 bags x 4 pieces', 33.25, 22, 80, 30, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(65, 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.05, 76, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(66, 'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17, 4, 100, 20, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(67, 'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14, 52, 0, 10, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(68, 'Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', 12.5, 6, 10, 15, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(69, 'Gudbrandsdalsost', 15, 4, '10 kg pkg.', 36, 26, 0, 15, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(70, 'Outback Lager', 7, 1, '24 - 355 ml bottles', 15, 15, 10, 30, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(71, 'Flotemysost', 15, 4, '10 - 500 g pkgs.', 21.5, 26, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(72, 'Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', 34.8, 14, 0, 0, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(73, 'Rd Kaviar', 17, 8, '24 - 150 g jars', 15, 101, 0, 5, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(74, 'Longlife Tofu', 4, 7, '5 kg pkg.', 10, 4, 20, 5, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(75, 'Rhnbru Klosterbier', 12, 1, '24 - 0.5 l bottles', 7.75, 125, 0, 25, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(76, 'Lakkalikri', 23, 1, '500 ml', 18, 57, 0, 20, 0);
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES(77, 'Original Frankfurter grne Soe', 12, 2, '12 boxes', 13, 32, 0, 15, 0);

TRUNCATE TABLE Region;
INSERT INTO Region (RegionID, RegionDescription)
VALUES(1, 'Eastern                                           ');
INSERT INTO Region (RegionID, RegionDescription)
VALUES(2, 'Westerns                                           ');
INSERT INTO Region (RegionID, RegionDescription)
VALUES(3, 'Northern                                          ');
INSERT INTO Region (RegionID, RegionDescription)
VALUES(4, 'Southern                                          ');


TRUNCATE TABLE Shippers;
INSERT INTO Shippers (ShipperID, CompanyName, Phone)
VALUES(1, 'Speedy Express', '(503) 555-9831');
INSERT INTO Shippers (ShipperID, CompanyName, Phone)
VALUES(2, 'United Package', '(503) 555-3199');
INSERT INTO Shippers (ShipperID, CompanyName, Phone)
VALUES(3, 'Federal Shipping', '(503) 555-9931');


TRUNCATE TABLE Suppliers;
INSERT INTO Suppliers VALUES(1,'Exotic Liquids','Charlotte Cooper','Purchasing Manager','49 Gilbert St.','London',NULL,'EC1 4SD','UK','(171) 555-2222',NULL,NULL);
INSERT INTO Suppliers VALUES(2,'New Orleans Cajun Delights','Shelley Burke','Order Administrator','P.O. Box 78934','New Orleans','LA','70117','USA','(100) 555-4822',NULL,'#CAJUN.HTM#');
INSERT INTO Suppliers VALUES(3,'Grandma Kelly''s Homestead','Regina Murphy','Sales Representative','707 Oxford Rd.','Ann Arbor','MI','48104','USA','(313) 555-5735','(313) 555-3349',NULL);
INSERT INTO Suppliers VALUES(4,'Tokyo Traders','Yoshi Nagase','Marketing Manager','9-8 Sekimai
Musashino-shi','Tokyo',NULL,'100','Japan','(03) 3555-5011',NULL,NULL);
INSERT INTO Suppliers VALUES(5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra ','Export Administrator','Calle del Rosal 4','Oviedo','Asturias','33007','Spain','(98) 598 76 54',NULL,NULL);
INSERT INTO Suppliers VALUES(6,'Mayumi''s','Mayumi Ohno','Marketing Representative','92 Setsuko
Chuo-ku','Osaka',NULL,'545','Japan','(06) 431-7877',NULL,'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO Suppliers VALUES(7,'Pavlova, Ltd.','Ian Devling','Marketing Manager','74 Rose St.
Moonie Ponds','Melbourne','Victoria','3058','Australia','(03) 444-2343','(03) 444-6588',NULL);
INSERT INTO Suppliers VALUES(8,'Specialty Biscuits, Ltd.','Peter Wilson','Sales Representative','29 King''s Way','Manchester',NULL,'M14 GSD','UK','(161) 555-4448',NULL,NULL);
INSERT INTO Suppliers VALUES(9,'PB Knckebrd AB','Lars Peterson','Sales Agent','Kaloadagatan 13','Gteborg',NULL,'S-345 67','Sweden ','031-987 65 43','031-987 65 91',NULL);
INSERT INTO Suppliers VALUES(10,'Refrescos Americanas LTDA','Carlos Diaz','Marketing Manager','Av. das Americanas 12.890','So Paulo',NULL,'5442','Brazil','(11) 555 4640',NULL,NULL);
INSERT INTO Suppliers VALUES(11,'Heli Swaren GmbH & Co. KG','Petra Winkler','Sales Manager','Tiergartenstrae 5','Berlin',NULL,'10785','Germany','(010) 9984510',NULL,NULL);
INSERT INTO Suppliers VALUES(12,'Plutzer Lebensmittelgromrkte AG','Martin Bein','International Marketing Mgr.','Bogenallee 51','Frankfurt',NULL,'60439','Germany','(069) 992755',NULL,'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO Suppliers VALUES(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Coordinator Foreign Markets','Frahmredder 112a','Cuxhaven',NULL,'27478','Germany','(04721) 8713','(04721) 8714',NULL);
INSERT INTO Suppliers VALUES(14,'Formaggi Fortini s.r.l.','Elio Rossi','Sales Representative','Viale Dante, 75','Ravenna',NULL,'48100','Italy','(0544) 60323','(0544) 60603','#FORMAGGI.HTM#');
INSERT INTO Suppliers VALUES(15,'Norske Meierier','Beate Vileid','Marketing Manager','Hatlevegen 5','Sandvika',NULL,'1320','Norway','(0)2-953010',NULL,NULL);
INSERT INTO Suppliers VALUES(16,'Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.','3400 - 8th Avenue
Suite 210','Bend','OR','97101','USA','(503) 555-9931',NULL,NULL);
INSERT INTO Suppliers VALUES(17,'Svensk Sjfda AB','Michael Bjrn','Sales Representative','Brovallavgen 231','Stockholm',NULL,'S-123 45','Sweden','08-123 45 67',NULL,NULL);
INSERT INTO Suppliers VALUES(18,'Aux joyeux ecclsiastiques','Guylne Nodier','Sales Manager','203, Rue des Francs-Bourgeois','Paris',NULL,'75004','France','(1) 03.83.00.68','(1) 03.83.00.62',NULL);
INSERT INTO Suppliers VALUES(19,'New England Seafood Cannery','Robb Merchant','Wholesale Account Agent','Order Processing Dept.
2100 Paul Revere Blvd.','Boston','MA','02134','USA','(617) 555-3267','(617) 555-3389',NULL);
INSERT INTO Suppliers VALUES(20,'Leka Trading','Chandra Leka','Owner','471 Serangoon Loop, Suite #402','Singapore',NULL,'0512','Singapore','555-8787',NULL,NULL);
INSERT INTO Suppliers VALUES(21,'Lyngbysild','Niels Petersen','Sales Manager','Lyngbysild
Fiskebakken 10','Lyngby',NULL,'2800','Denmark','43844108','43844115',NULL);
INSERT INTO Suppliers VALUES(22,'Zaanse Snoepfabriek','Dirk Luchte','Accounting Manager','Verkoop
Rijnweg 22','Zaandam',NULL,'9999 ZZ','Netherlands','(12345) 1212','(12345) 1210',NULL);
INSERT INTO Suppliers VALUES(23,'Karkki Oy','Anne Heikkonen','Product Manager','Valtakatu 12','Lappeenranta',NULL,'53120','Finland','(953) 10956',NULL,NULL);
INSERT INTO Suppliers VALUES(24,'G''day, Mate','Wendy Mackenzie','Sales Representative','170 Prince Edward Parade
Hunter''s Hill','Sydney','NSW','2042','Australia','(02) 555-5914','(02) 555-4873','G''day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#');
INSERT INTO Suppliers VALUES(25,'Ma Maison','Jean-Guy Lauzon','Marketing Manager','2960 Rue St. Laurent','Montral','Qubec','H1J 1C3','Canada','(514) 555-9022',NULL,NULL);
INSERT INTO Suppliers VALUES(26,'Pasta Buttini s.r.l.','Giovanni Giudici','Order Administrator','Via dei Gelsomini, 153','Salerno',NULL,'84100','Italy','(089) 6547665','(089) 6547667',NULL);
INSERT INTO Suppliers VALUES(27,'Escargots Nouveaux','Marie Delamare','Sales Manager','22, rue H. Voiron','Montceau',NULL,'71300','France','85.57.00.07',NULL,NULL);
INSERT INTO Suppliers VALUES(28,'Gai pturage','Eliane Noz','Sales Representative','Bat. B
3, rue des Alpes','Annecy',NULL,'74000','France','38.76.98.06','38.76.98.58',NULL);
INSERT INTO Suppliers VALUES(29,'Forts d''rables','Chantal Goulet','Accounting Manager','148 rue Chasseur','Ste-Hyacinthe','Qubec','J2S 7S8','Canada','(514) 555-2955','(514) 555-2921',NULL);

TRUNCATE TABLE Territories;
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('01581', 'Westboro                                          ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('01730', 'Bedford                                           ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('01833', 'Georgetow                                         ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('02116', 'Boston                                            ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('02139', 'Cambridge                                         ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('02184', 'Braintree                                         ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('02903', 'Providence                                        ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('03049', 'Hollis                                            ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('03801', 'Portsmouth                                        ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('06897', 'Wilton                                            ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('07960', 'Morristown                                        ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('08837', 'Edison                                            ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('10019', 'New York                                          ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('10038', 'New York                                          ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('11747', 'Mellvile                                          ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('14450', 'Fairport                                          ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('19428', 'Philadelphia                                      ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('19713', 'Neward                                            ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('20852', 'Rockville                                         ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('27403', 'Greensboro                                        ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('27511', 'Cary                                              ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('29202', 'Columbia                                          ', 4);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('30346', 'Atlanta                                           ', 4);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('31406', 'Savannah                                          ', 4);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('32859', 'Orlando                                           ', 4);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('33607', 'Tampa                                             ', 4);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('40222', 'Louisville                                        ', 1);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('44122', 'Beachwood                                         ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('45839', 'Findlay                                           ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('48075', 'Southfield                                        ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('48084', 'Troy                                              ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('48304', 'Bloomfield Hills                                  ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('53404', 'Racine                                            ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('55113', 'Roseville                                         ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('55439', 'Minneapolis                                       ', 3);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('60179', 'Hoffman Estates                                   ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('60601', 'Chicago                                           ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('72716', 'Bentonville                                       ', 4);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('75234', 'Dallas                                            ', 4);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('78759', 'Austin                                            ', 4);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('80202', 'Denver                                            ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('80909', 'Colorado Springs                                  ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('85014', 'Phoenix                                           ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('85251', 'Scottsdale                                        ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('90405', 'Santa Monica                                      ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('94025', 'Menlo Park                                        ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('94105', 'San Francisco                                     ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('95008', 'Campbell                                          ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('95054', 'Santa Clara                                       ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('95060', 'Santa Cruz                                        ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('98004', 'Bellevue                                          ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('98052', 'Redmond                                           ', 2);
INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES('98104', 'Seattle                                           ', 2);

ALTER TABLE `CustomerCustomerDemo` ADD CONSTRAINT `FK_CustomerCustomerDemo` 
    FOREIGN KEY (`CustomerTypeID`) REFERENCES `CustomerDemographics` (`CustomerTypeID`);

ALTER TABLE `Employees` ADD CONSTRAINT `FK_Employees_Employees` 
    FOREIGN KEY (`ReportsTo`) REFERENCES `Employees` (`EmployeeID`);

ALTER TABLE `EmployeeTerritories` ADD CONSTRAINT `FK_EmployeeTerritories_Employees` 
    FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`);

ALTER TABLE `Order Details` ADD CONSTRAINT `FK_Order_Details_Orders` 
    FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`);

ALTER TABLE `Order Details` ADD CONSTRAINT `FK_Order_Details_Products` 
    FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);


ALTER TABLE `Orders` ADD CONSTRAINT `FK_Orders_Employees` 
    FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`);

ALTER TABLE `Orders` ADD CONSTRAINT `FK_Orders_Shippers` 
    FOREIGN KEY (`ShipVia`) REFERENCES `Shippers` (`ShipperID`);

ALTER TABLE `Products` ADD CONSTRAINT `FK_Products_Categories` 
    FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`);

ALTER TABLE `Products` ADD CONSTRAINT `FK_Products_Suppliers` 
    FOREIGN KEY (`SupplierID`) REFERENCES `Suppliers` (`SupplierID`);

ALTER TABLE `Territories` ADD CONSTRAINT `FK_Territories_Region` 
    FOREIGN KEY (`RegionID`) REFERENCES `Region` (`RegionID`);
