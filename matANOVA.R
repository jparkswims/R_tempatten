rm(list=ls(all=TRUE))

library(R.matlab)

setwd("/Users/jakeparker/Documents/R")

a <- readMat("paANOVA.mat")

bdf <- a$bdf

rm(a)

bdf <- as.data.frame(bdf)

colnames(bdf) <- c("subject", "target" ,"atten","correct","betaval")

library(ez)

bdf$correct <- factor(bdf$correct)
bdf$target <- factor(bdf$target)
bdf$atten <- factor(bdf$atten)
bdf$subject <- factor(bdf$subject)

anova = ezANOVA(
  data=bdf, 
  dv=betaval, 
  wid=subject, 
  within=.(target,atten,correct)
)

