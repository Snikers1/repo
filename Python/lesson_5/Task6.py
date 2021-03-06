# Необходимо создать (не программно) текстовый файл, где каждая строка
# описывает учебный предмет и наличие лекционных,
# практических и лабораторных занятий по этому предмету и их количество.
# Важно, чтобы для каждого предмета не обязательно были все типы занятий.
# Сформировать словарь, содержащий название предмета и общее количество занятий по нему.
# Вывести словарь на экран.

# прим:
# Информатика: 100(л) 50(пр) 20(лаб).
# Физика: 30(л) — 10(лаб)
# Физкультура: — 30(пр)

subj = dict()
with open('subjects.txt', 'r', encoding='utf-8') as src_file:
    for line in src_file:
        row = line.split()
        subj[row[0]] = sum(map(int, row[1:]))
    print(f'Общее количество часов по предмету - \n {subj}')
