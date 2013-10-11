
d <- rep(1:5, 20)
sex <- rep(rep(1:2, 25), 2)
x <- rnorm(length(d), sex/2 + d+1)

