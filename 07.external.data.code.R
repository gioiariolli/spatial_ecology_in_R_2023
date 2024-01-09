#Working directory=
#We need to create a folder in which we download all the images (from Earth observatory as an example) 
#and so where all the data are stored.
#We then will import the new folder, already present in our computer, inside R. 
#This folder will be our working directory in R.

install.packages("terra")
library(terra)

#The "getwd" is the function that we use to know how to write our path
getwd()

#function "set working directory" inside parenthesis we write the path 
setwd("/Users/riolli/Desktop/images_R")
setwd
#Now we will insert the name of the downloaded image
naja.2023 <- rast("najafiraq_etm_2003140_lrg.jpeg")

#To plot the image directly in terra we will use the function
plotRGB(naja.2023, r=1, g=2, b=3)

#We import the second image
naja.2003 <- rast("najafiraq_oli_2023219_lrg.jpeg")
plotRGB (naja.2003, r=1, g=2, b=3)

#now we plot the two images together
par(mfrow=c(2,1))
plotRGB (naja.2003, r=1, g=2, b=3)
plotRGB(naja.2023, r=1, g=2, b=3)

#We can make the difference between the two of them
najadiff= naja.2003[[1]] - naja.2023[[1]]
najadiff
najacol <- colorRampPalette(c("brown", "grey", "orange"))(100)
dev.off()
plot(najadiff, col=najacol)

#lets apply the same codes for other images, in this case the selected images are from the recent Arno flooding
#Showing the difference between October, before the floods, and November, right after them

tuscany.October2023 <- rast("italyflooding_oil_2023275.jpeg")
plotRGB(tuscany.October2023, r=1, g=2, b=3)
tuscany.November2023 <- rast("italyflooding_oil_2023307.jpeg")
plotRGB(tuscany.November2023, r=1, g=2, b=3)

par(mfrow=c(2,1))
plotRGB(tuscany.October2023, r=1, g=2, b=3) #green
plotRGB(tuscany.October2023, r=2, g=1, b=3) #near-infrared
plotRGB(tuscany.October2023, r=3, g=2, b=1) #blue

plotRGB(tuscany.November2023, r=1, g=2, b=3) #//
plotRGB(tuscany.November2023, r=2, g=1, b=3) #//
plotRGB(tuscany.November2023, r=3, g=2, b=1) #//

tuscanycol <- colorRampPalette(c("brown", "black", "orange")) (100)
difftuscany = tuscany.October2023[[1]] - tuscany.November2023 [[1]]
dev.off()

#in orange we can observe the water flooding in the area between Prato and the gulf of Livorno
plot(difftuscany, col=tuscanycol)
