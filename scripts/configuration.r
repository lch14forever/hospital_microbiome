library(ggplot2)
library(grid)
library(gridExtra)
library(dplyr)
library(tidyr)
library(tibble)
library(stringr)
library(reshape2)
library(ggsci)

figtheme <- theme_bw() + 
  theme(text = element_text(size=23,face='bold'),panel.border  = element_rect(colour = "black",size=1.5),
        axis.title.y=element_text(margin=margin(0,15,0,0)),axis.title.x=element_text(margin=margin(15,0,0,0)),
        axis.text.x = element_text(margin=margin(5,0,0,0)),
        plot.margin = unit(c(1,1,1,1), "cm"),
        plot.title = element_text(margin=margin(0,0,15,0), hjust=0.5),
        panel.grid = element_blank()
        )
theme_set(figtheme)

