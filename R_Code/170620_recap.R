
# list + data.frame -> generische Vektoren
df <- data.frame(
  a = 1:10,
  b = 1:5
)

str(df)
summary(df)

# vekoren
x <-c(1, 2) # -> numeric
c("a", "b") # -> character
1:5 # -> integer
c(TRUE, FALSE) # -> logical

str(x)
summary(x)


# Subsetting
df[c(1, 2)] # -> mit Position
df[c("b", "a")] # -> mit Namen

df["a"]

# Einlesen von Daten
library(readr)
read_csv("data/Analytics.csv")













