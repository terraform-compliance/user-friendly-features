Feature: Elasticsearch related general feature


	# encrypted_at_rest is only supported by certain instances. TODO: add that to the logic
	Scenario: Ensure all data stored in the Elasticsearch is securely encrypted at rest
		Given I have aws_elasticsearch_domain defined
		Then it must have encrypt_at_rest
		And its value must be True


	Scenario: Ensure all Elasticsearch has node-to-node encryption enabled
		Given I have aws_elasticsearch_domain defined
		Then it must have node_to_node_encryption
		And it must have enabled
		And its value must be true
		