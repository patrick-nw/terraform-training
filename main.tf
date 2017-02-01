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
  default = "3"
}

resource "aws_instance" "web" {
  instance_type          = "t2.micro"
  ami                    = "ami-30217250"
  subnet_id              = "subnet-2b349873"
  vpc_security_group_ids = ["sg-bcd874db"]
  count                  = "${var.num_webs}"

  tags {
    Identity = "ttt-bat"
    Location = "ttt-batcave"
    Vehicle  = "ttt-batmobile"

    #Aiming for:
    #Name = "web 1/2"
    Name = "web ${count.index+1}/${var.num_webs}"
  }
}

#module "example" {
#  source = "./example-module"
#  command = "echo 'Goodbye World'"
#}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}

output "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}
