import boto3

def upload_to_s3(buffer, bucket, object_name):
    """
    Uploads an in-memory file (like a BytesIO buffer) to Amazon S3.
    :param buffer: An in-memory file, like a BytesIO buffer.
    :param bucket: The S3 bucket to upload to.
    :param object_name: The S3 key name for the uploaded object.
    """
    session = boto3.Session()
    s3_client = session.client('s3')

    try:
        s3_client.put_object(Body=buffer, Bucket=bucket, Key=object_name)
    except Exception as e:
        raise e
