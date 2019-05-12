# Sets to my directory w/ the location of the dataset
setwd("C:\\Users\\Russell Snead\\Desktop\\Folder1\\exdata_data_household_power_consumption")

#Reads dataset
raw_data <- read.table("household_power_consumption.txt", header=TRUE,stringsAsFactors=FALSE,sep=";")

mod_data <- raw_data

mod_data[,1] <- as.Date(mod_data[,1], "%d/%m/%Y")

#Gets only relevant data
mod_data <- subset(mod_data, (Date>=as.Date("2007-02-01")))
mod_data <- subset(mod_data, (Date<=as.Date("2007-02-02")))

datetime_char <- paste(as.character(mod_data[,1]), mod_data[,2])
datetime <- strptime(datetime_char, format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(datetime, mod_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()