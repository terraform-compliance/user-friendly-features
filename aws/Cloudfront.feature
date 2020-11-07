Feature: Cloudfront related general features.
	Cloudfront distribution default ViewerProtocolPolicy must set to HTTPS # unsure if this scenario is correct

	related resources: aws_cloudfront_distribution

	Scenario: Cloudfront distribution default ViewerProtocolPolicy must set to HTTPS
		Given I have aws_cloudfront_distribution defined
		Then it must have default_cache_behavior
		And it must have viewer_protocol_policy
		And its value must not be allow-all
