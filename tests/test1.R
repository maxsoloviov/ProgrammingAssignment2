# set a matrix
matrix <- replicate(50, rnorm(50))
# get the inverse of the matrix
inverse <- solve(matrix)

# create a cached matrix
cachedMatrix <- makeCacheMatrix(matrix)
cachedMatrix$setInverse(inverse)

# ===== No cache ========
# Start the clock!
ptm <- proc.time()
# Loop through
for (i in 1:1000){
    inverse_nocache <- solve(cachedMatrix$get())
}
# Stop the clock
time_inverse_nocache <-  (proc.time() - ptm)['elapsed']

# ===== With cache ========
# Start the clock!
ptm <- proc.time()
# Loop through
for (i in 1:1000){
    inverse_cache <- cacheSolve(cachedMatrix)
}
 
# Stop the clock
time_inverse_cache <- (proc.time() - ptm)['elapsed']

# Expect that the result is the same for cached and non-cached version
expect_that(inverse_cache, equals(inverse_nocache))

# Expect that the cached version is faster
expect_that(time_inverse_nocache > time_inverse_cache, is_true())