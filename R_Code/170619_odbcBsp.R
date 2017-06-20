library(RODBC)

db <- odbcConnectAccess(
  "C:/.../Name_Of_My_Access_Database" # ohne Datei-Endung 
)

df <- sqlQuery(
  db, 
  "SELECT * FROM table"
)

odbcClose(db)