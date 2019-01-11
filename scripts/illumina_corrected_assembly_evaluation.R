pdf(file="/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/plots/illumina_corrected_assembly_evaluation.pdf",
	  paper="special",
	 width=6,
	 height=6
)
par(mfrow=c(1,2))
gg=read.table("/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/tables/illumina_corrected_assembly_evaluation.dat")
boxplot(gg[,3], col="lightgreen", ylab="Genome completeness", ylim = c(90,100))
boxplot(gg[,4], col="indianred", ylab="Genome contamination", ylim=c(0,5))
dev.off()
