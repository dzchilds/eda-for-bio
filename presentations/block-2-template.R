# !!! REMEMBER TO SET YOUR WORKING DIRECTORY !!!

### Setting up --------------------------------------------

library(readr) # for reading in data
library(dplyr) # for data manipulation

# read the storms data into R from a CSV file
storms <- read_csv("CENTRAL_AMERICA_STORMS.CSV")

# convert built in `iris` data frame to a tibble
iris <- as_tibble(iris)
# (OPTIONAL - but makes the printing nicer)

# take a look at the storms data with `View`...
View(storms)
# ... or use `glimpse` function from dplyr package
glimpse(storms)


### Using `select` ----------------------------------------

## Exercise: Selecting two variables

# select from `storms` the `name` and `year` variables
storms_simple <- select(storms, name, year)
# check the result with `glimpse`
glimpse(storms_simple)

## Exercise: Selecting a range of variables

# select from `storms` all variable from `name` to `month`
storms_fewer <- select(storms, name:month)
# check the result with `glimpse`
glimpse(storms_fewer)

## Exercise: Using select with helper functions

# select from `storms` all variable from `name` to `month`
storms_fewer <- select(storms, starts_with("l"))
# check the result with `glimpse`
glimpse(storms_fewer)
# note: we overwrote the `storms_fewer` we previously made

## Exercise: Renaming


### Using `mutate` ----------------------------------------

## Exercise: Making a new variable

## Exercise: Making several new variables


### Using `filter` ----------------------------------------

## Exercise: Subsetting observations on one variable

## Exercise: Subsetting observations on more than one 
## variable


### Using `arrange` ---------------------------------------

## Exercise: Reording observations


### Using `summarise` ------------------------------------- 

## Exercise: Calculating the mean of two variables

## Exercise: Calculating a more complex summary of a 
## variable


### Using `group_by` -------------------------------------- 

## Exercise: Calculating group-specific means 

## Exercise: Using `group_by` to group by more than one 
## variable 

## Exercise: Using group_by and mutate 


