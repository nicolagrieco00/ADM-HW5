echo “there are the 5 most popular pairs of heroes”  

cut -d, -f1,2 /Users/gianmarcofiorenza/Desktop/ADM-HW5-main/Senza\ nome/hero-network.csv > temp.csv

 awk -F, '{ if ($1 > $2) { print $1 "," $2 } else { print $2 "," $1 } }' temp.csv > alpha_hero_network.csv

 awk '{ count[$0]++ } END { for (line in count) { print count[line], line } }' alpha_hero_network.csv | sort -nr | head -n 
