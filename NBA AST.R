# Load library and inport data
install.packages("tidyverse")
library(tidyverse)
nba_data <- read_csv("2021_Stats.csv")

# Display the first few rows of the dataset and display summary
head(nba_data)
summary(nba_data)

# Sort the data by AST
nba_data$AST <- as.numeric(nba_data$AST)
sorted_data <- nba_data[order(-nba_data$AST),]

# Select the top 5 players and print them
top_players <- head(sorted_data, 5)
cat("Top 5 Players with the highest assists:\n")
print(top_players)

# Create the bar chart
par(mar = c(6, 6, 7, 1))  # Adjust the margins as needed
barplot(top_players$AST, names.arg = top_players$Player, col = "coral",
        main = "Top 5 Players by AST", xlab = "Player", ylab = "AST", border = "black",
        cex.names = 0.5, width = 0.6)  