Feature: Database related general feature

	Related resources: azurerm_mariadb_firewall_rule, azurerm_sql_firewall_rule, azurerm_postgresql_firewall_rule, azurerm_mysql_firewall_rule, azurerm_mssql_server_security_alert_policy

	# Can use regex here to capture 0.0.0.0/0 as well
	Scenario Outline: Ensure databases won't allow ingress from 0.0.0.0/0 (ANY IP)
		Given I have <db_rule> defined
		When it has start_ip_address
		Then it must have start_ip_address
		Then its value must not be <bad_ip>

	Examples:
			| db_rule 							| bad_ip    |
			| azurerm_mariadb_firewall_rule 	| 0.0.0.0   |
			| azurerm_sql_firewall_rule 		| 0.0.0.0   |
			| azurerm_postgresql_firewall_rule 	| 0.0.0.0   |
			| azurerm_mysql_firewall_rule 		| 0.0.0.0   |


	Scenario: Ensure that 'Threat Detection types' is set to 'All'
		Given I have azurerm_mssql_server_security_alert_policy defined
		When it has disabled_alerts
		Then it must have disabled_alerts
		And its value must be null


	Scenario: Ensure that 'Send Alerts To' is enabled for MSSQL servers
		Given I have azurerm_mssql_server_security_alert_policy defined
		Then it must have email_addresses
		And its value must not be null
