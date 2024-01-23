SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8 ;
USE mydb ;
-- -----------------------------------------------------
-- Table mydb.Cars
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Cars (
  VIN INT UNSIGNED NOT NULL,
  Manufacturer VARCHAR(45) NOT NULL,
  Model VARCHAR(45) NOT NULL,
  Year INT NOT NULL,
  Color VARCHAR(45) NOT NULL,
  PRIMARY KEY (VIN),
  UNIQUE INDEX VIN_UNIQUE (VIN ASC) VISIBLE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table mydb.Customers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Customers (
  Customer_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Customer_Name VARCHAR(45) NOT NULL,
  Phone_Number INT UNSIGNED NOT NULL,
  Email VARCHAR(45) NOT NULL,
  Address VARCHAR(45) NOT NULL,
  City VARCHAR(45) NOT NULL,
  State_Province VARCHAR(45) NOT NULL,
  Country VARCHAR(45) NOT NULL,
  Zip_Postal_Code VARCHAR(45) NOT NULL,
  PRIMARY KEY (Customer_ID),
  UNIQUE INDEX Customer_ID_UNIQUE (Customer_ID ASC) VISIBLE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table mydb.Store Locations
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Store_Locations (
  Location_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Location_Name VARCHAR(45) NULL,
  Location_Address VARCHAR(45) NULL,
  Location_City VARCHAR(45) NULL,
  Location_State VARCHAR(45) NULL,
  Location_Country VARCHAR(45) NULL,
  Location_Zip_Postal_Code VARCHAR(45) NULL,
  PRIMARY KEY (Location_ID),
  UNIQUE INDEX Location_ID_UNIQUE (Location_ID ASC) VISIBLE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table mydb.Salespersons
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Salespersons (
  Staff_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
  Staff_Name VARCHAR(45) NOT NULL,
  Store_Locations_Location_ID INT UNSIGNED NOT NULL,
  PRIMARY KEY (Staff_ID, Store Locations_Location_ID),
  UNIQUE INDEX Staff_ID_UNIQUE (Staff_ID ASC) VISIBLE,
  INDEX fk_Salespersons_Store Locations1_idx (Store Locations_Location_ID ASC) VISIBLE,
  CONSTRAINT fk_Salespersons_Store Locations1
    FOREIGN KEY (Store Locations_Location_ID)
    REFERENCES mydb.Store Locations (Location_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table mydb.Invoices
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Invoices (
  Cars_VIN INT UNSIGNED NOT NULL,
  Customers_Customer_ID INT UNSIGNED NOT NULL,
  Invoice_Number INT UNSIGNED NOT NULL,
  Invoice_Date DATETIME NOT NULL,
  Salespersons_Staff_ID INT UNSIGNED NOT NULL,
  INDEX fk_Cars_has_Customers_Customers1_idx (Customers_Customer_ID ASC) VISIBLE,
  INDEX fk_Cars_has_Customers_Cars1_idx (Cars_VIN ASC) VISIBLE,
  PRIMARY KEY (Invoice_Number),
  INDEX fk_Invoices_Salespersons1_idx (Salespersons_Staff_ID ASC) VISIBLE,
  CONSTRAINT fk_Cars_has_Customers_Cars1
    FOREIGN KEY (Cars_VIN)
    REFERENCES mydb.Cars (VIN)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Cars_has_Customers_Customers1
    FOREIGN KEY (Customers_Customer_ID)
    REFERENCES mydb.Customers (Customer_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Invoices_Salespersons1
    FOREIGN KEY (Salespersons_Staff_ID)
    REFERENCES mydb.Salespersons (Staff_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;