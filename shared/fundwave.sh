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
   #docker run -d --rm -v /home/fundwave/flan/shared:/shared -e upload=aws -e bucket=mywavebucket -e AWS_ACCESS_KEY_ID=AKIA4QSS3DIKX5YYJEGH -e AWS_SECRET_ACCESS_KEY=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 -e format=html flan_scan
done < $file1 
