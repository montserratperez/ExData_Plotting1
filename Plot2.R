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

with(Test, plot(DateTime, Global_active_power, type="l", xlab="",
                ylab = "Global Active Power (kilowatts)"))

#to call up the line plot

dev.copy(png, "plot2", width =480, height = 480)

#to print the plot to png format

dev.off()
# to close png device