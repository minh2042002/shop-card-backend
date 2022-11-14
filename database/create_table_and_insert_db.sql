-- CREATE TABLE ON DATABASE

CREATE TABLE IF NOT EXISTS `user` (
  id int PRIMARY KEY AUTO_INCREMENT,
  full_name varchar(50) NOT NULL,
  email varchar(150) UNIQUE NOT NULL,
  phone varchar(10) UNIQUE NOT NULL,
  `address` varchar(150),
  avatar_link text,
  `password` TEXT NOT NULL,
  `role` ENUM('admin', 'user') NOT NULL,
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
  user_id int NOT NULL,
  title varchar(100) NOT NULL,
  note text NOT NULL
);

CREATE TABLE IF NOT EXISTS `order` (
  id int PRIMARY KEY AUTO_INCREMENT,
  user_id int NOT NULL,
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

ALTER TABLE product ADD FOREIGN KEY (category_id) REFERENCES category (id) ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE image_product ADD FOREIGN KEY (product_id) REFERENCES product (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `order` ADD FOREIGN KEY (user_id) REFERENCES `user` (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE order_details ADD FOREIGN KEY (order_id) REFERENCES `order` (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE order_details ADD FOREIGN KEY (product_id) REFERENCES product (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE feedback ADD FOREIGN KEY (user_id) REFERENCES `user` (id) ON UPDATE CASCADE ON DELETE CASCADE;

-- INSERT DATABASE

-- insert user table
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (1,'Sallee Odegaard','sodegaard0@blogtalkradio.com','5051146842','008 Stang Parkway','http://dummyimage.com/227x100.png/dddddd/000000','R12je8fBL','admin','2022-05-10 05:00:37','2021-11-22 09:17:07');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (2,'Marja Pott','mpott1@indiatimes.com','7926391982','3321 Lighthouse Bay Place','http://dummyimage.com/213x100.png/dddddd/000000','AFst0lz','user','2021-11-20 18:23:35','2022-08-29 05:22:16');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (3,'Leonanie Deighan','ldeighan2@independent.co.uk','3996969939','2 Del Sol Crossing','http://dummyimage.com/231x100.png/ff4444/ffffff','Y85tj34vb1r','admin','2022-02-04 00:46:18','2022-03-27 21:57:19');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (4,'Hermann Ruecastle','hruecastle3@google.it','6253393168','3738 Delladonna Street','http://dummyimage.com/119x100.png/dddddd/000000','Y2wE9E','admin','2022-05-23 07:07:18','2022-09-12 05:37:39');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (5,'Todd Kirdsch','tkirdsch4@cnn.com','5674683937','0 Holmberg Pass','http://dummyimage.com/210x100.png/5fa2dd/ffffff','2FQZbpa1uR','admin','2022-01-23 16:46:40','2022-02-16 15:26:54');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (6,'Lock Kuhle','lkuhle5@hugedomains.com','3987276058','8396 Lyons Pass','http://dummyimage.com/101x100.png/ff4444/ffffff','cIinpZv','admin','2022-09-15 05:13:39','2022-03-09 00:32:17');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (7,'Halley Raffeorty','hraffeorty6@marketwatch.com','3381685797','10227 Kedzie Pass','http://dummyimage.com/174x100.png/ff4444/ffffff','5ZUkL0T','admin','2022-10-09 10:26:54','2022-05-28 18:48:35');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (8,'Guillemette Bohan','gbohan7@example.com','1154989781','0834 Melby Lane','http://dummyimage.com/173x100.png/dddddd/000000','Ly5tkcGvF3u','admin','2022-01-19 16:42:04','2022-01-07 00:34:23');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (9,'Briny Dedon','bdedon8@blinklist.com','3064404084','1250 Loftsgordon Street','http://dummyimage.com/138x100.png/dddddd/000000','VtM4j7Le5','admin','2022-03-30 22:31:11','2022-06-07 14:23:36');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (10,'Adriano Crosier','acrosier9@umn.edu','2846410019','25 Mandrake Street','http://dummyimage.com/227x100.png/ff4444/ffffff','rQLG9OSwpL','user','2022-03-13 09:21:04','2022-04-10 19:25:44');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (11,'Mersey Gudgen','mgudgena@omniture.com','6059670578','71889 Eagle Crest Alley','http://dummyimage.com/189x100.png/cc0000/ffffff','ovyrCfh4dxK','user','2022-03-28 20:20:03','2022-08-28 13:11:55');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (12,'Eleonora Blazy','eblazyb@newyorker.com','4907778803','479 Vera Plaza','http://dummyimage.com/103x100.png/cc0000/ffffff','b3PywNPWR','user','2021-10-31 21:37:41','2022-07-17 20:01:30');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (13,'Cobbie Bartelet','cbarteletc@joomla.org','9311559774','8809 Eastlawn Junction','http://dummyimage.com/127x100.png/dddddd/000000','kjoKJOGVSPc','user','2022-05-15 20:22:38','2022-09-07 08:27:45');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (14,'Lamont Jouanet','ljouanetd@spiegel.de','5965587461','16 Iowa Hill','http://dummyimage.com/163x100.png/ff4444/ffffff','LNhhY8G1','admin','2022-03-10 13:33:41','2022-04-01 23:04:49');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (15,'Gilligan Loughlan','gloughlane@list-manage.com','1139772768','77742 Kedzie Point','http://dummyimage.com/164x100.png/ff4444/ffffff','egbuPJBi5qK9','admin','2022-08-28 21:27:43','2022-02-11 00:01:48');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (16,'Sully Gronno','sgronnof@yellowpages.com','3985210174','45285 Golden Leaf Place','http://dummyimage.com/247x100.png/ff4444/ffffff','6LaLJlzy4','user','2022-08-21 14:14:26','2022-04-17 06:17:49');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (17,'Wylma Watsham','wwatshamg@usda.gov','2467911497','7 Old Shore Court','http://dummyimage.com/120x100.png/cc0000/ffffff','w7fOFMIjStsA','admin','2022-04-01 08:28:50','2022-08-02 20:23:40');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (18,'Ax Kornyshev','akornyshevh@google.co.jp','9551657909','90 Northfield Drive','http://dummyimage.com/107x100.png/ff4444/ffffff','GZYpggOYTReE','admin','2022-02-12 00:37:27','2022-08-25 08:03:48');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (19,'Marget Riteley','mriteleyi@reddit.com','3327696247','2 Talisman Hill','http://dummyimage.com/214x100.png/5fa2dd/ffffff','5yFcuZovVHT','admin','2021-11-13 21:40:28','2022-04-30 11:15:27');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (20,'Jelene Foxworthy','jfoxworthyj@nba.com','9395639630','99207 Raven Place','http://dummyimage.com/113x100.png/dddddd/000000','FXf0h3H','user','2021-11-30 21:04:46','2022-07-10 21:53:10');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (21,'Noel Hackinge','nhackingek@europa.eu','5979798718','507 Menomonie Lane','http://dummyimage.com/164x100.png/dddddd/000000','IWmfHA','user','2022-02-22 11:29:32','2022-07-14 00:17:46');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (22,'Kurtis Tulleth','ktullethl@wunderground.com','6255102742','3430 Moose Trail','http://dummyimage.com/242x100.png/cc0000/ffffff','3jJFHjoAC','user','2022-01-15 10:39:47','2022-08-18 20:15:03');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (23,'Cesar Watts','cwattsm@fastcompany.com','3372688894','571 Dixon Hill','http://dummyimage.com/219x100.png/cc0000/ffffff','iOXP4hV','user','2022-08-02 20:10:58','2021-12-25 02:40:32');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (24,'Biddy Eymer','beymern@jigsy.com','7653494590','9 Stuart Lane','http://dummyimage.com/178x100.png/ff4444/ffffff','EJrRIUF','user','2022-09-22 08:48:20','2022-01-18 05:15:14');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (25,'Bayard Christoforou','bchristoforouo@rambler.ru','1594852467','6841 Blue Bill Park Circle','http://dummyimage.com/167x100.png/dddddd/000000','Ezydwxg','user','2022-04-20 09:31:36','2021-12-24 11:04:12');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (26,'Todd Budnik','tbudnikp@flickr.com','5157718040','3908 Southridge Drive','http://dummyimage.com/225x100.png/dddddd/000000','6Fi6rbip','user','2022-03-15 02:51:05','2021-11-15 04:49:12');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (27,'Ralf Dowyer','rdowyerq@google.ru','4799331942','79506 Sullivan Junction','http://dummyimage.com/241x100.png/5fa2dd/ffffff','W6JYFygDk','admin','2022-07-22 17:20:20','2022-07-13 17:14:24');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (28,'Aaren Andrejevic','aandrejevicr@goo.ne.jp','5567105699','5 Chive Park','http://dummyimage.com/111x100.png/dddddd/000000','PXY355zLf9P','admin','2022-02-24 01:05:56','2022-03-11 00:04:09');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (29,'Chadwick Agge','cagges@1688.com','6525482625','31 Morrow Park','http://dummyimage.com/189x100.png/ff4444/ffffff','tAK4OgVpE','admin','2022-03-01 10:32:07','2022-06-17 12:15:39');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (30,'Prent Hanes','phanest@dyndns.org','1096438163','63005 Riverside Junction','http://dummyimage.com/150x100.png/ff4444/ffffff','Ner1q1rKUL4u','user','2022-06-03 08:11:27','2021-12-29 02:11:42');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (31,'Marjie Legonidec','mlegonidecu@nytimes.com','5355983361','4 Center Alley','http://dummyimage.com/192x100.png/dddddd/000000','zHiLNg0Ia','user','2022-03-26 19:14:39','2022-07-12 11:43:02');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (32,'Dusty Leathe','dleathev@theglobeandmail.com','7782962245','4907 Pepper Wood Crossing','http://dummyimage.com/104x100.png/ff4444/ffffff','zOj9h0tdmKv','admin','2021-12-27 05:25:39','2022-04-14 20:43:25');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (33,'Dion Padson','dpadsonw@java.com','7154533426','72 Hoard Way','http://dummyimage.com/183x100.png/cc0000/ffffff','8W86wx','admin','2022-04-18 10:36:05','2022-10-17 15:04:40');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (34,'Mahala Mewitt','mmewittx@paginegialle.it','1705938310','22727 Drewry Trail','http://dummyimage.com/180x100.png/ff4444/ffffff','cfCligGOPx','admin','2022-06-06 13:53:07','2022-08-02 20:06:54');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (35,'Jelene Turvey','jturveyy@sohu.com','6288918481','4762 Kennedy Road','http://dummyimage.com/222x100.png/5fa2dd/ffffff','BEt7nAL70','user','2022-03-09 15:23:20','2022-07-27 05:43:07');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (36,'Dougy Eagell','deagellz@merriam-webster.com','7014093352','4063 Miller Place','http://dummyimage.com/130x100.png/cc0000/ffffff','OLsfWtajo8f','user','2022-10-07 12:58:40','2021-12-19 18:13:45');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (37,'Jada Gauntlett','jgauntlett10@is.gd','5294459214','1 Namekagon Pass','http://dummyimage.com/169x100.png/ff4444/ffffff','2pe6KQ8','admin','2021-12-12 18:27:24','2021-11-04 13:15:30');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (38,'Helen Maunton','hmaunton11@twitpic.com','7294971059','3 Lillian Crossing','http://dummyimage.com/193x100.png/ff4444/ffffff','qlha4P','user','2021-11-03 18:07:20','2021-12-28 11:43:19');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (39,'Rina Lutz','rlutz12@tmall.com','6702647714','0747 Buhler Pass','http://dummyimage.com/180x100.png/dddddd/000000','vtNADF','admin','2022-02-22 02:21:45','2022-10-20 16:06:24');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (40,'Alyss Sheirlaw','asheirlaw13@blogtalkradio.com','5611355269','652 Loftsgordon Street','http://dummyimage.com/108x100.png/cc0000/ffffff','ySma9EiJoLG','user','2021-12-01 07:58:16','2021-11-09 14:45:15');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (41,'Ronny Lackinton','rlackinton14@nsw.gov.au','7207289814','65 Shopko Point','http://dummyimage.com/170x100.png/cc0000/ffffff','jWbA7g73K','user','2022-04-11 22:21:03','2022-03-12 18:02:54');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (42,'Shawn Snepp','ssnepp15@xinhuanet.com','4734498441','9788 Twin Pines Plaza','http://dummyimage.com/167x100.png/cc0000/ffffff','tbaeSw','admin','2021-11-07 11:10:10','2022-06-21 06:23:44');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (43,'Lizzy McCartney','lmccartney16@baidu.com','8682081148','721 Carioca Junction','http://dummyimage.com/230x100.png/dddddd/000000','qlT4Qhr','user','2022-03-18 02:31:46','2021-11-10 15:37:47');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (44,'Maurice Newlyn','mnewlyn17@plala.or.jp','5708040233','8789 Washington Point','http://dummyimage.com/204x100.png/ff4444/ffffff','COdzMdMWd8b','user','2021-12-18 05:11:26','2022-10-16 00:10:53');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (45,'Geno Banthorpe','gbanthorpe18@yale.edu','1473930426','100 Anthes Pass','http://dummyimage.com/220x100.png/ff4444/ffffff','ww5HZbVI','admin','2022-08-26 17:49:35','2022-09-11 09:54:00');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (46,'Pamelina Alibone','palibone19@amazon.co.uk','6794875472','47 Blue Bill Park Park','http://dummyimage.com/214x100.png/ff4444/ffffff','U7qiDUjr5gHE','user','2022-03-15 17:15:02','2021-11-11 01:09:01');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (47,'Sapphire Abarough','sabarough1a@amazon.de','5897641274','6718 Donald Hill','http://dummyimage.com/166x100.png/ff4444/ffffff','jpj7dlmDnk','user','2022-01-08 06:34:19','2022-01-04 11:31:26');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (48,'Editha Edgeller','eedgeller1b@guardian.co.uk','5461092930','509 Lakewood Court','http://dummyimage.com/203x100.png/dddddd/000000','XKzxzSZTa','user','2022-07-14 14:30:18','2022-10-21 09:14:08');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (49,'Abe Cleynman','acleynman1c@mashable.com','7072347064','28 Reindahl Lane','http://dummyimage.com/226x100.png/cc0000/ffffff','5SGffs','admin','2021-11-21 09:29:48','2021-12-05 20:52:47');
insert into `user` (`id`,`full_name`,`email`,`phone`,`address`,`avatar_link`,`password`,`role`,`created_at`,`update_at`) VALUES (50,'Neale Batchelor','nbatchelor1d@bloomberg.com','4868804318','7852 Corben Pass','http://dummyimage.com/190x100.png/5fa2dd/ffffff','ZZjRbYnt','admin','2022-05-22 00:04:59','2022-03-23 14:42:36');

-- insert feedback table
insert into feedback (id, user_id, title, note) values (1, 8, 'Inverse contextually-based projection', '‫test‫');
insert into feedback (id, user_id, title, note) values (2, 34, 'Devolved methodical moratorium', '''''');
insert into feedback (id, user_id, title, note) values (3, 45, 'Advanced attitude-oriented definition', '(╯°□°）╯︵ ┻━┻)  ');
insert into feedback (id, user_id, title, note) values (4, 50, 'Enhanced stable firmware', '₀₁₂');
insert into feedback (id, user_id, title, note) values (5, 47, 'Visionary needs-based complexity', '1E2');
insert into feedback (id, user_id, title, note) values (6, 43, 'Organized multimedia conglomeration', '-$1.00');
insert into feedback (id, user_id, title, note) values (7, 9, 'Profit-focused human-resource complexity', '‫test‫');
insert into feedback (id, user_id, title, note) values (8, 9, 'Triple-buffered bi-directional parallelism', '''''');
insert into feedback (id, user_id, title, note) values (9, 31, 'Diverse holistic capacity', '../../../../../../../../../../../etc/passwd%00');
insert into feedback (id, user_id, title, note) values (10, 18, 'Exclusive 3rd generation moratorium', '̗̺͖̹̯͓Ṯ̤͍̥͇͈h̲́e͏͓̼̗̙̼̣͔ ͇̜̱̠͓͍ͅN͕͠e̗̱z̘̝̜̺͙p̤̺̹͍̯͚e̠̻̠͜r̨̤͍̺̖͔̖̖d̠̟̭̬̝͟i̦͖̩͓͔̤a̠̗̬͉̙n͚͜ ̻̞̰͚ͅh̵͉i̳̞v̢͇ḙ͎͟-҉̭̩̼͔m̤̭̫i͕͇̝̦n̗͙ḍ̟ ̯̲͕͞ǫ̟̯̰̲͙̻̝f ̪̰̰̗̖̭̘͘c̦͍̲̞͍̩̙ḥ͚a̮͎̟̙͜ơ̩̹͎s̤.̝̝ ҉Z̡̖̜͖̰̣͉̜a͖̰͙̬͡l̲̫̳͍̩g̡̟̼̱͚̞̬ͅo̗͜.̟');
insert into feedback (id, user_id, title, note) values (11, 34, 'Networked grid-enabled projection', '❤️ 💔 💌 💕 💞 💓 💗 💖 💘 💝 💟 💜 💛 💚 💙');
insert into feedback (id, user_id, title, note) values (12, 34, 'User-friendly responsive parallelism', '00˙Ɩ$-');
insert into feedback (id, user_id, title, note) values (13, 41, 'Programmable composite archive', '✋🏿 💪🏿 👐🏿 🙌🏿 👏🏿 🙏🏿');
insert into feedback (id, user_id, title, note) values (14, 30, 'Pre-emptive zero tolerance framework', '!@#$%^&*()');
insert into feedback (id, user_id, title, note) values (15, 41, 'De-engineered modular pricing structure', '-1');
insert into feedback (id, user_id, title, note) values (16, 37, 'Seamless clear-thinking Graphic Interface', '"');
insert into feedback (id, user_id, title, note) values (17, 26, 'Open-architected needs-based moderator', '(｡◕ ∀ ◕｡)');
insert into feedback (id, user_id, title, note) values (18, 33, 'Streamlined holistic instruction set', '¡™£¢∞§¶•ªº–≠');
insert into feedback (id, user_id, title, note) values (19, 21, 'Vision-oriented foreground encryption', '̡͓̞ͅI̗̘̦͝n͇͇͙v̮̫ok̲̫̙͈i̖͙̭̹̠̞n̡̻̮̣̺g̲͈͙̭͙̬͎ ̰t͔̦h̞̲e̢̤ ͍̬̲͖f̴̘͕̣è͖ẹ̥̩l͖͔͚i͓͚̦͠n͖͍̗͓̳̮g͍ ̨o͚̪͡f̘̣̬ ̖̘͖̟͙̮c҉͔̫͖͓͇͖ͅh̵̤̣͚͔á̗̼͕ͅo̼̣̥s̱͈̺̖̦̻͢.̛̖̞̠̫̰');
insert into feedback (id, user_id, title, note) values (20, 43, 'Advanced zero defect time-frame', '部落格');
insert into feedback (id, user_id, title, note) values (21, 31, 'Quality-focused 24/7 neural-net', '👩🏽');
insert into feedback (id, user_id, title, note) values (22, 50, 'Public-key cohesive core', '(ﾉಥ益ಥ）ﾉ﻿ ┻━┻');
insert into feedback (id, user_id, title, note) values (23, 16, 'Optimized 24/7 hub', 'ヽ༼ຈل͜ຈ༽ﾉ ヽ༼ຈل͜ຈ༽ﾉ ');
insert into feedback (id, user_id, title, note) values (24, 10, 'Adaptive bi-directional circuit', '␢');
insert into feedback (id, user_id, title, note) values (25, 17, 'Up-sized reciprocal flexibility', '␢');
insert into feedback (id, user_id, title, note) values (26, 24, 'Cross-platform non-volatile groupware', '0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟');
insert into feedback (id, user_id, title, note) values (27, 21, 'De-engineered executive Graphic Interface', '1''; DROP TABLE users--');
insert into feedback (id, user_id, title, note) values (28, 46, 'Centralized dynamic leverage', '✋🏿 💪🏿 👐🏿 🙌🏿 👏🏿 🙏🏿');
insert into feedback (id, user_id, title, note) values (29, 42, 'Re-contextualized human-resource productivity', '"');
insert into feedback (id, user_id, title, note) values (30, 20, 'Cross-platform directional extranet', '𠜎𠜱𠝹𠱓𠱸𠲖𠳏');
insert into feedback (id, user_id, title, note) values (31, 15, 'Cross-platform high-level synergy', '''''');
insert into feedback (id, user_id, title, note) values (32, 18, 'Re-contextualized heuristic adapter', '⁰⁴⁵₀₁₂');
insert into feedback (id, user_id, title, note) values (33, 26, 'Switchable mission-critical database', '₀₁₂');
insert into feedback (id, user_id, title, note) values (34, 42, 'Proactive fresh-thinking structure', '사회과학원 어학연구소');
insert into feedback (id, user_id, title, note) values (35, 1, 'Mandatory tertiary hierarchy', '˙ɐnbᴉlɐ ɐuƃɐɯ ǝɹolop ʇǝ ǝɹoqɐl ʇn ʇunpᴉpᴉɔuᴉ ɹodɯǝʇ poɯsnᴉǝ op pǝs ''ʇᴉlǝ ƃuᴉɔsᴉdᴉpɐ ɹnʇǝʇɔǝsuoɔ ''ʇǝɯɐ ʇᴉs ɹolop ɯnsdᴉ ɯǝɹo˥');
insert into feedback (id, user_id, title, note) values (36, 42, 'Balanced optimizing circuit', 'Ω≈ç√∫˜µ≤≥÷');
insert into feedback (id, user_id, title, note) values (37, 8, 'Centralized eco-centric architecture', '-1');
insert into feedback (id, user_id, title, note) values (38, 4, 'Innovative bi-directional process improvement', '''');
insert into feedback (id, user_id, title, note) values (39, 30, 'Intuitive zero tolerance framework', '울란바토르');
insert into feedback (id, user_id, title, note) values (40, 10, 'Managed executive policy', '__ﾛ(,_,*)');
insert into feedback (id, user_id, title, note) values (41, 38, 'Persevering attitude-oriented adapter', 'ÅÍÎÏ˝ÓÔÒÚÆ☃');
insert into feedback (id, user_id, title, note) values (42, 23, 'Reverse-engineered 5th generation customer loyalty', '<svg><script>0<1>alert(''XSS'')</script>');
insert into feedback (id, user_id, title, note) values (43, 49, 'Function-based didactic attitude', '⁦test⁧');
insert into feedback (id, user_id, title, note) values (44, 34, 'Pre-emptive holistic productivity', '​');
insert into feedback (id, user_id, title, note) values (45, 48, 'Expanded real-time portal', '0/0');
insert into feedback (id, user_id, title, note) values (46, 12, 'Object-based mission-critical middleware', '(｡◕ ∀ ◕｡)');
insert into feedback (id, user_id, title, note) values (47, 23, 'Object-based intermediate Graphical User Interface', 'œ∑´®†¥¨ˆøπ“‘');
insert into feedback (id, user_id, title, note) values (48, 19, 'Decentralized grid-enabled artificial intelligence', 'œ∑´®†¥¨ˆøπ“‘');
insert into feedback (id, user_id, title, note) values (49, 20, 'Visionary attitude-oriented architecture', '１２３');
insert into feedback (id, user_id, title, note) values (50, 20, 'Function-based transitional collaboration', '`⁄€‹›ﬁﬂ‡°·‚—±');
insert into feedback (id, user_id, title, note) values (51, 1, 'Robust foreground initiative', 'œ∑´®†¥¨ˆøπ“‘');
insert into feedback (id, user_id, title, note) values (52, 11, 'Self-enabling encompassing throughput', '1');
insert into feedback (id, user_id, title, note) values (53, 28, 'Polarised interactive data-warehouse', '-1E+02');
insert into feedback (id, user_id, title, note) values (54, 5, 'Operative 3rd generation concept', '␡');
insert into feedback (id, user_id, title, note) values (55, 46, 'Multi-layered grid-enabled utilisation', '1;DROP TABLE users');
insert into feedback (id, user_id, title, note) values (56, 8, 'Stand-alone real-time benchmark', 'œ∑´®†¥¨ˆøπ“‘');
insert into feedback (id, user_id, title, note) values (57, 31, 'User-centric non-volatile access', '''''');
insert into feedback (id, user_id, title, note) values (58, 20, 'Persevering multi-state moderator', '̗̺͖̹̯͓Ṯ̤͍̥͇͈h̲́e͏͓̼̗̙̼̣͔ ͇̜̱̠͓͍ͅN͕͠e̗̱z̘̝̜̺͙p̤̺̹͍̯͚e̠̻̠͜r̨̤͍̺̖͔̖̖d̠̟̭̬̝͟i̦͖̩͓͔̤a̠̗̬͉̙n͚͜ ̻̞̰͚ͅh̵͉i̳̞v̢͇ḙ͎͟-҉̭̩̼͔m̤̭̫i͕͇̝̦n̗͙ḍ̟ ̯̲͕͞ǫ̟̯̰̲͙̻̝f ̪̰̰̗̖̭̘͘c̦͍̲̞͍̩̙ḥ͚a̮͎̟̙͜ơ̩̹͎s̤.̝̝ ҉Z̡̖̜͖̰̣͉̜a͖̰͙̬͡l̲̫̳͍̩g̡̟̼̱͚̞̬ͅo̗͜.̟');
insert into feedback (id, user_id, title, note) values (59, 19, 'Digitized global secured line', '-1E+02');
insert into feedback (id, user_id, title, note) values (60, 40, 'Customer-focused demand-driven ability', '1E+02');
insert into feedback (id, user_id, title, note) values (61, 34, 'Reduced multi-state utilisation', '𠜎𠜱𠝹𠱓𠱸𠲖𠳏');
insert into feedback (id, user_id, title, note) values (62, 19, 'Devolved next generation support', '../../../../../../../../../../../etc/hosts');
insert into feedback (id, user_id, title, note) values (63, 36, 'Cross-platform modular middleware', 'ヽ༼ຈل͜ຈ༽ﾉ ヽ༼ຈل͜ຈ༽ﾉ ');
insert into feedback (id, user_id, title, note) values (64, 44, 'Enterprise-wide real-time complexity', '1.00');
insert into feedback (id, user_id, title, note) values (65, 41, 'Compatible radical data-warehouse', '⁰⁴⁵₀₁₂');
insert into feedback (id, user_id, title, note) values (66, 3, 'Synergized national conglomeration', '¡™£¢∞§¶•ªº–≠');
insert into feedback (id, user_id, title, note) values (67, 14, 'Pre-emptive transitional extranet', '👾 🙇 💁 🙅 🙆 🙋 🙎 🙍 ');
insert into feedback (id, user_id, title, note) values (68, 3, 'Digitized 4th generation encryption', '田中さんにあげて下さい');
insert into feedback (id, user_id, title, note) values (69, 22, 'Face to face demand-driven emulation', '🚾 🆒 🆓 🆕 🆖 🆗 🆙 🏧');
insert into feedback (id, user_id, title, note) values (70, 50, 'User-centric zero tolerance hierarchy', '❤️ 💔 💌 💕 💞 💓 💗 💖 💘 💝 💟 💜 💛 💚 💙');
insert into feedback (id, user_id, title, note) values (71, 45, 'Pre-emptive human-resource circuit', '̡͓̞ͅI̗̘̦͝n͇͇͙v̮̫ok̲̫̙͈i̖͙̭̹̠̞n̡̻̮̣̺g̲͈͙̭͙̬͎ ̰t͔̦h̞̲e̢̤ ͍̬̲͖f̴̘͕̣è͖ẹ̥̩l͖͔͚i͓͚̦͠n͖͍̗͓̳̮g͍ ̨o͚̪͡f̘̣̬ ̖̘͖̟͙̮c҉͔̫͖͓͇͖ͅh̵̤̣͚͔á̗̼͕ͅo̼̣̥s̱͈̺̖̦̻͢.̛̖̞̠̫̰');
insert into feedback (id, user_id, title, note) values (72, 11, 'Object-based foreground adapter', 'ثم نفس سقطت وبالتحديد،, جزيرتي باستخدام أن دنو. إذ هنا؟ الستار وتنصيب كان. أهّل ايطاليا، بريطانيا-فرنسا قد أخذ. سليمان، إتفاقية بين ما, يذكر الحدود أي بعد, معاملة بولندا، الإطلاق عل إيو.');
insert into feedback (id, user_id, title, note) values (73, 26, 'Multi-layered well-modulated toolset', '-1');
insert into feedback (id, user_id, title, note) values (74, 6, 'Down-sized user-facing middleware', '`⁄€‹›ﬁﬂ‡°·‚—±');
insert into feedback (id, user_id, title, note) values (75, 41, 'Monitored intermediate strategy', '''');
insert into feedback (id, user_id, title, note) values (76, 4, 'Organic heuristic software', ' ');
insert into feedback (id, user_id, title, note) values (77, 13, 'Automated solution-oriented middleware', 'パーティーへ行かないか');
insert into feedback (id, user_id, title, note) values (78, 32, 'Right-sized multi-tasking superstructure', '-1');
insert into feedback (id, user_id, title, note) values (79, 5, 'Advanced transitional architecture', '1');
insert into feedback (id, user_id, title, note) values (80, 20, 'Synergized zero tolerance challenge', 'NIL');
insert into feedback (id, user_id, title, note) values (81, 34, 'Reverse-engineered client-server pricing structure', 'ヽ༼ຈل͜ຈ༽ﾉ ヽ༼ຈل͜ຈ༽ﾉ ');
insert into feedback (id, user_id, title, note) values (82, 42, 'Upgradable static portal', '<>?:"{}|_+');
insert into feedback (id, user_id, title, note) values (83, 37, 'Diverse regional database', '() { _; } >_[$($())] { touch /tmp/blns.shellshock2.fail; }');
insert into feedback (id, user_id, title, note) values (84, 35, 'Decentralized contextually-based portal', '(｡◕ ∀ ◕｡)');
insert into feedback (id, user_id, title, note) values (85, 40, 'Exclusive 4th generation Graphic Interface', '・(￣∀￣)・:*:');
insert into feedback (id, user_id, title, note) values (86, 38, 'Proactive cohesive open system', '⁦test⁧');
insert into feedback (id, user_id, title, note) values (87, 46, 'Extended 24 hour adapter', '𠜎𠜱𠝹𠱓𠱸𠲖𠳏');
insert into feedback (id, user_id, title, note) values (88, 23, 'Seamless next generation artificial intelligence', ' test ');
insert into feedback (id, user_id, title, note) values (89, 34, 'Profit-focused 24 hour intranet', '˙ɐnbᴉlɐ ɐuƃɐɯ ǝɹolop ʇǝ ǝɹoqɐl ʇn ʇunpᴉpᴉɔuᴉ ɹodɯǝʇ poɯsnᴉǝ op pǝs ''ʇᴉlǝ ƃuᴉɔsᴉdᴉpɐ ɹnʇǝʇɔǝsuoɔ ''ʇǝɯɐ ʇᴉs ɹolop ɯnsdᴉ ɯǝɹo˥');
insert into feedback (id, user_id, title, note) values (90, 36, 'Innovative optimal focus group', '"''''''''"''"');
insert into feedback (id, user_id, title, note) values (91, 1, 'Mandatory encompassing website', '˙ɐnbᴉlɐ ɐuƃɐɯ ǝɹolop ʇǝ ǝɹoqɐl ʇn ʇunpᴉpᴉɔuᴉ ɹodɯǝʇ poɯsnᴉǝ op pǝs ''ʇᴉlǝ ƃuᴉɔsᴉdᴉpɐ ɹnʇǝʇɔǝsuoɔ ''ʇǝɯɐ ʇᴉs ɹolop ɯnsdᴉ ɯǝɹo˥');
insert into feedback (id, user_id, title, note) values (92, 15, 'Intuitive context-sensitive migration', '-1E+02');
insert into feedback (id, user_id, title, note) values (93, 40, 'Seamless zero administration support', '̡͓̞ͅI̗̘̦͝n͇͇͙v̮̫ok̲̫̙͈i̖͙̭̹̠̞n̡̻̮̣̺g̲͈͙̭͙̬͎ ̰t͔̦h̞̲e̢̤ ͍̬̲͖f̴̘͕̣è͖ẹ̥̩l͖͔͚i͓͚̦͠n͖͍̗͓̳̮g͍ ̨o͚̪͡f̘̣̬ ̖̘͖̟͙̮c҉͔̫͖͓͇͖ͅh̵̤̣͚͔á̗̼͕ͅo̼̣̥s̱͈̺̖̦̻͢.̛̖̞̠̫̰');
insert into feedback (id, user_id, title, note) values (94, 31, 'Synchronised zero tolerance portal', '​');
insert into feedback (id, user_id, title, note) values (95, 28, 'Self-enabling local paradigm', 'ﾟ･✿ヾ╲(｡◕‿◕｡)╱✿･ﾟ');
insert into feedback (id, user_id, title, note) values (96, 50, 'Grass-roots neutral utilisation', '''');
insert into feedback (id, user_id, title, note) values (97, 31, 'Exclusive neutral utilisation', '0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟');
insert into feedback (id, user_id, title, note) values (98, 26, 'Enterprise-wide high-level portal', 'ヽ༼ຈل͜ຈ༽ﾉ ヽ༼ຈل͜ຈ༽ﾉ ');
insert into feedback (id, user_id, title, note) values (99, 25, 'Managed system-worthy matrices', 'NULL');
insert into feedback (id, user_id, title, note) values (100, 29, 'Digitized zero tolerance superstructure', '𠜎𠜱𠝹𠱓𠱸𠲖𠳏');

-- insert order table
insert into `order` (id, user_id, note, order_date, status) values (1, 9, '(╯°□°）╯︵ ┻━┻)  ', '2022-06-22 15:41:15', 0);
insert into `order` (id, user_id, note, order_date, status) values (2, 39, 'ﾟ･✿ヾ╲(｡◕‿◕｡)╱✿･ﾟ', '2022-08-25 05:01:24', 0);
insert into `order` (id, user_id, note, order_date, status) values (3, 36, '-1.00', '2022-02-01 13:22:04', 1);
insert into `order` (id, user_id, note, order_date, status) values (4, 28, '''"''', '2022-03-29 17:11:49', 0);
insert into `order` (id, user_id, note, order_date, status) values (5, 6, 'הָיְתָהtestالصفحات التّحول', '2022-08-08 08:39:16', 0);
insert into `order` (id, user_id, note, order_date, status) values (6, 2, '-1', '2021-12-24 22:05:08', 0);
insert into `order` (id, user_id, note, order_date, status) values (7, 10, '사회과학원 어학연구소', '2021-11-02 22:52:05', 0);
insert into `order` (id, user_id, note, order_date, status) values (8, 44, '''', '2022-02-13 00:47:20', 0);
insert into `order` (id, user_id, note, order_date, status) values (9, 32, '𠜎𠜱𠝹𠱓𠱸𠲖𠳏', '2022-06-08 16:19:45', 0);
insert into `order` (id, user_id, note, order_date, status) values (10, 7, '-1E+02', '2022-06-23 07:04:33', 0);
insert into `order` (id, user_id, note, order_date, status) values (11, 40, '(｡◕ ∀ ◕｡)', '2022-02-08 05:42:45', 0);
insert into `order` (id, user_id, note, order_date, status) values (12, 47, 'null', '2022-08-12 23:02:58', 1);
insert into `order` (id, user_id, note, order_date, status) values (13, 29, '␢', '2022-01-28 18:14:36', 1);
insert into `order` (id, user_id, note, order_date, status) values (14, 47, '(ﾉಥ益ಥ）ﾉ﻿ ┻━┻', '2022-03-16 00:05:31', 1);
insert into `order` (id, user_id, note, order_date, status) values (15, 1, '''"''', '2022-10-20 09:13:56', 0);
insert into `order` (id, user_id, note, order_date, status) values (16, 4, '👾 🙇 💁 🙅 🙆 🙋 🙎 🙍 ', '2022-07-26 05:47:10', 0);
insert into `order` (id, user_id, note, order_date, status) values (17, 40, '1;DROP TABLE users', '2022-07-29 13:46:31', 1);
insert into `order` (id, user_id, note, order_date, status) values (18, 16, '""', '2022-01-04 22:28:02', 0);
insert into `order` (id, user_id, note, order_date, status) values (19, 39, '​', '2022-04-19 15:30:03', 0);
insert into `order` (id, user_id, note, order_date, status) values (20, 26, null, '2021-12-05 13:37:43', 1);
insert into `order` (id, user_id, note, order_date, status) values (21, 5, '../../../../../../../../../../../etc/hosts', '2022-02-07 11:04:22', 0);
insert into `order` (id, user_id, note, order_date, status) values (22, 15, 'Z̮̞̠͙͔ͅḀ̗̞͈̻̗Ḷ͙͎̯̹̞͓G̻O̭̗̮', '2022-07-05 03:01:05', 1);
insert into `order` (id, user_id, note, order_date, status) values (23, 27, '(｡◕ ∀ ◕｡)', '2022-08-07 03:13:19', 1);
insert into `order` (id, user_id, note, order_date, status) values (24, 11, '1E2', '2022-09-26 15:31:11', 0);
insert into `order` (id, user_id, note, order_date, status) values (25, 43, 'בְּרֵאשִׁית, בָּרָא אֱלֹהִים, אֵת הַשָּׁמַיִם, וְאֵת הָאָרֶץ', '2022-07-17 17:37:30', 0);
insert into `order` (id, user_id, note, order_date, status) values (26, 31, '-1E+02', '2022-05-16 07:52:45', 0);
insert into `order` (id, user_id, note, order_date, status) values (27, 38, '⁰⁴⁵', '2022-08-08 02:58:52', 0);
insert into `order` (id, user_id, note, order_date, status) values (28, 12, '999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999', '2021-11-22 20:22:48', 1);
insert into `order` (id, user_id, note, order_date, status) values (29, 16, '‪‪test‪', '2021-11-27 04:37:58', 0);
insert into `order` (id, user_id, note, order_date, status) values (30, 27, '✋🏿 💪🏿 👐🏿 🙌🏿 👏🏿 🙏🏿', '2022-04-16 00:42:37', 0);
insert into `order` (id, user_id, note, order_date, status) values (31, 46, '部落格', '2022-10-14 09:51:57', 0);
insert into `order` (id, user_id, note, order_date, status) values (32, 11, '!@#$%^&*()', '2022-10-12 07:10:23', 0);
insert into `order` (id, user_id, note, order_date, status) values (33, 21, '᠎', '2022-04-20 00:20:49', 0);
insert into `order` (id, user_id, note, order_date, status) values (34, 3, '1''; DROP TABLE users--', '2022-07-25 01:18:40', 1);
insert into `order` (id, user_id, note, order_date, status) values (35, 22, 'Ω≈ç√∫˜µ≤≥÷', '2021-12-15 06:07:57', 1);
insert into `order` (id, user_id, note, order_date, status) values (36, 4, '!@#$%^&*()', '2022-05-05 10:22:59', 1);
insert into `order` (id, user_id, note, order_date, status) values (37, 23, '-1E+02', '2022-08-14 01:07:46', 1);
insert into `order` (id, user_id, note, order_date, status) values (38, 45, '̦H̬̤̗̤͝e͜ ̜̥̝̻͍̟́w̕h̖̯͓o̝͙̖͎̱̮ ҉̺̙̞̟͈W̷̼̭a̺̪͍į͈͕̭͙̯̜t̶̼̮s̘͙͖̕ ̠̫̠B̻͍͙͉̳ͅe̵h̵̬͇̫͙i̹͓̳̳̮͎̫̕n͟d̴̪̜̖ ̰͉̩͇͙̲͞ͅT͖̼͓̪͢h͏͓̮̻e̬̝̟ͅ ̤̹̝W͙̞̝͔͇͝ͅa͏͓͔̹̼̣l̴͔̰̤̟͔ḽ̫.͕', '2021-11-17 22:32:02', 0);
insert into `order` (id, user_id, note, order_date, status) values (39, 16, ',./;''[]\-=', '2022-08-24 20:28:25', 0);
insert into `order` (id, user_id, note, order_date, status) values (40, 47, '̡͓̞ͅI̗̘̦͝n͇͇͙v̮̫ok̲̫̙͈i̖͙̭̹̠̞n̡̻̮̣̺g̲͈͙̭͙̬͎ ̰t͔̦h̞̲e̢̤ ͍̬̲͖f̴̘͕̣è͖ẹ̥̩l͖͔͚i͓͚̦͠n͖͍̗͓̳̮g͍ ̨o͚̪͡f̘̣̬ ̖̘͖̟͙̮c҉͔̫͖͓͇͖ͅh̵̤̣͚͔á̗̼͕ͅo̼̣̥s̱͈̺̖̦̻͢.̛̖̞̠̫̰', '2022-07-12 05:01:38', 1);
insert into `order` (id, user_id, note, order_date, status) values (41, 32, '<>?:"{}|_+', '2022-07-05 00:00:21', 0);
insert into `order` (id, user_id, note, order_date, status) values (42, 27, '部落格', '2022-07-06 17:20:55', 1);
insert into `order` (id, user_id, note, order_date, status) values (43, 32, '"''''''''"''"', '2021-11-27 23:22:45', 0);
insert into `order` (id, user_id, note, order_date, status) values (44, 49, '-1E+02', '2022-09-09 11:58:37', 0);
insert into `order` (id, user_id, note, order_date, status) values (45, 44, '(｡◕ ∀ ◕｡)', '2022-06-03 07:05:19', 0);
insert into `order` (id, user_id, note, order_date, status) values (46, 25, '!@#$%^&*()', '2022-03-16 03:02:13', 1);
insert into `order` (id, user_id, note, order_date, status) values (47, 44, '⁰⁴⁵₀₁₂', '2022-08-08 06:03:26', 0);
insert into `order` (id, user_id, note, order_date, status) values (48, 15, 'ヽ༼ຈل͜ຈ༽ﾉ ヽ༼ຈل͜ຈ༽ﾉ ', '2022-06-23 04:10:57', 1);
insert into `order` (id, user_id, note, order_date, status) values (49, 1, '-1E2', '2022-06-30 11:40:40', 0);
insert into `order` (id, user_id, note, order_date, status) values (50, 16, '᠎', '2022-08-11 09:52:33', 1);

-- insert category table
insert into category (id, name) values (1, 'Chairs');
insert into category (id, name) values (2, 'Beds');
insert into category (id, name) values (3, 'Accessories');
insert into category (id, name) values (4, 'Furniture');
insert into category (id, name) values (5, 'Home Deco');
insert into category (id, name) values (6, 'Dressings');
insert into category (id, name) values (7, 'Tables');

-- insert product table
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (1, 3, 'Gray''s Beaksedge', 650000, 0.1, 'empty', '2021-12-20 21:01:21', '2021-11-19 11:49:01');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (2, 3, 'Slender Saltbush', 650000, 0.2, 'empty', '2021-11-16 23:30:33', '2021-10-29 20:06:32');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (3, 3, 'American Mannagrass', 650000, 0.4, 'empty', '2022-09-17 04:46:59', '2022-02-19 02:33:43');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (4, 4, 'White Star Apple', 1050000, 0.1, 'empty', '2021-12-02 17:32:46', '2022-04-23 09:26:13');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (5, 6, 'Wart Lichen', 1050000, 0.1, 'empty', '2021-11-23 17:16:51', '2022-05-27 19:35:26');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (6, 6, 'Intermediate Cartilage Lichen', 350000, 0.5, 'empty', '2022-03-11 20:21:38', '2022-02-03 17:55:10');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (7, 7, 'Melaspilea Lichen', 650000, 0.5, 'empty', '2022-04-12 09:41:35', '2022-06-26 11:38:52');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (8, 4, 'Nihoa Pritchardia', 750000, 0.3, 'empty', '2022-05-09 16:37:32', '2022-01-30 01:01:26');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (9, 7, 'Large Gray Willow', 450000, 0.4, 'empty', '2022-10-04 10:11:12', '2021-12-11 06:31:24');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (10, 3, 'Moss Campion', 350000, 0.4, 'empty', '2022-10-24 17:03:54', '2022-04-04 23:53:18');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (11, 2, 'Prairie Sedge', 850000, 0.2, 'empty', '2022-07-12 08:21:19', '2022-10-02 13:39:01');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (12, 3, 'American Cancer-root', 850000, 0.5, 'empty', '2021-11-14 17:02:53', '2022-01-20 21:00:05');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (13, 7, 'Spearleaf Buckwheat', 550000, 0.3, 'empty', '2022-04-15 15:26:28', '2022-06-25 19:31:28');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (14, 7, 'Field Cottonrose', 750000, 0.1, 'empty', '2022-06-17 11:26:22', '2022-09-24 02:49:07');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (15, 3, 'Horsekiller', 1050000, 0.4, 'empty', '2022-05-30 11:22:04', '2022-08-05 22:37:46');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (16, 4, 'Cusick''s Lupine', 650000, 0.2, 'empty', '2022-02-24 12:23:16', '2022-06-14 04:48:05');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (17, 4, 'Jones'' Columbine', 450000, 0.3, 'empty', '2022-10-15 23:18:31', '2022-06-14 08:46:39');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (18, 4, 'Cusick''s Aster', 850000, 0.5, 'empty', '2022-05-18 05:59:32', '2022-05-15 19:30:30');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (19, 7, 'South African Oatgrass', 1050000, 0.1, 'empty', '2021-11-07 20:14:58', '2021-11-11 22:06:35');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (20, 5, 'Edwards Plateau Spiderwort', 650000, 0.4, 'empty', '2021-11-11 21:13:16', '2022-07-17 21:56:48');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (21, 7, 'Herb Of Gilead', 450000, 0.4, 'empty', '2022-04-22 06:13:42', '2021-12-09 01:22:19');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (22, 1, 'Debris Milkvetch', 350000, 0.1, 'empty', '2022-01-14 07:20:51', '2022-09-22 03:22:25');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (23, 5, 'California Phacelia', 850000, 0.4, 'empty', '2022-03-29 13:56:52', '2022-05-18 02:42:17');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (24, 1, 'Roundleaf Blolly', 450000, 0.1, 'empty', '2022-07-11 19:12:26', '2021-12-13 11:40:47');
insert into product (id, category_id, title, price, discount, description, created_at, update_at) values (25, 2, 'Lewisia', 950000, 0.1, 'empty', '2022-09-22 20:44:07', '2021-12-16 23:20:38');

-- insert image_product table
insert into image_product (id, product_id, image_link) values (1, 13, 'https://hc360.com/et.jpg');
insert into image_product (id, product_id, image_link) values (2, 6, 'https://indiatimes.com/congue/etiam/justo/etiam/pretium.aspx');
insert into image_product (id, product_id, image_link) values (3, 18, 'http://is.gd/eu/interdum.png');
insert into image_product (id, product_id, image_link) values (4, 21, 'https://typepad.com/curabitur/in/libero/ut.jpg');
insert into image_product (id, product_id, image_link) values (5, 1, 'https://disqus.com/donec.html');
insert into image_product (id, product_id, image_link) values (6, 23, 'http://examiner.com/enim/leo/rhoncus/sed/vestibulum/sit.jsp');
insert into image_product (id, product_id, image_link) values (7, 24, 'https://godaddy.com/leo/rhoncus/sed/vestibulum/sit/amet/cursus.jpg');
insert into image_product (id, product_id, image_link) values (8, 1, 'http://nymag.com/porttitor/id/consequat/in/consequat/ut/nulla.jsp');
insert into image_product (id, product_id, image_link) values (9, 24, 'http://blinklist.com/pharetra/magna/ac.aspx');
insert into image_product (id, product_id, image_link) values (10, 13, 'https://spiegel.de/platea.js');
insert into image_product (id, product_id, image_link) values (11, 11, 'https://behance.net/luctus/et/ultrices/posuere.aspx');
insert into image_product (id, product_id, image_link) values (12, 12, 'http://pcworld.com/nec/dui/luctus/rutrum.json');
insert into image_product (id, product_id, image_link) values (13, 2, 'https://friendfeed.com/varius/ut/blandit/non/interdum/in.aspx');
insert into image_product (id, product_id, image_link) values (14, 9, 'http://nih.gov/vestibulum/rutrum/rutrum.js');
insert into image_product (id, product_id, image_link) values (15, 4, 'http://dmoz.org/mattis/pulvinar/nulla/pede/ullamcorper/augue/a.png');
insert into image_product (id, product_id, image_link) values (16, 14, 'https://nydailynews.com/curabitur.xml');
insert into image_product (id, product_id, image_link) values (17, 19, 'http://zimbio.com/leo/pellentesque.js');
insert into image_product (id, product_id, image_link) values (18, 4, 'https://earthlink.net/ligula/nec/sem/duis/aliquam.xml');
insert into image_product (id, product_id, image_link) values (19, 19, 'http://nationalgeographic.com/vestibulum/ante/ipsum/primis/in/faucibus.xml');
insert into image_product (id, product_id, image_link) values (20, 19, 'https://aol.com/quis/augue/luctus/tincidunt.jsp');
insert into image_product (id, product_id, image_link) values (21, 7, 'http://businesswire.com/nec/sem/duis/aliquam/convallis/nunc/proin.png');
insert into image_product (id, product_id, image_link) values (22, 25, 'http://jalbum.net/sit/amet/consectetuer/adipiscing/elit.png');
insert into image_product (id, product_id, image_link) values (23, 17, 'http://wiley.com/amet/sem.json');
insert into image_product (id, product_id, image_link) values (24, 15, 'https://loc.gov/lectus/pellentesque/eget/nunc/donec/quis/orci.jpg');
insert into image_product (id, product_id, image_link) values (25, 18, 'https://phoca.cz/platea/dictumst/morbi/vestibulum/velit.png');
insert into image_product (id, product_id, image_link) values (26, 1, 'https://princeton.edu/pharetra/magna/ac/consequat.jpg');
insert into image_product (id, product_id, image_link) values (27, 10, 'https://disqus.com/dictumst.json');
insert into image_product (id, product_id, image_link) values (28, 19, 'https://marketwatch.com/penatibus/et/magnis/dis/parturient/montes.html');
insert into image_product (id, product_id, image_link) values (29, 22, 'http://hc360.com/metus/sapien/ut.jpg');
insert into image_product (id, product_id, image_link) values (30, 17, 'https://paginegialle.it/turpis/adipiscing/lorem.html');
insert into image_product (id, product_id, image_link) values (31, 10, 'https://arizona.edu/mi/nulla/ac/enim/in/tempor.js');
insert into image_product (id, product_id, image_link) values (32, 19, 'http://comcast.net/augue/luctus/tincidunt.aspx');
insert into image_product (id, product_id, image_link) values (33, 23, 'https://arstechnica.com/rhoncus/aliquam/lacus/morbi.js');
insert into image_product (id, product_id, image_link) values (34, 5, 'http://hhs.gov/turpis/adipiscing/lorem.png');
insert into image_product (id, product_id, image_link) values (35, 2, 'http://ask.com/morbi/quis.aspx');
insert into image_product (id, product_id, image_link) values (36, 3, 'http://hp.com/at/nulla/suspendisse/potenti.jsp');
insert into image_product (id, product_id, image_link) values (37, 25, 'https://behance.net/sapien/varius/ut.aspx');
insert into image_product (id, product_id, image_link) values (38, 17, 'https://unc.edu/orci/mauris/lacinia.html');
insert into image_product (id, product_id, image_link) values (39, 3, 'https://issuu.com/eu/magna/vulputate/luctus/cum.json');
insert into image_product (id, product_id, image_link) values (40, 8, 'https://ucla.edu/enim/leo/rhoncus/sed/vestibulum/sit/amet.html');
insert into image_product (id, product_id, image_link) values (41, 21, 'http://php.net/non/mi/integer/ac.jpg');
insert into image_product (id, product_id, image_link) values (42, 3, 'https://europa.eu/sit/amet/nunc/viverra/dapibus/nulla.png');
insert into image_product (id, product_id, image_link) values (43, 13, 'https://adobe.com/nibh/quisque/id/justo/sit/amet/sapien.json');
insert into image_product (id, product_id, image_link) values (44, 2, 'https://auda.org.au/pede/morbi/porttitor/lorem.aspx');
insert into image_product (id, product_id, image_link) values (45, 10, 'http://java.com/dapibus/augue.aspx');
insert into image_product (id, product_id, image_link) values (46, 16, 'https://independent.co.uk/cubilia/curae.png');
insert into image_product (id, product_id, image_link) values (47, 11, 'https://desdev.cn/mi/integer.js');
insert into image_product (id, product_id, image_link) values (48, 16, 'http://tinyurl.com/felis/fusce/posuere/felis/sed/lacus.aspx');
insert into image_product (id, product_id, image_link) values (49, 4, 'http://trellian.com/id/turpis/integer/aliquet/massa/id/lobortis.jsp');
insert into image_product (id, product_id, image_link) values (50, 13, 'http://techcrunch.com/est/phasellus/sit/amet.xml');
insert into image_product (id, product_id, image_link) values (51, 15, 'http://msn.com/sed/tristique/in/tempus.aspx');
insert into image_product (id, product_id, image_link) values (52, 7, 'http://google.es/posuere/cubilia/curae.png');
insert into image_product (id, product_id, image_link) values (53, 22, 'https://si.edu/ipsum/primis/in/faucibus/orci.xml');
insert into image_product (id, product_id, image_link) values (54, 19, 'http://noaa.gov/quam/pharetra/magna.png');
insert into image_product (id, product_id, image_link) values (55, 13, 'https://xing.com/nulla/justo/aliquam/quis/turpis/eget/elit.jpg');
insert into image_product (id, product_id, image_link) values (56, 20, 'https://e-recht24.de/nec/condimentum.aspx');
insert into image_product (id, product_id, image_link) values (57, 7, 'http://uol.com.br/consectetuer/eget/rutrum.xml');
insert into image_product (id, product_id, image_link) values (58, 15, 'http://nature.com/vulputate/elementum/nullam/varius/nulla/facilisi/cras.json');
insert into image_product (id, product_id, image_link) values (59, 20, 'https://e-recht24.de/duis/at/velit/eu/est/congue.xml');
insert into image_product (id, product_id, image_link) values (60, 2, 'http://ucla.edu/ultrices/vel.jpg');
insert into image_product (id, product_id, image_link) values (61, 14, 'https://tripod.com/quisque/ut/erat/curabitur/gravida/nisi.js');
insert into image_product (id, product_id, image_link) values (62, 23, 'https://stanford.edu/velit/donec/diam/neque/vestibulum/eget/vulputate.js');
insert into image_product (id, product_id, image_link) values (63, 17, 'http://addtoany.com/eget/eleifend/luctus.xml');
insert into image_product (id, product_id, image_link) values (64, 19, 'http://reddit.com/viverra/eget/congue/eget/semper/rutrum/nulla.png');
insert into image_product (id, product_id, image_link) values (65, 13, 'http://ezinearticles.com/erat/quisque.jpg');
insert into image_product (id, product_id, image_link) values (66, 6, 'https://comcast.net/aliquet/pulvinar/sed/nisl/nunc/rhoncus.js');
insert into image_product (id, product_id, image_link) values (67, 17, 'https://bizjournals.com/sit/amet/diam/in.jsp');
insert into image_product (id, product_id, image_link) values (68, 3, 'http://ftc.gov/interdum/venenatis/turpis/enim/blandit/mi.png');
insert into image_product (id, product_id, image_link) values (69, 21, 'https://narod.ru/ac/lobortis/vel/dapibus/at.js');
insert into image_product (id, product_id, image_link) values (70, 17, 'https://devhub.com/nunc/vestibulum/ante/ipsum.jsp');

-- insert order_details table
insert into order_details (id, order_id, product_id, count_product) values (1, 12, 18, 1);
insert into order_details (id, order_id, product_id, count_product) values (2, 3, 1, 2);
insert into order_details (id, order_id, product_id, count_product) values (3, 5, 2, 2);
insert into order_details (id, order_id, product_id, count_product) values (4, 18, 25, 1);
insert into order_details (id, order_id, product_id, count_product) values (5, 11, 4, 3);
insert into order_details (id, order_id, product_id, count_product) values (6, 34, 18, 2);
insert into order_details (id, order_id, product_id, count_product) values (7, 9, 3, 1);
insert into order_details (id, order_id, product_id, count_product) values (8, 17, 18, 3);
insert into order_details (id, order_id, product_id, count_product) values (9, 10, 19, 1);
insert into order_details (id, order_id, product_id, count_product) values (10, 32, 5, 3);
insert into order_details (id, order_id, product_id, count_product) values (11, 24, 20, 3);
insert into order_details (id, order_id, product_id, count_product) values (12, 32, 2, 3);
insert into order_details (id, order_id, product_id, count_product) values (13, 8, 18, 2);
insert into order_details (id, order_id, product_id, count_product) values (14, 24, 1, 1);
insert into order_details (id, order_id, product_id, count_product) values (15, 26, 3, 3);
insert into order_details (id, order_id, product_id, count_product) values (16, 38, 19, 1);
insert into order_details (id, order_id, product_id, count_product) values (17, 35, 10, 1);
insert into order_details (id, order_id, product_id, count_product) values (18, 8, 7, 3);
insert into order_details (id, order_id, product_id, count_product) values (19, 28, 17, 3);
insert into order_details (id, order_id, product_id, count_product) values (20, 8, 18, 2);
insert into order_details (id, order_id, product_id, count_product) values (21, 32, 16, 3);
insert into order_details (id, order_id, product_id, count_product) values (22, 27, 6, 1);
insert into order_details (id, order_id, product_id, count_product) values (23, 25, 11, 2);
insert into order_details (id, order_id, product_id, count_product) values (24, 27, 16, 1);
insert into order_details (id, order_id, product_id, count_product) values (25, 37, 16, 2);
insert into order_details (id, order_id, product_id, count_product) values (26, 35, 24, 3);
insert into order_details (id, order_id, product_id, count_product) values (27, 18, 18, 1);
insert into order_details (id, order_id, product_id, count_product) values (28, 13, 9, 1);
insert into order_details (id, order_id, product_id, count_product) values (29, 4, 15, 1);
insert into order_details (id, order_id, product_id, count_product) values (30, 17, 22, 2);
insert into order_details (id, order_id, product_id, count_product) values (31, 14, 6, 3);
insert into order_details (id, order_id, product_id, count_product) values (32, 20, 9, 3);
insert into order_details (id, order_id, product_id, count_product) values (33, 24, 21, 2);
insert into order_details (id, order_id, product_id, count_product) values (34, 26, 21, 3);
insert into order_details (id, order_id, product_id, count_product) values (35, 18, 20, 2);
insert into order_details (id, order_id, product_id, count_product) values (36, 32, 2, 2);
insert into order_details (id, order_id, product_id, count_product) values (37, 36, 17, 1);
insert into order_details (id, order_id, product_id, count_product) values (38, 16, 3, 2);
insert into order_details (id, order_id, product_id, count_product) values (39, 12, 17, 2);
insert into order_details (id, order_id, product_id, count_product) values (40, 19, 17, 2);
insert into order_details (id, order_id, product_id, count_product) values (41, 9, 9, 2);
insert into order_details (id, order_id, product_id, count_product) values (42, 34, 14, 2);
insert into order_details (id, order_id, product_id, count_product) values (43, 20, 11, 2);
insert into order_details (id, order_id, product_id, count_product) values (44, 29, 5, 2);
insert into order_details (id, order_id, product_id, count_product) values (45, 15, 7, 3);
insert into order_details (id, order_id, product_id, count_product) values (46, 5, 15, 2);
insert into order_details (id, order_id, product_id, count_product) values (47, 15, 17, 1);
insert into order_details (id, order_id, product_id, count_product) values (48, 3, 12, 3);
insert into order_details (id, order_id, product_id, count_product) values (49, 33, 20, 3);
insert into order_details (id, order_id, product_id, count_product) values (50, 9, 24, 1);
insert into order_details (id, order_id, product_id, count_product) values (51, 36, 17, 1);
insert into order_details (id, order_id, product_id, count_product) values (52, 29, 22, 2);
insert into order_details (id, order_id, product_id, count_product) values (53, 26, 12, 3);
insert into order_details (id, order_id, product_id, count_product) values (54, 1, 8, 1);
insert into order_details (id, order_id, product_id, count_product) values (55, 34, 13, 3);
insert into order_details (id, order_id, product_id, count_product) values (56, 18, 12, 3);
insert into order_details (id, order_id, product_id, count_product) values (57, 10, 23, 2);
insert into order_details (id, order_id, product_id, count_product) values (58, 40, 7, 2);
insert into order_details (id, order_id, product_id, count_product) values (59, 6, 20, 3);
insert into order_details (id, order_id, product_id, count_product) values (60, 14, 5, 3);
insert into order_details (id, order_id, product_id, count_product) values (61, 9, 8, 2);
insert into order_details (id, order_id, product_id, count_product) values (62, 2, 21, 1);
insert into order_details (id, order_id, product_id, count_product) values (63, 33, 19, 1);
insert into order_details (id, order_id, product_id, count_product) values (64, 28, 16, 2);
insert into order_details (id, order_id, product_id, count_product) values (65, 13, 7, 2);
insert into order_details (id, order_id, product_id, count_product) values (66, 15, 23, 3);
insert into order_details (id, order_id, product_id, count_product) values (67, 30, 25, 2);
insert into order_details (id, order_id, product_id, count_product) values (68, 31, 17, 2);
insert into order_details (id, order_id, product_id, count_product) values (69, 15, 20, 2);
insert into order_details (id, order_id, product_id, count_product) values (70, 9, 19, 3);
insert into order_details (id, order_id, product_id, count_product) values (71, 39, 2, 3);
insert into order_details (id, order_id, product_id, count_product) values (72, 15, 12, 1);
insert into order_details (id, order_id, product_id, count_product) values (73, 27, 6, 2);
insert into order_details (id, order_id, product_id, count_product) values (74, 3, 15, 2);
insert into order_details (id, order_id, product_id, count_product) values (75, 36, 20, 3);
insert into order_details (id, order_id, product_id, count_product) values (76, 36, 18, 1);
insert into order_details (id, order_id, product_id, count_product) values (77, 21, 3, 3);
insert into order_details (id, order_id, product_id, count_product) values (78, 20, 8, 3);
insert into order_details (id, order_id, product_id, count_product) values (79, 14, 6, 1);
insert into order_details (id, order_id, product_id, count_product) values (80, 26, 9, 3);
insert into order_details (id, order_id, product_id, count_product) values (81, 1, 25, 2);
insert into order_details (id, order_id, product_id, count_product) values (82, 7, 9, 2);
insert into order_details (id, order_id, product_id, count_product) values (83, 30, 17, 1);
insert into order_details (id, order_id, product_id, count_product) values (84, 1, 12, 2);
insert into order_details (id, order_id, product_id, count_product) values (85, 22, 20, 2);
insert into order_details (id, order_id, product_id, count_product) values (86, 1, 8, 1);
insert into order_details (id, order_id, product_id, count_product) values (87, 23, 11, 1);
insert into order_details (id, order_id, product_id, count_product) values (88, 2, 14, 1);
insert into order_details (id, order_id, product_id, count_product) values (89, 8, 5, 3);
insert into order_details (id, order_id, product_id, count_product) values (90, 38, 5, 2);
insert into order_details (id, order_id, product_id, count_product) values (91, 38, 16, 3);
insert into order_details (id, order_id, product_id, count_product) values (92, 33, 20, 3);
insert into order_details (id, order_id, product_id, count_product) values (93, 21, 5, 1);
insert into order_details (id, order_id, product_id, count_product) values (94, 12, 14, 1);
insert into order_details (id, order_id, product_id, count_product) values (95, 1, 9, 1);
insert into order_details (id, order_id, product_id, count_product) values (96, 8, 14, 2);
insert into order_details (id, order_id, product_id, count_product) values (97, 39, 23, 1);
insert into order_details (id, order_id, product_id, count_product) values (98, 20, 23, 2);
insert into order_details (id, order_id, product_id, count_product) values (99, 10, 19, 2);
insert into order_details (id, order_id, product_id, count_product) values (100, 22, 14, 1);