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
                  sheet = "plant")
scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "A0B837",
                              "Nitrogen" = "#984EA3", "Carbon dioxide" = "#4DAF4A"))

phd1$gas_type <- factor(phd1$gas_type, levels = c("CO", "N", "H", "O3","Air", "O"), 
                       labels = c("Carbon dioxide", "Nitrogen", "Hydrogen", "Ozone", "Air", "Oxygen"))
phd1$main <- factor(phd1$main, levels=c("Root", "WUE", "Aboveground", "Leaf", "Photosynthetic_apparatus", "ROS", "Plant"), 
                   labels = c("Root architecture", "Water uptake", "Aboveground characteristics", "Leaf characteristics",
                              "Photosynthetic apparatus", "Reactive oygen species", "Plant productivity"))
phd1$carbon <- factor(phd1$carbon)
str(phd1)
#View(phd1)
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
#View(phd1)
phd <- phd1 %>%
  filter(main == "Root architecture") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Root_activity", "Root_lenght", "Root_dry_weight", "Root_fresh_weight"),
                         labels = c("Root\nactivity", "Root\nlenght", "Root dry\nweight", "Root fresh\nweight"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
#View(phd)
str(phd)
pos <- position_dodge(width = 7)
##DO
#Root activity
p1 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
 # geom_text(
 #   aes(y = logROM + 0.22, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 1.5,   # increase this to move further down
    #size = 4.5,
#    show.legend = FALSE
 # ) +
  guides(size = "none") +
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
#Save it
#ggsave("5a_roots.tiff", p1, units="in", width=10, height = 7, dpi = 300)

#WUE
phd <- phd1 %>%
  filter(main == "Water uptake") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Water_use_efficiency"),
                         labels = c("Water use efficiency"))  # ordered logically
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
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + .02, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
  #  show.legend = FALSE
 # ) +
  guides(size = "none") +
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
#ggsave("5b_WUE.jpeg", p2, units="in", width=10, height = 12, dpi = 300)

#Leaf
#View(phd1)
str(phd1)
phd <- phd1 %>%
  filter(main == "Leaf characteristics") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Leaf_lenght", "Leaf_area", "No_leaf", 
                                            "Leaf_fresh_weight", "Leaf_dry_weight"),
                         labels = c("Leaf\nlenght", "Leaf\narea", "Number of\nleaf", 
                                    "Leaf fresh\nweight", "Leaf dry\nweight"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p3 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + .2, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 1.2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
  guides(size = "none") +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837",
                                "Nitrogen" = "#E41A1C", "Carbon dioxide" = "#4DAF4A")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p3
#ggsave("5c_leaf.jpeg", p3, units="in", width=10, height = 12, dpi = 300)

#Leaf
#View(phd1)
str(phd1)
#View(phd1)
phd <- phd1 %>%
  filter(main == "Aboveground characteristics") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Shoot_lenght", "Shoot_fresh_weight", "Shoot_dry_weight",
                                            "Plant_height"),
                         labels = c("Shoot\nlenght", "Shoot fresh\nweight", "Shoot dry\nweight",
                                    "Plant\nheight"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p4 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + .18, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 1.2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) + guides(size = "none") +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837",
                                "Nitrogen" = "#E41A1C", "Carbon dioxide" = "#4DAF4A")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p4
#ggsave("5d_Aboveground.jpeg", p4, units="in", width=10, height = 12, dpi = 300)

#Photosynthesis
#View(phd1)
str(phd1)
#View(phd1)
phd <- phd1 %>%
  filter(main == "Photosynthetic apparatus") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Intracellular_CO", "Stomatal_conductance", "Transpiration_rate",
                                            "Photosynthetic_rate", "Chlorophyll"),
                         labels = c("Intracellular\nCarbon dioxide", "Stomatal\nconductance", "Transpiration\nrate",
                                    "Photosynthetic\nrate", "Chlorophyll\ncontent"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p5 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + .2, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 1.2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) + guides(size = "none") +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837",
                                "Nitrogen" = "#E41A1C", "Carbon dioxide" = "#4DAF4A")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p5
#ggsave("5e_Photosynthesis.jpeg", p4, units="in", width=10, height = 12, dpi = 300)

#ROS
str(phd1)
#View(phd1)
phd <- phd1 %>%
  filter(main == "Reactive oygen species") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("ROS"),
                         labels = c("Reactive oxygen species"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p6 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + .22, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 1.5,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) + guides(size = "none") +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", "Ozone" = "blue", "Hydrogen" = "#A0B837",
                                "Nitrogen" = "#E41A1C", "Carbon dioxide" = "#4DAF4A")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p6
#ggsave("5f_ROS.jpeg", p4, units="in", width=10, height = 12, dpi = 300)


p <- ggarrange(p1, p2, p3, p4, p5, p6,
             #  labels = c("(a)", "(b)", "(c)", "(d)", "(e)", "(f)"), 
               nrow = 2, ncol = 3, hjust = -1.4,
               heights = c(1, 1.25),   # first row larger
               common.legend = T, legend = "top")
p 
# height and width is for PPt
#ggsave("barplot.tiff", units = "in", width = 9.5, height = 4.5, dpi = 600, compression="lzw")
ggsave("4_Plant_1.jpeg",  p, units="in", width=12.3, height=17.3,  dpi = 600)

