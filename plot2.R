
hhPowCon = read.csv("household_power_consumption.txt",sep=";",strip.white=TRUE);
isSubset <- hhPowCon$Date == '1/2/2007' | hhPowCon$Date == '2/2/2007'
subsetHhPowCon <- hhPowCon[isSubset,]
quartz();
y <- as.numeric(levels(subsetHhPowCon$Global_active_power))[subsetHhPowCon$Global_active_power];
x <- strptime(paste(subsetHhPowCon$Date,subsetHhPowCon$Time),"%d/%m/%Y %H:%M:%S")
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

dev.copy(png, file = "plot2.png")
dev.off()