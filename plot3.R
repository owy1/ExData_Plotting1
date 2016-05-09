#load dates 2007-02-01 and 2007-02-02 from dataset: electric power consumption
# from UCI website
e_consume<-read.table("~/Desktop/household_power_consumption.txt",skip=grep("31/1/2007;23:59:00;0.326;0.126;242.800", readLines("~/Desktop/household_power_consumption.txt")), nrows=2880, sep=";")
names(e_consume) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# plot energy meters vs. datetime and copy to png format
datetime <- strptime(paste(e_consume$Date,e_consume$Time), "%d/%m/%Y %H:%M:%S")
plot(datetime, e_consume$Sub_metering_1, xlab="", ylab="Energy sub metering",main=NULL, type = "l")
lines(datetime, e_consume$Sub_metering_2, xlab="", ylab="",main=NULL, type = "l",col="red")
lines(datetime, e_consume$Sub_metering_3, xlab="", ylab="",main=NULL, type = "l",col="blue")
legend("topright", lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8)
dev.print(png,file="plot3.png",width=480,height=480)