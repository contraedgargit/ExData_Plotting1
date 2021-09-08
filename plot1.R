# File: plot1.R
# name: Edgar M. Martinez Santana
# ExData_Plotting1
# Exploratory Data Analysis
# Johns Hopkins University
#Contructs the corresponding plot1.

library(data.table)
library(dplyr)

urlFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
pathFile <- getwd()
download.file(urlFile, file.path(pathFile, "DataSet.zip"))
unzip("DataSet.zip")


datat <- fread(file.path(getwd(), "household_power_consumption.txt")
                        , na.strings = c("?") )
data <- filter(datat,between(strptime(Date,"%d/%m/%Y")
                              ,strptime('01/02/2007',"%d/%m/%Y")
                              ,strptime('02/02/2007',"%d/%m/%Y")))

rm(datat)

dev.set(2)
dev.copy(png, file = "plot1.png", height=480, width=480)

hist(data$Global_active_power, main= "Global Active Power"
     ,xlab = "Global Active Power (kilowatts)"
     , col = "red")

dev.off()
rm(data)




