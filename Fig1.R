# =============================================================================
# Figure 1 — Moderator-resolved physicochemical responses
# Journal : Nature Water  (183 mm wide, 600 dpi)
# Data    : Hard-coded from Final_meta_data.xlsx (also in Table_S1_NatureWater.xlsx)
#
# OUTPUT  : Fig1_NatureWater.jpeg + .tiff  (183 mm × 240 mm, 600 dpi)
#
# LAYOUT  : 6 moderator rows × 3 outcome columns
#           Rows = Bubble size | Cultivation system | Generation method |
#                  Soil texture | Irrigation method | Co-amendments
#           Cols = Dissolved oxygen | Electrical conductivity | Redox potential
# =============================================================================

library(ggplot2)
library(dplyr)
library(cowplot)
library(scales)
library(forcats)

# =============================================================================
# 1.  DATA
# =============================================================================

d <- tribble(
  ~moderator,           ~category,       ~outcome, ~gas,   ~k,   ~lnRR,  ~ci_lo,  ~ci_hi,
  
  "Bubble size", "Large",  "DO",    "O2",   6,  2.44,  1.47,  3.41,
  "Bubble size", "Large",  "DO",    "Air",  5,  2.58,  1.62,  3.54,
  "Bubble size", "Large",  "DO",    "CO2",  5,  1.85,  0.85,  2.85,
  "Bubble size", "Large",  "DO",    "N2",   9,  0.67,  0.52,  0.82,
  "Bubble size", "Medium", "DO",    "O2",  10,  1.20,  0.05,  2.35,
  "Bubble size", "Medium", "DO",    "Air",  5,  1.44,  1.12,  1.76,
  "Bubble size", "Small",  "DO",    "O2",  11,  1.59,  1.56,  1.62,
  "Bubble size", "Small",  "DO",    "Air",  5,  0.59,  0.25,  0.93,
  "Bubble size", "Medium", "EC",    "O2",   6,  0.14,  0.12,  0.16,
  "Bubble size", "Medium", "EC",    "Air",  5, -1.85, -2.23, -1.47,
  "Bubble size", "Small",  "Redox", "Air", 11,  0.18,  0.16,  0.20,
  
  "Cultivation system", "Greenhouse", "DO",    "O2",  35,  2.49,  1.44,  3.39,
  "Cultivation system", "Greenhouse", "DO",    "CO2",  6,  1.82,  0.85,  2.79,
  "Cultivation system", "Greenhouse", "DO",    "Air", 15,  0.96,  0.50,  1.42,
  "Cultivation system", "Greenhouse", "DO",    "N2",   5,  0.95,  0.61,  1.29,
  "Cultivation system", "Field",      "DO",    "O2",  40,  0.65,  0.55,  0.75,
  "Cultivation system", "Hydroponic", "DO",    "O2",   7,  1.27,  1.16,  1.38,
  "Cultivation system", "Hydroponic", "DO",    "Air",  5,  0.59,  0.17,  1.01,
  "Cultivation system", "Greenhouse", "EC",    "O2",  20,  1.14,  0.23,  2.03,
  "Cultivation system", "Field",      "EC",    "O2",  10,  0.25,  0.18,  0.33,
  "Cultivation system", "Hydroponic", "EC",    "O2",   6,  0.11,  0.01,  0.21,
  "Cultivation system", "Hydroponic", "EC",    "Air",  5,  0.02,  0.01,  0.03,
  "Cultivation system", "Hydroponic", "EC",    "O3",   6,  0.29,  0.20,  0.38,
  "Cultivation system", "Greenhouse", "Redox", "O2",  44,  0.89,  0.64,  1.14,
  "Cultivation system", "Greenhouse", "Redox", "Air", 11,  0.18,  0.16,  0.20,
  "Cultivation system", "Hydroponic", "Redox", "O2",   7,  0.22,  0.14,  0.30,
  
  "Generation method", "Mem",  "DO",    "O2",  10,  2.58,  1.62,  3.54,
  "Generation method", "Mem",  "DO",    "N2",   6,  2.44,  1.49,  3.39,
  "Generation method", "Mem",  "DO",    "CO2",  5,  1.82,  0.85,  2.79,
  "Generation method", "Mem",  "DO",    "Air",  5,  1.50,  0.41,  2.59,
  "Generation method", "Hyb",  "DO",    "O2",   5,  1.43,  1.28,  1.58,
  "Generation method", "Elec", "DO",    "Air",  9,  0.68,  0.59,  0.77,
  "Generation method", "Ads",  "DO",    "O2",  27,  0.65,  0.52,  0.78,
  "Generation method", "Hyd",  "DO",    "O2",   8,  0.34,  0.22,  0.43,
  "Generation method", "Hyd",  "DO",    "Air",  5,  0.26, -0.02,  0.54,
  "Generation method", "Hyd",  "EC",    "O2",  15,  2.20,  1.69,  2.71,
  "Generation method", "Hyd",  "EC",    "O3",   5,  0.29,  0.20,  0.38,
  "Generation method", "Dis",  "EC",    "O2",  10,  0.20,  0.17,  0.23,
  "Generation method", "Dis",  "EC",    "Air",  5, -1.69, -2.23, -1.15,
  "Generation method", "Ads",  "Redox", "O2",  26,  1.48,  1.27,  1.69,
  "Generation method", "Mem",  "Redox", "O2",   7,  0.22,  0.14,  0.30,
  "Generation method", "Hyd",  "Redox", "O2",  18,  0.16,  0.10,  0.22,
  "Generation method", "Hyd",  "Redox", "Air",  5,  0.05,  0.03,  0.07,
  "Generation method", "Elec", "Redox", "Air",  9,  0.19,  0.16,  0.22,
  
  "Soil texture", "Fine",   "DO",    "O2",   6,  2.12,  1.17,  3.06,
  "Soil texture", "Fine",   "DO",    "CO2",  5,  1.82,  0.85,  2.79,
  "Soil texture", "Fine",   "DO",    "Air",  5,  1.58,  0.62,  2.54,
  "Soil texture", "Fine",   "DO",    "N2",   5,  1.44,  0.49,  2.39,
  "Soil texture", "Medium", "DO",    "O2",  10,  1.52,  1.37,  1.67,
  "Soil texture", "Medium", "DO",    "Air",  5,  0.80,  0.50,  1.10,
  "Soil texture", "Fine",   "EC",    "O2",  14,  1.35,  0.90,  1.80,
  "Soil texture", "Fine",   "Redox", "O2",  18,  0.055, 0.01,  0.09,
  
  "Irrigation method", "Surface",  "DO",    "O2",  33,  2.44,  1.49,  3.39,
  "Irrigation method", "Surface",  "DO",    "CO2",  7,  1.82,  0.85,  2.79,
  "Irrigation method", "Surface",  "DO",    "Air",  5,  1.38,  0.30,  2.48,
  "Irrigation method", "Surface",  "DO",    "N2",   6,  0.80,  0.44,  1.14,
  "Irrigation method", "Dripping", "DO",    "Air",  5,  1.92,  1.77,  2.07,
  "Irrigation method", "Dripping", "DO",    "O2",  11,  0.88,  0.57,  1.19,
  "Irrigation method", "Floating", "DO",    "O2",   6,  1.43,  1.28,  1.58,
  "Irrigation method", "Dripping", "EC",    "O2",  20,  1.14,  0.23,  2.04,
  "Irrigation method", "Dripping", "EC",    "Air",  5,  0.02,  0.01,  0.03,
  "Irrigation method", "Surface",  "EC",    "O2",  10,  0.25,  0.17,  0.33,
  "Irrigation method", "Surface",  "Redox", "Air",  5,  0.16,  0.10,  0.22,
  "Irrigation method", "Dripping", "Redox", "O2",  18,  0.05,  0.02,  0.08,
  
  "Co-amendments", "Verm",      "DO",    "O2",  17,  0.87,  0.77,  0.97,
  "Co-amendments", "Fertilizer","DO",    "Air",  9,  0.68,  0.29,  1.07,
  "Co-amendments", "NP",        "DO",    "Air",  5,  0.26,  0.16,  0.36,
  "Co-amendments", "Biochar",   "DO",    "O2",  10,  0.24,  0.13,  0.35,
  "Co-amendments", "Biochar",   "EC",    "O2",  14,  2.35,  1.90,  2.80,
  "Co-amendments", "Biochar",   "EC",    "O3",  14,  1.35,  0.90,  1.80,
  "Co-amendments", "Verm",      "Redox", "O2",  16,  1.56,  1.32,  1.80,
  "Co-amendments", "Biochar",   "Redox", "O2",  28,  0.51,  0.23,  0.79,
  "Co-amendments", "Fertilizer","Redox", "Air",  9,  0.19,  0.16,  0.22,
  "Co-amendments", "NP",        "Redox", "Air",  5,  0.16,  0.10,  0.22
)

stopifnot(nrow(d) == 73)

# =============================================================================
# 2.  SIGNIFICANCE
# =============================================================================
d <- d %>% mutate(sig = !(ci_lo <= 0 & ci_hi >= 0))

# =============================================================================
# 3.  FACTOR LEVELS
# =============================================================================
mod_levels <- c("Bubble size","Cultivation system","Generation method",
                "Soil texture","Irrigation method","Co-amendments")
d$moderator <- factor(d$moderator, levels = mod_levels)

d$outcome <- factor(d$outcome,
                    levels = c("DO","EC","Redox"),
                    labels = c("Dissolved oxygen",
                               "Electrical conductivity",
                               "Redox potential"))

cat_order <- list(
  "Bubble size"        = c("Large","Medium","Small"),
  "Cultivation system" = c("Greenhouse","Field","Hydroponic"),
  "Generation method"  = c("Mem","Hyb","Elec","Ads","Hyd","Dis"),
  "Soil texture"       = c("Fine","Medium"),
  "Irrigation method"  = c("Surface","Dripping","Floating"),
  "Co-amendments"      = c("Verm","Fertilizer","NP","Biochar")
)

d <- d %>%
  group_by(moderator) %>%
  mutate(category = factor(category,
                           levels = cat_order[[as.character(moderator[1])]])) %>%
  ungroup()

# Gas colour labels — use plain text (expression handled in legend only)
gas_col <- c(
  "O2"  = "#1B5EA8",
  "Air" = "#2CA02C",
  "CO2" = "#D62728",
  "N2"  = "#9467BD",
  "O3"  = "#E07B00",
  "H2"  = "#17BECF"
)
d$gas_lbl <- factor(d$gas, levels = names(gas_col))

mod_col <- c(
  "Bubble size"        = "#1B5EA8",
  "Cultivation system" = "#D62728",
  "Generation method"  = "#2CA02C",
  "Soil texture"       = "#9467BD",
  "Irrigation method"  = "#E07B00",
  "Co-amendments"      = "#17BECF"
)

# =============================================================================
# 4.  FONT SIZES — change here to adjust everything at once
# =============================================================================
SZ_STRIP  <- 12   # DO / EC / Redox top strip labels
SZ_YTITLE <- 11   # lnRR y-axis title
SZ_AXTEXT <- 10.5   # x and y axis tick labels
SZ_LEG    <- 12   # legend title AND legend item text  ← all now equal
SZ_ROWLAB <- 11.5   # Bubble size / Cultivation system etc. left labels

# =============================================================================
# 5.  THEME
# =============================================================================
nw_theme <- theme_classic(base_size = 9) +
  theme(
    panel.border       = element_rect(colour = "grey40", fill = NA,
                                      linewidth = 0.45),
    panel.grid.major.y = element_line(colour = "grey90", linewidth = 0.28),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.spacing.x    = unit(3.5, "pt"),
    panel.spacing.y    = unit(2,   "pt"),
    strip.placement    = "outside",
    strip.text.x       = element_text(size = SZ_STRIP, face = "bold",
                                      colour = "grey10",
                                      margin = margin(t = 3.5, b = 3.5)),
    strip.background   = element_rect(fill = "grey91", colour = "grey45",
                                      linewidth = 0.45),
    axis.line          = element_line(colour = "grey40", linewidth = 0.35),
    axis.ticks         = element_line(colour = "grey40", linewidth = 0.32),
    axis.ticks.length  = unit(2.5, "pt"),
    axis.text.x        = element_text(size = SZ_AXTEXT, colour = "grey10",
                                      angle = 0, hjust = 0.5, vjust = 1),
    axis.text.y        = element_text(size = SZ_AXTEXT, colour = "grey10"),
    axis.title.x       = element_blank(),
    axis.title.y       = element_text(size = SZ_YTITLE, colour = "grey10",
                                      margin = margin(r = 3)),
    legend.position    = "none",
    plot.margin        = margin(t = 1, r = 5, b = 2, l = 2, unit = "pt")
  )

# =============================================================================
# 6.  PANEL FUNCTION
# =============================================================================
make_row <- function(mod_name, show_ylab = FALSE, is_first = FALSE) {
  
  df <- d %>% filter(moderator == mod_name)
  
  raw_hi <- max(df$ci_hi, na.rm = TRUE)
  raw_lo <- min(df$ci_lo, na.rm = TRUE)
  pad    <- (raw_hi - raw_lo) * 0.15
  ymax   <- max(raw_hi + pad, 0.6)
  ymin   <- min(raw_lo - 0.1, -0.5)
  
  ggplot(df, aes(x = category, y = lnRR,
                 colour = gas_lbl, group = gas_lbl)) +
    
    geom_hline(yintercept = 0, linetype = "dashed",
               colour = "grey45", linewidth = 0.38) +
    
    geom_errorbar(aes(ymin = ci_lo, ymax = ci_hi),
                  width = 0.15, linewidth = 0.55, alpha = 0.75,
                  position = position_dodge(width = 0.65)) +
    
    geom_point(data = filter(df,  sig), size = 2.6, stroke = 0.45,
               position = position_dodge(width = 0.65)) +
    geom_point(data = filter(df, !sig), size = 2.6, stroke = 0.45,
               fill = "white",
               position = position_dodge(width = 0.65)) +
    
    facet_grid(cols = vars(outcome), scales = "fixed", space = "fixed") +
    
    scale_colour_manual(values = gas_col, drop = FALSE) +
    
    scale_y_continuous(limits = c(ymin, ymax),
                       breaks = pretty(c(ymin, ymax), n = 4),
                       expand = expansion(mult = c(0.02, 0.02))) +
    
    scale_x_discrete(drop = TRUE) +
    coord_cartesian(clip = "off") +
    labs(y = if (show_ylab) "lnRR" else NULL) +
    
    nw_theme +
    theme(
      strip.text.x = if (is_first)
        element_text(size = SZ_STRIP, face = "bold", colour = "grey10",
                     margin = margin(t = 3.5, b = 3.5))
      else
        element_blank(),
      strip.background = if (is_first)
        element_rect(fill = "grey91", colour = "grey45", linewidth = 0.45)
      else
        element_blank()
    )
}

# =============================================================================
# 7.  BUILD PANELS
# =============================================================================
r1 <- make_row("Bubble size",        show_ylab = TRUE, is_first = TRUE)
r2 <- make_row("Cultivation system", show_ylab = TRUE)
r3 <- make_row("Generation method",  show_ylab = TRUE)
r4 <- make_row("Soil texture",       show_ylab = TRUE)
r5 <- make_row("Irrigation method",  show_ylab = TRUE)
r6 <- make_row("Co-amendments",      show_ylab = TRUE)

# =============================================================================
# 8.  LEFT ROW LABELS
# =============================================================================
make_label <- function(txt, col) {
  ggdraw() +
    draw_label(txt, colour = col, fontface = "bold",
               size = SZ_ROWLAB, angle = 90,
               x = 0.5, y = 0.5, hjust = 0.5, vjust = 0.5)
}

lab1 <- make_label("Bubble size",        mod_col["Bubble size"])
lab2 <- make_label("Cultivation system", mod_col["Cultivation system"])
lab3 <- make_label("Generation method",  mod_col["Generation method"])
lab4 <- make_label("Soil texture",       mod_col["Soil texture"])
lab5 <- make_label("Irrigation method",  mod_col["Irrigation method"])
lab6 <- make_label("Co-amendments",      mod_col["Co-amendments"])

# =============================================================================
# 9.  LEGEND
#     Single row. Title on LEFT. Subscripts via expression().
#     SZ_LEG controls BOTH title and item text size.
# =============================================================================
leg_df <- data.frame(
  gas = factor(names(gas_col), levels = names(gas_col)),
  x = seq_along(gas_col), y = 1
)

leg_plot <- ggplot(leg_df, aes(x = x, y = y, colour = gas)) +
  geom_point(size = 4.5, alpha = 0) +          # invisible — legend keys only
  scale_colour_manual(
    values = gas_col,
    labels = c(expression(O[2]), expression(Air), expression(CO[2]),
               expression(N[2]), expression(O[3]), expression(H[2])),
    name   = "Nanobubble gas type:"
  ) +
  guides(
    colour = guide_legend(
      nrow           = 1,
      title.position = "left",
      title.vjust    = 0.5,
      override.aes   = list(shape   = c(16, 17, 15, 18, 8, 4),
                            size    = SZ_LEG * 0.45,
                            alpha   = 1,
                            linetype = 0)
    )
  ) +
  theme_void() +
  theme(
    legend.position   = "top",
    legend.direction  = "horizontal",
    legend.title      = element_text(face = "bold", size = SZ_LEG,
                                     margin = margin(r = 6), vjust = 0.5),
    legend.text       = element_text(size = SZ_LEG),
    legend.key.size   = unit(SZ_LEG * 0.05,  "cm"),
    legend.key.width  = unit(SZ_LEG * 0.06,  "cm"),
    legend.spacing.x  = unit(0.2, "cm"),
    legend.margin     = margin(0, 0, 0, 0),
    legend.box.margin = margin(0, 0, 0, 0),
    plot.margin       = margin(0, 0, 0, 0),
    plot.background   = element_rect(fill = "white", colour = NA)
  )

# =============================================================================
# 10.  ASSEMBLE
# =============================================================================
LW <- 0.058

join_row <- function(lbl, plt) {
  plot_grid(lbl, plt, ncol = 2,
            rel_widths = c(LW, 1 - LW),
            align = "h", axis = "tb")
}

all_rows <- plot_grid(
  join_row(lab1, r1),
  join_row(lab2, r2),
  join_row(lab3, r3),
  join_row(lab4, r4),
  join_row(lab5, r5),
  join_row(lab6, r6),
  ncol = 1, align = "v", axis = "lr",
  rel_heights = c(1.25, 1.0, 1.6, 0.8, 1.0, 1.2)
)

fig2 <- plot_grid(
  leg_plot,
  all_rows,
  ncol        = 1,
  rel_heights = c(0.04, 1)
)

# =============================================================================
# 11.  SAVE
# =============================================================================
W_in <- 183 / 25.4
H_in <- 240 / 25.4

save_plot("Figure2_NatureWater.jpeg", fig2,
          base_width = W_in, base_height = H_in, dpi = 600)
save_plot("Figure2_NatureWater.tiff", fig2,
          base_width = W_in, base_height = H_in, dpi = 600)

message("Saved: Figure2_NatureWater.jpeg + .tiff")
message(sprintf("Size : %.0f x %.0f mm, 600 dpi", W_in*25.4, H_in*25.4))

# =============================================================================
# TUNING GUIDE
# =============================================================================
# SZ_STRIP  <- 10   DO/EC/Redox strip labels
# SZ_YTITLE <- 10   lnRR y-axis title
# SZ_AXTEXT <- 10   x and y axis tick text
# SZ_LEG    <- 10   legend title AND legend item text (both change together)
# SZ_ROWLAB <- 11   Bubble size / Cultivation system etc.
# All five sizes set to 10 so legend = strip = y-title = axis text
