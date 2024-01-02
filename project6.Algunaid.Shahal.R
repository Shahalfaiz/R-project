#Question 1/ Load the dataset
kc_house_data. <- read.csv("C:/Users/aldul/OneDrive/Desktop/MASTER SHAHAL/kc_house_data .csv")
  View(kc_house_data.)
  
#Question 2/  Build a linear model to forecast the price using bedrooms, bathrooms, and sqft_living?
  colnames(kc_house_data.)
  linear_model2 <- lm( price ~ bedrooms + bathrooms + sqft_living , data = kc_house_data.) 
  summary(linear_model2)
  #Then write down the corresponding math formula
  #price = B0 + B1 . bedrooms + B2 . bathrooms + B3 . sqft_living
  #price = 74662.099 + (-57906.631) . bedrooms + 7928.708 . bathrooms + 309.605 . sqft_living
  
  # Is it a good model based on R square or adjusted R square?  
  # R-squared is 0.5069 and the Adjusted R-squared is 0.5069 it means that 50.69% so the goodness of fit is not affected/the model explains none of the variability of the target data around the mean
  
#Question 3/ Build a linear model to forecast the price using bedrooms, bathrooms, sqft_living, and all the cross effects between them?
  linear_model3 <- lm( price ~ bedrooms + bathrooms + sqft_living + bedrooms * bathrooms + bedrooms * sqft_living + bathrooms * sqft_living , data = kc_house_data.) 
  summary(linear_model3)
  #Then write down the corresponding math formula
  #price = B0 + B1 . bedrooms + B2 . bathrooms + B3 . sqft_living + B4 . bedrooms : bathrooms + B5 . bedrooms : sqft_living + B6 . bathrooms : sqft_living 
  #price = 236822.361 + (-2467.597) * bedrooms  + (-35988.900) * bathrooms + 102.053 * sqft_living + (-23421.477) * bedrooms * bathrooms +  4.978 * bedrooms * sqft_living  +  63.619 * bathrooms * sqft_living 
  #Is it a better model than the model in Question 2 based on adjusted R square?
  #yes Adjusted R-squared  0.5412  it is better than Question 2
  
  
#Question 4/ Build a linear model to forecast the price using bedrooms, bathrooms, sqft_living, waterfront, and grade ?
  linear_model4 <- lm(price ~ bedrooms + bathrooms + sqft_living + waterfront + grade   , data = kc_house_data.) 
  summary(linear_model4)
  #Then write down the corresponding math formula
  #price = B0 + B1 . bedrooms + B2 . bathrooms + B3 . sqft_living + B4 . waterfront + B5 . grade
  #price = (-4.883e+05) + (-3.198e+04) * bedrooms + (-2.554e+04) * bathrooms +  2.134e+02 * sqft_living + 7.991e+05 * waterfront +  9.669e+04 * grade 
  #Is it a better model than the model in Question 3 based on adjusted R square?
  #yes Adjusted R-squared 0.5781  it is better because it is higher than Question 3
  
#Question 5/ Build a linear model to forecast the price using all other columns except id, date, zipcode, lat, and long without a y-intercept?
  my_data <- kc_house_data.[, !(names(kc_house_data.)%in%c("id","date","zipcode","lat","long"))]
  linear_model5 <- lm(price ~ 0 + ., data=my_data)
  summary(linear_model5)
  #If we only consider the models defined in Q2, Q3, Q4 and Q5, which model do you recommend based on the adjusted R squared value?
  summary(linear_model2)$adj.r.squared
  summary(linear_model3)$adj.r.squared
  summary(linear_model4)$adj.r.squared
  summary(linear_model5)$adj.r.squared
  #the model with high adjusted R squared so it is Question 5 because is high 0.8802821
  
#Question 6/to build a linear model to forecast price using bedrooms, bathrooms, sqft_living, sqft_lot, floors, waterfront, view, condition, and grade.
  linear_model6 <- lm(price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors + waterfront + view + condition + grade , data = kc_house_data. )
  summary(linear_model6)
  # Then add the flowing new house info
  new_house <- data.frame(bedrooms = 4 , bathrooms = 2 , sqft_living = 2560 , sqft_lot = 7650 , floors = 1.5 ,  waterfront = 1 , view = 3 , condition = 5 , grade = 10)
  # Predict the average sales price for this house?
  predict(linear_model6, newdata = new_house)
  #Predict the 95% predicted interval for this house?
  predict(linear_model6, newdata = new_house, interval = "predict", level = 0.95)
  
  
  
  
  
  
  
  
  
  