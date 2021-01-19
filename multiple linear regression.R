
#multiple linear regression

#business problem....one investor wants to invest.....in startup.....he is having 50 startup dataset....if he is only going to have data about 3 colums....r.d. exp, adminis, markt.....

#could he predict profit of that startup....??????

#50 startup data i have.....expenditures and profit....

#multiple linear regression apply...with the help of that i can create or train a machine learning model which will help in forecasting about the profit of any startup....

#train dataset.....80% dataset......

#test dataset......20% dataset......

#y reg x.......y = b0+b1*x1+b2*x2+b3*x3

#y = profit
#b0=intercept
#b1=slope of r and d spend              x1=r&d spend
#b2=slope of administration             x2=admin. spend
#b3=slope of marketing                  x3=marketing spend


dataset = X50_Startups
dataset

#install package(catools)
library(caTools)

#any x value as a categorical variable then you need to convert first that categorical column into a numerical column

# Encoding categorical data 
dataset$State = factor(dataset$State, 
                       levels = c('New York', 'California', 'Florida'), 
                       labels = c(1, 2, 3)) 

dataset

#training dataset
#test dataset

#splitting the dataset into the training set and test set

set.seed(123)   #then we will split the same data with the random method

split = sample.split(dataset$Profit, SplitRatio = 0.8) 

split

training_set = subset(dataset, split == TRUE)    #40 rows of dataset
training_set

test_set = subset(dataset, split == FALSE)       #10 rows of dataset
test_set

# Feature Scaling 
# training_set = scale(training_set) 
# test_set = scale(test_set) 

# Fitting Multiple Linear Regression to the Training set 
regressor = lm(formula = Profit ~ ., 
               data = training_set) 

summary(regressor)

# Predicting the Test set results 
y_pred = predict(regressor, newdata = test_set) 

summary(dataset)

plot(training_set)

head(dataset)

tail(dataset)

plot(dataset$Profit)

plot(dataset$State)







