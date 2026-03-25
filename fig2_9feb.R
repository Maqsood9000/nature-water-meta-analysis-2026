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
                  sheet = "DO")
scale_color_manual(values = c("Oxygen" = "#E41A1C", "Air" = "#377EB8", 
                              "Carbon dioxide" = "#4DAF4A", "Nitrogen" = "#984EA3"))
phd1$gas_type <- factor(phd1$gas_type, levels = c("N", "CO", "Air", "O"), 
                       labels = c("Nitrogen", "Carbon dioxide", "Air", "Oxygen"))
phd1$main <- factor(phd1$main, levels=c("bubble_size", "Generation_method", "Irrigation_method", "Study_scale",
                                      "Texture_type", "pH", "Crop_type", "Other_treatment"), 
                   labels = c("Bubble size", "Generation method", "Irrigation method", "Study scale",
                              "Texture type", "pH", "Crop type", "Other treatment"))
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
#Generation method
phd <- phd1 %>%
  filter(main == "Generation method") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Adsorption", "Electrochemical", "Hydrodynamic",
                                            "Membrane_diffusion", "Hybrid"),
                         labels = c("Adsorption",
                                    "Electro-\nchemical",
                                    "Hydro-\ndynamic",
                                    "Membrane\ndiffusion",
                                    "Hybrid\nmethod"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p1 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + 0.7, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 1.2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
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
#ggsave("1b_generationmethod.tiff", p1, units="in", width=10, height = 12, dpi = 300)

#1c_Irrigation method
phd <- phd1 %>%
  filter(main == "Irrigation method") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Floating", "Dripping", "Surface"),
                         labels = c("Floating", "Dripping", "Surface"))  # ordered logically
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
 #   aes(y = logROM + 0.15, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 1.7,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
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
#ggsave("1c_irrigationmethod.tiff", p2, units="in", width=10, height = 6, dpi = 300)


#1d_Texture_type
phd <- phd1 %>%
  filter(main == "Texture type") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Fine", "Medium"),
                         labels = c("Fine", "Medium"))  # ordered logically
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
 #   aes(y = logROM + 0.15, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
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
#ggsave("1d_Texture_type.tiff", p3, units="in", width=10, height = 6, dpi = 300)

#11i_Other_treatment
phd <- phd1 %>%
  filter(main == "Other treatment") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Biochar", "Vermiculite", "Nanoparticle", "Fertilizer"),
                         labels = c("Biochar", "Vermiculite", "Nanoparticle", "Fertilizer"))  # ordered logically
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
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + 0.15, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
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
#ggsave("1i_Other_treatment.tiff", p4, units="in", width=10, height = 6, dpi = 300)

##Redox
phd1 <- read_excel("Final_meta_data.xlsx", 
                   sheet = "Redox")
scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8"))
phd1$gas_type <- factor(phd1$gas_type, levels = c("Air", "O"), 
                        labels = c("Air", "Oxygen"))
phd1$main <- factor(phd1$main, levels=c("bubble_size", "Generation_method", "Irrigation_method", "Study_scale",
                                        "Texture_type", "pH", "Crop_type", "Other_treatment"), 
                    labels = c("Bubble size", "Generation method", "Irrigation method", "Study scale",
                               "Texture type", "pH", "Crop type", "Other treatment"))
str(phd1)
#Generation method
phd <- phd1 %>%
  filter(main == "Generation method") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Adsorption", "Electrochemical", "Hydrodynamic", "Membrane_diffusion"),
                         labels = c("Adsorption", "Electro-\nchemical", "Hydro-\ndynamic", "Membrane\ndiffusion"))  # ordered logically
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
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + .12, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", 
                                "Ozone" = "blue")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p5
#ggsave("3b_generationmethod.tiff", p2, units="in", width=10, height = 12, dpi = 300)

#1c_Irrigation method
phd <- phd1 %>%
  filter(main == "Irrigation method") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Dripping", "Surface"),
                         labels = c("Dripping", "Surface"))  # ordered logically
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
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + 0.001, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p6
#ggsave("3c_irrigationmethod.tiff", p3, units="in", width=10, height = 6, dpi = 300)


#1d_Texture_type
phd <- phd1 %>%
  filter(main == "Texture type") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Fine"),
                         labels = c("Fine"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p7 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", 
                                "Nitrogen" = "#E41A1C", "Carbon dioxide" = "#4DAF4A")) +
#  geom_text(
 #   aes(y = logROM + 0.001, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) + scale_color_manual(values = c("Oxygen" = "#984EA3")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p7
#ggsave("3d_Texture_type.tiff", p4, units="in", width=10, height = 6, dpi = 300)


#11i_Other_treatment
phd <- phd1 %>%
  filter(main == "Other treatment") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Biochar", "Vermiculite", "Nanoparticle", "Fertilizer"),
                         labels = c("Biochar", "Vermi-\nculite", "Nano-\nparticle", "Fertilizer"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p8 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + 0.05, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", 
                                "Ozone" = "blue")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p8
#ggsave("3i_Other_treatment.tiff", p7, units="in", width=10, height = 6, dpi = 300)

##EC
phd1 <- read_excel("Final_meta_data.xlsx", 
                   sheet = "EC")
scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", 
                              "Ozone" = "blue"))
phd1$gas_type <- factor(phd1$gas_type, levels = c("O3", "Air", "O"), 
                        labels = c("Ozone", "Air", "Oxygen"))
phd1$main <- factor(phd1$main, levels=c("bubble_size", "Generation_method", "Irrigation_method", "Study_scale",
                                        "Texture_type", "pH", "Crop_type", "Other_treatment"), 
                    labels = c("Bubble size", "Generation method", "Irrigation method", "Study scale",
                               "Texture type", "pH", "Crop type", "Other treatment"))
str(phd1)


#Generation method
phd <- phd1 %>%
  filter(main == "Generation method") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Dissolution",  "Hydrodynamic"),
                         labels = c("Dissolution", 
                                    "Hydro-\ndynamic"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p9 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + .25, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", 
                                "Ozone" = "blue")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p9
ggsave("9_2b_generationmethod.tiff", p9, units="in", width=10, height = 12, dpi = 300)

#1c_Irrigation method
phd <- phd1 %>%
  filter(main == "Irrigation method") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Dripping", "Surface"),
                         labels = c("Dripping", "Surface"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p10 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + 0.15, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
  scale_color_manual(values = c("Oxygen" = "#984EA3")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p10
#ggsave("2c_irrigationmethod.tiff", p6, units="in", width=10, height = 6, dpi = 300)


#1d_Texture_type
phd <- phd1 %>%
  filter(main == "Texture type") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Fine"),
                         labels = c("Fine"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p11 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
  scale_color_manual(values = c("Oxygen" = "#984EA3", "Air" = "#377EB8", 
                                "Nitrogen" = "#E41A1C", "Carbon dioxide" = "#4DAF4A")) +
#  geom_text(
 #   aes(y = logROM + 0.15, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) + scale_color_manual(values = c("Oxygen" = "#984EA3")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p11
#ggsave("2d_Texture_type.tiff", p7, units="in", width=10, height = 6, dpi = 300)


#11i_Other_treatment
phd <- phd1 %>%
  filter(main == "Other treatment") %>%
  mutate(carbon,   # carbon holds Large, Medium, Small
         carbon = factor(carbon, levels = c("Biochar"),
                         labels = c("Biochar"))  # ordered logically
  )
# Factor for gas_type - include all unique to avoid NA
str(phd)
pos <- position_dodge(width = 7)

p12 <- ggplot(data=phd,
             aes(x = carbon,y = logROM, ymin = ci.low, ymax = ci.up, size = k))+
  geom_pointrange(aes(col=gas_type), position = pos)+
  scale_size(range = c(.6, 1.4)) +
  #geom_point(size=phd$k, alpha=0.7) +
  geom_hline(aes(fill=gas_type),yintercept =0, linetype=2)+
  labs(x="", y="Effect size (lnRR)", 
       color="Nanobubble type", size="Number of studies") +
  geom_errorbar(aes(ymin=ci.low, ymax=ci.up,col=gas_type),width=0.5,cex=1, position = pos)+ 
#  geom_text(
 #   aes(y = logROM + 0.25, label = percent.change, col = gas_type),
  #  position = pos,
   # vjust = 2,   # increase this to move further down
#    size = 4.5,
 #   show.legend = FALSE
  #) +
  scale_color_manual(values = c("Oxygen" = "#984EA3", 
                                "Ozone" = "blue")) +
  #geom_text(aes(label=phd$percent.change, x=phd$logROM+phd$ci.up), position = pos) +
  #facet_wrap(~carbon,strip.position="top",ncol=3,scales = "free_y") +
  #facet_wrap(~variable,strip.position="left",nrow=9,scales = "free_y") +
  # facet_wrap(~ main, scales = "free_x", nrow = 2, strip.position = "top") +
  facet_grid(carbon ~ main , scales = "free", switch = "y") +
  mytheme1 +
  coord_flip()
p12
#ggsave("2i_Other_treatment.tiff", p8, units="in", width=10, height = 6, dpi = 300)

p <- ggarrange(p1, p2, p3, p4, p5, p6, p7, p8,p9, p10, p11, p12,  
              # labels = c("(a)", "(b)", "(c)", "(d)", "(e)", "(f)", "(g)", "(h)",
               #            "(i)", "(j)", "(k)", "(l)"), 
               nrow = 3, ncol = 4, hjust = -1.3,
               heights = c(1.5, 1.2, 0.85),
               common.legend = T, legend = "top")
p 
# height and width is for PPt
#ggsave("barplot.tiff", units = "in", width = 9.5, height = 4.5, dpi = 600, compression="lzw")
ggsave("Fig2_DO_EC_Red_1.jpeg",  p, units="in", width=12.5, height=17.5,  dpi = 600)




