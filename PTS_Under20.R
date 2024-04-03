# Load library and inport data
install.packages("tidyverse")
library(tidyverse)
nba_data <- read_csv("2021 NBA Player Stats.csv")

# Display the first few rows of the dataset and summary
head(nba_data)
summary(nba_data)

# Filter the data for players who have played under 20 minutes per game
filtered_data <- nba_data[nba_data$MP < 20,]

# Sort the filtered data by PTS (make sure 'PTS' is numeric)
filtered_data$PTS <- as.numeric(filtered_data$PTS)
sorted_data <- filtered_data[order(-filtered_data$PTS),]

# Select the top 5 players
top_5_players <- head(sorted_data, 5)

# Sort the filtered data by PTS (make sure 'PTS' is numeric)
filtered_data$PTS <- as.numeric(filtered_data$PTS)
sorted_data <- filtered_data[order(-filtered_data$PTS),]

# Select the top 5 players
top_5_players <- head(sorted_data, 5)

# Create a dotplot of PTS with minutes per game for the top 5 players
dotchart(top_5_players$PTS, labels = top_5_players$Player, cex = 1.2,
         main = "Top 5 Players by PTS (Below Average Minutes)",
         xlab = "PTS", ylab = "",
         pch = 16, col = "darkred")

# Add text labels for minutes per game
text(top_5_players$PTS, seq_along(top_5_players$Player), labels = paste(top_5_players$MP, "MP"), 
     pos = ifelse(seq_along(top_5_players$Player) == 1, 2, 4), col = "black")
