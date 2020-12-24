Feature: Database related general feature

	Related resources: azurerm_mariadb_firewall_rule, azurerm_sql_firewall_rule, azurerm_postgresql_firewall_rule, azurerm_mysql_firewall_rule

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
