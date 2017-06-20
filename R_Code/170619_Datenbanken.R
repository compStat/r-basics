library(readr)
library(readxl)

analytics <- read_csv(
  "data/Analytics.csv",
  col_types = cols(
    date = col_date(format = "%Y%m%d"),
    users = col_integer(),
    newUsers = col_integer(),
    sessions = col_integer(),
    bounces = col_integer(),
    sessionDuration = col_integer(),
    pageviews = col_integer(),
    avgTimeOnPage = col_double(),
    userGender = col_factor(levels = c("female", "male")),
    bouncesHigh = col_character()
  )
)

analytics$userGender

read_excel(
  "data/analytics.xlsx",
  sheet = 1
)

# Einlesen von Tabellen aus Datenbanken
library(DBI)
library(RSQLite)

db <- dbConnect(RSQLite::SQLite(), "analytics.db")

createAnalyticsTable <- "
CREATE TABLE Analytics
(id INTEGER PRIMARY KEY,
date TEXT,
userGender VARCHAR(10),
users INT,
newUsers INT,
sessions INT,
bounces INT,
sessionDuration INT,
pageviews INT,
avgTimeOnPage DOUBLE,
bouncesHigh VARCHAR(10)
)
"
# dbExecute(db, "DROP TABLE Analytics")

dbExecute(db, createAnalyticsTable)
dbListTables(db)
dbListFields(db, "Analytics")
dbWriteTable(
  db, 
  "Analytics", 
  analytics,
  append = TRUE,
  overwrite = FALSE,
  row.names = FALSE
)

dbReadTable(db, "Analytics")

sqlQuery <- "SELECT * FROM Analytics"
dbGetQuery(db, sqlQuery)

paste0("SELECT * FROM Analytics WHERE userGender = '",
       gender,
       "'"
)

dbGetQuery(
  db,
  "SELECT * FROM Analytics WHERE userGender = :gender",
  params = list(gender = c("female", "male"))
)

dbDisconnect(db)














