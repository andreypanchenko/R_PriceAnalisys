# Load librarys
library(dplyr)
library(ggplot2)
library(reshape)
library(openxlsx)

# Load functions
source("functions.R")

# Load Data
source("add_prices.R")
source("sales.R")

# Add info from "sales" in price table
prices_data <- merge(x = prices, y = sales, by.x = 'M_id', by.y = 'ID_M', all.x = TRUE)

prices_data <-
  prices_data%>%
  filter(MoneyCategory == "A")%>%
  filter(between(AVG_PRICE, 50, 400))



# START ANALYSIS
attach(prices_data)
p1<- qplot(PriceGroup
      , DISTR.1
      , data = prices_data
      , fill = PriceGroup
      , geom = c("boxplot", "jitter"))

p2<- qplot(PriceGroup
           , DISTR.2
           , data = prices_data
           , fill = PriceGroup
           , geom = c("boxplot", "jitter"))

p3<- qplot(PriceGroup
           , DISTR.3
           , data = prices_data
           , fill = PriceGroup
           , geom = c("boxplot", "jitter"))

p4<- qplot(PriceGroup
           , DISTR.4
           , data = prices_data
           , fill = PriceGroup
           , geom = c("boxplot", "jitter"))

mp <- multiplot(p1, p2, p3, p4, cols = 2)
