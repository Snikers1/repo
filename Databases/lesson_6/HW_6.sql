-- Таблица лайков
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Таблица типов лайков
DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');

-- Заполняем лайки
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 4)),
    CURRENT_TIMESTAMP 
  FROM messages;
  
  
 -- Создадим таблицу постов
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Создать все необходимые внешние ключи и диаграмму отношений.

/*Ключи созданы, диаграма построена (картинка в формате png*/

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT
	CASE
		WHEN (
		select
			CNT_LIKES
		FROM
			(
			SELECT
				GENDER,
				COUNT(*) AS CNT_LIKES
			FROM
				(
				SELECT
					(
					SELECT
						gender
					from
						profiles p
					WHERE
						p.user_id = l.user_id) as GENDER
				FROM
					likes l ) T
			GROUP BY
				GENDER ) T1
		WHERE
			GENDER = 'f' ) > (
		select
			CNT_LIKES
		FROM
			(
			SELECT
				GENDER,
				COUNT(*) AS CNT_LIKES
			FROM
				(
				SELECT
					(
					SELECT
						gender
					from
						profiles p
					WHERE
						p.user_id = l.user_id) as GENDER
				FROM
					likes l ) T
			GROUP BY
				GENDER ) T1
		WHERE
			GENDER = 'm' ) THEN 'female'
		ELSE 'male'
	END AS MORE_LIKES
FROM
	DUAL;
	
-- Подсчитать количество лайков которые получили 10 самых молодых пользователей.
	
SELECT
	COUNT(l.target_id) AS CNT_LIKES
FROM
	likes l
WHERE
	l.target_id IN (
	SELECT
		user_id
	FROM
		profiles p
	ORDER BY
		birthday DESC
	LIMIT 10 );
	

-- Найти 10 пользователей, которые проявляют наименьшую активность в
-- использовании социальной сети
-- (критерии активности необходимо определить самостоятельно).


SELECT
	(
	SELECT
		CONCAT(last_name, " ", first_name)
	FROM
		users u
	WHERE
		T1.user_id = u.id) as FIO,
	TOTAL_POINTS
FROM
	(
	SELECT
		USER_ID,
		SUM(POINTS) AS TOTAL_POINTS -- итоговые очки 
	FROM
		(
		SELECT
			from_user_id as user_id,
			COUNT(*) as POINTS
		FROM
			messages
			-- мало пишут сообщений  

			GROUP BY from_user_id
	UNION ALL
		SELECT
			user_id,
			COUNT(*)
		FROM
			likes
			-- мало ставят лайков 

			GROUP BY user_id
	UNION ALL
		SELECT
			user_id,
			COUNT(*)
		FROM
			friendship
			-- мало друзей 

			GROUP BY user_id
	UNION ALL
		SELECT
			friend_id,
			COUNT(*)
		FROM
			friendship
		GROUP BY
			friend_id
	UNION ALL
		SELECT
			user_id,
			COUNT(*)
		FROM
			communities_users
			-- мало сообществ

			GROUP BY user_id ) T
	GROUP BY
		user_id ) T1
ORDER BY
	TOTAL_POINTS
LIMIT 10;



  
 