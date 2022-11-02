variable "emr_service_role" {
  default = "arn:aws:iam::xxxxx:role/xxxx/EMR_DefaultRole"
}

variable "emr_ec2_instance_profile" {
  default = "arn:aws:iam::xxxxx:instance-profile/EMR_EC2_DefaultRole"
}
