## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    this <- x
    inverse <- NULL
    
    # Setter
    set <- function(matrix) {
        this <<- matrix
        inverse <<- NULL
    }
    # Getter 
    get <- function() {
        return(this)
    }
    
    # Setter of inverse
    setInverse <- function(inverseMatrix) inverse <<- inverseMatrix
    # Getter of inverse
    getInverse <- function() {
        return(inverse)
    }
    
    # Return the matrix "object"
    return(list(set = set, 
             get = get, 
             setInverse = setInverse, 
             getInverse = getInverse)
    )

}


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    this <- x                       # this is an object
    
    inverse <- this$getInverse()    # get the inverse from this if available
    if(!is.null(inverse)) { # check if not null
        return(inverse) 
    }
    matrix <- this$get()            # get the matrix of the makeCacheMatrix-object
    inverse <- solve(matrix)        # calculate the inverse
    this$setInverse(inverse)        # set the inverse-property of the makeCacheMatrix-object
    return(inverse)                   
}
