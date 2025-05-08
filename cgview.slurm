#!/bin/bash
#SBATCH --job-name=cgview\
#SBATCH --output=cgview_%j.out\
#SBATCH --error=cgview_%j.err
#SBATCH --mail-user=jklomparens@middlebury.edu
#SBATCH --mail-type=ALL
#SBATCH --mem=32GB
#SBATCH --partition=standard
#SBATCH --time=05:00:00

echo "Job ID: $\{SLURM_JOB_ID\}"
echo "Node: $\{SLURMD_NODENAME\}" 
echo "Starting: "`date +"%D %T"`

java -jar -Xmx1500m /path/to/cgview.jar -i /path/to/prokka_results_file1/prokka.xml -o prokka_results_file1/gene_map_file1.png

echo "Ending: "`date +"%D %T"`
