#!/bin/sh

ESC=$(printf '\033')

printf "${ESC}[31m現在の Docker が保持する${ESC}[31;4mすべての${ESC}[m${ESC}[31m コンテナ・ボリューム・ネットワーク を削除しますか？ (y/n) :\n${ESC}[m"
read -r YN

if [ "${YN}" = "y" ]; then
  printf "${ESC}[31;4mすべて削除する場合、 'destroy' と入力してください。\n${ESC}[m"
  read -r YN

  if [ "${YN}" = "destroy" ]; then
    printf "削除を実行します...\n"

    docker stop $(docker ps -q)
    docker rm $(docker ps -q -a)
    docker volume rm $(docker volume ls -q)
    docker system prune -f

  else
    exit 0;
  fi

else
  exit 0;
fi
