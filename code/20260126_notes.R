#Notes From R Lesson Jan 26, 2026
#Learn How To Plot In R with ggplot2

#load packages
library(tidyverse)

#load data
sample_data <- read_csv(file = "sample_data.csv")

#no inputs or arguments needed
Sys.Date()
getwd()

#functions require input
sum(10, 12)
round(3.1415)

#identify specific arguments
round(3.1415, digits = 3)

#add question mark for help page

#plot
ggplot(data=sample_data) +
  aes(x = temperature, y = cells_per_ml) +
  labs(x = "Temperature (C) ", y = "Cells per mL") +
geom_point()  +
  labs(title = "Does Temperature Affect Microbial Abundance?") +
  aes(color = env_group) +
  aes(size = chlorophyll) +
  labs(size = "Chlorophyll (ug/L)",
     color = "Environmental Group")


buoy_data <- read_csv(file = "buoy_data.csv")
#number of rows and columns 
dim(buoy_data)
#look at top of data-set
head(buoy_data)

#plot
ggplot(data = buoy_data) +
  aes(x = day_of_year, y = temperature, group = sensor, color = depth) +
  geom_line() + 
  facet_wrap(~buoy)
  #facet_grid(rows = vars(buoy))

#structure of data
str(buoy_data)

#back sample_data
ggplot(data = sample_data) +
  #x-axis that is discrete: categorical
  aes(x = env_group, y = cells_per_ml, fill = env_group) +
  #geom_point()
  geom_jitter(shape = 25, alpha = 0.8, aes(size = chlorophyll, color = env_group)) +
  geom_boxplot(alpha = 0.2, aes(fill = env_group), outliers = FALSE)
  #scale_fill_manual(values = c("blue", "orange","purple"))
  #using packages for colors
  scale_fill_brewer(palette = "Set1")
  #order of code matters
  
#uni-variate plot
ggplot(sample_data) +
  aes(x = cells_per_ml) +
  geom_histogram(bins=20) +
  theme_classic()

#saving plots
ggsave("histogram_cellsPerML.png", width = 6, height = 4, units = "in")

#chlorophyll and temp relationship
ggplot(data=sample_data) +
  aes(x = temperature, y = chlorophyll, color = env_group, size = depth) +
  labs(x = "Temperature (C)", y = "Chlorophyll (ug/L)", 
       title = "Chlorophyll and Temp Relationship") +
  #labs(aes(color = "Environmental Group", size = "Depth"))
  theme_bw() +
  geom_point()
 
    
#plot themes
ggplot(data = sample_data) +
  aes(x = env_group, y = cells_per_ml) +
  geom_boxplot() +
  theme_classic()

#load packages
library(tidyverse)

#load data
sample_data <- read_csv("data/sample_data.csv")

#summarize data
sample_data %>%
  summarize(mean_cells=mean(cells_per_ml),
          max_cells=max(cells_per_ml),
          min_cells=min(cells_per_ml))

#Load Packages
library(tidyverse)

#Load Data
sample_data <- read_csv(file = "data/sample_data.csv")

#How Nitrogen Impacts The Microbial Cell Abundances
ggplot(data = sample_data) +
  aes(x = total_nitrogen, y = cells_per_ml, 
      size = temperature, color = env_group) +
  labs(x = "Total Nitrogen (mg/L)", y = "Cells per mL", 
       title = "Nitrogen and Cell Abundance Relationship") +
  geom_point() + 
  geom_smooth(method = "lm", se = TRUE)

#How Phosphorus Impacts The Microbial Cell Abundances
ggplot(data = sample_data) +
  aes(x = total_phosphorus, y = cells_per_ml, 
      size = temperature, color = env_group) +
  labs(x = "Total Phosphorus (mg/L)", y = "Cells per mL", 
       title = "Phosphorus and Cell Abundance Relationship") +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE)
