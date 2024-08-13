CREATE TABLE IF NOT EXISTS `grocery_store`.`produts` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `uom_id` INT NOT NULL,
  `price_per_unit` DOUBLE NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fx_uom_id_idx` (`uom_id` ASC) VISIBLE,
  CONSTRAINT `fx_uom_id`
    FOREIGN KEY (`uom_id`)
    REFERENCES `grocery_store`.`uom` (`uom_id`)
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `grocery_store`.`uom` (
  `uom_id` INT NOT NULL AUTO_INCREMENT,
  `uom_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uom_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `grocery_store`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `total` DOUBLE NOT NULL,
  `datetime` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci

CREATE TABLE IF NOT EXISTS `grocery_store`.`order_details` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quatity` DOUBLE NOT NULL,
  `total_price` DOUBLE NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fx_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fx_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `grocery_store`.`orders` (`order_id`)
    ON UPDATE RESTRICT,
  CONSTRAINT `fx_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `grocery_store`.`produts` (`product_id`)
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci