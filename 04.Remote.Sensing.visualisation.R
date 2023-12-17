install.packages("devtools") #we install it from CRAN
library(devtools)

# Devtools is used to install packages directly from other repository, such as github
# and not only directly from R.
# CRAN is the network of all the packages included in R
# github is also a packages comprehensory, those packages are additional to the CRAN's ones


# We will use the following images called sentinel as the project and dolomites, since the picures have been taken there
# the colors in the images are satelitte infrared images and each color has a correspondant band value.

# HOW DO WE IMPORT THE DIFFERENT LAYERS?
# we use the function im.import(name of the image of that specific layer)
devtools::install_github("ducciorocchini/imageRy", force=TRUE) #we install it from github, through devtools

library(imageRy)
3
install.packages("terra")
library(terra)

#lets use the same "im" prefix for each function
#now we will use this package

im.list()
b2 <- im.import("sentinel.dolomites.b2.tif")
b2

# Global circulation
# Latitude is the angle formed between the perpendicolar line that the point make on the elipsoide
# and the equator, so the angle of the latitude of a certain point P doesn't pass through the earth's centre
#even though the earth is always represented as a sphere, it actually is an elipsoide.

# If you have two different elipsoide, for the same point P you will obtian two measures
# as a value of the latitude at that point P
# one value will be higher than another, so it is not enough knowing which latitude we are using
# but we especially need also the geodetic datum (which elipsoide are we using to measure)
# or the value won't have any meaning.
# An example of system is WGS84 or world geodetic system
# UTM or Universal Transverse Mercator, cutting earth in angles and every one
# of them is 6 degrees. The earth is then divided in 60 zones. 
# They're numbered starting from Greenwhich. Italy is in the 32nd and 33rd zones.
# In general, if you want to overlap some datas, they must be in the same reference system
# this info are stated under the ''coordinates reference''.
# Overlapping= translation of a reference system in front of another.

# HOW TO OVERLAP TWO ELEMENTS?
# By using a six parameters transformation= translation in x,y,z and rotation in x,y,z.


# Lets change the colors of the b2
cl2 <- colorRampPalette(c("black", "grey", "white")) (100)
plot(b2, col=cl2)
# The more the blue is reflected, the closer to the minimum value (black) 2000 we are
# opposite, the more the blue is absorbed, the closer to the maximum value (white color) 5000 we will be

#EXERCISE
# Import the green band from sentinel-2 (band 3)
# This is where the green is absorbed and reflected
b3 <- im.import("sentinel.dolomites.b3.tif")
b3
cl3 <- colorRampPalette(c("black", "grey", "white")) (100)
plot(b3, col=cl3)

# Lets plot them all together
par(mfrow=c(1,2))
plot(b2, col=cl2)
plot(b3, col=cl3)

