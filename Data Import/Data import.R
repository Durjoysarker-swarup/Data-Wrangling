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





