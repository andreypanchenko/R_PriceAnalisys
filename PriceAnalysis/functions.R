# Bild multiplot in one window
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


# Replace NA to '0'
replaceNA <- function(x){
  for (i in 1:length(x)) {
    if (is.na(x[i])) {x[i] = 0}
  }
  return(x)
}


# Replace '0' to 'NA'
replaceZero <- function(y){
  for(i in 1:length(y)){
  if (y[i] == 0){y[i] = NA}
  }
  return(y)
}


# Calc the avg in 4 prices
avgPrice <-function(a, b, c, d){
  temp <- vector()
  for (i in 1:length(a)) {
    temp[i] <- mean(c(a[i], b[i], c[i], d[i]), na.rm = TRUE)
    temp[i] <- round(temp[i], 2)
  }
  return(temp)
}


# Mark rows with single price
singlePrice <- function(a, b, c, d){
  temp <- vector()
  for(i in 1:length(a)){
    n = 0
    if(is.na(a[i])){n = n + 0} else {n = n + 1}
    if(is.na(b[i])){n = n + 0} else {n = n + 1}
    if(is.na(c[i])){n = n + 0} else {n = n + 1}
    if(is.na(d[i])){n = n + 0} else {n = n + 1}
    if (n == 1) {temp[i] = 1} else {temp[i] = 0}
  }
  return(temp)
}


# Add column with Quantile
addQuantileColumn <- function(v, n){
  temp <- vector()
  q <- quantile(v, p = seq(0, 1, n))
  for (i in 1:length(v)) {
    for(j in 1:length(q)){
     if(v[i] <= q[j]) {temp[i] = j
     break
     }
    }
  }
  return(temp)
}


# Add Market Share from local file
addMarketShare <- function(v){
  temp <- vector()
  s = sum(v, na.rm = TRUE)
  for(i in 1:length(v)){
    temp[i] = v[i] / s
    if(is.na(temp[i])){temp[i]=0}
  }
  return(temp)
}


# Add Price Group
addPriceGroups <- function(v){
  temp <-vector()
  pg <- c('8. >2000' = 2000
               , '7. 800 - 2000' = 800
               , '6. 400 - 800' = 400
               , '5. 200 - 400' = 200
               , '4. 100 - 200' = 100
               , '3. 50 - 100' = 50
               , '2. 25 - 50' = 25
               , '1. 10 - 25' = 10
               , '0. 0 - 10' = 0)
  for (i in 1:length(v)) {
    for(j in 1:length(pg)){
      if(v[i] >= pg[j]) {temp[i] = names(pg[j]) 
      break
      }
    }
  }
  return(temp)
}





