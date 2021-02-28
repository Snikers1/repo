"""4. Реализуйте базовый класс Car.
   У данного класса должны быть следующие атрибуты: speed, color, name, is_police (булево).
   А также методы: go, stop, turn(direction), которые должны сообщать, что машина поехала,
   остановилась, повернула (куда).
   Опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar.
   Добавьте в базовый класс метод show_speed, который должен показывать текущую скорость автомобиля.
   Для классов TownCar и WorkCar переопределите метод show_speed.
   При значении скорости свыше 60 (TownCar) и 40 (WorkCar) должно выводиться сообщение о превышении скорости.
Создайте экземпляры классов, передайте значения атрибутов. Выполните доступ к атрибутам, выведите результат.
 Выполните вызов методов и также покажите результат."""

class Car:
    def __init__(self, speed, color, name, is_police):
        self.speed = speed
        self.color = color
        self.name = name
        self.is_police = is_police

    def go(self):
        print(self.name + " поехала")

    def stop(self):
        print(self.name + " остановилась")

    def turn(self, direction):
        print(self.name + f" повернула {direction}")

    def show_speed(self):
        print("Текущая скорость автомобиля " + self.name + ' ' + self.speed)


class TownCar(Car):
    def show_speed(self):
        super().show_speed()
        if self.speed > 60:
            print("Превышение. Необходимо сбросить скорость")

class SportCar(Car):
    pass

class WorkCar(Car):
    def show_speed(self):
        super().show_speed()
        if self.speed > 40:
            print("Это рабочая техника, а не гоночный баллид!")

class PoliceCar(Car):
    pass

myTownCar = TownCar(180, "серый", "Городской автомобиль", False)
mySportCar = SportCar(250, "оранжевый", "Спортивный автомобиль", False)
myWorkCar = WorkCar(50, "желтый", "Рабочая техника", False)
myPoliceCar = PoliceCar(200, "синий", "Полицейский автомобиль", True)

myPoliceCar.go()
myWorkCar.stop()