#!/bin/bash

# 挂载第一个目录
rclone mount alist:阿里云 /home/shuai/aliyun/ --umask 0022 --default-permissions --allow-non-empty --allow-other --no-check-certificate --header "Referer:" --daemon

# 挂载第二个目录
rclone mount alist:离线下载 /home/shuai/download/ --umask 0022 --default-permissions --allow-non-empty --allow-other --no-check-certificate --header "Referer:" --daemon


echo "Rclone mounts completed at $(date)"