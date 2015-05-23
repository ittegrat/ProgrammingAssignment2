################################################################################
## - makeCacheMatrix(x):
##     creates a closure that stores a matrix M and can cache its inverse.
##     Implements two pairs of accessors to set/get the underlying matrix and
##     its inverse.
##
## - cacheSolve(x):
##     returns the (possibly cached) inverse of a matrix stored in a closure
##     created by the makeCacheMatrix function. The first time this function is
##     called, it calculates, stores and returns the inverse. Subsequent calls
##     return the cached inverse.
##
##  N.B: no arguments check is performed by the two functions, so you have to
##     ensure that the input matrix is square.
##
################################################################################


## makeCacheMatrix(x)
##
## Creates a closure that stores a matrix M and can cache its inverse.
## Accessor methods:
##  - set.matrix(m): store a new matrix
##  - get.matrix(): get the stored matrix
##  - set.inverse(m): set the cache
##  - get.inverse(): get the cached inverse; if uncalced, returns NULL
##
makeCacheMatrix <- function(mtx = matrix()) {

  # Initialise the cache
  inv <- NULL

  # Creates and returns the closure
  list(

    # Store a new matrix and invalidates the cache
    set.matrix = function(m) {
      mtx <<- m
      inv <<- NULL
    },
    
    # Returns the stored matrix
    get.matrix = function() {
      mtx
    },
    
    # Fill the cache with the inverse matrix
    set.inverse = function(m) {
      inv <<- m
    },

    # Returns the content of the cache
    get.inverse = function() {
      inv
    }

  )

}


## cacheSolve(x)
##
## Returns the (possibly cached) inverse of a matrix stored in a
## closure created by the makeCacheMatrix function.
## ... are passed to the solve function.
##
cacheSolve <- function(x, ...) {

  # If the inverse is uncalced, get.inverse()
  # returns NULL
  inv <- x$get.inverse()

  # If uncalced, calculates and set the local variable inv;
  # moreover it stores the inverse by calling the set.inverse()
  # accessor
  if(is.null(inv)) {
    mtx <- x$get.matrix()
    inv <- solve(mtx, ...)
    x$set.inverse(inv)
  }
  # The "else" part is for debugging purposes only
  else {
    message("getting cached data")
  }

  # Returns the inverse
  inv

}
