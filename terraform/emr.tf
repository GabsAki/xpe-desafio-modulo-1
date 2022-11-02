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
    bid_price     = 0.04
  }

  core_instance_group {
    instance_type  = "m5.xlarge"
    instance_count = 1
    bid_price      = 0.04
  }

  name = "cluster-spark-desafio-modulo-1"

  termination_protection = false

  tags = {
    "IES"   = "IGTI",
    "CURSO" = "EDC"
  }

  service_role = var.emr_service_role

  ec2_attributes {
    instance_profile = var.emr_ec2_instance_profile
  }
}
