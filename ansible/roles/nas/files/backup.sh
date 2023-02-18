#!/bin/bash

begin=$(date +%s)

rsync "${@:2}"

sleep 1
end=$(date +%s)
echo "backups.$1:$(($end-$begin))|g" | nc -w 1 -u localhost 8125
