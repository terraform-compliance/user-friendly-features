Feature: Kinesis related general feature

	Scenario: Ensure Kinesis Stream is encrypted
		Given I have aws_kinesis_stream defined
		Then it must have encryption_type
		And its value must not be NONE	
