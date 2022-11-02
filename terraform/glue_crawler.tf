resource "aws_glue_crawler" "glue_crawler" {
  database_name = "datalake-staging"
  name          = "rais2020"
  role          = "service-role/AWSGlueServiceRole-desafio-modulo-1"

  s3_target {
    exclusions = []
    path = "s3://desafio-modulo-1-850900288339/zona_staging/rais/"
  }

  tags = {
    "CURSO" : "EDC",
    "IES" : "IGTI"
  }
}
