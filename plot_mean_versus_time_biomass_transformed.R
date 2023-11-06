
# Line 2 day 10 has cluster >110 microns - clean outlier
s2_d10_norm <- s2_d10_norm[!s2_d10_norm[,1] > 100,]

#--------------------------------
list_of_dataset_names <- c( 'l1_d1_norm', 'l1_d5_norm', 'l1_d10_norm','l1_d15_norm','l1_d20_norm', 'l1_d40_norm',
                            'l3_d1_norm', 'l3_d5_norm', 'l3_d10_norm','l3_d15_norm','l3_d20_norm', 'l3_d40_norm', 
                            'l4_d1_norm', 'l4_d5_norm', 'l4_d10_norm','l4_d15_norm','l4_d20_norm', 'l4_d40_norm', 
                            's1_d1_norm', 's1_d5_norm', 's1_d10_norm','s1_d15_norm','s1_d20_norm', 's1_d40_norm',
                            's2_d1_norm', 's2_d5_norm', 's2_d10_norm','s2_d15_norm','s2_d20_norm', 's2_d40_norm', 
                            's3_d1_norm', 's3_d5_norm', 's3_d10_norm','s3_d15_norm','s3_d20_norm', 's3_d40_norm', 
                            's4_d1_norm', 's4_d5_norm', 's4_d10_norm','s4_d15_norm','s4_d20_norm', 's4_d40_norm' )
days <- c(0,5,10,15,20,40) 
#--------------------------------

#--------------------------------
# Calculate means for all datasets
meansvec <- c()
for (i in 1:length(list_of_dataset_names)) {
  
  name <- list_of_dataset_names[i]
  dataset <- get(name) 
  
  meansvec <- c(meansvec, sum(dataset[,1]*dataset[,2]))
  
}

# Re-arrange means vector to have one replicate population per line
means <- matrix(meansvec,7,6, byrow = T)
# Means and sd
colMeans(means[1:3,])
colMeans(means[4:7,])


#--------------------------------
# Fit linear model
mnlarge <- c(means[1,], means[2,], means[3,])
mnsmall <- c(means[4,], means[5,], means[6,], means[7,])



# Regression
rgsmall <- lm(mnsmall~rep(days,4))
summary(rgsmall)
# Call:
#   lm(formula = mnsmall ~ rep(days, 4))
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -6.7543 -1.7381  0.1479  1.8259  4.9466 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  11.79676    0.91333   12.92 9.56e-12 ***
#   rep(days, 4)  0.27460    0.04615    5.95 5.48e-06 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.919 on 22 degrees of freedom
# Multiple R-squared:  0.6167,	Adjusted R-squared:  0.5993 
# F-statistic:  35.4 on 1 and 22 DF,  p-value: 5.475e-06

rglarge <- lm(mnlarge~rep(days,3))
summary(rglarge)
# 
# Call:
#   lm(formula = mnlarge ~ rep(days, 3))
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -11.8843  -6.7510   0.6343   6.3578  14.2904 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   51.3122     2.9882  17.171  9.9e-12 ***
#   rep(days, 3)  -0.2659     0.1510  -1.761   0.0973 .  
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 8.27 on 16 degrees of freedom
# Multiple R-squared:  0.1624,	Adjusted R-squared:   0.11 
# F-statistic: 3.101 on 1 and 16 DF,  p-value: 0.09733

#--------------------------------
# Visualization
# pdf(file="mean_versus_time.pdf", bg = "transparent",
#     width=6, height=4.5, family = "Times New Roman")
# 

par(oma=c(1.2,1,1,1))
par(family="Times New Roman", cex.lab=1.2, cex.axis=1, cex.main=1, cex.sub=1)#, col.lab="white", col.axis = "white")

days <- c(0,5,10,15,20,40) 
clrs <- c(rep("#5ab4ac",3), rep("#d8b365",4))
plot(1, type="n", xlab="Time (days)", ylab=expression(paste("Mean radius size (", mu, "m)", sep = "")), xlim=c(0, 42), ylim=c(0, 80))
for (p in 1:7){
  
  points(days,means[p,], pch=16, col = clrs[p])
  #lines(days,means[p,], lty=2)
  
}

lines(0:40,rgsmall$coefficients[2]*0:40+rgsmall$coefficients[1], col ="#d8b365", lwd = 2)
lines(0:40,rglarge$coefficients[2]*0:40+rglarge$coefficients[1], col ="#5ab4ac", lwd = 2)

# dev.off()


# ANCOVA
# https://www.datanovia.com/en/fr/lessons/ancova-dans-r/
# 1) hypothese de linearite: vrai pour Small, faux pour Large
 # 2) hypothese d'homogeneite des pentes de regression: les pentes vont-elles dans la meme direction?

# dataset
# Table has days + groups + size

dt <- data.frame(group = c(rep("Large", length(mnlarge)), rep("Small", length(mnsmall))),
           time = rep(days,7),
           size = c(mnlarge, mnsmall))

is.data.frame(dt)


library(rstatix)
anc_test <- anova_test(size ~ group*time, data = dt)

# L'interaction entre groupe et time est significative (les pentes de regression ne sont statistiquement pas homogenes)

# ANOVA Table (type II tests)
# 
# Effect DFn DFd       F        p p<.05   ges
# 1      group   1  38 300.671 1.21e-19     * 0.888
# 2       time   1  38   0.366 5.49e-01       0.010
# 3 group:time   1  38  14.954 4.18e-04     * 0.282
# 
