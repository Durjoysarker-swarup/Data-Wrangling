list.files()
library(tidyverse)

#The values are separated by commas → fits read_csv() (default for comma-separated values in readr).
#read_csv2() is for semicolon-separated files (common in some European locales) → not the case here.
#read_tsv() is for tab-separated files → not the case.
#read_table() assumes whitespace-separated data → not the case.
data <- read_csv("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data", col_names = FALSE)
data
#col_names = TRUE → R assumes the first row contains column headers (default behavior).
#col_names = FALSE → R treats the first row as data, and will automatically name columns as X1, X2, X3, etc.