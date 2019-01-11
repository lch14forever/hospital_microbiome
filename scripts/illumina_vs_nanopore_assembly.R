pdf(file="/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/plots/illumina_vs_nanopore.pdf",
	  paper="special",
	 width=4,
	 height=6
)
illu=read.table("/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/tables/illumina_assembly.stats")
nano=read.table("/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/tables/nanopore_assembly.stats")

boxplot(illu[,2]/1000, nano[,2]/1000, log="y", ylab="Assembly N50 (kbp)", col=c("cornflowerblue", "lightgreen"), names=c("I", "N"))

dev.off()
