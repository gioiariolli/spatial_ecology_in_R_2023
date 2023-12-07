# Classifying satellite images and estimate the amount of change


library(terra)
library(imageRy)
im.list()

# Image from the solar orbit
solar <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
solar

# HOW TO CREATE A CLASSIFIED IMAGE?
# By using the im.classify function and by setting the number of clusters.
# cluster= different objects having same features, collected all together
solarc <- im.classify(solar, num_clusters = 3)
plot(solarc)
# White is the class with highest energy. Green is third cluster, lowest amount of energy is the yellow 
# The random set we used for classification is different everytime we use the classification function
# That's why my images are different from professor's ones. 
# So how can I generally state the correct energy pattern?
# We should apply this to the mato grosso forest to estimate the amount of change.
im.list()

?im.classify
mato1992 <- im.import("matogrosso_l5_1992219_lrg.jpg"  )                  
mato2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")                   

# By classifing the image and setting 2 clusters we can define the two spaces (human part=2 and forest=1)
m1992c <- im.classify(mato1992, num_clusters= 2)
plot(m1992c)

# lets do the same with the second image, where the human related class is amplified (cluster 2)
m2006c <- im.classify(mato2006, num_clusters=2)
plot(m2006c)
dev.off()
# let's plot them together
par(mfrow=c(1,2))
plot(m1992c[[1]])
plot(m2006c[[1]])

# We use the freq to determine which is the frequency of something of a certain population
f1992 <- freq(m1992c)
f1992

# Image that we want to calculate the percentage, simply dividing by the total number of pixels
# HOW DO WE CALCULATE THE NUMBER OF PIXELS WITHIN A IMAGE?
# By using the function ncell
tot1992 <- ncell(m1992c)
tot1992

# HOW DO WE CALCULATE THE PERCENTAGE?
# By dividing the frequency with the total number of pixels
perc1992 <- f1992 *100 / tot1992
perc1992

# We are going to take the percentage (from the console)
# Forest got 83% while human related area got 16%

# Lets do the same with the 2006 to see the difference
f2006 <- freq(m2006c)
f2006

tot2006 <- ncell(m2006c)
tot2006

p2006 <- f2006* 100 / tot2006
p2006
# We've obtained that human related area got 54% while forest got 45%

# Lets make a graph with the two of them together
# We will create a dataframe first and build the final table
# HOW TO CREATE A DATA FRAME?
# By using the data.frame function
class <- c("forest", "human")
y1992 <-  c(83, 17)
y2006 <- c(45, 55)
mydf <- data.frame(class, y1992, y2006)
mydf

library(ggplot2)

#final plot
# aes is aesthetics where x is the class, y is the columns related to the years (values of human/forest precences percentage in this case)
# the color is related to the class (human class will have one color, forest another)
# geombar is because we'll use an histogram. It is normally related to stathistics, so you can use the function to calculate mean, median and so on
# in our case we will only use the identity so the data that we've already imported in our data frame. The fill is to fill the bar with a certain color

p1 <- ggplot(mydf, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
p1

p2 <- ggplot(mydf, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")
p2
