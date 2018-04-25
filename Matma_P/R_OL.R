#remember to change path
UsedCars2 <- read.csv("C:/GiT/UsedCars.csv");
#install.packages("recommenderlab") if not exists
library(recommenderlab);
UsedCars <- as(UsedCars2, "binaryRatingMatrix"); 
#diving dataset into 90% for training and 10% for testing
e <-"evaluationScheme"(UsedCars, method="split",  train=0.9, k=NULL, given =0, goodRating = NA)


install.packages("sqldf")
> gd$mStart <- as.Date(gd$mStart, format="%d/%m/%Y")
> gd$sStart <- as.Date(gd$sStart, format="%d/%m/%Y")