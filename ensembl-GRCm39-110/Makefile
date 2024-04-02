#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#
# Build Mouse genome from ENSEMBL 
#
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

.PHONY:all clean
all:genome.fasta genome.gtf.gz genome.gff.gz all_eukaryote
clean:clean_generic
	rm -rf genome.gff.gz


BASE_URL = https://ftp.ensembl.org/pub/release-110/
genome.fasta:;curl '$(BASE_URL)/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz' | gzip -d > "$@"
genome.gtf.gz:;curl '$(BASE_URL)/gtf/mus_musculus/Mus_musculus.GRCm39.110.gtf.gz' > "$@"
genome.gff.gz:;curl '$(BASE_URL)/gff3/mus_musculus/Mus_musculus.GRCm39.110.gff3.gz' > "$@"

include Makefile.generic

