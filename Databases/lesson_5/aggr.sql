/*Подсчитайте средний возраст пользователей в таблице users*/

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at , CURDATE())) as avg_age FROM users u; 


/*
  Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
  Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

SELECT DAYNAME(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAYOFMONTH(birthday_at)))) as WEEK_DAY , 
	   COUNT(birthday_at ) as CNT_BIRTHDAYS 
FROM users u2 
GROUP BY WEEK_DAY



/* (по желанию) Подсчитайте произведение чисел в столбце таблицы.*/

CREATE TABLE numbers (
  value INT NOT NULL);
 
INSERT INTO numbers(value) VALUES (1);
INSERT INTO numbers(value) VALUES (2);
INSERT INTO numbers(value) VALUES (3);
INSERT INTO numbers(value) VALUES (4);
INSERT INTO numbers(value) VALUES (5);
INSERT INTO numbers(value) VALUES (6);
INSERT INTO numbers(value) VALUES (7);


SELECT EXP(SUM(LN(value))) FROM numbers; 