#!/bin/bash

# 声明一个字符串数组
my_array=("VM_Win11" "VM_Kali" "RM_Win11")
RM_IP=192.168.122.194
RM_USER=11630
RM_PASS=qwe123

# 将数组元素拼接成包含换行符的字符串
joined_string=$(printf "%s\n" "${my_array[@]}")

# 输出拼接后的字符串
choice=$(echo -e "$joined_string" | rofi -dmenu -i -replace -config /home/emoon/dotfiles/rofi/config-themes.rasi -no-show-icons -width 30 -p VMShow-format i)

case $choice in
    "VM_Win11")
        echo "VM Win11 Option"
        ~/dotfiles/scripts/launchvm.sh
        ;;
    "VM_Kali")
        echo "VM Kali Option"
        ;;
    "RM_Win11")
        echo "Remote Win11 Option"
        xfreerdp3 /v:$RM_IP /u:$RM_USER /p:$RM_PASS /size:100% /cert:ignore -grab-keyboard /d: /dynamic-resolution
        ;;
    *)
        echo "无效的选项"
        ;;
esac

