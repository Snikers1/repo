/* Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
 * Заполните их текущими датой и временем.
 */ 

UPDATE users 
SET created_at = NOW(),
	updated_at = NOW();
	
	
/* Таблица users была неудачно спроектирована. 
   Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате
   20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/ 

-- создаем нужные столбцы 
ALTER TABLE users ADD COLUMN created_at_dttm DATETIME;
ALTER TABLE users ADD COLUMN created_at_dttm DATETIME;

-- заносим в них значения 
UPDATE users
SET created_at_dttm = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
    created_at_dttm = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i');

 -- удаляем столбцы в типе VARCHAR
ALTER TABLE users DROP created_at;
ALTER TABLE users DROP updated_at;

-- переименовываем 
ALTER TABLE users RENAME COLUMN created_at_dttm TO created_at;
ALTER TABLE users RENAME COLUMN updated_at_dttm to updated_at;




/* В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
   0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом,
   чтобы они выводились в порядке увеличения значения value. 
   Однако нулевые запасы должны выводиться в конце, после всех 
*/

SELECT * from storehouses_products sp 
ORDER BY 1/value  DESC; 

SELECT * FROM storehouses_products sp 
ORDER BY CASE WHEN value = 0 THEN 1 ELSE 0 END, value;


/*(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
   Месяцы заданы в виде списка английских названий (may, august)
*/

SELECT id, name /* ,birthday_at, MONTHNAME(birthday_at) */ FROM users u 
WHERE lower(MONTHNAME(birthday_at)) IN ('may', 'august');


/*
(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
*/

SELECT * FROM catalogs c2 
WHERE id IN (5, 1, 2)
ORDER BY 
CASE 
	WHEN id = 5 THEN 0
	WHEN id = 1 THEN 1
	WHEN id = 2 THEN 2 
END;
	