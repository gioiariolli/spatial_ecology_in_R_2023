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

