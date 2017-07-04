#' Takes an age and country and returns whether a person is legal to drink in that country
#'
#' @param age
#' @param country
#'
#' @return String of legal, not legal, or varies by conditions
#' @export
#'
#' @examples checklegal(16, "Canada")



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


