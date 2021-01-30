# Пользователь вводит целое положительное число.
# Найдите самую большую цифру в числе.
# Для решения используйте цикл while и арифметические операции.

user_input = int(input("Введите целое положительное число: "))
max_digit = 0
last_digit = 0
while user_input / 10 != 0:
    last_digit = user_input % 10
    user_input = int(user_input / 10)
    if last_digit > max_digit:
        max_digit = last_digit
print("max digit  = ", max_digit)