from pydantic import BaseSettings, Field


class Settings(BaseSettings):
    PROFILE_NAME:str = Field('aws_profile', env='PROFILE_NAME')
    LOCAL_DATA_PATH:str = Field('tests/data', env='LOCAL_DATA_PATH')
    S3_BUCKET_NAME: str = Field('s3_bucket_name', env='S3_BUCKET_NAME')
