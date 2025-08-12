getwd()
#the url in
path <- "G:/Lesson/Ongoing/The A Shot/Da_Wa/Data-Wrangling/Tidy Data/"
list.files(path)
fullpath1 <- file.path(path,"Data Reshaping.R")
fullpath2 <- file.path(path, "tidy the data.R")

need_paste <- "G:/Lesson/Ongoing/The A Shot/Da_Wa/Data-Wrangling/Tidy Data/Data Reshaping"

file.copy(fullpath1, need_paste)
file.copy(fullpath2, need_paste)

list.files(need_paste)
