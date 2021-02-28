# Реализовать два небольших скрипта:
# а) итератор, генерирующий целые числа, начиная с указанного,
# б) итератор, повторяющий элементы некоторого списка, определенного заранее.
# Подсказка: использовать функцию count() и cycle() модуля itertools. Обратите внимание,
# что создаваемый цикл не должен быть бесконечным. Необходимо предусмотреть условие его завершения.
# Например, в первом задании выводим целые числа, начиная с 3,
# а при достижении числа 10 завершаем цикл. Во втором также необходимо предусмотреть условие,
# при котором повторение элементов списка будет прекращено.

from itertools import cycle, count
from random import randint

def my_generator(n):
    i = n - 1
    while True:
        i += 1
        yield i

gen = my_generator(5)
for i in gen:
    if i < 50:
        print(i)
    else:
        break

for el in count(int(input("Введите начальный элемент посоедовательности: "))):
    if el < 50:
        print(f"{el}")
    else:
        break

for color in cycle(['red', 'yellow', 'green']):
    if randint(1, 10) == 7:
        break
    else:
        print(color)

