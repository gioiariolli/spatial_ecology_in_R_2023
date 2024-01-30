library(imageRy)
library(terra)
library(viridis)
library(ggplot)
library(patchwork)

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
dev.off()

##############################################
# Data taken from Copernicus Browser
# We calculate the NBR index, a standard for fire severity assesment.
# It is used to highlight burned areas in large fire zones.
# We first calculate it for march 2023 and then for may 2023, following a single data approach.
cl.ba <- colorRampPalette(c("yellow", "darkblue","black"))(100)
suppressWarnings({
  march_8A <- rast("Band_8a_march_2023.jpg")
})
plot(march_8A, col=cl.ba)
suppressWarnings({
  march_12 <-rast("Band_12_march_2023.jpg")
})
plot(march_12, col=cl.ba)

# 1, march 2023)

diff.march= march_12 - march_8A
plot(diff.march, col=cl.ba)
sum.march= march_12 + march_8A
plot(sum.march)
NBR_march= (diff.march) / (sum.march)
viridis<-colorRampPalette(viridis(7))(255)
plot(NBR_march, col=viridis)

# 2, may 2023)
suppressWarnings({
  may_8A <- rast("Band_8a_may_2023.jpg")
})
plot(may_8A, col=cl.ba)
suppressWarnings({
  may_12 <-rast("Band_12_may_2023.jpg")
})
plot(may_12, col=cl.ba)


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
names(NBR_stack) <- c("NBR march", "NBR april")
plot(NBR_stack, col=viridis)

# To bring it to another level, we calculate the delta between the two.
# This is the bi-temporal approach.
delta_BA = (NBR_may) - (NBR_march)
plot(delta_BA, col=cl.ba) #we use ColorRampPalette to enlgiht even more the Burned Areas
title("Mapping of burned areas with NBR", line = +2.5, cex=2) 

# We calculate a second index, a better one, called the NBR+, which masks water bodies and clouds.
# We need to add more bands, in this way the clouds reflectance will end in the 12th band
# and our BA will become easier to get spotted, less chance that they will be covered.
# 1) NBR+ index with March 2023 data:
suppressWarnings({
  march_2 <- rast("Band_2_march_2023.jpg")
})
plot(march_2, col=cl.ba)
suppressWarnings({
  march_3 <- rast("Band_3_march_2023.jpg")
})
plot(march_3, col=cl.ba)

diff.NBRR= (march_12 - march_8A - march_3 - march_2)
plot(diff.NBRR, col=viridis)
sum.NBRR= (march_12 + march_8A + march_3 + march_2)
plot(sum.NBRR, col=viridis)
NBRR_march= (diff.NBRR) / (sum.NBRR)
plot(NBRR_march, col=viridis)

# If we want, we can compare march's two indeces
par(mfrow=c(1,2))
plot(NBR_march, col=viridis)
title("NBR march", line = -1, cex=1.5) 
plot(NBRR_march, col=viridis)
title("NBR+ march", line = -1, cex=1.5) 
dev.off()

#2) NBR+ index with May 2023 data
suppressWarnings({
  may_2 <- rast("Band_2_may_2023.jpg")
})
plot(may_2, col=viridis)
suppressWarnings({
  may_3 <- rast("Band_3_may_2023.jpg")
}) 
plot(may_3, col=viridis)

diff.NBRR.may= (may_12 - may_8A - may_3 - may_2)
plot(diff.NBRR.may, col=viridis)
sum.NBRR.may= (may_12 + may_8A + may_3 + may_2)
plot(sum.NBRR.may, col=viridis)
NBRR_may= (diff.NBRR.may) / (sum.NBRR.may)
plot(NBRR_may, col=viridis)

# If we want we can compare may's two indices
par(mfrow=c(1,2))
plot(NBR_may, col=viridis)
title("NBR may", line = -1, cex=1.5) 
plot(NBRR_may, col=viridis)
title("NBR may+", line = -1, cex=1.5) 

# Again we calculate the delta to map the burned areas
delta_NBRR= (NBRR_may) - (NBRR_march)
plot(delta_NBRR, col=cl.ba)
title("Mapping of Burned Areas with NBR+", line = +2.5, cex=1.5) 

dev.off()

# We compare the two deltas
par(mfrow=c(1,2))
plot(delta_BA, col=cl.ba)
title("NBR mappping", line = +2.5, cex=1.5) 
plot(delta_NBRR, col=cl.ba)
title("NBR+ mapping", line = +2.5, cex=1.5) 

#We then classify the two delta data as follow, since its value goes between -1 and 1, where positive values
#mean unburned areas and negative values mean burned areas
#classes: 1=burned areas and 2=unberned areas
classNBRR <-im.classify(delta_NBRR, num_clusters = 2)
plot(classNBRR, col=viridis)

classNBR <-im.classify(delta_BA, num_clusters=2)
plot(classNBR, col=viridis)

#We calculate their frequency
fNBR <- freq(classNBR)
fNBR
fNBRR <-freq(classNBRR)
fNBRR

totNBR <- ncell(classNBR)
totNBRR <- ncell(classNBRR)
#We calculate their percentage
pNBR <- fNBR * 100 / totNBR
pNBR

pNBRR <-fNBRR * 100 / totNBRR
pNBRR

# We built the final table (so our dataframe)
class <- c("BA", "Un-BA")
yNBR <- c(40, 60)
yNBRR <- c(42, 58) 

final_table <- data.frame(class, yNBR, yNBRR)
final_table

p1 <- ggplot(final_table, aes(x=class, y=yNBR, color=class)) + geom_bar(stat="identity", fill="lightyellow")
p2 <- ggplot(final_table, aes(x=class, y=yNBRR, color=class)) + geom_bar(stat="identity", fill="lightyellow")
p1 + p2
