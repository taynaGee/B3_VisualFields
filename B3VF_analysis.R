#Load in spreadsheet with only 10-2 data
library(readxl)
B3_10_2 <- read_excel("B3_combination_ptnames_10-2.xlsx")

#Load in spreadsheet with only pt names and Study IDs
B3_pt_names <- read_excel("B3 pt names.xlsx")

#Join the two sheets so that all patients have Study IDs
B3_102 <- left_join(B3_10_2, B3_pt_names, by = c("Patient First Name", "Patient Last Name", "Patient ID"))

uid <- B3_102 %>% distinct(ID)

write.csv(B3_102, file = "B3_102.csv", row.names = FALSE)

B3_102_all <- read_excel("B3_102_all.xlsx")
uid <- B3_102_all %>% distinct(`Study ID`)