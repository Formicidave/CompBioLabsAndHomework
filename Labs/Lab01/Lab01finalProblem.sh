cut -f 2-4 -d , PredPreyData.csv > Junk.txt
grep "time" Junk.txt > Lab01.txt
tail Junk.txt >> Lab01.txt
