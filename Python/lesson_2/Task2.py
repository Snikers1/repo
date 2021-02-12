# Для списка реализовать обмен значений соседних элементов,
# т.е. Значениями обмениваются элементы с индексами 0 и 1, 2 и 3 и т.д.
# При нечетном количестве элементов последний сохранить на своем месте.
# Для заполнения списка элементов необходимо использовать функцию input()

my_list = list()
print("Для прекращения заполнения элементов списка введите 'end'")
# добавляем элементы в список
while True:
    inp = input()
    my_list.append(inp)
    if inp == 'end':
        my_list.remove('end')
        break

print("old list: ", my_list)

odd_elements = my_list.copy()[::2]
even_elements = my_list.copy()[1::2]

result_list = list()

if len(my_list) % 2 == 0:
    for i in range(int(len(my_list)/2)):
        result_list.append(even_elements[i])
        result_list.append(odd_elements[i])

else:
    for i in range(int(len(my_list)/2)):
        result_list.append(even_elements[i])
        result_list.append(odd_elements[i])
    result_list.append(odd_elements[int(len(my_list)/2)])

print("new list: ", result_list)




