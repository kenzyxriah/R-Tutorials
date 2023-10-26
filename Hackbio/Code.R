library(tidyverse)

url <- "https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/datasets/Contests/Viz/datasets/fig_One_a_e.dat"

x <- "/cloud/project/Hackbio/fig_One_a_e.dat"
x

#Downloading the dataset needed for visualization
download.file(url, destfile = x)

# Read the data into your environment
fig_data <- read.table(x, header= T, sep = '\t')

#Converting the table to a more convenient data holder, a Tibble
fig_tib <- as.tibble(fig_data)
head(fig_tib, 5)
# Dataset Previewing

colnames(fig_tib) #This returns the no of columns in the given dataset

glimpse(fig_tib) #Returns a glimpse view of our dataset, as the name suggests

summary(fig_data) #Returns a descriptive summary of the entire dataset

# We get a statistical overview of the dataset. 
#A majority of the  columns are of number types with only one column/variable being chr
# I want to explore that column

tech <- fig_tib$tech
tech

install.packages('janitor')
library(janitor)

tabyl(tech)

1. # PROBLEM 1
# Set up a plot
tech_colors <- rainbow(10) #Setting the colors of the unique labels of each group that are subjecting to the plot arguments
# rainbow(n) is equal to 10 because we have 10 groups

?geom_line() # Understanding the geom function we are working on

ggplot(fig_tib, aes(x= depth, y = Unique_nr_frag_in_regions, color = tech)) +
  geom_line() +
    scale_color_manual(values = tech_colors) + ylim(0, 11500)+
  labs(title = 'Fig 1a', x = "Sequencing Depth", y = "Unique Fragments in Peaks") +
  theme(legend.position = 'bottom') +
  theme(plot.title = element_text(hjust = 0.5)) # This centralizes the plot title
# facet_wrap(~tech)

colnames(fig_tib)

# PROBLEM 2
ggplot(fig_tib, aes(x= depth, y = TSS_enrichment, color = tech)) +
  geom_line() + 
  scale_color_manual(values = tech_colors) + 
  labs(title = 'Fig 1b', x = "Sequencing Depth", y = "Enrichment Peak") +
  theme(legend.position = 'bottom') +
  theme(plot.title = element_text(hjust = 0.5))

#PROBLEM 3

ggplot(fig_tib, aes(x= depth, y = X._unique_nr_frag_in_regions_in_cells, color = tech)) +
  geom_line() +
  scale_color_manual(values = tech_colors) +
  labs(title = 'Fig 1c', x = "Sequencing Depth", y = "Sequencing Depth Efficiency") +
  theme(legend.position = 'bottom') +
  theme(plot.title = element_text(hjust = 0.5)) # This centralizes the plot title


# PROBLEM 4
ggplot(fig_tib, aes(x= depth, y = median_cell_type_pred_score, color = tech)) +
  geom_line() + ylim(0, 0.85) +
  scale_color_manual(values = tech_colors) +
  labs(title = 'Fig 1d', x = "Sequencing Depth", y = "Median Seurat Score") +
  theme(legend.position = 'bottom') +
  theme(plot.title = element_text(hjust = 0.5))

# PROBLEM 5
ggplot(fig_tib, aes(x= depth, y = fc__B_cell, color = tech)) +
  geom_line() + ylim(0, 40) +
  scale_color_manual(values = tech_colors) + 
  labs(title = 'Fig 1e', x = "Sequencing Depth", y = "BCell Strength (FC)") +
  theme(legend.position = 'bottom') +
  theme(plot.title = element_text(hjust = 0.5))

























































































