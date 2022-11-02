resource "aws_emr_cluster" "emr_cluster" {
  release_label = "emr-6.3.0"

  applications = [
    "Hadoop",
    "JupyterHub",
    "Hive",
    "JupyterEnterpriseGateway",
    "Hue",
    "Spark",
    "Livy",
    "Pig"
  ]

  step_concurrency_level = 10

  master_instance_group {
    instance_type = "m5.xlarge"
    name = "Master - 1"
  }

  core_instance_group {
    instance_type  = "m5.xlarge"
    instance_count = 1
    name           = "Core - 2"
  }

  name = "cluster-spark-desafio-modulo-1-v2"

  termination_protection = false

  tags = {
    "IES"   = "IGTI",
    "CURSO" = "EDC"
  }

  service_role = "EMR_DefaultRole"

  ec2_attributes {
    instance_profile = "EMR_EC2_DefaultRole"
  }

  autoscaling_role = "EMR_AutoScaling_DefaultRole"

  ebs_root_volume_size = 10

  log_uri = var.emr_log_uri
}
