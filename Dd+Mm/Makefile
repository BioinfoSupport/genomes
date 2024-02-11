

.PHONY:ALL CLEAN
ALL:genome.fasta genome.gtf.gz ALL_EUKARYOTE seqinfo.tsv
CLEAN:CLEAN_GENERIC
	rm -rf seqinfo.tsv


#-#-#-#-#-#-#-#-#-#-#
# Merge genomes
#-#-#-#-#-#-#-#-#-#-#
GENOME_DIRS=../Dd/ ../Mm/ 

genome.fasta:$(addsuffix /genome.fasta,$(GENOME_DIRS))
	cat $^ > "$@"
genome.gtf.gz:$(addsuffix genome.gtf.gz,$(GENOME_DIRS))
	zcat $^ | pigz > "$@"

seqinfo.tsv:$(addsuffix /genome.fasta.fai,$(GENOME_DIRS))
	cat $(foreach fai,$^,<(awk '{print $$1 "\t$(shell basename $(dir $fai))"}' $fai)) > $@

include Makefile.generic




