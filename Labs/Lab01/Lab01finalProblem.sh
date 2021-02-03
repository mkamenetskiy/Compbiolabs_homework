cut -f 2-4 -d , PredPreyData.csv | head > FinalPredPreyDataList.csv
awk '{print $1; exit}' TestPredPreyData.csv >> FinalPredPreyDataList.csv
less PredPreyData.csv
