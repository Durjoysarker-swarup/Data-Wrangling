getwd()

install.packages("dslabs")
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

#without reading the data just see the value
read_lines("murders.csv" , n_max=3)


#read file in csv format
data <- read_csv("murders.csv")
head(data)

#another way to find the file path
file_path <- file.path(path, "murders.csv" )

#read the excel file
# Get sheet names
sheets <- excel_sheets("data.xlsx")

# Read a specific sheet
read_excel("data.xlsx", sheet = "Sales")
df <- read_excel("data.xlsx", sheet = sheets[2])




