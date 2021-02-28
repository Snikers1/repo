# Реализовать функцию, принимающую два числа (позиционные аргументы) и
# выполняющую их деление. Числа запрашивать у пользователя,
# предусмотреть обработку ситуации деления на ноль

def my_funk(a, b):
    result = None
    try:
       result = a / b
    except ZeroDivisionError:
        print("Попытка деления на 0!")
    return result

res = my_funk(10, 4)
print("result is ", res)
res = my_funk(10, 0)
print("result is ", res)
