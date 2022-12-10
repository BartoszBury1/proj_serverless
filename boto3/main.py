
import  boto3


DEFAULT_REGION = "us-east-1"

s3 = boto3.resource('s3', aws_access_key_id="777", aws_secret_access_key="778")
endpoint_url = "http://s3.localhost.localstack.cloud:4566"
client = boto3.client('s3', endpoint_url=endpoint_url)





bucket_name = "my-bucket"


client.create_bucket(Bucket=bucket_name)


response = client.put_bucket_policy(
    Bucket='my-bucket',
    Policy='{"Version": "2012-10-17", "Statement": [{ "Sid": "PublicReadGetObject": "Allow","Principal": {"AWS": "arn:aws:iam::123456789012:root"}, "Action": [ "Action": "s3:GetObject"], "Resource": ["arn:aws:s3:::my-bucket/*"] } ]}',
)


website_payload = {
    'ErrorDocument': {
        'Key': 'www/error.html'
    },
    'IndexDocument': {
        'Suffix': 'www/index.html'
    }
}

response = client.put_object(
    Body='www/index.html',
    Bucket=bucket_name,
    Key='IndexDocument',
)

response = client.put_object(
    Body='www/error.html',
    Bucket=bucket_name,
    Key='ErrorDocument',
)




client.put_bucket_website(Bucket=bucket_name,WebsiteConfiguration=website_payload)









