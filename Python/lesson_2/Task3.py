# Пользователь вводит месяц в виде целого числа от 1 до 12.
# Сообщить к какому времени года относится месяц (зима, весна, лето, осень).
# Напишите решения через list и через dict.

user_input_month = int(input("Введите номер месяца от 1 до 12: \n"))
list_seasons = [(1, 2, 12), (3, 4, 5), (6, 7, 8), (9, 10, 11)]
for season in range(len(list_seasons)):
    if user_input_month in list_seasons[season]:
        if season == 0:
            season_out = 'Зима'
        elif season == 1:
            season_out = 'Весна'
        elif season == 3:
            season_out = 'Лето'
        else:
            season_out = 'Осень'

print("Введенный месяц {0} относится к времени года : {1}".format(user_input_month, season_out))


dict_seasons = {'Зима': (1, 2, 12),
           'Весна': (3, 4, 5),
           'Лето': (6, 7, 8),
           'Осень': (9, 10, 11)}

for key in dict_seasons.keys():
    if user_input_month in dict_seasons[key]:
        print("Введенный месяц {0} относится к времени года : {1}".format(user_input_month, key))
