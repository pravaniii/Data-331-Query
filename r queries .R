library(dplyr)
library(tidyverse)
library(readxl)
library(lubridate)
rm(list = ls())

setwd("~/Desktop/DATA 331/week 10 R-queries")

course <- read_excel('Course.xlsx', .name_repair = "universal")
registration <- read_excel('Registration.xlsx', .name_repair = "universal")
student <- read_excel('Student.xlsx', .name_repair = "universal")

all_df <- student %>%
  left_join(registration, by = c("Student.ID")) %>%
  left_join(course, by = c("Instance.ID"))

compSciStudents <- all_df %>%
  dplyr::filter(Title == "Computer Science")

AllPaymentPlanStudents <- all_df %>%
  dplyr::filter(Payment.Plan == "TRUE")

FirstQuarterClassOptions <- all_df %>%
  dplyr::filter(Start.Date >= "2021-08-01" & End.Date <= "2021-12-29")

TotalBalanceByPlan <- all_df %>%
  dplyr::filter(Payment.Plan == "TRUE" & Total.Cost)

TotalCostByMajor <- all_df %>%
  dplyr::group_by()



