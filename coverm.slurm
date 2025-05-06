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

# copy and paste the following code chunk for each original .fastq file, as shown below:

coverm genome \
  --coupled fastq/file1.trimmed.paired.fq1 fastq/file1.trimmed.paired.fq2 \ # this part changes (fastq files)
  --genome-fasta-files \ # this whole part stays the same (ALL high quality bins)
    bins_dir_SITE/bin.#.fa bins_dir_SITE/bin.#.fa \
    bins_dir_SITE/bin.#.fa bins_dir_SITE/bin.#.fa \
    bins_dir_SITE/bin.#.fa bins_dir_SITE/bin.#.fa \
  -t 8 \
  -m mean relative_abundance covered_fraction \
  -o coverm_output/file1.tsv 

coverm genome \
  --coupled fastq/file2.trimmed.paired.fq1 fastq/file2.trimmed.paired.fq2 \
  --genome-fasta-files \
    bins_dir_SITE/bin.#.fa bins_dir_SITE/bin.#.fa \
    bins_dir_SITE/bin.#.fa bins_dir_SITE/bin.#.fa \
    bins_dir_SITE/bin.#.fa bins_dir_SITE/bin.#.fa \
  -t 8 \
  -m mean relative_abundance covered_fraction \
  -o coverm_output/file2.tsv

# continue for all fastq files, changing ONLY file names, NOT bins

echo "Ending: "`date +"%D %T"`
