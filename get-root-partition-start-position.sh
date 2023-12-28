#!/bin/bash
# 一开始我在想，为什么没人写一个扩容的脚本来扩容磁盘
# 写着写着发现这个操作非常危险，所以我也不写了
read -p "input root partition name: " disk
echo $disk
fdisk /dev/${disk} <<EOF
p

q
EOF
