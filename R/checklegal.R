# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

checklegal <- function(age, country) {

  library(readr)
  drinking <-read_csv("~/drinking2.csv")
  View(drinking)

  # run through index to find country

  #keeps track of index of the selected country
  countryindex <- 0

  for (x in 1:179){
    if (drinking[x,2] == country){
      #match, save index and break out of loop
      countryindex <- x
      break
    }

  }

  if (countryindex == 0){
    #did not match any country, print error message and stop function
    stop("Error: invalid country. Make sure you capitalize properly and choose a real country.")
  }

  # checks minimum drinking age in that particular country
  drinkingindex <- drinking[countryindex,3]

  if (drinkingindex == -1){
    # varies by something, print what it varies by
    sprintf("Drinking age varies by %s", drinking[countryindex,4])
  }
  else if (age < drinkingindex){
    #not legal
    print("Not legal to drink in this country!")
  }
  else{
    print("Legal to drink in this country!")
  }
}

checklegal(16, "Canada")
