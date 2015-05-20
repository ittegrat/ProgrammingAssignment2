
rm(list=ls())
source("cachematrix.R")

a <- matrix(1:4, nrow=2)

cm <- makeCacheMatrix()
cm$set.matrix(a)
m <- cm$get.matrix()
m
identical(m,a)

invisible(cacheSolve(cm))
b <- cacheSolve(cm)
b

a %*% b
b %*% a
