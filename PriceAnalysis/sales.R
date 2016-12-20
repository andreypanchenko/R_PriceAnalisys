sales <- read.xlsx("~/R/PriceAnalysis/data_prices/sales_market.xlsx", 1)
sales$ID_M <- as.integer(sales$ID_M)


sales <- sales[order(sales$Money, decreasing = TRUE),]
sales$MarketShareMoney <- sales$Money / sum(sales$Money) * 100
sales$CumMarketShareMoney <- cumsum(sales$MarketShareMoney)
len <- length(sales$CumMarketShareMoney)
temp <- vector()
for(i in 1:len){
  if(sales$CumMarketShareMoney[i] <= 80) {temp[i] = "A"
  next} 
  if(sales$CumMarketShareMoney[i] <= 95) {temp[i] = "B"
  next}
  else {temp[i] = "C"}
}  
sales$MoneyCategory <- temp


sales <- sales[order(sales$Quantity, decreasing = TRUE),]
sales$MarketShareQuantity <- sales$Quantity / sum(sales$Quantity) * 100
sales$CumMarketShareQuantity <- cumsum(sales$MarketShareQuantity)
len <- length(sales$CumMarketShareQuantity)
temp <- vector()
for(i in 1:len){
  if(sales$CumMarketShareQuantity[i] <= 70) {temp[i] = "A"
  next} 
  if(sales$CumMarketShareQuantity[i] <= 90) {temp[i] = "B"
  next}
  else {temp[i] = "C"}
}  
sales$QuantityCategory <- temp


sales <- sales[order(sales$Money, decreasing = TRUE),]
sales <- data.frame(sales[1], sales[4], sales[6], sales[7], sales[9])


temp <- vector()
for(i in 1:len){
  if(i <= 100){temp[i] = "TOP 100" 
  next}
  if(i <= 1000){temp[i] = "TOP 1000"
  next}
  if(i <= 2500){temp[i] = "TOP 2500"
  next}
  else {temp[i] = "more than 2500"}
}

sales$TOP <- temp

rm(i,len,temp)
