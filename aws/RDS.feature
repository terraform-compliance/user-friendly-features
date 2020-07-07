Feature: RDS related general feature
	data should be encrypted at rest
	data should not be public

	related resources: aws_db_instance

	# Scenario: data should be encrypted at rest.
	# TODO

	Scenario: data should not be public
		Given I have aws_db_instance defined
		Then its publicly_accessible must be false
