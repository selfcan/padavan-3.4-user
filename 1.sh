#!/bin/bash

# 查找当前目录下所有具有执行权限的文件（排除目录）
find . -type f -perm /a+x | while read file; do
    # 排除.git目录下的文件，避免对.git目录中的文件操作
        if [[ "$file" != ".git"* ]]; then
	        # 对每个找到的文件执行git update-index命令
		        git update-index --add --chmod=+x "$file"
			    fi
			    done
