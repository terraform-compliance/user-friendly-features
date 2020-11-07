Feature: EBS related general feature
	Data must be encrypted at rest

	related resources: aws_ebs_volume

	Scenario: Data must be encrypted at rest
		Given I have aws_ebs_volume defined
		Then its encrypted must be true