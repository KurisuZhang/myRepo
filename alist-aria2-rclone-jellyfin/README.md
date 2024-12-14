

[toc]

# Aria2

- https://github.com/Masterchiefm/Aria2Dash
- 重命名脚本:
  - [re_name.sh](/alist-aria2-rclone-jellyfin/re_name.sh)


# Alist

- 原版  
  - https://github.com/AlistGo/alist  

- 原版 + aria2  
  - https://github.com/AlistGo/with_aria2

- 重命名插件  

  - https://greasyfork.org/zh-CN/scripts/459303
- jellyfin中播放

  - 打开 web代理 => 302重定向
- webDav
  - https://alist.nn.ci/zh/guide/webdav.html
  - http[s]://domain:port/dav/
  


# Rclone

- https://rclone.org/install/
- https://master-jsx.top/archives/alist-linux

1. fuse3

   - ```bash
     sudo apt update
     sudo apt install fuse3
     ```

2. Docker 中加载映射

   - ```bash
     vim /etc/fuse.conf
     # 确保取消注释 
     user_allow_other
     ```

3. rclone命令

   - ```bash
     # 配置
     rclone config
     # 列出配置
     rclone config show
     # 查看挂载映射
     rclone lsd <name>:
     # 挂载 rclone mount <remote_name>:<lsd_name> <local_path>
     rclone mount alist:阿里云 /home/shuai/aliyun/ --umask 0022 --default-permissions --allow-non-empty --allow-other --no-check-certificate --header "Referer:" --daemon
     #rclone mount alist:离线下载 /home/shuai/download/ --umask 0022 --default-permissions --allow-non-empty --allow-other --no-check-certificate --header "Referer:" --daemon
     # 取消挂载 fusermount -u /home/shuai/resource/
     ```

   - alist:离线下载  1.0P     0  1.0P   0% /home/shuai/download
     alist:阿里云    1.0P     0  1.0P   0% /home/shuai/aliyun

4. systemctl 自动重启

   - 创建脚本 ```vim /usr/local/bin/rclone-mount.sh```  [rclone-mount.sh](/alist-aria2-rclone-jellyfin/rclone-mount.sh)

   - 权限 ```sudo chmod +x /usr/local/bin/rclone-mount.sh```

   - 添加systemctl ```vim /etc/systemd/system/rclone.service``` [rclone.service](/alist-aria2-rclone-jellyfin/rclone.service)

   - ```bash
     # 1. 重新加载 systemd 守护进程
     systemctl daemon-reload
     # 2. 设置开机自启
     systemctl enable rclone.service
     # 3. 启动服务
     systemctl start rclone.service
     # 4. 查看服务状态
     systemctl status rclone.service
     ```

# Jellyfin

- Docker 镜像 https://github.com/linuxserver/docker-jellyfin

- 原版镜像 https://github.com/jellyfin/jellyfin

- 安装

  - ```bash
    mkdir jellyfin
    cd jellyfin
    vim docker-compose.yml
    ```

  - [jellyfin-docker-compose.yml](/alist-aria2-rclone-jellyfinv/jellyfin-docker-compose.yml)

- 首次配置地址 http://localhost:8096/web/index.html#!/wizardstart.html

- 插件

  - https://github.com/cxfksword/jellyfin-plugin-metashark
  
- (低配置禁止自动转码, 防止CPU占用率过高)

