#!/bin/bash
#SBATCH --job-name=coverm\
#SBATCH --output=coverm_%j.out\
#SBATCH --error=coverm_%j.err
#SBATCH --mail-user=jklomparens@middlebury.edu
#SBATCH --mail-type=ALL
#SBATCH --mem=100GB
#SBATCH --partition=standard
#SBATCH --time=24:00:00

echo "Job ID: $\{SLURM_JOB_ID\}"
echo "Node: $\{SLURMD_NODENAME\}" 
echo "Starting: "`date +"%D %T"`

# copy and paste the following code chunk for each original .fastq file
coverm genome \
  --coupled fastq/SAMPLE.trimmed.paired.fq1 fastq/SAMPLE.trimmed.paired.fq2 \
  --genome-fasta-files \
    bins_dir_SITE/bin.#.fa bins_dir_SITE/bin.#.fa \
    bins_dir_SITE/bin.#.fa bins_dir_SITE/bin.#.fa \
    bins_dir_SITE/bin.#.fa bins_dir_SITE/bin.#.fa \
  -t 8 \
  -m mean relative_abundance covered_fraction \
  -o output_coverm_SAMPLE.tsv

echo "Ending: "`date +"%D %T"`
