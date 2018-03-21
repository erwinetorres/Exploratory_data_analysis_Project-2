# PLOT 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

## Preliminaries. Set working directory. Make sure it contains the two .rds files.
getwd()
setwd("C:/Users/Acer/Documents/DATA SCIENCE_DOST and COURSERA/Exploratory Data Analysis/Project 2")


## Download PM2.5 and classification coad data set into R  using the readRDS function.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Subset emissions of Baltimore City and aggregate the sum by year
Baltimore_NEI <- NEI[NEI$fips=="24510",]
Agg_Baltimore_NEI <- aggregate(Emissions ~ year, Baltimore_NEI,sum)


# Generate a base plot in the working directory
png("plot3.png",width=600,height=500,units="px")


# Subset emissions of Baltimore City by type of emission.
Baltimore_Source <- aggregate(Baltimore_NEI[c("Emissions")], 
                              list(type = Baltimore_NEI$type, year = Baltimore_NEI$year), sum)

# Generate line graph using the ggplot2 plotting syistem.
library(ggplot2)
qplot(year, Emissions, data = Baltimore_Source, 
  color = type, geom= "line")+ 
  ggtitle("Figure 3. Total PM2.5 emissions in Baltimore City by source, 1999 - 2008.") + 
  xlab("Year") + ylab("PM2.5 emissions (Tons)")

dev.off()

# End
