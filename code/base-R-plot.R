# plotting biketown trip data with base R
install.packages("tidyverse")
library(tidyverse)
library(lubridate)

biketown <- read.csv("data/biketown-2018-trips/biketown-2018-trips.csv")
str(biketown)

summary(biketown)

#this is tidyverse
biketown$hour <- hms(biketown$StartTime) %>% hour()

#this does same result
stime <- hms(biketown$StartTime)
biketown$hour <- hour(stime)

table(biketown$hour)

freq_by_hour <- table(biketown$hour)
barplot(freq_by_hour)

# investigate start time by hourly bins
hist(biketown$hour, breaks=seq(0, 24, 2))

# focus on the AM peak
AM_peak <- subset(biketown, hour>=7 & hour<10)

barplot(table(AM_peak$hour))

