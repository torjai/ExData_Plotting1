# Exploratory data analysis - Course project 1 - Plot 1

## It is assumed that 'exdata_data_household_power_consumption.zip' has been downloaded 
## into the working directory 
unzip('exdata_data_household_power_consumption.zip')

## reading the Date column only
data = read.table('household_power_consumption.txt',header=T,sep=";",na.strings="?",
                  stringsAsFactors=F)[,1]
## getting row indexes that belong to the required dates
ind = which(data=="1/2/2007" | data=="2/2/2007")
## reading rows with the required dates
data = read.table('household_power_consumption.txt',header=T,sep=";",na.strings="?",
                  stringsAsFactors=F)[ind,]

## converting Date and Time columns into Date/Time format
data$Time = strptime(paste(data$Date,data$Time), "%e/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, "%e/%m/%Y")
head(data)

## creating plot1.png
library(datasets)
png(file="plot1.png",bg="white")
hist(data$Global_active_power, col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
