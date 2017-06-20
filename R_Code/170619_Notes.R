1 + 1
log(1)
x <- exp(
  log(1)
)

# Kommentare hier!
x <- # 1 Kommentar

# Objekte in R

x <- 1

length(x)
class(x)

x <- 1:10
length(x)
class(x)


x <- c(1, 2, 3)
length(x)
class(x)

x <- c("Chris", "Anna", "Sophie")
length(x)
class(x)

c(1.97, "Anna")
y <- c(c(TRUE, FALSE, 0), "Anna")

y[4:9] <- c(4, 5, 6)

x <- c(1, 2, 3)
names(x) <- c("Chris", "Anna", "Sophie")

x <- c(Chris = 1, Anna = 2, Sophie = 3)
barplot(x)

# Erzeugen von Vektoren
1:10
seq(1, 10, 2)
rep(1:4, 2)

# Vektorisierte Mathe-Operationen
1:4 + 1
log(1:4)
exp(1:4)
(2)^(1:4)

# Generische Vektoren
aList <- list(x = 1, y = "2", z = 3)
aList$x
length(aList)
class(aList)

class(aList[1])
class(aList$x)

str(aList)

# Das data.drame
df <- data.frame(
  name = c("Roger", "Lola", "Mogli"),
  count = c(3, 2, 6)
)

as.numeric(df$name)
as.character(df$name)

factor(
  rep(c(1, 2), 4),
  labels = c("yes", "no")
)

# Fehlende Werte
mean(c(1, 2, NA), na.rm = TRUE)
x <- c(NA, 1:5)
x[!is.na(x)]



















