myfunction <- function () {
  x <- rnorm (100)
  mean(x)
}

second <- function (x) {
  x + rnorm (length (x))
}

myfunction2 <- function() {
  x1 <- 1:10
  y1 <- 11:20
  z1 <- cbind(x1,y1)
  print (z1)
}

myfunction3 <- function() {
  x1 <- factor(c ("yes", "yes", "no", "yes", "no", "yes", "none"), levels = c("yes", "no")) ##none will be ignored
  x1 <- factor(c ("yes", "yes", "no", "yes", "no", "yes", "none"), levels = c("yes", "none", "no")) ##everything will be tabulated
  print (x1); table (x1)
}