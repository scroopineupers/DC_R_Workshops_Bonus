library(dplyr)
library(ggplot2)

# read in intial dataset for project
surveys = read.csv('Optional lesson on dates, useful functions, and making functions/portal_clean.csv')

# convert separate date columns to a single column
full_dates = ISOdate(surveys$year, surveys$month, surveys$day, tz = Sys.timezone())

# remove time stamps from full_dates and appends data.frame with 'date' column
surveys$date = as.Date(full_dates)