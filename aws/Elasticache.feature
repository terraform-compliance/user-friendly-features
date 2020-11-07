Feature: Elasticache related general feature
	Data must be encrypted at rest
	Data in elasticache replication group must be encrypted at transit

	related resources: aws_elasticache_replication_group

	Scenario: Data must be encrypted at rest
		Given I have aws_elasticache_replication_group defined
		Then its at_rest_encryption_enabled must be true


	Scenario: Data in elasticache replication group must be encrypted at transit
		Given I have aws_elasticache_replication_group defined
		Then its transit_encryption_enabled must be true


	Scenario: Data in elasticache replication must be protected by an auth token
		Given I have aws_elasticache_replication_group defined
		When its transit_encryption_enabled is true
		Then it must have auth_token
		And its value must not be null
