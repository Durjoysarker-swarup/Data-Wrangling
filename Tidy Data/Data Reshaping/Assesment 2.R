library(dslabs)
library(tidyverse)
co2
#question 11: Tidy data has a different variable in each column, but here the month variable is spread across the columns.

#question 12:
co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

co2_tidy <- pivot_longer(co2_wide, -year, names_to = "month", values_to = "co2")

#question 13 about to see the plot and answer
co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()

#question 14:

library(dslabs)
data(admissions)
admissions
dat <- admissions %>% select(-applicants)
dat_tidy <- pivot_wider(dat, names_from = gender, values_from = admitted)

#question 15:
tmp <- admissions %>%
  pivot_longer(cols = c(admitted, applicants), names_to = "key", values_to = "value")
tmp

tmp2 <- unite(tmp, column_name, c(key, gender))
tmp2


