import boto3
import os

session = boto3.Session(profile_name='gabs_limited')
s3_client = session.client("s3")
data_path = os.path.join(os.getcwd(), 'data/rais')

if __name__ == "__main__":

    for path in os.scandir(data_path):

        s3_client.upload_file(
            "data/rais/" + path.name, "desafio-modulo-1-850900288339", "zona_raw/rais/" + path.name
        )
