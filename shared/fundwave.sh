#!/bin/bash 

file1="/home/fundwave/shared/combined.txt"
file2="/home/fundwave/shared/ips.txt"
a=""
while IFS= read -r line
do 
   echo "$line"
   echo "$line" > $file2
   cd "/home/fundwave/"
   make html 
   cd "/home/fundwave/shared/reports"
   for dir in *; do  
	a="$dir"; 
   done
   sudo mv "$a" "${line}.html"
   aws s3 sync reports s3://mywavebucket
done < $file1 

