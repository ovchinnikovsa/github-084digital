CREATE TABLE `084digital_db`.`authors` (
    `author_id` INT(16) NOT NULL AUTO_INCREMENT,
    `login` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`author_id`)
) ENGINE = InnoDB;

CREATE TABLE `084digital_db`.`articles` (
    `article_id` INT(16) NOT NULL AUTO_INCREMENT,
    `header` VARCHAR(255) NOT NULL,
    `text` TEXT NOT NULL,
    `date` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`article_id`)
) ENGINE = InnoDB;

CREATE TABLE `084digital_db`.`comments` (
    `comment_id` INT(255) NOT NULL AUTO_INCREMENT,
    `login` VARCHAR(255) NOT NULL,
    `text` TEXT NOT NULL,
    `article_id_comments` INT(255) NOT NULL,
    PRIMARY KEY (`comment_id`)
) ENGINE = InnoDB;

ALTER TABLE
    `articles`
ADD
    `author_id` INT(16) NOT NULL
AFTER
    `date`;