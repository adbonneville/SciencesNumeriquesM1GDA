## Install necessary packages for the project
install.packages("leaflet")
install.packages("sp")
install.packages("sf")

# Load the required libraries for mapping and spatial data manipulation
library(leaflet)
library(sp)
library(sf)

# Load the shapefile and name it 'cities'
cities <- st_read('data/shp/LienTourneesIndochineDonneesSiteOfficielV4/LiensTourneesIndochineDonneesSiteOfficielV4.shp')

# Read the CSV file containing data
data <- read.csv("data/csv/nodes_IndochineConcerts_DonneesSiteOfficielIndochine.csv")

custom_icons <- awesomeIcons(
  icon = "music", 
  library = "fa", # Utilise les icônes Font Awesome
  markerColor = ~ifelse(role == "Ville", "blue",
                        ifelse(role == "Tournee", "red",
                               ifelse(role == "Autre", "green", "gray"))),
  iconColor = "white"  # Couleur de l’icône (garde le contraste)
)

# Initialize the leaflet map with the shapefile data
map <- leaflet(cities) %>% 
  ## Add the base map layer
  ##addTiles() %>%
  ## Example of a base map using OpenStreetMap tiles
  addProviderTiles(providers$OpenStreetMap)  %>% 
  
  ## Another example of a base map using Stamen Toner tiles (commented out)
  ##addProviderTiles(providers$Stamen.Toner)  %>% 
  
  ## Set the initial view of the map (center and zoom level)
  setView(lng = 60.27444399596726, 
          lat = 27.808314896631217, 
          zoom = 2 ) %>%
  
  ## Add markers for each cities and tours using the latitude and longitude columns from the CSV
  addAwesomeMarkers(data = data,
             lng = ~lng, 
             lat = ~lat,
             group = "Villes et tournées",
             icon = custom_icons,
             popup = ~paste("La", "<b>", role, "</b>", " : ", "<b>", label,  "</b>", "équivaut à", "<b>", weight, "concert(s)",
                            sep = " ")) %>% 
  
  ## Add a polygon layer representing cities with a label
  addPolygons(data = cities, 
              color = "#5a2681", 
              weight = 1, 
              smoothFactor = 0,
              group = "Liens Tournées et Villes",
              label = ~paste("Indochine a joué", cities$weight, "fois à", cities$label )) %>%
  
  ## Add a legend to the top right of the map with custom colors and labels
  addLegend("topright", 
            colors = c("transparent"), 
            labels = c("Adrien Bonneville - Master 1 GDA - Février 2025"),
            title = "Les tournées d'Indochine et les villes fréquentées - Données prises et retravaillées à partir du site officiel du groupe : indo.fr") %>%
  addLegend("topright", 
            colors = c("blue"), 
            labels = c("Marqueurs bleus = Villes fréquentées par le groupe entre 1981 et 2026"),
            title = "Les tournées d'Indochine et les villes fréquentées - Données prises et retravaillées à partir du site officiel du groupe : indo.fr") %>%
  addLegend("topright", 
            colors = c("red"), 
            labels = c("Marqueurs rouges = Les différentes tournées d'Indochine entre 1981 et 2026"),
            title = "Les tournées d'Indochine et les villes fréquentées - Données prises et retravaillées à partir du site officiel du groupe : indo.fr") %>%
  
  ## Add a mini map to the bottom left corner of the main map
  addMiniMap("bottomleft") %>%
  
  ## Add layer control allowing users to toggle between overlay groups
  addLayersControl(overlayGroups = c("Villes et tournées", "Liens Tournées et Villes"),
                   options = layersControlOptions(collapsed = TRUE))

## Render the map
map

                                                ##################
                                                ## Explanation: ##
                                                ##################

##  Install necessary packages: The install.packages commands (commented out) suggest installing the required libraries leaflet, sp, and sf.

## Load libraries: The library commands load these packages into the R session, enabling their functionalities.

## Load the shapefile: The st_read function from the sf package reads a shapefile containing country polygons and stores it in the variable countries.

## Read the CSV file: The read.csv function reads data from a CSV file containing pizzeria information and stores it in the data variable.

## Initialize the map: The leaflet function initializes a leaflet map using the countries data.

## Add base map layer: addProviderTiles adds a base map layer from OpenStreetMap. The other commented out options show alternative base map providers.

## Set initial view: setView sets the initial center (longitude and latitude) and zoom level of the map.

## Add pizzeria markers: addMarkers adds markers for each pizzeria with popups containing details from the CSV file.

## Add country polygons: addPolygons adds country polygons with a specified color, weight, and labels indicating the number of pizzerias.

## Add a legend: addLegend adds a custom legend to the top right corner of the map.

## Add a mini map: addMiniMap adds a smaller overview map to the bottom left corner.

## Add layer control: addLayersControl adds controls to toggle visibility of different map layers.

## Render the map: Finally, map renders the map with all the specified layers and controls.
