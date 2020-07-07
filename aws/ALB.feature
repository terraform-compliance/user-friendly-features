Feature: ALB related general feature
	ALB protocol must be HTTPS

	related resources: aws_alb_listener, aws_lb_listener


	Scenario: ALB protocol must be HTTPS
		Given I have aws_lb_listener defined
		Then its protocol must be HTTPS