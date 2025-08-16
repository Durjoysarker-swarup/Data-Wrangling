#Key points
#After importing data, a common next step is to reshape the data into a form useful for the rest of the analysis by tidying it. The tidyr package includes several useful functions for tidying data.
#The pivot_longer() function converts wide data into tidy data.
#The first argument of pivot_longer() is the data frame to be reshaped. The second argument specifies the columns containing the values to be moved into a single column.
#The new column of values is called value by default and the column containing the original names of those columns is called name by default.
#The values_to and names_to arguments can be used to change the default names of these columns.

library(tidyverse)
library(dslabs)

path <- system.file("extdata", package= "dslabs")
list.files(path)
filename <- file.path(path, "fertility-two-countries-example.csv" )
wide_data <- read_csv(filename)

#just snippet of the wide data
wide_data %>% select(country, `1960`:`1965`)

#pivot the column into one column
wide_data %>% pivot_longer(`1960`:`2015`)

#another way of doing this
wide_data%>% pivot_longer(-country)
#here you tell without the country all will be changed

#change the default column name
new_tidy_data <- wide_data %>%
  pivot_longer(-country, names_to = "year", values_to = "fertility rate")
new_tidy_data

class(new_tidy_data$year)

#use the name_transform argument to change the class of the year as value to numeric
new_tidy_data <- wide_data %>% 
  pivot_longer(-country, names_to = "year", values_to = "fertility rate", names_transform = list(year=as.numeric))
new_tidy_data


#ploting the data
new_tidy_data %>% ggplot(aes(year, `fertility rate`, color=country)) +
  geom_point()

###longer to wider
#pivot_wider(names_from = year, values_from = fertility):
#Looks at year → finds 1960, 1961, etc. → makes them new column headers.
#Looks at fertility → puts those numbers into the correct country/year cell.
#All other columns not mentioned (country) → treated as row identifiers.

new_wide_data <- new_tidy_data %>% 
  pivot_wider(names_from = year, values_from = `fertility rate`)
new_wide_data


##separate
#import data
path <- system.file("extdata", package = "dslabs")
fname <-  "life-expectancy-and-fertility-two-countries-example.csv"
filename <- file.path(path, fname)

raw_data <- read.csv(filename)
select(raw_data, 1:4)

#pivot all column expect country
dat <- raw_data %>% pivot_longer(-country)
dat

#separate on underscore
dat %>% separate(name, c("year", "name"), sep="_")

# separate on underscores (the default), convert years to numeric
dat %>%  separate(name, c("year", "name"), sep = "_") %>%
  mutate(year = as.integer(str_remove(year, "^X")))

# split on all underscores, pad empty cells with NA
dat %>% separate(name, c("year", "name_1", "name_2"), 
                 fill = "right", convert = TRUE)


# split on first underscore but keep life_expectancy merged
dat %>% separate(name, c("year", "name"), sep = "_", 
                 extra = "merge", convert = TRUE)

# separate then create a new column for each variable using pivot_wider
dat %>% separate(name, c("year", "name"), sep = "_", 
                 extra = "merge", convert = TRUE) %>%
  pivot_wider()


# if we had used this non-optimal approach to separate
dat %>% 
  separate(name, c("year", "name_1", "name_2"), 
           fill = "right", convert = TRUE)

# we could unite the second and third columns using unite()
dat %>% 
  separate(name, c("year", "name_1", "name_2"), 
           fill = "right", convert = TRUE) %>%
  unite(variable_name, name_1, name_2, sep="_")

# spread the columns
dat %>% 
  separate(name, c("year", "name_1", "name_2"), 
           fill = "right", convert = TRUE) %>%
  unite(name, name_1, name_2, sep="_") %>%
  spread(name, value) %>%
  rename(fertlity = fertility_NA)




