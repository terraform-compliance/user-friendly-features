Feature: Cloudtrail related general feature

	related resources: aws_cloudtrail

	Scenario: Ensure CloudTrail logs are encrypted at rest using KMS CMKs
		Given I have aws_cloudtrail defined
		Then it must have kms_key_id
		And its value must not be null


	Scenario: Ensure CloudTrail log file validation is enabled
		Given I have aws_cloudtrail defined
		Then it must have enable_log_file_validation
		And its value must be true
