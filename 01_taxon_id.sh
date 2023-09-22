#!/bin/bash
#SBATCH -J replace
#SBATCH -p cpu
#SBATCH --output=replace.out
#SBATCH --error=replace.err
#SBATCH -N 1
#SBATCH --exclusive
#SBATCH --mail-type=end,fail
#SBATCH --mail-user=hahahehe@sjtu.edu.cn

python /lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/kk2_cal/sh/01/01_taxon_id.py --input_dir /lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/B_reference_based/mapping/04_03_bbmap_trim/samtools_veiw/ --output_dir /lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/kk2_cal/sh/01/genus

