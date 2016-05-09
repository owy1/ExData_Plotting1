#load dates 2007-02-01 and 2007-02-02 from dataset: electric power consumption
# from UCI website
e_consume<-read.table("~/Desktop/household_power_consumption.txt",skip=grep("31/1/2007;23:59:00;0.326;0.126;242.800", readLines("~/Desktop/household_power_consumption.txt")), nrows=2880, sep=";")
names(e_consume) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# four plots and copy to png format
datetime <- strptime(paste(e_consume$Date,e_consume$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
plot(datetime,e_consume$Global_active_power,xlab="",ylab="Global Active Power", main=NULL, type = "l")
plot(datetime,e_consume$Voltage,xlab="datetime",ylab="Voltage", main=NULL, type = "l")
plot(datetime, e_consume$Sub_metering_1, xlab="", ylab="Energy sub metering",main=NULL, type = "l")
lines(datetime, e_consume$Sub_metering_2, xlab="", ylab="",main=NULL, type = "l",col="red")
lines(datetime, e_consume$Sub_metering_3, xlab="", ylab="",main=NULL, type = "l",col="blue")
legend("topright", lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8, box.lty=0)
plot(datetime,e_consume$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power", main=NULL, type = "l")
dev.print(png,file="plot4.png",width=480,height=480)