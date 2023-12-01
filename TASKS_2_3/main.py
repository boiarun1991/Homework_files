with open('1.txt', encoding='utf') as file_1, open('2.txt', encoding='utf') as file_2, open('3.txt', encoding='utf') as file_3, open('result.txt', 'w', encoding='utf') as res:
    need_writes = ({'1.txt': file_1.readlines(), '2.txt': file_2.readlines(), '3.txt': file_3.readlines()}) # Создём словарь со списками строк из файлов
    sorted_writes = dict(sorted(need_writes.items(), key=lambda item: item[1], reverse=True)) # Сортируем словарь по увеличению кол-ва строк в списках
    for write in sorted_writes.items(): # Запись в результирующий файл
        res.write(f'{write[0]}\n') # Запись названия файла
        res.write(f'{len(write[1])}\n') # Запись кол-во строк в файле
        res.write(f'\n') # Дополнительная строка для разделения служебной ниформации и содержания файла
        for line in write[1]: # Запись строк в новый файл
            if '\n' in line: # Проверка, имеет ли строка знак переноса, если нет-добавляем знак
                res.write(line)
            else:
                res.write(f'{line}\n\n')


