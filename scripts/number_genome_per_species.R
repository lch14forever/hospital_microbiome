pdf(file="/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/plots/number_genome_per_species.pdf",
	  paper="special",
	 width=12,
	 height=8
)
gg=read.table("/home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/tables/number_genome_per_species.dat.sorted", sep = "\t")

par(mfrow=c(1,3))
par(las=1)

par(mpg=c(5,1,0))

gg_1=gg[c(1:29),]
#
gg_2=gg[c(30:59),]
#
gg_3=gg[c(60:88),]
                                        #
par(mai=c(1,2,1,1))
barplot(gg_1[,2], horiz=TRUE, xlim=c(0,350),font.axis =3, names=gg_1[,1],)
#axis(2, at = barplot1[c(1,3)], labels = gg_1[,1][c(2,26)], col.axis = 2,font.axis =3)


par(mai=c(1,2,1,1))
barplot(gg_2[,2], names=gg_2[,1], horiz=TRUE, las=1, xlim=c(0,350),font.axis =3)
#axis(2, at = barplot2[c(1,3)], labels = gg_1[,1][c(45,46,49)], col.axis = 2,font.axis =3)
#
par(mai=c(1,2,1,1))
barplot1=barplot(gg_3[,2], names=gg_3[,1], horiz=TRUE, las=1, xlim=c(0,350),font.axis =3)
#axis(2, at = barplot3[c(1,3)], labels = gg[,1][c(62,72,75)], col.axis = 2,font.axis =3)
#axis(2, at = barplot3[c(1,3)], labels = gg[,1][c(60,61,63:71,72:75)], col.axis = 1,font.axis =3)


dim(gg_1)
dim(gg_2)
dim(gg_3)

dev.off()

#grep -v "#" ANALYSIS/Kern_rei/pathogene_list.dat | tr ' ' '_' | grep -i -f - /home/lich/PROJECTS/envgenome/NANOPORE_ANALYSIS/tables/species_in_assembly_qc_pass.dat | wc -l
