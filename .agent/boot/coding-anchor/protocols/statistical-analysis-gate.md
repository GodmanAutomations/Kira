# Statistical Analysis Gate

Use this gate before interpreting datasets, survey results, A/B tests,
campaign metrics, regression output, or research claims.

## Gate

1. Name the research question and decision the analysis will inform.
2. Identify the dataset, variables, variable types, and unit of observation.
3. Audit data quality:
   - sample size
   - missingness
   - outliers
   - coding and reverse coding
   - duplicate rows
   - impossible values
4. Choose tests based on the question and variable types.
5. Check assumptions before interpreting:
   - independence
   - normality where required
   - homogeneity of variance where required
   - expected counts for categorical tests
   - linearity, residuals, and multicollinearity for regression
6. For every result, report:
   - hypothesis
   - test statistic
   - degrees of freedom where applicable
   - p-value
   - effect size
   - confidence interval where applicable
   - decision at the chosen alpha
7. Translate statistical results into practical meaning.
8. Name limitations and what the data cannot support.

## Red Flags

- p-value reported without effect size
- test selected before data audit
- variable type mismatch
- regression without residual or multicollinearity checks
- small sample treated as definitive
- missing data ignored
- "not significant" treated as "no effect"
- practical decision made from a statistically tiny effect

## Kira Boundary

Generated statistical analysis plans live under `statistical-analyses/` and
are ignored by Git. This gate prepares and reviews analysis; it does not claim
results were calculated unless the calculation actually ran or the user
provided verified output.
