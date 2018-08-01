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

?mtcars

# Transmission(0 = automatic, 1 = manual)

# some variables need to be converted into factor?
str(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
mtcars$am <- factor(mtcars$am)
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)

# Quantifying mpg difference
# Stepwise model selection using backwards elimination to determine the variables for the good model

# Backward elimination
model <- lm(mpg ~ ., data = mtcars)
goodmodel <- step(model, direction = "backward")

summary(goodmodel)

# let's interpret the summary
# According to the procedure we did above the good model have cyl6,cyl8,hp,wt, and amManual variables as the
# overall p-value is less than 0.001. Additionaly, the result of this model shows that mpg decreases with 
# respect to the cylinders.


# t-test
t.test(mpg ~ am, data = mtcars) 

# Conclusion:
# Cars with a manual transmission are better for mpg than cars with an automatic transmission. 
# rate of change of conditional mean mpg with respect to am is about 1.8 (95% confident 
# that value varies between -1.06 and 4.68.) 



# Appendix
# Appendix 1. Scatterplots
pairs(mpg ~ ., data = mtcars)

# Appendix 2. Some Plots
par(mfrow=c(2, 2))
plot(goodmodel)

# Appendix 3. Boxplot of mpg vs transmission type
boxplot(mtcars$mpg ~ mtcars$am, data = mtcars, outpch = 19, ylab="mpg:miles per 
gallon",xlab="transmission type",main="mpg vs transmission type", col="blue")
