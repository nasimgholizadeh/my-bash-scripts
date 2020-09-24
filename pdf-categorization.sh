#!/bin/bash
IFS=$'\n'
clear
files=(`find /home/nasim/ -name "*.pdf" 2>/dev/null`)
number=${#files[@]}
echo "Number of pdf files: " $number
mkdir /home/nasim/pdf_files 2>/dev/null
j=0
for ((i=0;i < $number ; i++));do
        ((j++))
        cp "${files[i]}" "/home/nasim/pdf_files/$j.pdf"
        echo "$j - ${files[i]} copied!"
done
echo "Finished!"
