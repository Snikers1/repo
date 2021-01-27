-- Проанализировать какие запросы могут выполняться наиболее часто в процессе работы приложения и добавить необходимые индексы.

-- для просмотра новых пользователей и более быстрой сортировки 
CREATE INDEX new_user_id_idx ON users(created_at);

-- для более быстрой сортировке по дате рожддения (выбор самого молодого или старого)

CREATE INDEX user_birthday_idx ON profiles(birthday);

-- ДЛЯ просмотра типов медиафайлов у пользователя 
CREATE INDEX media_user_id_media_type_id_idx ON media (user_id, media_type_id);  

-- чтобы смотреть друзей пользователя. Порядок имеет значение, поэтому чтобы индекс включался как надо - добавим 2 индекса 
CREATE INDEX friendship_user_id_friend_id_idx ON media (user_id, friend_id);
CREATE INDEX friendship_friend_id_user_id_idx ON media (friend_id, user_id);

-- для просмотра лайков пользователя (кто и что лайкал)
CREATE INDEX likes_user_id_target_id_like_type_id_idx ON media (user_id, target_id, like_type_id);

-- индексы для переписки 
CREATE INDEX messages_from_user_id_to_user_id_created_at_idx ON media (from_user_id, to_user_id, created_at);
CREATE INDEX messages_to_user_id_from_user_id_created_at_idx ON media (to_user_id, from_user_id, created_at);

-- Пользователи ищут слова по все переписке, хочется добавить индекс на поле body. 
-- Однако


-- не так много индексов получилось, т.к на многих полях стоит первичный ключ или условие уникальности

-- Задание на оконные функции
-- Построить запрос, который будет выводить следующие столбцы: 
-- имя группы 
-- среднее количество пользователей в группах 
-- самый молодой пользователь в группе 
-- самый старший пользователь в группе 
-- общее количество пользователей в группе 
-- всего пользователей в системе 
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100



SELECT
	 DISTINCT 
	 c.id, -- id группы 
	 c.name, -- имя группы 
	 COUNT(cu.user_id) OVER () / (SELECT COUNT(DISTINCT c2.id) from communities c2
	 									INNER JOIN communities_users cu2
	 									ON (c2.id = cu2.community_id))  as avg_number_members_per_group, -- среднее количество пользователей в группах
     FIRST_VALUE(CONCAT(u.last_name, ' ', u.first_name)) OVER (PARTITION BY c.id ORDER BY p.birthday DESC) AS youngest_member, -- самый молодой пользователь в группе 
     FIRST_VALUE(CONCAT(u.last_name, ' ', u.first_name)) OVER (PARTITION BY c.id ORDER BY p.birthday) AS oldest_member, -- самый старший пользователь в группе
     COUNT(cu.user_id) OVER (PARTITION BY c.id) AS members_per_group, -- общее количество пользователей в группе  
     (SELECT COUNT(u2.id) from users u2) AS users_in_system, -- всего пользователей в системе 
     100 * COUNT(cu.user_id) OVER (PARTITION BY c.id) /  (SELECT COUNT(u2.id) from users u2) AS PCT -- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100
FROM communities_users cu 
INNER JOIN communities c 
ON (cu.community_id = c.id)
INNER JOIN users u 
ON (cu.user_id = u.id)
INNER JOIN profiles p 
ON (u.id = p.user_id);
