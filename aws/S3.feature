Feature: S3 related general feature
	Implemented
		- Data must be encrypted at rest (what if it's suppose to be public?, maybe check if it's suppose to be public before? What if it's mistakenly set as public?)
		- Data stored in S3 has versioning enabled


	Questionable checks (only checks if one pass)
	- S3 must have access logging enabled


	Scenario: Data must be encrypted at rest
		Given I have aws_s3_bucket defined
		Then it must have server_side_encryption_configuration

	
	# check if at least one s3 has logging enabled, because logging will require another s3
	@noskip_at_line_20
	Scenario: S3 must have access logging enabled 
		Given I have aws_s3_bucket defined
		When it has logging


	Scenario: Data stored in S3 has versioning enabled
		Given I have aws_s3_bucket defined
		Then it must have versioning
		Then it must have enabled
		And its value must be true