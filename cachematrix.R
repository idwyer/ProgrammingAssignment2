## These functions can be used to cache the inverse of a predefined matrix. 
## It assumes the inverse of the matrix can be successfully caclaulted.
## The fucntions can also be used to read the cached inverse of the matrix.

## This function will create a list that contains the functions to 
## set / get a matrix into / from cache and to set / get the inverse 
## of a passed matrix into/from cache.

makeCacheMatrix <- function(x = matrix()) {
    
    im <- NULL
    set <- function(y) {
        x <<- y
        im <<- NULL
    }
    
    get<-function() x
    setinv <- function(solve) im <<- solve
    getinv <- function() im
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function will check for a cached inverse of the passed matrix.
## If it has been cached it will returned the cached inverse  of the matrix.
## If it has not been cached it will compute the inverse and cache it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    # Get it from cache if it exists
    im <- x$getinv()
    if (!is.null(im)) {
    
        message("getting cached data")
        return(im)
        
    }
    # Compute the inverse if it is not cached
    data <- x$get()
    im <- solve(data)
    x$setinv(im)
    im
}



