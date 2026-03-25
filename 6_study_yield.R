#import data set in R
# import libraries
library(dmetar)
library(meta)
library(metafor)
library(readxl)
#Divide the response variable into carbon, plant etd
#DO
df1 <- read_excel("data.xlsx", sheet = "yield")
str(df1)

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
sink("pH_Acidic_uield.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "pH_Acidic_yield.csv")

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
sink("pH_Alkaline_yield.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "pH_Alkaline_yield.csv")


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
sink("Crop_type_Cereal_yield.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Crop_type_Cereal_yield.csv")

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
sink("Crop_type_Vegetable_yield.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Crop_type_Vegetable_yield.csv")

#Forage
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = Crop_type %in% c("Forage"),
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
sink("Crop_type_Forage_yield.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "Crop_type_Forage_yield.csv")
