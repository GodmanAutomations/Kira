---
name: statistical-analysis
description: Kira-local data audit, assumption check, hypothesis test, effect-size, and reporting skill.
context_trigger: "statistics, statistical analysis, regression, chi-square, correlation, reliability, Cronbach, hypothesis test, p-value, survey analysis, t-test, ANOVA, confidence interval"
source: "Adapted from examples/skills/research/statistical-analysis/SKILL.md."
---

# Statistical Analysis

Use this skill when data, experiment results, survey output, campaign metrics,
or research claims need statistical interpretation instead of loose narrative.

## Contract

- Audit the data before choosing tests.
- Match each test to variable types, sample size, and assumptions.
- Report effect sizes; p-values alone are insufficient.
- Separate statistical significance from practical meaning.
- State uncertainty, confidence, missingness, and assumption violations plainly.
- Do not invent data, test results, or confidence levels that were not
  calculated or provided.

## Default Flow

1. Define research question, hypothesis, variables, and dataset location.
2. Audit the data: N, variable types, missingness, outliers, coding, and sample
   size adequacy.
3. Select tests based on variable types and question.
4. Check assumptions before interpreting results.
5. Run or request the needed calculations.
6. Report statistic, df where applicable, p-value, effect size, confidence
   interval where applicable, and decision.
7. Translate results into practical meaning and limitations.
8. Produce a report-ready summary.

## Common Test Families

| Test Family | Typical Use | Required Checks |
| :--- | :--- | :--- |
| Reliability | Scale consistency | Items, item-total, dimensionality |
| Chi-square | Categorical association | Independence, expected cell counts |
| Correlation | Variable association | Linearity or monotonicity, outliers |
| Regression | Prediction/explanation | Linearity, residuals, VIF, independence |
| t-test | Group mean difference | Normality, variance, interval outcome |
| ANOVA | Multi-group mean difference | Normality, variance, post-hoc plan |

## Helper

Use `bin/athena-coding-anchor-statistics "<analysis>"` to create a local
statistical analysis plan. Generated analysis notes live under
`statistical-analyses/` and are ignored by Git unless Stephen deliberately
promotes one.
