# Plot the size distributions for ancestor, small and large
library(extrafont)

#######################################
# Gather data
#######################################
ancestor_radius <- as.matrix(read.table("ancestor_radius.txt", sep="\t", header = T))
anc_mean <- mean(ancestor_radius)
sd(ancestor_radius)

small_radius <- as.matrix(read.table("small_radius.txt", sep="\t", header = T))
small_mean <- mean(small_radius)
sd(small_radius)

large_radius <- as.matrix(read.table("large_radius.txt", sep="\t", header = T))
large_mean <- mean(large_radius)
sd(large_radius)

#######################################
# size distribution
#######################################
# Save figure 
pdf(file="size_distribution_biomass_raw.pdf", bg = "transparent",
    width=6, height=6, family = "Times New Roman")

max_val <- 0.3 # Adjust relative contribution to optimize visualization

par(oma=c(1,1,1,1))
par(family="Times New Roman", cex.lab=1.5, cex.axis=2, cex.main=1.5, cex.sub=1.5)#, col.lab="white", col.axis = "white")

# Small size distribution and mean
sm <- density(small_radius)
factor <- max_val/max(sm$y)
plot(sm$x, sm$y*factor, type="l", lty = 2, lwd=4, col="#d8b365", xlim=c(0,150),ylim = c(0,0.35),
     xlab=expression(paste("Multicellular size (radius in ", mu, "m)")), ylab="Proportion", bty="n")  # first histogram
#lines(rep(small_mean,2), c(0,0.3), type="l", lty=2, lwd =1.5, col="#d8b365", xlim=c(0,200)) 


# Ancestor size distribution and mean
ac <- density(ancestor_radius)
lines(ac$x, ac$y*factor, type="l", lwd =4, col="gray", xlim=c(0,200))  
#lines(rep(anc_mean,2), c(0,0.35), type="l", lty=2, lwd =1.5, col="gray", xlim=c(0,200)) 

# Large size distribution and mean
lg <- density(large_radius)
lines(lg$x, lg$y*factor*5, type="l",lty=4, lwd =4, col="#5ab4ac", xlim=c(0,200)) 
#lines(rep(large_mean,2), c(0,0.20), type="l", lty=2, lwd =1.5, col="#5ab4ac", xlim=c(0,200)) 

legend("topright", c("Ancestor","Small isolate","Large isolate"), lwd=4, cex = 2,
       col=c("gray","#d8b365","#5ab4ac"), 
       lty = c(1,2,4),
       bty="n")

dev.off()

