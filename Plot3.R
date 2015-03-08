hpc <- read.csv("householdpowerconsumption.txt", sep = ";", header = TRUE,
                na.strings ="?", stringsAsFactors=F) #to read the file

hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S") 

#to merge date and time columns and convert them to posixlt format


myfunc <- function (x, y){
        hpc[hpc$DateTime >= x & hpc$DateTime <= y,  ]
        
}
# to be able to subset data frame by date range

Test <-myfunc ("2007-02-01 00:00:00", "2007-02-02 23:59:59 ")

# to subset data frame by given dates


with(Test, plot(x= DateTime, y=Sub_metering_1,
               type="l", xlab = "", ylab = "Energy sub metering", col="black")) 

                points(x=Test$DateTime, y=Test$Sub_metering_2, col="red", type="l")
                points(x=Test$DateTime, y=Test$Sub_metering_3, col="blue", type="l")
                legend("topright",legend=c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                       col=c("black", "red", "blue"), lty=1)
        

#to call up the line plot with the 3 data series and the top right legend

dev.copy(png, "plot3.png", width =480, height = 480)

#to print the plot to png format

dev.off()
# to close png device


