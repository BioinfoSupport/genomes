#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Build Dicty genome from NCBI 
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

.PHONY:ALL CLEAN
ALL:genome.fasta genome.gtf.gz genome.gff.gz ALL_EUKARYOTE
CLEAN:CLEAN_GENERIC
	rm -rf genome.gff.gz

BASE_NCBI_URL = https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/004/695/GCF_000004695.1_dicty_2.7/GCF_000004695.1_dicty_2.7
genome.fasta:;curl '$(BASE_NCBI_URL)_genomic.fna.gz' | gzip -d > "$@"
genome.gtf.gz:;curl '$(BASE_NCBI_URL)_genomic.gtf.gz' > "$@"
genome.gff.gz:;curl '$(BASE_NCBI_URL)_genomic.gff.gz' > "$@"

include Makefile.generic


