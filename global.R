
library(lubridate)
library(shiny)
library(ggplot2)

# read/format data file, create selection list
#data=read.csv("data_orig.csv")
data=read.csv("data.csv")
data$WK_DATE=as.Date.POSIXct(dmy(data$WK_DATE))
brands<-as.list(levels(data$BRAND))
