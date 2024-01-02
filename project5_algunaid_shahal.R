# Question 1/ Read the dataset
 loan <- read.csv("C:/Users/aldul/OneDrive/Desktop/MASTER SHAHAL/loan.csv")
  View(loan)
  
# Question 2/ plot the histogram and density of the loan_amnt using basic graphics ?
  hist(loan$loan_amnt, 
       main = "Histogram and density plots of loan_amnt", 
       prob = TRUE,
       xlab= " loan_amnt", ylab = "probably")
  lines(density(loan$loan_amnt), # density plot
        lwd = 7, 
        col = "green")
      

#Question 3/plot the histogram and density of the loan_amnt and add the vertical line denoting the mean using ggplot2?
  is.numeric(loan$loan_amnt)
  library(ggplot2)  #load ggplot2
  ggplot(data = loan, aes(x=loan_amnt))+ 
    geom_histogram(aes(y=after_stat(density)), colour="black", fill="blue")+    # Histogram with density plot
    geom_density(alpha=.5, fill="yellow") + 
    geom_vline(aes(xintercept=mean(loan_amnt)),  # vertical line
            color="red", linewidth=2,linetype="dashed")
  
#Question 4/scatter plot of loan_amnt (y-axis) against annual_inc (x-axis) and add the trend line using basic graphics?
  plot(loan$annual_inc, loan$loan_amnt,
       main = "Scatter plot of loan_amnt against annual_inc",
       xlab = " annual_inc", ylab= "loan_amnt",xlim=c(0,200000))
  #Add trend line
  abline(lm(loan_amnt~annual_inc, data = loan), 
         lwd = 5, col="red") 
  
#Question 5/ scatter plot of loan_amnt (y-axis) against annual_inc (x-axis) and add the trend line using ggplot2?
  
  ggplot(data = loan[which(loan$annual_inc<200000),], aes(x = annual_inc, y=loan_amnt))+geom_point()+geom_smooth() 
  
  
# Question 6/ plot the barplot of term and grade on the same barplot using basic graphics ?
  # we need to convert it to a factor using as.factor
  is.factor(loan$term)
  is.factor(loan$grade)
  loan$term <- as.factor(loan$term)
  loan$grade <- as.factor(loan$grade)
  is.factor(loan$term)
  is.factor(loan$grade)
  #generate cross table of grade and term
  tbl.grade <- xtabs(~ grade + term, data = loan)
  #Barplot of the frequency table
  barplot(tbl.grade, main="Term and Grade", 
          col=c("blue","red","brown", "yellow","green","pink","black"), legend = rownames(tbl.grade))
  
# Question 7/ plot the barplot of term and grade on the same barplot using ggplot2?
  ggplot(data = loan, aes(x=term, y= after_stat(count))) + geom_bar(aes(fill = grade))
  
  
# Question 8/ boxplot loan_amnt (y-axis) against term (x-axis) and save the graph in a file, loanterm.jpg, using basic graphics
  boxplot(loan_amnt ~ term, data=loan, notch=TRUE, 
          col=c("blue"),
          main="loan_amnt by term", xlab="term")
          #save the graph in a file
          setwd("C:\\Users\\aldul\\OneDrive\\Desktop\\MASTER SHAHAL")
          dev.copy(jpeg,"loanterm.jpg",width = 1200, height = 800 ,units = "px")
          dev.off()
  
# Question 9/ boxplot loan_amnt (y-axis) against term (x-axis) and save the graph in a file, loanterm.jpg, using ggplot2. Are there any differences in loan amount with respect to term?
          ggplot(data=loan, aes(x=term, y=loan_amnt)) + geom_boxplot(aes(col= term ), notch = TRUE)
          #save the graph in a file
          BoxPlot <- ggplot(data=loan, aes(x=term, y=loan_amnt)) + geom_boxplot(aes(col= term ), notch = TRUE)
          ggsave(file.path("C:\\Users\\aldul\\OneDrive\\Desktop","loanterm.jpg"), plot =  BoxPlot , device = jpeg,  width = 20, height = 15, units = "cm")
  
  
#yes,There are differences because is no overlap between the two boxplots different Median and whisker, and quartile
  
  
  
  
  
  
  