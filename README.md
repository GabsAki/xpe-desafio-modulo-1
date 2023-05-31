# XPE Desafio Modulo 1
This repository contains the code developed for the first challenge of [XPE Cloud Data Engineer Bootcamp](https://www.xpeducacao.com.br/bootcamp/engenheiro-de-dados-cloud) in 2022.
The challange consisted of developing a simple data pipeline with some steps, utilizing AWS stack.

## Where to find the data
The data utilized int he project can be found in [this website](http://pdet.mte.gov.br/microdados-rais-e-caged).
For this project, the data of the year 2020 was selected.

## Project Architecture
![Project Architecure](/architecture/architecture.png)

The project consists of the following steps:
1. Use the python script `interact_s3.py` to upload the data to S3.
2. Trigger a Glue job with the script `job_spark_treat_rais.py` to transoform the data and upload it to the staging_zone in the bucket.
3. Trugger a Glue crawler to make the data visible and querible in Athena.
