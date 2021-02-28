# Реализовать формирование списка, используя функцию range() и возможности генератора.
# В список должны войти четные числа от 100 до 1000 (включая границы).
# Необходимо получить результат вычисления произведения всех элементов списка.
# Подсказка: использовать функцию reduce().

from functools import reduce

def my_func(a, b):
    return a * b

even_numbers = [x for x in range(100, 1000 + 1) if x % 2 == 0]
result = reduce(my_func, even_numbers)
print(result)