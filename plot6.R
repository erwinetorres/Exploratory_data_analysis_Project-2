# PLOT 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Preliminaries. Set working directory. Make sure it contains the two .rds files.
setwd("C:/Users/Acer/Documents/DATA SCIENCE_DOST and COURSERA/Exploratory Data Analysis/Project 2")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Generate a base plot in the working directory
png("plot6.png",width=1000,height=500,units="px")

# Subset the data on emissions from motor vehicle sources in Baltimore City and Los Angeles Country.
Baltimore_Motor <- subset(NEI, fips == "24510" & type=="ON-ROAD")
Baltimore_Motor_All <- aggregate(Baltimore_Motor[c("Emissions")], 
                        list(type = Baltimore_Motor$type, 
                        year = Baltimore_Motor$year, 
                        zip = Baltimore_Motor$fips),sum)
Los_Angeles_Motor <- subset(NEI, fips == "06037" & type=="ON-ROAD")
Los_Angeles_Motor_All <- aggregate(Los_Angeles_Motor[c("Emissions")], 
                        list(type = Los_Angeles_Motor$type, 
                        year = Los_Angeles_Motor$year, 
                        zip = Los_Angeles_Motor$fips),sum)
Motor_Baltimore_Los_Angeles <- rbind(Baltimore_Motor_All, Los_Angeles_Motor_All)


## Generate line graph showing emission of Baltimore city and Los Angeles country.
library(ggplot2)
qplot(year, Emissions, data = Motor_Baltimore_Los_Angeles, color = zip, 
      geom= "line", ylim = c(0, 5000)) + 
      ggtitle("Figure 6. Total PM25 emissions from motor vehicles in Baltimore City, Maryland (24510) and Los Angeles Country, California (06037), 1999 - 2008.") + 
      xlab("Year") + ylab("PM25 emissions (Tons)")      

dev.off()

#### END ####
