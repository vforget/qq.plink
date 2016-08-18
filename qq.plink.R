#!/usr/bin/Rscript

args <- commandArgs(trailingOnly = TRUE)

plink.f = args[1]
title = args[2]

#plink.f = "P42.txt"
#title = "Title"

message("Input file = ", plink.f)
message("Title = ", title)

qq.f = paste(plink.f, ".qq.png", sep="")
d <- read.table(plink.f, header=T)
do <- d

obs <- sort(d$P)
obs <- obs[!is.na(obs)]
lobs <- -(log10(obs))

exp <- c(1:length(obs)) 
lexp <- -(log10(exp / (length(exp)+1)))

chisq <- qchisq(1-obs,1)

lambda <- round(median(chisq)/qchisq(0.5,1),2)

png(file=qq.f, res=300, height = 2000, width = 2000)
par(mar=c(5,5,4,2))
plot(0, 0, type="n",	
	xlim=c(0,max(lexp)), ylim=c(0,max(lobs)), 
	xlab="Expected (-logP)", ylab="Observed (-logP)", 
	#las=1, xaxs="i", yaxs="i", bty="l",
	bty='n', 
	main=title)
legend("topleft", as.expression(bquote(lambda == .(lambda))), bty='n')
abline(0,1,col="red",lwd=3, lty=3)
points(lexp, lobs, cex=1, pch=21, bg="#0000ff33", col="#0000ff")
dev.off()
message("Lambda = ", lambda)
