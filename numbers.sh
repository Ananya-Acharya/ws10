#!/bin/bash
#
infile="amazon_reviews_us_Books_v1_02.tsv"
#
# extract the 9th column of helpful votes
awk -F "\t" '{print $9}' $infile > votes_1.txt
# delete the text line on line 1
`sed 1d votes_1.txt > votes.txt`
# find minimum maximum and average
awk 'BEGIN{min=10000;max=0;s=0;}{if ($1<min) {min=$1}; if ($1>max) {max=$1}; s+=$1;} END {print "minimum: "min," | maximum: "max" | average: "s/NR}' votes.txt
