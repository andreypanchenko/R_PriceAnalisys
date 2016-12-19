source("functions.R")
# Load prices data & market sales 



d1 <- read.csv2("~/R/PriceAnalysis/data_prices/d1.csv")
d2.1 <- read.csv2("~/R/PriceAnalysis/data_prices/d2.1.csv")
d2.2 <- read.csv2("~/R/PriceAnalysis/data_prices/d2.2.csv")
d3 <- read.csv2("~/R/PriceAnalysis/data_prices/d3.csv")
d4 <- read.csv2("~/R/PriceAnalysis/data_prices/d4.csv")


prices <- merge(d1, d2.1, by = 'M_id', all = TRUE)
prices <- merge(prices, d2.2, by = 'M_id', all = TRUE)
prices <- merge(prices, d3, by = 'M_id', all = TRUE)
prices <- merge(prices, d4, by = 'M_id', all = TRUE)

rm(d1, d2.1, d2.2, d3, d4)

colnames(prices)[3] <- "DISTR.1"
colnames(prices)[5] <- "DISTR.2.1"
colnames(prices)[7] <- "DISTR.2.2"
colnames(prices)[9] <- "DISTR.3"
colnames(prices)[11] <- "DISTR.4"


for(i in 2:6){
  prices[i] <-NULL
}
rm(i)

# Transform chars in price column into numbers (replace ',' on '.')
prices$DISTR.1 <- as.numeric(gsub(",", ".", prices$DISTR.1))
prices$DISTR.2.1 <- as.numeric(gsub(",", ".", prices$DISTR.2.1))
prices$DISTR.2.2 <- as.numeric(gsub(",", ".", prices$DISTR.2.2))
prices$DISTR.3 <- as.numeric(gsub(",", ".", prices$DISTR.3))
prices$DISTR.4 <- as.numeric(gsub(",", ".", prices$DISTR.4))


# Merge two price list in DISTR.2 in one (common) price list
prices$DISTR.2 <- replaceNA(prices$DISTR.2.1) + replaceNA(prices$DISTR.2.2)
prices$DISTR.2.1 <- NULL
prices$DISTR.2.2 <- NULL
prices$DISTR.2 <- replaceZero(prices$DISTR.2)

# Add avg in prices
prices$AVG_PRICE <- avgPrice(prices$DISTR.1, prices$DISTR.2, prices$DISTR.3, prices$DISTR.4)
# Add single price flag
prices$SinglePriceFlag <- singlePrice(prices$DISTR.1, prices$DISTR.2, prices$DISTR.3, prices$DISTR.4)
# Add sales in price table
prices <- merge(x = prices, y = sales, by.x = 'M_ID', by.y = 'ID_MORION', all.x = TRUE)

# Delete 'NaN' from AVG_PRICE
prices <-
  prices%>%
  filter(AVG_PRICE!='NaN')

# Add quantile
prices$QUANTILE_AVG <- addQuantileColumn(prices$AVG_PRICE, 0.2)

# Add price groups
prices$PriceGroup <- addPriceGroups(prices$AVG_PRICE)

# Add a market share to sales


  
# Delete excess objects
rm(sales, avgPrice, replaceZero, replaceNA, singlePrice, addQuantileColumn, addMarketShare, addPriceGroups)


 
