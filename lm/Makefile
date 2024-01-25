#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Get Ligilactobacillus murinus genome from NCBI
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FASTA_URL := https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/003/288/115/GCF_003288115.1_ASM328811v1/GCF_003288115.1_ASM328811v1_genomic.fna.gz
GTF_URL := https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/003/288/115/GCF_003288115.1_ASM328811v1/GCF_003288115.1_ASM328811v1_genomic.gtf.gz
GFF_URL := https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/003/288/115/GCF_003288115.1_ASM328811v1/GCF_003288115.1_ASM328811v1_genomic.gff.gz


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
ht2_index/done:genome.fasta
	mkdir -p "$(@D)" \
	  && hisat2-build -p 6 "genome.fasta" "ht2_index/index" \
	  && touch $@

# BWA genome indexing
bwa_index/done:genome.fasta
	mkdir -p "$(@D)" \
	  && ln -s ../genome.fasta "bwa_index/" \
	  && bwa index "bwa_index/genome.fasta" \
	  && touch $@



