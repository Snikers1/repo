#Реализовать скрипт, в котором должна быть предусмотрена функция расчета заработной платы сотрудника.
# В расчете необходимо использовать формулу: (выработка в часах * ставка в час) + премия.
# Для выполнения расчета для конкретных значений необходимо запускать скрипт с параметрами.

import sys
import argparse

#пример запуска
#C:\Users\besso\Desktop\GeekBrains\Основы_языка_Python\lesson_4\Task1.py --time 50 --rate 100 --bonus 20

def createParser ():
    parser = argparse.ArgumentParser()
    parser.add_argument('--time') #выработка в часах
    parser.add_argument('--rate') #ставка в час
    parser.add_argument('--bonus') #премия
    return parser

def salary_calculation(time, rate, bonus):
    return (int(time) * int(rate)) + int(bonus)


if __name__ == '__main__':
    #print(sys.argv)
    parser = createParser()
    args = parser.parse_args(sys.argv[1:])
    #print(vars(args)['time'])
    salary = salary_calculation(vars(args)['time'], vars(args)['rate'], vars(args)['bonus'])
    print(f"Заработная плата сотрудника составляет: {salary}")

