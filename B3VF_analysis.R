#Load in spreadsheet with only 10-2 data
library(readxl)
B3_10_2 <- read_excel("B3_combination_ptnames_10-2.xlsx")

#Load in spreadsheet with only pt names and Study IDs
B3_pt_names <- read_excel("B3 pt names.xlsx")

#Join the two sheets so that all patients have Study IDs
