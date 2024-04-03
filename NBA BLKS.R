# Load library and inport data
install.packages("tidyverse")
library(tidyverse)
nba_data <- read_csv("2021 NBA Player Stats.csv")

# Display the first few rows of the dataset and display summary
head(nba_data)
summary(nba_data)

# Sort the data by BLK
nba_data$BLK <- as.numeric(nba_data$BLK)
sorted_data <- nba_data[order(-nba_data$BLK),]

# Select the top 5 players and print them
top_players <- head(sorted_data, 5)
cat("Top 5 Players with the highest blocks:\n")
print(top_players)

# Create the bar chart
par(mar = c(6, 6, 7, 1))  # Adjust the margins as needed
barplot(top_players$BLK, names.arg = top_players$Player, col = "brown",
        main = "Top 5 Players by Blocks", xlab = "Player", ylab = "Blocks", border = "black",
        cex.names = 0.5, width = 0.6)  