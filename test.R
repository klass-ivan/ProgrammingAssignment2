source("cachematrix.R")

m <- makeCacheMatrix(matrix(sample.int(15, 1000*1000, TRUE), 1000, 1000))

message("getting, not cached yet")
a <- cacheSolve(m)
message("calculated, getting again")
b <- cacheSolve(m)
# should output "getting cached data"


