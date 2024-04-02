

# About
This repository contains scripts to prepare reference genomes and index them for
use in our pipelines.

Currently available genomes are:

 - `GRCh38-r45`: Human genome ([ENCODE release 45](https://www.gencodegenes.org))
 
 - `GRCm39-M34`: Mouse genome ([ENCODE release M34](https://www.gencodegenes.org))
 
 - `Dd`: Dictyostelium discoideum AX4 ([NCBI, dicty 2.7](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000004695.1/))
 
 - `Mm`: Mycobacterium marinum M ([NCBI](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000018345.1/))
 
 - `lm`: Ligilactobacillus murinus ([NCBI](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_003288115.1/))
 
 - `DdMm`: `Dd` and `Mm` genomes merged
 
 - `GRCh38-lm`: `GRCh38-r45` and `lm` genomes merged



# Build a reference localy with docker
```
git clone https://github.com/BioinfoSupport/genomes.git
cd genomes
docker run --rm -v $PWD/:/home/rstudio/workdir unigebsp/ngs:v1.1 make lm/all Mm/all Dd/all Dd+Mm/all
```


# Build reference genomes on Baobab
```
git clone https://github.com/BioinfoSupport/genomes.git
cd genomes

sbatch --time=8:00:00 --partition=shared-bigmem --ntasks=1 --cpus-per-task=6 --mem=256G <<EOF
#!/bin/bash
singularity exec --bind $(realpath ./) 'docker://unigebsp/ngs:v1.1' make
EOF
```



