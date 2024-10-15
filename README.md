# Interrupting Tetris: Investigating the Impact of Sound and Visual Distraction

## Overview
This project investigates the effects of auditory and visual interruptions on gameplay performance in Tetris. Conducted with 64 participants, the study aims to analyze whether different types of interruptions significantly affect Tetris scores.

### Experimental Hypothesis
 There is a statistically significant difference in the effect of visual interruptions and audio interruptions on participants' Tetris gameplay performance.

## Data Collection
The dataset (`tetris.csv`) contains scores recorded automatically by the game, with scores ranging from 0 (lowest) to 100 (highest). Participants were divided into two groups based on the type of interruption experienced during gameplay:
- **Auditory Interruptions**: Participants heard a spoken advertisement and sound effects.
- **Visual Interruptions**: Participants saw a flashing banner with a fake advertisement.

## Analysis Methodology
The analysis involves several key steps, all performed using R:

1. **Data Cleaning**: Preparation of the dataset for analysis.
2. **Descriptive Statistics**: Calculation of means, medians, variances, and standard deviations for scores under each condition.
3. **Inferential Statistics**: Conducting hypothesis tests, including t-tests, to determine significant differences in scores.
4. **Graph Generation**: Creating boxplots and histograms to visualize score distributions.

### R Script Components
The R script (`Interruptions on Tetris.R`) includes the following key sections:

- **Loading Necessary Libraries**:
  ```r
  library(ggplot2)
## Visualizations

## Boxplot of Tetris Scores by Condition
 Boxplot showing the distribution of Tetris scores for auditory and visual interruption conditions. The boxplot indicates that scores in the auditory condition are higher compared to the visual condition.

![66bd70b4-f98e-4648-9b17-5ba54b49f990](https://github.com/user-attachments/assets/eb72aeea-0ca9-46c1-bb96-bf5fce86f667)
## Histograms of Tetris Scores by Condition
 Histograms illustrating the distribution of Tetris scores for participants under auditory and visual conditions. The histogram for auditory interruptions shows a skew toward higher scores, while the visual condition favors lower scores.
 
![13f6b44d-9bc6-4a24-af21-4aaecc7c5a69](https://github.com/user-attachments/assets/40cb4bd0-ec70-4749-bf23-9c2e75346a0b)

