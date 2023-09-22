#!/bin/bash
#SBATCH -J merge_deepr_b
#SBATCH -p small
#SBATCH --output=merge_d_b.out
#SBATCH --error=merge_d_b.err
#SBATCH -N 1
#SBATCH -n 20
#SBATCH --mail-type=end,fail
#SBATCH --mail-user=hahahehe@sjtu.edu.cn


# 输出文件
output="/lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/kk2_cal/sh/03/deepr_b.txt"

# 清空输出文件
> $output

# 遍历目录A下的所有.txt文件
for file in /lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/kk2_cal/sh/03/deepr_bbduk/*.txt
do
    # 获取文件名
    filename=$(basename "$file")

    # 提取文件的最后一行并写入输出文件
    tail -n 1 "$file" >> $output

    # 向输出文件中添加文件名
    echo -e "$(tail -n 1 $file)\t$filename" >> $output
done
