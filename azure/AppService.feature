Feature: App Service related general feature

	related resources: azurerm_app_service

	
	Scenario: Ensure App Service Authentication is set on Azure App Service
		Given I have azurerm_app_service defined
		Then it must have auth_settings
		And its enabled must be true


	Scenario: Ensure web app redirects all HTTP traffic to HTTPS in Azure App Service
		Given I have azurerm_app_service defined
		Then its https_only must be true


	Scenario:  Ensure web app is using the latest version of TLS encryption
		Given I have azurerm_app_service defined
		When it has site_config
		Then it must have site_config
		When it has min_tls_version
		Then it must have min_tls_version
		And its value must be 1.2


	Scenario: Ensure that Register with Azure Active Directory is enabled on App Service
		Given I have azurerm_app_service defined
		Then it must have identity
		And its value must not be null


	Scenario: Ensure the web app has 'Client Certificates (Incoming client certificates)' set
		Given I have azurerm_app_service defined
		Then it must have client_cert_enabled
		And its value must be true


	Scenario: Ensure that 'HTTP Version' is the latest if used to run the web app
		Given I have azurerm_app_service defined
		Then it must have site_config
		And it must have http2_enabled
		And its value must be true
