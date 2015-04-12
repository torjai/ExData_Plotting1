# Exploratory data analysis - Course project 1 - Plot 3

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

## creating plot3.png
library(datasets)
png(file="plot3.png")
Sys.setlocale("LC_TIME", "English")
MaxSubMetering = with(data, pmax(Sub_metering_1,Sub_metering_2,Sub_metering_3))
with(data, plot(Time,MaxSubMetering,xlab="",ylab="Energy sub metering",bg="white",type="n"))
with(data, lines(Time,Sub_metering_1))
with(data, lines(Time,Sub_metering_2, col="red"))
with(data, lines(Time,Sub_metering_3, col="blue"))
legend("topright", col=c("black","blue","red"),lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
