
hhPowCon = read.csv("household_power_consumption.txt",sep=";",strip.white=TRUE);
isSubset <- hhPowCon$Date == '1/2/2007' | hhPowCon$Date == '2/2/2007'
subsetHhPowCon <- hhPowCon[isSubset,]
quartz();
par(mfrow=c(2,2));

x <- strptime(paste(subsetHhPowCon$Date,subsetHhPowCon$Time),"%d/%m/%Y %H:%M:%S");

sm <- subsetHhPowCon$Global_active_power;
y <- as.numeric(levels(sm))[sm];
plot(x, y, type="l", xlab="", ylab="Global Active Power");

sm <- subsetHhPowCon$Voltage;
y <- as.numeric(levels(sm))[sm];
plot(x, y, type="l", xlab="datetime", ylab="Voltage");

sm <- subsetHhPowCon$Sub_metering_1;
y1 <- as.numeric(levels(sm))[sm];
plot(x, y1, type="l", xlab="", ylab="Energy sub metering");
sm <- subsetHhPowCon$Sub_metering_2;
y2 <- as.numeric(levels(sm))[sm];
lines(x,y2, col="red");
lines(x,subsetHhPowCon$Sub_metering_3, col="blue");
legend("topright", lwd = 1, bty = "n", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3   "));

sm <- subsetHhPowCon$Global_reactive_power;
y <- as.numeric(levels(sm))[sm];
plot(x, y, type="l", xlab="datetime", ylab="Global_reactive_power") ;

dev.copy(png, file = "plot4.png")
dev.off()