#Two exercises with communities, multivariate analyses
install.packages("overlap")
library(overlap) #perfect to see how species are interacting in time
?overlap
library(vegan)
?vegan #vegan is a community ecology package

#this is also called ordination method or multivariate analysis

data(dune) #dune is the dataset
dune

#How to display only the first 6 rows?
#We use the function head()
head(dune)

#we will create a MULTIVARIATE ANALYSIS
#starting using the DECORANA function or Detrended correspondence analysis
#this is to help how to see the different species are correleted between
#each other in a plot
#we take the date and reshape them in a simple manner

#lets assign a name to the vegan's library function decorana

 ord <- decorana(dune)
ord

#on the console there are shown the values, these are the lenght of the axes
#so how much long is the range in each axes

#first we wrote the axes lenght, that we get in the console
ldc1 = 3.7004
ldc2 = 3.1166
ldc3 = 1.30055
ldc4 = 1.47888
#we calculate the total to them
total= ldc1 + ldc2 +ldc3 +ldc4

#see the percentage of each axes
pldc1 = ldc1 *100 /total
pldc2 = ldc2 *100 /total
pldc3 = ldc3 *100 /total
pldc4 = ldc4 *100 /total
#ets see the values of the percentage
pldc1
pldc2
pldc3
pldc4

#lets concentrate on the first two and lets see how much cumulative percentage
#they can have
pldc1 + pldc2
#they're representing the 71% of the whole variability
#final output or plot is 
plot(ord)
#the multivariate space is defined by two axes, DCA1 and DCA2
#the different names are the species, some of them are close others are far away
