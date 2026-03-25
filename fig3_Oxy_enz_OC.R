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
                  sheet = "Soil")
scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "A0B837"))
phd1$gas_type <- factor(phd1$gas_type, levels = c("H", "O3","Air", "O"), 
                       labels = c("Hydrogen", "Ozone", "Air", "Oxygen"))
phd1$main <- factor(phd1$main, levels=c("Enzyme", "Soil"), 
                   labels = c("Enzymes", "Soil nutrients"))
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
  filter(main == "Enzymes") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Catalase", "Invertase", "Phosphatase", "Urease"),
                         labels = c("Catalase", "Invertase", "Phosphatase", "Urease"))  # ordered logically
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
    aes(y = logROM + 0.12, label = percent.change, col = gas_type),
    position = pos,
    vjust = 1.5,   # increase this to move further down
    size = 5.5,
    show.legend = FALSE
  ) +
  guides(size = "none") +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837")) +
#geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
 # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p1
#Save it
#ggsave("4a_enzymes.tiff", p1, units="in", width=10, height = 7, dpi = 300)

#Generation method
phd <- phd1 %>%
  filter(main == "Soil nutrients") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("NH", "NO", "OC", "Soil_oxygen"),
                         labels = c("Ammoniun", "Nitrate", "Organic\ncarbon", "Soil\noxygen"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

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
    aes(y = logROM + .02, label = percent.change, col = gas_type),
    position = pos,
    vjust = 2,   # increase this to move further down
    size = 5.5,
    show.legend = FALSE
  ) +
  guides(size = "none") +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p2
#ggsave("4b_Soil_nutrients.tiff", p2, units="in", width=10, height = 12, dpi = 300)

p <- ggarrange(p1, p2,
          #     labels = c("(a)", "(b)"), 
               nrow = 1, ncol = 2, hjust = -.1,
               common.legend = T, legend = "top")
p 
# height and width is for PPt
#ggsave("barplot.tiff", units = "in", width = 9.5, height = 4.5, dpi = 600, compression="lzw")
ggsave("3_Enzyme_soil_1.jpeg",  p, units="in", width=12, height=9,  dpi = 600)

