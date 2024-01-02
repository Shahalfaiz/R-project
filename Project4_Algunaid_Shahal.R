# Question 1/ Read the dataset into R
loan <- read.csv("C:/Users/aldul/OneDrive/Desktop/MASTER SHAHAL/loan.csv")
   View(loan)

#Question 2/ Which coulmns are continuous/numerical variable and which coulmns are Factors ?
#first look at the variable names.
colnames(loan)
#second test the columns to see is continuous/numerical or Factors
str(loan)
# or we can use this function .
sapply(loan,class)
# The  id,loan_amnt,int_rate,installment,annual_inc is continuous/numerical variable 
#and The  term ,grade, emp_length home_ownership, verification_status ,loan_status is factors

# Question 3/  Calculate the minimum, maximum, mean, median, standard deviation and three quartiles (25th, 50th and 75th percentiles) of loan_amnt?
# Calculate the minimum
min(loan$loan_amnt) 
# Calculate the maximum
max(loan$loan_amnt)
# Calculate the mean
mean(loan$loan_amnt)
# Calculate the median
median(loan$loan_amnt)
# Calculate the standard deviation
sd(loan$loan_amnt)
# Calculate the three quartiles (25th, 50th and 75th percentiles)
quantile(loan$loan_amnt, probs = c(0.25, 0.5, 0.75)) 

# Question 4/ Calculate the minimum, maximum, mean, median, standard deviation and three quartiles (25th, 50th and 75th percentiles) of int_rate?
# Calculate the minimum
min(loan$int_rate) 
# Calculate the maximum
max(loan$int_rate)
# Calculate the mean
mean(loan$int_rate)
# Calculate the median
median(loan$int_rate)
# Calculate the standard deviation
sd(loan$int_rate)
# Calculate the three quartiles (25th, 50th and 75th percentiles)
quantile(loan$int_rate, probs = c(0.25, 0.5, 0.75)) 

# Question 5/  Calculate the correlation coefficient of the two variables: int_rate and installment. Do they have a strong relationship?
cor(loan$int_rate,loan$installment) #  weak relationship  It is positive and not close to 1


# Question 6/ Calculate the frequency table of term? 
table(loan$term) 
# What’s the mode of term variable?
names(sort(table(loan$term), decreasing = TRUE))[1]

# Question 7/ Calculate the proportion table of loan_status?
Prop_Table <-  table(loan$loan_status) 
prop.table(Prop_Table)
# What’s the mode of loan_status variable? 
names(sort(-prop.table(Prop_Table)))[1]

# Question 8/Calculate the cross table of term and loan_status? 
xtabs(~ term + loan_status, data = loan)
# Then produce proportions by row ?
xtab.term.loan_status <- xtabs(~ term   + loan_status , data = loan) 
prop.table(xtab.term.loan_status, margin = 1)
#and column respectively by column ?
xtab.term.loan_status <- xtabs(~ term   + loan_status , data = loan) 
prop.table(xtab.term.loan_status, margin = 2)


# Question 9/ summarize all the variables using one command ?

summary(loan)
