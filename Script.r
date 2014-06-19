setwd("C:/")
library(ggplot2)
library(reshape2)
URL<-"https://www.dropbox.com/s/ro1nduc8ahckwsm/Book1.csv"
Temp<- read.csv(URL, header=TRUE)


####Baseline (1951-1980)
t<- ggplot(data=Temp, aes(x=Year, y=J.D,)) + geom_line() + geom_point() + geom_smooth() 
t1<- t+ ggtitle("Deviation from Average EARTH Temperature (Baseline period 1951-1980)") + xlab("Year") + ylab("Temperature in  in 1/100th Centigrade")

ggsave(t1, file="1951-1980.jpeg", width=18, height=12) 

####Baseline (1880-2014)
Temp_all <- read.csv("Book1.csv", header=TRUE)
Temp_all <-(Temp/100)+14
mean <- mean(Temp_all$J.D,na.rm=TRUE)
Temp_all <- (Temp_all-mean)*100



t2<- ggplot(data=Temp_all, aes(x=Temp$Year, y=Temp_all$J.D,)) + geom_line() + geom_point() + geom_smooth()  
t3<- t2+ ggtitle("Deviation from Average EARTH Temperature (Baseline period 1880-2014)") + xlab("Year") + ylab("Temperature in  in 1/100th Centigrade")
ggsave(t3, file="1880-2014.jpeg", width=18, height=12) 



####Verification:
Verification<-Temp_all$J.D-Temp$J.D
Verification

###File###
