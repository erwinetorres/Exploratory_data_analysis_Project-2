# PLOT 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Preliminaries. Set working directory. Make sure it contains the two .rds files.
setwd("C:/Users/Acer/Documents/DATA SCIENCE_DOST and COURSERA/Exploratory Data Analysis/Project 2")


## Download PM2.5 and classification coad data set into R  using the readRDS function.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
Agg_All_Sources <- aggregate(Emissions ~ year,NEI, sum)

# Generate a base plot in the working directory
png("plot4.png",width=600,height=500,units="px")

# Subset coal combustion-related emissions.
SCC_Coal <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI_Coal <- NEI[NEI$SCC %in% SCC_Coal$SCC, ]

# Generate staked bar chart showing coal combustion-related emissions. 
library(ggplot2)
ggplot(NEI_Coal, aes(x = factor(year), y = (Emissions/1000), fill =type)) + 
  geom_bar(stat= "identity", width = .5) + xlab("Year") +
  ylab("PM2.5 emissions (in '000 Tons)") +
  ggtitle("Figure 4. Total coal-related PM2.5 emissions in the United States, 1999 - 2008.")

dev.off()

# End
