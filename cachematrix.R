#################################################################
#################################################################
##
## These functions are able to cache the inverse of a matrix 
## rather than compute it many times. Usually, the inverse of a 
## large matrix is a time-consuming process. 
## These functions first checks if the inverse has already
## been calculated, if so, it will get the inverse
## from the cache and skips the calculation. Otherwise,
## these functions calculate the inverse of the matrix and
## sets the value of the inverse in the cache.
##
#################################################################
#################################################################
   
#################################################################
## The function makeCacheMatrix creates a special matrix
## to be used with the cacheSolve function.
## How to use it:
## >  specialMatrix <- makeCacheMatrix(matrix)
##
## Here matrix is a standard matrix and specialMatrix is a 
## special matrix required to be used with cacheSolve.
#################################################################

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

#################################################################
## The function cacheSolve calculates the inverse of a special
## matrix created by the function makeCacheMatrix.
##
## How to use it:
## >  cacheSolve(specialMatrix) 
##
## Here specialMatrix is a special matrix created by the function 
## makeCacheMatrix.
#################################################################

cacheSolve <- function(x, ...) {
   m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

