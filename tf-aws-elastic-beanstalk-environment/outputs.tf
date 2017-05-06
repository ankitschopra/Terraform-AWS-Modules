output "name" {
  value       = "${aws_elastic_beanstalk_environment.beanstalk_env.name}"
  description = "Beanstalk Environemnt Name."
}

output "cname" {
  value       = "${aws_elastic_beanstalk_environment.beanstalk_env.cname}"
  description = "Beanstalk Environemnt CName."
}

output "setting" {
  value       = "${aws_elastic_beanstalk_environment.beanstalk_env.setting}"
  description = "Settings specifically set for this Environment"
}

output "all_setting" {
  value       = "${aws_elastic_beanstalk_environment.beanstalk_env.all_settings}"
  description = "All Settings set for this Environment"
}

output "load_balancers" {
  value       = "${aws_elastic_beanstalk_environment.beanstalk_env.load_balancers}"
  description = "Elastic load balancers in use by this environment"
}

output "application" {
  value       = "${aws_elastic_beanstalk_environment.beanstalk_env.application}"
  description = "The Elastic Beanstalk Application specified for this environment."
}