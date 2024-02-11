#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Get Mycobacterium marinum genome from NCBI
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

.PHONY:ALL CLEAN
ALL:genome.fasta genome.gtf.gz genome.gff.gz ALL_PROKARYOTE
CLEAN:CLEAN_GENERIC
	rm -rf genome.gff.gz

BASE_NCBI_URL = https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/018/345/GCF_000018345.1_ASM1834v1/GCF_000018345.1_ASM1834v1
genome.fasta:;curl '$(BASE_NCBI_URL)_genomic.fna.gz' | gzip -d > "$@"
genome.gtf.gz:;curl '$(BASE_NCBI_URL)_genomic.gtf.gz' > "$@"
genome.gff.gz:;curl '$(BASE_NCBI_URL)_genomic.gff.gz' > "$@"

include Makefile.generic

