# Операционные системы и виртуализация (Linux)
## Урок 4. Подключение сторонних репозиториев, ручная установка пакетов

**Задание 1:** Подключить дополнительный репозиторий на выбор: Docker, Nginx, Oracle MySQL. Установить любой пакет из этого репозитория.

*Решение:*

В каталоге /etc/apt/sources.list.d создаем файл nginx.list:

```
deb [arch=amd64] https://nginx.org/packages/ubuntu/ focal nginx
deb-src https://nginx.org/packages/ubuntu/ focal nginx
```
и далее

 ```
 sudo apt update
 sudo apt install nginx
 ```

**Задание 2:** Установить и удалить deb-пакет с помощью dpkg.

*Решение:*
На примере браузера Vivaldi
```
sudo dpkg -i vivaldi-stable_5.7.2921.63-1_amd64.deb
sudo apt --purge remove vivaldi-stable
```

**Задание 3:** Установить и удалить snap-пакет.

*Решение:*
На примере IDP PyCharm

```
sudo snap install pycharm-professional
sudo snap remove pycharm-professional
```

**Задание 4:** Добавить задачу для выполнения каждые 3 минуты (создание директории, запись в файл).
```
crontab -e
```
и вносим следующие записи
```
*/3 * * * * mkdir /home/user/test
*/3 * * * * ls -al > /home/user/test
```


**Задание 5:** Подключить PPA-репозиторий на выбор. Установить из него пакет. Удалить PPA из системы.

*Решение:*
Основано на примере установки геоинформационной системы QGIS.

Существует насколько способов добавления PPA - репозиториев. Добавим с использованием утилиты **add-apt-repository**:

```
sudo add-apt-repository ppa:ubuntugis/ppa
sudo apt update
sudo apt install qgis
sudo add-apt-repository --reomove ppa:ubuntugis/ppa

```

**Задание 6:** Создать задачу резервного копирования (tar) домашнего каталога пользователя. Реализовать с использованием пользовательских crontab-файлов.

```
crontab -e
```
вносим запись:

```
0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
```