Feature: RDS related general feature
	data should be encrypted at rest
	data should not be public

	related resources: aws_db_instance, aws_rds_cluster_instance


	Scenario: data should not be public
		Given I have aws_db_instance defined
		Then its publicly_accessible must be false


	Scenario: Ensure all data stored in the RDS is securely encrypted at rest
		Given I have aws_db_instance defined
		When its replicate_source_db is None
		Then it must have storage_encrypted
		And its value must be true


	Scenario: RDS Cluster data should not be publicly accessible
		Given I have aws_rds_cluster_instance defined
		Then its publicly_accessible must be false


