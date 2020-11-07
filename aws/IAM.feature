Feature: IAM related general features
	IAM policies that allows full priviliges must not be created
	IAM password should: 
		- be longer than 13 characters (min 14)
		- have at least one uppercase/lowercase letter
		- have at least one number
		- not be reused??
		- have at least one symbol

	related resources: aws_iam_policy_document, aws_iam_account_password_policy, aws_iam_policy


	Scenario: IAM password should be loneger than 13 characters
		Given I have aws_iam_account_password_policy defined
		Then it must have minimum_password_length
		And its value must be greater than 13


	Scenario: IAM password should require uppercase characters
		Given I have aws_iam_account_password_policy defined
		Then it must have require_uppercase_characters
		And its value must be true


	Scenario: IAM password should require lowercase characters
		Given I have aws_iam_account_password_policy defined
		Then it must have require_lowercase_characters
		And its value must be true


	Scenario: IAM password should require numbers
		Given I have aws_iam_account_password_policy defined
		Then it must have require_numbers
		And its value must be true


	Scenario: Ensure IAM password policy requires at least one symbol
		Given I have aws_iam_account_password_policy defined
		Then it must have require_symbols
		And its value must be true


	Scenario: Ensure IAM password policy prevents password reuse
		Given I have aws_iam_account_password_policy defined
		Then it must have password_reuse_prevention
		And its value must be greater than 0


	Scenario: IAM policies that allows full priviliges must not be created
		Given I have aws_iam_policy defined
		When it has policy
		Then it must have policy
		When it has Statement
		Then it must have Statement
		When its Effect is Allow
		And its Action is sts:AssumeRole
		Then it must contain resource
		And its value must not be *


	# not 90 because greater/less than or equal to is not supported yet
	Scenario: Ensure IAM password policy expires passwords within 90 days or less
		Given I have aws_iam_account_password_policy defined
		Then it must have max_password_age
		And its value must be less than 91


	Scenario: Ensure there are no iam user policy attachments
		Given I have aws_iam_user_policy_attachment defined
		Then it must fail