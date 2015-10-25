## Functions below makes use of "cache" for matrix inverse calculations.
## To make cache-aware matrix, use `makeCacheMatrix` over your original matrix.
## Then you are to use `cacheSolve` function to get a solution using cache.

## Creates a structure that handles storing of matrix and its inverse value, 
## by exposing 4 corresponding methods for getting and setting matrix itself or inverse value

makeCacheMatrix <- function(x = matrix()) {
  inverseX <- NULL
  get <- function() x
  set <- function(newX) {
    x <<- newX
    inverseX <<- NULL
  }
  getInverse <- function() inverseX
  setInverse <- function(inverse) {
    inverseX <<- inverse
  }
  list(get=get, set=set, getInverse=getInverse, setInverse=setInverse)
}


## Returns cachable result for matrix inverse, 
## will no re-compute inversion if it was already got before

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    inv
  } else {
    inv <- solve(x$get())
    x$setInverse(inv)
    inv
  }
  ## Return a matrix that is the inverse of 'x'
}
