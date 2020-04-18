###########################################
##
## Lectura de datos climáticos en AEMET
##
##
###########################################

setwd("~/Dropbox/COVID-19")

# Lectura Paquetes
library(meteoland)
library(geosphere)
library(sf)
library(aemet)
library(weathermetrics)

load("~/Dropbox/COVID-19/COVID-19-Datos_Climaticos_Spain.RData")

# API key for AEMET
apikey <- "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJmOGw1aDlAZ21haWwuY29tIiwianRpIjoiNzQ4NzU1ZTgtZDBjYi00MzE3LThmMTUtNzcwZDE0ZGNiNDg0IiwiaXNzIjoiQUVNRVQiLCJpYXQiOjE1ODYxODI2MzIsInVzZXJJZCI6Ijc0ODc1NWU4LWQwY2ItNDMxNy04ZjE1LTc3MGQxNGRjYjQ4NCIsInJvbGUiOiIifQ.Ez8SgcBusQ-514k9vDtEXL29wbRi-cGIYkxnXl5AVv0"

# List of dates
mydates <- seq(as.Date("2020/3/01"), as.Date("2020/4/11"), "day")

## Lee las estaciones de meteorologicas
stations <- aemet::aemet_stations(apikey)


# Selecciono una estación meteorológoci por provincia
# El criterio para la seleccion es que tenga datos de temperatura y horas de sol
# El listado de estaciones está en el fichero Provincias.shp

provincias.sf <- sf::st_read("Shp/Provincias.shp") #


Tem <- list()
for (i in 44:50){
  Tem[[i]] <- downloadAEMEThistorical(apikey, mydates, station_id=provincias.sf$ESTACION[i])[[1]]
  print(i)
}

load("~/Dropbox/COVID-19/COVID-19-Datos_Climaticos_Spain.RData")

## Ordenacion de datos

# Temperatura media, max, pluviosidad y horas de sol de cada provincia

# Temperaturas media/max por provincia y dia
TMed <- matrix(0,nrow = 50, ncol = 42)
TMax <- matrix(0,nrow = 50, ncol = 42)
TMin <- matrix(0,nrow = 50, ncol = 42)
Plu <- matrix(0,nrow = 50, ncol = 42)
Sun <- matrix(0,nrow = 50, ncol = 42)
for (i in 1:50){
  TMed[i,] <- Tem[[i]]$MeanTemperature
  TMax[i,] <- Tem[[i]]$MaxTemperature
  TMin[i,] <- Tem[[i]]$MinTemperature
  Plu[i,] <-  (Tem[[i]]$Precipitation>0)*1
  Sun[i,] <- Tem[[i]]$SunshineHours
}

# Tratamiento de NAs (Sustituyo por el valor anterior)
for (i in 1:50){
  for (j in 2:42){
    if (is.na(TMed[i,j])) {TMed[i,j]<-TMed[i,j-1]}
    if (is.na(TMax[i,j])) {TMax[i,j]<-TMax[i,j-1]}
    if (is.na(TMin[i,j])) {TMin[i,j]<-TMin[i,j-1]}
    if (is.na(Plu[i,j])) {Plu[i,j]<-Plu[i,j-1]}
    if (is.na(Sun[i,j])) {Sun[i,j]<-Sun[i,j-1]}
  }
}

##
## Calculo de la Humedad Relativa usando temperaturas
# Relative humidity is a parameter not always recorded in weather stations.
# When input station weather data does not include relative humidity, medfate allows estimating it directly from minimum and maximum temperature (Thornton et al. 1997).
# https://mran.microsoft.com/snapshot/2017-02-20/web/packages/meteoland/vignettes/Meteorology.pdf
# Thornton, P.E., Running, S.W., White, M. a., 1997. Generating surfaces of daily meteorological variables over large regions of complex
# terrain. J. Hydrol. 190, 214–251. doi:10.1016/S0022-1694(96)03128-9

# Hum <- matrix(0,nrow = 50, ncol = 35)
# Hum <- weathermetrics::dewpoint.to.humidity(t = TMax, dp = TMin,temperature.metric = 'celsius')

Hum <- read.table("COVID-19-Humedad-Spain.csv",sep=";",header = TRUE)

TMed <- as.data.frame(TMed)
TMax <- as.data.frame(TMax)
TMin <- as.data.frame(TMin)
Plu <- as.data.frame(Plu)
Sun <- as.data.frame(Sun)

TMed <- cbind(1:50,provincias.sf$PROVINCIA,provincias.sf$ID_INE,TMed)
TMax <- cbind(1:50,provincias.sf$PROVINCIA,provincias.sf$ID_INE,TMax)
TMin <- cbind(1:50,provincias.sf$PROVINCIA,provincias.sf$ID_INE,TMin)
Plu <- cbind(1:50,provincias.sf$PROVINCIA,provincias.sf$ID_INE,Plu)
Sun <- cbind(1:50,provincias.sf$PROVINCIA,provincias.sf$ID_INE,Sun)

names(TMed) <- c("ID","provincia","ID_INE",paste0("TMed",substr(gsub("-",".",as.character(mydates)),start=5,stop=10)))
names(TMax) <- c("ID","provincia","ID_INE",paste0("TMax",substr(gsub("-",".",as.character(mydates)),start=5,stop=10)))
names(TMin) <- c("ID","provincia","ID_INE",paste0("TMin",substr(gsub("-",".",as.character(mydates)),start=5,stop=10)))
names(Plu) <- c("ID","provincia","ID_INE",paste0("Plu",substr(gsub("-",".",as.character(mydates)),start=5,stop=10)))
names(Sun) <- c("ID","provincia","ID_INE",paste0("Sun",substr(gsub("-",".",as.character(mydates)),start=5,stop=10)))

##
boxplot(Hum[,4:38])
##
rowMeans(Sun[,4:38])
provincias.sf$Sun <- rowMeans(Sun[,4:38])
provincias.sf$TMed <- rowMeans(TMed[,4:38])
provincias.sf$TMin <- rowMeans(TMin[,4:38])
provincias.sf$Hum <- rowMeans(Hum[,4:38])

plot(provincias.sf["Sun"])
plot(provincias.sf["ALTITUD"])


# ################
# # Medias Móviles
# #################
# 
# TMedmm <- matrix(0,nrow = 50, ncol = 28)
# Sunmm <- matrix(0,nrow = 50, ncol = 28)
# Hummm <- matrix(0,nrow = 50, ncol = 28)
# Plumm <- matrix(0,nrow = 50, ncol = 28)
# for (i in 4:32){
# TMedmm[,i-4] <-rowMeans(TMed[,i:(i+6)])
# Sunmm[,i-4] <-rowMeans(Sun[,i:(i+6)])
# Hummm[,i-4] <-rowMeans(Hum[,i:(i+6)])
# Plumm[,i-4] <-rowMeans(Plu[,i:(i+6)])
# }
# TMedmm <- as.data.frame(TMedmm)
# TMedmm <- cbind(1:50,provincias.sf$PROVINCIA,provincias.sf$ID_INE,TMedmm)
# names(TMedmm) <- c("ID","provincia","ID_INE",paste0("TMedmm",substr(gsub("-",".",as.character(mydates[8:35])),start=5,stop=10)))
# 
# Sunmm <- as.data.frame(Sunmm)
# Sunmm <- cbind(1:50,provincias.sf$PROVINCIA,provincias.sf$ID_INE,Sunmm)
# names(Sunmm) <- c("ID","provincia","ID_INE",paste0("Sunmm",substr(gsub("-",".",as.character(mydates[8:35])),start=5,stop=10)))
# 
# Hummm <- as.data.frame(Hummm)
# Hummm <- cbind(1:50,provincias.sf$PROVINCIA,provincias.sf$ID_INE,Hummm)
# names(Hummm) <- c("ID","provincia","ID_INE",paste0("Hummm",substr(gsub("-",".",as.character(mydates[8:35])),start=5,stop=10)))
# 
# Plumm <- as.data.frame(Plumm)
# Plumm <- cbind(1:50,provincias.sf$PROVINCIA,provincias.sf$ID_INE,Plumm)
# names(Plumm) <- c("ID","provincia","ID_INE",paste0("Plumm",substr(gsub("-",".",as.character(mydates[8:35])),start=5,stop=10)))
# 
# rm(provincias.sf)
# rm(i,j)
