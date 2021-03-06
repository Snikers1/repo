""" Реализовать программу работы с органическими клетками.
    Необходимо создать класс Клетка. В его конструкторе инициализировать параметр,
    соответствующий количеству клеток (целое число).
    В классе должны быть реализованы методы перегрузки арифметических операторов:
сложение (__add__()),
вычитание (__sub__()),
умножение (__mul__()),
деление (__truediv__()).
   Данные методы должны применяться только к клеткам и выполнять увеличение,
   уменьшение, умножение и обычное (не целочисленное) деление клеток, соответственно.
   В методе деления должно осуществляться округление значения до целого числа.

В классе необходимо реализовать метод make_order(), принимающий экземпляр класса и количество ячеек в ряду.
Данный метод позволяет организовать ячейки по рядам.
Метод должен возвращать строку вида *****\n*****\n*****...,
где количество ячеек между \n равно переданному аргументу.
Если ячеек на формирование ряда не хватает, то в последний ряд записываются все оставшиеся."""

class Cell:
    def __init__(self, nums):
        self.nums = nums

    def __str__(self):
        return str(self.nums)

    def __add__(self, other):
        return 'Sum cells is: ' + str(self.nums + other.nums)

    def __sub__(self, other):
        if self.nums >= other.nums:
            return 'Substraction cells is ' + str(self.nums - other.nums)
        else:
            return 'Substraction impossible'

    def __mul__(self, other):
        return 'Multiplication cells is ' + str(self.nums * other.nums)

    def __truediv__(self, other):
        return 'Division cells is ' + str(round(self.nums / other.nums))

    def make_order(self, param):
        num_rows = int(self.nums / param)
        ost = self.nums % param
        result = ''
        for i in range(num_rows):
            result += '*' * param + '\n'
        result += '*' * ost
        return result


my_cell_1 = Cell(24)
my_cell_2 = Cell(15)

print(my_cell_1 + my_cell_2)
print(my_cell_1 - my_cell_2)
print(my_cell_1 * my_cell_2)
print(my_cell_1 / my_cell_2)

print(my_cell_1.make_order(6))