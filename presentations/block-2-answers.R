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

# select from `storms` the `lat` and `long` variables and 
# rename these to `latitude` and `longitude`
storms_renamed <- select(storms, 
                         latitude = lat, 
                         longitude = long)
# check the result with `glimpse`
glimpse(storms_renamed)


### Using `mutate` ----------------------------------------

## Exercise: Making a new variable

# mutate `iris` to add a new variable (new column) called 
# `Petal.Area` (= `Petal.Length * Petal.Width`)
iris_area <- mutate(iris, 
                    Petal.Area = Petal.Length * Petal.Width)
# check the result with `glimpse`
glimpse(iris_area)

## Exercise: Making several new variables

# mutate `iris` to add three new variables: `Sepal.Area`, 
# `Petal.Area` (as before) and `PS.Area.Ratio` (their ratio)
iris_ratio <- mutate(iris, 
                     Sepal.Area = Sepal.Length * Sepal.Width,
                     Petal.Area = Petal.Length * Petal.Width,
                     PS.Area.Ratio = Petal.Area / Sepal.Area)
# check the result with `glimpse`
glimpse(iris_ratio)


### Using `filter` ----------------------------------------

## Exercise: Subsetting observations on one variable

# filter `storms` to obtain just the observations (rows)
# associated with hurricanes
filter(storms, type == "Hurricane")
# note: this time we just printed the result - we did not 
# capture it by giving it a name

## Exercise: Subsetting observations on more than one 
## variable

# filter `storms` to obtain the observations associated 
# with hurricanes taking place in 1997 or later
filter(storms, 
       type == "Hurricane", year >= 1997) 


### Using `arrange` ---------------------------------------

## Exercise: Reording observations

# arrange `storms` to order observations by `pressure`
storm_sort <- arrange(storms, pressure)
# check the result with `View`
View(storm_sort)

### Using `summarise` ------------------------------------- 

## Exercise: Calculating the mean of two variables

# summarise `iris` by calculating the mean sepal length and 
# the mean petal length
summarise(iris, 
          mean_sl = mean(Sepal.Length), 
          mean_sw = mean(Sepal.Width))

## Exercise: Calculating a more complex summary of a 
## variable

# summarise `iris` by calculating the mean sepal area
summarise(iris, 
          mean_sl = mean(Sepal.Length * Sepal.Width))


### Using `group_by` -------------------------------------- 

## Exercise: Calculating group-specific means 

# summarise mean wind speed for each storm type
# 1. make a grouped tibble
storms_grouped <- group_by(storms, type)
# 2. use summarise on the grouped data
summarise(storms_grouped, mean_wind = mean(wind))

## Exercise: Using `group_by` to group and summarise by 
## more than one variable 

# summarise mean wind speed for each storm type
# 1. make a grouped tibble - grouped by 2 variables
storms_grouped <- group_by(storms, year, month)
# 2. use summarise on the grouped data
summarise(storms_grouped, 
          mean_speed = mean(wind), max_speed = max(wind))

## Exercise: Using group_by and mutate 

# calc mean-centred sepal length for each species
# 1. group iris by species identity
iris_grouped <- group_by(iris, Species)
# 2. use mutate on the grouped data
mutate(iris_grouped, 
       sl_centred = Sepal.Length - mean(Sepal.Length))

