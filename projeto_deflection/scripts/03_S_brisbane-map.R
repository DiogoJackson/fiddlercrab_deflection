####

library(leaflet)

# Define coordinates for additional points
point1_coords <- c(-27.465, 153.03)  # Example coordinates for Point 1
point2_coords <- c(-27.48, 153.01)   # Example coordinates for Point 2

# Create a map centered around Brisbane city
map <- leaflet() %>%
  setView(lng = brisbane_coords[2], lat = brisbane_coords[1], zoom = 12) %>%
  addTiles() %>%  # Add default basemap tiles 
  addProviderTiles("CartoDB.Positron")  # Use a basemap with a simple grayscale background

# Add points with coordinates
# For example, add a point at Brisbane city center
map <- map %>%
  addMarkers(lng = brisbane_coords[2], lat = brisbane_coords[1], popup = "Brisbane City Center") %>%
  addMarkers(lng = point1_coords[2], lat = point1_coords[1], popup = "Point 1") %>%
  addMarkers(lng = point2_coords[2], lat = point2_coords[1], popup = "Point 2")

# Show the map
map


