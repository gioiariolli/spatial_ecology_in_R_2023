
#Code related to population ecology

# HOW TO INSTALL NEW PACKAGES IN R?
# By using the function "install.packages("name of the package").
# Note that, since we are importing external data in R, it is important to quote the name of the package.

# "spatstat" package is needed for point pattern analysis.
# Whenever we want to add a package from R archive network, we use CRAN space.
# To look at the data description: https://CRAN.R-project.org/package=spatstat

install.packages("spatstat")
library(spatstat)
library(terra)

# We will use the bei data set, which is inside spatstat.

plot(bei)

# On the plot in the R environment we observe thousands of points, 
# a representation of the monitored number of trees in the Amazonia forest.

# HOW TO CHANGE THE DOTS SIZE AND STYLE?
# We use the "cex" and "pch" functions
plot(bei, cex=0.5, pch=19)

# This is a density map, how to let R calculting the plots as a continuous image?
# By considering each group of dots as a single unit,
# where each unit is going to be more or less dense according to the number
# of dots present in that area.

# HOW TO PASS FROM POINTS TO CONTINUOUS SURFACE? 
# By using the interpolation.
# First of all we use the "density" function to create the density map and we rename it

density.map <- density(bei)
density.map
plot(density.map)

# Now, on the console, it is shown that we are working with pixels
# in this way we can plot the density map.

# To read the map: blue is low density instead yellow is high density.


# HOW TO PUT THE POINTS ON THE TOP OF THE DENSITY MAP?
# By using the "points" function, but not creating a new variable just adding it to the past "bei" plot.

points(bei, cex=0.2)

# HOW TO CHANGE THE DENSITY MAP COLORS?
# By using the "colorRampPalette" function and by concatenating the colors.
# 100 is the gradient.
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(density.map, col=cl)

# another example:
cl2 <-colorRampPalette(c("yellow", "red", "orange", "black"))(100)
plot(density.map, col=cl2)

# EXERCISE
# To built a new color palette

cl.ex <-colorRampPalette(c("cornsilk","darkred", "coral", "aquamarine"))(100)
plot(density.map, col=cl.ex)

cl.ex2 <-colorRampPalette(c("aquamarine", "coral", "darkred", "cornsilk"))(100)
plot(density.map, col=cl.ex2)

# HOW TO HAVE AN ADDITION VARIABLE?
# We use the "bei.extra" dataset, in our case we will add the "elevation" to the gradient.
plot(bei.extra)

# We set the elevation into an element which we call "elev" and we plot it.
# We will obtain only the elevation plot.
elev <- bei.extra[[1]] #bei.extra$elev
plot(elev)

# HOW TO PLOT SEVERAL THINGS ALL TOGETHER?
# By using the "par" function and the "multiframe" argument
# Inside the array we need to state how many rows and coloumns we want to plot, by concatenating them.

par(mfrow=c(1,2))
plot(density.map)
plot(elev) #run all the elements together

par(mfrow=c(2,1))
plot(density.map)
plot(elev)

#HOW TO CHANGE THE MAP COLORS?
par(mfrow=c(1,2))
plot(density.map, col=cl.ex)
plot(density.map, col=cl.ex2)

par(mfrow=c(1,2))
plot(density.map, col=cl)
plot(density.map, col=cl2)

#EXERCISE
#Run three elements together
par(mfrow=c(1,3))
plot(bei)
plot(density.map)
plot(elev)
