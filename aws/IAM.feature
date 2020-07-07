Feature: IAM related general features
	IAM policies that allows full priviliges must not be created
	IAM password should: (I don't like stuff listed here much) (I think a very long english-ish password should also be okay.) (maybe convert this to either short and complex or very long and whatever)
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
# this stuff is on hold
# too buggy and wtf is going on? (with the policies)