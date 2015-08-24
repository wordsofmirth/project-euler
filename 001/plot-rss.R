
rss <- read.csv("/home/kfor/projects/euler/001/rss.csv", header=T)

png(filename = "rss.png",
    width = 640, height = 640, units = "px", pointsize = 12,
    bg = "white", res = NA,
    type = c("cairo", "cairo-png", "Xlib", "quartz"))

plot(rss$ocaml.p001_num,
     type="b",
     lwd=2,
     xaxt="n",
     ylim=c(0,160000),
     col="red",
     xlab="iterations",
     ylab="rss (KB)",
     main="Memory required for various iteration counts")

axis(1, at=1:length(rss$iterations), labels=rss$iterations)

lines(rss$java.P001_BigInteger.class, col="blue", type="b", lwd=2)
lines(rss$python.p001.py, col="orange", type="b", lwd=2)
lines(rss$c.p001_gmp, col="purple", type="b", lwd=2)
#lines(rss$perl.p001_math_bigint_calc, col="brown", type="b", lwd=2)
lines(rss$perl.p001_math_bigint_gmp, col="black", type="b", lwd=2)

legend("topright", legend=c("Ocaml (Num)",
			    "Java (BigInteger)",
			    "Python",
			    "C (libgmp)",
			    "Perl (Math::BigInt::GMP)"),
	lty=1, lwd=2, pch=21,col=c("red", "blue", "orange", "purple", "black"),
	ncol=2, bty="n", cex=0.8,
	text.col=c("red", "blue", "orange", "purple", "black"),
	inset=0.01)
