## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(mtx = matrix()) {

  inv <- NULL

  list(
    set.matrix = set.matrix <- function(m) {
      mtx <<- m
      inv <<- NULL
    },
    get.matrix = get.matrix <- function() {
      mtx
    },
    set.inverse = set.inverse <- function(m) {
      inv <<- m
    },
    get.inverse = get.inverse <- function() {
      inv
    }
  )

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'

  inv <- x$get.inverse()

  if(is.null(inv)) {
    mtx <- x$get.matrix()
    inv <- solve(mtx, ...)
    x$set.inverse(inv)
  }
  else {
    message("getting cached data")
  }

  inv

}
