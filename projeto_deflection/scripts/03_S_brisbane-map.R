library(leaflet)

# Defina as coordenadas para Brisbane e para os pontos adicionais
# Coordenadas para o centro de Brisbane ----
brisbane_coords <- c(-27.4698, 153.0251)

#Location coords ----
coords01 <- c(-27.498074,153.014499) #1universidade de queensland
coords02 <- c(-27.474314,153.029142) #2brisbane city botanic gardens
coords03 <- c(-27.475685,152.979682) #3botanic gardens mount coot-tha
coords04 <- c(-27.475797,153.021809) #4south banks parklands
coords05 <- c(-27.465852,153.034098) #5captain burk park south
coords06 <- c(-27.464701,153.035694) #6captain burk park north
coords07 <- c(-27.523223,152.992964) #7simpson reserve
coords08 <- c(-27.535778, 152.992306) #8oxley creek common
coords09 <- c(-27.492764,153.005894) #9monro street
coords10 <- c(-27.381263,153.035628) #10seventh brigade park
coords11 <- c(-27.549609,153.033562) #11russ hall park
coords12 <- c(-27.437050,152.998649) #12bank street reserve

#Trials coords ----
coords001 <- c(-27.498074,153.014499) #universidade de queensland
coords002 <- c(-27.497869,153.011608) #universidade de queensland
coords003 <- c(-27.474314,153.029142) #botanic gardens mount coot-tha
coords004 <- c(-27.475685,152.979682) #botanic gardens mount coot-tha
coords005 <- c(-27.475597,152.978732) #botanic gardens mount coot-tha
coords006 <- c(-27.475384,152.978318) #botanic gardens mount coot-tha
coords007 <- c(-27.471061095217745, 153.0127999012344) #south banks
coords008 <- c(-27.475797,153.021809) #south banks
coords009 <- c(-27.465852,153.034098) #captain burk south
coords010 <- c(-27.465621,153.034201) #captain burk south
coords011 <- c(-27.464701,153.035694) #captain burk north
coords012 <- c(-27.464841,153.035266) #captain burk north
coords013 <- c(-27.523223,152.992964) #Simpson reverve
coords014 <- c(-27.523649,152.993419) #Simpson reverve
coords015 <- c(-27.523746,152.993267) #Simpson reverve
coords016 <- c(-27.523223,152.992964) #Simpson reverve
coords017 <- c(-27.535778, 152.992306) #oxley creek common
coords018 <- c(-27.535667, 152.992194) #oxley creek common
coords019 <- c(-27.492764,153.005894) #Munro street
coords020 <- c(-27.477252,152.973800) #botanic gardens mount coot-tha
coords021 <- c(-27.478078,152.974768) #botanic gardens mount coot-tha
coords022 <- c(-27.477342,152.976680) #botanic gardens mount coot-tha
coords023 <- c(-27.381263,153.035628) #Seventh brigade park
coords024 <- c(-27.380979,153.036048) #Seventh brigade park
coords025 <- c(-27.519469,153.093534) #Lambertia close park
coords026 <- c(-27.549609,153.033562) #Russ Hall park 
coords027 <- c(-27.437050,152.998649) #Bank street reserve
coords028 <- c(-27.496427,153.011575) #UQ
coords029 <- c(-27.464749,153.035661) #Captain burk north
coords030 <- c(-27.477662,152.979190) #botanic gardens mount coot-tha
coords031 <- c(-27.477292,152.979743) #botanic gardens mount coot-tha
coords032 <- c(-27.477258,152.980125) #botanic gardens mount coot-tha
coords033 <- c(-27.464930, 153.034856) #Captain burk north
coords033 <- c(-27.465852,153.034098) #Captain burk south
coords034 <- c(-27.465147,153.034666) #Captain burk south
coords035 <- c(-27.476785,152.978979) #botanic gardens mount coot-tha
coords036 <- c(-27.477484,152.978106) #botanic gardens mount coot-tha
coords037 <- c(-27.476308,152.974785) #botanic gardens mount coot-tha
coords038 <- c(-27.477484,152.978106) #botanic gardens mount coot-tha
coords039 <- c(-27.476971,152.980223) #botanic gardens mount coot-tha
coords040 <- c(-27.523046,152.993109) #Simpson reserve park
coords041 <- c(-27.523759,152.991854) #Simpson reserve park
coords042 <- c(-27.523046,152.993109) #Simpson reserve park
coords043 <- c(-27.523727,152.993198) #Simpson reserve park
coords044 <- c(-27.523759,152.991854) #Simpson reserve park

# Crie um mapa centrado em torno do centro de Brisbane
map <- leaflet() %>%
  setView(lng = brisbane_coords[2], lat = brisbane_coords[1], zoom = 12) %>%
  addTiles() %>%  # Adiciona os tiles de mapa padrão
  addProviderTiles("CartoDB.Positron")  # Usa um mapa base com fundo em escala de cinza simples

# Location map ----
map_location <- map %>%
  addMarkers(lng = brisbane_coords[2], lat = brisbane_coords[1], popup = "Brisbane City Center") %>%
  addMarkers(lng = coords01[2], lat = coords01[1], popup = "The University of Queensland") %>%
  addMarkers(lng = coords02[2], lat = coords02[1], popup = "Brisbane City Botanic Gardens") %>%
  addMarkers(lng = coords03[2], lat = coords03[1], popup = "Botanic Gardens Mount Coot-tha") %>%
  addMarkers(lng = coords04[2], lat = coords04[1], popup = "South Banks Parklands") %>%
  addMarkers(lng = coords05[2], lat = coords05[1], popup = "Captain Burk Park South") %>%
  addMarkers(lng = coords06[2], lat = coords06[1], popup = "Captain Burk Park North") %>%
  addMarkers(lng = coords07[2], lat = coords07[1], popup = "Simpson Reserve") %>%
  addMarkers(lng = coords08[2], lat = coords08[1], popup = "Oxley Creek Common") %>%
  addMarkers(lng = coords09[2], lat = coords09[1], popup = "Monro Street") %>%
  addMarkers(lng = coords10[2], lat = coords10[1], popup = "Seventh Brigade Park") %>%
  addMarkers(lng = coords11[2], lat = coords11[1], popup = "Russ Hall Park") %>%
  addMarkers(lng = coords12[2], lat = coords12[1], popup = "Bank Street Reserve")

# Show location map ----
map_location

# Trial map ----
trial_map <- map %>%
  addMarkers(lng = brisbane_coords[2], lat = brisbane_coords[1], popup = "Brisbane City Center") %>%
  addMarkers(lng = coords001[2], lat = coords001[1], popup = "The University of Queensland") %>%
  addMarkers(lng = coords002[2], lat = coords002[1], popup = "Brisbane City Botanic Gardens") %>%
  addMarkers(lng = coords003[2], lat = coords003[1], popup = "Botanic Gardens Mount Coot-tha") %>%
  addMarkers(lng = coords004[2], lat = coords004[1], popup = "South Banks Parklands") %>%
  addMarkers(lng = coords005[2], lat = coords005[1], popup = "Captain Burk Park South") %>%
  addMarkers(lng = coords006[2], lat = coords006[1], popup = "Captain Burk Park North") %>%
  addMarkers(lng = coords007[2], lat = coords007[1], popup = "Simpson Reserve") %>%
  addMarkers(lng = coords008[2], lat = coords008[1], popup = "Oxley Creek Common") %>%
  addMarkers(lng = coords009[2], lat = coords009[1], popup = "Monro Street") %>%
  addMarkers(lng = coords010[2], lat = coords010[1], popup = "Seventh Brigade Park") %>%
  addMarkers(lng = coords011[2], lat = coords011[1], popup = "Russ Hall Park") %>%
  addMarkers(lng = coords012[2], lat = coords012[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords013[2], lat = coords013[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords014[2], lat = coords014[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords015[2], lat = coords015[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords016[2], lat = coords016[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords017[2], lat = coords017[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords018[2], lat = coords018[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords019[2], lat = coords019[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords020[2], lat = coords020[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords021[2], lat = coords021[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords022[2], lat = coords022[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords023[2], lat = coords023[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords024[2], lat = coords024[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords025[2], lat = coords025[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords026[2], lat = coords026[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords027[2], lat = coords027[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords028[2], lat = coords028[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords029[2], lat = coords029[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords030[2], lat = coords030[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords031[2], lat = coords031[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords032[2], lat = coords032[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords033[2], lat = coords033[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords034[2], lat = coords034[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords035[2], lat = coords035[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords036[2], lat = coords036[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords037[2], lat = coords037[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords038[2], lat = coords038[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords039[2], lat = coords039[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords040[2], lat = coords040[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords041[2], lat = coords041[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords042[2], lat = coords042[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords043[2], lat = coords043[1], popup = "Bank Street Reserve") %>%
  addMarkers(lng = coords044[2], lat = coords044[1], popup = "Bank Street Reserve") 
  

# Show location map ----
trial_map
