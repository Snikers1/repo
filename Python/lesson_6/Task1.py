#Создать класс TrafficLight (светофор) и определить у него один атрибут color (цвет) и
# метод running (запуск). Атрибут реализовать как приватный. В рамках метода реализовать
# переключение светофора в режимы: красный, желтый, зеленый.
# Продолжительность первого состояния (красный) составляет 7 секунд,
# второго (желтый) — 2 секунды,
# третьего (зеленый) — на ваше усмотрение.
# Переключение между режимами должно осуществляться только в указанном порядке
# (красный, желтый, зеленый).
# Проверить работу примера, создав экземпляр и вызвав описанный метод.

from itertools import cycle
from time import sleep

class TrafficLight:
    def __init__(self):
        self.__color = 'red'

    def running(self):
        possible_colors = ['red', 'yellow', 'green']
        for element in cycle(possible_colors):
            self.__color = element
            print(f"Текущий цвет : {self.__color}")
            if element == 'red':
                sleep(7)
            elif element == 'yellow':
                sleep(2)
            else:
                sleep(10)

myTrafficLight = TrafficLight()
myTrafficLight.running()



