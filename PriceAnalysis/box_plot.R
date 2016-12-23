# START ANALYSIS

# 1 group
analytic_data<-
  prices_data_straight%>%
  filter(PriceGroup == levels(PriceGroup)[1])
attach(analytic_data)
p1<- qplot(PriceGroup
           , Price
           , data = analytic_data
           , fill = DISTR
           , geom = c("boxplot", "jitter"))


ggplot(data = analytic_data, aes(PriceGroup, Price, color = DISTR)) +
  geom_boxplot()
  

# 2 group
analytic_data<-
  prices_data_straight%>%
  filter(PriceGroup == levels(PriceGroup)[2])
attach(analytic_data)
p2<- qplot(PriceGroup
           , Price
           , data = analytic_data
           , fill = DISTR
           , geom = c("boxplot", "jitter"))

# 3 group
analytic_data<-
  prices_data_straight%>%
  filter(PriceGroup == levels(PriceGroup)[3])
attach(analytic_data)
p3<- qplot(PriceGroup
           , Price
           , data = analytic_data
           , fill = DISTR
           , geom = c("boxplot", "jitter"))

# 4 group
analytic_data<-
  prices_data_straight%>%
  filter(PriceGroup == levels(PriceGroup)[4])
attach(analytic_data)
p4<- qplot(PriceGroup
           , Price
           , data = analytic_data
           , fill = DISTR
           , geom = c("boxplot", "jitter"))

# 5 group
analytic_data<-
  prices_data_straight%>%
  filter(PriceGroup == levels(PriceGroup)[5])
attach(analytic_data)
p5<- qplot(PriceGroup
           , Price
           , data = analytic_data
           , fill = DISTR
           , geom = c("boxplot", "jitter"))

# 6 group
analytic_data<-
  prices_data_straight%>%
  filter(PriceGroup == levels(PriceGroup)[6])
attach(analytic_data)
p6<- qplot(PriceGroup
           , Price
           , data = analytic_data
           , fill = DISTR
           , geom = c("boxplot", "jitter"))

# 7 group
analytic_data<-
  prices_data_straight%>%
  filter(PriceGroup == levels(PriceGroup)[7])
attach(analytic_data)
p7<- qplot(PriceGroup
           , Price
           , data = analytic_data
           , fill = DISTR
           , geom = c("boxplot", "jitter"))


multiplot(p2, p3, p4, p5, p6, p7, cols = 3)
