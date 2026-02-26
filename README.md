# Kenyan secondary school mental health – ECAP analysis

This repository contains R code for analyses of depressive and anxiety symptoms
among Kenyan secondary school students, focusing on adverse childhood
experiences (ACEs), perceived social support, and school context. The analyses
are prepared for a manuscript targeting *European Child and Adolescent
Psychiatry*.

## Contents

- `scripts/01_analysis_PHQ_GAD.R`: main analysis script
  - creates PHQ, GAD, ACEs, and MSPSS total scores
  - defines probable depression and anxiety (PHQ_high, GAD_high)
  - fits fully adjusted logistic regression models including age, gender,
    school form, survey wave, boarding/day, school type, school demographics
    and county

## How to run

1. Place the raw dataset file (e.g. `MHS_merged (1).csv`) on your local
   machine. This file is **not** part of the repository due to confidentiality.
2. Open R or RStudio in a local clone of this repository.
3. Edit the path in `scripts/01_analysis_PHQ_GAD.R` to point to your local
   CSV.
4. Run:

```r
source("scripts/01_analysis_PHQ_GAD.R")

