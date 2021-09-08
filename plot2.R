# File: plot2.R
# name: Edgar M. Martinez Santana
# ExData_Plotting1
# Exploratory Data Analysis
# Johns Hopkins University
#Contructs the corresponding plot2.

library(data.table)
library(dplyr)
library(lubridate)

urlFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
pathFile <- getwd()
download.file(urlFile, file.path(pathFile, "DataSet.zip"))
unzip("DataSet.zip")

datat <- fread(file.path(getwd(), "household_power_consumption.txt")
               , na.strings = c("?") )
data <- datat %>% select(Date, Time, Global_active_power)%>%
        filter(between(strptime(Date,"%d/%m/%Y"),strptime('01/02/2007',"%d/%m/%Y")
                                   ,strptime('02/02/2007',"%d/%m/%Y")))
# create date set
rm(datat)
data$DaTime <- as.POSIXct(paste(as.Date(data$Date, format="%d/%m/%Y"),data$Time))

dev.set(2)
dev.copy(png, file = "plot2.png", height=480, width=480)

#Plot2
plot(data$Global_active_power~data$DaTime, type="l"
     , ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
rm(data)