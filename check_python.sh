#!/bin/bash



# 检查Python是否安装
if command -v python &>/dev/null; then
    echo "Python is already installed."
    python --version
elif command -v python3 &>/dev/null; then
    echo "Python 3 is installed, but not aliased as 'python'."
    python3 --version
    # 创建符号链接
    sudo ln -s $(which python3) /usr/bin/python
    echo "Alias 'python' created for Python 3."
else
    echo "Python is not installed. Installing Python 3..."
   # 更新apt索引
   sudo apt update
    # 安装Python 3
    sudo apt install -y python3
    # 检查Python 3是否安装成功
    if command -v python3 &>/dev/null; then
        echo "Python 3 installed successfully."
        # 创建符号链接
        sudo ln -s $(which python3) /usr/bin/python
        echo "Alias 'python' created for Python 3."
    else
        echo "Failed to install Python 3."
    fi
fi
