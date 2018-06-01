#!/bin/bash
read -p "Are you sure? " -n 1 -r

echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo "Jatketaan"
    # do dangerous stuff

rm -rf source/*
rsync -avzh enc/* source/
for i in $(find enc/ -type f) ;
do 
ls $i;
openssl enc -kfile /home/sofiev/passwordFilu.txt -in $i -d -aes-256-cbc -pass stdin > "source${i:3}" ;
done

fi
