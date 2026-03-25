# Load required libraries
library(readxl)
library(metafor)

# Read your raw data
dat_raw <- read_excel("Funnel_plots.xlsx", 
                      sheet = "Overall")
str(dat_raw)
cols_to_numeric <- c(
  "soc_m_t", "soc_sd_t", "soc_n_t",
  "soc_m_c", "soc_sd_c", "soc_n_c"
)

dat_raw[cols_to_numeric] <- lapply(
  dat_raw[cols_to_numeric],
  function(x) as.numeric(trimws(x))
)
colSums(is.na(dat_raw[cols_to_numeric]))
dat_raw_clean <- dat_raw[
  complete.cases(dat_raw[cols_to_numeric]),
]
library(metafor)

dat_es <- escalc(
  measure = "ROM",
  m1i = soc_m_t, sd1i = soc_sd_t, n1i = soc_n_t,
  m2i = soc_m_c, sd2i = soc_sd_c, n2i = soc_n_c,
  data = dat_raw_clean
)

head(dat_es[, c("yi", "vi")])
res <- rma(yi, vi, data = dat_es, method = "REML")
funnel(res)
regtest(res)
fsn(dat_es$yi, dat_es$vi, type = "Rosenthal")



#For soc
# Load required libraries
library(readxl)
library(metafor)

# Read your raw data
dat_raw <- read_excel("Funnel_plots.xlsx", 
                      sheet = "SOC")
str(dat_raw)
cols_to_numeric <- c(
  "soc_m_t", "soc_sd_t", "soc_n_t",
  "soc_m_c", "soc_sd_c", "soc_n_c"
)

dat_raw[cols_to_numeric] <- lapply(
  dat_raw[cols_to_numeric],
  function(x) as.numeric(trimws(x))
)
colSums(is.na(dat_raw[cols_to_numeric]))
dat_raw_clean <- dat_raw[
  complete.cases(dat_raw[cols_to_numeric]),
]
library(metafor)

dat_es <- escalc(
  measure = "ROM",
  m1i = soc_m_t, sd1i = soc_sd_t, n1i = soc_n_t,
  m2i = soc_m_c, sd2i = soc_sd_c, n2i = soc_n_c,
  data = dat_raw_clean
)

head(dat_es[, c("yi", "vi")])
res <- rma(yi, vi, data = dat_es, method = "REML")
funnel(res)
regtest(res)
fsn(dat_es$yi, dat_es$vi, type = "Rosenthal")
library(metafor)

tiff("Figure_S3_Funnel_plot.tiff",
     width = 6, height = 6, units = "in", res = 300)

par(
  mar = c(5, 5, 2, 2),
  bty = "l",
  cex.axis = 1.1,
  cex.lab  = 1.2
)

funnel(
  res,
  xlab  = "Log response ratio (lnRR)",
  ylab  = "Standard error",
  level = 95,
  cex   = 0.8,
  pch   = 16
)

dev.off()
