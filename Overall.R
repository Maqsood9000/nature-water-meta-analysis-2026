#import data set in R
library(readxl)
#Overall analysis

df <- read_excel("data.xlsx", 
                 sheet = "Transpose")
#View(df)
str(df)
nrow(df)
ncol(df)
df$m_c <- as.numeric(df$soc_m_c)
str(df)
#library packages for meta analysis
# import libraries
library(dmetar)
library(meta)
library(metafor)
str(df)
# overll analysis for mrthodology
es1 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df,
                studlab = paste(df$authors),
                comb.fixed = TRUE,
                comb.random = TRUE,
                method.tau = "HE",
                prediction = TRUE,
                sm = "ROM",
                backtransf = FALSE)
es1
# save txt file
sink("es1.txt")
print(es1)
sink()

#saving summary file
df_summary = summary(es1)
df_summary
write.csv(df_summary, "df_summary.csv")

#Divide the response variable into carbon, plant etd
#Carbon_fractions
df1 <- read_excel("data.xlsx", 
                 sheet = "Transpose")
str(df1)
#nrow(df1)
#ncol(df1)
#View(df1)
# DO
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("N_DO"),
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
sink("N_DO.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "N_DO.csv")

#N_EC
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("N_EC"),
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
sink("N_EC.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "N_EC.csv")

#Redox_potential
str(df1)
es2 <- metacont(n.e = soc_n_t,
                mean.e = soc_m_t,
                sd.e = soc_sd_t,
                n.c = soc_n_c,
                mean.c = soc_m_c,
                sd.c = soc_sd_c,
                data = df1,
                subgroup = df1$Gas_Type,
                subset = parameters %in% c("N_Redox_potential"),
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
sink("N_Redox_potential.txt")
print(es2)
sink()

#saving summary file
df_summary2 = summary(es2)
df_summary2
write.csv(df_summary2, "N_Redox_potential.csv")
