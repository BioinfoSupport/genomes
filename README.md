

# About
This repository contains scripts to generate reference genomes and index then 
with aligner.

# Build reference genomes on Baobab
```
git clone git@github.com:BioinfoSupport/genomes.git
cd genomes

sbatch --time=8:00:00 --partition=shared-bigmem --ntasks=1 --cpus-per-task=6 --mem=256G <<EOF
#!/bin/bash
singularity exec 'docker://unigebsp/ngs:v1.0' make
EOF
```

# Build a reference locally with docker
```
docker run --rm -v $PWD/:/home/rstudio/workdir unigebsp/ngs:v1.0 make lm/
```


