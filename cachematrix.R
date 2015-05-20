## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(mtx = matrix()) {

  inv <- NULL

  set.matrix <- function(m) {
    mtx <<- m
    inv <<- NULL
  }
  get.matrix <- function() {
    mtx
  }
  set.inverse <- function(m) {
    inv <<- m
  }
  get.inverse <- function() {
    inv
  }
  
  list(
    set = set.matrix,
    get = get.matrix,
    set.inverse = set.inverse,
    get.inverse = get.inverse
  )

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'

  inv <- x$get.inverse()

  if(is.null(inv)) {
    mtx <- x$get()
    inv <- solve(mtx, ...)
    x$set.inverse(inv)
  } else {
    message("getting cached data")
#    return(m)
  }

  inv

}
