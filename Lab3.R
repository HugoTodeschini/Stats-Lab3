library(ggplot2)
library('reshape2')
library(robust)
library(rlm)

#Exercice 1 Summary statistics
set.seed(123)
datas <- rt(15, 1)
mean(datas) #23.03012
#The mean is not a good summary because it should be near to 0. 
#It is due to outliers points and in particular a 315

summary(datas)
df = data.frame(datas)
ggplot(df, aes(x=datas)) +
  geom_histogram(binwidth=.5, colour="black", fill="white")

#We can propose the median which is less influenced to outliers
median(datas)
#The trimmed mean
mean(datas, trim = 0.2)
#Or the standart Deviation
sd(datas)

#Exercice 2 Detect outliers

#Elle l'a pas fait et est parti direct sur l'exo 3 mais il faut le faire


# Exercice3 ----------------------------------------------------------------------

#Briefly describe the dataset.p

#The dataset contains datas about 87 characters of Star Wars.
#It is physical datas like name, height or skin color 
#but we have the list of movies were they appear, their vehicls and starships too 

dfStarWars <- dplyr::starwars

#Consider the variables height and mass, plot univariate charts to study the range and other summary statistics

summary(dfStarWars['height'])
summary(dfStarWars['mass'])

ggplot(dfStarWars, aes(x = height)) + geom_density() + ggtitle("Height density")
ggplot(dfStarWars, aes(x = mass)) + geom_density() + ggtitle("Mass density") + scale_x_log10()

#Plot mass vs height and describe it
ggplot(dfStarWars, aes(x = height, y = mass)) + geom_point() + ggtitle("Height vs Mass")

#The mass of a character seems connected to its height. For characters between 150 and 250 cm we could do 
#a linear regression because it seems to be a straight.
#We have an extreme outlier (1000kg and 175cm) which correspond to Jabba

#Fit two different regression models. Plot and discuss the results. Useful: lmrob or MASS::rlm
sub <- subset(dfStarWars, select=c(height, mass))
linearRegression <- lm(sub)
robustLinearRegression <- lmRob(data = sub)
print(linearRegression)
print(robustLinearRegression)
ggplot(dfStarWars, aes(x = height, y = mass)) + geom_point() + ggtitle("Height vs Mass")

#Exercice1
set.seed(123)
x = rt(15, 1)
mean(x)
mean(x, trim = 0.2)
median(x)
sd(x)
