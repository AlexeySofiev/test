#!/bin/bash
read -p "Are you sure? " -n 1 -r

echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo "Jatketaan"
    # do dangerous stuff

rm -rf enc/* 
rsync -avzh source/* enc/
for i in $(find source -type f) ;
do 
openssl enc -kfile /home/sofiev/passwordFilu.txt -in $i -aes-256-cbc -pass stdin > "enc${i:6}" ;
done

fi
