Feature: SNS related general feature
	Data stored in SNS topic must be encrypted

	related resources: aws_sns_topic

	Scenario: Data stored in SNS topic must be encrypted
		Given I have aws_sns_topic defined
		Then it must contain kms_master_key_id
		And its value must not be null