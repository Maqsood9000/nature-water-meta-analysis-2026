# Smart nanobubble irrigation relieves rhizosphere constraints to enhance water productivity

**Running title:** A Systematic Meta-Analysis

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20020457.svg)](https://doi.org/10.5281/zenodo.20020457)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/Maqsood9000/nature-water-meta-analysis-2026/blob/main/LICENSE)
[![Journal: Nature Water](https://img.shields.io/badge/Journal-Nature%20Water-blue.svg)]()
[![R version](https://img.shields.io/badge/R-4.2.1-276DC3.svg)](https://www.r-project.org/)

---

## Authors

Muhammad Maqsood Ur Rehman<sup>a,b †</sup>, Sidra Khattak<sup>a †</sup>, Ling Zhao<sup>a</sup>, Ying Zhu<sup>c</sup>, Yun-Li Xiao<sup>d</sup>, Hong-Yan Tao<sup>a</sup>, Awais Iqbal<sup>a</sup>, Muhammad Abrar<sup>a</sup>, Li Zhu<sup>d</sup>, Hao Sun<sup>d</sup>, Wasim Khan<sup>a</sup>, Yi-Bo Wang<sup>b</sup>, Yue Fu<sup>d</sup>, Fei Mo<sup>e</sup>\*, You-Cai Xiong<sup>a</sup>\*

† M.M.U. Rehman and S. Khattak contributed equally to this work.  
\* Corresponding authors

---

## Affiliations

<sup>a</sup> State Key Laboratory of Herbage Improvement and Grassland Agro-Ecosystems, College of Ecology, Lanzhou University, Lanzhou 730000, China  
<sup>b</sup> School of Earth and Environmental Sciences, Lanzhou University, Lanzhou 730000, China  
<sup>c</sup> Institute of Biology, Gansu Academy of Sciences, Lanzhou 730000, China  
<sup>d</sup> College of Biology and Agricultural Resources, Huanggang Normal University, Huanggang 438000, China  
<sup>e</sup> College of Agronomy, Northwest A & F University, Yangling, Shaanxi 712100, China

---

## Corresponding Authors

**You-Cai Xiong** — State Key Laboratory of Herbage Improvement and Grassland Agro-ecosystems, College of Ecology, Lanzhou University, China  
Tel/Fax: +86-931-8914500 | Email: xiongyc@lzu.edu.cn

**Fei Mo** — College of Agronomy, Northwest A & F University, Yangling, Shaanxi, China  
Email: mofei@nwafu.edu.cn

---

## Abstract

Conventional irrigation frequently depletes rhizosphere dissolved oxygen (DO), impairing root hydraulic conductance and photosynthetic carbon assimilation to constrain crop productivity under global freshwater scarcity. We conducted a systematic meta-analysis of **1,152 observations** across **six nanobubble types**, quantifying moderator-resolved effects on rhizosphere physicochemistry and eight biological domains. Gas type, soil texture, generation technology, and cultivation system hierarchically controlled DO enrichment (66–485%), oxidation–reduction potential, and electrical conductivity (Fig. 1). The ensuing biological cascade (Fig. 2) encompassed urease stimulation (55–203%), root architecture improvement, and water-use efficiency gains of 53–77%. Gas type dictated reactive oxygen species polarity: O₂ and ozone nanobubbles were pro-oxidant, while CO₂ nanobubbles reduced oxidative stress by 284%. Structural equation modelling (Fig. 3; R² = 0.85) identified photosynthetic function as the dominant yield driver (β = 0.64), with yield increasing 42–53% across all crop groups. These results establish nanobubble irrigation as a precision strategy for enhancing crop resilience under water limitation.

---

## Repository Structure

```
nature-water-meta-analysis-2026/
│
├── README.md                          # This file
├── LICENSE                            # MIT License
├── session_info.txt                   # R session and package versions
│
├── data/
│   ├── Final_meta_data.xlsx           # Complete meta-analysis dataset (1,152 obs.)
│   └── Table_S1.xlsx      # Supplementary Data 1 — all effect sizes
│
├── analysis/
│   ├── 1_study_DO.R                   # Dissolved oxygen analysis
│   ├── 1_study_EC.R                   # Electrical conductivity analysis
│   ├── 1_study_Redox.R                # Rhizosphere redox analysis
│   ├── 1_study_Soil_Oxygen.R          # Soil oxygen analysis
│   ├── 4_study_Paint_Belowground.R    # Belowground biomass analysis
│   ├── 4_study_Paint_aboveground.R    # Aboveground biomass analysis
│   ├── 5_study_Soil.R                 # Soil biogeochemistry analysis
│   ├── 6_study_yield.R                # Crop yield analysis
│   ├── Overall.R                      # Overall combined random-effects meta-analysis
│   └── funnel_plot.R                  # Publication bias — funnel plots
│
└── figures/
    ├── Fig1.R                         # Figure 1 — moderator-resolved physicochemistry
    ├── Fig2.R                         # Figure 2 — biological cascade bar charts
    └── Fig3_SEM                     # Figure 3 — structural equation model (SPSS AMOS)
```

---

## Data Description

The dataset comprises **1,152 observations** extracted from 21 peer-reviewed studies on nanobubble irrigation, covering:

- **Six nanobubble gas types**: O₂, CO₂, ozone, air, N₂, and H₂
- **Three figures**: moderator-resolved physicochemistry (Fig. 1), biological cascade (Fig. 2), causal pathway model (Fig. 3)
- **Eight biological domains**: soil enzyme activity, nutrient availability, root architecture, water-use efficiency, leaf traits, aboveground biomass, photosynthetic function, ROS status, and crop yield
- **Crop groups**: cereals, vegetables, forage crops, and legumes
- **Soil textures**: fine (clay/silt), medium (loam), sandy
- **Cultivation systems**: field, greenhouse, and hydroponic

All effect sizes, 95% confidence intervals, P values, and heterogeneity statistics are provided in `Table_S1.xlsx` (Supplementary Data 1).

---

## Code Description

All analyses were conducted in **R version 4.2.1** on macOS (aarch64-apple-darwin20). Scripts are organised by functional domain:

### Analysis scripts

| Script | Description |
|---|---|
| `1_study_DO.R` | Effect sizes for rhizosphere dissolved oxygen (66–485% increase) |
| `1_study_EC.R` | Electrical conductivity responses across nanobubble types |
| `1_study_Redox.R` | Redox potential modulation by gas type and soil texture |
| `1_study_Soil_Oxygen.R` | Soil oxygen dynamics under nanobubble irrigation |
| `4_study_Paint_Belowground.R` | Belowground biomass and root architecture responses |
| `4_study_Paint_aboveground.R` | Aboveground biomass, leaf traits, and shoot growth responses |
| `5_study_Soil.R` | Urease activity (55–203%), nitrification, and nitrogen cycling |
| `6_study_yield.R` | Crop yield responses (42–53%) across pH regimes and crop groups |
| `Overall.R` | Combined random-effects models, moderator analyses, and structural equation modelling (R²=0.85, β=0.64) |
| `funnel_plot.R` | Publication bias assessment — funnel plots and Egger's test |

### Figure scripts

| Script | Figure | Description |
|---|---|---|
| `Fig1.R` | Fig. 1 | Moderator-resolved effects on rhizosphere DO, EC, and redox potential across six moderator categories (bubble size, cultivation system, generation method, soil texture, irrigation method, co-amendments) |
| `Fig2.R` | Fig. 2 | Anatomy-based bar chart panels (a–i) showing carrier-gas-dependent biological cascade from soil biogeochemistry to crop yield, arranged alongside plant illustration |
| `Fig3_SEM` | Fig. 3 | Structural equation model path diagram (generated in SPSS AMOS; R script not available) |

---

## How to Reproduce the Analysis

### Prerequisites

R version 4.2.1 or higher is required. Install all dependencies with:

```r
install.packages(c(
  "metafor",        # v3.8-1  — meta-analysis models
  "metadat",        # v1.2-0  — meta-analysis datasets
  "meta",           # v6.0-0  — meta-analysis utilities
  "dmetar",         # v0.0.9  — meta-analysis tools
  "ggplot2",        # v3.5.0  — figure generation
  "dplyr",          # v1.1.4  — data wrangling
  "cowplot",        # v1.1.1  — figure assembly
  "scales",         # v1.3.0  — axis formatting
  "readxl",         # v1.4.3  — reading data files
  "extrafont",      # v0.19   — Times New Roman font
  "tidyr",          # v1.3.1  — data reshaping
  "ggpubr",         # v0.4.0  — publication-ready figures
  "gridExtra"       # v2.3    — figure layout
))

# Import Times New Roman font (run once)
extrafont::font_import()
extrafont::loadfonts()
```

### Run order

Execute scripts in the following sequence to reproduce all results:

```r
# Step 1: Individual domain analyses
source("analysis/1_study_DO.R")
source("analysis/1_study_EC.R")
source("analysis/1_study_Redox.R")
source("analysis/1_study_Soil_Oxygen.R")
source("analysis/4_study_Paint_Belowground.R")
source("analysis/4_study_Paint_aboveground.R")
source("analysis/5_study_Soil.R")
source("analysis/6_study_yield.R")

# Step 2: Overall meta-analysis and structural equation modelling
source("analysis/Overall.R")

# Step 3: Publication bias assessment
source("analysis/funnel_plot.R")

# Step 4: Generate all manuscript figures
source("figures/Fig1.R")     # Fig. 1 — moderator analysis
source("figures/Fig2.R")     # Fig. 2 — biological cascade
# Fig. 3 was generated in SPSS AMOS — no R script available
```

---

## R Session Information

Full session details are provided in `session_info.txt`. Key environment:

| Item | Details |
|---|---|
| R version | 4.2.1 (2022-06-23) |
| Platform | aarch64-apple-darwin20 (64-bit) |
| Operating system | macOS 15.6.1 |
| Key packages | metafor 3.8-1, meta 6.0-0, ggplot2 3.5.0, dplyr 1.1.4, cowplot 1.1.1 |

---

## Key Findings

- **Moderator hierarchy (Fig. 1):** Gas type, soil texture, generation technology, and cultivation system hierarchically modulated rhizosphere DO enrichment (66–485%), oxidation–reduction potential, and electrical conductivity
- **Biological cascade (Fig. 2a–i):** Nanobubble irrigation elevated urease activity by 55–203%, improved root architecture and water-use efficiency by 53–77%, enhanced photosynthetic rate by up to 163%, and increased crop yield by 42–53%
- **Gas-type polarity of ROS (Fig. 2h):** O₂ and ozone nanobubbles induced pro-oxidant responses (+284%); CO₂ nanobubbles reduced oxidative stress by 284%
- **Causal synthesis (Fig. 3):** Structural equation modelling identified photosynthetic function as the dominant yield driver (β = 0.64, R² = 0.85), with the causal cascade proceeding from rhizosphere redox → soil biogeochemistry → root architecture → photosynthesis → yield

---

## Supplementary Data

| File | Contents |
|---|---|
| `Table_S1.xlsx` — Sheet 1 (Figure 1) | All effect sizes for Fig. 1 moderator analysis (73 subgroup estimates) |
| `Table_S1.xlsx` — Sheet 2 (Figure 2) | All effect sizes for Fig. 2 biological cascade (88 estimates) |

---

## Citation

If you use this data or code, please cite:

> Rehman, M.M.U., Khattak, S., Zhao, L., Zhu, Y., Xiao, Y.-L., Tao, H.-Y., Iqbal, A., Abrar, M., Zhu, L., Sun, H., Khan, W., Wang, Y.-B., Fu, Y., Mo, F.\*, & Xiong, Y.-C.\* (2026). Nanobubble irrigation enhances crop water productivity by rebalancing rhizosphere redox, biogeochemistry and hydraulic function: A systematic meta-analysis. *Nature Water*. https://doi.org/10.5281/zenodo.20020457

---

## Data and Code Availability Statement

All R scripts and data supporting this study are openly available on GitHub at  
https://github.com/Maqsood9000/nature-water-meta-analysis-2026  
and are permanently archived at Zenodo (https://doi.org/10.5281/zenodo.20020457).  
Complete effect sizes, 95% confidence intervals, P values, and heterogeneity statistics for all meta-analytic subgroup analyses are provided in Supplementary Data 1 (`Table_S1.xlsx`).

---

## License

This repository is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for full details.

© 2026 Muhammad Maqsood Ur Rehman
