Feature: ECR related general feature.
	ECR policy must not be public
	ECR image scanning on push must be enabled

	related resources: aws_ecr_repository_policy, aws_ecr_repository


	Scenario: ECR policy must not be public
		Given I have aws_ecr_repository_policy defined
		Then it must have policy
		When it has statement
		Then it must have statement
		And it must have Principal
		And its value must not be *


	Scenario: ECR image scanning on push must be enabled
		Given I have aws_ecr_repository defined
		Then it must have image_scanning_configuration
		And its scan_on_push must be true