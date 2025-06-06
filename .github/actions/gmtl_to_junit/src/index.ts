import * as core from "@actions/core";
import path from "path";
import * as fs from "fs";

export async function run() {
  try {
    const results_path = core.getInput("results-path");
    const out_name = core.getInput("out-name") || "gmtl_results.xml";
    let out_path = core.getInput("out-path");

    if (!out_path) {
      const cwd = process.cwd();
      out_path = path.join(cwd, out_name);
    } else {
      out_path = path.join(out_path, out_name);
    }

    core.info(`Writing to ${out_path}`);

    if (fs.existsSync(results_path)) {
      core.info(`File found: ${results_path}`);
    } else {
      core.error(`File not found: ${results_path}`);
    }
  } catch (err) {
    core.setFailed(err instanceof Error ? err.message : String(err));
  }
}

run();
