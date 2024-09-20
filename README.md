

# About
This repository contains scripts to prepare reference genomes and index them for
use in our pipelines.

Currently available genomes are:

 - `gencode-GRCh38-r45`: Human genome ([GENCODE release 45](https://www.gencodegenes.org))
 
 - `ensembl-GRCh38-110`: Human genome ([Ensembl release 110](http://jul2023.archive.ensembl.org/)) 
 
 - `gencode-GRCm39-M34`: Mouse genome ([GENCODE release M34](https://www.gencodegenes.org))
 
 - `ensembl-GRCm39-110`: Mouse genome ([Ensembl release 110](http://jul2023.archive.ensembl.org/))
 
 - `Dd`: Dictyostelium discoideum AX4 ([NCBI, dicty 2.7](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000004695.1/))
 
 - `Mm`: Mycobacterium marinum M ([NCBI](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_000018345.1/))
 
 - `lm`: Ligilactobacillus murinus ([NCBI](https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_003288115.1/))
 
 - `Dd+Mm`: `Dd` and `Mm` genomes merged
 
 - `GRCh38-lm`: `gencode-GRCh38-r45` and `lm` genomes merged together



# Download an already indexed genomes

Our genomes are available ready to use as `.tar.gz` archives on our S3 server.
They can be downloaded and extracted by running the following command in a terminal:
```
curl -kL -H "Authorization: AWS all_users:" "https://genomes.bioinfo.s3.unige.ch/ensembl-GRCh38-110.tar.gz" | tar -zxf -
```



# Build a reference genome

## On your local machine with docker

If [docker](https://www.docker.com) is installed on your system, you can index 
one of our reference genome by typing the following commands in a terminal:
```
git clone https://github.com/BioinfoSupport/genomes.git
cd genomes
docker run --rm -v $PWD/:/home/rstudio/workdir unigebsp/ngs make lm/all
```


## On a HPC cluster with slurm and singularity

Human and mouse genomes require high amount of memory to be indexed with 
HISAT2. In this case, it might be interesting to run the indexing procedure
on a HPC cluster. The following commands show how to run the indexing on a system
running `slurm` and `singularity`:
```
git clone https://github.com/BioinfoSupport/genomes.git
cd genomes

sbatch --time=8:00:00 --partition=shared-bigmem --ntasks=1 --cpus-per-task=6 --mem=256G <<EOF
#!/bin/bash
singularity exec --bind $(realpath ./) 'docker://unigebsp/ngs' make ensembl-GRCh38-110/all
EOF
```




# Add new reference genomes

To add new reference genomes, one may use the examples already available in the repository. 
There are basically 3 situations: 

 - Prokaroyte genomes: (consult `lm` genome example)
 - Eukaryote genomes: Here we need to instruct HISAT2 to index the genome with the knowledge of the genes annoation to handle correctly splice-junctions (consult `ensembl-GRCh38-110`example` example). 
 - Combined genomes: Here we recommand to create each genome independently and then combine them in another genome (consult the `Dd+Mm` example).




