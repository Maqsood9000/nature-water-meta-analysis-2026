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
                   sheet = "fig_6")
scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "A0B837",
                              "Nitrogen" = "#984EA3", "Carbon dioxide" = "#4DAF4A"))

phd1$gas_type <- factor(phd1$gas_type, levels = c("CO", "N", "H", "O3","Air", "O"), 
                        labels = c("Carbon dioxide", "Nitrogen", "Hydrogen", "Ozone", "Air", "Oxygen"))
str(phd1)
phd1$main <- factor(phd1$main, levels=c("pH", "Crop_types", "Plant"), 
                    labels = c("pH", "Crop type",  "Plant productivity"))
phd1$carbon <- factor(phd1$carbon)
str(phd1)
mytheme <- theme(legend.position = "top",
                 strip.text = element_text(size = 14, face = "bold", family = "Times New Roman"),
                 legend.title = element_text(colour="black", size=14, 
                                             face="bold", family = "Times New Roman"),
                 axis.text.x = element_text(size = 14, family = "Times New Roman"),
                 #axis.title = element_text(face = "bold"),
                 axis.title.x = element_text(size = 14, family = "Times New Roman"),
                 axis.text.y = element_blank(),
                 #axis.title = element_text(face = "bold"),
                 axis.title.y = element_text(size = 14, face="bold",  family = "Times New Roman"))
mytheme1 <- theme(legend.position = "top",
                  strip.text = element_text(size = 18, face = "bold", family = "Times New Roman"),
                  legend.title = element_text(colour="black", size=18, 
                                              face="bold", family = "Times New Roman"),
                  legend.text = element_text(colour="black", size=18, 
                                             face="bold", family = "Times New Roman"),
                  axis.ticks.y = element_blank(),
                  axis.text.x = element_text(size = 16, family = "Times New Roman"),
                  #axis.title = element_text(face = "bold"),
                  axis.title.x = element_text(size = 18, face="bold", family = "Times New Roman"),
                  axis.text.y = element_blank(),
                  #axis.title = element_text(face = "bold"),
                  axis.title.y = element_text(size = 18, face="bold",  family = "Times New Roman"))
# Soil
str(phd1)
phd <- phd1 %>%
  filter(main == "pH") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Acidic", "Alkaline"),
                         labels = c("Acidic", "Alkaline"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)
##DO
#Bubble size
p1 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
  geom_text(
    aes(y = logROM + 0.01, label = percent.change, col = gas_type),
    position = pos,
    vjust = 2,   # increase this to move further down
    size = 5.5,
    show.legend = FALSE
  ) + guides(size = "none") +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837")) +
#geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
 # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p1


# Soil
str(phd1)
phd <- phd1 %>%
  filter(main == "Crop type") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Cereal", "Vegetable", "Forage"),
                         labels = c("Cereal", "Vegetable", "Forage"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)
##DO
#Bubble size
p2 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
  geom_text(
    aes(y = logROM + 0.01, label = percent.change, col = gas_type),
    position = pos,
    vjust = 2,   # increase this to move further down
    size = 5.5,
    show.legend = FALSE
  ) + guides(size = "none") +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p2


# Soil
str(phd1)
phd <- phd1 %>%
  filter(main == "Plant productivity") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Fresh_weight", "Dry_weight", "Yield"),
                         labels = c("Plant fresh weight", "Plant dry weight", "Plant yield"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)
##DO
#Bubble size
p3 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
  geom_text(
    aes(y = logROM + 0.05, label = percent.change, col = gas_type),
    position = pos,
    vjust = 2,   # increase this to move further down
    size = 5.5,
    show.legend = FALSE
  ) + guides(size = "none") +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p3


#Save it
#ggsave("6_Plant_productivity.jpeg", p1, units="in", width=10, height = 7, dpi = 600)
p <- ggarrange(p1, p2, p3,   
            #   labels = c("(a)", "(b)", "(c)"), 
               nrow = 1, ncol = 3, hjust = -1.3,
               common.legend = T, legend = "top")
p 
# height and width is for PPt
#ggsave("barplot.tiff", units = "in", width = 9.5, height = 4.5, dpi = 600, compression="lzw")
ggsave("5_yield_1.jpeg",  p, units="in", width=12, height=8,  dpi = 600)

