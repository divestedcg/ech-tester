#License: CC0

wget https://www.domcop.com/files/top/top10milliondomains.csv.zip
unzip top10milliondomains.csv.zip
rm top10milliondomains.csv.zip

cp control.txt domains.txt
#(CC BY-SA 3.0) https://stackoverflow.com/a/19602188
#(CC BY-SA 4.0) https://stackoverflow.com/a/604871
head -n10000 top10milliondomains.csv | awk -F "\"*,\"*" '{print $2}' | tail -n +1 | sort -u >> domains.txt

rm top10milliondomains.csv
