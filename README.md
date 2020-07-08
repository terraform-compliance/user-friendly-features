# user-friendly-features

This is a draft repository for collecting commonly used / usable features in one place.

The name of the repository is probably due for a change, as common-features and commonly-used-features sounded worse.


The current file structure I have in mind is:

```
user-friendly-features (Do all in one for now, split if it feels cluttered)
	Readme.md
    docs
        currently just a big markdown file, can convert to jekyll (or else) later.
	aws
        S3.feature
        DynamoDB.feature
        ...
	azure
	other_provider…
	tests
		fun_functional_tests.py
		aws_tests
            passing_setups
                ALB
                    main.tf
                    plan.out.json
                    dotfiles (.failure, .expected, etc.)
                    feature.txt (name or path to the feature the setup will test against.)
                ...
            failing_setups
                # same as passing setups
		azure_tests
		other_provider_tests…
```


## Big Questions that can be converted to issues

Currently features are very vague and general such as "S3 Related general features." These should we expanded as we have more than a couple scenarios per feature.

Generalizing all encryption checks into a single feature (Scenario outline) and add some automation/usability improvements depending on how it turns out to be.

General features vs provider specific features. How to place them? Make a new directory?


## TODO (which should really be converted to issues later)

add tests
- add all passing tests
- add all failing tests
    - fix the .expected's (which might be cancer)


## Notes
Why have passing_setups and failing_setups?
- Felt it would be easier to name the files that way.    

Each passsing/failing setup is tested against all the features in that directory.
- Unnecesssary. (Or even good practice?)
- Should pass/skip unrelated stuff nonetheless 

Some tests fail due to release
- debug .expected's after release


usage: `terraform-compliance -p plan.out.json -f path_to_repo`