#! /bin/bash
 
export file=$1
if [[ -e $file ]];
then
 
num_of_lines=`wc -l $1`
num_of_words=`wc -w $1`
most_freq_word=`cat $1 | tr '[:space:]' '[\n*]' | sort | uniq -c | sort -bnr | head -n 1`
least_freq_word=`cat $1 | tr '[:space:]' '[\n*]' | sort | uniq -c | sort -bnr | tail -n 1`
dwords=`cat $1 | tr '[:space:]' '[\n*]' | grep -o '\b[dD][\da-zA-Z]*[dD]\b' | sort | wc -w`
awords=`cat $1 | tr '[:space:]' '[\n*]' | grep -o '\b[aA]' | wc -w`
numeric_words=`cat $1 | tr '[:space:]' '[\n*]' | grep -o '[1-9]\{1,\}' | sort | wc -l`
alphanumeric_words=`cat $1 | tr '[:space:]' '[\n*]' | grep -o '[1-9a-zA-Z]\{1,\}' | sort | wc -l`
 
echo "Number of lines: $num_of_lines"
echo "Number of words: $num_of_words"
echo "Most frequent word: $most_freq_word"
echo "Least frequent word: $least_freq_word"
echo "Number of words that start and end with d: $dwords"
echo "Number of words that start with a: $awords"
echo "Number of numeric words: $numeric_words"
echo "Number of alphanumeric words: $alphanumeric_words"
 
else
 echo "Improper file path"
fi
