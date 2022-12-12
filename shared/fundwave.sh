#!/bin/bash 

file1="/home/fundwave/flan/shared/combined.txt"
file2="/home/fundwave/flan/shared/ips.txt"
a=""
while IFS= read -r line
do 
   echo "$line"
   echo "$line" > $file2
   cd "/home/fundwave/flan/"
   make html 
   cd "/home/fundwave/flan/shared/reports"
   for dir in *; do  
	a="$dir"; 
   done
   mv "$a" "${line}.html"
   #aws s3 sync $b s3://mywavebucket
done < $file1 

