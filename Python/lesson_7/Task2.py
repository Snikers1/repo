"""Реализовать проект расчета суммарного расхода ткани на производство одежды.
  Основная сущность (класс) этого проекта — одежда, которая может иметь определенное название.
  К типам одежды в этом проекте относятся пальто и костюм.
  У этих типов одежды существуют параметры: размер (для пальто) и рост (для костюма).
  Это могут быть обычные числа: V и H, соответственно.
  Для определения расхода ткани по каждому типу одежды использовать формулы:
  для пальто (V/6.5 + 0.5),
   для костюма (2 * H + 0.3).
   Проверить работу этих методов на реальных данных."""


from abc import ABC, abstractmethod

class Clothes(ABC):
    def __init__(self, param):
        self.param = param

    @abstractmethod
    def calculate(self):
        pass

class Coat(Clothes):
    @property
    def calculate(self):
        return self.param / 6.5 + 0.5



class Suit(Clothes):
    @property
    def calculate(self):
        return 2 * self.param + 0.3


my_coat = Coat(50)
my_suit = Suit(70)
print(my_suit.calculate)
print(my_coat.calculate)

