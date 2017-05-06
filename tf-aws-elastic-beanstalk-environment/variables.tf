# Beanstalk General Information
variable "env_name" {
  description = "Environment Name of the Beanstalk Application."
}

variable "env_name_suffix" {
  description = "Suffix to be places behind the Environment Name"
}

variable "app_name" {
  description = "Name of the Beanstalk Application in which Environment has to be created."
}

variable "beanstalk_solution_stack_name" {
  description = "EBS Solution Stack Name"
  default     = "64bit Amazon Linux 2016.09 v2.5.2 running Docker 1.12.6"
}


# AWS Beanstalk EC2 VPC
variable "vpc_id" {
  description = "VPC ID in which Beanstalk has to be created."
}

variable "beanstalk_ec2_subnets" {
  description = "List of EC2 Private Subnets"
  default = ""
}

variable "beanstalk_elb_subnets" {
  description = "List of EC2 Public Subnets"
  default = ""
}

variable "beanstalk_elb_scheme" {
  description = "Specify internal if you want to create an internal load balancer in your VPC so that your Elastic Beanstalk application cannot be accessed from outside your VPC."
  default = "internal"
}



#AWS EBS AutoSclaing LaunchConfiguration

variable "beanstalk_instance_type" {
  description = "The instance type used to run your application in an Elastic Beanstalk environment."
}

variable "root_volume_size" {
  description = "size of Root volume"
  default = "12"
}

variable "root_volume_type" {
  description = "Volume type (magnetic, general purpose SSD or privisioned IOPS SSD) to use for the root Amazon EBS volume attached to your environment's EC2 instances"
  default = "gp2"
}

variable "beanstalk_key_name" {
  description = "A key pair enables you to securely log into your EC2 instance."
}

variable "cidr_of_vpc" {
  description = "CIDR of VPC to allow ssh"
}

variable "beanstalk_ec2_instance_profile" {
  description = "An instance profile enables AWS Identity and Access Management (IAM) users and AWS services to access temporary security credentials to make AWS API calls. Specify the profile name or the ARN."
  default = "aws-elasticbeanstalk-ec2-role"
}


variable "beanstalk_ec2_security_group_id" {
  description = "Security group to be associated with Ec2 instance of Beanstalk Environment."
  default =  ""
}

# EBS aws:elasticbeanstalk:sns:topics
variable "beanstalk_notification_email" {
  description = "Notification EMail for Beanstalk to send notification"
  default = ""
}


#Deployment

variable "ignore_health_check" {
  description = "Flag to Ignore Health Check. If health check fails, new instances will be deployed."
  default = "true"
}

variable "health_check_url" {
  description = "Health Check URL for the Beanstalk Environment"
  default = "/"
}

variable "heath_report_system_type" {
  default = "enhanced"
}

variable "deployment_policy" {
  description = "Deployment Policy"
  default = "AllAtOnce"
}

# EBS aws:elasticbeanstalk:environment
variable "beanstalk_service_role" {
  description = "The name of an IAM role that Elastic Beanstalk uses to manage resources for the environment."
  default = "aws-elasticbeanstalk-service-role"
}


variable "beanstalk_elb_security_group_id" {
  description = "Assign one or more security groups that you created to the load balancer."
  default = ""
}

#Autoscaling Trigger
variable "lower_threshold" {
  description = "Lower Threshold to sclae down instances."
  default     = "20"
}

variable "measure_name" {
  default = "CPUUtilization"
  description = "On which Measure Trigger should be done"
}

variable "statistic" {
  default = "Average"
  description = "Statistics for measure"
}

variable "unit" {
  description = "Unit of Measure"
  default     = "Percent"
}

variable "upper_threshold" {
  description = "Upper Threshold to trigger scale up"
  default     = "65"
}


# EBS Autosclaing AWS
variable "min_size" {
  description = "Minimum number of instances you want in your Auto Scaling group."
  default = 1
}

variable "max_size" {
  description = "Maximum number of instances you want in your Auto Scaling group."
  default = 1
}


#EBS aws:autoscaling:updatepolicy:rollingupdate
variable "max_batch_size" {
  description = "The number of instances included in each batch of the rolling update."
  default = ""
}

variable "min_instances_in_service" {
  description = "The minimum number of instances that must be in service within the autoscaling group while other instances are terminated."
  default = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = "map"
}
