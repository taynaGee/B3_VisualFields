library(readxl)
B3_102_limdata <- read_excel("B3_102_limdata.xlsx")

library(tidyverse)
B3_102_limdata <- B3_102_limdata %>%
  group_by(`Study ID`, Visit) %>%
  mutate(Avg_MD = mean(`MD in dB`, na.rm = TRUE))%>%
  mutate(Avg_MDi = mean(`MD Inferior in dB`, na.rm = TRUE))%>%
  mutate(Avg_MDs = mean(`MD Superior in dB`, na.rm = TRUE))%>%
  mutate(Avg_PSD = mean(`PSD in dB`, na.rm = TRUE))
