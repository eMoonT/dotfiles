#!/bin/bash

user=lbs
source_server=10.100.1.230
source_dir=/home/lbs/lbs/file/zip
targer_dir=/home/lbs/lbs/file/zip/
sync_dir=/home/lbs/lbs/file/
current_month=`date +%m`

month_pull() {
  #if test $2 -eq 2
  #for i in `seq 1 9`;do
  #  scp ${user}@${source_server}:${source_dir}/track_2022${2}0$i.zip ${target_dir}
  #done
  #for i in `seq 10 31`;do
  #  scp ${user}@${source_server}:${source_dir}/track_2022${2}$i.zip ${target_dir}
  #done
  if test -z $1;then
    echo -e "\e[31mError\e[0m: Found argument"
    help
  fi
  echo "Month_pull..."
}

day_pull() {
  #scp ${user}@${source_server}:${source_dir}/track_2022${current_month}$2.zip ${target_dir}
  if test -z $1;then
    echo -e "\e[31mError\e[0m: Found argument"
    help
  fi
  echo "Day_pull..."
}

sync_pull() {
  #ssh ${user}@${source_server} "cd ${sync_dir}&&tar -c track/ |pv|lz4 -B4|" lz4 -d | tar -xC ${sync_dir}
  echo "Sync_pull..."
}

help() {
  echo -e "Usage:\n$0 -m 02 [01-12]\n$0 -d 02 [01-28/30/31]\n$0 -r" >&2
  echo
  echo -e "Option:"
  echo "   -m, --month                Set month"
  echo "   -d, --day                  Set day"
  echo "   -r, --run                  Set day"
  echo "   -h, --help                 Set day"
  echo
  exit 1
}

while :
do
    case "$1" in
      -m | --month)
          month_pull $2
          shift 2
          ;;
      -d | --day)
           day_pull $2
           shift 2
           ;;
      -r | --run)
           sync_pull
           break
           ;;
      -h | --help)
          help
          exit 0
          ;;
      --) # End of all options
          shift
          break
          ;;
      -*)
          echo -e "\e[31mError\e[0m: Unknown option: $1" >&2
          ## or call function display_help
          exit 1 
          ;;
      *)  # No more options
          break
          ;;
    esac
done
