#remember to change path
UsedCars <- read.csv("C:/GiT/UsedCars.csv");
#install.packages("recommenderlab") if not exists
library(recommenderlab);
#install.packages("mlbench");
library(mlbench);
UsedCars <- as(UsedCars2, "binaryRatingMatrix"); 
rg <- runif(nrow(UsedCars));
# podzial zbiorow na treningowy i walidacyjny
g.train <- UsedCars[rg>=0.33,]
g.valid <- UsedCars[rg<0.33,]
#dyskrettyzacja wg trzech zbiorow X>9000, 9000<x<11000, 11000<X
Cena = cut(UsedCars2$Price, br = c(0,9000,11000,99999), labels = c("cheap","mid","expensive"))
#ile rekordkow wpadlo gdzie
table(Cena)
# obliczamy przedzia³y na zbiorze trenuj¹cym
#disc.mentr.compute(g.train, 1:10)
#g.train.dmen <- disc.mentr.apply(g.train, 1:10, g.dmen$nparti, g.dmen$points)
#e <-"evaluationScheme"(UsedCars, method="split",  train=0.7, k=NULL, given =0, goodRating = NA)
#t <-"evaluationScheme"(UsedCars, method="split",  train=0.3, k=NULL, given =0, goodRating = NA)

#g.train.dmen <- disc.mentr.apply(g.train, 1:10, g.dmen$nparti, g.dmen$points)


#install.packages("sqldf")
#> gd$mStart <- as.Date(gd$mStart, format="%d/%m/%Y")
#> gd$sStart <- as.Date(gd$sStart, format="%d/%m/%Y")