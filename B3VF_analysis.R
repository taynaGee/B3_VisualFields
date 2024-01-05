#Load in spreadsheet with only 10-2 data
library(readxl)
library(tidyverse)
B3_10_2 <- read_excel("B3_combination_ptnames_10-2.xlsx")

#Load in spreadsheet with only pt names and Study IDs
B3_pt_names <- read_excel("B3 pt names.xlsx")

#Join the two sheets so that all patients have Study IDs
B3_102 <- left_join(B3_10_2, B3_pt_names, by = c("Patient First Name", "Patient Last Name", "Patient ID"))

uid <- B3_102 %>% distinct(ID)

write.csv(B3_102, file = "B3_102.csv", row.names = FALSE)

B3_102_all <- read_excel("B3_102_all.xlsx")
uid <- B3_102_all %>% distinct(`Study ID`)
#---------------------------------------------------------------------------------------------------------------------------


#Load in spreadsheet with study eye only & visit dates
B3_102_rta <- read_excel("B3_102_StudyEye_VisitDates.xlsx") %>%
  select("Study ID", "Perimetry Exam Date",
         "MD in dB", "MD Inferior in dB", "MD Superior in dB", "PSD in dB")



write_csv(B3_102_rta)
View(B3_102_rta)

B3_102_rta %>% group_by(`Study ID`,
                        `Visit Type`) %>% summarize(n = n())



#Calculate the average `MD in dB` for each patient/ visit

average_MDindB <- aggregate(`MD in dB` ~ `Study ID` + `Perimetry Exam Date`, data = B3_102_rta, FUN = mean)

