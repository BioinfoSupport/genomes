

.PHONY:all clean
all:genome.fasta genome.gtf.gz all_eukaryote seqinfo.tsv
clean:clean_generic
	rm -rf seqinfo.tsv


#-#-#-#-#-#-#-#-#-#-#
# Merge genomes
#-#-#-#-#-#-#-#-#-#-#
GENOME_DIRS=../gencode-GRCh38-r45/ ../lm/ 

genome.fasta:$(addsuffix /genome.fasta,$(GENOME_DIRS))
	cat $^ > "$@"
genome.gtf.gz:$(addsuffix genome.gtf.gz,$(GENOME_DIRS))
	zcat $^ | pigz > "$@"

seqinfo.tsv:$(addsuffix /genome.fasta.fai,$(GENOME_DIRS))
	cat $(foreach fai,$^,<(awk 'BEGIN{print "contig\tgenome"}{print $$1 "\t$(shell basename $(dir $(fai)))"}' $(fai))) > $@

include Makefile.generic

