CREATE table author(
id BIGINT(16) UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(16) not null, 
address VARCHAR(25),
primary key(id)
)Engine=InnoDB DEFAULT CHARSET=UTF8;

CREATE table publisher(
name VARCHAR(16),
address VARCHAR(20),
phone BIGINT(11),
primary key(name)
)Engine=InnoDB DEFAULT CHARSET=UTF8;

CREATE table book(
ISBN VARCHAR(20),
title VARCHAR(20) not null,
pub_year YEAR default null comment'出版年份',
price numeric(7,2) not null,
publisher VARCHAR(16),
type ENUM('文学历史','军事地理','科学技术','人文社科','阅享生活','经管理财') DEFAULT NULL COMMENT '备注扩展属性',
primary key(ISBN),
foreign key(publisher) references publisher(name) on delete cascade
)Engine=InnoDB DEFAULT CHARSET=UTF8;

CREATE table warehouse(
code BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
address VARCHAR(20),
phone BIGINT(11),
PRIMARY KEY(code)
)Engine=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE customer(
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
username VARCHAR(16) NOT NULL UNIQUE,
password VARCHAR(16) NOT NULL,
address VARCHAR(20),
phone BIGINT(11),
PRIMARY KEY(id)
)Engine=InnoDB default CHARSET=UTF8;

CREATE TABLE shopping_basket(
user_id BIGINT UNSIGNED,
basket_id BIGINT UNSIGNED DEFAULT NULL UNIQUE,
PRIMARY KEY(user_id), 
FOREIGN KEY(user_id) REFERENCES customer(id) ON DELETE CASCADE
)Engine=InnoDB default CHARSET=UTF8;


CREATE TABLE written_by(
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
book_isbn VARCHAR(20) NOT NULL,
author_id BIGINT UNSIGNED NOT NULL,
PRIMARY KEY(id,book_isbn,author_id),
FOREIGN KEY(book_isbn) REFERENCES book(ISBN) ON DELETE CASCADE,
FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE CASCADE
)Engine=InnoDB DEFAULT CHARSET=UTF8 COMMENT 'author表与book表之间的联系集';

CREATE TABLE orders(
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
book_isbn VARCHAR(20),
basket_id BIGINT UNSIGNED default NULL,
number int DEFAULT 0 COMMENT '订单中某种书籍的数量',
PRIMARY KEY(id),
FOREIGN KEY(book_isbn) REFERENCES book(ISBN) ON DELETE CASCADE,
FOREIGN KEY(basket_id) REFERENCES shopping_basket(basket_id) ON DELETE CASCADE
)Engine=InnoDB DEFAULT CHARSET=UTF8 COMMENT '可以看成是订单，book与shopping_basket之间的联系集';

CREATE TABLE stocks(
book_isbn VARCHAR(20),
warehouse_id BIGINT UNSIGNED,
number int DEFAULT 0 NOT NULL,
PRIMARY KEY(book_isbn,warehouse_id),
FOREIGN KEY(book_isbn) REFERENCES book(ISBN) ON DELETE CASCADE,
FOREIGN KEY(warehouse_id) REFERENCES warehouse(code) ON DELETE CASCADE
)Engine=InnoDB DEFAULT CHARSET=UTF8 COMMENT'book的总库存，book与warehouse的联系集';

### 测试数据
####
INSERT INTO author values(1,'John Resig','美国洛杉矶');
INSERT INTO author values(2,'Russ Fergunson','美国洛杉矶');
INSERT INTO author VALUES(3,'John Paxton','美国纽约');
INSERT INTO author values(4,'高尔基','沙俄');
INSERT INTO author values(5,'罗贯中','中国明朝');

INSERT INTO publisher values('西安交通大学出版社','陕西西安',07239654);
INSERT INTO publisher values('安徽教育出版社','安徽合肥',07332569);
INSERT INTO publisher values('湖南师范大学出版社','湖南长沙',07419821);
INSERT INTO publisher values('人民邮电出版社','中国北京',07002586);

INSERT INTO book values('978-7-115-43286-5','精通javascript','2016',45.00,'人民邮电出版社','科学技术');
INSERT INTO book values('44565-64-45457-453','在人间','2016',86.45,'西安交通大学出版社','文学历史');
INSERT INTO book values('3242-34324-212','我的大学','2016',34.60,'安徽教育出版社','文学历史');
INSERT INTO book values('234234-2342-908','三国演义','2014',124.98,'湖南师范大学出版社','文学历史');

INSERT INTO written_by values(1,'44565-64-45457-453',4);
INSERT INTO written_by values(2,'978-7-115-43286-5',1);
INSERT INTO written_by values(3,'978-7-115-43286-5',2);
INSERT INTO written_by values(4,'978-7-115-43286-5',3);
INSERT INTO written_by values(5,'3242-34324-212',4);
INSERT INTO written_by values(6,'234234-2342-908',5);

INSERT INTO warehouse values(1,'湖北武汉','07421365');
INSERT INTO warehouse values(2,'广东广州','07445248');
INSERT INTO warehouse values(3,'北京昌平','07003698');
INSERT INTO warehouse values(4,'浙江杭州','07856248');
INSERT INTO warehouse values(5,'甘肃兰州','08754369');

INSERT INTO stocks values('978-7-115-43286-5',1,1230);
INSERT INTO stocks values('978-7-115-43286-5',5,8521);
INSERT INTO stocks values('44565-64-45457-453',2,7800);
INSERT INTO stocks values('3242-34324-212',2,0);
INSERT INTO stocks values('234234-2342-908',1,8541);
INSERT INTO stocks values('234234-2342-908',3,1489);
INSERT INTO stocks values('234234-2342-908',4,69);

INSERT INTO customer values(1,'mardoner','3.1415926','湖南怀化',17374268544);
INSERT INTO customer values(2,'张三丰','abc123456','新疆喀什',18652473695);

### 另外购物车和订单orders表的数据则由用户购买商品时产生

