Feature: DynamoDB related general feature
	DynamoDB point in time recovery (backup) must be enabled

	related resources: aws_dynamodb_table

	Scenario: DynamoDB point in time recovery (backup) must be enabled
		Given I have aws_dynamodb_table defined
		Then it must contain point_in_time_recovery
		Then it must contain enabled
		Then its value must be true

	Scenario: data must be encrypted
	    Given I have aws_dynamodb_table defined
	    Then it must contain server_side_encryption
	    And it must contain enabled
	    And its value must be true
