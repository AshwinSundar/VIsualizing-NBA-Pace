# Ashwin Sundar
# NBA Points Distribution By Era
# April 8 2017
# Took me a few weekends to figure this out - the key for me was to use plotly instead of ggplot2. Please feel free to email me at ashiundar@gmail.com - I will be glad to help you in any way I can!
#
# Goal - This (https://github.com/zonination/football-hmap) for NBA
# Steps 
# Make a single csv containing every game in history. EVery site has the following URL format:
# http://basketball-reference.com/leagues/NBA_[Year]_games-[month].html
# e.g. http://www.basketball-reference.com/leagues/NBA_1999_games-february.html
# They are all HTML tables, so just go get them all. 
# UI
# Tab 1: 1949-2017
# Tab 2: 2010-2017
# Tab 3: 2000-2009
# etc.
# this guy did it for NFL
# https://github.com/zonination/football-hmap
# Here's how I did it:
# getNBAGames() # I wrote an R script that gets all the NBA games and stores them in .RData files. Preferable to .csv because I can load and directly manipulate them pretty fast

require(shiny)
require(plotly) # a better plotting library

staticWidth <- "200px"
staticHeight <- staticWidth

# Define UI for application that draws a histogram
ui <- navbarPage(
  title = paste("NBA Points Distribution By Era"),
  windowTitle = "NBA Points Distribution",
  # tabPanel("2016 Scatter", plotlyOutput("testPlot")),
  # tabPanel("2016 2D Histogram", plotlyOutput("testPlot2")),
  # tabPanel("2016 2D Histogram Contour", plotlyOutput("testPlot3")),
  tabPanel("2010 - 2016", plotlyOutput("h2Dc2010present")),
  tabPanel("2000 - 2009", plotlyOutput("h2Dc20002009")),
  tabPanel("1990 - 1999", plotlyOutput("h2Dc19901999")),
  tabPanel("1980 - 1989", plotlyOutput("h2Dc19801989")),
  tabPanel("1970 - 1979", plotlyOutput("h2Dc19701979")),
  tabPanel("1960 - 1969", plotlyOutput("h2Dc19601969")),
  tabPanel("1950 - 1959", plotlyOutput("h2Dc19501959")),
  tabPanel("1947 - 1949", plotlyOutput("h2Dc19471949")),
  tabPanel("All Time", plotlyOutput("h2DcAllTime")),
  tabPanel("About", uiOutput("About"))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$testPlot <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_2016 <- readRDS(file = "NBA_2016.RData")
     
     # Step 1.5: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     NBA_2016$schedule.PTS <- as.numeric(as.character(NBA_2016$schedule.PTS))
     NBA_2016$schedule.PTS.1 <- as.numeric(as.character(NBA_2016$schedule.PTS.1))
     
     # Step 2: Jitter it
     # NBA_2016$schedule.HomePointsJittered <- jitter(NBA_2016$schedule.PTS)
     # NBA_2016$schedule.AwayPointsJittered <- jitter(NBA_2016$schedule.PTS.1)
     # pointsData <- cbind.data.frame(NBA_2016$schedule.HomePointsJittered, NBA_2016$schedule.AwayPointsJittered)
     pointsData <- cbind.data.frame(NBA_2016$schedule.PTS, NBA_2016$schedule.PTS.1)
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     plot_ly(data = pointsData, 
             # x = ~NBA_2016$schedule.HomePointsJittered,
             # y = ~NBA_2016$schedule.AwayPointsJittered,
             x = ~NBA_2016$schedule.PTS,
             y = ~NBA_2016$schedule.PTS.1,
             type = "scatter",
             mode = "markers",
             width = staticWidth, 
             height = staticHeight,
             alpha = 0.2
             ) %>% layout(xaxis = list(title = "Home Points",
                                       c(40,190)),
                          yaxis = list(title = "Away Points",
                                       c(40, 190)),
                          scene = list(aspectmode = "data",
                                       aspectratio = list(x = 1,
                                                          y = 1))
                          )
   })
   
   output$testPlot2 <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_2016 <- readRDS(file = "NBA_2016.RData")
     
     # Step 1.5: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     NBA_2016$schedule.PTS <- as.numeric(as.character(NBA_2016$schedule.PTS))
     NBA_2016$schedule.PTS.1 <- as.numeric(as.character(NBA_2016$schedule.PTS.1))
     
     # Step 2: Jitter it
     # NBA_2016$schedule.HomePointsJittered <- jitter(NBA_2016$schedule.PTS)
     # NBA_2016$schedule.AwayPointsJittered <- jitter(NBA_2016$schedule.PTS.1)
     # pointsData <- cbind.data.frame(NBA_2016$schedule.HomePointsJittered, NBA_2016$schedule.AwayPointsJittered)
     pointsData <- cbind.data.frame(NBA_2016$schedule.PTS, NBA_2016$schedule.PTS.1)
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     plot_ly(data = pointsData, 
             # x = ~NBA_2016$schedule.HomePointsJittered,
             # y = ~NBA_2016$schedule.AwayPointsJittered,
             x = ~NBA_2016$schedule.PTS,
             y = ~NBA_2016$schedule.PTS.1,
             type = "histogram2d",
             mode = "markers",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             xbins = list(start = 40, end = 190, size = 1),
             ybins = list(start = 40, end = 190, size = 1)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190)),
                  yaxis = list(title = "Away Points",
                               c(40, 190))
     )
   })
   
   output$testPlot3 <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_2016 <- readRDS(file = "NBA_2016.RData")
     
     # Step 1.5: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     NBA_2016$schedule.PTS <- as.numeric(as.character(NBA_2016$schedule.PTS))
     NBA_2016$schedule.PTS.1 <- as.numeric(as.character(NBA_2016$schedule.PTS.1))
     
     # Step 2: Jitter it
     # NBA_2016$schedule.HomePointsJittered <- jitter(NBA_2016$schedule.PTS)
     # NBA_2016$schedule.AwayPointsJittered <- jitter(NBA_2016$schedule.PTS.1)
     # pointsData <- cbind.data.frame(NBA_2016$schedule.HomePointsJittered, NBA_2016$schedule.AwayPointsJittered)
     pointsData <- cbind.data.frame(NBA_2016$schedule.PTS, NBA_2016$schedule.PTS.1)
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     plot_ly(data = pointsData, 
             # x = ~NBA_2016$schedule.HomePointsJittered,
             # y = ~NBA_2016$schedule.AwayPointsJittered,
             x = ~NBA_2016$schedule.PTS,
             y = ~NBA_2016$schedule.PTS.1,
             type = "histogram2dcontour",
             mode = "markers",
             width = staticWidth, 
             height = staticHeight,
             alpha = 1,
             xbins = list(start = 40, end = 190, size = 1),
             ybins = list(start = 40, end = 190, size = 1)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190)),
                  yaxis = list(title = "Away Points",
                               c(40, 190))
     )
   })
   
   output$h2Dc19471949 <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     BAA_1948 <- readRDS(file = "BAA_1948.RData")
     BAA_1949 <- readRDS(file = "BAA_1949.RData")
     gamesList <- list(BAA_1948, BAA_1949)
     
     # Do a full stack merge
     games <- list()
     
     withProgress(message = "Loading data...", value = 0, {
       for(each in 1:length(gamesList)) {
         games <- merge(games, gamesList[each], all = TRUE)
         incProgress(amount = 1/length(gamesList))
         print(1/length(gamesList))
       }
     })
     
     
     # Step 2: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     games$schedule.PTS <- as.numeric(as.character(games$schedule.PTS))
     games$schedule.PTS.1 <- as.numeric(as.character(games$schedule.PTS.1))
     
     pointsData <- cbind.data.frame(games$schedule.PTS, games$schedule.PTS.1)
     
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     numGamesPlayed <- nrow(pointsData)
     
     plot_ly(data = pointsData, 
             x = ~games$schedule.PTS,
             y = ~games$schedule.PTS.1,
             type = "histogram2dcontour",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             hoverinfo = "none",
             ncontours = 10,
             colorbar = list(title = paste("Games Played", HTML("<br>"), "(out of ", numGamesPlayed, " total games)")),
             xbins = list(start = 40, end = 190, size = 5),
             ybins = list(start = 40, end = 190, size = 5)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190),
                               nticks = 16),
                  yaxis = list(title = "Away Points",
                               c(40, 190),
                               nticks = 16),
                  legend = list()
     )
   })
   
   output$h2Dc19501959 <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_1950 <- readRDS(file = "NBA_1950.RData")
     NBA_1951 <- readRDS(file = "NBA_1951.RData")
     NBA_1952 <- readRDS(file = "NBA_1952.RData")
     NBA_1953 <- readRDS(file = "NBA_1953.RData")
     NBA_1954 <- readRDS(file = "NBA_1954.RData")
     NBA_1955 <- readRDS(file = "NBA_1955.RData")
     NBA_1956 <- readRDS(file = "NBA_1956.RData")
     NBA_1957 <- readRDS(file = "NBA_1957.RData")
     NBA_1958 <- readRDS(file = "NBA_1958.RData")
     NBA_1959 <- readRDS(file = "NBA_1959.RData")
     gamesList <- list(NBA_1950, 
                       NBA_1951, 
                       NBA_1952, 
                       NBA_1953, 
                       NBA_1954, 
                       NBA_1955, 
                       NBA_1956, 
                       NBA_1957, 
                       NBA_1958, 
                       NBA_1959)
     
     # Do a full stack merge
     games <- list()
     
     withProgress(message = "Loading data...", value = 0, {
       for(each in 1:length(gamesList)) {
         games <- merge(games, gamesList[each], all = TRUE)
         incProgress(amount = 1/length(gamesList))
       }
     })
     
     
     # Step 2: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     games$schedule.PTS <- as.numeric(as.character(games$schedule.PTS))
     games$schedule.PTS.1 <- as.numeric(as.character(games$schedule.PTS.1))
     
     pointsData <- cbind.data.frame(games$schedule.PTS, games$schedule.PTS.1)
     
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     numGamesPlayed <- nrow(pointsData)
     
     plot_ly(data = pointsData, 
             x = ~games$schedule.PTS,
             y = ~games$schedule.PTS.1,
             type = "histogram2dcontour",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             hoverinfo = "none",
             ncontours = 10,
             colorbar = list(title = paste("Games Played", HTML("<br>"), "(out of ", numGamesPlayed, " total games)")),
             xbins = list(start = 40, end = 190, size = 5),
             ybins = list(start = 40, end = 190, size = 5)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190),
                               nticks = 16),
                  yaxis = list(title = "Away Points",
                               c(40, 190),
                               nticks = 16)
     )
   })
   
   output$h2Dc19601969 <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_1960 <- readRDS(file = "NBA_1960.RData")
     NBA_1961 <- readRDS(file = "NBA_1961.RData")
     NBA_1962 <- readRDS(file = "NBA_1962.RData")
     NBA_1963 <- readRDS(file = "NBA_1963.RData")
     NBA_1964 <- readRDS(file = "NBA_1964.RData")
     NBA_1965 <- readRDS(file = "NBA_1965.RData")
     NBA_1966 <- readRDS(file = "NBA_1966.RData")
     NBA_1967 <- readRDS(file = "NBA_1967.RData")
     NBA_1968 <- readRDS(file = "NBA_1968.RData")
     ABA_1968 <- readRDS(file = "ABA_1968.RData")
     NBA_1969 <- readRDS(file = "NBA_1969.RData")
     ABA_1969 <- readRDS(file = "ABA_1969.RData")
     
     gamesList <- list(NBA_1960, 
                       NBA_1961, 
                       NBA_1962, 
                       NBA_1963, 
                       NBA_1964, 
                       NBA_1965, 
                       NBA_1966, 
                       NBA_1967, 
                       NBA_1968, 
                       ABA_1968,
                       NBA_1969,
                       ABA_1969)
     
     # Do a full stack merge
     games <- list()
     
     withProgress(message = "Loading data...", value = 0, {
       for(each in 1:length(gamesList)) {
         games <- merge(games, gamesList[each], all = TRUE)
         incProgress(amount = 1/length(gamesList))
       }
     })
     
     # Step 2: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     games$schedule.PTS <- as.numeric(as.character(games$schedule.PTS))
     games$schedule.PTS.1 <- as.numeric(as.character(games$schedule.PTS.1))
     
     pointsData <- cbind.data.frame(games$schedule.PTS, games$schedule.PTS.1)
     
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     numGamesPlayed <- nrow(pointsData)
     
     plot_ly(data = pointsData, 
             x = ~games$schedule.PTS,
             y = ~games$schedule.PTS.1,
             type = "histogram2dcontour",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             hoverinfo = "none",
             ncontours = 10,
             colorbar = list(title = paste("Games Played", HTML("<br>"), "(out of ", numGamesPlayed, " total games)")),
             xbins = list(start = 40, end = 190, size = 5),
             ybins = list(start = 40, end = 190, size = 5)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190),
                               nticks = 16),
                  yaxis = list(title = "Away Points",
                               c(40, 190),
                               nticks = 16)
     )
   })
   
   output$h2Dc19701979 <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_1970 <- readRDS(file = "NBA_1970.RData")
     ABA_1970 <- readRDS(file = "ABA_1970.RData")
     NBA_1971 <- readRDS(file = "NBA_1971.RData")
     ABA_1971 <- readRDS(file = "ABA_1971.RData")
     NBA_1972 <- readRDS(file = "NBA_1972.RData")
     ABA_1972 <- readRDS(file = "ABA_1972.RData")
     NBA_1973 <- readRDS(file = "NBA_1973.RData")
     ABA_1973 <- readRDS(file = "ABA_1973.RData")
     NBA_1974 <- readRDS(file = "NBA_1974.RData")
     ABA_1974 <- readRDS(file = "ABA_1974.RData")
     NBA_1975 <- readRDS(file = "NBA_1975.RData")
     ABA_1975 <- readRDS(file = "ABA_1975.RData")
     NBA_1976 <- readRDS(file = "NBA_1976.RData")
     ABA_1976 <- readRDS(file = "ABA_1976.RData")
     NBA_1977 <- readRDS(file = "NBA_1977.RData")
     NBA_1978 <- readRDS(file = "NBA_1978.RData")
     NBA_1979 <- readRDS(file = "NBA_1979.RData")
     
     gamesList <- list(NBA_1970, 
                       ABA_1970,
                       NBA_1971,
                       ABA_1971,
                       NBA_1972,
                       ABA_1972,
                       NBA_1973,
                       ABA_1973,
                       NBA_1974,
                       ABA_1974,
                       NBA_1975,
                       ABA_1975,
                       NBA_1976,
                       ABA_1976,
                       NBA_1977, 
                       NBA_1978, 
                       NBA_1979)
     
     # Do a full stack merge
     games <- list()
     
     withProgress(message = "Loading data...", value = 0, {
       for(each in 1:length(gamesList)) {
         games <- merge(games, gamesList[each], all = TRUE)
         incProgress(amount = 1/length(gamesList))
       }
     })
     
     
     # Step 2: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     games$schedule.PTS <- as.numeric(as.character(games$schedule.PTS))
     games$schedule.PTS.1 <- as.numeric(as.character(games$schedule.PTS.1))
     
     pointsData <- cbind.data.frame(games$schedule.PTS, games$schedule.PTS.1)
     
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     numGamesPlayed <- nrow(pointsData)
     
     plot_ly(data = pointsData, 
             x = ~games$schedule.PTS,
             y = ~games$schedule.PTS.1,
             type = "histogram2dcontour",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             hoverinfo = "none",
             ncontours = 10,
             colorbar = list(title = paste("Games Played", HTML("<br>"), "(out of ", numGamesPlayed, " total games)")),
             xbins = list(start = 40, end = 190, size = 5),
             ybins = list(start = 40, end = 190, size = 5)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190),
                               nticks = 16),
                  yaxis = list(title = "Away Points",
                               c(40, 190),
                               nticks = 16)
     )
   })
   
   output$h2Dc19801989 <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_1980 <- readRDS(file = "NBA_1980.RData")
     NBA_1981 <- readRDS(file = "NBA_1981.RData")
     NBA_1982 <- readRDS(file = "NBA_1982.RData")
     NBA_1983 <- readRDS(file = "NBA_1983.RData")
     NBA_1984 <- readRDS(file = "NBA_1984.RData")
     NBA_1985 <- readRDS(file = "NBA_1985.RData")
     NBA_1986 <- readRDS(file = "NBA_1986.RData")
     NBA_1987 <- readRDS(file = "NBA_1987.RData")
     NBA_1988 <- readRDS(file = "NBA_1988.RData")
     NBA_1989 <- readRDS(file = "NBA_1989.RData")
     gamesList <- list(NBA_1980, 
                       NBA_1981, 
                       NBA_1982, 
                       NBA_1983, 
                       NBA_1984, 
                       NBA_1985, 
                       NBA_1986, 
                       NBA_1987, 
                       NBA_1988, 
                       NBA_1989)
     
     # Do a full stack merge
     games <- list()
     
     withProgress(message = "Loading data...", value = 0, {
       for(each in 1:length(gamesList)) {
         games <- merge(games, gamesList[each], all = TRUE)
         incProgress(amount = 1/length(gamesList))
       }
     })
     
     
     # Step 2: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     games$schedule.PTS <- as.numeric(as.character(games$schedule.PTS))
     games$schedule.PTS.1 <- as.numeric(as.character(games$schedule.PTS.1))
     
     pointsData <- cbind.data.frame(games$schedule.PTS, games$schedule.PTS.1)
     
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working.
     numGamesPlayed <- nrow(pointsData)
     
     plot_ly(data = pointsData, 
             x = ~games$schedule.PTS,
             y = ~games$schedule.PTS.1,
             type = "histogram2dcontour",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             hoverinfo = "none",
             ncontours = 10,
             colorbar = list(title = paste("Games Played", HTML("<br>"), "(out of ", numGamesPlayed, " total games)")),
             xbins = list(start = 40, end = 190, size = 5),
             ybins = list(start = 40, end = 190, size = 5)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190),
                               nticks = 16),
                  yaxis = list(title = "Away Points",
                               c(40, 190),
                               nticks = 16)
     )
   })
   
   output$h2Dc19901999 <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_1990 <- readRDS(file = "NBA_1990.RData")
     NBA_1991 <- readRDS(file = "NBA_1991.RData")
     NBA_1992 <- readRDS(file = "NBA_1992.RData")
     NBA_1993 <- readRDS(file = "NBA_1993.RData")
     NBA_1994 <- readRDS(file = "NBA_1994.RData")
     NBA_1995 <- readRDS(file = "NBA_1995.RData")
     NBA_1996 <- readRDS(file = "NBA_1996.RData")
     NBA_1997 <- readRDS(file = "NBA_1997.RData")
     NBA_1998 <- readRDS(file = "NBA_1998.RData")
     NBA_1999 <- readRDS(file = "NBA_1999.RData")
     gamesList <- list(NBA_1990, 
                       NBA_1991, 
                       NBA_1992, 
                       NBA_1993, 
                       NBA_1994, 
                       NBA_1995, 
                       NBA_1996, 
                       NBA_1997, 
                       NBA_1998, 
                       NBA_1999)
     
     # Do a full stack merge
     games <- list()
     
     withProgress(message = "Loading data...", value = 0, {
       for(each in 1:length(gamesList)) {
         games <- merge(games, gamesList[each], all = TRUE)
         incProgress(amount = 1/length(gamesList))
       }
     })
     
     
     # Step 2: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     games$schedule.PTS <- as.numeric(as.character(games$schedule.PTS))
     games$schedule.PTS.1 <- as.numeric(as.character(games$schedule.PTS.1))
     
     pointsData <- cbind.data.frame(games$schedule.PTS, games$schedule.PTS.1)
     
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     numGamesPlayed <- nrow(pointsData)
     
     plot_ly(data = pointsData, 
             x = ~games$schedule.PTS,
             y = ~games$schedule.PTS.1,
             type = "histogram2dcontour",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             hoverinfo = "none",
             ncontours = 10,
             colorbar = list(title = paste("Games Played", HTML("<br>"), "(out of ", numGamesPlayed, " total games)")),
             xbins = list(start = 40, end = 190, size = 5),
             ybins = list(start = 40, end = 190, size = 5)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190),
                               nticks = 16),
                  yaxis = list(title = "Away Points",
                               c(40, 190),
                               nticks = 16)
     )
   })
   
   output$h2Dc20002009 <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_2000 <- readRDS(file = "NBA_2000.RData")
     NBA_2001 <- readRDS(file = "NBA_2001.RData")
     NBA_2002 <- readRDS(file = "NBA_2002.RData")
     NBA_2003 <- readRDS(file = "NBA_2003.RData")
     NBA_2004 <- readRDS(file = "NBA_2004.RData")
     NBA_2005 <- readRDS(file = "NBA_2005.RData")
     NBA_2006 <- readRDS(file = "NBA_2006.RData")
     NBA_2007 <- readRDS(file = "NBA_2007.RData")
     NBA_2008 <- readRDS(file = "NBA_2008.RData")
     NBA_2009 <- readRDS(file = "NBA_2009.RData")
     gamesList <- list(NBA_2000, 
                       NBA_2001, 
                       NBA_2002, 
                       NBA_2003, 
                       NBA_2004, 
                       NBA_2005, 
                       NBA_2006, 
                       NBA_2007, 
                       NBA_2008, 
                       NBA_2009)
     
     # Do a full stack merge
     games <- list()
     
     withProgress(message = "Loading data...", value = 0, {
       for(each in 1:length(gamesList)) {
         games <- merge(games, gamesList[each], all = TRUE)
         incProgress(amount = 1/length(gamesList))
       }
     })
     
     
     # Step 2: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     games$schedule.PTS <- as.numeric(as.character(games$schedule.PTS))
     games$schedule.PTS.1 <- as.numeric(as.character(games$schedule.PTS.1))
     
     pointsData <- cbind.data.frame(games$schedule.PTS, games$schedule.PTS.1)
     
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     numGamesPlayed <- nrow(pointsData)
     
     plot_ly(data = pointsData, 
             x = ~games$schedule.PTS,
             y = ~games$schedule.PTS.1,
             type = "histogram2dcontour",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             hoverinfo = "none",
             ncontours = 10,
             colorbar = list(title = paste("Games Played", HTML("<br>"), "(out of ", numGamesPlayed, " total games)")),
             xbins = list(start = 40, end = 190, size = 5),
             ybins = list(start = 40, end = 190, size = 5)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190),
                               nticks = 16),
                  yaxis = list(title = "Away Points",
                               c(40, 190),
                               nticks = 16)
     )
   })
   
   output$h2Dc2010present <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     NBA_2010 <- readRDS(file = "NBA_2010.RData")
     NBA_2011 <- readRDS(file = "NBA_2011.RData")
     NBA_2012 <- readRDS(file = "NBA_2012.RData")
     NBA_2013 <- readRDS(file = "NBA_2013.RData")
     NBA_2014 <- readRDS(file = "NBA_2014.RData")
     NBA_2015 <- readRDS(file = "NBA_2015.RData")
     NBA_2016 <- readRDS(file = "NBA_2016.RData")
     
     gamesList <- list(NBA_2010, 
                       NBA_2011, 
                       NBA_2012, 
                       NBA_2013, 
                       NBA_2014, 
                       NBA_2015, 
                       NBA_2016)
     
     # Do a full stack merge
     games <- list()
     
     withProgress(message = "Loading data...", value = 0, {
       for(each in 1:length(gamesList)) {
         games <- merge(games, gamesList[each], all = TRUE)
         incProgress(amount = 1/length(gamesList))
       }
     })
     
     
     # Step 2: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     games$schedule.PTS <- as.numeric(as.character(games$schedule.PTS))
     games$schedule.PTS.1 <- as.numeric(as.character(games$schedule.PTS.1))
     
     pointsData <- cbind.data.frame(games$schedule.PTS, games$schedule.PTS.1)
     
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     numGamesPlayed <- nrow(pointsData)
     
     plot_ly(data = pointsData, 
             x = ~games$schedule.PTS,
             y = ~games$schedule.PTS.1,
             type = "histogram2dcontour",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             hoverinfo = "none",
             ncontours = 10,
             colorbar = list(title = paste("Games Played", HTML("<br>"), "(out of ", numGamesPlayed, " total games)")),
             xbins = list(start = 40, end = 190, size = 5),
             ybins = list(start = 40, end = 190, size = 5)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190),
                               nticks = 16),
                  yaxis = list(title = "Away Points",
                               c(40, 190),
                               nticks = 16)
     )
   })
   
   output$h2DcAllTime <- renderPlotly({
     
     # Step 1: Get the games
     setwd("C:/Users/Ashwin/Dropbox/Side Projects/NBAScores/rawdata")
     BAA_1948 <- readRDS(file = "BAA_1948.RData")
     BAA_1949 <- readRDS(file = "BAA_1949.RData")
     
     NBA_1950 <- readRDS(file = "NBA_1950.RData")
     NBA_1951 <- readRDS(file = "NBA_1951.RData")
     NBA_1952 <- readRDS(file = "NBA_1952.RData")
     NBA_1953 <- readRDS(file = "NBA_1953.RData")
     NBA_1954 <- readRDS(file = "NBA_1954.RData")
     NBA_1955 <- readRDS(file = "NBA_1955.RData")
     NBA_1956 <- readRDS(file = "NBA_1956.RData")
     NBA_1957 <- readRDS(file = "NBA_1957.RData")
     NBA_1958 <- readRDS(file = "NBA_1958.RData")
     NBA_1959 <- readRDS(file = "NBA_1959.RData")
     
     NBA_1960 <- readRDS(file = "NBA_1960.RData")
     NBA_1961 <- readRDS(file = "NBA_1961.RData")
     NBA_1962 <- readRDS(file = "NBA_1962.RData")
     NBA_1963 <- readRDS(file = "NBA_1963.RData")
     NBA_1964 <- readRDS(file = "NBA_1964.RData")
     NBA_1965 <- readRDS(file = "NBA_1965.RData")
     NBA_1966 <- readRDS(file = "NBA_1966.RData")
     NBA_1967 <- readRDS(file = "NBA_1967.RData")
     NBA_1968 <- readRDS(file = "NBA_1968.RData")
     ABA_1968 <- readRDS(file = "ABA_1968.RData")
     NBA_1969 <- readRDS(file = "NBA_1969.RData")
     ABA_1969 <- readRDS(file = "ABA_1969.RData")
     
     NBA_1970 <- readRDS(file = "NBA_1970.RData")
     ABA_1970 <- readRDS(file = "ABA_1970.RData")
     NBA_1971 <- readRDS(file = "NBA_1971.RData")
     ABA_1971 <- readRDS(file = "ABA_1971.RData")
     NBA_1972 <- readRDS(file = "NBA_1972.RData")
     ABA_1972 <- readRDS(file = "ABA_1972.RData")
     NBA_1973 <- readRDS(file = "NBA_1973.RData")
     ABA_1973 <- readRDS(file = "ABA_1973.RData")
     NBA_1974 <- readRDS(file = "NBA_1974.RData")
     ABA_1974 <- readRDS(file = "ABA_1974.RData")
     NBA_1975 <- readRDS(file = "NBA_1975.RData")
     ABA_1975 <- readRDS(file = "ABA_1975.RData")
     NBA_1976 <- readRDS(file = "NBA_1976.RData")
     ABA_1976 <- readRDS(file = "ABA_1976.RData")
     NBA_1977 <- readRDS(file = "NBA_1977.RData")
     NBA_1978 <- readRDS(file = "NBA_1978.RData")
     NBA_1979 <- readRDS(file = "NBA_1979.RData")
     
     NBA_1980 <- readRDS(file = "NBA_1980.RData")
     NBA_1981 <- readRDS(file = "NBA_1981.RData")
     NBA_1982 <- readRDS(file = "NBA_1982.RData")
     NBA_1983 <- readRDS(file = "NBA_1983.RData")
     NBA_1984 <- readRDS(file = "NBA_1984.RData")
     NBA_1985 <- readRDS(file = "NBA_1985.RData")
     NBA_1986 <- readRDS(file = "NBA_1986.RData")
     NBA_1987 <- readRDS(file = "NBA_1987.RData")
     NBA_1988 <- readRDS(file = "NBA_1988.RData")
     NBA_1989 <- readRDS(file = "NBA_1989.RData")
     
     NBA_1990 <- readRDS(file = "NBA_1990.RData")
     NBA_1991 <- readRDS(file = "NBA_1991.RData")
     NBA_1992 <- readRDS(file = "NBA_1992.RData")
     NBA_1993 <- readRDS(file = "NBA_1993.RData")
     NBA_1994 <- readRDS(file = "NBA_1994.RData")
     NBA_1995 <- readRDS(file = "NBA_1995.RData")
     NBA_1996 <- readRDS(file = "NBA_1996.RData")
     NBA_1997 <- readRDS(file = "NBA_1997.RData")
     NBA_1998 <- readRDS(file = "NBA_1998.RData")
     NBA_1999 <- readRDS(file = "NBA_1999.RData")
     
     NBA_2000 <- readRDS(file = "NBA_2000.RData")
     NBA_2001 <- readRDS(file = "NBA_2001.RData")
     NBA_2002 <- readRDS(file = "NBA_2002.RData")
     NBA_2003 <- readRDS(file = "NBA_2003.RData")
     NBA_2004 <- readRDS(file = "NBA_2004.RData")
     NBA_2005 <- readRDS(file = "NBA_2005.RData")
     NBA_2006 <- readRDS(file = "NBA_2006.RData")
     NBA_2007 <- readRDS(file = "NBA_2007.RData")
     NBA_2008 <- readRDS(file = "NBA_2008.RData")
     NBA_2009 <- readRDS(file = "NBA_2009.RData")
     
     NBA_2010 <- readRDS(file = "NBA_2010.RData")
     NBA_2011 <- readRDS(file = "NBA_2011.RData")
     NBA_2012 <- readRDS(file = "NBA_2012.RData")
     NBA_2013 <- readRDS(file = "NBA_2013.RData")
     NBA_2014 <- readRDS(file = "NBA_2014.RData")
     NBA_2015 <- readRDS(file = "NBA_2015.RData")
     NBA_2016 <- readRDS(file = "NBA_2016.RData")
     
     gamesList <- list(BAA_1948,
                       BAA_1949,
                       
                       NBA_1950,
                       NBA_1951,
                       NBA_1952,
                       NBA_1953,
                       NBA_1954,
                       NBA_1955,
                       NBA_1956,
                       NBA_1957,
                       NBA_1958,
                       NBA_1959,
                       
                       NBA_1960, 
                       NBA_1961, 
                       NBA_1962, 
                       NBA_1963, 
                       NBA_1964, 
                       NBA_1965, 
                       NBA_1966, 
                       NBA_1967, 
                       NBA_1968, 
                       ABA_1968,
                       NBA_1969,
                       ABA_1969,
                       
                       NBA_1970, 
                       ABA_1970,
                       NBA_1971,
                       ABA_1971,
                       NBA_1972,
                       ABA_1972,
                       NBA_1973,
                       ABA_1973,
                       NBA_1974,
                       ABA_1974,
                       NBA_1975,
                       ABA_1975,
                       NBA_1976,
                       ABA_1976,
                       NBA_1977, 
                       NBA_1978, 
                       NBA_1979,
                       
                       NBA_1980,
                       NBA_1981,
                       NBA_1982,
                       NBA_1983,
                       NBA_1984,
                       NBA_1985,
                       NBA_1986,
                       NBA_1987,
                       NBA_1988,
                       NBA_1989,
                       
                       NBA_1990,
                       NBA_1991,
                       NBA_1992,
                       NBA_1993,
                       NBA_1994,
                       NBA_1995,
                       NBA_1996,
                       NBA_1997,
                       NBA_1998,
                       NBA_1999,
                       
                       NBA_2000,
                       NBA_2001,
                       NBA_2002,
                       NBA_2003,
                       NBA_2004,
                       NBA_2005,
                       NBA_2006,
                       NBA_2007,
                       NBA_2008,
                       NBA_2009,
                       
                       NBA_2010, 
                       NBA_2011, 
                       NBA_2012, 
                       NBA_2013, 
                       NBA_2014, 
                       NBA_2015, 
                       NBA_2016)
     
     # Do a full stack merge
     games <- list()
     
     withProgress(message = "Loading data...", value = 0, {
       for(each in 1:length(gamesList)) {
         games <- merge(games, gamesList[each], all = TRUE)
         incProgress(amount = 1/length(gamesList))
       }
     })
     
     # Step 2: Fixing the points columns so R doesn't keep getting pissed off that they are levels, not numerics
     games$schedule.PTS <- as.numeric(as.character(games$schedule.PTS))
     games$schedule.PTS.1 <- as.numeric(as.character(games$schedule.PTS.1))
     
     pointsData <- cbind.data.frame(games$schedule.PTS, games$schedule.PTS.1)
     
     # Step 3: Plot it
     # screw it, i'm using plotly. Sick of ggplot2 not working. 
     numGamesPlayed <- nrow(pointsData)
     
     plot_ly(data = pointsData, 
             x = ~games$schedule.PTS,
             y = ~games$schedule.PTS.1,
             type = "histogram2dcontour",
             alpha = 1,
             width = staticWidth, 
             height = staticHeight,
             hoverinfo = "none",
             colorbar = list(title = paste("Games Played", HTML("<br>"), "(out of ", numGamesPlayed, " total games)")),
             xbins = list(start = 40, end = 190, size = 5),
             ybins = list(start = 40, end = 190, size = 5)
     ) %>% layout(xaxis = list(title = "Home Points",
                               c(40,190),
                               nticks = 16),
                  yaxis = list(title = "Away Points",
                               c(40, 190),
                               nticks = 16)
     )
   })
   
   output$About <- renderUI({
     HTML("<b>Created by Ashwin Sundar.</b>
          <br>
          <b><a href='mailto:ashiundar@gmail.com?subject= Feedback on NBA Points Distribution R Shiny Application'>Feedback</a></b>
          <br>
          <br>
          <b>Tools Used:</b>
          <br>
          <a href = 'https://www.rstudio.com/'>RStudio</a>
          <br>
          <a href = 'https://www.rstudio.com/products/shiny/'>Shiny</a>
          <br>
          <a href = 'https://plot.ly/'>Plotly</a>
          <br>
          <a href = 'https://cran.r-project.org/web/packages/XML/index.html'>XML</a>
          <br>
          <a href = 'http://www.basketball-reference.com/'>basketball-reference.com</a>")
   })
}

# Run the application 
shinyApp(ui = ui, server = server)
