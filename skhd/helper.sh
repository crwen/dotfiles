#!/bin/bash  

# file='read_file.txt'  

i=1  
while read line; do  

#Reading each line  
str=$line
if [[ !("$str" =~ ^#) && !(-z $str) ]]; then
    echo $str
fi
i=$((i+1))  
done < 'skhdrc'


