##give a look at "code from 0.2population" in professor github account

#Code related to population ecology

install.packages("spatstat")
library(spatstat)
library(terra)

#we will use the bei data set
plot(bei)
#on the environment we can se thousands of points, which represent
#the monitored number of trees in the Amazonia

#HOW TO CHANGE THE DOTS SIZE?
#we use the "cex" function
plot(bei, cex=0.5)
#this is a density map, how to calculate it as a continuous image?
#we consider each group of dots as a single unit
#each unit is going to be more or less dense according to the number
#of dots present in that area

#HOW TO PASS FROM POINTS TO CONTINUOUS SURFACE? 
#WE USE THE INTERPOLATION
#we use the "density" function to create the density map
#and we rename it
density.map <- density(bei)
density.map
#on the console is it shown that now we are working with pixels
#in this way we can now plot the density map
plot(density.map)
#blue is low density instead yellow is high density

#HOW TO PUT THE POINTS ON THE TOP OF THE DENSITY MAP?
#we use the "points" function, but not creating a new variable
#just adding it to the past "bei" plot
points(bei, cex=0.2)

#HOW TO CHANGE THE DENSITY MAP COLORS?
#We will use the "colorRampPalette" and concatenate the colors
#100 is the gradient
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(density.map, col=cl)

cl2 <-colorRampPalette(c("yellow", "red", "orange", "black"))(100)
plot(density.map, col=cl2)

#EXERCISE
#To built a new color palette
cl.ex <-colorRampPalette(c("cornsilk","darkred", "coral", "aquamarine"))(100)
plot(density.map, col=cl.ex)

cl.ex2 <-colorRampPalette(c("aquamarine", "coral", "darkred", "cornsilk"))(100)
plot(density.map, col=cl.ex2)

#HOW TO HAVE AN ADDITION VARIABLE?
#We use the "extra", in our case we will add the "elevation" to 
#the gradiant
plot(bei.extra)
#We set the elevation into an element which we call elev
#and we plot it, we will obtain only the elevation plot
elev <- bei.extra[[1]] #bei.extra$elev
plot(elev)

#HOW TO PLOT SEVERAL THINGS ALL TOGETHER?
#This is called "multiframe" argument
#the function that we are going to use is called "par"
#we will state how many rows and coloumns we want to plot inside
#the second frame, contained in the first one

par(mfrow=c(1,2))
plot(density.map)
plot(elev) #run all the elements together

par(mfrow=c(2,1))
plot(density.map)
plot(elev)

par(mfrow=c(1,2))
plot(density.map, col=cl.ex)
plot(density.map, col=cl.ex2)

par(mfrow=c(1,2))
plot(density.map, col=cl)
plot(density.map, col=cl2)

#EXERCISE
#Run three elements
par(mfrow=c(1,3))
plot(bei)
plot(density.map)
plot(elev)
