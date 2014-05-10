
hhPowCon = read.csv("household_power_consumption.txt",sep=";",strip.white=TRUE);
isSubset <- hhPowCon$Date == '1/2/2007' | hhPowCon$Date == '2/2/2007'
subsetHhPowCon <- hhPowCon[isSubset,]
quartz();
hist(as.numeric(levels(subsetHhPowCon$Global_active_power))[subsetHhPowCon$Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file = "plot1.png")
dev.off()