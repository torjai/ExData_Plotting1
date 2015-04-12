# Exploratory data analysis - Course project 1 - Plot 2

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

## creating plot2.png
library(datasets)
windows()
Sys.setlocale("LC_TIME", "English")
with(data, plot(Time,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n"))
with(data, lines(Time,Global_active_power))
dev.copy(png,file="plot2.png")
dev.off()
