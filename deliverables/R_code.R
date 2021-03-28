# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('data_orders_w_new_variables .csv')

# Encoding categorical data
dataset$'Shipment_Mode' = factor(dataset$Shipment_Mode,
                       levels = c('Ocean', 'N/A', 'Air Charter', 'Air', 'Truck'),
                       labels = c(1, 2, 3, 4, 5))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Freight_Cost, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Freight_Cost ~ .,
               data = training_set)
# to view regressor write summary(regressor) on console

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
#type y_pred on the console