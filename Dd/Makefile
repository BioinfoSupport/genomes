#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Build Dicty genome from NCBI 
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FASTA_URL := https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/695/GCF_000004695.1_dicty_2.7/GCF_000004695.1_dicty_2.7_genomic.fna.gz
GTF_URL := https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/695/GCF_000004695.1_dicty_2.7/GCF_000004695.1_dicty_2.7_genomic.gtf.gz
GFF_URL := https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/695/GCF_000004695.1_dicty_2.7/GCF_000004695.1_dicty_2.7_genomic.gff.gz


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



