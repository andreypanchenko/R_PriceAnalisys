sales <- read.xlsx("~/R/PriceAnalysis/data_prices/sales_market.xlsx", 1)
sales$ID_M <- as.integer(sales$ID_M)


sales <- sales[order(sales$Money, decreasing = TRUE),]
sales$MarketShareMoney <- sales$Money / sum(sales$Money) * 100
sales$CumulativeMarketShareMoney <- cumsum(sales$MarketShareMoney)
len <- length(sales$CumulativeMarketShareMoney)
temp <- vector()
for(i in 1:len){
  if(sales$CumulativeMarketShareMoney[i] <= 80) {temp[i] = "A"
  next} 
  if(sales$CumulativeMarketShareMoney[i] <= 95) {temp[i] = "B"
  next}
  else {temp[i] = "C"}
}  
sales$MoneyCategory <- temp


sales <- sales[order(sales$Quantity, decreasing = TRUE),]
sales$MarketShareQuantity <- sales$Quantity / sum(sales$Quantity) * 100
sales$CumulativeMarketShareQuantity <- cumsum(sales$MarketShareQuantity)
len <- length(sales$CumulativeMarketShareQuantity)
temp <- vector()
for(i in 1:len){
  if(sales$CumulativeMarketShareQuantity[i] <= 70) {temp[i] = "A"
  next} 
  if(sales$CumulativeMarketShareQuantity[i] <= 90) {temp[i] = "B"
  next}
  else {temp[i] = "C"}
}  
sales$QuantityCategory <- temp


sales <- sales[order(sales$Money, decreasing = TRUE),]
#sales <- data.frame(sales[1], sales[4], sales[6], sales[7], sales[9])


temp <- vector()
for(i in 1:len){
  if(i <= 100){temp[i] = "1. TOP 100" 
  next}
  if(i <= 1000){temp[i] = "2. TOP 1000"
  next}
  if(i <= 2500){temp[i] = "3. TOP 2500"
  next}
  else {temp[i] = "4. more than 2500"}
}

sales$TOP <- temp

sales$Rank_in_Market <- 1:length(sales$ID_M)

rm(i,len,temp)
