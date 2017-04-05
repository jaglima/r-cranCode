# Maximun consecutive date gap in a ts
# Given a time serie g as numeric format, check max number of consecutive NA's in the serie
findNAGap <- function(dates,values){
  
  v = ifelse(is.na(values)==TRUE,0,1)
  tmp = cumul_zeros(v)
  
  maxGap = max(tmp)
  index = which(tmp==max(tmp))
  dateEnd = dates[index]
  dateStart = dateEnd - maxGap + 1
  
  return (list("maxGap" = maxGap, "dateStart" = dateStart, "dateEnd" = dateEnd))
}

# Maximun consecutive gap in a time serie  ts
# Given a time serie g as Date format
findDateGap <- function(g){
  
  dc = as.numeric(diff(g))
  
  if(any(is.na(dc))){
    v = ifelse(is.na(dc)==TRUE,0,1)
    tmp = cumul_zeros(v)
    
    maxGap = max(tmp)
    index = which(tmp==max(tmp))
    dateEnd = g[index+1]
    dateStart = dateEnd - maxGap
  }
  else{
    maxGap = max(dc)
    index = which(dc==maxGap)
    dateEnd = g[index+1]
    dateStart = dateEnd - maxGap
  }
  return (list("maxGap" = maxGap, "dateStart" = dateStart, "dateEnd" = dateEnd))
}

# Cumulative consecutive zeros 
cumulativeZeros <- function(x)  {
  x <- !x
  rl <- rle(x)
  len <- rl$lengths
  v <- rl$values
  cumLen <- cumsum(len)
  z <- x
  # replace the 0 at the end of each zero-block in z by the 
  # negative of the length of the preceding 1-block....
  iDrops <- c(0, diff(v)) < 0
  z[ cumLen[ iDrops ] ] <- -len[ c(iDrops[-1],FALSE) ]
  # ... to ensure that the cumsum below does the right thing.
  # We zap the cumsum with x so only the cumsums for the 1-blocks survive:
  x*cumsum(z)
}


#
# Small example using findNAGap and findDateGap
#
#

# Setting initial values
values = seq(1:10)
dates = as.Date("2017-01-01")+values

# Setting a missing sequency from 4 to 6 positions
values[4:6] = NA

# Now, using findNAGap
findNAGap(dates, values)


# Now setting a missing sequency in dates 
values = seq(1:10)
dates = as.Date("2017-01-01")+values
dates[4:6] = NA

# Checking NA's in the sequency
findDateGap(dates)

# Cheking for uncontinuous dates sequency
dates = na.omit(dates)
findDateGap(dates)

