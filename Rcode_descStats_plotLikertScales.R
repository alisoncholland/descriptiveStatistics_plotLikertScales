# =========================================================
# Copyright ? 2021, Alison C. Holland, All rights reserved. 
# =========================================================


# load libraries
# --------------

library(psych)
library(likert)


# create & load data
# ------------------

# input data
Input =("
  Pooh    Piglet  Tigger
        3       2       4
        5       4       4
        4       2       4
        4       2       4
        4       1       5
        4       2       3
        4       3       5
        4       2       4
        5       2       4
        5       3       3
        ")
        
Data = read.table(textConnection(Input), header = TRUE)
Data

# change Likert scores to factors and specify levels
Data$Pooh = factor(Data$Pooh,
                   levels = c("1", "2", "3", "4", "5"),
                   ordered = TRUE)

Data$Piglet = factor(Data$Piglet,
                     levels = c("1", "2", "3", "4", "5"),
                     ordered = TRUE)

Data$Tigger = factor(Data$Tigger,
                     levels = c("1", "2", "3", "4", "5"),
                     ordered = TRUE)

# double check the df
head(Data)
tail(Data)
headTail(Data) # function shows both head and tail data together
str(Data)
summary(Data)

# remove unnecessary data frames (in this case 'Input')
rm(Input)


# Summary stats & plots
# ---------------------

# count responses with summary function splitting them into low (1 & 2), neutral and high (4 & 5)
Result <- likert(Data)
summary(Result)

# plot bar plot
plot(Result, type = "bar")

# plot heat plot
plot(Result, 
     type = "heat",
     low.color = "white",
     high.color = "blue",
     text.color = "black",
     text.size = 4,
     wrap = 50)

# plot density plot
plot(Result,
     type = "density",
     facet = TRUE,
     bw = 0.5)
