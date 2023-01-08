# 1
echo “there are the 5 most popular pairs of heroes”  

# save the dataset in a temporary file called temp.csv
cut -d, -f1,2 /Users/gianmarcofiorenza/Desktop/ADM-HW5-main/Senza\ nome/hero-network.csv > temp.csv

# sort the pairs of heroes alphabetically, in this way the pairs will be recognized and counted together.
# Otherwise the pair (a,b), and the pair (b,a) would be different.
 awk -F, '{ if ($1 > $2) { print $1 "," $2 } else { print $2 "," $1 } }' temp.csv > alpha_hero_network.csv

# now count the number of times one cuple appears, sort them, and take the first 5
 awk '{ count[$0]++ } END { for (line in count) { print count[line], line } }' alpha_hero_network.csv | sort -nr | head -n 5

# 2
echo "Number of comics per hero:"

# count the number of comic per hero using count[] funcion and for every hero, print the number of comics where he appear 
awk -F, '{count[$1]++} END {for (hero in count) {print hero, count[hero]}}' '/Users/gianmarcofiorenza/Desktop/ADM-HW5-main/Senza nome/edges.csv'

# 3
echo "The average number of heroes in comics"

# like before, count the number of heroes per comic and print the average
awk -F, '{count[$2]++} END {for (c in count) {tot += count[c]}} END {print tot / length(count)}' '/Users/gianmarcofiorenza/Desktop/ADM-HW5-main/Senza nome/edges.csv'