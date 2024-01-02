#Question 1/ load data set

breast_cancer_data <- read.csv("C:/Users/aldul/OneDrive/Desktop/MASTER SHAHAL/breast_cancer_data.csv")
  View(breast_cancer_data)
  
#Question 2/Define a user defined function BoxplotPredictorOnTarget with two arguments, the target and one predictor to plot the box plot of predictor based on different category of the target?
  BoxplotPredictorOnTarget <- function(target,predictor){
    boxplot(predictor~target, data=breast_cancer_data, notch=TRUE,  col=c("orange"), xlab = "target" , ylab = "predictor" ,main=" Target and one Predictor")
  }
  
  #convert the Diagnosis to a factor
  breast_cancer_data$diagnosis <- as.factor(breast_cancer_data$diagnosis)
  
  # defined function to generate the box plot
  #A/ area_mean against Diagnosis
  BoxplotPredictorOnTarget(breast_cancer_data$diagnosis,breast_cancer_data$area_mean)
  
  #B/ area_se against Diagnosis
  BoxplotPredictorOnTarget(breast_cancer_data$diagnosis,breast_cancer_data$area_se)
  
  #C/ texture_mean against Diagnosis
  BoxplotPredictorOnTarget(breast_cancer_data$diagnosis,breast_cancer_data$texture_mean)
  

#Question 3/ Build the following logistic models to forecast the Diagnosis and recommend?
  #A / forecast Diagnosis using area_mean
  #load the McFadden/pseudo
  library(pscl) 
  logical_model1 <- glm(diagnosis ~ area_mean , data = breast_cancer_data , family = binomial)
  summary(logical_model1)
  
  
  #B/  forecast the Diagnosis using area_mean and area_se?
  logical_model2 <- glm(diagnosis ~ area_mean + area_se , data = breast_cancer_data , family = binomial)
  summary(logical_model2)
 
  
  #C/ forecast the Diagnosis using area_mean, area_se and texture_mean?
  logical_model3 <- glm(diagnosis ~ area_mean + area_se + texture_mean , data = breast_cancer_data , family = binomial)
  summary(logical_model3)
  
  
  
  #D/ forecast the Diagnosis using area_mean, area_se, texture_mean and concavity_worst?
  logical_model4 <- glm(diagnosis ~ area_mean + area_se + texture_mean +  concavity_worst , data = breast_cancer_data , family = binomial)
  summary(logical_model4)
  
  
  #E/ forecast the Diagnosis using area_mean, area_se, texture_mean, concavity_worst and concavity_mean?
  logical_model5 <- glm(diagnosis ~ area_mean + area_se + texture_mean +  concavity_worst +  concavity_mean , data = breast_cancer_data , family = binomial)
  summary(logical_model5)
  
  #best model based on McFadden/pseudo R squared to the management
  pR2(logical_model1)
  pR2(logical_model2)
  pR2(logical_model3)
  pR2(logical_model4)
  pR2(logical_model5)
  
  #The best model is in Question E (the Diagnosis using area_mean, area_se, texture_mean, concavity_worst and concavity_mean)
  #because the  McFadden/pseudo R squared to the management is high  
  
  
  
  
  
  
  
  