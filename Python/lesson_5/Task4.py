#Создать (не программно) текстовый файл со следующим содержимым:
# One — 1
# Two — 2
# Three — 3
# Four — 4
# Необходимо написать программу, открывающую файл на чтение и считывающую построчно данные.
# При этом английские числительные должны заменяться на русские.
# Новый блок строк должен записываться в новый текстовый файл.

dictionary = {
    'One': 'Один',
    'Two': 'Два',
    'Three': 'Три',
    'Four': 'Четыре'
}

with open('numbers_in_english.txt', 'r', encoding='utf_8') as src_file:
    lines = src_file.readlines()

with open('numbers_in_russian.txt', 'w', encoding='utf_8') as targ_file:
    for line in lines:
        desc, digit = line.strip().split(' — ')
        targ_file.write(dictionary[desc] + ' - ' + digit + '\n')
