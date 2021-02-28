#Создать текстовый файл (не программно), построчно записать фамилии сотрудников
# и величину их окладов.
# Определить, кто из сотрудников имеет оклад менее 20 тыс.,
# вывести фамилии этих сотрудников.
# Выполнить подсчет средней величины дохода сотрудников.

employees = dict()

with open('Salaries.txt', 'r', encoding='utf-8') as salaries:
    for line in salaries.readlines():
        emp, sal = line.strip().split()
        employees[emp] = sal

less_20 = {emp: sal for emp, sal in employees.items() if int(sal) < 20000}
print("Сотрудники, получающие менее 20 тыс.", less_20.keys())

salaries = list(map(float, employees.values()))

print("Средняя величина дохода сотрудников", sum(salaries) / len(salaries))

