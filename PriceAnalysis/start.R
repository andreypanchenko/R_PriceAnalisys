# Load librarys
library(dplyr)
library(ggplot2)
library(reshape)
library(openxlsx)
library(mgcv)

# Load functions
source("functions.R")
# Load Data
source("sales.R")
source("add_prices.R")


# Add info from "sales" in price table
prices_data <- merge(x = prices, y = sales, by.x = 'M_id', by.y = 'ID_M', all.x = TRUE)
prices_data_straight <- merge(x = prices_straight, y = sales, by.x = 'M_id', by.y = 'ID_M', all.x = TRUE)

### BOX PLOTS Built ###
prices_data_straight<-
  prices_data_straight%>%
  filter(MoneyCategory == "A")%>%
  filter(TOP == "1. TOP 100" | TOP == "2. TOP 1000")
source("box_plot.R")
### BOX PLOTS End ###

