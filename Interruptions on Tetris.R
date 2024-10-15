# Load necessary libraries
library(ggplot2)

# Reading the dataset
tetris_data <- read.csv("C:/Users/dhane/Downloads/tetris.csv")

# Viewing some rows to understand the data
head(tetris_data)
tail(tetris_data)

# Converting unique values under 'condition' to a factor
tetris_data$condition <- factor(tetris_data$condition)

# Checking the levels
levels(tetris_data$condition)

# Subsetting data for auditory and visual conditions
auditory <- subset(tetris_data, condition == "auditory")
visual <- subset(tetris_data, condition == "visual")

# Function for descriptive statistics
calculate_summary <- function(x) {
  vmean <- mean(x)
  vmedian <- median(x)
  vvar <- var(x)
  vsd <- sd(x)
  vn <- length(x)
  vmin <- min(x)
  vmax <- max(x)
  vIQR <- IQR(x)
  
  return(list(min = vmin, max = vmax, mean = vmean, median = vmedian, var = vvar, sd = vsd, IQR = vIQR, N = vn))
}

# Calling the function to display descriptive statistics
calculate_summary(tetris_data$score)
calculate_summary(auditory$score)
calculate_summary(visual$score)

# Plotting boxplots for each condition and overall scores
boxplot(tetris_data$score, main = "Boxplot of Tetris Scores", ylim = c(0, 100), ylab = "Score", col = c("#940B92", "#DA0C81"))
boxplot(tetris_data$score ~ tetris_data$condition, main = "Boxplot of Tetris Scores by Condition", ylim = c(0, 100), xlab = "Condition", ylab = "Score", col = c("#940B92", "#DA0C81"))

# Plotting histograms for auditory and visual conditions using ggplot2
ggplot() +
  geom_histogram(data = auditory, aes(x = score, fill = "Auditory"), binwidth = 10, alpha = 0.7) +
  geom_histogram(data = visual, aes(x = score, fill = "Visual"), binwidth = 10, alpha = 0.7) +
  labs(x = "Tetris Scores", y = "Frequency", title = "Histograms of Tetris Scores by Condition") +
  scale_fill_manual(values = c("Auditory" = "#940B92", "Visual" = "#DA0C81")) +
  theme_minimal() + theme(panel.background = element_rect(fill = "#FCEDE6"), plot.background = element_rect(fill = "#FCEDE6"))


# Checking assumptions for a t-test
shapiro.test(auditory$score)
shapiro.test(visual$score)

# Checking equality of variance using Levene's test
library('car')
leveneTest(tetris_data$score, tetris_data$condition)

# Running t-test
t_test_result <- t.test(auditory$score, visual$score, paired = FALSE)

# Printing t-test result
print(t_test_result)

# Creating objects to hold mean and standard deviation for plotting error bars
tetris_data_mean <- c(mean(auditory$score), mean(visual$score))
tetris_data_sd <- c(sd(auditory$score), sd(visual$score))

# Labeling means
names(tetris_data_mean) <- c("Auditory", "Visual")

# Plotting the bar plot with error bars
barplot(tetris_data_mean, main = "Graph of Condition Means", xlab = "Interruption", ylab = "Tetris Score", ylim = c(0, 100), col = c("#940B92", "#DA0C81"),border = "white")
se.bar(barplot(tetris_data_mean), tetris_data_mean, tetris_data_sd, 32)


