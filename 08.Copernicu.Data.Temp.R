# Today we will import data from Copernicus website, where the extension of data is .nc
# To be able to read them, R needs the "ncdf4" package

install.packages("ncdf4")
library(ncdf4)

# Data available at:
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html
 # Today we will import data from Copernicus website, where the extension of data is .nc
# To be able to read them, R needs the "ncdf4" package

# We will explain to R in which outside folder the data are going to be stored
# Working directory
getwd()

# HOW TO CHANGE AND SET THE NEW WORKING DIRECTORY? 
# By using the "setwd" function

setwd("/Users/riolli/Desktop/GCE/R/images_R/")

# We then import the presaved object and rename it

soil_moisture_2023 <- rast("c_gls_SSM1km_202311140000_CEURO_S1CSAR_V1.2.1.nc")
plot(soil_moisture_2023) # "noise" are the errors

# To plot a single image 
plot(soil_moisture_2023[[1]])

# We change the colors with the ColorRampPalette function
cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(soil_moisture_2023 [[1]], col=cl)


# min and max long and min and max lat

ext <- c(60, 67, 30, 35) 

#function crop to crop the image by using as extension of the image the max and min values of lat and long that we settled before
soil_moisture_crop <- crop(soil_moisture_2023, ext)
plot(soil_moisture_crop[[1]], col= cl)

