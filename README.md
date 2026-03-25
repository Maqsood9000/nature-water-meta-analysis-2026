# Nanobubble Irrigation Enhances Crop Water Productivity by Rebalancing Rhizosphere Redox, Biogeochemistry and Hydraulic Function

**Running title:** A Systematic Meta-Analysis

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19213026.svg)](https://doi.org/10.5281/zenodo.19213026)
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

Conventional irrigation frequently depletes rhizosphere dissolved oxygen (DO), impairing root hydraulic conductance and photosynthetic carbon assimilation to constrain crop productivity under global freshwater scarcity. We conducted a systematic meta-analysis of **1,152 observations** across **six nanobubble types**, quantifying moderator-resolved effects on eight key functional domains. Nanobubble irrigation significantly elevated rhizosphere DO by 66–485% and urease activity by 55–203%, with responses strongly modulated by gas type, soil texture, and cultivation system. Oxygen nanobubbles stimulated the urease–nitrification cascade, improving nitrogen availability and plant water-use efficiency by 53–77%. Gas type dictated ROS dynamics: O₂ and ozone nanobubbles showed pro-oxidant effects, while CO₂ nanobubbles reduced oxidative stress by 284%. Structural equation modelling (R²=0.85) identified photosynthetic function as the dominant yield driver (β=0.64), with yield increasing by 42–53% across all crop groups. Our mechanistically quantified results support nanobubble irrigation as an effective precision strategy to enhance crop resilience under water limitation.

---

## Repository Structure

```
nature-water-meta-analysis-2026/
│
├── README.md                      # This file
├── LICENSE                        # MIT License
├── session_info.txt               # R session and package versions
│
├── 1_study_DO.R                   # Dissolved oxygen analysis
├── 1_study_EC.R                   # Electrical conductivity analysis
├── 1_study_Redox.R                # Rhizosphere redox analysis
├── 1_study_Soil_Oxygen.R          # Soil oxygen analysis
├── 4_study_Paint_Belowground.R    # Belowground biomass analysis
├── 4_study_Paint_aboveground.R    # Aboveground biomass analysis
├── 5_study_Soil.R                 # Soil biogeochemistry analysis
├── 6_study_yield.R                # Crop yield analysis
├── Overall.R                      # Overall meta-analysis and SEM
├── fig1_DO_Eh_9_feb.R             # Figure 1 generation
├── fig2_9feb.R                    # Figure 2 generation
├── fig3_Oxy_enz_OC.R              # Figure 3 generation
├── fig4_plant.R                   # Figure 4 generation
├── fig5_Plant_productivity.R      # Figure 5 generation
└── funnel_plot.R                  # Publication bias — funnel plots
```

---

## Data Description

The dataset comprises **1,152 observations** extracted from peer-reviewed studies on nanobubble irrigation, covering:

- **Six nanobubble gas types**: O₂, CO₂, ozone, air, N₂, and mixed gases
- **Eight functional domains**: rhizosphere DO, soil redox, urease activity, nitrification, oxidative stress (ROS), root hydraulic conductance, photosynthesis, and crop yield
- **Crop groups**: cereals, vegetables, fruits, and legumes
- **Soil textures**: sandy, loamy, and clay-loam
- **Cultivation systems**: field, greenhouse, and hydroponic

---

## Code Description

All analyses were conducted in **R version 4.2.1** on macOS (aarch64-apple-darwin20). Scripts are organised by functional domain:

| Script | Description |
|---|---|
| `1_study_DO.R` | Effect sizes for rhizosphere dissolved oxygen (66–485% increase) |
| `1_study_EC.R` | Electrical conductivity responses across nanobubble types |
| `1_study_Redox.R` | Redox potential modulation by gas type and soil texture |
| `1_study_Soil_Oxygen.R` | Soil oxygen dynamics under nanobubble irrigation |
| `4_study_Paint_Belowground.R` | Belowground biomass and root architecture responses |
| `4_study_Paint_aboveground.R` | Aboveground biomass and shoot growth responses |
| `5_study_Soil.R` | Urease activity (55–203%), nitrification, and nitrogen cycling |
| `6_study_yield.R` | Crop yield responses (42–53% increase) across all crop groups |
| `Overall.R` | Combined random-effects models, moderator analyses, and structural equation modelling (R²=0.85, β=0.64) |
| `fig1_DO_Eh_9_feb.R` | Generates Figure 1 (DO and redox potential) |
| `fig2_9feb.R` | Generates Figure 2 |
| `fig3_Oxy_enz_OC.R` | Generates Figure 3 (oxidative stress and enzyme activity) |
| `fig4_plant.R` | Generates Figure 4 (plant physiological responses) |
| `fig5_Plant_productivity.R` | Generates Figure 5 (water-use efficiency and yield) |
| `funnel_plot.R` | Publication bias assessment — funnel plots and Egger's test |

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
  "tidyr",          # v1.3.1  — data reshaping
  "readxl",         # v1.4.3  — reading data files
  "ggpubr",         # v0.4.0  — publication-ready figures
  "gridExtra",      # v2.3    — figure layout
  "viridis",        # v0.6.2  — colour scales
  "ggsci",          # v2.9    — journal colour palettes
  "multcompView"    # v0.1-8  — multiple comparison display
))
```

### Run order

Execute scripts in the following sequence to reproduce all results:

```r
# Step 1: Individual domain analyses
source("1_study_DO.R")
source("1_study_EC.R")
source("1_study_Redox.R")
source("1_study_Soil_Oxygen.R")
source("4_study_Paint_Belowground.R")
source("4_study_Paint_aboveground.R")
source("5_study_Soil.R")
source("6_study_yield.R")

# Step 2: Overall meta-analysis and structural equation modelling
source("Overall.R")

# Step 3: Publication bias
source("funnel_plot.R")

# Step 4: Generate all manuscript figures
source("fig1_DO_Eh_9_feb.R")
source("fig2_9feb.R")
source("fig3_Oxy_enz_OC.R")
source("fig4_plant.R")
source("fig5_Plant_productivity.R")
```

---

## R Session Information

Full session details are provided in `session_info.txt`. Key environment:

| Item | Details |
|---|---|
| R version | 4.2.1 (2022-06-23) |
| Platform | aarch64-apple-darwin20 (64-bit) |
| Operating system | macOS 15.6.1 |
| Key packages | metafor 3.8-1, meta 6.0-0, ggplot2 3.5.0, dplyr 1.1.4 |

---

## Key Findings

- Nanobubble irrigation elevated rhizosphere **dissolved oxygen by 66–485%**
- **Urease activity** increased by 55–203%, enhancing the nitrification cascade
- **Water-use efficiency** improved by 53–77% under oxygen nanobubbles
- CO₂ nanobubbles reduced **oxidative stress by 284%**
- Structural equation modelling identified **photosynthetic function** as the dominant yield driver (β=0.64, R²=0.85)
- **Crop yield** increased by 42–53% across all crop groups

---

## Citation

If you use this data or code, please cite:

> Rehman, M.M.U., Khattak, S., Zhao, L., Zhu, Y., Xiao, Y.-L., Tao, H.-Y., Iqbal, A., Abrar, M., Zhu, L., Sun, H., Khan, W., Wang, Y.-B., Fu, Y., Mo, F.\*, & Xiong, Y.-C.\* Nanobubble irrigation enhances crop water productivity by rebalancing rhizosphere redox, biogeochemistry and hydraulic function: A systematic meta-analysis. *Nature Water*. https://doi.org/10.5281/zenodo.19213026

---

## Data and Code Availability Statement

*(For inclusion in the Nature Water manuscript)*

> All R scripts and data supporting this study are openly available on GitHub at https://github.com/Maqsood9000/nature-water-meta-analysis-2026 and are permanently archived at Zenodo (https://doi.org/10.5281/zenodo.19213026).

---

## License

This repository is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for full details.

© 2026 Muhammad Maqsood Ur Rehman
