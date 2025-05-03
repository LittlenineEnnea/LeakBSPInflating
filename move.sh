#!/bin/bash

find . -type d -name "buildpath0" | while read -r buildpath; do
    parent_dir=$(dirname "$buildpath")
    echo "处理目录: $parent_dir"
    
    # 只删除 parent_dir 中的 *.tar.gz / *.tgz（不递归）
    find "$parent_dir" -maxdepth 1 -type f \( -name "*.tar.gz" -o -name "*.tgz" \) | while read -r archive; do
        echo "删除压缩文件: $archive"
        rm -f "$archive"
    done
done

find . -type d -name "buildpath0" | while read -r buildpath; do
    parent_dir=$(dirname "$buildpath")
    echo "移动 $buildpath/* 到 $parent_dir/"
    mv "$buildpath"/* "$parent_dir"/ 2>/dev/null
    rmdir "$buildpath"
done

echo "设置全部文件和文件夹权限为 777"
chmod -R 777 .

echo "处理完成。"
