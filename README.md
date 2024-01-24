

# About
This repository contains scripts to generate reference genomes and index then 
with aligner.

# TODO
 - one folder per genome
 - put the build script inside the folder (or a Makefile ?)
 - generate a tar archive of the folder (with the building script)
 - create a github workflow ?

# Build a reference genome on Baobab
```
sbatch --time=8:00:00 --partition=shared-bigmem --ntasks=1 --cpus-per-task=6 --mem=256G <<EOF
#!/bin/bash
cd ~/scratch/rnaseq
singularity exec 'docker://unigebsp/ngs:v1.0' env PATH=$PATH:./.local/bin build_ref_GRCh38-lm.sh
EOF
```

