# PLOT 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Preliminaries. Set working directory. Make sure it contains the two .rds files.
setwd("C:/Users/Acer/Documents/DATA SCIENCE_DOST and COURSERA/Exploratory Data Analysis/Project 2")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Generate a base plot in the working directory
png("plot5.png",width=600,height=500,units="px")

# Subset the data on emissions from motor vehicle sources in Baltimore City.
Baltimore_Motor <- subset(NEI, fips == "24510" & type=="ON-ROAD")
Baltimore_Motor_All <- aggregate(Baltimore_Motor[c("Emissions")], 
                            list(type = Baltimore_Motor$type, 
                            year = Baltimore_Motor$year, 
                            zip = Baltimore_Motor$fips),
                            sum)

# Generate line chart showing vehicle-related emissions in Baltimore City using qqplot2 plotting system.
library(ggplot2)
qplot(year, Emissions, data = Baltimore_Motor_All, geom= "line") + 
  theme_gray() + 
  ggtitle("Figure 5. Total motor vehicle-related PM25 emissions in Baltimore City, 1999-2008.") + 
  xlab("Year") + 
  ylab("PM25 emissions (Tons)")

dev.off()

# End
