install.packages("devtools") #we install it from CRAN
library(devtools)
?devtools
devtools::install_github("ducciorocchini/imageRy", force=TRUE) #we install it from github, through devtools
library(imageRy)
plot(imageRy)

install.packages("terra")

#devtools is used to install packages directly from other repository, such as github
#and not only directly from R
#CRAN is the network of all the packages included in R
#github is also a packages comprehensory, those packages are additional to the CRAN's ones
3
#lets use the same "im" prefix for each function
#now we will use this package
im.list()
library(imageRy)
library(terra)
#We will use the following images called sentinel as the project and dolomites, since the picures have been taken there
#the colors in the images are satelitte infrared iamages and each color has a correspondant band value
#HOW DO WE IMPORT THE DIFFERENT LAYERS?
#we use the function im.import(name of the image of that specific layer)

im.import("sentinel.dolomites.b2.tif")
"sentinel.dolomites.b3.tif"
"sentinel.dolomites.b4.tif"
"sentinel.dolomites.b8.tif"
