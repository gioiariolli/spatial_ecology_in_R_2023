#brief recap of the past lesson

install.packages("terra")
library(terra)
install.packages("devtools")
library(devtools)
devtools::install_github("ducciorocchini/imageRy", force=TRUE) 
3
library(imageRy)
im.list()
b2 <- im.import("sentinel.dolomites.b2.tif")
b2

cl <- colorRampPalette(c("black", "grey", "white")) (100)
plot(b2, col=cl)

b3 <- im.import("sentinel.dolomites.b3.tif")
b3

plot(b3, col=cl)


b4 <- im.import("sentinel.dolomites.b4.tif")
b4

plot(b4, col= cl)

b8 <- im.import("sentinel.dolomites.b8.tif" )
b8

plot(b8, col=cl)

#NEW FUNCTIONS IN R
#lets plot all the layers together in 2 rows and 2 columns
par(mfrow=c(2,2))
plot(b2, col=cl) #band 2 is blue
plot(b3, col=cl) #band 3 is green
plot(b4, col=cl) #band 4 is red
plot(b8, col=cl) #band 8 is near-infrared or nir

#we plotted all the layers
#to know the wavelenght, google the name of the numbered sentinel file 
#looking at the graphics:
#the low values on the right show the absorbance, instead the high show the reflectance (of each band)

#HOW TO STACK LAYERS OF IMAGE ALL TOGETHER INSIDE THE SAME OBJECT?  
#We simply create a concatenation between our objects of interest and we name it
stack <- (c(b2, b3, b4, b8))
stack

#before running a new project, it is useful to close the past device
#HOW DO WE CLOSE THE PAST DEVICE?
#We use the dev.off() function
dev.off()

#now we can plot the new project, with all the layers and their data collected in the same object/stack
plot(stack, col= cl)

#HOW TO PLOT ONLY ONE LAYER OF OUR STACK?
#We use the function: (name.of.our.object [[number of the lyrs of interest]], col= )
plot(stack[[4]], col=cl)

#WHAT IS REFLECTANCE?
#it is a ratio between reflected radiant flux (energy) and the incident radiant flux (energy)
#if the reflected energy is the same as the incident, you're reflecting all the possible energy
#if the reflectance energy is zero, it means you're absorbing all the reflecting energy

#IMPORTANT! We must use integers and not float numbers to allow R software to understand our codes

#EXERCISE
#Plot in multiframe the bands with different colorRampPalettes

par(mfrow=c(2,2))
plot(b2, col=cl2) 
cl2 <- colorRampPalette(c("darkblue", "cyan", "white")) (100)
plot(b3, col=cl3) 
cl3 <- colorRampPalette(c("darkgreen", "green", "white")) (100)
plot(b4, col=cl4) 
cl4 <- colorRampPalette(c("darkred", "red", "coral")) (100)
plot(b8, col=cl8)
cl8 <- colorRampPalette(c("red", "orange", "yellow")) (100)

#RGB space, it stays for RedGreenBlue
#As we seen, our stack is composed by differnt band associated with different colors and different numbers: 
#band2, blue element number 1, in code terms (stack[[1]])
#band3 green element number 2,(stack[[2]])
#band4 red element number 3, (stack[[3]])
#band8 infrared element number 4, (stack[[4]])

#HOW DO WE PLOT THE THREE LAYERS ONE ON THE TOP OF THE OTHERS?
#We use the function "im.plotRGB()", this allow R to create an image fully colored (as human being can see)
im.plotRGB(stack, r=3, g=2, b=1)
