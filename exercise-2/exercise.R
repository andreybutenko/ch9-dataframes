# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100)
employees <- paste('Employee', 1:100)

# Create a vector of 2014 salaries using the runif function
salaries.14 <- runif(100, 50000, 150000)

# Create a vector of 2015 salaries that are typically higher than the 2014 salaires (use runif again)
salaries.15 <- runif(100, 75000, 175000)

# Create a data.frame 'salaries' by combining the vectors you just made
salaries <- data.frame(employees, salaries.14, salaries.15, stringsAsFactors = false)

# Create a column 'raise' that stores the size of the raise between 2014 and 2015
salaries$raise <- salaries.15 - salaries.14

# Create a column 'got.raise' that is TRUE if the person got a raise
salaries$got.raise <- salaries$raise > 0

# Retrieve values from your data frame to answer the following questions:

# What was the 2015 salary of employee 57
employee.57.2015 <- salaries[57, 'salaries.15']

# How many employees got a raise?
raise.num <- length(salaries$got.raise[salaries$got.raise == TRUE])

# What was the value of the highest raise?
highest.raise <- max(salaries$raise)

# What was the name of the employee who recieved the highest raise?
rich.employee <- salaries[salaries$raise == highest.raise, 'employees']

# What was the largest decrease in salaries between the two years?
largest.loss <- min(salaries$raise)

# What was the name of the employee who recieved largest decrease in salary?
poor.employee <- salaries[salaries$raise == largest.loss, 'employees']

# What was the average salary increase?
mean.increase <- mean(salaries[salaries$got.raise, 'raise'])

### Bonus ###

# Write a .csv file of your salaries to your working directory
setwd('info201/ch9-dataframes/exercise-1')
getwd()
write.table(salaries, file='salaries.csv', sep=',', row.names=FALSE)

# For people who did not get a raise, how much money did they lose?
mean.loss <- mean(salaries[!salaries$got.raise, 'raise'])

# Is that what you expected them to lose?

### Double Bonus (no answer given) ###

# Repeat the above experiment 100 times, tracking the loss each time.
# Does the average loss equal what you expect?
# What about 10,000 times?
RunExperiment <- function() {
  salary.14 <- runif(100, 50000, 150000)
  salary.15 <- runif(100, 75000, 175000)
  raise <- salary.15 - salary.14
  got.raise <- raise > 0
  
  salary.data <- data.frame(salary.14, salary.15, raise, got.raise)
  
  return (mean(salary.data[!salary.data$got.raise, 'raise']))
}
x <- replicate(10000, RunExperiment())
average.loss <- mean(x)
