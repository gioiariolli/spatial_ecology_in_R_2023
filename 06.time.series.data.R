install.packages("terra")
library(terra)
install.packages
install.packages("devtools")
library(devtools)
devtools::install_github("ducciorocchini/imageRy", force=TRUE)
library(imageRy)
3
#First of all we import sentinel data from the NO concentration during COVID time
#We need to use the im-list function because we will import images
im.list()
EN01 <- im.import("EN_01.png")
EN13 <- im.import("EN_13.png")

#lets plot the two images together
par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

#to continue lets first clean the device
dev.off()

#We can make a sort of "mathematical difference" between the two images
#Basically, what we are doing is making a difference between the data set of the first image
#and the data set of the second image
diff = EN01[[01]] - EN13 [[01]]
diff
plot(diff)

#lets change the color palette by using the ColorRampPAlette function
cl.diff <- colorRampPalette(c("black", "blue", "white", "red")) (100)
plot(diff, col=cl.diff)

#by looking at the image we can say that everything that is red will be higher in the first term of the year
#in January instead everything that is black will be higher during the second time of the year in March
#This difference shows how, during COVID time, the NO concentration in atmosphere low down in all the European area 
#because of the stop of vehicules circulation

#Now we will use LST data "Low Stat Temperator" and the images are about the retreats of ice sheets in Greenland
#The images and the data are downloaded from Copernicus Global Land Service
#The blue part is going to restrict year by year, instead the black one is going to increase
g2000 <- im.import("greenland.2000.tif")
plot(g2000, col=cl)

g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

cl.g <- colorRampPalette(c("black", "blue", "white", "red")) (100)
par(mfrow=c(1,2))
plot(g2000, col=cl.g)
plot(g2015, col=cl.g)

dev.off()

#we can now concatenate them as a stack and them plot all the layers together
stackg <- c(g2000, g2005, g2010, g2015)
plot(stackg, col=cl.g)

#EXERCISE: make the difference between the first and the last element of the stack
diff.g = stackg[[1]] - stackg [[4]]
plot(diff.g, col=cl.g)

#in the middle we are loosing in term of low temperators, it means that that part is particular sensitive to 
#temperate changes. This is due to climate change. The range of the image will go from 1000 to -1000

#Now we can use the RGB space to plot 3 of our 4 images, one in each channel
#first element in red, second in green and third in blue
#According to in which year we have higher values, the corresponding image (plot) will have the color of that specific year

#EXERCISE: make an RGB plot using the different years of the stack
im.plotRGB(stackg, r=1, g=2, b=3)
#it is greenish and then blueish, it means that the highest temperators can be found in the last period
