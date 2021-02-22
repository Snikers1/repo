# Реализовать функцию, принимающую несколько параметров,
# описывающих данные пользователя: имя, фамилия, год рождения, город проживания, email, телефон.
# Функция должна принимать параметры как именованные аргументы.
# Реализовать вывод данных о пользователе одной строкой.

def my_func(**kvargs):
    for key, value in kvargs.items():
        print(f"{key}: {value}", end=' ')

my_func( first_name="Roman", last_name="Bessonov", age=1997, city="Moscow",
         email="bessonoff97@mail.ru", phone="+79175007109")
