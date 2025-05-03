#!/bin/bash

find . -type f \( -name "*.tar.gz" -o -name "*.tgz" \) | while read -r archive; do
    echo "解压: $archive"
    dir=$(dirname "$archive")
    tar -xzf "$archive" -C "$dir"
done

echo "所有 .tar.gz 和 .tgz 文件解压完成。"
