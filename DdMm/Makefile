# Merge genome directories
GENOME_DIRS=../Dd/ ../Mm/ 

all:genome.fasta genome.fasta.fai genome.gtf ht2_index/done bwa_index/done seqinfo.tsv

clean:;rm -rf genome.fasta genome.fasta.fai genome.gtf ht2_index/ bwa_index/

#-#-#-#-#-#-#-#-#-#-#
# Data download
#-#-#-#-#-#-#-#-#-#-#
genome.fasta:$(addsuffix /genome.fasta,$(GENOME_DIRS))
	cat $^ > "$@"
genome.gtf:$(addsuffix genome.gtf,$(GENOME_DIRS))
	cat $^ > "$@"


#-#-#-#-#-#-#-#-#-#-#
# Seqinfo
#-#-#-#-#-#-#-#-#-#-#
seqinfo.tsv:SHELL=bash
seqinfo.tsv:$(addsuffix /genome.fasta.fai,$(GENOME_DIRS))
	cat $(foreach f,$^,<(awk '{print $$1 "\t$(shell basename $(dir $f))"}' $f)) > $@

#-#-#-#-#-#-#-#-#-#-#
# Genome Indexing
#-#-#-#-#-#-#-#-#-#-#
%.fasta.fai:%.fasta
	samtools faidx '$<'

# HISAT2 genome indexing
ht2_index/done:genome.fasta genome.gtf
	mkdir -p "$(@D)" \
	  && hisat2_extract_exons.py "genome.gtf" > "$(@D)/genome.exon" \
	  && hisat2_extract_splice_sites.py "genome.gtf" > "$(@D)/genome.ss" \
	  && hisat2-build -p 6 --exon "$(@D)/genome.exon" --ss "$(@D)/genome.ss" "genome.fasta" "ht2_index/index" \
	  && touch $@

# BWA genome indexing
bwa_index/done:genome.fasta
	mkdir -p "$(@D)" \
	  && ln -s ../genome.fasta "bwa_index/" \
	  && bwa index "bwa_index/genome.fasta" \
	  && touch $@





