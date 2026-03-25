library(readxl)
library(dplyr)       # data manipulation
library(ggplot2)     # plotting
library(tidyr)       # optional, but useful
library(multcompView)
#install.packages("ggfittext")
library(ggpubr)
library(gridExtra)
library(ggsci)
library(viridis)
phd1 <- read_excel("Final_meta_data.xlsx", 
                  sheet = "fig_1a")
str(phd1)
scale_color_manual(values = c("Oxygen" = "#E41A1C", "Air" = "#377EB8", 
                              "Carbon dioxide" = "#4DAF4A", "Nitrogen" = "#984EA3"))
phd1$gas_type <- factor(phd1$gas_type, levels = c("N", "CO", "Air", "O"), 
                       labels = c("Nitrogen", "Carbon dioxide", "Air", "Oxygen"))
#phd1$main <- factor(phd1$main, levels=c("Dissolved_oxygen", "Zeta_potential", "Electrical_conductivity"), 
 #                  labels = c("Dissolved oxygen", "Zeta potential", "Electrical conductivity"))
phd1$main <- factor(phd1$main, levels=c("Dissolved_oxygen", "Zeta_potential"), 
                    labels = c("Dissolved oxygen", "Redox potential"))
phd1$carbon = factor(phd1$carbon, levels = c("Small", "Medium", "Large"))
str(phd1)
mytheme <- theme(legend.position = "top",
                 strip.text = element_text(size = 16, face = "bold", family = "Times New Roman"),
                 legend.title = element_text(colour="black", size=16, 
                                             face="bold", family = "Times New Roman"),
                 axis.text.x = element_text(size = 14, family = "Times New Roman"),
                 #axis.title = element_text(face = "bold"),
                 axis.title.x = element_text(size = 14, family = "Times New Roman"),
                 axis.text.y = element_blank(),
                 #axis.title = element_text(face = "bold"),
                 axis.title.y = element_text(size = 16, face="bold",  family = "Times New Roman"))
mytheme1 <- theme(legend.position = "top",
                  strip.text = element_text(size = 22, face = "bold", family = "Times New Roman"),
                  legend.title = element_text(colour="black", size=22, 
                                              face="bold", family = "Times New Roman"),
                  legend.text = element_text(colour="black", size=22, 
                                             face="bold", family = "Times New Roman"),
                  axis.ticks.y = element_blank(),
                  axis.text.x = element_text(size = 18, family = "Times New Roman"),
                  #axis.title = element_text(face = "bold"),
                  axis.title.x = element_text(size = 22, face="bold", family = "Times New Roman"),
                  axis.text.y = element_blank(),
                  #axis.title = element_text(face = "bold"),
                  axis.title.y = element_text(size = 22, face="bold",  family = "Times New Roman"))
pos <- position_dodge(width = 7)
##DO
#Bubble size
#Generation method
phd1 <- read_excel("Final_meta_data.xlsx", 
                   sheet = "fig_1a")
str(phd1)
scale_color_manual(values = c("Oxygen" = "#E41A1C", "Air" = "#377EB8", 
                              "Carbon dioxide" = "#4DAF4A", "Nitrogen" = "#984EA3"))
phd1$gas_type <- factor(phd1$gas_type, levels = c("N", "CO", "Air", "O"), 
                        labels = c("Nitrogen", "Carbon dioxide", "Air", "Oxygen"))
phd1$main <- factor(phd1$main, levels=c("Dissolved_oxygen", "Zeta_potential"), 
                    labels = c("Dissolved oxygen", "Redox potential"))
phd1$carbon = factor(phd1$carbon, levels = c("Small", "Medium", "Large"))
p1 <- ggplot(data=phd1,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + 0.01, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 1.65,   # increase this to move further down
#    size = 5,
 #   show.legend = FALSE
#  ) +
  guides(size = "none") +
#  scale_color_manual(values = c("Oxygen"="#1F77B4", "Air"="#7F7F7F", "Ozone"="#9467BD", 
 #                               "Hydrogen"="#FF7F0E", "Nitrogen"="#2CA02C", "Carbon dioxide"="#17BECF")) +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837",
                                "Nitrogen" = "#E41A1C", "Carbon dioxide" = "#4DAF4A")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
 # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p1

phd1 <- read_excel("Final_meta_data.xlsx", 
                   sheet = "fig_1b")
str(phd1)
scale_color_manual(values = c("Oxygen" = "#E41A1C", "Air" = "#377EB8", 
                              "Carbon dioxide" = "#4DAF4A", "Nitrogen" = "#984EA3"))
phd1$gas_type <- factor(phd1$gas_type, levels = c("N", "CO", "Air", "O"), 
                        labels = c("Nitrogen", "Carbon dioxide", "Air", "Oxygen"))
phd1$main <- factor(phd1$main, levels=c("Dissolved_oxygen", "Zeta_potential"), 
                    labels = c("Dissolved oxygen", "Redox potential"))
phd1$carbon = factor(phd1$carbon, levels = c("Hydroponic", "Greenhouse", "Field"))

p2 <- ggplot(data=phd1,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + 0.05, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 1.65,   # increase this to move further down
#    size = 5,
 #   show.legend = FALSE
#  ) +
  guides(size = "none") +
  #  scale_color_manual(values = c("Oxygen"="#1F77B4", "Air"="#7F7F7F", "Ozone"="#9467BD", 
  #                               "Hydrogen"="#FF7F0E", "Nitrogen"="#2CA02C", "Carbon dioxide"="#17BECF")) +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837",
                                "Nitrogen" = "#E41A1C", "Carbon dioxide" = "#4DAF4A")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p2

p <- ggarrange(p1, p2, 
              # labels = c("(a)", "(b)"), 
               nrow = 2, ncol = 1, hjust = -1.7,
               common.legend = T, legend = "top")
p 
# height and width is for PPt
#ggsave("barplot.tiff", units = "in", width = 9.5, height = 4.5, dpi = 600, compression="lzw")
ggsave("1_DO_1.jpeg",  p, units="in", width=6, height=16,  dpi = 600)

