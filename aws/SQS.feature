Feature: SQS related general feature
	Data stored must be encrypted

	related resources: aws_sqs_queue

	Scenario: Data stored must be encrypted
		Given I have aws_sqs_queue defined
		Then it must have kms_master_key_id
		And its value must not be null