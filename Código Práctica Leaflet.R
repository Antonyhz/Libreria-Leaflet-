install.packages("raster",dependencies=TRUE)
library(raster)
install.packages("leaflet")
install.packages("Rcpp")
 
## Como primer paso, vamos agregar una mosaico de mapa preestablecido 
##  1.Llamamos a la libreia leaflet
library(leaflet)
 Mapa.base <-leaflet() %>% addTiles()
Mapa.base

##  2.Ahora fijaremos un punto con su respectivo marcador
Mapa.1 <-leaflet() %>% 
  addTiles() %>%
  addMarkers(lng =-77.03292701049732,lat =-12.04426348568458)
Mapa.1

##  3.Establecemos el centro del mapa y el nivel de zoom
Mapa.2 <-leaflet() %>% 
  addTiles() %>%
  setView(lng =-77.03346677529895,lat =-12.047024593395696,zoom =14) %>%
  addMarkers(lng =-77.03346677529895,lat =-12.047024593395696,popup="Museo Naval Casa de Grau")
Mapa.2

## 4.Para establecer el nivel minimo y maximo de zoom 

--> leaflet(options = leafletOptions(minZoom = 0,maxZoom = 16))

Mapa.2 <-leaflet(options = leafletOptions(minZoom = 0,maxZoom = 20)) %>% 
  addTiles() %>%
  setView(lng =-77.03335701490931,lat =-12.047504578089736,zoom =14) %>%
  addMarkers(lng =-77.03335701490931,lat =-12.047504578089736,popup="Museo Naval Casa de Grau")
Mapa.2

##  5.Definimos los limites del mapa 
---> setMaxBounds(lng1 =-77.02657405539621,lat1 =-12.161231165940253,lng2 =-77.04276036649426,lat2 =-12.046343658108029)

Mapa.2 <-leaflet(options = leafletOptions(minZoom = 0,maxZoom = 20)) %>% 
  addTiles() %>% setView(lng =-77.03335701490931,lat =-12.047504578089736,zoom =14) %>%
  addMarkers(lng =-77.03335701490931,lat =-12.047504578089736,popup="Museo Naval Casa de Grau") %>%
setMaxBounds(lng1 =-76.98323648887411,lat1 =-12.149720833145643,lng2 =-77.05534456529418,lat2 =-12.022488911199892)
Mapa.2

## Ahora vamos a crear un mapa que muestre los museos del centro historico de lima.
# Asiganmos un ambiente de trabajo 
getwd()
setwd("C:/Users/HP/Desktop/ARCHIVOS IV/PROGRAMACION/LEAFLET")
## 


library(readxl)
file.choose()
Museos.Data <-"C:\\Users\\HP\\Desktop\\ARCHIVOS IV\\PROGRAMACION\\LEAFLET\\MUSEOS.xlsx"
Museo.Puntos <-read_excel(Museos.Data)
Museos.Puntos

Nombres_Museos <-Museo.Puntos$`MUSEOS DE LIMA`
lng <-Museo.Puntos$lng
lat <-Museo.Puntos$lat
Museos.lima <-data.frame(lat,lng)
Nombres_popup <-c(Nombres_Museos)
## Pasamos las coordenadas a leaflet 

Museos.lima %>% leaflet() %>% 
  addTiles() %>%
  addMarkers(popup = Nombres_popup, clusterOptions = markerClusterOptions())

## Por ultimo agregamos un minimapa 

Museos.lima %>% leaflet() %>% 
  addTiles() %>%
  addMarkers(popup = Nombres_popup, clusterOptions = markerClusterOptions()) %>%
  addProviderTiles(providers$Esri.WorldStreetMap) %>%
  addMiniMap(tiles = providers$Esri.WorldStreetMap,toggleDisplay = TRUE) 



