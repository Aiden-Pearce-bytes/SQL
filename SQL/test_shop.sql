-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 26, 2019 at 11:26 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `CategoryID` tinyint(3) UNSIGNED NOT NULL,
  `CategoryName` varchar(30) NOT NULL,
  `Description` text,
  `Picture` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` varchar(5) NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `EmployeeID` mediumint(8) UNSIGNED NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `Title` varchar(30) DEFAULT NULL,
  `TitleOfCourtesy` varchar(25) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `HomePhone` varchar(24) DEFAULT NULL,
  `Extension` varchar(4) DEFAULT NULL,
  `Photo` blob,
  `Notes` text NOT NULL,
  `ReportsTo` mediumint(8) UNSIGNED DEFAULT NULL,
  `PhotoPath` varchar(255) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EmployeeTerritories`
--

CREATE TABLE `EmployeeTerritories` (
  `EmployeeID` mediumint(8) UNSIGNED NOT NULL,
  `TerritoryID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Order Details`
--

CREATE TABLE `Order Details` (
  `OrderID` int(10) UNSIGNED NOT NULL,
  `ProductID` smallint(5) UNSIGNED NOT NULL,
  `UnitPrice` decimal(8,2) UNSIGNED NOT NULL DEFAULT '999999.99',
  `Quantity` smallint(2) UNSIGNED NOT NULL DEFAULT '1',
  `Discount` double(8,0) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int(10) UNSIGNED NOT NULL,
  `CustomerID` varchar(5) DEFAULT NULL,
  `EmployeeID` mediumint(8) UNSIGNED NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `RequiredDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `ShipVia` tinyint(3) UNSIGNED DEFAULT NULL,
  `Freight` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `ShipName` varchar(40) DEFAULT NULL,
  `ShipAddress` varchar(60) DEFAULT NULL,
  `ShipCity` varchar(15) DEFAULT NULL,
  `ShipRegion` varchar(15) DEFAULT NULL,
  `ShipPostalCode` varchar(10) DEFAULT NULL,
  `ShipCountry` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `ProductID` smallint(5) UNSIGNED NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `SupplierID` smallint(5) UNSIGNED NOT NULL,
  `CategoryID` tinyint(3) UNSIGNED NOT NULL,
  `QuantityPerUnit` varchar(20) DEFAULT NULL,
  `UnitPrice` decimal(10,2) UNSIGNED DEFAULT '0.00',
  `UnitsInStock` smallint(6) DEFAULT '0',
  `UnitsOnOrder` smallint(5) UNSIGNED DEFAULT '0',
  `ReorderLevel` smallint(5) UNSIGNED DEFAULT '0',
  `Discontinued` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Region`
--

CREATE TABLE `Region` (
  `RegionID` tinyint(3) UNSIGNED NOT NULL,
  `RegionDescription` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Shippers`
--

CREATE TABLE `Shippers` (
  `ShipperID` tinyint(3) UNSIGNED NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `Phone` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Suppliers`
--

CREATE TABLE `Suppliers` (
  `SupplierID` smallint(5) UNSIGNED NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `HomePage` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Territories`
--

CREATE TABLE `Territories` (
  `TerritoryID` varchar(20) NOT NULL,
  `TerritoryDescription` varchar(50) NOT NULL,
  `RegionID` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `City` (`City`),
  ADD KEY `CompanyName` (`CompanyName`),
  ADD KEY `PostalCode` (`PostalCode`),
  ADD KEY `Region` (`Region`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `LastName` (`LastName`),
  ADD KEY `PostalCode` (`PostalCode`),
  ADD KEY `ReportsTo` (`ReportsTo`);

--
-- Indexes for table `EmployeeTerritories`
--
ALTER TABLE `EmployeeTerritories`
  ADD PRIMARY KEY (`EmployeeID`,`TerritoryID`),
  ADD KEY `TerritoryID` (`TerritoryID`);

--
-- Indexes for table `Order Details`
--
ALTER TABLE `Order Details`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `OrderDate` (`OrderDate`),
  ADD KEY `ShippedDate` (`ShippedDate`),
  ADD KEY `ShipPostalCode` (`ShipPostalCode`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `ShipVia` (`ShipVia`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `ProductName` (`ProductName`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indexes for table `Region`
--
ALTER TABLE `Region`
  ADD PRIMARY KEY (`RegionID`);

--
-- Indexes for table `Shippers`
--
ALTER TABLE `Shippers`
  ADD PRIMARY KEY (`ShipperID`);

--
-- Indexes for table `Suppliers`
--
ALTER TABLE `Suppliers`
  ADD PRIMARY KEY (`SupplierID`),
  ADD KEY `CompanyName` (`CompanyName`),
  ADD KEY `PostalCode` (`PostalCode`);

--
-- Indexes for table `Territories`
--
ALTER TABLE `Territories`
  ADD PRIMARY KEY (`TerritoryID`),
  ADD KEY `RegionID` (`RegionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `CategoryID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `EmployeeID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `OrderID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `ProductID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Region`
--
ALTER TABLE `Region`
  MODIFY `RegionID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Shippers`
--
ALTER TABLE `Shippers`
  MODIFY `ShipperID` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Suppliers`
--
ALTER TABLE `Suppliers`
  MODIFY `SupplierID` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Employees`
--
ALTER TABLE `Employees`
  ADD CONSTRAINT `Employees_ibfk_1` FOREIGN KEY (`ReportsTo`) REFERENCES `Employees` (`EmployeeID`);

--
-- Constraints for table `EmployeeTerritories`
--
ALTER TABLE `EmployeeTerritories`
  ADD CONSTRAINT `EmployeeTerritories_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`),
  ADD CONSTRAINT `EmployeeTerritories_ibfk_2` FOREIGN KEY (`TerritoryID`) REFERENCES `Territories` (`TerritoryID`);

--
-- Constraints for table `Order Details`
--
ALTER TABLE `Order Details`
  ADD CONSTRAINT `Order Details_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  ADD CONSTRAINT `Order Details_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`),
  ADD CONSTRAINT `Orders_ibfk_3` FOREIGN KEY (`ShipVia`) REFERENCES `Shippers` (`ShipperID`);

--
-- Constraints for table `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `Products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`),
  ADD CONSTRAINT `Products_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `Suppliers` (`SupplierID`);

--
-- Constraints for table `Territories`
--
ALTER TABLE `Territories`
  ADD CONSTRAINT `Territories_ibfk_1` FOREIGN KEY (`RegionID`) REFERENCES `Region` (`RegionID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
