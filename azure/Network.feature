Feature: Network related general feature

	related_resources: azurerm_network_watcher_flow_log

	Scenario: Ensure that Network Security Group Flow Log is defined with retention period greater than 90 days
		Given I have azurerm_network_watcher_flow_log defined
		Then it must have retention_policy
		Then it must have enabled
		And its value must be true

		Given I have azurerm_network_watcher_flow_log defined
		Then it must have retention_policy
		Then it must have days
		And its value must be greater than 90