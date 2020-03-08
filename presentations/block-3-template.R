# !!! REMEMBER TO SET YOUR WORKING DIRECTORY !!!

### Setting up --------------------------------------------

library(readr) # for reading in data
library(dplyr) # for data manipulation

# read the storms data into R from a CSV file
storms <- read_csv("CENTRAL_AMERICA_STORMS.CSV")

# convert built in `iris` data frame to a tibble
iris <- as_tibble(iris)
# (OPTIONAL - but makes the printing nicer)

# remind ourselves what is inside iris and storms
glimpse(iris)
glimpse(storms)

### Using the pipe: `%>%` ---------------------------------

## Exercise: Using group_by to calculate group specific 
## summaries


### Introduction to ggplot2 -------------------------------

## Exercise: Customising your plot

## Exercise: Aesthetic mappings vs. arguments to geom_

## Exercise: Using dplyr and ggplot2 together (part 1)

## Exercise: Using dplyr and ggplot2 together (part 2)

## Exercise: Using dplyr and ggplot2 together (part 3)


### Plotting distributions --------------------------------

## Exercise: Plotting histograms

## Exercise: Tweaking a dot plot


### Plotting continuous vs categorical --------------------

## Exercise: Box and whiskers plots


### Saving plots ------------------------------------------

## Exercise: Saving plots


### Bar plots ---------------------------------------------

## Exercise: Making a barplot of means


### Using multiple geoms - bar plots with error bars ------

## Exercise: Adding error bars to your plot


### Extra practise ----------------------------------------

## Exercise: Putting it all together


