#
# R Script for Koi contour
#
z1 <- z2 <- seq(0,1,length=100)
grid.data <- expand.grid(p=z1, Se=z2)
#
# fixed model parameters
#
Sp <-   1.0
N  <-  80.0
S  <- 250.0
grid.data$B <- (1.0-grid.data$p)*Sp*N - grid.data$p*(1-grid.data$Se)*S
attach(grid.data)
#
# contour plt
#
library(ggplot2)
v <- ggplot(grid.data, aes(x=Se, y=p, z=B))
v + 
  #geom_tile(aes(fill=grid.data$B))+
  stat_density2d(aes(fill=..density..), geom="tile")
  stat_contour()
v