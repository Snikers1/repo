#Реализовать структуру «Рейтинг», представляющую собой не возрастающий набор натуральных
#чисел.У пользователя необходимо запрашивать новый элемент рейтинга.Если в рейтинге существуют
# элементы с одинаковыми значениями, то новый элемент с тем же значением должен разместиться
# после них

mylist = [7, 5, 3, 3, 2]

for element in [3, 8, 1]:
    max_value = max(mylist)
    if element > max_value:
        mylist.insert(0, element)
    elif element in mylist:
        mylist.insert(mylist.index(element), element)
    else:
        mylist.append(element)

print(mylist)