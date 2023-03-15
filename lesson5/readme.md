# Операционные системы и виртуализация (Linux)
## Урок 5. Настройка сети в Linux. Работа с IPtables

**Задание 1:**
 Настроить статическую конфигурацию (без DHCP) в Ubuntu через ip и netplan. Настроить IP, маршрут по умолчанию и DNS-сервера (1.1.1.1 и 8.8.8.8). Проверить работоспособность сети.

**Решение:**
```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [10.0.2.15/24]
      routes:
        - to: default
          via: 10.0.2.2
      nameservers:
        addresses:
          - 8.8.8.8
          - 1.1.1.1
```
Через IP

```
sudo api addr add 10.0.2.15/255.255.255.0 broadcast 10.0.2.2
dev enp0s3
ping ya.ru
```

**Задание 2:**
Настроить правила iptables для доступности сервисов на TCP-портах 22, 80 и 443. Также сервер должен иметь возможность устанавливать подключения к серверу обновлений. Остальные подключения запретить.

**Решение:**

```
iptables -A INPUT -p TCP --dport 22 -j ACCEPT
iptables -A INPUT -p TCP --dport 80 -j ACCEPT
iptables -A INPUT -p TCP --dport 443 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -P INPUT DROP
```

**Задание 3:**
Запретить любой входящий трафик с IP 3.4.5.6.

**Решение:**

```
iptables -I INPUT -s 3.4.5.6 -j DROP
```

**Задание 4:**
Запросы на порт 8090 перенаправлять на порт 80 (на этом же сервере).

**Решение:**

```
iptables -t nat -I PREROUTING -p tcp --dport 8090 -j REDIRECT --to-port 80
```

**Задание 5:**
Разрешить подключение по SSH только из сети 192.168.0.0/24.

**Решение:**

```
iptables -I INPUT -p tcp --dport 22 -j DROP
iptables -I INPUT -p tcp --dport 22 -s 192.168.0.0/24 -j ACCEPT

```