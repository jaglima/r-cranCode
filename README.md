# Dealing with gaps in yout time series

* findNAGap 
receives a vector dates of Date types and values of Numeric type. It returns a list type object with 
maxGap which the size of maximum NA's gap found, dateStart with the first date in time series where this sequence starts and dateEnd, the date where it ends. 

* findDateGap
Conceptualy differente, findDateGap receives only a vector dates of Date types. It checks if there are NA's in your sequence of dates or if there are leaps with no NA's reported in time sequency. The list object returns same list object described in findNAGap.

* cumulativeZeros
Cumulative consecutive zeros is a support function for former functions and receives a Numeric type vector x and returns, at any position of vector, the cumulative sum of consecutive zeros occurences at these point. Returns a numeric vector with the counting.


