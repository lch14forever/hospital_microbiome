pdf(file="/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/plots/AR_VF_occurence.pdf",
	  paper="special",
	 width=6,
	 height=6
)
library(graphics)
gg=read.table("/home/bertrandd/PROJECT_LINK/OPERA_LG/HOSPITAL_MICROBIOME/ANALYSIS/NEW_COMBINAISON/AR_VF_occurence.dat")
buylrd <- c("#313695", "#4575B4", "#74ADD1", "#ABD9E9", "#E0F3F8", "#FFFFBF", "#FEE090", "#FDAE61", "#F46D43", "#D73027", "#A50026")
smoothScatter(gg[,2]~gg[,3], nbin=500, nrpoints=Inf, colramp = colorRampPalette(c(buylrd)), pch="", cex=.7, col="black", xlab = "VF", ylab="AR")
dev.off()
