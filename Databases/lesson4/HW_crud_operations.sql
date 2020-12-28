SELECT * FROM users limit 10;


-- 1) Модифицируем данные так, чтобы updated_at было больше, чем created_at 
UPDATE users  
SET updated_at  = NOW() WHERE created_at  > updated_at ;

commit;

-- 2) Создали справочник статусов пользователей 

DROP TABLE IF EXISTS user_statuses;

-- обновляем временные метки 

UPDATE profiles  
SET updated_at  = NOW() WHERE created_at  > updated_at ;

-- Обновляем photo_id 
UPDATE profiles 
SET photo_id  = FLOOR(RAND() * 100 + 1); 


-- 5) Создаем временную таблицу 

DROP TABLE IF EXISTS genders;
CREATE TEMPORARY TABLE IF NOT EXISTS  genders (name CHAR(1));

-- Заполняем 

INSERT INTO genders(name) VALUES ('m'), ('f');

SELECT name FROM genders ORDER BY RAND() LIMIT 1; -- Выбираем случайное значение 

-- Обновляем gender 

UPDATE profiles 
SET gender = (SELECT name FROM genders ORDER BY RAND() LIMIT 1); 


-- 6) Таблица messages 

-- чтобы не писать письма самим себе :

UPDATE messages 
SET from_user_id = FLOOR(RAND() * 100 + 1), 
	to_user_id   = FLOOR(RAND() * 100 + 1)
WHERE to_user_id = from_user_id 
; 

-- обновление временных меток 
UPDATE messages  
SET updated_at  = NOW() WHERE created_at  > updated_at ;


-- Сущность media_types:

-- 7) очищаем данные 

DELETE FROM media_types;

-- 8) вставка значений 

TRUNCATE media_types ;

INSERT INTO media_types (name) VALUES ('audio'), ('video'), ('image');


-- 9) обновление временных меток 

UPDATE media  
SET updated_at  = NOW() WHERE created_at  > updated_at;

 -- 10) обновление media_type_id в сущности media
 
 UPDATE media 
 SET media_type_id  =  FLOOR(RAND() * 3) + 1; 

-- 11) обновление user_id

UPDATE media 
SET user_id = FLOOR(RAND() * 100) + 1; 

-- 12) генерация названия файлов 
DROP TABLE IF EXISTS extentions;

CREATE TEMPORARY TABLE IF NOT EXISTS  extentions (name VARCHAR(40));
INSERT INTO extentions(name) VALUES ('jpg'), ('avi'), ('png'), ('mpeg');

UPDATE media 
SET filename  = CONCAT('https://dropbox.net/vk/', filename, '.',  (SELECT name FROM extentions ORDER BY RAND() LIMIT 1) ); 

SELECT * from media;

-- подгоним размер файлов 

 UPDATE media 
 SET size  =  FLOOR(RAND() * 10000000) + 100000
   WHERE size  < 10000000;
  
-- 13) заполняем json строку 

  UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');  
 
 -- 14)  Возвращаем столбцу метеданных правильный тип
ALTER TABLE media MODIFY COLUMN metadata JSON;

-- 15) Сущность frienship_statuses 

TRUNCATE friendship_statuses ;

-- Вставка значений

INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected');


-- 16 ) Сущность friendship 

UPDATE friendship  
SET updated_at  = NOW() WHERE created_at  > updated_at;

-- Делаем так, чтобы пользователь не дружил сам с собой)

UPDATE friendship SET friend_id = friend_id + 1 WHERE user_id = friend_id;

-- Обновляем ссылки на статус 
UPDATE friendship SET status_id = FLOOR(1 + RAND() * 3); 


