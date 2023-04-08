-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BadiBasket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BadiBasket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BadiBasket` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema badibasket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema badibasket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `badibasket` DEFAULT CHARACTER SET utf8mb3 ;
USE `BadiBasket` ;

-- -----------------------------------------------------
-- Table `BadiBasket`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`Employee` (
  `idEmployee` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_name` CHAR(45) NOT NULL,
  `job_title` CHAR(45) NOT NULL,
  `salary` INT NOT NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`Admin` (
  `idAdmin` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_name` CHAR(45) NOT NULL,
  `admin_username` VARCHAR(45) NOT NULL,
  `admin_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdmin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`Product` (
  `idProduct` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` CHAR(45) NOT NULL,
  `product_type` CHAR(45) NOT NULL,
  `product_quantity` INT NULL,
  `product_price` VARCHAR(45) NOT NULL,
  `expiry_date` DATE NOT NULL,
  `discount_percent` INT NOT NULL,
  `aisle_number` INT NOT NULL,
  PRIMARY KEY (`idProduct`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`Discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`Discount` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `discount_name` VARCHAR(50) NULL,
  `discount_percent` INT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`Cart` (
  `idCart` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_price` INT NOT NULL,
  `discount_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCart`),
  INDEX `discount_id_idx` (`discount_id` ASC) VISIBLE,
  CONSTRAINT `discount_id`
    FOREIGN KEY (`discount_id`)
    REFERENCES `BadiBasket`.`Discount` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`Customer` (
  `idCustomer` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` CHAR(45) NOT NULL,
  `contact_info` INT NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `delivery_partner_id` INT UNSIGNED NOT NULL,
  `cart_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `cart_id_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `cart_id`
    FOREIGN KEY (`cart_id`)
    REFERENCES `BadiBasket`.`Cart` (`idCart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`Order` (
  `idOrder` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mode_of_payment` CHAR(45) NOT NULL,
  `total_amount` INT NOT NULL,
  `estimated_time_of_delivery` DATE NOT NULL,
  `shipping_address` VARCHAR(100) NOT NULL,
  `products_on_discount` LONGTEXT NOT NULL,
  `minimum_order_value` INT NOT NULL,
  `max_discount` INT NOT NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `BadiBasket`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`Delivery_Partner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`Delivery_Partner` (
  `idDelivery_Partner` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_name` CHAR(45) NOT NULL,
  `partner_contact` INT NOT NULL,
  `partner_rating` INT NOT NULL,
  `order_id_received` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idDelivery_Partner`),
  INDEX `order_id_idx` (`order_id_received` ASC) VISIBLE,
  CONSTRAINT `order_id_received`
    FOREIGN KEY (`order_id_received`)
    REFERENCES `BadiBasket`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`Rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`Rating` (
  `idRating` INT NOT NULL,
  `delivery_partner_id` INT UNSIGNED NOT NULL,
  `customer_id_rates` INT UNSIGNED NOT NULL,
  `rating` INT NULL,
  PRIMARY KEY (`idRating`),
  INDEX `delivery_partner_id_idx` (`delivery_partner_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id_rates` ASC) INVISIBLE,
  CONSTRAINT `delivery_partner_id`
    FOREIGN KEY (`delivery_partner_id`)
    REFERENCES `BadiBasket`.`Delivery_Partner` (`idDelivery_Partner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_id_rates`
    FOREIGN KEY (`customer_id_rates`)
    REFERENCES `BadiBasket`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`add_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`add_products` (
  `employee_id_add` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  INDEX `employee_id_idx` (`employee_id_add` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `employee_id`
    FOREIGN KEY (`employee_id_add`)
    REFERENCES `BadiBasket`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `BadiBasket`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`products_in_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`products_in_cart` (
  `product_id_inCart` INT UNSIGNED NOT NULL,
  `cart_id_inside` INT UNSIGNED NOT NULL,
  INDEX `product_id_idx` (`product_id_inCart` ASC) VISIBLE,
  INDEX `cart_id_idx` (`cart_id_inside` ASC) VISIBLE,
  CONSTRAINT `product_id_inCart`
    FOREIGN KEY (`product_id_inCart`)
    REFERENCES `BadiBasket`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cart_id_inside`
    FOREIGN KEY (`cart_id_inside`)
    REFERENCES `BadiBasket`.`Cart` (`idCart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`customer_order_partner_link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`customer_order_partner_link` (
  `customer_id_order` INT UNSIGNED NOT NULL,
  `delivery_id` INT UNSIGNED NOT NULL,
  `order_id_completed` INT UNSIGNED NOT NULL,
  INDEX `delivery_partner_id_idx` (`delivery_id` ASC) VISIBLE,
  INDEX `order_id_idx` (`order_id_completed` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id_order` ASC) VISIBLE,
  CONSTRAINT `customer_id_order`
    FOREIGN KEY (`customer_id_order`)
    REFERENCES `BadiBasket`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_id_completed`
    FOREIGN KEY (`order_id_completed`)
    REFERENCES `BadiBasket`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `delivery_id`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `BadiBasket`.`Delivery_Partner` (`idDelivery_Partner`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`admin_employee_link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`admin_employee_link` (
  `admin_id` INT UNSIGNED NOT NULL,
  `employee_id_forAdmin` INT UNSIGNED NOT NULL,
  INDEX `id1_idx` (`admin_id` ASC) VISIBLE,
  INDEX `id2_idx` (`employee_id_forAdmin` ASC) VISIBLE,
  CONSTRAINT `admin_id`
    FOREIGN KEY (`admin_id`)
    REFERENCES `BadiBasket`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `employee_id_forAdmin`
    FOREIGN KEY (`employee_id_forAdmin`)
    REFERENCES `BadiBasket`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BadiBasket`.`admin_adds_discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BadiBasket`.`admin_adds_discount` (
  `admin_id_addsDisc` INT UNSIGNED NOT NULL,
  `discount_id_add` INT UNSIGNED NOT NULL,
  INDEX `admin_id_idx` (`admin_id_addsDisc` ASC) VISIBLE,
  INDEX `discount_idx` (`discount_id_add` ASC) VISIBLE,
  CONSTRAINT `admin_id_addsDisc`
    FOREIGN KEY (`admin_id_addsDisc`)
    REFERENCES `BadiBasket`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `discount_id_add`
    FOREIGN KEY (`discount_id_add`)
    REFERENCES `BadiBasket`.`Discount` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `badibasket` ;

-- -----------------------------------------------------
-- Table `badibasket`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`employee` (
  `idEmployee` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_name` CHAR(45) NOT NULL,
  `job_title` CHAR(45) NOT NULL,
  `salary` INT NOT NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`product` (
  `idProduct` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` CHAR(45) NOT NULL,
  `product_type` CHAR(45) NOT NULL,
  `product_quantity` INT NULL DEFAULT NULL,
  `product_price` VARCHAR(45) NOT NULL,
  `expiry_date` DATE NOT NULL,
  `discount_percent` INT NOT NULL,
  `aisle_number` INT NOT NULL,
  PRIMARY KEY (`idProduct`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`add_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`add_products` (
  `employee_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  INDEX `employee_id_idx` (`employee_id` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `badibasket`.`employee` (`idEmployee`),
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `badibasket`.`product` (`idProduct`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`admin` (
  `idAdmin` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_name` CHAR(45) NOT NULL,
  `admin_username` VARCHAR(45) NOT NULL,
  `admin_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdmin`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`discount` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `discount_name` VARCHAR(50) NULL DEFAULT NULL,
  `discount_percent` INT NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`admin_adds_discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`admin_adds_discount` (
  `admin_id_addsDisc` INT UNSIGNED NOT NULL,
  `discount_id_add` INT UNSIGNED NOT NULL,
  INDEX `admin_id_idx` (`admin_id_addsDisc` ASC) VISIBLE,
  INDEX `discount_idx` (`discount_id_add` ASC) VISIBLE,
  CONSTRAINT `admin_id_addsDisc`
    FOREIGN KEY (`admin_id_addsDisc`)
    REFERENCES `badibasket`.`admin` (`idAdmin`),
  CONSTRAINT `discount_id_add`
    FOREIGN KEY (`discount_id_add`)
    REFERENCES `badibasket`.`discount` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`admin_employee_link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`admin_employee_link` (
  `admin_id` INT UNSIGNED NOT NULL,
  `employee_id_forAdmin` INT UNSIGNED NOT NULL,
  INDEX `id1_idx` (`admin_id` ASC) VISIBLE,
  INDEX `id2_idx` (`employee_id_forAdmin` ASC) VISIBLE,
  CONSTRAINT `admin_id`
    FOREIGN KEY (`admin_id`)
    REFERENCES `badibasket`.`admin` (`idAdmin`),
  CONSTRAINT `employee_id_forAdmin`
    FOREIGN KEY (`employee_id_forAdmin`)
    REFERENCES `badibasket`.`employee` (`idEmployee`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`cart` (
  `idCart` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_price` INT NOT NULL,
  `discount_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCart`),
  INDEX `discount_id_idx` (`discount_id` ASC) VISIBLE,
  CONSTRAINT `discount_id`
    FOREIGN KEY (`discount_id`)
    REFERENCES `badibasket`.`discount` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`customer` (
  `idCustomer` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` CHAR(45) NOT NULL,
  `contact_info` INT NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `delivery_partner_id` INT UNSIGNED NOT NULL,
  `cart_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `cart_id_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `cart_id`
    FOREIGN KEY (`cart_id`)
    REFERENCES `badibasket`.`cart` (`idCart`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`order` (
  `idOrder` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mode_of_payment` CHAR(45) NOT NULL,
  `total_amount` INT NOT NULL,
  `estimated_time_of_delivery` DATE NOT NULL,
  `shipping_address` VARCHAR(100) NOT NULL,
  `products_on_discount` LONGTEXT NOT NULL,
  `minimum_order_value` INT NOT NULL,
  `max_discount` INT NOT NULL,
  `customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `badibasket`.`customer` (`idCustomer`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`delivery_partner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`delivery_partner` (
  `idDelivery_Partner` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_name` CHAR(45) NOT NULL,
  `partner_contact` INT NOT NULL,
  `partner_rating` INT NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idDelivery_Partner`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `badibasket`.`order` (`idOrder`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`customer_order_partner_link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`customer_order_partner_link` (
  `customer_id_order` INT UNSIGNED NOT NULL,
  `delivery_id` INT UNSIGNED NOT NULL,
  `order_id_completed` INT UNSIGNED NOT NULL,
  INDEX `delivery_partner_id_idx` (`delivery_id` ASC) VISIBLE,
  INDEX `order_id_idx` (`order_id_completed` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id_order` ASC) VISIBLE,
  CONSTRAINT `customer_id_order`
    FOREIGN KEY (`customer_id_order`)
    REFERENCES `badibasket`.`customer` (`idCustomer`),
  CONSTRAINT `delivery_id`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `badibasket`.`delivery_partner` (`idDelivery_Partner`),
  CONSTRAINT `order_id_completed`
    FOREIGN KEY (`order_id_completed`)
    REFERENCES `badibasket`.`order` (`idOrder`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`products_in_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`products_in_cart` (
  `product_id_inCart` INT UNSIGNED NOT NULL,
  `cart_id_inside` INT UNSIGNED NOT NULL,
  INDEX `product_id_idx` (`product_id_inCart` ASC) VISIBLE,
  INDEX `cart_id_idx` (`cart_id_inside` ASC) VISIBLE,
  CONSTRAINT `cart_id_inside`
    FOREIGN KEY (`cart_id_inside`)
    REFERENCES `badibasket`.`cart` (`idCart`),
  CONSTRAINT `product_id_inCart`
    FOREIGN KEY (`product_id_inCart`)
    REFERENCES `badibasket`.`product` (`idProduct`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `badibasket`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `badibasket`.`rating` (
  `idRating` INT NOT NULL,
  `delivery_partner_id` INT UNSIGNED NOT NULL,
  `customer_id_rates` INT UNSIGNED NOT NULL,
  `rating` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idRating`),
  INDEX `delivery_partner_id_idx` (`delivery_partner_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id_rates` ASC) INVISIBLE,
  CONSTRAINT `customer_id_rates`
    FOREIGN KEY (`customer_id_rates`)
    REFERENCES `badibasket`.`customer` (`idCustomer`),
  CONSTRAINT `delivery_partner_id`
    FOREIGN KEY (`delivery_partner_id`)
    REFERENCES `badibasket`.`delivery_partner` (`idDelivery_Partner`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
