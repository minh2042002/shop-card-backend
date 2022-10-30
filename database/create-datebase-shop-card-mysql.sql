CREATE TABLE IF NOT EXISTS `role` (
  id int PRIMARY KEY AUTO_INCREMENT,
  `name` ENUM('admin', 'role') NOT NULL
);

CREATE TABLE IF NOT EXISTS `user` (
  id int PRIMARY KEY AUTO_INCREMENT,
  full_name varchar(50) NOT NULL,
  email varchar(150) UNIQUE NOT NULL,
  phone varchar(10) UNIQUE NOT NULL,
  address varchar(150),
  `password` varchar(32) NOT NULL,
  role_id int NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE IF NOT EXISTS category (
  id int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS product (
  id int PRIMARY KEY AUTO_INCREMENT,
  category_id int NOT NULL,
  title text NOT NULL,
  price int NOT NULL,
  discount float,
  `description` text NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS image_product (
  id int PRIMARY KEY AUTO_INCREMENT,
  product_id int NOT NULL,
  image_link text NOT NULL
);

CREATE TABLE IF NOT EXISTS feedback (
  id int PRIMARY KEY AUTO_INCREMENT,
  full_name varchar(50) NOT NULL,
  email varchar(150) NOT NULL UNIQUE,
  phone varchar(10) NOT NULL UNIQUE,
  title varchar(100) NOT NULL,
  note text NOT NULL
);

CREATE TABLE IF NOT EXISTS `order` (
  id int PRIMARY KEY AUTO_INCREMENT,
  user_id int NOT NULL,
  full_name varchar(50) NOT NULL,
  email varchar(150) NOT NULL,
  phone varchar(10) NOT NULL,
  address varchar(150) NOT NULL,
  note text,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `status` BIT(1) NOT NULL
);

CREATE TABLE IF NOT EXISTS order_details (
  id int PRIMARY KEY AUTO_INCREMENT,
  order_id int NOT NULL,
  product_id int NOT NULL,
  count_product int NOT NULL
);

ALTER TABLE `user` ADD FOREIGN KEY (role_id) REFERENCES role (id);

ALTER TABLE product ADD FOREIGN KEY (category_id) REFERENCES category (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE image_product ADD FOREIGN KEY (product_id) REFERENCES product (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `order` ADD FOREIGN KEY (user_id) REFERENCES `user` (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE order_details ADD FOREIGN KEY (order_id) REFERENCES `order` (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE order_details ADD FOREIGN KEY (product_id) REFERENCES product (id) ON UPDATE CASCADE ON DELETE CASCADE;
