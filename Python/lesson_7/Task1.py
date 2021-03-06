"""Реализовать класс Matrix (матрица). Обеспечить перегрузку конструктора класса
(метод __init__()), который должен принимать данные (список списков) для формирования матрицы
Следующий шаг — реализовать перегрузку метода __str__() для вывода матрицы в привычном виде.
Далее реализовать перегрузку метода __add__() для реализации операции сложения двух объектов
класса Matrix (двух матриц). Результатом сложения должна быть новая матрица.
"""

class Matrix:
    def __init__(self, list_of_lists):
        self.matrix = list_of_lists

    def __str__(self):
        out = ''
        for i in range(len(self.matrix)):
            out += ' '.join(element for element in list(map(str, self.matrix[i])))
            out += '\n'
        return out

    def __add__(self, other):
        if len(self.matrix) != len(other.matrix):
            return 'Матрицы разной размерности. Сложение запрещено!'
        else:
            for i in range(len(self.matrix)):
                if len(self.matrix[i]) != len(other.matrix[i]):
                    return 'Матрицы разной размерности. Сложение запрещено!'
                for j in range(len(self.matrix[0])):
                    self.matrix[i][j] += other.matrix[i][j]
        return self



matrix_1 = Matrix([[1, 2], [3, 4], [5, 6], [7, 8]])
matrix_2 = Matrix([[2, 3], [4, 5], [6, 7], [10, 20]])
matrix_3 = matrix_1 + matrix_2
print(matrix_1)
print(matrix_2)
print('Summ matrix_1 and matrix_2 is:')
print(matrix_3)



