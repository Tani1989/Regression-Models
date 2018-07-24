# Regression Model Peer Graded Assignment

# Introduction : You work for Motor Trend, a magazine about the automobile industry. Looking at a data set of a collection of cars, they are interested in exploring the relationship between a set of variables and miles per gallon (MPG) (outcome). They are particularly interested in the following two questions:

# 1. Is an automatic or manual transmission better for MPG.
# 2. Quantify the MPG difference between automatic and manual transmissions.

# We are considering "mtcars" dataset for the assignment.

# Let's start with data preprocessing 
data("mtcars")
head(mtcars)
names(mtcars)
summary(mtcars)

# Start Analyzing the data
# We need to see the relationship between mpg and other variables.

cor(mtcars$mpg,mtcars[,-1])

# As we can see that there is negative relation between mpg and cyl,disp,hp,wt,carb.

# 1. Is an automatic or manual transmission better for MPG.

?mtcars

Transmission(0 = automatic, 1 = manual)

# some variables need to be converted into factor?
str(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
mtcars$am <- factor(mtcars$am)
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)

