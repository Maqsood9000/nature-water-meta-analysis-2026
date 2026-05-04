# =============================================================================
# Figure 2 — Carrier-gas-dependent biological cascade (panels a–i)
# Journal : Nature Water  (183 mm wide, 600 dpi)
# Data    : Final_meta_data.xlsx (see Table_S1_NatureWater.xlsx Sheet 2)
#
# OUTPUT  : Figure1_final_panels/*.jpeg + .tiff (anatomy-based arrangement)
#
# ANATOMY LAYOUT (top → bottom matches plant biology):
#   LEFT  col (X=0,    W=25.48 mm): (g)Photo (e)Leaf (f)Above (d)WUE (a)DO
#   RIGHT col (X=157.6,W=25.38 mm): (h)ROS (b)Soil
#   BOTTOM (full width 183 mm)     : (c)Root then (i)Yield
# =============================================================================
library(ggplot2)
library(dplyr)
library(cowplot)
library(scales)
library(readxl)

TNR <- tryCatch({
  library(extrafont); loadfonts(quiet = TRUE)
  if (any(grepl("Times New Roman", fonts(), ignore.case = TRUE)))
    "Times New Roman" else "serif"
}, error = function(e) "serif")

DATA <- "Final_meta_data.xlsx"

SZ_TITLE  <- 9.5
SZ_AXIS   <- 8.0
SZ_YLABEL <- 8.0
SZ_SUB    <- 7.5
SZ_LEGEND <- 9.5
PT        <- 2.2
LW        <- 0.60
CAP       <- 0.22
ALPHA_BAR <- 0.28
ALPHA_CI  <- 0.55
PANEL_W_MM <- 40

GAS_COL <- c(
  "O2"  = "#1B5EA8","Air" = "#2CA02C","CO2" = "#D62728",
  "N2"  = "#9467BD","O3"  = "#E07B00","H2"  = "#17BECF"
)
GAS_RECODE <- c(
  "O" = "O2","Air" = "Air","CO" = "CO2",
  "N" = "N2","O3" = "O3","H"  = "H2"
)

PARAM_NAMES <- c(
  "DO"="Dissolved oxygen",
  "Urease"="Urease","Catalase"="Catalase",
  "Invertase"="Invertase","Phosphatase"="Phosphatase",
  "Soil_oxygen"="Soil oxygen","NO"="Nitrate","NH"="Ammonium","OC"="Organic carbon",
  "Root_activity"="Root activity","Root_dry_weight"="Dry weight",
  "Root_fresh_weight"="Fresh weight","Root_lenght"="Length",
  "Water_use_efficiency"="Water-use efficiency",
  "No_leaf"="Number","Leaf_lenght"="Length","Leaf_area"="Area",
  "Leaf_fresh_weight"="Fresh weight","Leaf_dry_weight"="Dry weight",
  "Shoot_fresh_weight"="Fresh weight","Shoot_dry_weight"="Dry weight",
  "Shoot_lenght"="Shoot length","Plant_height"="Plant height",
  "Photosynthetic_rate"="Photosynthetic rate","Transpiration_rate"="Transpiration rate",
  "Chlorophyll"="Chlorophyll content","Stomatal_conductance"="Stomatal conductance",
  "Intracellular_CO"="Intercellular CO\u2082",
  "ROS"="ROS",
  "Fresh_weight"="Fresh weight","Dry_weight"="Dry weight",
  "Yield"="Grain yield","Cereal"="Cereal","Forage"="Forage",
  "Vegetable"="Vegetable","Acidic"="Acidic","Alkaline"="Alkaline"
)

load_sheet <- function(sheet, main_filter = NULL, carbon_filter = NULL) {
  df <- read_excel(DATA, sheet = sheet)
  if (!is.null(main_filter))
    df <- df[df$main %in% main_filter, ]
  if (!is.null(carbon_filter))
    df <- df[df$carbon %in% carbon_filter, ]
  df %>%
    mutate(
      gas   = factor(dplyr::recode(gas_type, !!!GAS_RECODE),
                     levels = names(GAS_COL)),
      sig   = !(ci.low <= 0 & ci.up >= 0),
      param = dplyr::recode(carbon, !!!PARAM_NAMES, .default = carbon)
    )
}

base_theme <- function() {
  theme_classic(base_size = 8, base_family = TNR) +
    theme(
      panel.border        = element_rect(colour = "grey40", fill = NA,
                                         linewidth = 0.4),
      panel.grid.major.x  = element_line(colour = "grey91", linewidth = 0.22),
      panel.grid.minor.x  = element_blank(),
      panel.grid.major.y  = element_blank(),
      axis.line           = element_blank(),
      axis.ticks.y        = element_blank(),
      axis.ticks.x        = element_line(colour = "grey40", linewidth = 0.3),
      axis.ticks.length   = unit(2, "pt"),
      axis.text.y         = element_text(size   = SZ_YLABEL, family = TNR,
                                         colour = "grey10", hjust = 1),
      axis.text.x         = element_text(size   = SZ_AXIS,   family = TNR,
                                         colour = "grey10"),
      axis.title.x        = element_blank(),
      axis.title.y        = element_blank(),
      plot.title          = element_text(size   = SZ_TITLE, family = TNR,
                                         face   = "bold",  colour = "grey10",
                                         margin = margin(b = 2)),
      strip.text          = element_text(size   = SZ_YLABEL, family = TNR,
                                         face   = "bold.italic",
                                         colour = "grey10"),
      strip.background    = element_rect(fill      = "grey94", colour = "grey60",
                                         linewidth = 0.3),
      strip.placement     = "outside",
      legend.position     = "none",
      plot.margin         = margin(t = 3, r = 4, b = 2, l = 2, unit = "pt")
    )
}

add_geoms <- function(df, CAP = 0.22) {
  list(
    geom_vline(xintercept = 0, linetype = "dashed",
               colour = "grey50", linewidth = 0.32),
    geom_col(aes(x = logROM), orientation = "y",
             width = 0.55, alpha = ALPHA_BAR, colour = NA),
    geom_errorbarh(aes(xmin = ci.low, xmax = ci.up),
                   height = 0, linewidth = LW, alpha = ALPHA_CI),
    geom_errorbarh(aes(xmin = ci.low, xmax = ci.low),
                   height = CAP, linewidth = LW * 0.85),
    geom_errorbarh(aes(xmin = ci.up, xmax = ci.up),
                   height = CAP, linewidth = LW * 0.85),
    geom_point(data = filter(df,  sig), shape = 21,
               size = PT, stroke = 0.45),
    geom_point(data = filter(df, !sig), shape = 21,
               size = PT, stroke = 0.45, fill = "white")
  )
}

# =============================================================================
# FIXED: build_panel
# FIX 1: numeric ypos replaces reversed factor — separators draw correctly
# FIX 2: label at centre row of each group (not top row)
# FIX 3: panels b and i built as separate sub-panels (no ghost rows)
# All other logic identical to original
# =============================================================================
build_panel <- function(df,
                        param_order,
                        title,
                        subtitle    = "",
                        xlim,
                        blank_y     = FALSE) {
  
  df <- df %>%
    mutate(group_rank = match(param, param_order)) %>%
    arrange(group_rank, desc(logROM)) %>%
    mutate(row_id = row_number(),
           ypos   = n() + 1L - row_id)
  
  N <- nrow(df)
  
  # FIX 2: centre label
  centre_ids <- df %>%
    group_by(group_rank) %>%
    summarise(mid_ypos = ypos[ceiling(n() / 2)], .groups = "drop")
  
  df <- df %>%
    left_join(centre_ids, by = "group_rank") %>%
    mutate(y_label = if (blank_y) ""
           else ifelse(ypos == mid_ypos, param, ""))
  
  # FIX 1: correct separator positions
  sep_df <- df %>%
    group_by(group_rank) %>%
    summarise(ypos_min = min(ypos), .groups = "drop") %>%
    filter(ypos_min > 1) %>%
    mutate(sep_y = ypos_min - 0.5)
  
  p <- ggplot(df, aes(y = ypos, x = logROM, colour = gas, fill = gas))
  
  if (nrow(sep_df) > 0)
    p <- p + geom_hline(data = sep_df, aes(yintercept = sep_y),
                        colour = "grey70", linewidth = 0.35)
  
  p <- p +
    add_geoms(df) +
    scale_colour_manual(values = GAS_COL, drop = FALSE) +
    scale_fill_manual(  values = GAS_COL, drop = FALSE) +
    scale_x_continuous(
      limits  = xlim,
      breaks  = pretty(xlim, n = 4),
      labels  = number_format(accuracy = 0.1),
      oob     = scales::squish,
      expand  = expansion(mult = c(0.02, 0.04))
    ) +
    scale_y_continuous(
      breaks = df$ypos,
      labels = df$y_label,
      limits = c(0.4, N + 0.6),
      expand = expansion(mult = c(0.02, 0.02))
    ) +
    coord_cartesian(clip = "off") +
    labs(title    = title,
         subtitle = if (nchar(subtitle) > 0) subtitle else NULL) +
    base_theme()
  
  p
}

build_single_param_panel <- function(df, title, xlim) {
  df <- df %>%
    arrange(desc(logROM)) %>%
    mutate(row_id = row_number(),
           ypos   = n() + 1L - row_id)
  N <- nrow(df)
  
  ggplot(df, aes(y = ypos, x = logROM, colour = gas, fill = gas)) +
    add_geoms(df) +
    scale_colour_manual(values = GAS_COL, drop = FALSE) +
    scale_fill_manual(  values = GAS_COL, drop = FALSE) +
    scale_x_continuous(
      limits = xlim,
      breaks = pretty(xlim, n = 4),
      labels = number_format(accuracy = 0.1),
      oob    = scales::squish,
      expand = expansion(mult = c(0.02, 0.04))
    ) +
    scale_y_continuous(
      breaks = df$ypos,
      labels = rep("", N),
      limits = c(0.4, N + 0.6),
      expand = expansion(mult = c(0.02, 0.02))
    ) +
    coord_cartesian(clip = "off") +
    labs(title = title) +
    base_theme()
}

# =============================================================================
# BUILD PANELS — titles and xlims exactly as in document
# =============================================================================

pa <- build_single_param_panel(
  df    = load_sheet("Overall_DO_EC_Redox", carbon_filter = "DO"),
  title = "(a) Dissolved oxygen",
  xlim  = c(-0.3, 3.5)
)

# FIX 3: panel b as two separate sub-panels (no ghost rows)
pb_enz <- build_panel(
  df          = load_sheet("Soil", main_filter = "Enzyme"),
  param_order = c("Urease","Catalase","Invertase","Phosphatase"),
  title       = "(h) Soil biogeochemistry",
  subtitle    = "Enzyme activity",
  xlim        = c(-0.3, 2.1)
) + theme(plot.margin = margin(t=3, r=4, b=0, l=2, unit="pt"))

pb_soil <- build_panel(
  df          = load_sheet("Soil", main_filter = "Soil"),
  param_order = c("Soil oxygen","Nitrate","Ammonium","Organic carbon"),
  title       = "",
  subtitle    = "Soil nutrients",
  xlim        = c(-0.3, 2.1)
) + theme(plot.margin = margin(t=1, r=4, b=2, l=2, unit="pt"))

pb <- plot_grid(pb_enz, pb_soil, ncol=1, align="v", axis="lr",
                rel_heights=c(8, 6))

pc <- build_panel(
  df          = load_sheet("Belowground", main_filter = "Root"),
  param_order = c("Root activity","Dry weight","Fresh weight","Length"),
  title       = "(d) Root architecture",
  xlim        = c(-0.3, 1.6)
)

pd <- build_single_param_panel(
  df    = load_sheet("Aboveground", main_filter = "WUE"),
  title = "(f) Water-use efficiency",
  xlim  = c(-0.1, .9)
)

pe <- build_panel(
  df          = load_sheet("Aboveground", main_filter = "Leaf"),
  param_order = c("Number","Length","Area","Fresh weight","Dry weight"),
  title       = "(b) Leaf characteristics",
  xlim        = c(-1.3, .8)
)

pf <- build_panel(
  df          = load_sheet("Aboveground", main_filter = "Aboveground"),
  param_order = c("Fresh weight","Dry weight","Shoot length","Plant height"),
  title       = "(e) Aboveground traits",
  xlim        = c(-0.6, 1.2)
)

pg <- build_panel(
  df          = load_sheet("Aboveground", main_filter = "Photosynthetic_apparatus"),
  param_order = c("Photosynthetic rate","Transpiration rate",
                  "Chlorophyll content","Stomatal conductance",
                  "Intercellular CO\u2082"),
  title       = "(c) Photosynthesis",
  xlim        = c(-0.5, 1.9)
)

ph <- build_single_param_panel(
  df    = load_sheet("Aboveground", main_filter = "ROS"),
  title = "(g) ROS dynamics",
  xlim  = c(-0.9, 2.5)
)

# FIX 3: panel i as three separate sub-panels (no ghost rows)
pi_plant <- build_panel(
  df          = load_sheet("fig_6", main_filter = "Plant"),
  param_order = c("Fresh weight","Dry weight","Grain yield"),
  title       = "(i) Crop yield",
  subtitle    = "Biomass metric",
  xlim        = c(-0.1, 1.8)
) + theme(plot.margin = margin(t=3, r=4, b=0, l=2, unit="pt"))

pi_crop <- build_panel(
  df          = load_sheet("fig_6", main_filter = "Crop_types"),
  param_order = c("Forage","Vegetable","Cereal"),
  title       = "",
  subtitle    = "Crop type",
  xlim        = c(-0.1, 1.8)
) + theme(plot.margin = margin(t=1, r=4, b=0, l=2, unit="pt"))

pi_ph <- build_panel(
  df          = load_sheet("fig_6", main_filter = "pH"),
  param_order = c("Alkaline","Acidic"),
  title       = "",
  subtitle    = "Soil pH",
  xlim        = c(-0.1, 1.8)
) + theme(plot.margin = margin(t=1, r=4, b=2, l=2, unit="pt"))

pi_p <- plot_grid(pi_plant, pi_crop, pi_ph, ncol=1, align="v", axis="lr",
                  rel_heights=c(6, 4, 3))

# =============================================================================
# LEGEND — unchanged
# =============================================================================
leg_df <- data.frame(gas = factor(names(GAS_COL), levels = names(GAS_COL)),
                     x = seq_along(GAS_COL), y = 1)
leg_plot <- ggplot(leg_df, aes(x = x, y = y, colour = gas, fill = gas)) +
  geom_point(size = 3.2, alpha = 0) +
  scale_colour_manual(
    values = GAS_COL,
    labels = c(expression(O[2]), expression(Air), expression(CO[2]),
               expression(N[2]), expression(O[3]), expression(H[2])),
    name   = "Nanobubble gas type:"
  ) +
  scale_fill_manual(
    values = GAS_COL,
    labels = c(expression(O[2]), expression(Air), expression(CO[2]),
               expression(N[2]), expression(O[3]), expression(H[2])),
    name   = "Nanobubble gas type:"
  ) +
  guides(
    colour = guide_legend(
      nrow = 1, title.position = "left", title.vjust = 0.5,
      override.aes = list(
        fill = unname(GAS_COL), colour = unname(GAS_COL),
        shape = 21, size = 3.2, alpha = 1, linetype = 0
      )
    ),
    fill = "none"
  ) +
  theme_void(base_family = TNR) +
  theme(
    legend.position   = "top", legend.direction  = "horizontal",
    legend.title      = element_text(size = SZ_LEGEND, family = TNR,
                                     face = "bold", margin = margin(r = 6),
                                     vjust = 0.5),
    legend.text       = element_text(size = SZ_LEGEND, family = TNR),
    legend.key.size   = unit(0.42, "cm"), legend.key.width  = unit(0.52, "cm"),
    legend.spacing.x  = unit(0.15, "cm"),
    legend.margin     = margin(0,0,0,0), legend.box.margin = margin(0,0,0,0),
    plot.margin       = margin(0,0,0,0),
    plot.background   = element_rect(fill = "white", colour = NA)
  )

# =============================================================================
# COMBINED FIGURE — unchanged layout
# =============================================================================
row1 <- plot_grid(pa, pb, pc,  ncol=3, align="hv", axis="tblr",
                  rel_widths=c(0.60, 1.30, 1.10))
row2 <- plot_grid(pd, pe, pf,  ncol=3, align="hv", axis="tblr",
                  rel_widths=c(0.50, 1.20, 1.30))
row3 <- plot_grid(pg, ph, pi_p, ncol=3, align="hv", axis="tblr",
                  rel_widths=c(1.35, 0.60, 1.05))
fig_body <- plot_grid(row1, row2, row3, ncol=1,
                      rel_heights=c(1.10, 0.95, 1.40))
fig1_combined <- plot_grid(leg_plot, fig_body, ncol=1,
                           rel_heights=c(0.042, 1))

# =============================================================================
# SAVE — exactly as in document (PANEL_W_MM=40, W_ind=PANEL_W_MM/15.62)
# =============================================================================
W_comb <- 183 / 25.4
H_comb <- 220 / 25.4

save_plot("Figure1_combined_NatureWater.jpeg",
          fig1_combined, base_width = W_comb, base_height = H_comb, dpi = 600)
save_plot("Figure1_combined_NatureWater.tiff",
          fig1_combined, base_width = W_comb, base_height = H_comb, dpi = 600)

W_ind <- PANEL_W_MM / 15.62

panels_to_save <- list(
  Fig1a_DO             = list(p = pa,   h = 32 / 25.4),
  Fig1b_Soil           = list(p = pb,   h = 80 / 25.4),
  Fig1c_Root           = list(p = pc,   h = 65 / 25.4),
  Fig1d_WUE            = list(p = pd,   h = 28 / 25.4),
  Fig1e_Leaf           = list(p = pe,   h = 62 / 25.4),
  Fig1f_Aboveground    = list(p = pf,   h = 68 / 25.4),
  Fig1g_Photosynthesis = list(p = pg,   h = 90 / 25.4),
  Fig1h_ROS            = list(p = ph,   h = 42 / 25.4),
  Fig1i_Yield          = list(p = pi_p, h = 76 / 25.4)
)

dir.create("Figure1_individual_panels", showWarnings = FALSE)

for (nm in names(panels_to_save)) {
  pnl <- panels_to_save[[nm]]
  save_plot(file.path("Figure1_individual_panels", paste0(nm, ".jpeg")),
            pnl$p, base_width = W_ind, base_height = pnl$h, dpi = 600)
  save_plot(file.path("Figure1_individual_panels", paste0(nm, ".tiff")),
            pnl$p, base_width = W_ind, base_height = pnl$h, dpi = 600)
}

message("\n=== Saved ===")
message(sprintf("Combined : Figure1_combined_NatureWater.jpeg + .tiff"))
message(sprintf("           %.0f x %.0f mm | 600 dpi", W_comb*25.4, H_comb*25.4))
message(sprintf("Individual: Figure1_individual_panels/  (%.0f mm wide)", PANEL_W_MM))
message("           9 panels x JPEG + TIFF")