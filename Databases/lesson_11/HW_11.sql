-- Практическое задание по теме “Оптимизация запросов”
/*
 Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs
 помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
*/

USE shop;

DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	table_nm VARCHAR(45) NOT NULL,
	pk_id BIGINT(20) NOT NULL,
	name  VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;

-- триггер на пользователей 

DROP TRIGGER IF EXISTS log_users_trg;
delimiter //
CREATE TRIGGER log_users_trg AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_nm, pk_id, name)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;

-- триггер на каталоги 

DROP TRIGGER IF EXISTS log_catalogs_trg;
delimiter //
CREATE TRIGGER log_catalogs_trg AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_nm, pk_id, name)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;


-- триггер на продукты 

DROP TRIGGER IF EXISTS log_products_trg;
delimiter //
CREATE TRIGGER log_products_trg AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_nm, pk_id, name)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;


/*(по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.*/

INSERT INTO users (name, birthday_at)

WITH numbers 
as (
SELECT 0 AS num FROM DUAL
UNION 
SELECT 1 AS num FROM DUAL
UNION
SELECT 2 AS num FROM DUAL
UNION 
SELECT 3 AS num FROM DUAL 
UNION
SELECT 4 AS num FROM DUAL
UNION
SELECT 5 AS num FROM DUAL
UNION
SELECT 6 AS num FROM DUAL
UNION
SELECT 7 AS num FROM DUAL
UNION
SELECT 8 AS num FROM DUAL
UNION 
SELECT 9 AS num FROM DUAL 
)

SELECT CONCAT('user_',  100000 * n100000.num + 10000* n10000.num + 1000 * n1000.num + 100 * n1000.num  + 10 * n10.num + n1.num ), NOW()  
FROM numbers n1 
CROSS JOIN numbers n10 
CROSS JOIN numbers n100 
CROSS JOIN numbers n1000
CROSS JOIN numbers n10000
CROSS JOIN numbers n100000
;


-- альтернативный способ 

DROP PROCEDURE IF EXISTS populate_users;
delimiter //
CREATE PROCEDURE populate_users ()
BEGIN
	DECLARE i INT DEFAULT 1000000;
	START TRANSACTION;
	WHILE i > 0 DO
		INSERT INTO users (name, birthday_at) VALUES (CONCAT('user_', i), NOW());
		SET i = i - 1;
	END WHILE;
END //
delimiter ;

-- вызов процедуры 

CALL populate_users();

-- Практическое задание по теме “NoSQL”


/*В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.*/
 --1 ) Команда SADD позволяет вставлять в коллекцию сразу несколько значений: Вставим ip адреса 
 SADD ip_addresses '226.36.25.211' '198.11.120.179' '55.24.4.185' '12.174.180.159' '240.43.239.150' '131.65.235.169' '149.223.153.16' '26.75.34.97' '11.111.211.32' '197.223.223.45'
-- Сколько бы повторяющихся значений не было вставлено в коллекцию email, содержать она будет
-- только уникальные значения, в чем можно убедиться, воспользовавшись командой SMEMBERS:
 SMEMBERS ip_addresses
-- Выяснить количество элементов в множестве позволяет команда SCARD
 SCARD ip_addresses
 
 -- При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени

SET roman 'bessonov_ra@open.ru'

-- получить email :
GET roman 

SET 'bessonov_ra@open' roman 

-- получить пользователя 
GET 'bessonov_ra@open'

-- Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.


-- сохраним структуру 
use shop;

select * from products pr 
inner join catalogs c  
on (pr.catalog_id = c.id);


-- товары :
db.products.insertMany([
	{"name": "Intel Core i3-8100", "description": "Процессор для настольных персональных компьютеров, основанных на платформе Intel.", "price": "7890.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
	{"name": "Intel Core i5-7400", "description": "Процессор для настольных персональных компьютеров, основанных на платформе Intel.", "price": "12700.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
	{"name": "AMD FX-8320E", "description": "Процессор для настольных персональных компьютеров, основанных на платформе AMD.", "price": "4780.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
	{"name": "AMD FX-8320", "description": "Процессор для настольных персональных компьютеров, основанных на платформе AMD.", "price": "7120.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
	{"name": "ASUS ROG MAXIMUS X HERO", "description": "Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX", price: "19310.00", "catalog_id": "Материнские платы", "created_at": new Date(), "updated_at": new Date()},
	{"name": "Gigabyte H310M S2H", "description": "Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX", "price": "4790.00", "catalog_id": "Материнские платы", "created_at": new Date(), "updated_at": new Date()},
	{"name": "MSI B250M GAMING PRO", "description": "Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX", "price": "5060.00", "catalog_id": "Материнские платы", "created_at": new Date(), "updated_at": new Date()}]);
	
-- каталоги 
db.catalogs.insertMany([{"name": "Процессоры"}, {"name": "Материнские платы"}, {"name": "Видеокарты"}, {"name": "Жесткие диски"}, {"name": "Оперативная память"}]);
