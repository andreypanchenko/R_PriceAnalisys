sales <- read.csv2("~/R/PriceAnalysis/data_prices/sales_market.csv")

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




