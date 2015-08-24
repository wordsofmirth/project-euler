
times <- read.csv("/home/kfor/projects/euler/001/times.csv", header=T)

png(filename = "times.png",
    width = 640, height = 640, units = "px", pointsize = 12,
    bg = "white", res = NA,
    type = c("cairo", "cairo-png", "Xlib", "quartz"))

plot(times$ocaml.p001_num,
     type="b",
     lwd=2,
     xaxt="n",
     ylim=c(0,4),
     col="red",
     xlab="iterations",
     ylab="time (seconds)",
     main="Time required for various iteration counts")

axis(1, at=1:length(times$iterations), labels=times$iterations)

lines(times$java.P001_BigInteger.class, col="blue", type="b", lwd=2)
lines(times$python.p001.py, col="orange", type="b", lwd=2)
lines(times$c.p001_gmp, col="purple", type="b", lwd=2)
#lines(times$perl.p001_math_bigint_calc, col="brown", type="b", lwd=2)
lines(times$perl.p001_math_bigint_gmp, col="black", type="b", lwd=2)

legend("topright", legend=c("Ocaml (Num)",
			    "Java (BigInteger)",
			    "Python",
			    "C (libgmp)",
			    "Perl (Math::BigInt::GMP)"),
	lty=1, lwd=2, pch=21,col=c("red", "blue", "orange", "purple", "black"),
	ncol=2, bty="n", cex=0.8,
	text.col=c("red", "blue", "orange", "purple", "black"),
	inset=0.01)
