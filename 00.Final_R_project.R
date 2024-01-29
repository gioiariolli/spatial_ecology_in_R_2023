library(imageRy)
library(terra)
library(viridis)

getwd()
setwd("/Users/riolli/Desktop/GCE/R/R_project_SEA_BA/images_R")

# Different burned areas during the two months of march and paril
# March is when the burning season starts while april is in full burning season
# Data taken from World View Earth NASA
suppressWarnings({
BA_march_2022 <- rast("BA_march.jpeg")
})
suppressWarnings({
BA_april_2022 <- rast("BA_april.jpeg")
})

par(mfrow=c(1,2))
plot(BA_march_2022)
title("Burned Areas March", line = -1, cex=2) 
plot(BA_april_2022)
title("Burned Areas April", line = -1, cex=2) 

########################################################

# Data taken from World View Earth NASA
# Here we consider the land surface reflectance, red band 7, green band 1 and blue band 1
# This combination is most useful for distinguishing burn scars from naturally low vegetation 
# or bare soil and enhancing floods. Vegetation will appear green and burned areas will appear reddish.
# install.packages("raster") 
library(imageRy)
library(terra)
library(viridis)

getwd()
setwd("/Users/riolli/Desktop/GCE/R/R_project_SEA_BA/images_R")

suppressWarnings({
  land_march_2022 <- rast ("land_reflectance_march.jpeg" 
  )
})

suppressWarnings({
  land_april_2022 <- rast ("land_reflectance_april.jpeg" 
  )
})

suppressWarnings({
  land_may_2022 <- rast("land_reflectance_may.jpeg" 
  )
})

plot(land_march_2022, col=viridis)
plot(land_april_2022, col=viridis)
plot(land_may_2022, col=viridis)

dev.off()
##############

# We plot the three graphics all together to see the differences between months
par(mfrow=c(1,3))
RGB_march <- im.plotRGB(march_stack, r=3, g=2, b=1)
title("LSR March", line = -6, cex=2) 
RGB_april <- im.plotRGB(april_stack, r=3, g=2, b=1)
title("LSR April", line = -6, cex=2)  
RGB_may <- im.plotRGB(may_stack, r=3, g=2, b=1)
title("LSR May", line = -6, cex= 2)

dev.off()

##############################################
# Data taken from Copernicus Browser
# We calculate the NBR index, a standard for fire severity assesment.
# It is used to highlight burned areas in large fire zones.
# We first calculate it for february 2023 and then for march 2023, following a single data approach.
march_8A <- rast("Band_8a_march_2023.jpg")
plot(march_8A)
march_12 <-rast("Band_12_march_2023.jpg")
plot(march_12)
# 1)

diff.march= march_12 - march_8A
plot(diff.march)
sum.march= march_12 + march_8A
plot(sum.march)
NBR_march= (diff.march) / (sum.march)
viridis<-colorRampPalette(viridis(7))(255)
plot(NBR_march, col=viridis)

# 2)
# We do the same some months after, in may 2023

plot(SWIR_may_2023_3)
diff.may= may_12 - may_8A
plot(diff.may)
sum.may= may_12 + may_8A
plot(sum.may)
NBR_may= (diff.may) / (sum.may)
viridis<-colorRampPalette(viridis(7))(255)
plot(NBR_may, col=viridis)

# We create a stack with the two indeces, to see the differences between march and may
# This is a good way to graphically see the differences among the short-term fires situation
# and the long-term post fires one. 
# What are we ding is to compare the two single date approach previously
# obtained one close to the other.

NBR_stack <- c(NBR_march, NBR_may)
plot(NBR_stack, col=viridis)
names(NBR_stack) <- c("NBR march", "NBR april")

# To bring it to another level, we calculate the delta between the two.
# This is the bi-temporal approach.
delta_BA = (NBR_may) - (NBR_march)
plot(delta_BA, col=viridis)

# We calculate a second index, a better one, called the NBR+, which help us to not get confused
# between the reflectance caused by the clouds
# We need to more bands of the same image, in this way the clouds reflectance will end in the 12th band
# and our BA will become easier to spot, less chance that they will be covered.
march_2 <- rast("Band_2_march_2023.jpg")
plot(march_2)
march_3 <- rast("Band_3_march_2023.jpg")
plot(march_3)

# 1)
diff.NBRR= (march_12 - march_8A - march_3 - march_2)
plot(diff.NBRR)
sum.NBRR= (march_12 + march_8A + march_3 + march_2)
plot(sum.NBRR)
NBRR_march= (diff.NBRR) / (sum.NBRR)
plot(NBRR_march, col=viridis)

# If we want, we can compare the two index in the same month
par(mfrow=c(1,2))
plot(NBR_march, col=viridis)
plot(NBRR_march, col=viridis)

#2)
may_2 <- rast("Band_2_may_2023.jpg")
plot(may_2)
may_3 <- rast("Band_3_may_2023.jpg")
plot(may_3)
may_8A <- rast("Band_8a_may_2023.jpg")
plot(may_8A)
may_12 <-rast("Band_12_may_2023.jpg")
plot(may_12)

# We proceed in calculating the index NBR+ as follow:
diff.NBRR.may= (may_12 - may_8A - may_3 - may_2)
plot(diff.NBRR.may)
sum.NBRR.may= (may_12 + may_8A + may_3 + may_2)
plot(sum.NBRR.may)
NBRR_may= (diff.NBRR.may) / (sum.NBRR.may)
plot(NBRR_may, col=viridis)

# If we want we can compare the two indeces in the same month
par(mfrow=c(1,2))
plot(NBR_may, col=viridis)
plot(NBRR_may, col=viridis)

# Again we calculate the delta to map the burned areas, this time for NBR+ index
delta_NBRR= (NBRR_may) - (NBRR_march)
plot(delta_NBRR, col=viridis)

dev.off()

# We compare the two delta
par(mfrow=c(1,2))
plot(delta_BA, col=viridis)
plot(delta_NBRR, col=viridis)
