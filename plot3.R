# File: plot3.R
# name: Edgar M. Martinez Santana
# ExData_Plotting1
# Exploratory Data Analysis
# Johns Hopkins University
#Contructs the corresponding plot3.

library(data.table)
library(dplyr)
library(lubridate)

#Get Data
urlFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
pathFile <- getwd()
download.file(urlFile, file.path(pathFile, "DataSet.zip"))
unzip("DataSet.zip")

datat <- fread(file.path(getwd(), "household_power_consumption.txt")
               , na.strings = c("?") )
data <- datat %>% filter(between(strptime(Date,"%d/%m/%Y"),strptime('01/02/2007',"%d/%m/%Y")
                       ,strptime('02/02/2007',"%d/%m/%Y")))
# create date set
rm(datat)
data$DaTime <- as.POSIXct(paste(as.Date(data$Date, format="%d/%m/%Y"),data$Time))

dev.set(2)
dev.copy(png, file = "plot3.png", height=480, width=480)

#Plot3
with(data, {
        plot(Sub_metering_1~DaTime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
        lines(Sub_metering_2~DaTime, col='Red')
        lines(Sub_metering_3~DaTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=2, lwd=1
       ,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
      

dev.off()
rm(data)