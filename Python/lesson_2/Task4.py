# Пользователь вводит строку из нескольких слов, разделённых пробелами
# Вывести каждое слово с новой строки. Строки необходимо пронумеровать.
# Если в слово длинное, выводить только первые 10 букв в слове.

user_inp = input()
user_words = user_inp.split()
for number, element in enumerate(user_words):
    if len(element) < 10:
        print("Строка {0}, Значение : {1}".format(number, element))
    else:
        print("Строка {0}, Значение : {1}".format(number, element[:10]))