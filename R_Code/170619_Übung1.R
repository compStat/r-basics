# Übung 8

namedNumbers <- 1:4
names(namedNumbers) <- c("alpha", "beta", "gamma", "delta")
c(alpha = 1, beta = 2, gamma = 3, delta = 4)

namedNumbers[1]
namedNumbers[c("alpha", "delta")]
namedNumbers[c(TRUE, FALSE, TRUE, FALSE)]
ind <- namedNumbers <= 2
namedNumbers[ind]

# 

y <- c(1, 2)
x <- y
y <- 3
x * y

# aList
aList <- list(
  a = seq(1, 5, 0.5),
  b = c("sun", "earth", "moon"),
  d = list(
    fruit = c("apply", "kiwi", "passionf"),
    taste_rank = c(3, 1, 2)
  )
)

str(aList)

# 12
x <- rep(c(2, 1, 2, 3), 3)
x <- factor(
  x,
  levels = c(1, 2, 3),
  labels = c("low", "moderate", "high")
)

# 13
relevel(x, "moderate")
plot(table(x))

# 15
list(
  Name = c("Pamela", "Chris", "Norman"),
  Department = c("Legal", "IT", "Accounting"),
  Salary = c(800, 1000, 500) + 2000,
  ind = 1
)


















