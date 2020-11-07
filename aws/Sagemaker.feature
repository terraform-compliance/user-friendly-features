Feature: Sagemaker related general feature
	Data stored must be encrypted at rest

	related resources: aws_sagemaker_notebook_instance

	Scenario: Data stored must be encrypted at rest
		Given I have aws_sagemaker_notebook_instance defined
		Then it must have kms_key_id
		And its value must not be null