# Question 1/ Read the dataset
library(readxl)
SP500 <- read_excel("D:/shahal/master data/SP500.xls")
View(SP500)

# Question 2/ How many rows and columns are in the dataset?
# This function returns the number of rows and columns in a dataset. 
dim(SP500) 
# Question 2/ This function returns the numbers on rows only in dataset.
nrow(SP500)
#Question 2/  This function returns the number of columns only in dataset.
ncol(SP500)

# Question 3/ select the following three columns: sp500,CPI, and rate ?
SP500[ ,c("SP500","CPI","Rate")]

# Question 4/ select the 10th, 100th,500th, and 1500th rows ?
SP500[c(10,100,500,1500), ]

# Question 5/ Select all the observation such that SP500 is greater than 2000 or CPI is less than 100?
all_observation <- SP500[(SP500$SP500>2000)|(SP500$CPI<100), ]
print(all_observation)
# Question 5/  Another code with subset.
all_observation <- subset(SP500,(SP500 > 2000)|(CPI<100), )
print(all_observation)

# Question 6/ select the data such that Earnings greater than 50 and Rate less than 3 with columns SP500 and Dividend only?
select_data <- subset(SP500,(Earnings > 50)&(Rate<3),select= c("SP500","Dividend"))
print(select_data)

# Question 7/ Remove the entire column of Rate?
remove_column <- subset(SP500,select = -c(Rate))
print(remove_column)


# Question 8/ Add RealPrice column?
#first I wrote the code to extract the value of the CPI(2018.9)?
lastest_CPI <- SP500$CPI[nrow(SP500)]
print(lastest_CPI)
# Then I calculate the formula RealPrice=sp500*CPI/CPI(2018.09) and create new column ?
SP500$RealPrice <- SP500$SP500 * SP500$CPI/lastest_CPI 
# View the new column.
SP500[ ,c("RealPrice")]

# Question 9/ add RealEarnings column ?
SP500$RealEarnings <- SP500$Earnings * SP500$CPI/lastest_CPI
# View the new column.
SP500[ ,c("RealEarnings")]

# Question 10/ add PERatio column ?
SP500$PERatio <- SP500$RealPrice / SP500$RealEarnings
# View the new column.
SP500[ ,c("PERatio")]



# View the update data frame.
SP500







