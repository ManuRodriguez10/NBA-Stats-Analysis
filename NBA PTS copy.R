# Load library and inport data
install.packages("tidyverse")
library(tidyverse)
nba_data <- read_csv("2021 NBA Player Stats.csv")

# Display the first few rows of the dataset and display summary
head(nba_data)
summary(nba_data)

# Sort the data by PTS
nba_data$PTS <- as.numeric(nba_data$PTS)
sorted_data <- nba_data[order(-nba_data$PTS),]

# Select the top 5 players and print them
top_players <- head(sorted_data, 5)
cat("Top 5 Players with the highest points:\n")
print(top_players)

# Create the dotplot
dotchart(rev(top_players$PTS), labels = rev(top_players$Player), cex = 1,
         main = "Top 5 Players by Points",
         xlab = "Points Per Game", ylab = "",
         pch = 16, col = "darkblue", xlim = c(0, max(top_players$PTS) + 2))

# Add labels with games played next to the dots
text(rev(top_players$PTS), seq_along(top_players$Player),
     labels = paste(" (GP:", (top_players$G), ")"), col = "black", pos = 3)
