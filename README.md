# AmeriFluxSites

AmeriFlux is a network of research sites across the Americas that aims to measure and understand the carbon balance of different ecosystems. These ecosystems include forests, grasslands, wetlands, and agricultural lands. The network uses a variety of techniques, such as eddy covariance measurements, to quantify the exchange of carbon dioxide, water vapor, and energy between the ecosystems and the atmosphere.

The data collected by AmeriFlux sites contribute to our understanding of how ecosystems influence the global carbon cycle and how they respond to environmental changes, including climate change. Researchers use this information to improve models predicting future climate scenarios and to develop strategies for managing and mitigating the impacts of climate change on ecosystems.

Overall, AmeriFlux plays a crucial role in advancing scientific knowledge related to carbon dynamics and ecosystem functioning in the Americas. 

# Site Distribution

library(sf)
sites <- read.csv("Data/AmeriFlux-site.csv")
names(sites)

# Create a simple feature using the latitude and Longitude:
sites.shp <- st_as_sf(x = sites,                         
           coords = c("Longitude..degrees.",  "Latitude..degrees."),
           crs = "+init=epsg:4326")

                     
# Visualize the simple feature with ggplot2:
```{r, include=T}
library(ggplot2)

ggplot(data = sitess.shp )+ geom_sf()

```
 
# Create a shapefile for the America's using AOI:

```{r, include=T}
library(AOI)

Americas <- aoi_get(country= c("North America", "South America"))

ggplot() + geom_sf(data = Americas)

```

# Create a map of sites: 
```{r, include=T}
ggplot() + geom_sf(data = Americas) + geom_sf(data = sitess.shp) 
```

# Look at the distribution of sites across climate conditions by IGBP:


```{r, include=T}

ggplot(sites) + geom_point(aes( x= Mean.Average.Temperature..degrees.C.,
y= Mean.Average.Precipitation..mm., col= Vegetation.Abbreviation..IGBP.))

```


