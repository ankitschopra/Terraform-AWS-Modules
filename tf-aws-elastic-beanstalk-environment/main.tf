resource "aws_elastic_beanstalk_environment" "beanstalk_env" {
  name                   = "${var.env_name}-${var.env_name_suffix}"
  description            = "Beanstalk Environment for ${var.app_name}"
  application            = "${var.app_name}"
  solution_stack_name    = "${var.beanstalk_solution_stack_name}"
  tier                   = "WebServer"
  cname_prefix           = "${var.env_name}-${var.env_name_suffix}"
  wait_for_ready_timeout = "30m"
  tags        = "${merge(map("Name","${var.env_name}-${var.env_name_suffix}"), "${var.tags}")}"

  # Ignore Health Check can help when first starting up the infrastructure
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "IgnoreHealthCheck"
    value     = "${var.ignore_health_check}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = "${var.deployment_policy}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "Timeout"
    value     = "600"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application"
    name      = "Application Healthcheck URL"
    value     = "${var.health_check_url}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${var.beanstalk_ec2_subnets}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${var.vpc_id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${var.beanstalk_elb_subnets}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "${var.beanstalk_elb_scheme}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "false"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = "Any"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Cooldown"
    value     = "600"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "${var.min_size}"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "${var.max_size}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "LowerThreshold"
    value     = "${var.lower_threshold}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "MeasureName"
    value     = "${var.measure_name}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Statistic"
    value     = "${var.statistic}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Unit"
    value     = "${var.unit}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperThreshold"
    value     = "${var.upper_threshold}"
  }

  #Rolling Update Management. Disable for now.
  /*

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = "50"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSizeType"
    value     = "Percentage"
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "ManagedActionsEnabled"
    value     = "true"
  }

  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "PreferredStartTime"
    value     = "${var.beanstalk_maintenance_window}"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MaxBatchSize"
    value     = "${var.max_batch_size}"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "MinInstancesInService"
    value     = "${var.min_instances_in_service}"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "Health"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "false"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "Timeout"
    value     = "PT12M"
  }

  setting {
    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
    name      = "UpdateLevel"
    value     = "patch"
  }*/

  /*setting {
    namespace = "aws:elasticbeanstalk:sns:topics"
    name      = "Notification Endpoint"
    value     = "${var.beanstalk_notification_email}"
  }*/

  # ELB Policies.
  setting {
    namespace = "aws:elb:policies"
    name      = "ConnectionDrainingEnabled"
    value     = "true"
  }

  setting {
    namespace = "aws:elb:policies"
    name      = "ConnectionDrainingTimeout"
    value     = "360"
  }

  setting {
    namespace = "aws:elb:policies"
    name      = "ConnectionSettingIdleTimeout"
    value     = "360"
  }

  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "LoadBalancerHTTPSPort"
    value     = "OFF"
  }

  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "CrossZone"
    value     = "true"
  }

  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "LoadBalancerHTTPPort"
    value     = "80"
  }

  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "SecurityGroups"
    value     = "${var.beanstalk_elb_security_group_id}"
  }

  setting {
    namespace = "aws:elb:healthcheck"
    name      = "HealthyThreshold"
    value     = "3"
  }

  setting {
    namespace = "aws:elb:healthcheck"
    name      = "Interval"
    value     = "10"
  }

  setting {
    namespace = "aws:elb:healthcheck"
    name      = "Timeout"
    value     = "9"
  }

  setting {
    namespace = "aws:elb:healthcheck"
    name      = "UnhealthyThreshold"
    value     = "5"
  }

  /*setting {
    namespace = "aws:elb:loadbalancer"
    name      = "SSLCertificateId"
    value     = "redacted"
  }*/

  /*setting {
    namespace = "aws:elb:loadbalancer"
    name      = "ManagedSecurityGroup"
    value     = "${var.beanstalk_elb_security_group_id}"
  }*/

  /*setting {
    namespace = "aws:elb:listener"
    name      = "ListenerEnabled"
    value     = "true"
  }

  setting {
    namespace = "aws:elb:listener:80"
    name      = "ListenerEnabled"
    value     = "true"
  }*/

  /*setting {
    namespace = "aws:elb:listener:443"
    name      = "ListenerProtocol"
    value     = "HTTPS"
  }

  setting {
    namespace = "aws:elb:listener:443"
    name      = "InstancePort"
    value     = "80"
  }

  setting {
    namespace = "aws:elb:listener:443"
    name      = "InstanceProtocol"
    value     = "HTTP"
  }

  setting {
    namespace = "aws:elb:listener:443"
    name      = "SSLCertificateId"
    value     = "redacted"
  }*/



  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "${var.beanstalk_service_role}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "${var.heath_report_system_type}"
  }


  # EC2 Launch Configuration
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SSHSourceRestriction"
    value     = "tcp,22,22,${var.cidr_of_vpc}"
  }

  /*setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "${var.beanstalk_ec2_security_group_id}"
  }*/

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeType"
    value     = "${var.root_volume_type}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeSize"
    value     = "${var.root_volume_size}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "${var.beanstalk_ec2_instance_profile}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "${var.beanstalk_instance_type}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = "${var.beanstalk_key_name}"
  }


}