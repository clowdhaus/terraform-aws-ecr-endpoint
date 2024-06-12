import json
import os

ENABLE_DEBUG = os.environ.get('DEBUG', 'false').lower() == 'true'


def handler(event, context):
    if ENABLE_DEBUG:
        print(json.dumps({'Event': event}))

    ecr_url = os.environ["AWS_ECR_DEFAULT_REGISTRY_URL"]
    raw_path = event.get('rawPath')
    location = f'https://{ecr_url}{raw_path}'

    response = {
        'statusCode': 307,
        'headers': {
            'location': location
        }
    }

    if ENABLE_DEBUG:
        print(json.dumps({'Response': response}))

    return response
