"""Реализовать базовый класс Worker (работник), в котором определить атрибуты:
   name, surname, position (должность), income (доход).
   Последний атрибут должен быть защищенным и ссылаться на словарь, содержащий элементы:
   оклад и премия, например, {"wage": wage, "bonus": bonus}.
   Создать класс Position (должность) на базе класса Worker.
   В классе Position реализовать методы получения полного имени сотрудника (get_full_name)
   и дохода с учетом премии (get_total_income).
   Проверить работу примера на реальных данных (создать экземпляры класса Position,
   передать данные, проверить значения атрибутов, вызвать методы экземпляров)."""

incomes = {"Программист Python": {"wage": 100000,
                        "bonus": 1000},
           "Продавец из пятерочки": {"wage": 45000,
                                     "bonus": 5000}}

class Worker:
    def __init__(self, name, surname, position, income):  # в качестве income будем передавать словарь incomes
        self.name = name
        self.surname = surname
        self.position = position
        self._wage_salary = income[position]["wage"]
        self._bonus = income[position]["bonus"]

class Position(Worker):
    def get_full_name(self):
        print(f"Полное имя:  {self.name + ' ' + self.surname}")

    def get_total_income(self):
        print(f"Доход с учетом премии: {self._wage_salary + self._bonus}")


employee_1 = Position('Роман', 'Бессонов', 'Программист Python', incomes)
employee_1.get_full_name()
employee_1.get_total_income()

employee_2 = Position("Любовь", "Сидорова", "Продавец из пятерочки", incomes)
employee_2.get_full_name()
employee_2.get_total_income()




