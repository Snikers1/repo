# Пользователь вводит время в секундах. Переведите время в часы, минуты
# и секунды и выведите в формате чч:мм:сс. Используйте форматирование строк

user_seconds = int(input("Введите число в секундах: "))
seconds = user_seconds % 60
minutes = int((user_seconds - seconds) / 60)
hours = int((user_seconds - minutes * 60) / 24)
if minutes >= 60:
    hours += int(minutes / 60)
    minutes -= int(minutes/60) * 60
print("Количество секунд {0} соответствует {1}:{2}:{3}".format(user_seconds, hours, minutes, seconds))