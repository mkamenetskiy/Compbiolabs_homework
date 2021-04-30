# **What is the power of English?**

### Specifically, what is the effect of english fluency on journal publication in Spanish speaking countries in Latin America? 

> This project was assigned through a github repository for the class EBIO4420. The link to the instructions can be found [here](https://github.com/flaxmans/CompBio_on_git/blob/main/Assignments/09_Independent_Project_Step2.md).

In the past, science had a common tongue, Latin. People would speak their native language as well as the learned language of Latin in order to share ideas. 
Today, the popular science lingua franca is English. English is the gateway to prestigious journals and is one of the most efficient ways to get an idea across to a global audience (Amano, 2016). Although this is a useful and common platform for the exchange of ideas, this disadvantages non native english speakers, even entire countries.  This can be detrimental to their scientific communities and the information that can be received from the results of various studies. 

## Methods
In this investigation, I will use the data of various countries' yearly journal publications. I will be focusing specifically on the Latin American region of the globe. Using the data collected from the [Worldbank](https://data.worldbank.org/indicator/IP.JRN.ARTC.SC?year_low_desc=true), I will parse out the journal output of each Latin American country over the years (The World Bank) . 
 The journal output of each country is assigned in a CSV of data provided by the Worldbank. Countries are alphabetized and their journal output is inputed from 2000-2020. There are columns available before 2000 but are empty for the countries for this investigation. The journal output seems to be an average and there are a total of 263 rows for all of the countries, seeing this is a focus on Latin American countries, I must narrow the rows just belonging to Latin America. 

In order to make the journal output proportional to each country, the journal output must be divided by the population of each individual country. The population data was also derived from the World Bank [database](https://data.worldbank.org/indicator/SP.POP.TOTL?end=2019&start=1960&view=chart) and delivers population numbers for every country around the globe (The World Bank). The CSV of this population data follows the exact same format as the journal output data mentioned above. 

In order to understand the impact of English speaking, I will compare the proportional journal output by country with an [English proficiency index](https://www.ef.com/wwen/epi/). The english proficiency index was collected through a private company that utilized a sample size of adults and young adults. They therein conducted an english test. The sample size is innately skewed to those already interested in learning English or knowing their own level of English. Additionally, access to Wifi or a mobile device was needed in order to take the test. After the tests of all regions were taken, the results were converted into a score with a weighted component of the previous year's score. Their reports were released by a cohesive report in a pdf and is not downloadable in a table format. Each data report had to be copied into an excel and further parsed by hand. This presented many challenges in converting it into a form that could be easily worked with through R. 
Additionally, the english proficiency data possessed reports only from 2011-2018. This limited to ability to look at long term impacts of the rise of english proficiency with the rise of journal output. 

The World Bank provided blunt data for further individual analysis. They did not conduct their own analysis of the data or came to any conclusions. 
For the EF data of English Proficiency, their agenda was more clear to promote the adaption of english fluency toward more countries. They provided the results of the english proficiency scores was well as country GDP, years of schooling and other data that may provide a correlation of the results of a higher english proficiency. 
While the EF index provides statistics such as the ones mentioned above that may have a correlation to English proficiency, my goal in this project was to find the correlation of the journal output of countries to see if there was any impact on a country's scientific output due to English proficiency. 

## Results and Conclusions 
It was clear that the journal output of Spanish speaking Latin American countries had a general rise of the past decade as seen below: 
![Proportion-JO-Progression-in-LA-Countries-Graph-1.jpg](https://i.postimg.cc/NMxBk43h/Proportion-JO-Progression-in-LA-Countries-Graph-1.jpg)
From this image, we see that the overall general trend of all countries is an upward gain in journal publication over the decade, or a stationary amount. 

The same general trend is not seen when we see the English proficiency scores throughout the years as seen below: 

[![Screen-Shot-2021-04-30-at-2-29-10-PM.png](https://i.postimg.cc/j2Qc5Wn4/Screen-Shot-2021-04-30-at-2-29-10-PM.png)](https://postimg.cc/1VXw73H8)
It seems that the scores are fairly sporadic, with a slight general increase of scores over the years. It is already interesting to see that the top journal output countries do not align with the highest English proficiency scores. This already is a sign that there may not be that high of a correlation between the two factors of journal publications and English proficiency. 

To further investigate the correlation between English proficiency and Journal Publication output, I began by looking at one country: Argentina since I had studied abroad there. Below is English Proficiency graphed against the journal output. [![Screen-Shot-2021-04-30-at-2-42-54-PM.png](https://i.postimg.cc/nryxHP7D/Screen-Shot-2021-04-30-at-2-42-54-PM.png)](https://postimg.cc/WqwC8S5N)

From this graph, it is a bit difficult to assign any correlation with such a small and sporadic data frame. Therefore, all of the countries' English Proficiency was plotted against the journal output. 
[![Screen-Shot-2021-04-30-at-2-46-35-PM.png](https://i.postimg.cc/WzLjVy0J/Screen-Shot-2021-04-30-at-2-46-35-PM.png)](https://postimg.cc/9RpstJ8W)

The data above seemed even more sporadic. With little evidence of any correlation between the journal output and English proficiency year to year. To further explore this correlation, the correlative cofactor between the two factors would have to be drawn from the mean journal output and english proficiency scores for each country over the decade. The mean number for each of these factors is represented in bar graphs below: 
[![Screen-Shot-2021-04-30-at-3-15-28-PM.png](https://i.postimg.cc/G2T0t1Rm/Screen-Shot-2021-04-30-at-3-15-28-PM.png)](https://postimg.cc/S24113jB)
[![Screen-Shot-2021-04-30-at-3-47-55-PM.png](https://i.postimg.cc/GtP5TL5d/Screen-Shot-2021-04-30-at-3-47-55-PM.png)](https://postimg.cc/ctHmVSWb)

Through these bar graphs, it is even more visually  clear that there is little correlation between the two. 
Through a simple correlation analysis of the factor, we find out that the correlation coefficient is 0.3. A correlation coefficient can tell us the degree of association between two variables on a scale of -1 to 1 (Correlation and Regression, 2021). A value of 0.3 is extremely low and suggests there is little correlation, much of what the visual representations also lead us to believe!

### What does this tell us? 
This tells us that many other factors may be at play here. The GDP of the country, number of years of schooling, the type of academic programs, etc... all can have a monumental role on the journal output of a country. It is evident that English proficiency and journal output alone are nowhere near causal  or even correlational. It is also reductionistic to just see the "success" of a country simply based off of the number of articles published. This can even be damaging, unjustly not accounting for the obstacles that certain countries must face against this arbitrary mark of success. 

Overall, this exploration of the link between the two factors really shed light on perhaps the unjust ways that the EF data was putting emphasis on English speaking as a mark of a country's success or ability to grow. While developing English is important for certain countries to succeed, it is not the definition or even a correlational factor of success in some realms. 

In a future analysis, I  would love to explore this correlation with more factors taken into consideration such as GDP and schooling. I would also like to find other quantitative ways to evaluate the scientific progress and "success" of countries. Finding a more robust of English fluency may also be helpful for vetting the validity of the data. 



### References 

Amano, Tatsuya, Juan P. González-Varo, and William J. Sutherland. “Languages Are Still a Major Barrier to Global Science.” _PLOS Biology_ 14, no. 12 (December 29, 2016): e2000933. [https://doi.org/10.1371/journal.pbio.2000933](https://doi.org/10.1371/journal.pbio.2000933).

Correlation and Regression. (2021, February 09). https://www.bmj.com/about-bmj/resources-readers/publications/statistics-square-one/11-correlation-and-regression. 


EF epi 2020 - EF English Proficiency index - Downloads. (n.d.). https://www.ef.com/wwen/epi/downloads/

The World Bank. "Scientific and Technical Journal Articles". (n.d.) https://data.worldbank.org/indicator/IP.JRN.ARTC.SC?year_low_desc=true

The World Bank. "Population, Total". (n.d) https://data.worldbank.org/indicator/SP.POP.TOTL?end=2019&start=1960&view=chart
