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