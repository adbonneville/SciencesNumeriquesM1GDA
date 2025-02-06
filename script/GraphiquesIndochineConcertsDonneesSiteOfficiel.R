## PACKAGE INSTALLATION & DATA

# Install necessary package for the project
install.packages("plotly")

# Load the required library for interactive plotting
library(plotly)
library(ggplot2)

# Create a line plot using data from a CSV file
tabledata <- read.csv("data/csv/IndochineTournees_DonneesSiteOfficielIndochine.csv")
plot <- plot_ly(x = tabledata$Tournees,
                y = tabledata$weight,
                type = "scatter",
                size = tabledata$weight,
                mode = "markers") %>%
  # Customize the layout of the plot
  layout(
    title = "Les tournées d'Indochine de 1981 à aujourd'hui<br>Données reprises du site officiel - indo.fr - Adrien Bonneville",
    xaxis = list(title = "Nom des tournées par ordre alphabétique"),
    yaxis = list(title = "Nombre de concerts par tournées"),
    legend = list(title = list(text = "Légende"))
  )
plot

# Create a line plot using data from a CSV file
tabledata <- read.csv("data/csv/IndochineTournees_DonneesSiteOfficielIndochine.csv")
plot <- plot_ly(x = tabledata$Tournees,
                y = tabledata$weight,
                type = "bar") %>%
  # Customize the layout of the plot
  layout(
    title = "Les tournées d'Indochine de 1981 à aujourd'hui<br>Données reprises du site officiel - indo.fr - Adrien Bonneville",
    xaxis = list(title = "Nom des tournées par ordre alphabétique"),
    yaxis = list(title = "Nombre de concerts par tournées"),
    legend = list(title = list(text = "Légende"))
  )
plot

# Create a line plot using data from a CSV file
tabledata2 <- read.csv("data/csv/IndochineVilles_DonneesSiteOfficielIndochine.csv")
plot <- plot_ly(x = tabledata2$Villes,
                y = tabledata2$weight,
                type = "bar") %>%
  # Customize the layout of the plot
  layout(
    title = "Les villes fréquentées par Indochine de 1981 à aujourd'hui<br>Données reprises du site officiel - indo.fr - Adrien Bonneville",  
    xaxis = list(title = "Nom des villes par ordre alphabétique"),  
    yaxis = list(title = "Nombre de concerts par villes"),  
    legend = list(title = list(text = "Légende"))  
  )
plot

# Create a line plot using data from a CSV file
tabledata2 <- read.csv("data/csv/IndochineVilles_DonneesSiteOfficielIndochine.csv")
plot <- plot_ly(x = tabledata2$Villes,
                y = tabledata2$weight,
                type = "scatter",
                size = tabledata2$weight,
                mode = "markers") %>%
  # Customize the layout of the plot
  layout(
    title = "Les villes fréquentées par Indochine de 1981 à aujourd'hui<br>Données reprises du site officiel - indo.fr - Adrien Bonneville",
    xaxis = list(title = "Nom des villes par ordre alphabétique"),
    yaxis = list(title = "Nombre de concerts par villes"),
    legend = list(title = list(text = "Légende")) 
  )
plot

###################
## Explanation: ##
##################

##Install necessary package: The install.packages command (commented out) suggests installing the plotly library.

## Load library: The library command loads the plotly package into the R session.

## Define sample data: Three vectors x, y, and y3 are defined with numerical values.

## Create a basic line plot:
## The plot_ly function initializes a plot.
## x = c(1, 2, 3): Sets the x-axis values.
## y = c(4, 5, 6): Sets the y-axis values.
## type = "scatter": Specifies that the plot is a scatter plot.
## mode = "lines": Specifies that the points should be connected with lines.

## Create a line plot using data from a CSV file:
##  The read.csv function reads data from a CSV file and stores it in table_example_2.
##  The plot_ly function creates a line plot using column1 from the dataset for both x and y axes.
##  plot stores the plot object, and plot renders it.

## Create a basic scatter plot:
##  Similar to the line plot but with mode = "markers" to show individual points without connecting lines.

## Create a basic bar plot:
##  The plot_ly function initializes a bar plot with specified x and y values.
##  type = "bar": Specifies that the plot is a bar plot.

## Create a bubble chart:
##  The plot_ly function initializes a scatter plot.
##  mode = "markers": Specifies that individual points should be shown.
##  size = c(2, 6, 9): Sets the size of the points.
##  marker = list(color = c("red", "black", "yellow")): Specifies the colors of the points.

## Create an area plot:
##  The plot_ly function initializes a scatter plot.
##  fill = "tozeroy": Fills the area under the lines down to the y=0 line.