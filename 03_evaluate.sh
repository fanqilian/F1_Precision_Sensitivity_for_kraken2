#!/bin/bash
#SBATCH -J evaluate
#SBATCH -p cpu
#SBATCH --output=evaluate.out
#SBATCH --error=evaluate.err
#SBATCH -N 1
#SBATCH --exclusive
#SBATCH --mail-type=end,fail
#SBATCH --mail-user=hahahehe@sjtu.edu.cn

# 指定nodes.dmp和rank
nodes_dmp="/lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/kk2_cal/kraken2-reference-data/nodes2.dmp"
rank="genus"

# 指定truth.tsv文件的目录
truth_dir="/lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/kk2_cal/sh/01/genus_n"

# 指定calls.tsv文件的目录
calls_dir="/lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/trim/kk2_out_cat"

# 指定结果输出的目录
output_dir="/lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/kk2_cal/sh/02"

# 遍历truth.tsv文件目录下的所有.tsv文件
for truth_file in $truth_dir/*_04_bbmap.sorted_mapped_reads.tsv
do
    # 获取文件名，去除扩展名
    base=$(basename "$truth_file" _04_bbmap.sorted_mapped_reads.tsv)

    # 创建相应的calls文件路径
    calls_file="$calls_dir/${base}_08_kraken2_nr.tsv"
    output_file="$output_dir/${base}_results.txt"

    # 如果calls文件存在，则执行evaluate_calls命令
    if [ -f "$calls_file" ]
    then
        /lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/kk2_cal/kraken2-experiment-code/Utilities/evaluate_calls $nodes_dmp $rank $truth_file $calls_file > $output_file
    fi
done
