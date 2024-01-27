library(imageRy)
library(terra)
library(sdm)
library(overlap)

getwd()
setwd("/Users/riolli/Desktop/GCE/R/R_project_SEA_BA/images_R")


BA_march_2022 <- rast("BA_march.jpeg")
BA_april_2022 <- rast("BA_march.jpeg")
plot(BA_march_2022, cex=0.5)

BA_march_2022$Occurrence
points(BA_march_2022, cex=0.5)


plot.RGB <- (r=1, g=2, b=3)

land_march_2022 <- rast ("land_reflectance_march.jpeg")
plot(land_march)
land_april_2022 <- rast ("land_reflectance_april.jpeg")
plot(land_april)
land_may_2022 <- rast("land_reflectance_may.jpeg")
plot(land_may)
points(land_may, cex=0.5)
plot(land_may)
# We look at the land surface reflectance, red is band 3, blue band 1 and green band 2
# Vegetation is very reflective in the near infrared (Band 2), and absorbent in Band 1 and Band 7. 
# Assigning that band to green means even the smallest hint of vegetation will appear bright green in the image. 
# Naturally bare soil, like a desert, is reflective in all bands used in this image, but more so in the SWIR (Band 7, red) 
# and so soils will often have a pinkish tinge.

# Burned areas 
# When vegetation burns, burned area or fire-affected areas become characterized by deposits of charcoal and ash, removal of vegetation and/or alteration of vegetation structure. 
# When bare soil is exposed, the brightness in Band 1 usually slightly increases, but that may be offset by the presence of black carbon residue. 
# The near infrared (Band 2) will become darker, and Band 7 becomes more reflective. When assigned to red in the image, Band 7 will show burn scars as deep or bright red, 
# depending on the type of vegetation burned, the amount of residue, or the completeness of the burn.
im.plotRGB(land_march_2022, r=3, g=2, b=1)
im.plotRGB(land_april_2022, r=3, g=2, b=1)
im.plotRGB(land_may_2022, r=3, g=2, b=1)




