#import data set in R
# import libraries
library(dmetar)
library(meta)
library(metafor)
library(readxl)
#Divide the response variable into carbon, plant etd
#DO
df1 <- read_excel("data.xlsx", sheet = "Plant_belowground")
str(df1)
#df1$soc_m_c <- as.numeric(df1$soc_m_c)
#df1$soc_n_t <- as.numeric(df1$soc_n_t)
#str(df1)

##Belowground
#P_Root_Activity
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("P_Root_Activity"),
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
sink("belowground_P_Root_Activity.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "belowground_P_Root_Activity.csv")

#P_Root_Dry_Weight
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("P_Root_Dry_Weight"),
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
sink("belowground_P_Root_Dry_Weight.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "belowground_P_Root_Dry_Weight.csv")

#P_Root_Fresh_Weight
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("P_Root_Fresh_Weight"),
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
sink("belowground_P_Root_Fresh_Weight.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "belowground_P_Root_Fresh_Weight.csv")

#P_Root_Lenght
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("P_Root_Lenght"),
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
sink("belowground_P_Root_Lenght.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "belowground_P_Root_Lenght.csv")

