require(XML)

getNBAGames <- function() {
  # A dictionary of months that had nba games months
  # Syntax example: 
  # mylist <- list()
  # mylist[["key"]] <- value
  
  seasonMonthsList <- list()
  seasonMonthsList[["BAA_1948"]] <- c(month.name[11:12], month.name[1:4])
  seasonMonthsList[["BAA_1949"]] <- c(month.name[11:12], month.name[1:4])
  seasonMonthsList[["NBA_1950"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1951"]] <- c(month.name[10:12], month.name[1:4])  
  seasonMonthsList[["NBA_1952"]] <- c(month.name[11:12], month.name[1:4])
  seasonMonthsList[["NBA_1953"]] <- c(month.name[10:12], month.name[1:4])  
  seasonMonthsList[["NBA_1954"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1955"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1956"]] <- c(month.name[11:12], month.name[1:4])
  seasonMonthsList[["NBA_1957"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1958"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1959"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1960"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1961"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1962"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1963"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1964"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1965"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1966"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1967"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["NBA_1968"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["ABA_1968"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1969"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["ABA_1969"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1970"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["ABA_1970"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1971"]] <- c(month.name[10:12], month.name[1:4])
  seasonMonthsList[["ABA_1971"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1972"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["ABA_1972"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1973"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["ABA_1973"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1974"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["ABA_1974"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1975"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["ABA_1975"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1976"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["ABA_1976"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_1977"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_1978"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_1979"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_1980"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1981"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1982"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_1983"]] <- c(month.name[10:12], month.name[1:5])
  seasonMonthsList[["NBA_1984"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_1985"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_1986"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_1987"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_1988"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1989"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1990"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1991"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1992"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1993"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1994"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1995"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1996"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1997"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1998"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_1999"]] <- c(month.name[2:6])
  seasonMonthsList[["NBA_2000"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_2001"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2002"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2003"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2004"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2005"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_2006"]] <- c(month.name[11:12], month.name[1:6])
  seasonMonthsList[["NBA_2007"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2008"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2009"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2010"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2011"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2012"]] <- c(month.name[12], month.name[1:6])
  seasonMonthsList[["NBA_2013"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2014"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2015"]] <- c(month.name[10:12], month.name[1:6])
  seasonMonthsList[["NBA_2016"]] <- c(month.name[10:12], month.name[1:6])
  # seasonMonthsList[["NBA_2017"]] <- c(month.name[10:12], month.name[1:4]) # Will this work? 
  
  for(season in 1:length(seasonMonthsList)) {
    # Step 1: Build the url that you need to go to
    # example: 
    # theurl <- "http://www.basketball-reference.com/leagues/NBA_2017_games-october.html"
    
    firstpart <- "http://www.basketball-reference.com/leagues/"
    secondpart <- allNames(seasonMonthsList)[season] # allNames gets the names of each key in the list. 
    middlepart <- "_games-"
    lastpart <- ".html"
    
    seasonGames <- list () # initialize a list of games for the season
    for(month in 1:length(seasonMonthsList[[season]])) {
      month <- tolower(seasonMonthsList[[season]][[month]]) # gets the month, converts to lower case
      theurl <- capture.output(cat(firstpart, secondpart, middlepart, month, lastpart, sep = ""))
      
      # Step 2: Go to the url and get the games
      monthGames <- list()
      monthGames <- readHTMLTable(theurl)
      
      # Step 3: Concatenate all the games
      seasonGames <- merge(seasonGames, monthGames, all = TRUE) # full join
      
      print(theurl)
    }
      # Step 4: Save the whole seasons games to a single .RData file
    saveRDS(seasonGames, file = paste(secondpart, ".RData", sep = "")) # saveRDS is a bit more robust than just save() - can use readRDS() to then load the data into whatever variable I want, as opposed to load which just gets whatever the previous variable was called. 
  }
}

  
