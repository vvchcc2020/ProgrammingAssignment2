## My function creates a matrix and cache its inverse using solve function



## makeCacheMatrix creates a special "matrix" and can cache its inverse using solve function 

makeCacheMatrix <- function(x = matrix()) {
       m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve() 
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## cacheSlve computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has not been calculated, calculates it. 

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
