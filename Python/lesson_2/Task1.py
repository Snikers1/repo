#Создать список и заполнить его элементами различных типов данных.
# Реализовать скрипт проверки типа данных каждого элемента.
# Использовать функцию type() для проверки типа.
# Элементы списка можно не запрашивать у пользователя, а указать явно, в программе

my_list = list()
my_list.append("first_element")
my_list.append(9.9)
my_list.append(3)
my_list.append(True)
for element in my_list:
    print("element {0} has {1} type".format(element, type(element)), end='\n')