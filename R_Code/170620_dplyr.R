# dplyr + Data-Management
library(readr)
library(dplyr)

# Zur Verwendung von Funktionen bei Namenskonflikten:
# dplyr::filter
# stats::filter

# Laden der Daten
analytics <- read_csv("data/Analytics.csv")

# Auswahl von Zeilen
# filter -> vergl. WHERE 
# slice -> Auswahl von Zeilen mit Position
filter(
  analytics, 
  userGender == "female",
  sessionDuration < 300
)

# Beispiel mit base-R (schwieriger zu lesen)
# analytics[analytics$userGender == "female" & 
#             analytics$sessionDuration < 300, ]
# analytics[zeilenIndices, spaltenIndizes]

slice(analytics, 1:2)

# Sortieren
arrange(analytics, sessionDuration) # ORDER BY
arrange(analytics, desc(sessionDuration)) # absteigend sortiert

# Auswahl von Spalten
select(analytics, date, users) # Angabe der Spaltennamen
select(analytics, -date, -users) # 'drop' 
select(analytics, newUsers:sessionDuration) # von bis
select(analytics, -(newUsers:sessionDuration)) # 'drop' von bis
select(analytics, starts_with("session")) # Alle Spalten die mit 'session' beginnen
select(analytics, matches("user")) # Alle Spalten mit 'user'

# Berechnung von neuen Variablen
mutate( # fügt neue Variablen zu Datensatz hinzu
  analytics, 
  avgSessionDuration = sessionDuration / sessions,
  avgTimeOnPage = avgTimeOnPage / users
)

transmute( # behält nur die neuen Vvariablen
  analytics, 
  avgSessionDuration = sessionDuration / sessions,
  avgTimeOnPage = avgTimeOnPage / users
)

# GROUP BY bzw. Statistiken für Gruppen in Daten
summarise(
  analytics, 
  sumSessionDuration = sum(sessionDuration),
  avgTimeOnPage = mean(avgTimeOnPage)
)

analyticsGrouped <- group_by(analytics, userGender)
summarise(
  analyticsGrouped, 
  sumSessionDuration = sum(sessionDuration),
  avgTimeOnPage = mean(avgTimeOnPage)
)
analyticsUnGrouped <- ungroup(analyticsGrouped)

# Miscs
# left_join() + right_join + etc.
# rename
sample_n(analytics, size = 5)
sample_frac(analytics, size = 0.5)


# Chaining
select(mutate(filter(
  analytics, 
  sessionDuration < 300
),
avgSessionDuration = mean(sessionDuration)
),
avgSessionDuration
)

analyticsTmp <- filter(
  analytics, 
  sessionDuration < 300
)
analyticsTmp <- mutate(
  analyticsTmp,
  avgSessionDuration = mean(sessionDuration)
)
analyticsTmp <- select(
  analyticsTmp,
  avgSessionDuration
)

analyticsTmp <- analytics %>%
  group_by(userGender) %>%
  filter(sessionDuration < 300) %>%
  mutate(avgSessionDuration = mean(sessionDuration)) %>%
  # ungroup() %>%
  select(avgSessionDuration)





















