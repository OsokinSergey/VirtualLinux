# Операционные системы и виртуализация (Linux)
## Урок 3. Права доступа и безопасность
**Задание 1:** Создать два произвольных файла. Первому присвоить права на чтение и запись для владельца и группы, только на чтение — для всех. Второму присвоить права на чтение и запись только для владельца. Сделать это в численном и символьном виде.
```
cat > file1
cat > file2
chmod u=rw,g=rw,o=r file1
chmod u=rw,g=,o= file2
chmod 664 file1
chmod 600 file2
```
**Задание 2:** Назначить новых владельца и группу для директории целиком.

```
mkdir test
chown -R osa:admin test
```

**Задание 3:** Управление пользователями:
- создать пользователя, используя утилиту useradd и adduser
- удалить пользователя, используя утилиту userdel 

```
useradd -s /bin/bash -m -d /home/user1 user1
adduser user2
userdel user2
```
**Задание 4:** Управление группами:

- создать группу с использованием утилит groupadd и addgroup;
- попрактиковаться в смене групп у пользователей;
- добавить пользователя в группу, не меняя основной

```
groupadd admingroup
addgroup usergroup
usermod -g  admingroup user1
usermod -aG usergroup user1
```

**Задание 5:** Создать пользователя с правами суперпользователя. Сделать так, чтобы sudo не требовал пароль для выполнения команд.
```
usermod -aG sudo user1
visudo
```