setwd("/Users/shashankgupta/Desktop/Traffic Project/")

train=read.csv("traffic_data.txt",header = F)

new <- do.call( rbind , strsplit( as.character( train$V1 ) , " " ) )

train=cbind( train , Time = new[,2] , Date = new[,1] )

train$Date=as.Date(train$Date,"%m/%d/%Y")
df <- data.frame(date = train$Date,
                 year = as.numeric(format(train$Date, format = "%Y")),
                 month = as.numeric(format(train$Date, format = "%m")),
                 day = as.numeric(format(train$Date, format = "%d")))

df$date<-NULL
df$Time=train$Time
df$Total_Vehicle=train$V2
