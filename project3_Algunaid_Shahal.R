# Question 1/ Read Dataset
library(readxl)
BlackFriday <- read_excel("C:/Users/aldul/OneDrive/Desktop/MASTER SHAHAL/BlackFriday.xlsx")
View(BlackFriday)


# Ouestion 2/ Find the average of purchase amount using (FOR) loop?
sum <- 0
for (idx in c(1:nrow(BlackFriday))){
  sum <- sum + BlackFriday[idx, "Purchase" ]
}
avg <- sum/nrow(BlackFriday)
print(avg)

# Ouestion 3/ Find the average of purchase amount using (while) loop?
sum <- 0
idx <- 1
while (idx <= nrow(BlackFriday)){
  sum <- sum + BlackFriday[idx, "Purchase" ]
  idx <- idx + 1
}
avg <- sum/nrow(BlackFriday)
print(avg)

# Ouestion 4/Find the average of purchase amount using (repeat) loop?
sum <- 0
idx <- 1
repeat {
  sum <- sum + BlackFriday[idx, "Purchase" ]
  idx <- idx + 1
  if (idx > nrow(BlackFriday)){
    break
  }
}
avg <- sum/nrow(BlackFriday)
print(avg)

# Ouestion 5/ Find the average of purchase amount for female shoppers using (FOR) loop?
sum  <- 0
female_shoppers <-0

for (idx in c(1:nrow(BlackFriday))){
  if(BlackFriday[idx, "Gender"] == "F" ){
    sum <- sum + BlackFriday[idx, "Purchase" ]
    female_shoppers <- female_shoppers+1
  }    
}
avg_female <- sum/female_shoppers
print(avg_female)

# Question 6/ Find the average of purchase amount for female shoppers using while loop?
sum <- 0
idx <- 1
female_shoppers <- 0
while (idx <= nrow(BlackFriday)){
   if(BlackFriday[idx,"Gender"]=="F")
   {
     sum <- sum+BlackFriday[idx,"Purchase"]
     female_shoppers <- female_shoppers +1
   }
  idx <- idx+1
}
avg_female <- sum/female_shoppers
print(avg_female)


# Question 7/ Find the average of purchase amount for female shoppers using repeat loop?
sum <- 0
idx <- 1
female_shoppers <- 0
repeat{
  if(BlackFriday[idx,"Gender"]=="F")
  {
    sum <- sum+BlackFriday[idx,"Purchase"]
    female_shoppers <- female_shoppers+1
  }
  idx <- idx+1
  if(idx > nrow(BlackFriday)){
    break
  }
}
avg_female <- sum/female_shoppers
print(avg_female)

# Question 8 part 1/ Find the average of purchase amount for male shoppers using repeat loop?
sum <- 0
idx <- 1
male_shoppers <- 0
repeat{
  if(BlackFriday[idx,"Gender"]=="M")
  {
    sum <- sum+BlackFriday[idx,"Purchase"]
    male_shoppers <- male_shoppers+1
  }
  idx <- idx+1
  if(idx > nrow(BlackFriday)){
    break
  }
}
avg_male <- sum/male_shoppers
print(avg_male)

# Question 8 part 2/  Find the differences between the average of purchase amount for female and male shoppers.

avg_all <- avg_male- avg_female
print(avg_all)

# Question 8/ Another solution using (For) to Find the differences between the average of purchase amount for female and male shoppers?

male_shoppers <- 0
female_shoppers <- 0
sum_male <- 0
sum_female <- 0

for (idx in c(1:nrow(BlackFriday)))
{
  if(BlackFriday[idx,"Gender"]=="F")
  {
    female_shoppers <- female_shoppers+1
  sum_female <- sum_female + (BlackFriday[idx,"Purchase"])
}
else if (BlackFriday[idx,"Gender"]=="M")
{
  male_shoppers <- male_shoppers+1
  sum_male <- sum_male + (BlackFriday[idx,"Purchase"])
}
  
}
avg_male <- sum_male/male_shoppers
avg_female <- sum_female/female_shoppers
print(avg_male) 
print(avg_female)
avg_differences <- avg_male- avg_female
print(avg_differences)






