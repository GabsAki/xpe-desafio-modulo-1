import os
from scripts.interact_s3 import upload_to_s3
from moto import mock_s3
import boto3
from scripts.config import Settings

settings = Settings()
settings.LOCAL_DATA_PATH = "tests/data"


@mock_s3
def test_upload_to_s3():
    session = boto3.Session()
    s3_client = session.client("s3")
    test_bucket_name = "test_bucket"

    s3_client.create_bucket(Bucket=test_bucket_name)

    data_path = os.path.join(os.getcwd(), settings.LOCAL_DATA_PATH)

    upload_to_s3(data_path, s3_client, test_bucket_name)

    s3_objects = s3_client.list_objects_v2(Bucket=test_bucket_name)

    assert s3_objects["Contents"][0]["Key"] == "zona_raw/rais/test.txt"
