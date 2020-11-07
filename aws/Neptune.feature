Feature: Neptune related general feature

	Scenario: Ensure Neptune storage is securely encrypted
		Given I have aws_neptune_cluster defined
		Then it must have storage_encrypted
		And its value must be true