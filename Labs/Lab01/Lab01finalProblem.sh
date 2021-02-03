cut -f 2-4 -d , PredPreyData.csv | awk '{print $1; exit}' > FinalPredPreyData.csv
cut -f 2-4 -d , PredPreyData.csv | tail >> FinalPredPreyData.csv
less FinalPredPreyData.csv
