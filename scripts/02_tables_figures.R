# 02_tables_figures.R
# Assumes kenya and glm2, glm_GAD already exist from 01_analysis_PHQ_GAD.R

# Example: extract ORs and CIs from glm2 into a data frame
coefs2 <- summary(glm2)$coefficients
OR2    <- exp(coefs2[, "Estimate"])
low2   <- exp(coefs2[, "Estimate"] - 1.96 * coefs2[, "Std. Error"])
up2    <- exp(coefs2[, "Estimate"] + 1.96 * coefs2[, "Std. Error"])

tab_glm2 <- data.frame(
  term = rownames(coefs2),
  OR   = OR2,
  CI_lower = low2,
  CI_upper = up2,
  p_value  = coefs2[, "Pr(>|z|)"]
)

# Write to CSV for manuscript tables
readr::write_csv(tab_glm2, "outputs/table_logistic_PHQ_high.csv")
