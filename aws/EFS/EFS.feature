Feature: EFS related general feature

	Scenario:  Ensure EFS is encrypted
		Given I have aws_efs_file_system defined
		Then it must have encrypted
		And its value must be true