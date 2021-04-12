
# **What is the power of English?**
## In the science world, it can be a lot. 
An analysis into the effect of english fluency on journal publication

> The assignment was assigned through a github repository for the class. The link to the instructions can be found [here](https://github.com/flaxmans/CompBio_on_git/blob/main/Assignments/08_Independent_Project_Step1.md).

The goal of this project will be in line with a possible direction for a thesis I plan to write for my Spanish major. In this investigation, I hope to explore the impact that monolingualism has on scientific communities that do not primarily speak English. Today, the popular science lingua franca is English. English is the gateway to prestigious journals and is one of the most efficient ways to get an idea across to a global audience (Amano, 2016). Although this is a useful common platform for the exchange of ideas, this disadvantages non native english speakers, even entire countries, face can be detrimental to their scientific communities and the information that can be received from the results of various studies. 

In this specific investigation, I will use the data of various countries' yearly journal publications. I will be focusing specifically on the Latin American region of the globe. Using the data collected from the [Worldbank](https://data.worldbank.org/indicator/IP.JRN.ARTC.SC?year_low_desc=true), I will parse out the journal output of each Latin American country over the years.  In order to understand the impact of English speaking, I will compare the journal output by country with an [English proficiency index](https://www.ef.com/wwen/epi/). 

## Summary Of Data 
The journal output of each country is assigned in a CSV of data provided by the Worldbank. Countries are alphabetized and their journal output is inputed from 2000-2020. There are columns available before 2000 but are empty for the countries for this investigation. The journal output seems to be an average as it is not a whole number, therefore meaning it will most likely have to be rounded. There are in total 263 rows for all of the countries, seeing this is a focus on Latin American countries, it would be best to narrow the rows just belonging to Latin America. This will most likely have to be done through a vector identifying said countries. 

The english proficiency index was collected through a private company that utilized a sample size of adults and young adults. They therein conducted an english test. The sample size is innately skewed to those already interested in learning English or knowing their own level of English. Additionally, access to Wifi or a mobile device was needed in order to take the test. After the tests of all regions were taken, the results were converted into a score with a weighted component of the previous year's score. 

The english proficiency index is a bit more difficult to parse out through code. Their reports were released by a cohesive report in a pdf and is not downloadable in a table format. I will have to manually transfer each data report into an excel or copy and paste it as a raw text and therein parse out the data through finder commands. 

The goal of the final analysis is to carry out a simple linear regression analysis to find the correlation between the factors of English proficiency and journal output. The data will first be converted into a scatter plot of each country in Latin America  and all countries with english proficiency scores on the x axis and journal outputs on the dependent y axis. Afterwards, a linear regression will be conducted. For further analysis, a longitudinal analysis will be taken for each country comparing the rise of journal output to English proficiency over a ten year span. The correlation coefficient will be gathered at each time data point and compared over time. 


### References 

Amano, Tatsuya, Juan P. González-Varo, and William J. Sutherland. “Languages Are Still a Major Barrier to Global Science.” _PLOS Biology_ 14, no. 12 (December 29, 2016): e2000933. [https://doi.org/10.1371/journal.pbio.2000933](https://doi.org/10.1371/journal.pbio.2000933).

Correlation and Regression. (2021, February 09). https://www.bmj.com/about-bmj/resources-readers/publications/statistics-square-one/11-correlation-and-regression. 


EF epi 2020 - EF English Proficiency index - Downloads. (n.d.). https://www.ef.com/wwen/epi/downloads/

Scientific and Technical Journal Articles. (n.d.) https://data.worldbank.org/indicator/IP.JRN.ARTC.SC?year_low_desc=true
