# AmeriFluxSites

##### Install Packages:
```{r, include=T}
devtools::install_github("valentinitnelav/plotbiomes")
```

##### Packages:
```{r, include=T}
library(amerifluxr)
library(sf)
library(tidyverse)
library(ggplot2)
library(AOI)
library(plotbiomes)
```
AmeriFlux is a network of research sites across the Americas that aims to measure and understand the carbon balance of different ecosystems. These ecosystems include forests, grasslands, wetlands, and agricultural lands. The network uses a variety of techniques, such as eddy covariance measurements, to quantify the exchange of carbon dioxide, water vapor, and energy between the ecosystems and the atmosphere.

The data collected by AmeriFlux sites contribute to our understanding of how ecosystems influence the global carbon cycle and how they respond to environmental changes, including climate change. Researchers use this information to improve models predicting future climate scenarios and to develop strategies for managing and mitigating the impacts of climate change on ecosystems.

Overall, AmeriFlux plays a crucial role in advancing scientific knowledge related to carbon dynamics and ecosystem functioning in the Americas. Lets explore where data is collected. 

#### Site Distribution
Site information was downloaded from AmeriFlux.org. Import the file AmeriFlux-site.csv:
```{r, include=T}
sites <- read.csv("Data/AmeriFlux-site.csv")
```
Create a simple feature using the latitude and Longitude:
```{r, include=T}
sites.shp <- st_as_sf(x = sites,                         
           coords = c("Longitude..degrees.",  "Latitude..degrees."),
           crs = "+init=epsg:4326")
```

Create a shapefile for North America using the library AOI:
```{r, include=T}
Americas <-aoi_get( country = c( "North America", "South America"))
```                    
Visualize the simple feature with ggplot2:
```{r, include=T}

ggplot( ) + geom_sf(data=Americas) + geom_sf(data = sites.shp, aes(col=aoi), cex=0.5)

```

Create a map of sites: 
```{r, include=T}
ggplot() + geom_sf(data = Americas) + geom_sf(data = sitess.shp) 
```
Look at the distribution of sites across climate conditions by IGBP.

```{r, include=T}
ggplot(sites) + geom_point(aes( x= Mean.Average.Temperature..degrees.C.,
y= Mean.Average.Precipitation..mm., col= Vegetation.Abbreviation..IGBP.))

```

# How does this compare to the Whittaker biome diagram: 

```{r, include=T}
whittaker_base_plot()

whittaker_base_plot() + geom_point(data= sites, aes( x= Mean.Average.Temperature..degrees.C.,
y= Mean.Average.Precipitation..mm./10))
```

Import the data for two Ameriflux sites Harvard Forest and Barrow:

```{r, include=T}
HARV <- read.csv('~/Dropbox (YSE)/Teaching/Workshops/AmeriFluxSites/Data/AMF_US-xHA_FLUXNET_SUBSET_2017-2021_3-5/AMF_US-xHA_FLUXNET_SUBSET_DD_2017-2021_3-5.csv' )

BARR <- read.csv('~/Dropbox (YSE)/Teaching/Workshops/AmeriFluxSites/Data/AMF_US-xBA_FLUXNET_SUBSET_2019-2021_3-5/AMF_US-xBA_FLUXNET_SUBSET_DD_2019-2021_3-5.csv' )
```
Format the date:
```{r, include=T}
HARV$DATE <- as.Date( as.character(HARV$TIMESTAMP), format="%Y%m%d", origin = '2019-01-01')
BARR$DATE <- as.Date( as.character(BARR$TIMESTAMP), format="%Y%m%d", origin = '2019-01-01')
````
Look at the climate at the two sites:

```{r, include=T}
# Air Temperature:
ggplot() + geom_point( data= HARV, aes(x=DATE, y= TA_F )) +
  xlab("Date") + ylab("Air Temperature°C")

ggplot() + geom_point( data= BARR, aes(x=DATE, y= TA_F )) +
  xlab("Date") + ylab("Air Temperature°C")

# Precipitation:

ggplot() + geom_point( data= HARV, aes(x=DATE, y= P_F )) +
  xlab("Date") + ylab("Precipitation (mm)")

ggplot() + geom_point( data= BARR, aes(x=DATE, y= P_F )) +
  xlab("Date") + ylab("Precipitation (mm)")

# Photosynthetically Active Radiation:


ggplot() + geom_point( data= HARV, aes(x=DATE, y=PPFD_IN  )) +
  xlab("Date") + ylab(expression(paste("PAR (", mu,"mol Photons m"^-2, "s" ^-1, ")"))) + ylim(0, 1000)

ggplot() + geom_point( data= BARR, aes(x=DATE, y=PPFD_IN  )) +
  xlab("Date") + ylab(expression(paste("PAR (", mu,"mol Photons m"^-2, "s" ^-1, ")")))+ ylim(0, 1000)
```
Explore Net Ecosystem Exchange Rates:
```{r, include=T}
# Look at NEE:
ggplot() + geom_point( data= HARV, aes(x=DATE, y= NEE_VUT_75 )) +
  xlab("Date") + ylab(expression(paste("NEE ( g C m" ^-2, "day" ^-1, ")")))

ggplot() + geom_point( data= BARR, aes(x=DATE, y= NEE_VUT_75 )) +
  xlab("Date") + ylab(expression(paste("NEE ( g C m" ^-2, "day" ^-1, ")")))
```

Additional Resourse:

Chu, H., Christianson, D.S., Cheah, YW. et al. AmeriFlux BASE data pipeline to support network growth and data sharing. Sci Data 10, 614 (2023). https://doi.org/10.1038/s41597-023-02531-2. https://www.nature.com/articles/s41597-023-02531-2
