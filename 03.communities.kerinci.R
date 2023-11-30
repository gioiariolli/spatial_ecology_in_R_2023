
data(kerinci) #data set of Kerinci National park in Sumatra, Indonesia
head(kerinci)
#on the console different variables will appear
#the unit of time that we're considering is the day, so we will obtain 
#data from 0 to 1
summary(kerinci)
#this function will take the data set and make a 

#lets see the grpah of the movement of one of the specie during the day
#we will select the lines in the data set in which we have the animale
#that we want to monitor, in this case is the tiger
#we will use a language called Sps, using the [] which will collect info inside the data set
tiger <- kerinci[kerinci$Sps == "tiger",]
tiger #so this is the new data set in which I only have tigers

#selecting the time
Timerad <- kerinci$Time * 2 * pi
#we can add an additional coloumn in the data set in which we make the above calculation

#HOW TO ASSIGN A CALCULATION TO A NEW OBJECT WHICH IS INSIDE THE DATA SET?
#"Timerad" is the function and it will be the name of the new coloums
#This will measure time in radiants
kerinci$Timerad <- kerinci$Time * 2 * pi
tiger <- kerinci[kerinci$Sps=="tiger",]
tiger

tigertime <- tiger$Timerad
#now if we run this we will see that it has 4 coloumns
#now we will plot this time variable to see which are the peaks in time in which you can see the tiger
plot(tiger$Timerad)
densityPlot(tigertime, rug=TRUE)
#we will obtain a graphic in which we can see when we can see the tiger over 24 hours

#LETS DO THE SAME WITH MACAQUES
#exercise, select only the data on the monkeys
summary(kerinci)
macaque <- kerinci[kerinci$Sps=="macaque",]
macaque
head(macaque)

#now we will make a time variable with macaque
macaquetime <- macaque$Timerad
plot(macaque$Timerad)
par(mfrow=c(1,2))
densityPlot(tigertime, rug=TRUE)
densityPlot(macaquetime, rug=TRUE)

#lets plot them overlapped, to see when they will be at the same time in the same place
#we will use the function "overlapPlot"
overlapPlot(tigertime, macaquetime)
