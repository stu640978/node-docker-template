#!/bin/bash

# 如果定義了 PACKAGE_MANAGER，則使用指定的包管理器安裝依賴
if [ -n "$PACKAGE_MANAGER" ]; then
    if [ "$PACKAGE_MANAGER" = "yarn" ]; then
        npm install -g yarn
    elif [ "$PACKAGE_MANAGER" = "pnpm" ]; then
        npm install -g pnpm
    fi
fi

# 避免容器退出
while true; do
    sleep 3600
done