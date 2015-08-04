## ----example1, eval = TRUE-----------------------------------------------
library(walkr)
A <- matrix(1, ncol = 3)
b <- 1
sampled_points <- walkr(A = A, b = b, points = 1000, 
                        method = "hit-and-run", chains = 5, ret.format = "list")

## ----example2, eval = FALSE----------------------------------------------
#  explore_walkr(sampled_points)

## ----example3, eval = TRUE-----------------------------------------------
## two 20 dimensional constraints

set.seed(314)
A <- matrix(sample(c(0,1,2), 40, replace = TRUE), ncol = 20)
b <- c(0.5, 0.3)
sampled_points <- walkr(A = A, b = b, points = 1000, chains = 5, 
                        method = "hit-and-run", ret.format = "matrix")



## ----example4, eval = TRUE-----------------------------------------------
set.seed(314)
sampled_points <- walkr(A = A, b = b, points = 1000, chains = 5, thin = 100, 
                        method = "hit-and-run", ret.format = "matrix")
sampled_points <- walkr(A = A, b = b, points = 1000, chains = 5, thin = 10, 
                        method = "dikin", ret.format = "matrix")


## ----example7, eval = TRUE, fig.width=5, fig.height=3--------------------
set.seed(314)
N <- 50
A <- matrix(sample(c(0,3), N, replace = T), nrow = 1)
A <- rbind(A, matrix(sample(c(0,3), N, replace = T), nrow = 1))
b <- c(0.7, 0.3)

answer_hitandrun <- walkr(A = A, b = b, points = 500, method = "hit-and-run", 
                 thin = 10, burn = 0, chains = 1)
answer_dikin <- walkr(A = A, b = b, points = 500, method = "dikin", 
                 thin = 10, burn = 0, chains = 1)

plot(y = answer_hitandrun[50,], x = 1:500, 
     xlab = "random walk", ylab = "value", type = 'l', 
     main = "Hit-and-run Mixing",
     ylim = c(0, 0.2))
plot(y = answer_dikin[50,], x = 1:500, 
     xlab = "random walk", ylab = "value", type = 'l',
     main = "Dikin Mixing", 
     ylim = c(0, 0.2))

