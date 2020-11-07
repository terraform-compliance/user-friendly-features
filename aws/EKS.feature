Feature: EKS related general feature

	Scenario Outline: Ensure Amazon EKS control plane logging enabled for all log types
		Given I have aws_eks_cluster defined
		Then it must have enabled_cluster_log_types
		Then it must contain <value>

		Examples:
			| value 				|
			| api 					|
			| audit					|
			| authenticator 		|
			| controllerManager		|
			| scheduler 			|


	Scenario: Ensure Amazon EKS public endpoint not accessible to 0.0.0.0/0
		Given I have aws_eks_cluster defined
		Then it must have vpc_config
		When its endpoint_public_access is true
		Then it must have public_access_cidrs
		And it must not contain 0.0.0.0/0

