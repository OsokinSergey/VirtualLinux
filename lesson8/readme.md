# Операционные системы и виртуализация (Linux)
## Урок 8. Скрипты Bash

**Задание 1:** Написать скрипт очистки директорий. На вход принимает путь к директории. Если директория существует, то удаляет в ней все файлы с расширениями .bak, .tmp, .backup. Если директории нет, то выводит ошибку.

**Результат:**
[delete.sh](resources/delete.sh)

```
#!/bin/bash

echo 'Введите имя директории для удаления файлов с расширениями (*.bak, *.tmp, *.backup):'
read dirname

if ! [ -d $dirname/ ]; then
  echo 'Директория не существует'
  exit 1
fi
 
find $dirname -maxdepth 1 -iname '*.bak' -exec rm '{}' \;
find $dirname -maxdepth 1 -iname '*.tmp' -exec rm '{}' \;
find $dirname -maxdepth 1 -iname '*.backup' -exec rm '{}' \;
```
**Задание 2:** Создать скрипт ownersort.sh, который в заданной папке копирует файлы в директории, названные по имени владельца каждого файла. Учтите, что файл должен принадлежать соответствующему владельцу.

**Результат:**
[sort.sh](resources/delete.sh)

```
echo 'Введите имя директории для сортировки:'
read dirname

if ! [ -d $dirname ]
 then
    echo 'Директория не существует'
    exit 2
fi

for entry in $(find $dirname -maxdepth 1 -type f)
do
  echo Обработка файла: $entry
  uservar=$(stat -c '%U' "$entry")
  echo Владелец файла: $uservar
  
  mkdir -p $dirname/$uservar/
  cp "$entry" "$dirname/$uservar/"
done
```