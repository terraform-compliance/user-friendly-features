Feature: Security Groups related general feature
	Every security group rule must have a description
	No security group rule allow ingress from 0.0.0.0:0 to port 22/3389

	Every security group must have a description
	No security group allow ingress from 0.0.0.0:0 to port 22/3389


	Every database security group must have a description
	No database security group allow ingress from 0.0.0.0:0

	Every elasticache security group must have a description

	related resources: aws_security_group, aws_security_group_rule, aws_db_security_group, aws_elasticache_security_group, aws_redshift_security_group



	Scenario: Every security group rule must have a description
		Given I have aws_security_group_rule defined
		Then it must have description
		And its value must not be null


	Scenario: No security group rule allow ingress from 0.0.0.0:0 to port 22
		Given I have aws_security_group_rule defined
		When its type is ingress
		And its to_port is 22
		Then it must contain cidr_blocks
		And it must not contain 0.0.0.0/0


	Scenario: No security group rule allow ingress from 0.0.0.0:0 to port 3389
		Given I have aws_security_group_rule defined
		When its type is ingress
		And its to_port is 3389
		Then it must contain cidr_blocks
#		And all of its values must not match the "0\.0\.0\.0\/0" regex
		And it must not contain "0.0.0.0/0"


	Scenario: Every security group must have a description
		Given I have aws_security_group defined
		Then it must have description
		And its value must not match the "(\x00|^$|^null|^None|^Managed by Terraform)$" regex


	Scenario: aws_security_group has ingress drilled
		Given I have aws_security_group defined
		When it has ingress
		Then it must have ingress


	@precondition(Security_Groups.feature: aws_security_group has ingress drilled)
	Scenario: No security group allow ingress from 0.0.0.0:0 to port 22
		When its to_port is 22
		Then it must contain cidr_blocks
		And it must not contain "0.0.0.0/0"


	@precondition(Security_Groups.feature: aws_security_group has ingress drilled)
	Scenario: No security group allow ingress from 0.0.0.0:0 to port 3389
		When its to_port is 3389
		Then it must contain cidr_blocks
		And it must not contain "0.0.0.0/0"




	Scenario: Every database security group must have a description
		Given I have aws_db_security_group defined
		Then it must have description
		And its value must not match the "(\x00|^$|^null|^None|^Managed by Terraform)$" regex


	Scenario: No database security group allow ingress from 0.0.0.0:0
		Given I have aws_db_security_group defined
		When it has ingress
		Then it must have ingress
		And its cidr key must not be 0.0.0.0/0


	Scenario: Every elasticache security group must have a description
		Given I have aws_elasticache_security_group defined
		Then it must have description
		And its value must not match the "(\x00|^$|^null|^None|^Managed by Terraform)$" regex



	Scenario: Every redshift security group must have a description
		Given I have aws_redshift_security_group defined
		Then it must have description
		And its value must not match the "(\x00|^$|^null|^None|^Managed by Terraform)$" regex


	Scenario: No redshift security group allow ingress from 0.0.0.0:0
		Given I have aws_redshift_security_group defined
		When it has ingress
		Then it must have ingress
		And its cidr key must not be 0.0.0.0/0

