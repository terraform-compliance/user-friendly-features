Feature: KMS related general feature

	Scenario: Ensure rotation for customer created CMKs is enabled
		Given I have aws_kms_key defined
		Then it must have enable_key_rotation
		And its value must be True