# Visualizing NBA Pace
## Ashwin Sundar

I saw <a href = "https://www.reddit.com/r/dataisbeautiful/comments/61rl0r/the_resulting_scores_of_15741_american_football/">this post</a>
by /u/zonination and knew immediately that I need to recreate this for the NBA. However, I had a few things going against me. Unlike football-reference.com,
basketball-reference.com doesn't have one single page containing every single game that's ever been played. Rather, it is split up into
season and months. And that's because over 58 <b>thousand</b> NBA/ABA/BAA games have been played since the inception of professional basketbal
in 1946. This presented a unique challenge - I needed to create a table that had the outcomes of every single basketball game that's ever been
played. And that's exactly what I did - I wrote an R script (getNBAgames.R) that builds a key-value pair of season:months, builds the URL where
the games for that month are located, and then goes to that URL, gets the HTML table, converts it to a dataframe, and saves it as an .RData object. 
Then, I load the .RData objects into my Shiny app and feed the data into Plotly to generate heatmaps of the data. 

The result is that I can visualize the pace of the game in a way that has never been done before - by era. I always here talks of how the 60s had an 
unusually fast pace (based on raw numbers), but now you can actually <b>see</b> how much faster the game was back then! Likewise, you can see
how lopsided matches were - an oval distribution about the diagonal indicates relatively close matches, while a more circular shape indicates more lopsided victories.

This project took me much longer than I expected, but I am very pleased with the result. The key was switching from ggplot2 to plotly - I was able to render much
nicer looking graphs with a lot less effort. I also learned how to finally make sweet loading bars! Future work includes parallelizing the for
loop in the "All time" tab, but to be honest loading 50k+ data points in about 15 seconds is pretty decent, so I'm not too compelled to make this improvement. 

Another thing I want to add is an adjustable time-series slider so a user can pick whatever date range they'd like and see what the pace of the 
game was for their custom era. 

Tools Used: 
<br>
<a href = 'https://www.rstudio.com/'>RStudio</a>
<br>
<a href = 'https://www.rstudio.com/products/shiny/'>Shiny</a>
<br>
<a href = 'https://plot.ly/'>Plotly</a>
<br>
<a href = 'https://cran.r-project.org/web/packages/XML/index.html'>XML</a>
<br>
<a href = 'http://www.basketball-reference.com/'>basketball-reference.com</a>
