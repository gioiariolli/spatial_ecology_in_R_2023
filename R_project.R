library(imageRy)
library(terra)
library(viridis)

getwd()
setwd("/Users/riolli/Desktop/GCE/R/R_project_SEA_BA/images_R")

# Different burned areas during the two months of march and paril
# March is when the burning season starts while april is in full burning season
# Data taken from World View Earth NASA
BA_march_2022 <- rast("BA_march.jpeg")
BA_april_2022 <- rast("BA_april.jpeg")


par(mfrow=c(1,2))
plot(BA_march_2022, col=cl)
title("Burned Areas March", line = -1, cex=2) 
plot(BA_april_2022, col=cl)
title("Burned Areas April", line = -1, cex=2) 

########################################################

# Data taken from World View Earth NASA
# Here we consider the land surface reflectance, red band 7, green band 1 and blue band 1
# This combination is most useful for distinguishing burn scars from naturally low vegetation 
# or bare soil and enhancing floods. Vegetation will appear green and burned areas will appear reddish.
land_march_2022 <- rast ("land_reflectance_march.jpeg")
plot(land_march)
land_april_2022 <- rast ("land_reflectance_april.jpeg")
plot(land_april)
land_may_2022 <- rast("land_reflectance_may.jpeg")
plot(land_may)

# We plot the three graphics all together to see the differences between months
par(mfrow=c(1,3))
RGB_march <- im.plotRGB(land_march_2022, r=3, g=2, b=1)
title("LSR March", line = -8, cex=2) 
RGB_april <- im.plotRGB(land_april_2022, r=3, g=2, b=1)
title("LSR April", line = -8, cex=2)  
RGB_may <- im.plotRGB(land_may_2022, r=3, g=2, b=1)
title("LSR May", line = -8, cex= 2)

dev.off()
##############################################
# Data taken from Copernicus Browser
# We calculate the NBR index, a standard for fire severity assesment.
# It is used to highlight burned areas in large fire zones.
# We first calculate it for february 2023 and then for march 2023, following a single data approach.
# 1)
SWIR_march_2023_3 <- rast("2023-03-10-00_00_2023-03-10-23_59_Sentinel-2_L2A_SWIR.jpg")
plot(SWIR_march_2023_3)
diff.march= SWIR_march_2023_3[[1]] - SWIR_march_2023_3[[2]]
plot(diff.march)
sum.march= SWIR_march_2023_3[[1]] + SWIR_march_2023_3 [[2]]
plot(sum.march)
NBR_march= (diff.march) / (sum.march)
viridis<-colorRampPalette(viridis(7))(255)
plot(NBR_march, col=viridis)

# 2)
#We do the same some months after, in may 2023

SWIR_may_2023_3 <- rast("2023-05-19-00_00_2023-05-19-23_59_Sentinel-2_L2A_SWIR.jpg")
plot(SWIR_may_2023_3)
diff.may= SWIR_may_2023_3[[1]] - SWIR_may_2023_3[[2]]
plot(diff.may)
sum.may= SWIR_may_2023_3[[1]] + SWIR_may_2023_3 [[2]]
plot(sum.may)
NBR_may= (diff.may) / (sum.may)
viridis<-colorRampPalette(viridis(7))(255)
plot(NBR_may, col=viridis)

# We create a stack witht the two indeces, to see the differences between march and may
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
plot(delta_BA, col=cl)

cl <- colorRampPalette(c("white", "black", "red")) (100)

dev.off()
########################################################

#At last we show the different carbon monoxide concentration between february and march of the same year
#This practice has a arge impact on human health too


suppressWarnings({
  CO_feb <- rast("Carbon_monoxide_feb.jpeg")
})
suppressWarnings({
CO_march <- rast("Carbon_monoxide_march.jpeg")
})

par(mfrow=c(1,2))
plot(CO_feb)
plot(CO_march)


