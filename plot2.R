#PLOT 2. #Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

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
png("plot2.png",width=600,height=600,units="px")

# Generate bar plot using PM2.5 emission data.
barplot((Agg_Baltimore_NEI$Emissions),
  names.arg=Agg_Baltimore_NEI$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Figure 2. Total PM2.5 emissions from all sources in Baltimore CIty, 1999 - 2008.",
  col="blue",
  border=TRUE,
  space=0.5,
  axes=TRUE,
  axisnames=TRUE
)

dev.off()

# End
