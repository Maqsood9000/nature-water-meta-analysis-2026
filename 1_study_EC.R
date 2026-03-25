#import data set in R
# import libraries
library(dmetar)
library(meta)
library(metafor)
library(readxl)
#Divide the response variable into carbon, plant etd
#DO
df1 <- read_excel("data.xlsx", sheet = "N_EC")
str(df1)
#df1$soc_m_c <- as.numeric(df1$soc_m_c)
#df1$soc_n_t <- as.numeric(df1$soc_n_t)
#str(df1)

##Study_Scale
#Greenhouse
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Study_Scale %in% c("greenhouse"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Studyscale_greenhouse.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Studyscale_greenhouse.csv")

# Field
#Only O2 is conducted
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Study_Scale %in% c("Field"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Studyscale_field.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Studyscale_field.csv")

#Hydroponic
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Study_Scale %in% c("Hydroponic"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Studyscale_hydroponic.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Studyscale_hydroponic.csv")

##Bubble_size

#Medium
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Bubble_Size_type %in% c("Medium"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Bubble_size_medium.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Bubble_size_medium.csv")


##Generation_Method
str(df1)

#Dissolution
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Generation_Method %in% c("Dissolution"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Generation_Method_Dissolution.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Generation_Method_Dissolution.csv")


#Hydrodynamic
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Generation_Method %in% c("Hydrodynamic"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Generation_Method_Hydrodynamic.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Generation_Method_Hydrodynamic.csv")


##pH
#Acidic
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = pH %in% c("Acidic"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("pH_Acidic.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "pH_Acidic.csv")

#Alkaline
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = pH %in% c("Alkaline"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("pH_Alkaline.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "pH_Alkaline.csv")


##Irrigation_Method
#Dripping
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Irrigation_Method %in% c("Dripping"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Irrigation_Method_Dripping.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Irrigation_Method_Dripping.csv")


#Surface
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Irrigation_Method %in% c("Surface"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Irrigation_Method_Surface.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Irrigation_Method_Surface.csv")

##Soil_Texture_type
#Fine
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Texture_type %in% c("Fine"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Texture_type_Fine.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Texture_type_Fine.csv")


##Crop_type
#Cereal
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Crop_type %in% c("Cereal"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Crop_type_Cereal.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Crop_type_Cereal.csv")

#Vegetable
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Crop_type %in% c("Vegetable"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Crop_type_Vegetable.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Crop_type_Vegetable.csv")


##Other_treatment
#Biochar
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Other_treatment %in% c("Biochar"),
                studlab = paste(df1$authors),
                comb.fixed = FALSE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE,
                byvar = parameters)
es2
# save txt file
sink("Other_treatment_Biochar.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Other_treatment_Biochar.csv")

