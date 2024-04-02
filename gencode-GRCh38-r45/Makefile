#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Build Human genome from GENCODE 
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

.PHONY:all clean
all:genome.fasta genome.gtf.gz genome.gff.gz all_eukaryote
clean:clean_generic
	rm -rf genome.gff.gz

BASE_URL = https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_45
genome.fasta:;curl '$(BASE_URL)/GRCh38.p14.genome.fa.gz' | gzip -d > "$@"
genome.gtf.gz:;curl '$(BASE_URL)/gencode.v45.annotation.gtf.gz' > "$@"
genome.gff.gz:;curl '$(BASE_URL)/gencode.v45.annotation.gff3.gz' > "$@"

include Makefile.generic

