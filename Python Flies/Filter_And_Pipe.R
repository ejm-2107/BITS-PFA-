#DPLYR is automatically loaded with tidyverse package
#install and activate nycflight13
view(flights) #View requires tidyverse package to work
?flights #To lload the hep document whihc is very important
skim(flights)

#Pipes are used  filter a dataset
flights |> filter(dep_delay>120) #pipe function always require a function on RHS

#Assigning the output of filter to a seprate variable and then saving it inside an excel or a csv file
new_excel<- flights |> filter(dep_delay>120)
write_xlsx(new_excel,"Flights_Delayed.xlsx")

# The "&" stands for AND, "|" stands for or, ">" greater than, "<" lesser than, ">=" greater than equal to, "<=" is lesser than or equal to and "==" is to check equality
?flights
view(flights)
flights |>  filter(month==1 & day==1)

#Sorting is done in R using arrange 
SortingFlights<-flights|>arrange(year,month,day,dep_time)
library(writexl)
write_xlsx(SortingFlights,"SortingFlights.xlsx")

flights|>arrange(desc(dep_delay))

#"distinct" function used to filter our distinct rows in the dataset

flights|>distinct()
flights|>distinct(origin,dest) #Passing arguments to get distinct data but will remove all other columns
flights|>distinct(origin,dest,.keep_all=TRUE) #Here we are able to get distinct values on the bases of the 2 arguments we have passed and in the output we get all the columns

# count function is used to count the number of occurences

flights|> count(origin,dest, sort=TRUE) # this is used to get the max number of flights from any particular origin to destination. Sort = TRUE orders it in descending order by default
flights|> count(origin,dest, sort=TRUE) |> arrange(n) #Arrange gives the output in ascending order by default

#mutate is used to create a new column
SortingFlights <- flights|> mutate(gain=dep_delay-arr_delay)
view(SortingFlights)

SortingFlights2 <-flights|>mutate(gain=dep_delay-arr_delay, speed=distance/arr_time*60, s) #.before =1 is used to bring the newly added columns to the first
view(SortingFlights2)
library(readr)
write_xlsx(SortingFlights2,"SortingFlights3.xslx")
