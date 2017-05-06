output "beanstalk_app_name" {
  value       = "${aws_elastic_beanstalk_application.beanstalk_app.name}"
  description = "Beanstalk Application Name."
}
