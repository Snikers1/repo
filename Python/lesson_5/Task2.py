# Создать текстовый файл (не программно), сохранить в нем несколько строк,
# выполнить подсчет количества строк,
# количества слов в каждой строке.

with open('my_test_file.txt', 'r', encoding='utf-8') as inp_file:
    line_count = 0
    for pos, line in enumerate(inp_file.readlines()):
        count_words_in_line = len(line.split())
        line_count += 1
        print(f"Строка {pos + 1} содержит {line_count} слова(слов)")
    print(f"Всего строк: {line_count}")
