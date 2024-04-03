# Load library and inport data
install.packages("tidyverse")
library(tidyverse)
nba_data <- read_csv("2021 NBA Player Stats.csv")

# Display the first few rows of the dataset and summary
head(nba_data)
summary(nba_data)

#Make sure the data is only for Bucks and Suns Players
selected_teams <- c("MIL", "PHO")
filtered_data <- nba_data[nba_data$Tm %in% selected_teams, ]

#Adjust data to PTS and select the top 5 players
filtered_data$PTS <- as.numeric(filtered_data$PTS)
sorted_data <- filtered_data[order(-filtered_data$PTS),]
top_players <- head(sorted_data, 5)
cat("Top 5 Players from the Milwaukee Bucks or Phoenix Suns with the highest points:\n")
print(top_players)

#Create bar chart
par(mar = c(6, 6, 7, 1))  
barplot(top_players$PTS, names.arg = top_players$Player,
        col = ifelse(top_players$Tm == "MIL", "darkgreen", "purple"), #Bar is purple for Suns players and green for Bucks players
        main = "Top 5 Players by PTS (NBA Finals)", xlab = "Player", ylab = "PTS", border = "black",
        cex.names = 0.5, width = 0.6) 
