-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bucket_list_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bucket_list_db` ;

-- -----------------------------------------------------
-- Schema bucket_list_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bucket_list_db` DEFAULT CHARACTER SET utf8 ;
USE `bucket_list_db` ;

-- -----------------------------------------------------
-- Table `bucket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bucket` ;

CREATE TABLE IF NOT EXISTS `bucket` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '	',
  `object_person` VARCHAR(100) NOT NULL,
  `time_frame` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NOT NULL,
  `gps_coords` VARCHAR(45) NULL,
  `bucket_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_location_bucket`
    FOREIGN KEY (`bucket_id`)
    REFERENCES `bucket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_location_bucket1_idx` ON `location` (`bucket_id` ASC);


-- -----------------------------------------------------
-- Table `pictures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pictures` ;

CREATE TABLE IF NOT EXISTS `pictures` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(100) NULL,
  `url` VARCHAR(100) NOT NULL,
  `bucket_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pictures_bucket`
    FOREIGN KEY (`bucket_id`)
    REFERENCES `bucket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pictures_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_pictures_bucket1_idx` ON `pictures` (`bucket_id` ASC);

CREATE INDEX `fk_pictures_location1_idx` ON `pictures` (`location_id` ASC);

SET SQL_MODE = '';
GRANT USAGE ON *.* TO bucketuser@localhost;
 DROP USER bucketuser@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'bucketuser'@'localhost' IDENTIFIED BY 'bucketuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'bucketuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `bucket`
-- -----------------------------------------------------
START TRANSACTION;
USE `bucket_list_db`;
INSERT INTO `bucket` (`id`, `object_person`, `time_frame`) VALUES (1, 'Dalai Lama', 'Before he dies');
INSERT INTO `bucket` (`id`, `object_person`, `time_frame`) VALUES (2, 'Stephen Hawking', 'Next couple years');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `bucket_list_db`;
INSERT INTO `location` (`id`, `country_name`, `gps_coords`, `bucket_id`) VALUES (1, 'McLeod Ganj, India', '32.2425758, 76.32127809999997', DEFAULT);
INSERT INTO `location` (`id`, `country_name`, `gps_coords`, `bucket_id`) VALUES (2, 'Cambridge, UK', '52.205337, 0.12181699999996454', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pictures`
-- -----------------------------------------------------
START TRANSACTION;
USE `bucket_list_db`;
INSERT INTO `pictures` (`id`, `description`, `url`, `bucket_id`, `location_id`) VALUES (1, 'This is the Dalai Lama', 'https://upload.wikimedia.org/wikipedia/commons/5/55/Dalailama1_20121014_4639.jpg', 1, 1);
INSERT INTO `pictures` (`id`, `description`, `url`, `bucket_id`, `location_id`) VALUES (2, 'This is Stephen Hawking', 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Stephen_Hawking.StarChild.jpg', 2, 2);

COMMIT;

