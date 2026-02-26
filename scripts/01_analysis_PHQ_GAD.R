# 01_analysis_PHQ_GAD.R

library(readr)
library(dplyr)
library(car)

# 1. Load data (local path, not committed to GitHub)
kenya <- read_csv("C:/Users/Hiii/Downloads/MHS_merged (1).csv")

# 2. Create scores
kenya <- kenya %>%
  mutate(
    PHQ_total   = rowSums(dplyr::select(., starts_with("PHQ_")),   na.rm = TRUE),
    GAD_total   = rowSums(dplyr::select(., starts_with("GAD_")),   na.rm = TRUE),
    ACES_total  = rowSums(dplyr::select(., starts_with("ACES_")),  na.rm = TRUE),
    MSPSS_total = rowSums(dplyr::select(., starts_with("MSPSS_")), na.rm = TRUE),
    PHQ_high    = ifelse(PHQ_total >= 10, 1, 0),
    GAD_high    = ifelse(GAD_total >= 10, 1, 0)
  )

# 3. Factor coding
kenya <- kenya %>%
  mutate(
    Gender = factor(Gender),
    Form   = factor(Form),
    survey_number = factor(survey_number),
    Boarding_day        = factor(Boarding_day),
    School_type         = factor(School_type),
    School_Demographics = factor(School_Demographics),
    School_County       = factor(School_County)
  )

# 4. Main logistic model (PHQ_high)
glm2 <- glm(
  PHQ_high ~ Age + Gender + Form + survey_number +
    ACES_total + MSPSS_total +
    Boarding_day + School_type + School_Demographics + School_County,
  data = kenya, family = binomial
)

summary(glm2)

coefs2 <- summary(glm2)$coefficients
OR2    <- exp(coefs2[, "Estimate"])
low2   <- exp(coefs2[, "Estimate"] - 1.96 * coefs2[, "Std. Error"])
up2    <- exp(coefs2[, "Estimate"] + 1.96 * coefs2[, "Std. Error"])
cbind(OR2, low2, up2)

# 5. Sensitivity model (GAD_high)
glm_GAD <- glm(
  GAD_high ~ Age + Gender + Form + survey_number +
    ACES_total + MSPSS_total +
    Boarding_day + School_type + School_Demographics + School_County,
  data = kenya, family = binomial
)

summary(glm_GAD)
