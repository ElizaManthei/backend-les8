DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS remote_controllers;
DROP TABLE IF EXISTS ci_modules;
DROP TABLE IF EXISTS televisions_wall_brackets;
DROP TABLE IF EXISTS televisions;
DROP TABLE IF EXISTS wall_brackets;
		
CREATE TABLE televisions(
	id serial,
	name varchar(255),
	brand varchar(255),
	price double precision,
	sold int,
	type varchar(30),
	courrent_stock double precision,
	refresh_rate double precision,
	screen_type varchar(255),
	PRIMARY KEY(id)
);
INSERT INTO televisions(name, brand, price, sold,type,courrent_stock,refresh_rate,screen_type)
VALUES ('QN900B','Samsung',4250,200,'Neo QLED',45,100,'qled'),
		('Objet Collection Easel','LG',6999,199,'LG OLED',40,120,'oled');

CREATE TABLE remote_controllers(
	id serial PRIMARY KEY,
	name varchar(255),
	brand varchar(255),
	price double precision,
	current_stock double precision,
	sold int,
	compatible_with varchar(255),
	battery_type varchar(255),
	tv_id int,
	FOREIGN KEY (tv_id) REFERENCES televisions(id)
);
INSERT INTO remote_controllers(name, brand, price, current_stock, sold, compatible_with, battery_type)
VALUES ('De Universele afstandsbediening 4 in 1 ','HAMA',15,6000,3000,'Univeseel','AAA'),
		('URC 2981', 'ONE FOR ALL', 15, 4000, 2000, 'Univeseel','AAA');

CREATE TABLE ci_modules(
	id serial PRIMARY KEY,
	name varchar(255),
	brand varchar(255),
	price double precision,
	sold int,
	courrent_stock double precision,
	tv_id int,
	FOREIGN KEY (tv_id) REFERENCES televisions(id)
);
INSERT INTO ci_modules(name, brand, price, sold, courrent_stock)
VALUES ('CI+ 1.3 Interactieve Module', 'Quantis',69.95, 500, 1000),
		('CI+ 1.3 Interactieve Ziggo Module', 'SMiT',76.99, 700, 2000);

CREATE TABLE wall_brackets(
	id serial PRIMARY KEY,
	name varchar(255),
	brand varchar(255),
	price double precision,
	sold int,
	courrent_stock double precision
); 
INSERT INTO wall_brackets(name, brand, price, sold, courrent_stock)
VALUES ( 'Ferrom','XTRARM', 50, 600, 5000),
('Hercules Flex', 'DQ WALL-SUPPORT', 50, 600, 5000);

CREATE TABLE televisions_wall_brackets(
	tv_id int,
	wb_id int,
	FOREIGN KEY (tv_id) REFERENCES wall_brackets(id),
	FOREIGN KEY (wb_id) REFERENCES televisions(id)
);

INSERT INTO televisions_wall_brackets(tv_id, wb_id)
VALUES (1,1), (1,2),(2,2),(2,1);

CREATE TABLE users(
	id serial PRIMARY KEY,
	name varchar(255),
	password varchar(8)
);

INSERT INTO users(name, password)
VALUES ('Nick', '21kk3'), ('Ana', 'oooP8');

SELECT CONCAT('Tv ', t.name, ' ', t.brand,' with wall bracket ', w.brand, ' ', w.name)
FROM televisions_wall_brackets tb
INNER JOIN televisions t on tb.tv_id = t.id
INNER JOIN wall_brackets w on tb.wb_id = w.id;
