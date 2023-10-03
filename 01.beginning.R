# Under the hashtag the software R will not detect the code, this is a Mark Down project. This is just a comment.

# exercise
# We will use R as a simple calculator
2 + 3

# we can assign a value to an object, creating a variable
a <- 2+ 3
a

gioia <- 3+5
gioia

gioia * a

final <- a*gioia
final
# in this way the result will be stored under ''final''

final^2 #the result multiply for itself

# array, a series of info coded all together
# in this example we have collected datas about how many grams of microplastics we found in different spots of a lake

sophi <- c(10, 20, 30, 50, 70) # of course we need to CONCATENATE them, or R will not be able to read the code
# in this way we create a FUNCTION, all the datas inside, settled as numbers, are called ARGUMENTS
sophi # run the code

# let's add some data. We consider different amount of people in the different considered spots
paula <- c(100, 500, 600, 1000, 2000)

#we can now create a plot between the two data

plot(paula, sophi)
plot
#in this way for each data collected from Sophi in a specific spot, we collected the data collected 
#from Paula in that same spot and we plotteed them in a graphic to see if there's a 
#demonstrate if the amount of microplastics is related to the amount of people

#so now I can modify the plotting labels by using this function
plot(paula, sophi, xlab="number of people", ylab="microplastics")
plot

#ANOTHER WAY TO DO IT is to assign the so-called object to a new called one
people <- paula
microplastics <-sophi

plot(people, microplastics)

#let's imagine that WE WANT TO CHANGE THE PLOT, by using another symbol
# an argument of plot is called PCH, look at "point symbols in R" on google

plot(people, microplastics, pch=19)

#or if we want to change the characters dimension with the CEX function (character exageration)
plot (people, microplastics, pch=19, cex= 2)

#How to change points' color? function COL
plot(people, microplastics, pch=19, cex=2, col="green")

