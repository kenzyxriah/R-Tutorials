## install.packages("readr")
library(readr)

## read CSV into R
df <- read_csv("apple_aug_stock_prices.csv")

## look at the object
head(df, 2)

#Reading Excel files
install.packages("readxl")
library(readxl)

df_excel <- read_excel("SPI sheet of Countries 2022.xlsx")
head(df_excel,2)

library(dplyr)
df_excel %>%
  print(n = 3)

#Importing data from Google Sheets
install.packages("googlesheets")
library(googlesheets)
gs_auth(new_user = TRUE)





