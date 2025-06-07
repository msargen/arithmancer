import argparse

checkmark = "✔"
skipped = "⚠"
failed = "❌"

parser = argparse.ArgumentParser()
parser.add_argument('results_file_path')
parser.add_argument('out_file_path')

args = parser.parse_args()

with open(args.results_file_path) as f:
    test_output_lines = []
    capturing = False

    for line in f:
        if line.strip().startswith("-------"):
            capturing = True
        if capturing:
            test_output_lines.append(line)
        if capturing and "All tests finished" in line:
            break

    test_output = "".join(test_output_lines)
    print(test_output)

with open(args.out_file_path, "w") as w:
    w.write(test_output)
