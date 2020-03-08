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

# print directly to console
storms %>% 
  # group storms data by the `type` variable
  group_by(type) %>%
  # calc mean wind speeed for each storm type
  summarise(mean_speed = mean(wind))

# store result...
storms_summary <- storms %>% 
  # group storms data by the `type` variable
  group_by(type) %>%
  # calc mean wind speeed for each storm type
  summarise(mean_speed = mean(wind))
# ...and then glimpse it
glimpse(storms_summary)

### Introduction to ggplot2 -------------------------------

## Exercise: Customising your plot

ggplot(iris, 
       aes(x = Petal.Width, y = Petal.Length)) + 
  geom_point(colour = "blue", size = 3, alpha = 0.5) + 
  labs(x = "Petal Width (cm)", y = "Petal Length (cm)")

## Exercise: Aesthetic mappings vs. arguments to geom_

ggplot(iris, 
       aes(x = Petal.Width, y = Petal.Length, colour = Species)) + 
  geom_point(colour = "blue", size = 3, alpha = 0.5) + 
  labs(x = "Petal Width", y = "Petal Length")

## Exercise: Using dplyr and ggplot2 together (part 1)

storms_summary <-
  storms %>% 
  group_by(name, type) %>%
  summarise(wind = mean(wind), pressure = mean(pressure))

## Exercise: Using dplyr and ggplot2 together (part 2)

ggplot(storms_summary, 
       aes(x = pressure, y = wind, col = type)) + 
  geom_point(alpha = 0.7) + 
  labs(x = "Mean pressure (mbar)", y = "Mean wind speed (mph)")

## Exercise: Using dplyr and ggplot2 together (part 3)

storms %>% 
  group_by(name, type) %>%
  summarise(wind = mean(wind), pressure = mean(pressure)) %>%
  ggplot(aes(x = pressure, y = wind, col = type)) + 
    geom_point(alpha = 0.7) + 
    labs(x = "Mean pressure (mbar)", 
         y = "Mean wind speed (mph)")


### Plotting distributions --------------------------

## Exercise: Plotting histograms

ggplot(iris, aes(x = Petal.Length / Petal.Width)) + 
  geom_histogram(binwidth=0.5) + 
  labs(x = "Petal Eccentricity", y = "Count") 

## Exercise: Tweaking a dot plot

# use filter to get just the setosa cases
setosa <- filter(iris, Species == "setosa")
# make the dot plot
ggplot(setosa, aes(x = Sepal.Length)) + 
  geom_dotplot(binwidth = 0.1) +
  scale_y_continuous(NULL, breaks = NULL) + # <- remove the y-axis
  theme_classic() # <- use the classic theme to remove gridlines


### Plotting continuous vs categorical --------------------

## Exercise: Box and whiskers plots

ggplot(storms, aes(x = type, y = wind)) + 
  geom_boxplot(fill= "lightgrey") + 
  labs(x = "Type of storm", y = "Wind Speed (mph)") + 
  theme_classic(base_size = 14)


### Saving plots ------------------------------------------

## Exercise: Saving plots

# make the plot 
ggplot(storms, aes(x = type, y = wind)) + 
  geom_boxplot() + 
  labs(x = "Type of storm", y = "Wind Speed")
# save it
ggsave("Windspeed_boxplot.pdf", height = 4, width = 4)


### Bar plots ---------------------------------------------

## Exercise: Making a barplot of means

# step 1 - use dplyr to calculate the means
wind.means <- 
  storms %>% group_by(year) %>% 
  summarise(mean= mean(wind))

# step 2 - make the plot
ggplot(wind.means, aes(x = factor(year), y = mean)) + 
  geom_col(fill="darkgrey") + 
  labs(x = "Year", y = "Wind speed (mph)") 


### Using multiple geoms ----------------------------------

## Exercise: Adding error bars to your plot

# step 1 - use dplyr to calculate the means / SEs
wind.means <- 
  storms %>% group_by(year) %>% 
  summarise(mean = mean(wind), 
            se = sd(wind)/sqrt(n()))

# step 2 - make the plot
ggplot(wind.means, aes(x = factor(year), y = mean, 
                       ymin = mean - se, ymax = mean + se)) + 
  geom_col(fill="darkgrey") + 
  geom_errorbar(width = 0.25) + 
  labs(x = "Year", y = "Wind speed (mph)")

### Extra practise ----------------------------------------

## Exercise: Putting it all together


