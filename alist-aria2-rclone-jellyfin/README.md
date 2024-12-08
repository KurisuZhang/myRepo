# my-jellyfin

## Aria2 

- https://github.com/Masterchiefm/Aria2Dash

- 重命名 'The Apothecary Diaries S01E01-[1080p][BDRIP][x265.FLAC].mkv' => 药屋少女的呢喃_S01E01.mkv

- ```bash
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
  
  ```


## Alist

- https://github.com/AlistGo/alist  
- https://github.com/AlistGo/with_aria2/tree/v3.40.0

  离线下载

  如果你使用 **docker**，请自行映射以下两个默认路径（映射至宿主机相同的目录）

  - **/opt/alist/data/temp/aria2**
  - **/opt/alist/data/temp/qbittorrent**
  
- 重命名插件

  - https://greasyfork.org/zh-CN/scripts/459303

- jellyfin中播放

  - 打开 web代理 => 302重定向


## Rclone

- https://rclone.org/install/
- https://master-jsx.top/archives/alist-linux

1. Docker 中加载映射

```
vim /etc/fuse.conf
# 确保取消注释 
user_allow_other
```

2. rclone命令

```bash
rclone config

rclone config show

rclone lsd <name>:

rclone mount <remote_name>:<lsd_name> <local_path>


rclone mount alist:阿里云 /home/shuai/emby/alist --umask 0022 --default-permissions --allow-non-empty --allow-other --no-check-certificate --header "Referer:" --daemon
```



````bash
# 1. 创建/修改 service 文件
vim /usr/lib/systemd/system/rclone.service

```
[Unit]
Description=Rclone Mount Service
Documentation=https://rclone.org/docs/
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/rclone mount remote:/云盘备份 /data/Aliyundev/alidrive \
    --copy-links \
    --no-gzip-encoding \
    --no-check-certificate \
    --allow-other \
    --allow-non-empty \
    --umask 000 \
    --use-mmap
Restart=on-failure
RestartSec=10
Environment=RCLONE_CONFIG=/root/.config/rclone/rclone.conf

[Install]
WantedBy=multi-user.target
```

# 2. 重新加载 systemd 守护进程
systemctl daemon-reload

# 3. 设置开机自启
systemctl enable rclone.service

# 4. 启动服务
systemctl start rclone.service

# 5. 查看服务状态
systemctl status rclone.service

````

## Jellyfin

- https://github.com/linuxserver/docker-jellyfin
- https://github.com/jellyfin/jellyfin

- 首次配置 http://localhost:8096/web/index.html#!/wizardstart.html




插件

-  https://github.com/cxfksword/jellyfin-plugin-metashark
