FROM ubuntu:latest

# Установка зависимостей и очистка кеша
RUN apt-get update && \
    apt-get install -y dpkg && \
    rm -rf /var/lib/apt/lists/*

# Копирование .deb пакета с использованием точного имени
COPY bubble-sort_1.0-1_amd64.deb /tmp/

# Установка пакета с обработкой зависимостей
RUN dpkg -i /tmp/bubble-sort_1.0-1_amd64.deb || apt-get update && apt-get install -f -y

# Проверка установки программы
RUN test -f /usr/local/bin/my_program || { echo "Binary not found!"; exit 1; }

# Очистка временных файлов
RUN rm -f /tmp/bubble-sort_*.deb

ENTRYPOINT ["/usr/local/bin/my_program"]