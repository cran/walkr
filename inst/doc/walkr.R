## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(walkr)

# very straight forward sampling

A <- matrix(1, ncol = 3)  
b <- 1    
sampled_points <- walkr(A = A, b = b, points = 10, 
                        method = "dikin", ret.format = "list") 


