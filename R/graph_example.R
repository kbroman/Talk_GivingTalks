
set.seed(122069+7)
dat <- data.frame(dose=seq(0, 100, by=10),
             control=rep(0, 11),
             ttt=rep(0,11))
dat$control <- 0.1*dat$dose + rnorm(nrow(dat), 0, 3)
dat$control <- dat$control - min(dat$control)
dat$ttt <- dat$dose + rnorm(nrow(dat), 0, 3)
dat$ttt[dat$ttt >= 60] <- dat$ttt[dat$ttt >= 60] - 0.8*dat$ttt[dat$ttt >= 60] + 0.8*60

png("../Figs/badfig.png", height=800, width=1200, pointsize=14)
plot(dat[,1], dat[,2], ylim=range(dat[,-1]), type="l", lty=2)
lines(ttt ~ dose, data=dat, lty=1)
legend("topleft", lty=1:2, c("T","C"))
dev.off()

source("colors.R")
pdf("../Figs/betterfig.pdf", height=6, width=9, pointsize=18)
par(las=1, bg=bgcolor, fg="white", col="white", col.axis="white", col.lab="white",
    mar=c(5.1, 4.1, 0.1, 0.1))
plot(dat[,1], dat[,2], ylim=range(dat[,-1]), type="l", col=color[2],
     xlab="Dose", ylab="Response", lwd=2)
lines(ttt ~ dose, data=dat, col=color[1], lwd=2)
text(80, 59, "Treated", col=color[1])
text(80, 16, "Control", col=color[2])
dev.off()
