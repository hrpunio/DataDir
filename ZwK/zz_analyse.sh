#!/bin/bash
F=ZwK_2018_vs_2017.csv
echo "prevdist;speed;sex" > $F
perl join_csvs.pl -fn1 ZwK201809190908.csv  -fs1 1,2 -fn2 ZwK16_17.csv -fs2 1,2  | grep -i prof | \
  awk -F ';' '$15 > 60 || $18 > 24 {gsub (",", "."); print $15 ";" $18 ";" $8 }' >> $F
R CMD BATCH zz_analyse.R
convert -density 300 Rplots.pdf ZwK_2018_vs_2017.jpg
