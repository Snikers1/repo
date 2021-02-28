#Реализовать функцию my_func(), которая принимает три позиционных аргумента,
# и возвращает сумму наибольших двух аргументов.

def my_func(a, b, c):
    return max((a + b), (a + c), (b + c))

naib_summ = my_func(1, 2, 3)
print("naib_summ = ", naib_summ)