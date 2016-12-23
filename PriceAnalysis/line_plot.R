analytic_data_bar <- 
  prices_data_straight%>%
#  filter(PriceGroup == levels(PriceGroup)[2])%>%
#  filter(between(AVG_PRICE,10,20))%>% 
#  filter(DISTR == "BADM" | DISTR == "OPTIMA")%>%
#  filter(M_id == 46912)%>%
  filter(TOP == "1. TOP 100" | TOP == "2. TOP 1000")%>%
  filter(MoneyCategory == "A")



# PriceGroup 1
p <- 1
analytic_data_bar_temp <- 
  analytic_data_bar%>%
  filter(PriceGroup == levels(PriceGroup)[p])
attach(analytic_data_bar_temp)
bp1 <- ggplot(data = analytic_data_bar_temp
       , aes(x = Rank_in_Market
       , y = Price
       , color = DISTR)
       ) +
  geom_point(shape=1) + 
  geom_smooth() +
  ggtitle(paste("PriceGroup:", levels(PriceGroup)[p]))


# PriceGroup 2
p <- 2
analytic_data_bar_temp <- 
  analytic_data_bar%>%
  filter(PriceGroup == levels(PriceGroup)[p])
attach(analytic_data_bar_temp)
bp2 <- ggplot(data = analytic_data_bar_temp
       , aes(x = Rank_in_Market
             , y = Price
             , color = DISTR)
) +
  geom_point(shape=1) + 
  geom_smooth() +
  ggtitle(paste("PriceGroup:", levels(PriceGroup)[p]))


# PriceGroup 3
p <- 3
analytic_data_bar_temp <- 
  analytic_data_bar%>%
  filter(PriceGroup == levels(PriceGroup)[p])
attach(analytic_data_bar_temp)
bp3 <- ggplot(data = analytic_data_bar_temp
       , aes(x = Rank_in_Market
             , y = Price
             , color = DISTR)
) +
  geom_point(shape=1) + 
  geom_smooth() +
  ggtitle(paste("PriceGroup:", levels(PriceGroup)[p]))
 

# PriceGroup 4
p <- 4
analytic_data_bar_temp <- 
  analytic_data_bar%>%
  filter(PriceGroup == levels(PriceGroup)[p])
attach(analytic_data_bar_temp)
bp4 <- ggplot(data = analytic_data_bar_temp
       , aes(x = Rank_in_Market
             , y = Price
             , color = DISTR)
) +
  geom_point(shape=1) + 
  geom_smooth() +
  ggtitle(paste("PriceGroup:", levels(PriceGroup)[p]))


# PriceGroup 5
p <- 5
analytic_data_bar_temp <- 
  analytic_data_bar%>%
  filter(PriceGroup == levels(PriceGroup)[p])
attach(analytic_data_bar_temp)
bp5 <- ggplot(data = analytic_data_bar_temp
       , aes(x = Rank_in_Market
             , y = Price
             , color = DISTR)
) +
  geom_point(shape=1) + 
  geom_smooth() +
  ggtitle(paste("PriceGroup:", levels(PriceGroup)[p]))


# PriceGroup 6
p <- 6
analytic_data_bar_temp <- 
  analytic_data_bar%>%
  filter(PriceGroup == levels(PriceGroup)[p])
attach(analytic_data_bar_temp)
bp6 <- ggplot(data = analytic_data_bar_temp
       , aes(x = Rank_in_Market
             , y = Price
             , color = DISTR)
) +
  geom_point(shape=1) + 
  geom_smooth() +
  ggtitle(paste("PriceGroup:", levels(PriceGroup)[p]))


# PriceGroup 7
p <- 7
analytic_data_bar_temp <- 
  analytic_data_bar%>%
  filter(PriceGroup == levels(PriceGroup)[p])
attach(analytic_data_bar_temp)
bp7 <- ggplot(data = analytic_data_bar_temp
       , aes(x = Rank_in_Market
             , y = Price
             , color = DISTR)
) +
  geom_point(shape=1) + 
  geom_smooth() +
  ggtitle(paste("PriceGroup:", levels(PriceGroup)[p]))


# PriceGroup 8
p <- 8
analytic_data_bar_temp <- 
  analytic_data_bar%>%
  filter(PriceGroup == levels(PriceGroup)[p])
attach(analytic_data_bar_temp)
bp8 <- ggplot(data = analytic_data_bar_temp
       , aes(x = Rank_in_Market
             , y = Price
             , color = DISTR)
) +
  geom_point(shape=1) + 
  geom_smooth() +
  ggtitle(paste("PriceGroup:", levels(PriceGroup)[p]))

multiplot(bp2, p2, bp3, p3, bp4, p4, cols = 3)
multiplot(bp1, bp2, bp3, bp4, bp5, bp6, bp7, bp8, cols = 4)

