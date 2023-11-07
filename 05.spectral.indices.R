###########
pairs(stack)
#Pearson correlation coefficient
#hyper correlation of 0.99 and 1.00
#if you use the near infrared you can see that the correlation is still present but it is lower
#with values netween 0.70 and 0.75
#first and second band goes together

#VEGETATION INDEX or DVI INDEX
#it is a index of vegetation's health 
#if a plant is suffering the vegetation index will increase, instead if is not suffering
#the index will decrease and have a small value

#we are going to make the difference between the near infrared and the 

library(imageRy)
library(terra)
install.packages("ggplot2")
library(ggplot2)
install.packages("viridis")
library(viridis)

im.list()
#to know information about any file description go on ducciorocchini repository and 
#under the line of ImageRy you will ind them, now we will use the "matogrosso"
#these images come from the NASA earth observatory, about deforestation in the region of Rio Peixoto in Brasil

m1.2006 <-im.import("matogrosso_ast_2006209_lrg.jpg" )
m1.2006

m1.1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m1.2006
#bands: 1=NIR 2=RED 3=GREEN
im.plotRGB(m1.1992, r=1, g=2, b=3) #near infrared on top of the red and other componentes and so all the vegetation will become green
#we can compare the density of vegetation in the area between 1992 and 2006
par(mfrow=c(1,2))
im.plotRGB(m1.1992, 1, 2, 3)
im.plotRGB(m1.2006, r=1, g=2, b=3)

#to see it in blue and yellow colors
im.plotRGB(m1.2006, r=2, g=3, b=1)
im.plotRGB(m1.1992, r=2, g=3, b=1)
