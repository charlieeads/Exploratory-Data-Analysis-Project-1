
#Exploratory Data Analysis Project #1
getwd()

#reading in the data into a variable
GApower <- read.table("household_power_consumption.txt", skip = 1, sep = ";")

head(GApower)

#naming the columns based on the info on project page
names(GApower) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
            "Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

GApower2 <- subset(GApower, GApower$Date == "1/2/2007" | GApower$Date == "2/2/2017")

#plotting a histogram and naming the title, columns and also choosing a color
hist((GApower2$Global_active_power), col = "red", main = "Global Active Power",
                xlab = "Global Active Power(kilowatts)", ylab = "Frequency")

#Copy to png file to desktop
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
