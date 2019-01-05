# Redesign-Project
The main idea of the project is to learn new methods for improvising the original visualization. 
This redesign project is based on R and shiny.

About the dataset
The cancer dataset is taken from the state cancer profile website for this redesign project. 
The dataset contains the statistical data of leukemia for each state in the United States for the years 2011 to 2015. 
It includes incident rates of leukemia for each state. The incident rates are calculated as cases per 100,000 people. 
The confidence intervals for these incident rates are also available in the dataset. 
The data also includes annual trend in the incident rates with its confidence intervals. 
The dataset has a character column which tells if the rate for each state is rising, stable or falling.

About original map

The original map is a interactive choropleth map where quantile interval is used for highlighlight the cancer rates of the states.
One of the most important pieces of information that the map does not tell us is the actual incidence rate of leukemia in the state,unless one hover's on the state.
Sometimes hovering is not possible!
The map also doesn’t convey other vital information which is present in the dataset from which the map is generated. Such other information includes:
•	Confidence Intervals of the age adjusted incidence rates
•	Change in the incidence rates  
•	Confidence intervals of change in incidence rates.
•	Recent trend, that is, if the rate is falling, rising or stable for a state

The map can be improvised by including such information and changing type of graph. There are many ways in which above graph can be redesigned. One of the ways is to use Linked micromap!

•	About the improved graph
Firstly, the values of age adjusted incidence rates are shown on a scale in the third column of the linked micromap. 
The states are sorted according to the trend in rates from 2011-2015. The id column highlights the states in the map and the corresponding information is shown in the other columns. 
The third column also conveys the range in which the maximum data of a state lies, which is nothing but the 95 % confidence intervals of age-adjusted incidence rates. The dot in the age adjusted incident rates column is the actual rate and the line expands from lower 95% confidence interval to upper 95% confidence interval. Similarly, the next column, that is the recent 5-year trend column shows the drift in the annual rate of incidents per state with confidence intervals. 
The last column in the map indicates if the rate is falling, stable or rising in a state. The dataset contains a character column which specifies the trend of rates for all the states. This character column is converted to a numeric column where 1 indicates the rate is rising, 0 indicate the rate is stable and -1 indicates the rate is falling.
•	How improved graph is better?
The improved map conveys more information than the original one. Maximum possible information from the dataset is shown in the linked micromap. Maptail glyph is used which highlights the referenced states from top to bottom in light yellow towards the median area. Using the linked micromap has following advantages:
	The values of incident rates with the confidence intervals is shown in the map.
	Annual Shift in Incident Rates between 2011 and 2015 with the confidence intervals is represented in the map
	Trend of Incident Rates, that is, rising, falling or stability of incident rates
	The questions such as what the value of Incident rate is, Is the incident rate falling or stable or rising, What is the recent trend in incident rates, and what are confidence intervals of incident rates, can be answered about Leukemia statistics for each state.
	The map is conclusive

•	How is the map conclusive?
If we look at the drift in incident rates for both sexes, the annual variation in the incident rates for all the states is approximately around zero. If the value of drift in incident rates is around zero and if the confidence interval expands in positive as well as negative direction, the trend of incident rate is stable. 
But if the value of drift in incident rates lies below zero or the confidence interval does not extend beyond zero, then the trend of incident rate is falling. And if the value of drift in incident rates is greater than zero or the confidence interval does not extend below zero, then the trend of incident rate is rising. 
For example, Washington DC has drift value below zero and the confidence interval does not extend beyond zero, hence the rate is falling. 
And Utah (UT) has drift value slightly greater than zero and the confidence interval does not extend in negative direction, so, the trend is rising. 
Even though Arkansas (AR) have drift value above zero, it has confidence interval in both directions, hence the trend of incident rates in Arkansas is stable. The map also shows the actual value of incident rates which makes it easier to understand the statistics of Leukemia for each state. 
Similary, the linked micromaps are conclusive for mortality rates as well!
