-- MySQL dump 10.13  Distrib 5.6.50, for Win32 (AMD64)
--
-- Host: localhost    Database: clientesorn
-- ------------------------------------------------------
-- Server version	5.6.50

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

--
-- Table structure for table `accounting_codes`
--

DROP TABLE IF EXISTS `accounting_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `description` varchar(250) NOT NULL,
  `lft` int(11) NOT NULL,
  `rght` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `bool_main` tinyint(1) DEFAULT '0',
  `bool_creditor` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounting_movements`
--

DROP TABLE IF EXISTS `accounting_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_movements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accounting_register_id` int(11) NOT NULL,
  `accounting_code_id` int(11) NOT NULL,
  `concept` varchar(200) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `bool_debit` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113097 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounting_register_cash_receipts`
--

DROP TABLE IF EXISTS `accounting_register_cash_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_register_cash_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accounting_register_id` int(11) NOT NULL,
  `cash_receipt_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7580 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounting_register_invoices`
--

DROP TABLE IF EXISTS `accounting_register_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_register_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accounting_register_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29905 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounting_register_types`
--

DROP TABLE IF EXISTS `accounting_register_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_register_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(10) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounting_registers`
--

DROP TABLE IF EXISTS `accounting_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_registers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_code` varchar(10) NOT NULL,
  `concept` varchar(250) NOT NULL,
  `register_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `accounting_register_type_id` int(11) NOT NULL DEFAULT '2',
  `observation` varchar(200) DEFAULT '',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46409 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_receipt_invoices`
--

DROP TABLE IF EXISTS `cash_receipt_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_receipt_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cash_receipt_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `increment` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `erdiff` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_retention` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_credit_CS` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_increment_CS` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_discount_CS` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_erdiff_CS` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5444 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_receipt_types`
--

DROP TABLE IF EXISTS `cash_receipt_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_receipt_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_receipts`
--

DROP TABLE IF EXISTS `cash_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) DEFAULT '1',
  `order_id` int(11) DEFAULT NULL,
  `receipt_date` date NOT NULL,
  `receipt_code` varchar(45) NOT NULL,
  `bool_annulled` tinyint(1) DEFAULT '0',
  `cash_receipt_type_id` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `cashbox_accounting_code_id` int(11) DEFAULT '0',
  `credit_accounting_code_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `received_from` varchar(100) DEFAULT NULL,
  `concept` varchar(500) NOT NULL,
  `observation` varchar(250) DEFAULT NULL,
  `bool_cash` tinyint(1) DEFAULT NULL,
  `cheque_number` varchar(45) DEFAULT NULL,
  `cheque_bank` varchar(45) DEFAULT NULL,
  `bool_retention` tinyint(1) NOT NULL DEFAULT '0',
  `retention_number` varchar(100) DEFAULT NULL,
  `bool_deposited` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7650 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cheque_types`
--

DROP TABLE IF EXISTS `cheque_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cheque_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `accounting_code_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cheques`
--

DROP TABLE IF EXISTS `cheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cheques` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cheque_date` date NOT NULL,
  `cheque_code` varchar(50) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `concept` varchar(250) NOT NULL,
  `observation` varchar(250) NOT NULL,
  `bank_accounting_code_id` int(11) NOT NULL,
  `accounting_register_id` int(11) NOT NULL,
  `cheque_type_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_request_products`
--

DROP TABLE IF EXISTS `client_request_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_request_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_request_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `raw_material_id` int(11) NOT NULL,
  `production_result_code_id` int(11) DEFAULT NULL,
  `product_unit_price` decimal(18,8) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_total_price` decimal(18,8) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb4,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_requests`
--

DROP TABLE IF EXISTS `client_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_request_date` datetime DEFAULT NULL,
  `client_request_code` varchar(45) DEFAULT NULL,
  `bool_annulled` tinyint(1) NOT NULL DEFAULT '0',
  `client_id` int(11) DEFAULT NULL,
  `subtotal_price` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `comment` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_types`
--

DROP TABLE IF EXISTS `client_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `long_description` varchar(200) DEFAULT NULL,
  `list_order` int(11) NOT NULL DEFAULT '100',
  `hex_color` varchar(7) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `closing_dates`
--

DROP TABLE IF EXISTS `closing_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `closing_dates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `closing_date` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `constants`
--

DROP TABLE IF EXISTS `constants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constant` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deletions`
--

DROP TABLE IF EXISTS `deletions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `reference_id` int(11) DEFAULT NULL,
  `reference` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_code` varchar(20) NOT NULL,
  `registering_user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `sales_order_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_phone` varchar(10) NOT NULL,
  `planned_delivery_datetime` datetime NOT NULL,
  `actual_delivery_datetime` datetime NOT NULL,
  `delivery_status_id` int(11) NOT NULL,
  `delivery_address` text NOT NULL,
  `driver_user_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=572 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_remarks`
--

DROP TABLE IF EXISTS `delivery_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL,
  `registering_user_id` int(11) NOT NULL,
  `remark_datetime` datetime NOT NULL,
  `remark_text` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_statuses`
--

DROP TABLE IF EXISTS `delivery_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `list_order` int(11) NOT NULL DEFAULT '100',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_holidays`
--

DROP TABLE IF EXISTS `employee_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `holiday_date` date NOT NULL,
  `days_taken` decimal(5,1) NOT NULL,
  `holiday_type_id` int(11) NOT NULL,
  `observation` text,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2468 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday_types`
--

DROP TABLE IF EXISTS `holiday_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incidences`
--

DROP TABLE IF EXISTS `incidences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `list_order` int(11) NOT NULL DEFAULT '1',
  `bool_active` tinyint(1) NOT NULL DEFAULT '1',
  `creating_user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!50001 DROP VIEW IF EXISTS `inventario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `inventario` AS SELECT 
 1 AS `name`,
 1 AS `packaging_unit`,
 1 AS `product_type_id`,
 1 AS `product_id`,
 1 AS `raw_material_id`,
 1 AS `total`,
 1 AS `Saldo`,
 1 AS `Remaining_A`,
 1 AS `Saldo_A`,
 1 AS `Remaining_B`,
 1 AS `Saldo_B`,
 1 AS `Remaining_C`,
 1 AS `Saldo_C`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `invoice_code` varchar(45) NOT NULL,
  `invoice_date` date NOT NULL,
  `bool_annulled` tinyint(1) DEFAULT '0',
  `warehouse_id` int(11) NOT NULL DEFAULT '1',
  `sales_order_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `bool_credit` int(11) DEFAULT NULL,
  `credit_authorization_user_id` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `cashbox_accounting_code_id` int(11) DEFAULT NULL,
  `bool_retention` int(11) DEFAULT NULL,
  `retention_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `retention_number` varchar(40) DEFAULT NULL,
  `bool_iva` tinyint(1) NOT NULL,
  `sub_total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `iva_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bool_paid` tinyint(1) DEFAULT '0',
  `bool_deposited` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30115 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machine_products`
--

DROP TABLE IF EXISTS `machine_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_datetime` datetime NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '0',
  `machine_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1225 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `bool_active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `maximos`
--

DROP TABLE IF EXISTS `maximos`;
/*!50001 DROP VIEW IF EXISTS `maximos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `maximos` AS SELECT 
 1 AS `id`,
 1 AS `idx`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `operators`
--

DROP TABLE IF EXISTS `operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `bool_active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_user_id` int(11) NOT NULL,
  `vendor_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '10',
  `order_date` datetime DEFAULT NULL,
  `order_code` varchar(45) DEFAULT NULL,
  `bool_annulled` tinyint(1) NOT NULL DEFAULT '0',
  `warehouse_id` int(11) NOT NULL DEFAULT '1',
  `third_party_id` int(11) DEFAULT NULL,
  `client_name` varchar(200) DEFAULT NULL,
  `client_email` varchar(50) NOT NULL,
  `client_phone` varchar(20) DEFAULT NULL,
  `client_address` varchar(300) DEFAULT NULL,
  `client_ruc` varchar(30) DEFAULT NULL,
  `client_type_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `bool_delivery` tinyint(1) DEFAULT '0',
  `delivery_address` text,
  `delivery_id` int(11) NOT NULL,
  `stock_movement_type_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `comment` text,
  `purchase_order_id` int(11) DEFAULT NULL,
  `bool_purchase_order_delivery_complete` tinyint(1) DEFAULT NULL,
  `bool_entry_iva` tinyint(1) NOT NULL DEFAULT '0',
  `entry_cost_iva` decimal(10,2) DEFAULT '0.00',
  `entry_cost_total` decimal(10,2) DEFAULT '0.00',
  `bool_entry_paid` tinyint(4) NOT NULL DEFAULT '0',
  `entry_cheque_number` varchar(50) DEFAULT '',
  `payment_date` date DEFAULT NULL,
  `payment_user_id` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33790 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_rights`
--

DROP TABLE IF EXISTS `page_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) NOT NULL,
  `bool_default_assignment` tinyint(1) DEFAULT '0',
  `name` varchar(75) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `pages` text NOT NULL,
  `list_order` int(11) NOT NULL DEFAULT '100',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_deposits`
--

DROP TABLE IF EXISTS `payment_deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cash_receipt_id` int(11) NOT NULL DEFAULT '0',
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `transfer_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `bool_deposit_complete` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3107 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_modes`
--

DROP TABLE IF EXISTS `payment_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plant_product_types`
--

DROP TABLE IF EXISTS `plant_product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant_product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_datetime` datetime NOT NULL,
  `plant_id` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plant_production_result_codes`
--

DROP TABLE IF EXISTS `plant_production_result_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant_production_result_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_datetime` datetime NOT NULL,
  `plant_id` int(11) NOT NULL,
  `production_result_code_id` int(11) NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plant_production_types`
--

DROP TABLE IF EXISTS `plant_production_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant_production_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_datetime` datetime NOT NULL,
  `plant_id` int(11) NOT NULL,
  `production_type_id` int(11) NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plant_third_parties`
--

DROP TABLE IF EXISTS `plant_third_parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plant_third_parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_datetime` datetime NOT NULL,
  `plant_id` int(11) NOT NULL,
  `third_party_id` int(11) NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=891 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `price_client_categories`
--

DROP TABLE IF EXISTS `price_client_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_client_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_number` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `hexcolor` varchar(7) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_natures`
--

DROP TABLE IF EXISTS `product_natures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_natures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `long_description` varchar(200) DEFAULT NULL,
  `list_order` int(11) NOT NULL DEFAULT '100',
  `hex_color` varchar(7) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_price_logs`
--

DROP TABLE IF EXISTS `product_price_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_price_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_datetime` datetime NOT NULL,
  `product_id` int(11) NOT NULL,
  `raw_material_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `price_client_category_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `price` decimal(18,8) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2035 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_productions`
--

DROP TABLE IF EXISTS `product_productions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_productions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `acceptable_production` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_threshold_volumes`
--

DROP TABLE IF EXISTS `product_threshold_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_threshold_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_datetime` datetime NOT NULL,
  `product_id` int(11) NOT NULL,
  `raw_material_id` int(11) DEFAULT NULL,
  `price_client_category_id` int(11) NOT NULL,
  `threshold_volume` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_transferables`
--

DROP TABLE IF EXISTS `product_transferables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_transferables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_from` int(11) NOT NULL,
  `product_to` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `product_category_id` int(11) NOT NULL,
  `accounting_code_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_losses`
--

DROP TABLE IF EXISTS `production_losses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_losses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb4_bin NOT NULL,
  `movement_date` datetime DEFAULT NULL,
  `production_run_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `product_unit_price` decimal(19,9) NOT NULL,
  `production_result_code_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_movements`
--

DROP TABLE IF EXISTS `production_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_movements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8mb4_bin NOT NULL,
  `movement_date` datetime DEFAULT NULL,
  `bool_input` tinyint(1) NOT NULL DEFAULT '1',
  `bool_aux` tinyint(1) NOT NULL DEFAULT '0',
  `bool_recycling` tinyint(1) NOT NULL DEFAULT '0',
  `stockitem_id` int(11) NOT NULL,
  `production_run_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_unit_price` decimal(19,9) NOT NULL,
  `production_result_code_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_type_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61093 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_result_codes`
--

DROP TABLE IF EXISTS `production_result_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_result_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_runs`
--

DROP TABLE IF EXISTS `production_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_runs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) DEFAULT NULL,
  `production_run_code` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `production_run_date` datetime DEFAULT NULL,
  `raw_material_id` int(11) DEFAULT NULL,
  `raw_material_quantity` int(11) DEFAULT NULL,
  `finished_product_id` int(11) DEFAULT NULL,
  `finished_product_quantity` int(11) DEFAULT NULL,
  `machine_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `meter_start` float DEFAULT NULL,
  `meter_finish` float DEFAULT NULL,
  `bool_annulled` tinyint(1) NOT NULL DEFAULT '0',
  `bool_verified` tinyint(1) NOT NULL DEFAULT '1',
  `production_type_id` int(11) NOT NULL DEFAULT '1',
  `incidence_id` int(11) NOT NULL DEFAULT '0',
  `bag_product_id` int(11) NOT NULL DEFAULT '0',
  `recipe_id` int(11) DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_type_products`
--

DROP TABLE IF EXISTS `production_type_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_type_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_datetime` datetime NOT NULL,
  `production_type_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_types`
--

DROP TABLE IF EXISTS `production_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `long_description` varchar(200) DEFAULT NULL,
  `list_order` int(11) NOT NULL DEFAULT '100',
  `hex_color` varchar(7) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider_natures`
--

DROP TABLE IF EXISTS `provider_natures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_natures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `abbreviation` varchar(30) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_estimation_products`
--

DROP TABLE IF EXISTS `purchase_estimation_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_estimation_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_estimation_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `raw_material_id` int(11) NOT NULL,
  `production_result_code_id` int(11) DEFAULT NULL,
  `product_unit_price` decimal(18,8) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_total_price` decimal(18,8) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `description` text CHARACTER SET utf8mb4,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_estimations`
--

DROP TABLE IF EXISTS `purchase_estimations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_estimations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_estimation_date` datetime DEFAULT NULL,
  `purchase_estimation_code` varchar(45) DEFAULT NULL,
  `bool_annulled` tinyint(1) NOT NULL DEFAULT '0',
  `client_id` int(11) DEFAULT NULL,
  `subtotal_price` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `comment` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order_invoices`
--

DROP TABLE IF EXISTS `purchase_order_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_code` varchar(30) NOT NULL,
  `bool_iva` tinyint(1) DEFAULT '0',
  `invoice_subtotal` decimal(10,2) NOT NULL,
  `invoice_iva` decimal(10,2) NOT NULL,
  `invoice_total` decimal(10,2) NOT NULL,
  `bool_paid` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_cheque_number` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_user_id` int(11) NOT NULL,
  `observation` varchar(150) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=862 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order_products`
--

DROP TABLE IF EXISTS `purchase_order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `product_unit_cost` decimal(18,8) DEFAULT '0.00000000',
  `product_total_cost` decimal(18,8) DEFAULT '0.00000000',
  `currency_id` int(11) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2618 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_order_states`
--

DROP TABLE IF EXISTS `purchase_order_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `long_description` varchar(200) NOT NULL,
  `list_order` int(11) NOT NULL DEFAULT '100',
  `hex_color` varchar(7) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_date` date NOT NULL,
  `purchase_order_code` varchar(45) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `bool_packaging` tinyint(1) NOT NULL DEFAULT '0',
  `provider_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bool_annulled` tinyint(1) DEFAULT '0',
  `bool_iva` tinyint(1) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `cost_subtotal` decimal(10,2) DEFAULT NULL,
  `cost_iva` decimal(10,2) DEFAULT NULL,
  `cost_total` decimal(10,2) DEFAULT NULL,
  `bool_credit` tinyint(1) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `bool_paid` tinyint(1) NOT NULL DEFAULT '0',
  `bool_authorized` tinyint(1) NOT NULL DEFAULT '0',
  `purchase_order_state_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quotation_products`
--

DROP TABLE IF EXISTS `quotation_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `raw_material_id` int(11) DEFAULT NULL,
  `product_description` text,
  `product_unit_price` decimal(18,8) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_total_price` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `bool_iva` tinyint(1) DEFAULT '0',
  `delivery_time` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13476 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quotation_remarks`
--

DROP TABLE IF EXISTS `quotation_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotation_remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `remark_datetime` datetime NOT NULL,
  `remark_text` text NOT NULL,
  `action_type_id` int(11) DEFAULT '0',
  `reminder_date` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quotations`
--

DROP TABLE IF EXISTS `quotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_user_id` int(11) NOT NULL COMMENT 'el usuario quien grabó la cotización',
  `vendor_user_id` int(11) NOT NULL COMMENT 'el usuario quien aportó el cliente para esta cotización',
  `client_id` int(11) DEFAULT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `client_email` varchar(100) DEFAULT NULL,
  `client_phone` varchar(100) DEFAULT NULL,
  `client_ruc` varchar(50) DEFAULT NULL,
  `client_address` text,
  `client_type_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `quotation_date` date NOT NULL,
  `quotation_code` varchar(45) NOT NULL,
  `bool_annulled` tinyint(1) NOT NULL DEFAULT '0',
  `bool_rejected` tinyint(1) DEFAULT '0',
  `due_date` date DEFAULT NULL,
  `bool_iva` tinyint(1) DEFAULT '1',
  `bool_retention` tinyint(1) NOT NULL DEFAULT '0',
  `retention_number` varchar(50) DEFAULT NULL,
  `retention_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_subtotal` decimal(10,2) NOT NULL,
  `price_iva` decimal(10,2) NOT NULL,
  `price_total` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '1',
  `observation` text,
  `sales_order_id` int(11) DEFAULT NULL,
  `bool_sales_order` tinyint(1) NOT NULL DEFAULT '0',
  `warehouse_id` int(11) DEFAULT NULL,
  `bool_credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_authorization_user_id` int(11) DEFAULT NULL COMMENT 'el usuario quien autorizó el crédito',
  `delivery_time` varchar(100) DEFAULT NULL,
  `payment_form` varchar(100) DEFAULT NULL,
  `text_seal` varchar(250) DEFAULT ' Sello de la institución ',
  `text_client_signature` varchar(250) DEFAULT ' Firma Autorizada del Cliente ',
  `authorization` varchar(100) DEFAULT ' Alejandro Ortega, Gerente ',
  `text_authorization` varchar(250) DEFAULT ' Nombre y cargo de quien autoriza ',
  `remark_cheque` varchar(250) DEFAULT NULL,
  `rejected_reason_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `bool_print_delivery_time` tinyint(1) NOT NULL DEFAULT '0',
  `remark_elaboration` varchar(250) DEFAULT NULL,
  `remark_delivery` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3616 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_consumables`
--

DROP TABLE IF EXISTS `recipe_consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_consumables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_items`
--

DROP TABLE IF EXISTS `recipe_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL,
  `mill_conversion_product_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rejected_reasons`
--

DROP TABLE IF EXISTS `rejected_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rejected_reasons` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `list_order` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_objectives`
--

DROP TABLE IF EXISTS `sales_objectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_objectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `objective_date` date NOT NULL,
  `minimum_objective` int(11) NOT NULL,
  `maximum_objective` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_order_products`
--

DROP TABLE IF EXISTS `sales_order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `raw_material_id` int(11) DEFAULT NULL,
  `product_description` text,
  `product_unit_price` decimal(18,8) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_total_price` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `bool_iva` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32727 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_order_remarks`
--

DROP TABLE IF EXISTS `sales_order_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `sales_order_id` int(11) NOT NULL,
  `remark_datetime` datetime NOT NULL,
  `remark_text` text NOT NULL,
  `action_type_id` int(11) DEFAULT '0',
  `working_days_before_reminder` int(11) DEFAULT '0',
  `reminder_date` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_orders`
--

DROP TABLE IF EXISTS `sales_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_user_id` int(11) NOT NULL,
  `vendor_user_id` int(11) DEFAULT NULL,
  `sales_order_date` date NOT NULL,
  `sales_order_code` varchar(45) NOT NULL,
  `bool_annulled` tinyint(1) DEFAULT '0',
  `quotation_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `client_email` varchar(100) DEFAULT NULL,
  `client_phone` varchar(100) DEFAULT NULL,
  `client_ruc` varchar(50) DEFAULT NULL,
  `client_address` text,
  `client_type_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `bool_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_address` text,
  `delivery_id` int(11) NOT NULL,
  `bool_iva` tinyint(1) NOT NULL DEFAULT '1',
  `bool_retention` tinyint(1) NOT NULL DEFAULT '0',
  `retention_number` varchar(50) DEFAULT NULL,
  `retention_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_subtotal` decimal(10,2) NOT NULL,
  `price_iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `currency_id` int(11) NOT NULL,
  `bool_authorized` tinyint(1) DEFAULT '0',
  `authorization_user_id` int(11) DEFAULT '0',
  `observation` text,
  `bool_invoice` tinyint(1) DEFAULT '0',
  `invoice_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL DEFAULT '1',
  `bool_credit` tinyint(1) NOT NULL DEFAULT '0',
  `credit_days` int(11) NOT NULL DEFAULT '0',
  `credit_authorization_user_id` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `delivery_time` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9586 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT '100',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_item_logs`
--

DROP TABLE IF EXISTS `stock_item_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_item_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockitem_id` int(11) NOT NULL,
  `stock_movement_id` int(11) DEFAULT NULL,
  `production_movement_id` int(11) DEFAULT NULL,
  `stockitem_date` datetime NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_unit_price` float NOT NULL,
  `production_result_code_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4289916 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_items`
--

DROP TABLE IF EXISTS `stock_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `description` text COLLATE utf8mb4_bin,
  `stockitem_creation_date` datetime NOT NULL,
  `stockitem_depletion_date` datetime NOT NULL DEFAULT '2025-12-31 00:00:00',
  `product_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `product_unit_price` float NOT NULL,
  `original_quantity` int(11) NOT NULL,
  `remaining_quantity` int(11) NOT NULL,
  `production_result_code_id` int(11) NOT NULL,
  `raw_material_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT '1',
  `bool_active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_type_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39855 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_movement_types`
--

DROP TABLE IF EXISTS `stock_movement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_movement_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stock_movements`
--

DROP TABLE IF EXISTS `stock_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_movements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movement_date` datetime NOT NULL,
  `bool_input` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(250) CHARACTER SET utf8mb4 DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `stockitem_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_unit_price` decimal(19,9) DEFAULT NULL,
  `product_total_price` decimal(18,8) NOT NULL,
  `service_unit_cost` decimal(18,8) DEFAULT NULL,
  `service_total_cost` decimal(18,8) DEFAULT NULL,
  `production_result_code_id` int(11) DEFAULT NULL,
  `bool_reclassification` tinyint(1) NOT NULL DEFAULT '0',
  `origin_stock_movement_id` int(11) DEFAULT NULL,
  `reclassification_code` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `bool_transfer` tinyint(1) DEFAULT '0',
  `transfer_code` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `bool_adjustment` tinyint(1) NOT NULL DEFAULT '0',
  `adjustment_code` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=184426 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `third_parties`
--

DROP TABLE IF EXISTS `third_parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) DEFAULT NULL,
  `bool_provider` tinyint(1) NOT NULL DEFAULT '0',
  `company_name` varchar(45) NOT NULL DEFAULT 'client',
  `provider_nature_id` int(11) DEFAULT NULL,
  `credit_days` int(11) DEFAULT NULL,
  `credit_amount` int(11) NOT NULL DEFAULT '0',
  `credit_currency_id` int(11) NOT NULL DEFAULT '1',
  `expiration_rate` decimal(4,2) NOT NULL DEFAULT '5.00',
  `accounting_code_id` int(11) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `ruc_number` varchar(30) DEFAULT NULL,
  `bool_active` tinyint(1) NOT NULL DEFAULT '1',
  `bool_generic` tinyint(1) NOT NULL DEFAULT '0',
  `bool_individual_pricing` tinyint(1) NOT NULL DEFAULT '0',
  `price_client_category_id` int(11) DEFAULT NULL,
  `client_type_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `creator_user_id` int(11) NOT NULL,
  `owner_user_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `third_party_users`
--

DROP TABLE IF EXISTS `third_party_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `third_party_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `third_party_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assignment_datetime` datetime NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22034 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_date` date NOT NULL,
  `transfer_code` varchar(50) DEFAULT NULL,
  `bank_reference` varchar(200) NOT NULL,
  `concept` varchar(250) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `bank_accounting_code_id` int(11) NOT NULL,
  `cashbox_accounting_code_id` int(11) NOT NULL,
  `accounting_register_id` int(11) NOT NULL,
  `bool_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=636 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `abbreviation` varchar(15) NOT NULL,
  `list_order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_logs`
--

DROP TABLE IF EXISTS `user_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `event` varchar(250) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userlogs_users1_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=490216 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_page_rights`
--

DROP TABLE IF EXISTS `user_page_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_page_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_datetime` datetime NOT NULL,
  `page_right_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bool_allowed` tinyint(1) NOT NULL DEFAULT '0',
  `controller` varchar(20) NOT NULL,
  `action` varchar(30) NOT NULL,
  `logging_user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_plants`
--

DROP TABLE IF EXISTS `user_plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `assignment_datetime` datetime NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_warehouses`
--

DROP TABLE IF EXISTS `user_warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `assignment_datetime` datetime NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `license_plate` varchar(15) NOT NULL,
  `bool_active` tinyint(1) NOT NULL DEFAULT '1',
  `list_order` int(11) NOT NULL DEFAULT '100',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warehouse_products`
--

DROP TABLE IF EXISTS `warehouse_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_datetime` datetime NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `bool_assigned` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `series` varchar(10) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `bool_active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `list_order` int(11) NOT NULL DEFAULT '100',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `inventario`
--

/*!50001 DROP VIEW IF EXISTS `inventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`clientesorn`@`%.%.%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `inventario` AS select `producto`.`name` AS `name`,`producto`.`packaging_unit` AS `packaging_unit`,`producto`.`product_type_id` AS `product_type_id`,`stockitemlog`.`product_id` AS `product_id`,`stockitem`.`raw_material_id` AS `raw_material_id`,sum(`stockitemlog`.`product_quantity`) AS `total`,sum(round((`stockitemlog`.`product_quantity` * `stockitemlog`.`product_unit_price`),3)) AS `Saldo`,sum((case when (`stockitem`.`production_result_code_id` = 1) then `stockitemlog`.`product_quantity` else 0 end)) AS `Remaining_A`,sum((case when (`stockitem`.`production_result_code_id` = 1) then round((`stockitemlog`.`product_quantity` * `stockitemlog`.`product_unit_price`),3) else 0 end)) AS `Saldo_A`,sum((case when (`stockitem`.`production_result_code_id` = 2) then `stockitemlog`.`product_quantity` else 0 end)) AS `Remaining_B`,sum((case when (`stockitem`.`production_result_code_id` = 2) then round((`stockitemlog`.`product_quantity` * `stockitemlog`.`product_unit_price`),3) else 0 end)) AS `Saldo_B`,sum((case when (`stockitem`.`production_result_code_id` = 3) then `stockitemlog`.`product_quantity` else 0 end)) AS `Remaining_C`,sum((case when (`stockitem`.`production_result_code_id` = 3) then round((`stockitemlog`.`product_quantity` * `stockitemlog`.`product_unit_price`),3) else 0 end)) AS `Saldo_C` from (((`stock_item_logs` `stockitemlog` join `stock_items` `stockitem` on((`stockitem`.`id` = `stockitemlog`.`stockitem_id`))) join `maximos` `sm` on((`sm`.`idx` = `stockitemlog`.`id`))) join `products` `producto` on((`producto`.`id` = `stockitemlog`.`product_id`))) where ((`stockitemlog`.`product_quantity` <> 0) and (`stockitem`.`warehouse_id` = 1)) group by `stockitemlog`.`product_id`,`stockitem`.`raw_material_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maximos`
--

/*!50001 DROP VIEW IF EXISTS `maximos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`clientesorn`@`%.%.%.%` SQL SECURITY DEFINER */
/*!50001 VIEW `maximos` AS select `stockitemx`.`id` AS `id`,max(`stockitemlogx`.`id`) AS `idx` from ((`stock_item_logs` `stockitemlogx` join `stock_items` `stockitemx` on((`stockitemx`.`id` = `stockitemlogx`.`stockitem_id`))) join `products` `productox` on((`productox`.`id` = `stockitemlogx`.`product_id`))) where ((`stockitemlogx`.`stockitem_date` < (curdate() + interval 1 day)) and (0 <> (case when (((`productox`.`product_type_id` = 11) or (`productox`.`product_type_id` = 9) or (`productox`.`product_type_id` = 18)) and (`stockitemx`.`stockitem_depletion_date` > curdate())) then 1 when (`productox`.`product_type_id` not in (9,11,12,17)) then 1 else 0 end))) group by `stockitemx`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-30  9:46:13
