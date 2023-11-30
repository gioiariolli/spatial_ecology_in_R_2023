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
