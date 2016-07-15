rm(list=ls(all=TRUE))

library(R.matlab)

a <- readMat("paANOVA.mat")

bdf <- a$bdf

rm(a)

bdf <- as.data.frame(bdf)

colnames(bdf) <- c("subject", "target" ,"atten", "betaval")

library(ez)

bdf$target <- factor(bdf$target)
bdf$atten <- factor(bdf$atten)
bdf$subject <- factor(bdf$subject)

anova = ezANOVA(
  data=bdf, 
  dv=betaval, 
  wid=subject, 
  within=.(target,atten)
)

