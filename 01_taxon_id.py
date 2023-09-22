import argparse
import os

def replace_ids(input_dir, output_dir):
    # Define your replacements here
    replacements = {
        "3dac_Chromosome1": "49928",
        "A501_one_new": "2263",
        "NC_013967.1": "2251",
        "NC_013968.1": "2251",
        "NC_013965.1": "2251",
        "NC_013964.1": "2251",
        "NC_013966.1": "2251",
        "RC": "1827",
        "tig00002": "1827",
        "tig00003": "1827",
        "SG": "60919",
        "PV": "286",
        "P51": "286",
        "SP": "13687",
        "wp3-wt": "22",
        "MB": "2742"
    }
    
    for filename in os.listdir(input_dir):
        with open(os.path.join(input_dir, filename), 'r') as f_in:
            with open(os.path.join(output_dir, filename), 'w') as f_out:
                for line in f_in:
                    columns = line.strip().split('\t')
                    if columns[1] in replacements:
                        #print(f'Original: {line.strip()}')  # Print original line
                        columns[1] = replacements[columns[1]]
                        line = '\t'.join(columns) + '\n'
                        #print(f'Replaced: {line.strip()}')  # Print replaced line
                    f_out.write(line)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Replace specified strings in the second column of all files in a directory.')
    parser.add_argument('--input_dir', required=True, help='The directory containing the files to process.')
    parser.add_argument('--output_dir', required=True, help='The directory to write the processed files to.')
    args = parser.parse_args()
    
    replace_ids(args.input_dir, args.output_dir)


