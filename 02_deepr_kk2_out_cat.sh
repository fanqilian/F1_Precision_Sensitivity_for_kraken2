#!/bin/bash
#SBATCH -J deepr_bbduk_cat
#SBATCH -p cpu
#SBATCH --output=deepr_bbduk_cat.out
#SBATCH --error=deepr_bbduk_cat.err
#SBATCH -N 1
#SBATCH --exclusive
#SBATCH --mail-type=end,fail
#SBATCH --mail-user=hahahehe@sjtu.edu.cn


# 指定输入和输出目录
input_dir="/lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/trim/kk2_out"
output_dir="/lustre/home/acct-ioozy/ioozy-user3/FQL/SMTD/D_kraken2/trim/kk2_out_cat"

# 创建输出目录，如果它还不存在
mkdir -p $output_dir

# 遍历输入目录下的所有 .out 文件
for file in $input_dir/*.out
do
    # 获取文件名，去除扩展名
    base=$(basename "$file" .out)

    # 创建输出文件路径
    output_file="$output_dir/${base}.tsv"

    # 使用 cut 命令处理输入文件，并将结果保存到输出文件
    cut -f 2-3 "$file" > "$output_file"
done

