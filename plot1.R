# PLOT 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Preliminaries. Set working directory. Make sure it contains the two .rds files.
getwd()
setwd("C:/Users/Acer/Documents/DATA SCIENCE_DOST and COURSERA/Exploratory Data Analysis/Project 2")


## Download PM2.5 and classification coad data set into R  using the readRDS function.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
Agg_All_Sources <- aggregate(Emissions ~ year,NEI, sum)

# Generate a base plot in the working directory
png("plot1.png",width=600,height=600,units="px")

barplot(
  (Agg_All_Sources$Emissions)/10^3,
  names.arg=Agg_All_Sources$year,
  xlab="Year",
  ylab="PM2.5 Emissions (in '000 Tons)",
  main="Figure 1. Total PM2.5 emissions from all sources in the United States, 1999 - 2008.",
  col="blue",
  border=TRUE,
  space=0.5,
  axes=TRUE,
  axisnames=TRUE)

dev.off()

# End
