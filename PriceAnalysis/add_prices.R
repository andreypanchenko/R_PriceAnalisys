# Load prices data & market sales 
d1 <- read.xlsx("~/R/PriceAnalysis/data_prices/d1.xlsx", 1)
d2.1 <- read.xlsx("~/R/PriceAnalysis/data_prices/d2.1.xlsx", 1)
d2.2 <- read.xlsx("~/R/PriceAnalysis/data_prices/d2.2.xlsx", 1)
d3 <- read.xlsx("~/R/PriceAnalysis/data_prices/d3.xlsx", 1)
d4 <- read.xlsx("~/R/PriceAnalysis/data_prices/d4.xlsx", 1)


d2 <- merge(x = d2.1, y = d2.2, by = 'M_id')
prices <- merge(x = d1, y = d2, by = 'M_id')
prices <- merge(x = prices, y = d3, by = 'M_id')
prices <- merge(x = prices, y = d4, by = 'M_id')


rm(d1, d2, d2.1, d2.2, d3, d4)

colnames(prices)[2] <- "DISTR.1"
colnames(prices)[3] <- "DISTR.2.1"
colnames(prices)[4] <- "DISTR.2.2"
colnames(prices)[5] <- "DISTR.3"
colnames(prices)[6] <- "DISTR.4"


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


# Delete 'NaN' from AVG_PRICE
prices <-
  prices%>%
  filter(AVG_PRICE!='NaN')%>%
  filter(SinglePriceFlag==0)


# Add quantile
prices$QUANTILE_AVG <- addQuantileColumn(prices$AVG_PRICE, 0.2)


# Add price groups
prices$PriceGroup <- addPriceGroups(prices$AVG_PRICE)

  
# Delete excess objects
rm(sales, avgPrice, replaceZero, replaceNA, singlePrice, addQuantileColumn, addMarketShare, addPriceGroups)
