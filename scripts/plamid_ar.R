pdf(file="/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/plots/plasmid_ar.pdf",
	  paper="special",
	 width=6,
	 height=6
)
#par(mfrow=c(1,2))
library(data.table)
dat <- fread("/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/tables/plasmid_info.dat", select = c(1:3))
dat_mat = as.matrix(dat)
dat_1 = dat_mat[dat_mat[,3]>=1,]
                                        #
hist(as.numeric(as.matrix(dat_1[,3])), col= "indianred", breaks=seq(0.5,14,1), xlab="Number of AR genes", main="")

dev.off()

