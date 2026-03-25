#import data set in R
# import libraries
library(dmetar)
library(meta)
library(metafor)
library(readxl)
#Divide the response variable into carbon, plant etd
#DO
df1 <- read_excel("data.xlsx", sheet = "Soil")
str(df1)
#df1$soc_m_c <- as.numeric(df1$soc_m_c)
#df1$soc_n_t <- as.numeric(df1$soc_n_t)
#str(df1)

##Soil
#S_Catalase
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("S_Catalase"),
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
sink("Soil_S_Catalase.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Soil_S_Catalase.csv")

#S_invertase
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("S_invertase"),
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
sink("Soil_S_invertase.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Soil_S_invertase.csv")

#S_NO3
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("S_NO3"),
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
sink("Soil_S_NO3.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Soil_S_NO3.csv")

#S_NH4
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("S_NH4"),
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
sink("Soil_S_NH4.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Soil_S_NH4.csv")

#S_OC
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("S_OC"),
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
sink("Soil_S_OC.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Soil_S_OC.csv")

#S_Urease
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("S_Urease"),
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
sink("Soil_S_Urease.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Soil_S_Urease.csv")

#S_Phosphatase
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("S_Phosphatase"),
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
sink("Soil_S_Phosphatase.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Soil_S_Phosphatase.csv")

#S_Soil_Oxygen
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("S_Soil_Oxygen"),
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
sink("Soil_S_Soil_Oxygen.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "S_Soil_Oxygen.csv")
