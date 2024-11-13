#!/bin/bash

#3создаем функцию для вывода файлов по размеру
get_size() {
   local path="$1" #первый аргумент
    local size=$(du -hs "$path" 2>/dev/null | cut -f1) #4перенаправляем ошибки в никуда
echo $size 
}

#1получаем список всех директорий и файлов
items=$(ls -A)
#2 запишем цикл
for item in $items; do
    size=$(get_size "$item")
    echo -e "$size\t$item"
done | sort -rh -k1,1 #5сортируем по первому столбцу по уменьшению в человекопонятном виде


