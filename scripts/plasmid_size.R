pdf(file="/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/plots/plamid_size.pdf",
	  paper="special",
	 width=6,
	 height=6
)
#par(mfrow=c(1,2))
library(data.table)
dat <- fread("/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/tables/plasmid_info.dat", select = c(1:3))

hist(as.numeric(log10(as.matrix(dat[,2]/1000))), col= "cornflowerblue", breaks=20, xlim=c(0,log10(1000)), xlab="Circular plsamid length (kbp)", xaxt="n",main="")
axis(side = 1, at=c(log10(0.5), log10(1), log10(10), log10(100), log10(500), log10(1000)) , labels=c(0.5, 1, 10, 100, 500, 10000))

sum(dat[,3])

dev.off()

