library(dplyr)
library(ggplot2)

# read in intial dataset for project
surveys = read.csv('Optional lesson on dates, useful functions, and making functions/portal_clean.csv')

# convert separate date columns to a single column
full_dates = ISOdate(surveys$year, surveys$month, surveys$day, tz = Sys.timezone())

# remove time stamps from full_dates and appends data.frame with 'date' column
surveys$date = as.Date(full_dates)

# now to start some ggplots...
ggplot(surveys, aes(x=date, y=weight)) +
  geom_line()
  # maybe a line graph isn't the best...

# let's try out a scatterpot
ggplot(surveys, aes(x=date, y=weight)) +
  geom_point()
  # that looks better, but you can do even better

# color the scatterplot points by date
ggplot(surveys, aes(x=date, y=weight)) +
  geom_point(aes(color=date))
  # not too shabby, still kind of unintelligable

# see what coloring scatterplot by species_id does
ggplot(surveys, aes(x=date, y=weight)) +
  geom_point(aes(color=species_id))
  # this one turned out to be surprisngly useful