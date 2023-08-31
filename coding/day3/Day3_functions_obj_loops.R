# Objects, Functions, Loops


### Where are we? Where are we headed?

# Up till now, you should have covered:
#   
# * R basic programming
# * Data Import
# * Statistical Summaries
# * Visualization
# 
# 
# Today we'll cover
# 
# * Objects
# * Functions
# * Loops



# Now that we have covered some hands-on ways to use graphics, let's go into some fundamentals of the R language. 

# Let's first set up 

pacman::p_load(tidyverse, 
              haven)



cen10 <- read_csv("/Users/mariaballesteros/Dropbox/Harvard/Teaching/Math Camp 2023/Day 3/usc2010_001percent.csv", col_types = cols())



### Seeing R through objects
# Most of the R objects that you will see as you advance are their own objects. For example, 
# here's a linear regression object (which you will learn more about in Gov 2001/2002):

ols <- lm(mpg ~ wt + vs + gear + carb, mtcars)

ols %>% summary %>% class()

class(ols) <- "pokemon"

## What is a function?

# Most of what we do in R is executing a function. `read_csv()`, `nrow()`, `ggplot()` .. pretty much anything 
# with a parentheses is a function. And even things like `<-` and `[` are functions as well.

# A function is a set of instructions with specified ingredients. It takes an input, then 
# manipulates it -- changes it in some way -- and then returns the manipulated product. 

# One way to see what a function actually does is to enter it without parentheses. 

table


# You'll see below that the most basic functions are quite complicated internally. 

# You'll notice that functions contain other functions. wrapper functions are functions that 
# "wrap around" existing functions. This sounds redundant, but it's an important feature of 
# programming. If you find yourself repeating a command more than two times, you should make your 
# own function, rather than writing the same type of code. 


### Write your own function
# It's worth remembering the basic structure of a function. You create a new function, call it `my_fun` by this:

my_fun <- function(data) {
 
  n_row <- data %>% nrow
  
  return(n_row)
}



# If we wanted to generate a function that computed the number of men in your data, what would that look like?

count_men <- function(data) {
  
  data %>% 
    filter(sex == "Male") %>% 
    nrow

}

sum(cen10$sex == "Male")

cen10 %>% 
  filter(sex == "Male") %>% 
  nrow

# Then all we need to do is feed this function a dataset

count_men(cen10)


cen10 %>% 
  filter(state == "California") %>% 
  count_men

# The point of a function is that you can use it again and again without typing up the set of 
# constituent manipulations. So, what if we wanted to figure out the number of men in California?

cen10 %>% 

  # put content here

  count_men(.)



# Let's go one step further. What if we want to know the proportion of non-whites in a state, just 
# by entering the name of the state? There's multiple ways to do it, but it could look something like this

nw_in_state(cen10, "Ohio")

nw_in_state <- function(data, state_name) {
  
  data %>% 
    filter(state == state_name) %>% 
    filter(race == "White") %>% 
    nrow -> count_white
  
  data %>% 
    filter(state == state_name) %>% 
    nrow -> total_count
  
  prop_white <- count_white/total_count
  out <- 1 - prop_white
  
  return(out)
}

# The last line is what gets generated from the function. To be more explicit you can wrap the last 
# line around `return()`. (as in `return(nw.s/total.s`). `return()` is used when you want to break out of a function in the middle of it and not wait till the last line.

# Try it on your favorite state!

nw_in_state(cen10, "Massachusetts")


# What if we try to apply it to "Maryland",  "New Hampshire" and "Iowa"   



## Checkpoint


### 1

# Try making your own function, `average_age_in_state`, that will give you the average age of people in a given state.



### 2

# Try making your own function, `asians_in_state`, that will give you the number of `Chinese`, `Japanese`, 
# and `Other Asian or Pacific Islander` people in a given state.




## Conditionals

# Sometimes, you want to execute a command only under certain conditions. This is done through the 
# almost universal function, `if()`. Inside the `if` function we enter a logical statement. 
# The line that is adjacent to, or follows, the `if()` statement only gets executed if the 
# statement returns `TRUE`. 

x <- 5

if(x < 0){
  print("x is negative")
}else if(x == 0){
  print("x  is zero")
}else{
  print("x is positive")
}




# You can wrap that whole things in a function 

is_positive <- function(number) {
  
  if(number < 0){
    print("x is negative")
  }else if(number == 0){
    print("x  is zero")
  }else{
    print("x is positive")
  }
}

is_positive(5)
is_positive(-3)



## For-loops

# Loops repeat the same statement, although the statement can be "the same" only in an abstract sense.  
# Use the `for(x in X)` syntax to repeat the subsequent command as many times as there are elements in the 
# right-hand object `X`. Each of these elements will be referred to the left-hand index `x`

# First, come up with a vector. 

fruits <- c("apples", "oranges", "grapes")


# Now we use the `fruits` vector in a `for` loop.

for (fruit in fruits) {
  print(paste("I love", fruit))
}


# Here `for()` and `in` must be part of any for loop. The right hand side `fruits` must be a thing 
# that exists. Finally the `left-hand` side object is "Pick your favor name." It is analogous to how we 
# can index a sum with any letter. $\sum_{i=1}^{10}i$ and `sum_{j = 1}^{10}j` are in fact the same thing.


for (i in 1:length(fruits)) {
  print(paste("I love", fruits[i]))
}


# write a for loop that calculate the percentage of man in "California", "Massachusetts", "New Hampshire", "Washington" and print it out in this format "Percentage of men in ____ is ___"

cal_percernt <- function(data, state_name){
  data %>% 
    filter(state == state_name) %>% 
    filter(sex == "Male") %>% 
    nrow -> count_men
  
  data %>% 
    filter(state == state_name) %>% 
    nrow -> total_count
  
  out <- count_men/total_count
  
  return(out)
}

cal_percernt(cen10, "California")

states_of_interest <- c("California", "Massachusetts", "New Hampshire", "Washington")

for( state in states_of_interest){
  
  men_perc <- cal_percernt(cen10, state)
  
  print(paste("Percentage of men in", state, "is", men_perc ))
}


# Instead of printing, you can store the information in a vector

states_of_interest <- c("California", "Massachusetts", "New Hampshire", "Washington")
male_percentages <- c()
iter <-1 

for( state in states_of_interest){
  
  men_perc <- cal_percernt(cen10, state)
  
  male_percentages <- c(male_percentages, men_perc)
  names(male_percentages)[iter] <- state
  
  iter <- iter + 1

}

male_percentages


## Nested Loops

# What if I want to calculate the population percentage of a race group for all race groups in states of interest?

# using loops
states_of_interest <- c("California", "Massachusetts", "New Hampshire", "Washington")


for (state_name in states_of_interest) {
  for (race_cate in unique(cen10$race)) {
    
    cen10 %>% 
      filter(race == race_cate) %>% 
      filter(state == state_name) %>% 
      nrow -> count_race
    
    cen10 %>% 
      filter(state == state_name) %>% 
      nrow -> total_count
    
    prop_race <- count_race/total_count
    prop_race

    print(paste("Percentage of", race_cate, "in", state, "is", prop_race))
  }
}


# using tidyverse functions 

cen10 %>% 
  group_by(state) %>% 
  nest() %>% 
  mutate(n_men = map_dbl(data, ~count_men(.)))

count_men <- function(data){
  
}

count_men
