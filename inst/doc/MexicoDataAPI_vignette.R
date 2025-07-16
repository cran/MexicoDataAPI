## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(MexicoDataAPI)
library(ggplot2)
library(dplyr)

## ----mexico-gdp,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----


mexico_gdp <- head(get_mexico_gdp())

print(mexico_gdp)


## ----mexico-life-expectancy,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

life_expectancy <- head(get_mexico_life_expectancy())

print(life_expectancy)


## ----mexico-population,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

mexico_population <- head(get_mexico_population())

print(mexico_population)


## ----mexico-income-plot, message=FALSE, warning=FALSE, fig.width=7, fig.height=5----


# Summary of average income by education level
avg_income_by_education <- mex_income_2008_tbl_df %>%
  group_by(education) %>%
  summarise(avg_income = mean(income, na.rm = TRUE)) %>%
  arrange(desc(avg_income))

# Plot
ggplot(avg_income_by_education, aes(x = reorder(education, avg_income), y = avg_income)) +
  geom_col(fill = "#0072B2") +
  coord_flip() +
  labs(
    title = "Average Household Income by Education Level (2008)",
    x = "Education Level",
    y = "Average Income (MXN)"
  ) +
  theme_minimal()



