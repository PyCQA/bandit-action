# GitHub Action for Bandit

This is the official GitHub Action for running
[Bandit](https://bandit.readthedocs.io/en/latest/), developed by the maintainers
of Bandit. It is designed to be configurable and easy to use.

## Features

- :gear: Fully configurable with input parameters and support for config files.
- :speech_balloon: Posts scan results as a comment on pull requests.

## Inputs

| Name                 | Description                                                 | Default |
|----------------------|-------------------------------------------------------------|---------|
| `recursive`          | Find and process files in subdirectories.                   | `false` |
| `aggregate`          | Aggregate output by vulnerability or by filename.           | `vuln`  |
| `context_lines`      | Maximum number of code lines to output for each issue.      |         |
| `config_file`        | Optional config file to use for selecting plugins.          |         |
| `profile`            | Profile to use, defaults to executing all tests.            |         |
| `tests`              | Comma-separated list of test IDs to run.                    |         |
| `skips`              | Comma-separated list of test IDs to skip.                   |         |
| `severity_level`     | Report only issues of a given severity level or higher.     | `low`   |
| `confidence_level`   | Report only issues of a given confidence level or higher.   | `low`   |
| `verbose`            | Output extra information like excluded and included files.  | `false` |
| `debug`              | Turn on debug mode.                                         | `false` |
| `quiet`              | Only show output in the case of an error.                   | `false` |
| `ignore_nosec`       | Do not skip lines with `# nosec` comments.                  | `false` |
| `exclude_paths`      | Comma-separated list of paths to exclude from scan.         |         |
| `baseline`           | Path of a baseline report to compare against.               |         |
| `ini_path`           | Path to a `.bandit` file that supplies command line args.   |         |
| `exit_zero`          | Exit with 0 even with results found.     

| :memo:        | We do not expose args for output/format,message_template, as we need to hardcore the report for the PR comment feature|
|---------------|:----------------------------------------------------------------------------------------------------------------------|

## Usage

To use the action, add the following to a GitHub workflow file (e.g. `.github/workflows/bandit.yml`):

### Basic Example

```yaml
name: Bandit Code Scan

on:
  pull_request:
    branches: [ main ]

permissions:
  pull-requests: write

jobs:
  bandit-action:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Run Bandit Scan
      uses: ./
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        path: "."
        exit_zero: "true"
        recursive: "true"
```

```yaml
name: Bandit Code Scan

on: [push, pull_request]

permissions:
  pull-requests: write

jobs:
  bandit-action:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Run Bandit Scan
      uses: ./
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        path: "."
        exit_zero: true
        recursive: true
        aggregate: vuln
        context_lines: 3
        config_file: .bandit
        profile: bandit
        tests: B101,B102
        skips: B103
        severity_level: low
        confidence_level: low
        verbose: true
        debug: true
        quiet: false
        ignore_nosec: false
        exclude_paths: tests,docs
        baseline: baseline.json
        ini_path: .bandit
        exit_zero: false
```

## Contributing

If you would like to contribute to this project, please open an issue or a pull
request.

## License

This GitHub Action is distributed under the Apache License, Version 2.0, see
[LICENSE](LICENSE) for more information.
