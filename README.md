# Bandit by PyCQA

The official [Bandit](https://github.com/PyCQA/bandit) Action developed by the [PyCQA](https://github.com/PyCQA).

## Usage

Here is a minimal complete example workflow to create a Code Scanning action using Bandit.

```yaml
name: Bandit

on:
  workflow_dispatch:

jobs:
  analyze:
    runs-on: ubuntu-latest
    permissions:
      # required for all workflows
      security-events: write
      # only required for workflows in private repositories
      actions: read
      contents: read
    steps:
      - name: Perform Bandit Analysis
        uses: PyCQA/bandit-action@v1
```

## Inputs

| Name | Description | Required | Default Value |
|--|--|--|--|
| python-version | Version of Python to use | False | `"3.9"` |
| configfile | Config file to use for selecting plugins and overriding defaults | False | `"DEFAULT"` |
| profile | Profile to use (defaults to executing all tests) | False | `"DEFAULT"` |
| tests | Comma-separated list of test IDs to run | False | `"DEFAULT"` |
| skips | Comma-separated list of test IDs to skip | False | `"DEFAULT"` |
| severity |Report only issues of a given severity level or higher. "all" and "low" are likely to produce the same results, but it is possible for rules to be undefined which will not be listed in "low". Options include: {all, high, medium, low} | False | `"DEFAULT"` |
| confidence | Report only issues of a given confidence level or higher. "all" and "low" are likely to produce the same results, but it is possible for rules to be undefined which will not be listed in "low". Options include: {all, high, medium, low} | False | `"DEFAULT"` |
| exclude | Comma-separated list of paths (glob patterns supported) to exclude from scan (note that these are in addition to the excluded paths provided in the config file) | False | `".svn,CVS,.bzr,.hg,.git,__pycache__,.tox,.eggs,*.egg"` |
| baseline | Path of a baseline report to compare against (only JSON-formatted files are accepted) | False | `"DEFAULT"` |
| ini | Path to a .bandit file that supplies command line arguments | False | `"DEFAULT"` |
| targets | Source file(s) or directory(s) to be tested | False | `"."` |
