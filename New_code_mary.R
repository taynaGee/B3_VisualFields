library(readxl)
B3_102_limdata <- read_excel("B3_102_limdata.xlsx")

library(tidyverse)
B3_102_limdata <- B3_102_limdata %>%
  group_by(`Study ID`, Visit) %>%
  mutate(Avg_MD = mean(`MD in dB`, na.rm = TRUE))%>%
  mutate(Avg_MDi = mean(`MD Inferior in dB`, na.rm = TRUE))%>%
  mutate(Avg_MDs = mean(`MD Superior in dB`, na.rm = TRUE))%>%
  mutate(Avg_PSD = mean(`PSD in dB`, na.rm = TRUE))


###TEST TEST TEST ################################################
B3_102_limdata1 <- B3_102_limdata %>%
    arrange(`Study ID`, Visit) %>%  
  group_by(`Study ID`, Visit) %>%
  mutate(Diff_2_3 = (lead(`MD in dB`) - `MD in dB`),
    Diff_1_3 = (lead(`MD in dB`, 2) - `MD in dB`)
  ) %>%
  ungroup()

plot(B3_102_limdata1$Avg_MD, B3_102_limdata1$Diff_2_3,
     main = "Scatterplot of Averages vs Differences",
     xlab = "Averages",
     ylab = "Differences")
abline(lm(B3_102_limdata1$Avg_MD ~ B3_102_limdata1$Diff_2_3))