# user-friendly-features

This is a repository for collecting commonly usable features in one place.

## Usage

`terraform-compliance -p /path/to/plan.out.json -f git:https://github.com/terraform-compliance/user-friendly-features -S`

`-S` is [optional](https://terraform-compliance.com/pages/usage/#-s--silent), it makes the output less verbose.


## How does it work?

Each directory contains features related to a specific provider, and each feature contains scenarios related to similar resources.

For example:
* `azure/` contains features that test azure resources
* `aws/S3.feature` contains scenarios that test S3 related resources, data sources, etc.


## Contribution

Thanks for contributing! Public contribution is the essence of this repository. If you are unsure of anything, please do not hesitate to submit an issue or PR.

### Adding tests
Each added scenario should have accompaniying `passing` and `failing` tests.

File structure looks like
```
.
├── README.md
├── aws
│	├── ALB.feature
│	├── IAM.feature
│	├── S3.feature
│   └── ...
├── azure
│   └── ...
...
├── new_provider
│	├── new_feature.feature
│   └── ...
│
│
├── tests
│   ├── aws
│	│   ├── ALB
│	│   │   ├── passing_setups
│	│   │   │   ├── main.tf
│	│   │   │   └── plan.out.json
│	│   │   └── failing_setups
│	│   │       ├── main.tf
│	│   │       ├── plan.out.json
│	│   │       ├── .failure
│	│   │       └── .expected
│	│   ├── IAM
│	│   │   ├── passing_setups
│	│   │   │   └── ...
│	│   │   └── failing_setups
│	│   │       └── ...
│	│   │
│   ├── azure
│	│   ├── Compute
│	│   │   ├── ...
...
│	│   │
│   ├── new_provider
│	│   ├── new_feature
│	│   │   ├── ...
```

To add a new scenario to an existing feature, simply add the related `passing_setups` and `failing_setups` to matching directories.

To add a new feature to an existing provider, you should create a new directory under `tests/provider/` and add your tests while preserving the file structure

To add a new provider, you should follow the same steps while also creating the necessary directories on the provider level. You may also want to add your provider to the following for it to be evaulated by testing scripts:
```
tox.ini
tests/run_functional_tests.py
tests/cp_features.sh
```

### Writing tests
If you have contributed to [terraform-compliance](https://terraform-compliance.com/pages/contribution/#contributing-to-terraform-compliance) before, writing tests is going to be familiar.

**To write passing tests,** you will need to provide two files under the appropriate `passing_setups` directory:
* JSON plan file via `plan.out.json`
* terraform file that produces the plan under `main.tf`

Please note that only `plan.out.json` is needed to run your tests. Terraform files are there for reference, and you can add multiple files/directories if preferred.

**To write failing tests,** you will need the following files under the appropriate `failing_setups` directory:
* JSON plan file via `plan.out.json`
* terraform file that produces the plan under `main.tf`
* `.failure`, an empty file that tells the testing harness to expect failure


You may also consider using additional [**dotfiles**](https://terraform-compliance.com/pages/contribution/#dotfiles) to enforce specific outputs.


### Testing your changes
`tox -e integration` to run all tests
`tox -e <provider>` to run all tests related to the specific provider (aws, azure, etc.)

`./tests/cp_features.sh rm all` to cleanup unwanted features in test directories. (Can be useful when tox exits before finishing)


## Thanks to

[Checkov](https://github.com/bridgecrewio/checkov) for providing inspiration for most of the scenarios on release.
