#Final script including all the different scripts during lectures

#Summary: 
# 01 Beginning
# 02.1 Population density
# 02.2 Population distribution
# 03 Community multivariate analysis

#---------------------------

# 01 Beginning

# Under the hashtag the software R will not detect the code. This is just a comment.

# exercise
# We will use R as a simple calculator
2 + 3

#Whenever we want to assign a value to an object, we rename the object. 
#This how to create a new variable with an assigned value.
a <- 2+ 3
a

gioia <- 3+5
gioia

#We can perform operations by using our new variables.
gioia * a

#To store the final operation result we rename it as "final"
final <- a*gioia
final

#Another basic operation: the result multiply for itself
final^2 

# ARRAY, a series of info coded all together.
# Example: we collected data about how many grams of microplastics we found in different spots of a lake.
# We concatenate all the data by using the "c" FUNCTION, in this way we created an array, all the collected 
# data stored inside are now called ARGUMENTS.

sophi <- c(10, 20, 30, 50, 70) 
sophi # run the code

# Let's add some data. 
# Example: We consider different amount of people in the different lake spots considered before.
# This is going to be our second variable:
paula <- c(100, 500, 600, 1000, 2000)

# We can now create a plot between the two variables.
# HOW TO CREATE A PLOT?
# We use the "plot" function.

plot(paula, sophi)
plot

# By plotting the two variables together, we observed a  direct correlation between them.

# Lets say that now I want to modify the plotting labels.
# HOW DO I ASSING NAMES TO THE LABELS?
# By using the "xlab" and the "ylab" arguments for the x axis and the y axis.

plot(paula, sophi, xlab="number of people", ylab="microplastics")
plot 

#OR I CAN assign to the old objects new names and then plotting them together 
people <- paula
microplastics <-sophi
plot(people, microplastics)

# HOW DO WE CHANGE SYMBOLS IN THE PLOT?
# By using the "pch" plot's argument. To know which one to use, we google "point symbols in R".

plot(people, microplastics, pch=19)

# HOW DO WE CHANGE THE SIZE OF OUR PLOT POINTS?
# By using the "cex" plot's argument.

plot (people, microplastics, pch=19, cex= 2)

# HOW TO CHANGE THE POINTS' COLOR?
# By using the "col" plot's argument.
plot(people, microplastics, pch=19, cex=2, col="green")

#---------------------------

# 02.1 Population density

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


#---------------------------

# 02.2 Population distribution

# Why populations disperse over the landscape in a certain manner?

# HOW TO INSTALL NEW PACKAGES IN R?
# By using the function "install.packages("name of the package").
# Note that, since we are importing external data in R, it is important to quote the name of the package.

install.packages("sdm") 
library(sdm) #This function is to make sure that the download completed successfully.
install.packages("terra")
library(terra) 

# HOW TO CHECK FILES' NAMES INSIDE AN R FOLDER?
# By using the "system.file" function and by specifing under parenthesis the package name.

system.file("external/species.shp", package="sdm")
file <- system.file("external/species.shp", package="sdm") 
file # after running the code, the names will be showned on the R console

# HOW TO USE THIS FILE?
# Since this is a VECTOR FILE, with the relative geographic coordinates, we will use the "vect" function
# This particular function, present in terra package, deals with vectors in the R space.

rana <- vect(file)

# HOW TO LINK TWO ELEMENTS TOGETHER?
# We use the $ symbol.

rana$Occurrence

# These codes are called PRESENCES and ABSENCES data (on the console is shown 0, 1, 0 and etc)
# 0 means absence and is an uncertain data, because it could be an error of your evaluation/monitoration 
# instead 1 means presence.

# HOW TO VISUAL SEE THE DATA IN THE ENVIRONMENT? 
# Again, by using plot function.
plot(rana)
plot (rana, cex= 0.5)

# HOW TO SELECT ONLY THE PRESENCES?
# By filtering the data ([...]) and setting the previously formed link (rana$Occurence) as equal (==) to the elements 
# that we want to extrapolate (1 = presences in occurence in our case).

rana[rana$Occurrence == 1,]

# In this manner we selected all the points in the plot that are equal to 1.

pres <- rana[rana$Occurrence ==1,]
pres$Occurrence

# After renaming the presences and linking them to Occurence, we can now plot them.

plot(pres, cex=2)

# HOW TO SELECT ABSENCES?
# Same procedure as beofore.

abs <- rana[rana$Occurrence ==0,]
abs$Occurrence
plot(abs, cex=2)

# To plot them together we use the par function.

par(mfrow=c(1,2))
plot(abs, cex=1)
plot(pres, cex=1)

# To change their color we use the function colorRampPalette

cl.pres <- colorRampPalette(c("yellow", "coral", "beige"))(3)
cl.pres

cl.abs <- colorRampPalette(c("blue", "aquamarine","navy", "lightgreen"))(4)

# We use argument "col" inside function "par" to change the colors of the two plots.

# HOW DO WE PLOT THE ABS AND PRES TOGETHER?
# We use the function "points" on the second function to add them 
# on the previous function.

plot(pres, cex=1, col= cl.pres)
points(abs, cex=1, col=cl.abs)

plot(pres, cex=1, col="darkgreen")
points(abs, cex=1, col="lightgreen")

# HOW TO UNDERSTAND WHY IN SOME AREAS THERE ARE GAPS (the absences)?
# There are some variables to explain and understand why, in these specific areas, the frog is not present.
# These variables are called PREDICTATORS (environmental variables).

# HOW TO IMPORT AN IMAGE AS A FILE FROM OUTSIDE R?
# By using system.file function to exit R and by selecting a file inside the folder called "elevation.asc". 
# "asc" is a type of file like jpeg, png; inside the sdm package.

elev <- system.file("external/elevation.asc", package="sdm")

# We call the new object elev but we won't use "vect" as before
# but "rast" because we're not dealing with points anymore, but with images (so with pixels).

elev <- rast(elev)
elev
plot(elev)

# Now we want to put on top of the elevation the points of presences.
# We use the "points" function again.

points(pres, cex=0.5) 

# Now we obtained a full map that shows where the frog is present and at which altitude
# By looking at it, we can make assumptions on the reasons why rana temporaria tends 
# to distributes more in an area rather than another.

# Lets do the same with the TEMPERATURE PREDICTOR

temp <- system.file("external/temperature.asc", package="sdm")
tempmap <-rast(temp)
plot(tempmap)
points(pres, cex=0.5)

# EXERCISE
# Lets do the same with cover of vegetation

veg <-system.file("external/vegetation.asc", package= "sdm")
vegmap <-rast(veg)
plot(vegmap)
points(pres, cex=0.5)

# To change colors of the map
plot(vegmap, col=cl.veg)
cl.veg <-colorRampPalette(c("lightgreen", "beige", "coral", "darkgreen", "yellow"))(100)

# Lets do the same with precipitation
prec <- system.file("external/precipitation.asc", package="sdm")
precmap <- rast(prec)
plot(precmap)
points(pres, cex=0.5)

# Plot everything together
par(mfrow=c(2,2))
plot(elev)
points(pres, cex=0.5)
plot(vegmap)
points(pres, cex=0.5)
plot(precmap)
points(pres, cex=0.5)
plot(tempmap)


#---------------------------

# 03 Community multivariate analysis

# We will use vegan package for our multivariate analysis for community ecology.
# Vegan package is for vegetation analysis.
# Overlap package is perfect to see how species are interacting during time.

install.packages("overlap")
library(overlap) 
install.packages("vegan")
library(vegan)


# Ordination method or multivariate analysis.

# To recall the data of our dataset "dune" we use the function data.

data(dune) 
dune

# HOW TO DISPLAY ONLY THE FIRST 6 ROWS OF THE DATASET?
# By using the function head().

head(dune)

# Starting using the decorana function or "Detrended Correspondence Analysis"
# It helps to see how the different species are correleted between each other in a plot.
# We take the date and reshape them in a simple manner.

# Lets assign a name to the vegan's library function decorana.

ord <- decorana(dune)
ord

# On the console, among the others, there are shown the values "axis lenghts", 
# these are the lenght of the 4 axes.
# So, how long is the range in each axes

# First we wrote the axes lenght
ldc1 = 3.7004
ldc2 = 3.1166
ldc3 = 1.30055
ldc4 = 1.47888
# We calculate the total to them
total= ldc1 + ldc2 +ldc3 +ldc4

# Percentage of each axes
pldc1 = ldc1 *100 /total
pldc2 = ldc2 *100 /total
pldc3 = ldc3 *100 /total
pldc4 = ldc4 *100 /total

# Lets see the values of the percentage
pldc1
pldc2
pldc3
pldc4

# Lets concentrate on the first two and lets see their cumulative percentage
pldc1 + pldc2

# They're representing the 71% of the whole variability.

# The final output or plot is 
plot(ord)

# The multivariate space is defined by two axes, DCA1 and DCA2
# the different names are the species, some of them are close others are far away.



