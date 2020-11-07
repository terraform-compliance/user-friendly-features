Feature: Compute related general feature

	related resources: azurerm_managed_disk

	Scenario: Ensure Azure managed disk have encryption enabled
		Given I have azurerm_managed_disk defined
		Then it must have encryption_settings
		And its enabled must be true