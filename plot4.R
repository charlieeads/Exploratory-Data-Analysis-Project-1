

#Exploratory Data Analysis Project #1
getwd()

#reading in the data into a variable
GApower <- read.table("household_power_consumption.txt", skip = 1, sep = ";")

head(GApower)
     
#naming the columns based on the info on project page
names(GApower) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                         "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
     
GApower2 <- subset(GApower, GApower$Date == "1/2/2007" | GApower$Date == "2/2/2017")
     
#converting the date in the file using the as.Date and strptime functions
GApower2$Date<- as.Date(GApower2$Date, format = "%d/%m/%Y")
     
GApower2$Time <- strptime(GApower2$Time, format="%H:%M:%S")
     
#rows 1:1440 are 2007-02-01
GApower2[1:1440,"Time"] <- format(GApower2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
     
#rows 1441:2880 are 2007-02-01
GApower2[1441:2880,"Time"] <- format(GApower2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#This will help me create the 4 graphs on one plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


with(GApower2,{
    plot(GApower2$Time,as.numeric(as.character(GApower2$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
    plot(GApower2$Time,as.numeric(as.character(GApower2$Voltage)), type="l",xlab="datetime",ylab="Voltage")
    plot(GApower2$Time,GApower2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    with(GApower2,lines(Time,(Sub_metering_1), col = "black"))
    with(GApower2,lines(Time,(Sub_metering_2), col="red"))
    with(GApower2,lines(Time,(Sub_metering_3), col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = .4)
    plot(GApower2$Time,as.numeric(as.character(GApower2$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#Copy to png file to desktop
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


     