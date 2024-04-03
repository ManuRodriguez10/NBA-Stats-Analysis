# Load library and inport data
install.packages("tidyverse")
library(tidyverse)
nba_data <- read_csv("2021 NBA Player Stats.csv")

# Display the first few rows of the dataset and display summary
head(nba_data)
summary(nba_data)

# Sort the data by TRB
nba_data$TRB <- as.numeric(nba_data$TRB)
sorted_data <- nba_data[order(-nba_data$TRB),]

# Select the top 5 players and print them
top_players <- head(sorted_data, 5)
cat("Top 5 Players with the highest rebounds:\n")
print(top_players)

# Create the bar chart
par(mar = c(6, 6, 7, 1))  # Adjust the margins as needed
barplot(top_players$TRB, names.arg = top_players$Player, col = "pink",
        main = "Top 5 Players by Rebounds", xlab = "Player", ylab = "Rebounds", border = "black",
        cex.names = 0.4, width = 0.6)  