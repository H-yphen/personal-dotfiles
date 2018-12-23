#!/bin/bash

folder1=$1
folder2=$2

for i in $folder1/* .[^.]*; do
	if [ -f "$folder2/$i" ] 
	then		
		result=$(diff -yW 80 $folder1/$i $folder2/$i)
		if [ $? -eq 0 ]
		then
			echo "found $i,	but no diff"
		else
			echo "diff in $folder1/$i .. $folder2/$i\n$result"
		fi
		sleep 1
	fi
done
#Hazem

