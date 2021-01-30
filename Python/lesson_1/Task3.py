# знайте у пользователя число n. Найдите сумму чисел n + nn + nnn.
# Например, пользователь ввёл число 3. Считаем 3 + 33 + 333 = 369.

n = int(input("Введите n: "))
total_sum = 0
for i in range(3):
    total_sum += int(str(n) * (i + 1))
print("summ = ", total_sum)