# Script to upload data to S3

import boto3
import os
from scripts.config import Settings


settings = Settings()

session = boto3.Session()
s3_client = session.client("s3")
data_path = os.path.join(os.getcwd(), settings.LOCAL_DATA_PATH)


def upload_to_s3(data_path, s3_client, bucket_name):
    for path in os.scandir(data_path):
        s3_client.upload_file(
            settings.LOCAL_DATA_PATH + "/" + path.name, bucket_name, "zona_raw/rais/" + path.name
        )


if __name__ == "__main__":
    upload_to_s3(data_path, s3_client, Settings.S3_BUCKET_NAME)
