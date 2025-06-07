import argparse
import xml.etree.ElementTree as ET
import re

checkmark = "✔"
skipped = "⚠"
failed = "❌"
suite_delimiter = "-------"
completion_marker = "All tests finished"
extraction_regex = r'^(.*?)\s+\(([\d.]+)ms\)$'

parser = argparse.ArgumentParser()
parser.add_argument('results_file_path')
parser.add_argument('out_file_path')

args = parser.parse_args()

with open(args.results_file_path) as f:
    test_output_lines = []
    capturing = False

    for line in f:
        if line.strip().startswith(suite_delimiter):
            capturing = True
        if capturing:
            test_output_lines.append(line)
        if capturing and completion_marker in line:
            break

    test_output = "".join(test_output_lines)

test_suites = ET.Element("testsuites")

suite_test_count = 0
suite_failures = 0
suite_skipped = 0
suite_time = 0.0
is_capturing_error = False
error_lines = []
test_case = None
current_suite = None

for line in test_output_lines:
    # This is where the heart of the processing lives
    if (suite_delimiter in line):
        if is_capturing_error:
            is_capturing_error = False
            test_case.append(ET.Element("failure", { "message": "\n".join(error_lines) }))
        if current_suite is not None: # before we setup the next suite, we should add the remaining properties to the old suite
            current_suite.set("tests", str(suite_test_count))
            current_suite.set("failures", str(suite_failures))
            current_suite.set("skipped", str(suite_skipped))
            current_suite.set("time", str(suite_time))
            suite_test_count = 0
            suite_failures = 0
            suite_skipped = 0
            suite_time = 0.0
        
        suite_name = line.replace(suite_delimiter, "").strip()
        current_suite = ET.SubElement(test_suites, "testsuite", {
            "name": suite_name
        })
    elif completion_marker in line:
        if is_capturing_error:
            test_case.append(ET.Element("failure", { "message": "\n".join(error_lines) }))
        if current_suite is not None:            
            current_suite.set("tests", str(suite_test_count))
            current_suite.set("failures", str(suite_failures))
            current_suite.set("skipped", str(suite_skipped))
            current_suite.set("time", str(suite_time))
        break # Shouldn't be necessary but better more correct than sorry
    else:
        if checkmark in line: # This is a success
            if is_capturing_error:
                is_capturing_error = False
                test_case.append(ET.Element("failure", { "message": "\n".join(error_lines) }))
            
            line = line.strip().removeprefix(checkmark).strip()
            match = re.match(extraction_regex, line)
            if match:
                test_case = ET.SubElement(current_suite, "testcase", {
                    "name": match.group(1),
                    "time": match.group(2)
                })
                suite_time += float(match.group(2))
            suite_test_count += 1

        elif skipped in line: # This is a skip
            if is_capturing_error:
                is_capturing_error = False
                test_case.append(ET.Element("failure", { "message": "\n".join(error_lines) }))

            line = line.strip().removeprefix(skipped).strip()
            test_case = ET.SubElement(current_suite, "testcase", {
                "name": line,
            }).append(ET.Element("skipped"))
            is_capturing_error = False
            suite_skipped += 1
            suite_test_count += 1

        elif failed in line: # This is a failed test
            if is_capturing_error:
                is_capturing_error = False
                test_case.append(ET.Element("failure", { "message": "\n".join(error_lines) }))

            line = line.strip().removeprefix(failed).strip()
            match = re.match(extraction_regex, line)
            if match:
                test_case = ET.SubElement(current_suite, "testcase", {
                    "name": match.group(1),
                    "time": match.group(2)
                })                
                suite_time += float(match.group(2))
            is_capturing_error = True
            error_lines = []
            suite_failures += 1
            suite_test_count += 1
            
        elif is_capturing_error:
            error_lines.append(line.strip())

tree = ET.ElementTree(test_suites)
tree.write(args.out_file_path, encoding="utf-8", xml_declaration=True)
