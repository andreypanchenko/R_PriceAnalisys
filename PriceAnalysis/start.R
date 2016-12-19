# Load librarys
library(dplyr)
library(ggplot2)
library(reshape)

# Load functions
source("add_prices.R")

# START

main_t <- 
  prices %>%
  group_by(PriceGroup)%>%
  summarise('MarketShare' = sum(MarketShareUAH * 100)
            ,n_distinct(M_ID)
            ,'Sale' = sum(UAH, na.rm = TRUE)
            ,min(AVG_PRICE)
            ,max(AVG_PRICE))

attach(main_t)  

barplot(MarketShare)


  