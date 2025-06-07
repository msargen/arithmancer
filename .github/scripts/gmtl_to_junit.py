import argparse

print("hi hi from gmtl to junit")

parser = argparse.ArgumentParser()
parser.add_argument('results_file_path')
parser.add_argument('out_file_path')

args = parser.parse_args()

with open(args.results_file_path) as f:
    contents = f.read()
    print(contents)

with open(args.out_file_path, "w") as w:
    w.write(contents)
