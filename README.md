# The irrigation-derived nanobubbles boost unseen water productivity via relieving rhizosphere constraints: A global implication

**Running title:** Widely-overlooked potential of nanobubbles

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.20072562.svg)](https://doi.org/10.5281/zenodo.20072562)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/Maqsood9000/nature-water-meta-analysis-2026/blob/main/LICENSE)
[![Journal: Nature Water](https://img.shields.io/badge/Journal-Nature%20Water-blue.svg)]()
[![R version](https://img.shields.io/badge/R-4.3.2-276DC3.svg)](https://www.r-project.org/)

---

## Authors

Muhammad Maqsood Ur Rehman<sup>a,b †</sup>, Sidra Khattak<sup>a †</sup>, Ling Zhao<sup>a</sup>, Ying Zhu<sup>c</sup>, Hong-Yan Tao<sup>a</sup>, Ze-Ying Zhao<sup>a</sup>, Wei Wang<sup>a</sup>, Yun-Li Xiao<sup>d</sup>, Muhammad Ashraf<sup>e</sup>, Awais Iqbal<sup>a</sup>, Muhammad Abrar<sup>a</sup>, Li Zhu<sup>d</sup>, Hao Sun<sup>d</sup>, Wasim Khan<sup>a</sup>, Yi-Bo Wang<sup>b</sup>, Yue Fu<sup>d</sup>, Fei Mo<sup>f</sup>\*, You-Cai Xiong<sup>a</sup>\*

† M.M.U. Rehman and S. Khattak contributed equally to this work.  
\* Corresponding authors

---

## Affiliations

<sup>a</sup> State Key Laboratory of Herbage Improvement and Grassland Agro-Ecosystems, College of Ecology, Lanzhou University, Lanzhou 730000, China  
<sup>b</sup> School of Earth and Environmental Sciences, Lanzhou University, Lanzhou 730000, China  
<sup>c</sup> Institute of Biology, Gansu Academy of Sciences, Lanzhou 730000, China  
<sup>d</sup> College of Biology and Agricultural Resources, Huanggang Normal University, Huanggang 438000, China  
<sup>e</sup> Institute of Molecular Biology and Biotechnology, The University of Lahore, Lahore 54000, Pakistan  
<sup>f</sup> College of Agronomy, Northwest A & F University, Yangling, Shaanxi 712100, China

---

## Corresponding Authors

**You-Cai Xiong** — State Key Laboratory of Herbage Improvement and Grassland Agro-ecosystems, College of Ecology, Lanzhou University, China  
Tel/Fax: +86-931-8914500 | Email: xiongyc@lzu.edu.cn

**Fei Mo** — College of Agronomy, Northwest A & F University, Yangling, Shaanxi, China  
Email: mofei@nwafu.edu.cn

---

## Abstract

Conventional irrigation depletes rhizosphere dissolved oxygen (DO) substantially, impairing root hydraulic conductance and crop growth. The irrigation-derived nanobubbles (NBs) play a vital role in alleviating rhizosphere hypoxia and water limitation, yet it is little documented. Here, we report a global meta-analysis with **1,152 observations** across **6 NB types**, quantifying moderator-resolved effects on rhizosphere physiochemistry and **8 biological domains**. Gas type, soil texture, generation technology, and cultivation system hierarchically control DO enrichment (39–485%), redox potential, and electrical conductivity. The ensuing biological cascade shows urease stimulation (55–203%), root architecture improvement, and water-use efficiency gains (53–77%). Gas types affect reactive oxygen species polarity, where O₂ and ozone NBs are pro-oxidant, yet CO₂ NBs reduce oxidative stress by 284%. Structural equation modelling (*R²* = 0.85) confirms the global NB-led photosynthetic function driver (β = 0.64), improving yield by 42–50%. Therefore, the irrigation-derived NBs offer a widely-overlooked but precision option to boost unseen water productivity and crop drought resilience.

**Keywords:** Nanobubble irrigation; rhizosphere oxygen; water-use efficiency; soil biogeochemistry; reactive oxygen species; crop productivity.

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
│   └── Table_S1.xlsx                  # Supplementary Data 1 — all effect sizes
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
    └── Fig3_SEM                       # Figure 3 — structural equation model (SPSS AMOS)
```

---

## Data Description

The dataset comprises **1,152 observations** extracted from **21 peer-reviewed studies** on nanobubble irrigation, sourced from **6 countries** (Fig. S2), covering:

- **Six nanobubble gas types**: O₂, CO₂, ozone, air, N₂, and H₂
- **Five generation technologies**: membrane-diffusion, hybrid, electrochemical, adsorption-based, hydrodynamic cavitation
- **Three irrigation delivery modes**: surface irrigation, drip irrigation, floating-raft (hydroponic)
- **Eight biological domains**: rhizosphere physicochemistry, soil enzyme activity, nutrient availability, root architecture, water-use efficiency, photosynthetic function, ROS status, and crop yield
- **Crop functional groups**: cereals, vegetables, and forage crops
- **Soil textures**: fine (clay/silt) and medium (loam)
- **Cultivation systems**: field, greenhouse, and hydroponic

All effect sizes, 95% confidence intervals, P values, and heterogeneity statistics are provided in `Table_S1.xlsx` (Supplementary Data 1).

---

## Code Description

All analyses were conducted in **R version 4.3.2** using the `meta` (v6.5-0) and `metafor` (v4.4-0) packages. Scripts are organised by functional domain:

### Analysis scripts

| Script | Description |
|---|---|
| `1_study_DO.R` | Effect sizes for rhizosphere dissolved oxygen (39–485% increase across gas and size classes) |
| `1_study_EC.R` | Electrical conductivity responses across nanobubble types and generation technologies |
| `1_study_Redox.R` | Redox potential modulation by gas type, soil texture, and generation technology |
| `1_study_Soil_Oxygen.R` | Soil oxygen dynamics under nanobubble irrigation |
| `4_study_Paint_Belowground.R` | Belowground biomass, root architecture, and root metabolic activity responses |
| `4_study_Paint_aboveground.R` | Aboveground biomass, leaf traits, shoot growth, and WUE responses (53–77%) |
| `5_study_Soil.R` | Urease (55–203%), catalase, invertase, and phosphatase activities; nitrogen and carbon pool dynamics |
| `6_study_yield.R` | Crop yield responses (42–50%) across soil pH regimes and crop functional groups |
| `Overall.R` | Combined random-effects models (pooled lnRR = 0.5017; I² = 99.3%; τ² = 0.4200; Q = 176,148.51), moderator analyses |
| `funnel_plot.R` | Publication bias — funnel plots, Egger's test (z = 17.48, P < 0.0001), Rosenthal fail-safe N = 42,440,181 |

### Figure scripts

| Script | Figure | Description |
|---|---|---|
| `Fig1.R` | Fig. 1 | Moderator-resolved effects on rhizosphere DO, EC, and redox potential across six moderator categories: bubble size, cultivation system, generation technology, soil texture, irrigation delivery mode, and co-amendments |
| `Fig2.R` | Fig. 2 | Anatomy-based bar chart panels (a–i) showing carrier-gas-dependent biological cascade from soil biogeochemistry to crop yield |
| `Fig3_SEM` | Fig. 3 | Structural equation model path diagram (constructed in IBM SPSS Amos v29.0; no R script available) |

---

## How to Reproduce the Analysis

### Prerequisites

R version 4.3.2 or higher is required. Install all dependencies with:

```r
install.packages(c(
  "metafor",        # v4.4-0  — meta-analysis models (rma, regtest, fsn)
  "meta",           # v6.5-0  — meta-analysis utilities (metagen, subgroup)
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

> **Note:** The structural equation model (Fig. 3) was constructed in **IBM SPSS Amos v29.0** (IBM Corp., Armonk, NY) and cannot be reproduced from R scripts. The path structure, fit indices, and standardised coefficients are described in full in the Methods section of the manuscript.

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

# Step 2: Overall meta-analysis
source("analysis/Overall.R")

# Step 3: Publication bias assessment
source("analysis/funnel_plot.R")

# Step 4: Generate manuscript figures
source("figures/Fig1.R")     # Fig. 1 — moderator-resolved physicochemistry
source("figures/Fig2.R")     # Fig. 2 — biological cascade
# Fig. 3 was generated in IBM SPSS Amos v29.0 — no R script available
```

---

## R Session Information

Full session details are provided in `session_info.txt`. Key environment:

| Item | Details |
|---|---|
| R version | 4.3.2 |
| Platform | aarch64-apple-darwin20 (64-bit) |
| Key packages | metafor 4.4-0, meta 6.5-0, ggplot2 3.5.0, dplyr 1.1.4, cowplot 1.1.1 |
| SEM software | IBM SPSS Amos v29.0 |

---

## Key Findings

**Moderator hierarchy (Fig. 1)**  
Gas type, soil texture, generation technology, and cultivation system hierarchically modulated DO enrichment (39–485%), redox potential, and electrical conductivity. Membrane-diffusion systems achieved the highest DO gains across all carrier gases; fine-textured soils amplified all physicochemical responses; greenhouse conditions suppressed bubble coalescence and delivered the highest DO enrichment.

**Biological cascade (Fig. 2a–i)**
- *Soil enzymes:* O₂ NBs increased urease by 203% and catalase by 51%; ozone increased urease by 55%; H₂ enhanced invertase, phosphatase, and catalase by 58%, 44%, and 41%
- *Soil nutrients:* O₂ NBs increased ammonium, nitrate, organic carbon, and bulk oxygen by 50–68%; air NBs enhanced organic carbon by 85%
- *Root architecture:* Root metabolic activity improved by 57–89%; root length by 47–60%
- *WUE:* O₂ NBs improved WUE by 77%; air NBs by 53%
- *Photosynthesis:* Photosynthetic rate improved by 48–163%; chlorophyll content by 58–90%; stomatal conductance by 48–58%
- *Yield:* O₂ NBs improved cereal, vegetable, and forage yields by 42%, 52%, and 53%; stronger responses in alkaline versus acidic soils

**Gas-type polarity of ROS (Fig. 2h)**  
O₂, air, ozone, and H₂ NBs induced pro-oxidant responses (49–184%); CO₂ and N₂ NBs suppressed ROS accumulation by 284% and 159%, respectively.

**Causal synthesis (Fig. 3)**  
SEM (χ² = 4.77, CFI = 1, P = 0.6, RMSEA = 0.33; R² = 0.85) revealed:
- NB type → redox–ionic environment (β = 0.30) → soil biogeochemistry (β = 0.61) → root architecture → photosynthesis → yield
- NB type → soil biogeochemical activity (β = 0.38) → photosynthetic function (β = 0.48)
- NB type → ROS (β = 0.51); ROS → productivity (β = −0.28)
- Photosynthetic function is the dominant proximal driver of productivity (β = 0.64)

---

## Meta-Analysis Statistics Summary

| Statistic | Value |
|---|---|
| Total observations | 1,152 paired observations |
| Included studies | 21 (from 6 countries) |
| Countries | Japan, China, USA, Spain, Australia, Pakistan (Fig. S2) |
| Effect size metric | Log response ratio (lnRR) |
| Variance estimator | Hedges (HE) estimator; Q-profile 95% CI |
| Pooled lnRR | 0.5017 (95% CI: 0.4633–0.5401; P < 0.0001) |
| Heterogeneity (I²) | 99.3% |
| Between-study variance (τ²) | 0.4200 |
| Cochran's Q | 176,148.51 (df = 1,151; P < 0.0001) |
| Egger's test | z = 17.48, P < 0.0001 (b = 0.2412; 95% CI: 0.1996–0.2828) |
| Rosenthal fail-safe N | 42,440,181 |
| SEM model fit | χ² = 4.77; CFI = 1; P = 0.6; RMSEA = 0.33; R² = 0.85 |

---

## Supplementary Materials

| Item | Contents |
|---|---|
| `Table_S1.xlsx` — Sheet 1 | All effect sizes for Fig. 1 moderator analysis (73 subgroup estimates) |
| `Table_S1.xlsx` — Sheet 2 | All effect sizes for Fig. 2 biological cascade (88 estimates) |
| Fig. S1 | PRISMA 2020 flow diagram (40 candidates screened; 21 included) |
| Fig. S2 | Geographic distribution of 21 included studies across 6 countries |
| Fig. S3 | Funnel plot for publication bias assessment |
| Fig. S4 | Hypothesised SEM path structure prior to model fitting |

---

## Citation

If you use this data or code, please cite:

> Rehman, M.M.U., Khattak, S., Zhao, L., Zhu, Y., Tao, H.-Y., Zhao, Z.-Y., Wang, W., Xiao, Y.-L., Ashraf, M., Iqbal, A., Abrar, M., Zhu, L., Sun, H., Khan, W., Wang, Y.-B., Fu, Y., Mo, F.\*, & Xiong, Y.-C.\* (2026). The irrigation-derived nanobubbles boost unseen water productivity via relieving rhizosphere constraints: A global implication. *Nature Water*. https://doi.org/10.5281/zenodo.20072562

---

## Data and Code Availability Statement

All R scripts and data supporting this study are openly available on GitHub at  
https://github.com/Maqsood9000/nature-water-meta-analysis-2026  
and are permanently archived at Zenodo (https://doi.org/10.5281/zenodo.20072562).  
Complete effect sizes, 95% confidence intervals, P values, and heterogeneity statistics for all meta-analytic subgroup analyses are provided in Supplementary Data 1 (`Table_S1.xlsx`). The meta-analysis dataset is also available from the corresponding author (xiongyc@lzu.edu.cn) on reasonable request.

---

## Funding

This study was supported by the National Natural Science Foundation of China (32161143012 and W2533075), Central Leading Local Science and Technology Development Fund Project in Qinghai Province (2025ZY035), Gansu Province High-end Foreign Expert Introduction Plan Project (25KA011), and "111" Program (BP0719040 and D23029).

---

## License

This repository is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for full details.

© 2026 Muhammad Maqsood Ur Rehman
