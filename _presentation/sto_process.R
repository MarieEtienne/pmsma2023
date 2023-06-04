library(tidyverse)

set.seed(123)

dta <- tibble(x =cumsum(rnorm(1e4, mean = 0, sd=0.1)),
       y = cumsum(rnorm(1e4, mean = 0, sd=0.1))) 
p <- dta %>% ggplot() +
  geom_path(aes(x=x,y=y), col = "#F7A913") +
  theme_light() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank(),
        panel.background = element_rect(color = "transparent",fill = "transparent"), # bg of the panel
        plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
        panel.grid.major = element_blank(), # get rid of major grid
        panel.grid.minor = element_blank(), # get rid of minor grid
        legend.background = element_rect(fill = "transparent"), # get rid of legend bg
        legend.box.background = element_rect(fill = "transparent") ) 

p

ggsave(filename = "bm.png", units = "cm", width = 20, height = 20, bg = "transparent")


mux <- 1
muy <- 1
rho = 0.995
X0 <- -1
Y0 <- -1
dta <- tibble(x=rep(X0, 1e4),
              y=rep(Y0, 1e4))
epsx <- rnorm(1e4)
epsy <- rnorm(1e4)

for( i in 2:1e4){
  dta$x[i]  <- mux + rho*(dta$x[i-1] -mux) + 0.1*epsx[i]
  dta$y[i]  <- muy + rho*(dta$y[i-1] -muy) + 0.1*epsy[i]
}

p <- dta %>% ggplot() +
  geom_path(aes(x=x,y=y), col = "#F7A913") +
  theme_light() +
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank(),
        panel.background = element_rect(fill = "transparent"), # bg of the panel
        plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
        panel.grid.major = element_blank(), # get rid of major grid
        panel.grid.minor = element_blank(), # get rid of minor grid
        legend.background = element_rect(fill = "transparent"), # get rid of legend bg
        legend.box.background = element_rect(fill = "transparent") ) + # get rid of legend panel bg
  geom_point(aes(x=mux, y=muy), col = "#33658A", size = 10)
p

ggsave(filename = "ou.png", units = "cm", width = 20, height = 20, bg = "transparent")
