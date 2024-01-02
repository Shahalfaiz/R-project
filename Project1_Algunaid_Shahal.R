
#Q1/ read the dataset into R

print("answer Q1")
library(readxl)
CarInsurances <- read_excel("D:/shahal/master data/CarInsurances.xlsx")
View(CarInsurances)


#Q2 and Q3 numbers rows and columns in the dataset
print("answer Q2 and Q3")
dim(CarInsurances)

#Q4/ assign the first eight rows of the dataset in the variable first.eight.rows
print("answer Q4")
first.eight.rows <- head(CarInsurances,8)
print(first.eight.rows)

#Q5/ assign the last five rows of the dataset to variable five.rows
print("answer Q5")
five.rows <- tail(CarInsurances,5)
print(five.rows)

#Q6/ list all object in the memory with two method 
print("answer Q6")
ls()
objects()


#Q7/ use summary function
print("answer Q7")
summary(CarInsurances)

