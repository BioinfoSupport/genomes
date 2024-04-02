#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Build Human genome from GENCODE 
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

.PHONY:all clean
all:genome.fasta genome.gtf.gz genome.gff.gz all_eukaryote
clean:clean_generic
	rm -rf genome.gff.gz

BASE_URL = https://ftp.ensembl.org/pub/release-110/
genome.fasta:;curl '$(BASE_URL)/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz' | gzip -d > "$@"
genome.gtf.gz:;curl '$(BASE_URL)/gtf/homo_sapiens/Homo_sapiens.GRCh38.110.gtf.gz' > "$@"
genome.gff.gz:;curl '$(BASE_URL)/gff3/homo_sapiens/Homo_sapiens.GRCh38.110.gff3.gz' > "$@"

include Makefile.generic

