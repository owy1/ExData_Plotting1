#load dates 2007-02-01 and 2007-02-02 from dataset: electric power consumption
# from UCI website
e_consume<-read.table("~/Desktop/household_power_consumption.txt",skip=grep("31/1/2007;23:59:00;0.326;0.126;242.800", readLines("~/Desktop/household_power_consumption.txt")), nrows=2880, sep=";")
names(e_consume) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# plot histogram global active power and copy to png format
hist(e_consume$Global_active_power,col="red", xlab="Global Active Power (kilowatts)",main=NULL)
dev.print(png,file="plot1.png",width=480,height=480)