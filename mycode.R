myfunction <- function () {
  x <- rnorm (100)
  mean(x)
}

second <- function (x) {
  x + rnorm (length (x))
}

if(FALSE){
  myfunction2 <- function() {
    x1 <- 1:10
    y1 <- 11:20
    z1 <- cbind(x1,y1)
    print (z1)
  }
}

myfunction3 <- function() {
  x1 <- factor(c ("yes", "yes", "no", "yes", "no", "yes", "none"), levels = c("yes", "no")) ##none will be ignored
  x1 <- factor(c ("yes", "yes", "no", "yes", "no", "yes", "none"), levels = c("yes", "none", "no")) ##everything will be tabulated
  print (x1); table (x1)
}

myfunction4 <- function() {
  x <- data.frame (foo = 1:4, bar = c(T,T,F,F))
  print (x);
  print (nrow (x))
  print (ncol (x))
}

myfunction5 <- function() {
  m <- matrix(1:4, nrow=2, ncol=2);
  dimnames(m) <- list (c("a", "b"), c("c","d"))
  print (m)
}

myReadTable <- function() {
  data <- read.csv("C:/Users/AbeLim/myGitHubRepo/GDP_Malaysia_2H2016.csv");
  print (data)
}

myReadLargeTable <- function() {
  initial <- read.table("datatable.txt", nrows = 100) ##tells R how many rows
  classes <- sapply (initial, class) ##tells
  tabAll <- read.table ("datatable.txt", colClasses = classes)
}

mydputtest <- function() {
  y1 <- data.frame(a = 1, b = "haha")
  dput (y1)
  structure (list (a = 1, 
                   b = structure (1L, .Label = "haha", class = "factor")),
             .Names = c ("a", "b"), row.names = c(NA, -1L),
             class = "data.frame")
  dput (y1, file = "y1.R")
  new.y1 <- dget("y1.R")
  new.y1
  print (y1)
  
} ##end of mydputtest()

mydumptest <- function() {
  x <- "food"
  y <- data.frame(a = 1, b = "a")
  dump (c ("x","y"), file = "data.R")
  rm (x, y)
  #print ( paste0("After Removing", x, y));
  source ("data.R") ## re-sourcing the file which we've the information saved
  sprintf("After Re-sourcing X: %s, %s", x, y);
  
}

myreadFile <- function () {
  con <- gzfile ("foo.txt.gz")
  data1 <- readLines(con, 10)
  print (data1)
}

myreadURL <- function (urlpath) { ##example: source("mycode.R"); myreadURL("http://www.jhsph.edu")
  con <- url (urlpath, "r")
  x <- readLines(con)
  head(x)
}

mysubsetting <- function() {
  x <- c("a", "b", "c", "c", "d", "a")
  x [ x > "a"] ## returns ONLY elements which are greater than a
  u <- x > "a" ## tells U, what are the elements which matches then condition greater than "a"
  print (u)
  
}

mysubsettingList <- function() {
  x <- list(foo = 1:4, bar = 0.6, baz = "hello", name = "abe")
  print (x[1])
  print (x[[1]])
  print (x$bar) ##$ sign gives the element associated with bar
  print (x["name"])
  print (x[["bar"]])
  print (x[c(1,3)]) ##looks for the 1st and 3rd elements
  special <- "foo"
  print (x[[special]]) ##it calculates the index of food which can be found, since it is foo
  print (x$special) ##this cannot be found
  print (x$foo) ##foo exist, so it can be found
}

mysubsettingMatrix <- function() {
  x <- matrix(1:6, 2, 3) ##2 rows, 3 columns
  print (x)
  u <- x > "1"
  print(u)
  y <- x [1,2,drop=FALSE]
  print (y)
}

mypartialMatch <- function() {
  x <- list(aardvark = 1:5)
  print(x$a)
  print (x[["a"]])
  print (x[["a", exact = FALSE]])
}

myRemoveNA <- function() {
  x <- c(1, 2, NA, 4, NA, 5)
  bad <- is.na(x) ## bad is all the NA elements
  print (x[!bad]) ## inverse of bad are all the good elements
  x <- c(1, 2, NA, 4, NA, 5)
  y <- c("a", "b", NA, "d", NA, "f")
  good <- complete.cases(x, y)
  print(good)
  print (x[good])
  print (y[good])
}

myRemoveNA_from_file <- function() {
  mydata <- read.csv("hw1_data.csv")
  #print(mydata[][1])
  all_na <- is.na(mydata)
  no_of_lines <- nrow(mydata) ##calc total number of rows
  no_na_ocean <- sum(is.na(mydata[][1])) ##calc the number of NAs
  ##print(colSums(!is.na(mydata[][1])))
  ##summing up the columns
  mean_of_ocean <- sum(mydata$Ozone,na.rm=TRUE)/sum(!is.na(mydata[][1]))
  print(mean_of_ocean)
  
  #Very useful example of subset usage
  #print(subset(mydata, Ozone>31 & Temp>90, select = c(Ozone, Temp, Solar.R)))
  #print(sum(subset(mydata, Ozone>31 & Temp>90, select = Solar.R))/sum(!is.na(subset(mydata, Ozone>31 & Temp>90, select = Solar.R))))
  #print(sum(subset(mydata, Month==6, select = Temp)))/sum(!is.na(subset(mydata, Month==6, select = Temp)))
  print(max(subset(mydata, Month==5, select = Ozone), na.rm = TRUE))
  
  #x <- matrix(1:6, 2, 3)
  #print (x)
  
  #for (i in seq_len(nrow(x))){
  #  for (j in seq_len(ncol(x))){
  #    print (x[i,j])
  #  }
  #}
  
  z<-5
  
  while(z >=3 && z <= 10) {
    print (z)
    coin <- rbinom(1,1,0.5)
    if (coin == 1) { ##random walk
      z <- z + 1
    } else {
      z <- z - 1
      break()
    }
  }

  #no_of_bad_lines <- nrow(bad_data_ocean)
  #print(no_of_bad_lines)
  #n<-nrow(mydata) #getting the number of rows
  #print (subset(mydata[][1]))
  #bad <- is.na(mydata)
  #ozone_temp <- mydata[][!bad] ##extracting ozone
  #print (ozone_temp)
}

myVectorOp <- function() {
  x <- 1:4; y <- 6:9
  z = x + y
  print (z)
  print (z > 20)
  print (y == 8)
  z = x * y
  print (z)
}

add2 <- function(x,y){
  x + y
}

above10 <- function (x) { 
  use <- x > 10
  x[use]
}


aboveX <- function (x, n = 10){ ##default value
  use <- x > n
  x[use]
}

columnMean <- function (y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric (nc)
  for (i in 1:nc) {
    means[i] <- mean(y[ ,i], na.rm = removeNA)
  }
  means #return
  
}

