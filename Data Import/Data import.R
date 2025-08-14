getwd()

library(dslabs)


###trasfering file with the R
path <- system.file("extdata", package= "dslabs")
#system.file() --> finds the file or folder location inside an installed package
#"extdata' --> this is the folder name where dslabs stores extra data files
#and the result is the full path
print(path)

#show the files in the path
list.files(path)

#genarate the full path of the file
fullpath <- file.path(path, "murders.csv")
fullpath

#converting the file from the dslabs to the working dictionary
file.copy(fullpath, getwd())

#checking the file is in the directory or not
file.exists("murders.csv")



library(dslabs)
library(tidyverse)    # includes readr
library(readxl)

#without importing just reading the data to see if is this have header or not.
read_lines("murders.csv" , n_max=3)


#read file in csv format
data <- read_csv("murders.csv")
class(data)
head(data)

#so by reading with the R default function the dataset is just the dataframe.
data2 <- read.csv("murders.csv")
class(data2)

#another way to find the file path
file_path <- file.path(path, "murders.csv" )

#read the excel file
# Get sheet names
sheets <- excel_sheets("data.xlsx")

# Read a specific sheet
read_excel("data.xlsx", sheet = "Sales")
df <- read_excel("data.xlsx", sheet = sheets[2])

# 1. Save URL
url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"

# 2. Read CSV directly from the web
dat1 <- read_csv(url)

# 3. Download CSV file permanently in working directory
download.file(url, "murders.csv")

# 4. Create temporary filename
tmp_filename <- tempfile()

# 5. Download CSV file to temporary location
download.file(url, tmp_filename)

# 6. Read CSV from temporary file
dat2 <- read_csv(tmp_filename)

# 7. Delete temporary file
file.remove(tmp_filename)

# Check your data
print(head(dat1))
print(head(dat2))


