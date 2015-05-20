
rm(list=ls())
source("cachematrix.R")
tol <- 12

a <- matrix(rnorm(25), nrow=5)

cm <- makeCacheMatrix()
cm$set.matrix(a)
m <- cm$get.matrix()
identical(m,a)

invisible(cacheSolve(cm))
b <- cacheSolve(cm)
#b

identical(
  round(a %*% b, digits = tol),
  diag(nrow(a))
)
identical(
  round(b %*% a, digits = tol),
  diag(nrow(a))
)
