# intro to dplyr
library(dplyr)

#load gapminder data set as sample

gapminder <- read.csv("data/gapminder_data.csv", stringsAsFactors = F)

# change continent back to a factor

gapminder$continent <- as.factor(gapminder$continent)

# change continent back to string
gapminder$continent <- as.character(gapminder$continent)

mean (gapminder[gapminder$continent == "Africa", "gdpPercap"])

# this is a pipe %>%
# functions we will learn today from diplyr:
# 1. select()
# 2. filter()
# 3. group_by()
# 4. summarize ()
# 5. mutate()

#what attributes are in gapminder?

colnames(gapminder)

# select 3 attributes from gapminder using pipe
subset_1 <- gapminder %>%
    select(country, continent, lifeExp)
str(subset_1)

# select every attribute except 2
subset_2 <-  gapminder %>%
   select(-lifeExp, -pop)

str(subset_2)

# select some attributes but rename a few of them for clarity
subset_3 <- gapminder %>%
   select(country, population=pop, lifeExp, gdp=gdpPercap)

# using filter()
Africa <- gapminder %>%
  filter(continent == "Africa") %>%
  select(country, population=pop, lifeExp)

table(Africa$country)

# without pipe
Africa <- filter(gapminder, continent == "Africa")
Africa <- select(africa, country, population = pop, lifeExp)

# select year, population, country, for Europe

Europe <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, population=pop, country)

europe_table <- table(Europe$country, Europe$population)
View(europe_table)
