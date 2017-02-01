#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-2b349873
#
# Your security group ID is:
#
#     sg-bcd874db
#
# Your AMI ID is:
#
#     ami-30217250
#
# Your Identity is:
#
#     ttt-bat
#

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

variable "aws_access_key" {}

variable "aws_secret_key" {
  type = "string"
}

variable "aws_region" {
  type    = "string"
  default = "us-west-1"
}

variable "num_webs" {
  default = "2"
}
