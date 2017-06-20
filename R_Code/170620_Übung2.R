# Übungen zu dplyr

titanic <- read_csv("data/titanic.csv")

# 1. Entfernen von X1
titanic <- titanic %>% select(-X1)

# 2. 
## a) Anteilswerte 'survived' nach Klasse
titanic %>%
  group_by(pclass) %>%
  summarise(survivedProp = mean(survived))

## b) wie oben zusätzlich nach 'sex'
titanic %>%
  group_by(pclass, sex) %>%
  summarise(survivedProp = mean(survived))

# 3.
## a) Löschen von 'sibsp' bis 'ticket'
titanicPassengerAge <- titanic %>%
  select(-(sibsp:ticket), -(cabin:home.dest))

## b) Mittelwert für Alter nach 'survived' + 'sex'
titanicPassengerAge %>%
  group_by(survived) %>%
  summarise(
    meanAge = mean(age[!is.na(age)]),
    meanAge1 = mean(age, na.rm = TRUE)
  )

titanicPassengerAge %>%
  group_by(survived, sex) %>%
  summarise(meanAge = mean(age, na.rm = TRUE))

titanicPassengerAge %>%
  group_by(survived, sex) %>%
  summarise(count = n()) # COUNT(*)

# 4. Sortiere nach 'age' / schaue nach 5 Ältesten und Jüngsten
titanicPassengerAge %>%
  arrange(desc(age)) %>%
  slice(1:5)

titanicPassengerAge %>%
  arrange(age) %>%
  slice(1:5)


# 5. Überprüfe, ob die 5 jüngsten Passagiere mit Eltern unterwegs waren 
#    (Datenvalidierung)
titanic %>%
  arrange(age) %>%
  slice(1:5) %>%
  View

# 6. 
## a) Erstelle Variable 'alone'
titanic %>%
  mutate(alone = ifelse(sibsp + parch == 0, 1, 0))

## b) Minimum für 'Alleinreisende'
## c) Filter zur Auswahl des unteren 25% Quantils nach Alter. 
##    Anteilswert nach 'survived'

# 7. 
## a) 25% + 75% Quantil, Median, Mittelwert nach 'survived'
## b) wie oben, zusätzlich nach Klasse






