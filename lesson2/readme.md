# Операционные системы и виртуализация (Linux)
## Урок 2. Скрипты Bash

**Задание:**
- Используя команду cat, создать два файла с данными, а затем объединить их. 
- Просмотреть содержимое созданного файла.
- Переименовать файл, дав ему новое имя.
- Создать несколько файлов. Создать директорию, переместить файл туда. 
- Удалить все созданные в этом и предыдущем задании директории и файлы.
- Создать файл file1 и наполнить его произвольным содержимым. 
- Скопировать его в file2.
- Создать символическую ссылку file3 на file1.
- Создать жесткую ссылку file4 на file1.
- Посмотреть, какие айноды у файлов.
- Удалить file1. Что стало с остальными созданными файлами?
- Попробовать вывести их на экран.
- Дать созданным файлам другие, произвольные имена.
- Создать новую символическую ссылку.
- Переместить ссылки в другую директорию.

**Решение:**
```
cat > file1
cat > file2
cat file 1>> file2
cat file 2
mv file2 file3
ls -al
mkdir store
mv f* store
rm -R store
cat > file1
cp file1 file2
ln -s file1 file3
ln file1 file4
ls -ali
rm file1 // file1 удален, file4 остался, file3 сломался
cat file4 // выводить содержимое файла
cat file3 //выдает ошибку: нет такого файла или каталога
mv file4 new_file
ln -s /home/user/test/file4 new_link
mv new_link /home/user
```