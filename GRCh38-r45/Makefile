#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Build Human genome from NCBI 
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FASTA_URL := https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_45/GRCh38.p14.genome.fa.gz
GTF_URL := https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_45/gencode.v45.annotation.gtf.gz
GFF_URL := https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_45/gencode.v45.annotation.gff3.gz


all:genome.fasta genome.fasta.fai genome.gtf genome.gff.gz ht2_index/done bwa_index/done

clean:;rm -rf genome.fasta genome.fasta.fai genome.gtf genome.gff.gz ht2_index/ bwa_index/

#-#-#-#-#-#-#-#-#-#-#
# Data download
#-#-#-#-#-#-#-#-#-#-#
genome.fasta:;curl '$(FASTA_URL)' | gzip -d > "$@"
genome.gtf:;curl '$(GTF_URL)' | gzip -d > "$@"
genome.gff.gz:;curl '$(GTF_URL)' > "$@"


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


