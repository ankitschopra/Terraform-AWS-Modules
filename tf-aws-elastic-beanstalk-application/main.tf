resource "aws_elastic_beanstalk_application" "beanstalk_app" {
  name        = "${var.app_name}"
  description = "Beanstalk Application for Test APP"
}
