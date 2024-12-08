#!/bin/bash

# 进入包含文件的目录
cd /var/www/html/downloads/药屋少女的呢喃/药屋少女的呢喃_S01

# 批量重命名
for file in *.mkv; do
    # 提取集数
    episode=$(echo "$file" | grep -oE 'S01E[0-9]+')
    # 新的文件名
    new_name="药屋少女的呢喃_${episode}.mkv"
    # 重命名文件
    mv "$file" "$new_name"
    echo "Renamed '$file' to '$new_name'"
done