# Создать программно файл в текстовом формате, записать в него построчно данные,
# вводимые пользователем.
# Об окончании ввода данных свидетельствует пустая строка.

with open('my_test_file.txt', 'w', encoding='utf-8') as output:
    while True:
        inp_str = input("Введите очередную строку: ")
        output.write(inp_str + '\n')
        if inp_str and inp_str.strip():
            continue
        else:
            break
